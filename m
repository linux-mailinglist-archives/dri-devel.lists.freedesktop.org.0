Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A01B14376A
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2020 08:10:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F318F6EBAE;
	Tue, 21 Jan 2020 07:10:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFE0B6EBAD;
 Tue, 21 Jan 2020 07:10:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 20 Jan 2020 23:10:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,345,1574150400"; d="scan'208";a="399571722"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by orsmga005.jf.intel.com with ESMTP; 20 Jan 2020 23:09:59 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: dri-devel <dri-devel@lists.freedesktop.org>,
 intel-gfx <intel-gfx@lists.freedesktop.org>
Subject: [RFC] drm/hdcp: optimizing the srm handling
Date: Tue, 21 Jan 2020 12:39:55 +0530
Message-Id: <20200121070955.26426-1-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: Sean Paul <seanpaul@chromium.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As we are not using the sysfs infrastructure anymore, link to it is
removed. And global srm data and mutex to protect it are removed,
with required handling at revocation check function.

Yet to test hence RFC tag is added.

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_hdcp.c     | 68 ++++++++++++++--------------------
 drivers/gpu/drm/drm_internal.h |  4 --
 drivers/gpu/drm/drm_sysfs.c    |  2 -
 3 files changed, 27 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 9191633a3c43..cc08d953eb53 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -23,13 +23,10 @@
 
 #include "drm_internal.h"
 
-static struct hdcp_srm {
+struct hdcp_srm {
 	u32 revoked_ksv_cnt;
 	u8 *revoked_ksv_list;
-
-	/* Mutex to protect above struct member */
-	struct mutex mutex;
-} *srm_data;
+};
 
 static inline void drm_hdcp_print_ksv(const u8 *ksv)
 {
@@ -91,7 +88,8 @@ static inline u32 get_vrl_length(const u8 *buf)
 	return drm_hdcp_be24_to_cpu(buf);
 }
 
-static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
+static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count,
+				    struct hdcp_srm *srm_data)
 {
 	struct hdcp_srm_header *header;
 	u32 vrl_length, ksv_count;
@@ -153,7 +151,8 @@ static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
 	return count;
 }
 
-static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
+static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count,
+				    struct hdcp_srm *srm_data)
 {
 	struct hdcp_srm_header *header;
 	u32 vrl_length, ksv_count, ksv_sz;
@@ -226,18 +225,20 @@ static inline bool is_srm_version_hdcp2(const u8 *buf)
 	return *buf == (u8)(DRM_HDCP_2_SRM_ID << 4 | DRM_HDCP_2_INDICATOR);
 }
 
-static void drm_hdcp_srm_update(const u8 *buf, size_t count)
+static void drm_hdcp_srm_update(const u8 *buf, size_t count,
+				struct hdcp_srm *srm_data)
 {
 	if (count < sizeof(struct hdcp_srm_header))
 		return;
 
 	if (is_srm_version_hdcp1(buf))
-		drm_hdcp_parse_hdcp1_srm(buf, count);
+		drm_hdcp_parse_hdcp1_srm(buf, count, srm_data);
 	else if (is_srm_version_hdcp2(buf))
-		drm_hdcp_parse_hdcp2_srm(buf, count);
+		drm_hdcp_parse_hdcp2_srm(buf, count, srm_data);
 }
 
-static void drm_hdcp_request_srm(struct drm_device *drm_dev)
+static void drm_hdcp_request_srm(struct drm_device *drm_dev,
+				 struct hdcp_srm *srm_data)
 {
 	char fw_name[36] = "display_hdcp_srm.bin";
 	const struct firmware *fw;
@@ -250,7 +251,7 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
 		goto exit;
 
 	if (fw->size && fw->data)
-		drm_hdcp_srm_update(fw->data, fw->size);
+		drm_hdcp_srm_update(fw->data, fw->size, srm_data);
 
 exit:
 	release_firmware(fw);
@@ -284,35 +285,33 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
 bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
 				 u32 ksv_count)
 {
-	u32 rev_ksv_cnt, cnt, i, j;
+	struct hdcp_srm *srm_data;
 	u8 *rev_ksv_list;
+	bool ret = false;
+	u32 cnt, i, j;
 
+	srm_data = kzalloc(sizeof(*srm_data), GFP_KERNEL);
 	if (!srm_data)
-		return false;
+		return ret;
 
-	mutex_lock(&srm_data->mutex);
-	drm_hdcp_request_srm(drm_dev);
-
-	rev_ksv_cnt = srm_data->revoked_ksv_cnt;
+	drm_hdcp_request_srm(drm_dev, srm_data);
 	rev_ksv_list = srm_data->revoked_ksv_list;
 
 	/* If the Revoked ksv list is empty */
-	if (!rev_ksv_cnt || !rev_ksv_list) {
-		mutex_unlock(&srm_data->mutex);
-		return false;
-	}
+	if (!srm_data->revoked_ksv_cnt || !rev_ksv_list)
+		goto out;
 
 	for  (cnt = 0; cnt < ksv_count; cnt++) {
 		rev_ksv_list = srm_data->revoked_ksv_list;
-		for (i = 0; i < rev_ksv_cnt; i++) {
+		for (i = 0; i < srm_data->revoked_ksv_cnt; i++) {
 			for (j = 0; j < DRM_HDCP_KSV_LEN; j++)
 				if (ksvs[j] != rev_ksv_list[j]) {
 					break;
 				} else if (j == (DRM_HDCP_KSV_LEN - 1)) {
 					DRM_DEBUG("Revoked KSV is ");
 					drm_hdcp_print_ksv(ksvs);
-					mutex_unlock(&srm_data->mutex);
-					return true;
+					ret = true;
+					goto out;
 				}
 			/* Move the offset to next KSV in the revoked list */
 			rev_ksv_list += DRM_HDCP_KSV_LEN;
@@ -321,28 +320,15 @@ bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
 		/* Iterate to next ksv_offset */
 		ksvs += DRM_HDCP_KSV_LEN;
 	}
-	mutex_unlock(&srm_data->mutex);
-	return false;
-}
-EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
 
-int drm_setup_hdcp_srm(struct class *drm_class)
-{
-	srm_data = kzalloc(sizeof(*srm_data), GFP_KERNEL);
-	if (!srm_data)
-		return -ENOMEM;
-	mutex_init(&srm_data->mutex);
-
-	return 0;
-}
-
-void drm_teardown_hdcp_srm(struct class *drm_class)
-{
+out:
 	if (srm_data) {
 		kfree(srm_data->revoked_ksv_list);
 		kfree(srm_data);
 	}
+	return ret;
 }
+EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
 
 static struct drm_prop_enum_list drm_cp_enum_list[] = {
 	{ DRM_MODE_CONTENT_PROTECTION_UNDESIRED, "Undesired" },
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index 6937bf923f05..a34c7f8373fa 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -235,7 +235,3 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
 void drm_framebuffer_print_info(struct drm_printer *p, unsigned int indent,
 				const struct drm_framebuffer *fb);
 int drm_framebuffer_debugfs_init(struct drm_minor *minor);
-
-/* drm_hdcp.c */
-int drm_setup_hdcp_srm(struct class *drm_class);
-void drm_teardown_hdcp_srm(struct class *drm_class);
diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index dd2bc85f43cc..2e83c3d72af9 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -85,7 +85,6 @@ int drm_sysfs_init(void)
 	}
 
 	drm_class->devnode = drm_devnode;
-	drm_setup_hdcp_srm(drm_class);
 	return 0;
 }
 
@@ -98,7 +97,6 @@ void drm_sysfs_destroy(void)
 {
 	if (IS_ERR_OR_NULL(drm_class))
 		return;
-	drm_teardown_hdcp_srm(drm_class);
 	class_remove_file(drm_class, &class_attr_version.attr);
 	class_destroy(drm_class);
 	drm_class = NULL;
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
