Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC8415A65D
	for <lists+dri-devel@lfdr.de>; Wed, 12 Feb 2020 11:29:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C6E36F4A7;
	Wed, 12 Feb 2020 10:29:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEC636F4A4;
 Wed, 12 Feb 2020 10:29:29 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 12 Feb 2020 02:29:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,428,1574150400"; d="scan'208";a="434000930"
Received: from ramaling-i9x.iind.intel.com ([10.99.66.154])
 by fmsmga006.fm.intel.com with ESMTP; 12 Feb 2020 02:29:28 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH v2 1/5] drm/hdcp: optimizing the srm handling
Date: Wed, 12 Feb 2020 15:59:38 +0530
Message-Id: <20200212102942.26568-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200212102942.26568-1-ramalingam.c@intel.com>
References: <20200212102942.26568-1-ramalingam.c@intel.com>
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

v2:
  srm_data is dropped and few more comments are addressed.
v3:
  ptr passing around is fixed with functional testing.
v4:
  fix htmldoc [lkp]

Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
Suggested-by: Sean Paul <seanpaul@chromium.org>
---
 drivers/gpu/drm/drm_hdcp.c     | 158 ++++++++++++---------------------
 drivers/gpu/drm/drm_internal.h |   4 -
 drivers/gpu/drm/drm_sysfs.c    |   2 -
 include/drm/drm_hdcp.h         |   4 +-
 4 files changed, 61 insertions(+), 107 deletions(-)

diff --git a/drivers/gpu/drm/drm_hdcp.c b/drivers/gpu/drm/drm_hdcp.c
index 9191633a3c43..7f386adcf872 100644
--- a/drivers/gpu/drm/drm_hdcp.c
+++ b/drivers/gpu/drm/drm_hdcp.c
@@ -23,14 +23,6 @@
 
 #include "drm_internal.h"
 
-static struct hdcp_srm {
-	u32 revoked_ksv_cnt;
-	u8 *revoked_ksv_list;
-
-	/* Mutex to protect above struct member */
-	struct mutex mutex;
-} *srm_data;
-
 static inline void drm_hdcp_print_ksv(const u8 *ksv)
 {
 	DRM_DEBUG("\t%#02x, %#02x, %#02x, %#02x, %#02x\n",
@@ -60,11 +52,11 @@ static u32 drm_hdcp_get_revoked_ksv_count(const u8 *buf, u32 vrls_length)
 	return ksv_count;
 }
 
-static u32 drm_hdcp_get_revoked_ksvs(const u8 *buf, u8 *revoked_ksv_list,
+static u32 drm_hdcp_get_revoked_ksvs(const u8 *buf, u8 **revoked_ksv_list,
 				     u32 vrls_length)
 {
-	u32 parsed_bytes = 0, ksv_count = 0;
 	u32 vrl_ksv_cnt, vrl_ksv_sz, vrl_idx = 0;
+	u32 parsed_bytes = 0, ksv_count = 0;
 
 	do {
 		vrl_ksv_cnt = *buf;
@@ -74,10 +66,10 @@ static u32 drm_hdcp_get_revoked_ksvs(const u8 *buf, u8 *revoked_ksv_list,
 
 		DRM_DEBUG("vrl: %d, Revoked KSVs: %d\n", vrl_idx++,
 			  vrl_ksv_cnt);
-		memcpy(revoked_ksv_list, buf, vrl_ksv_sz);
+		memcpy((*revoked_ksv_list) + (ksv_count * DRM_HDCP_KSV_LEN),
+		       buf, vrl_ksv_sz);
 
 		ksv_count += vrl_ksv_cnt;
-		revoked_ksv_list += vrl_ksv_sz;
 		buf += vrl_ksv_sz;
 
 		parsed_bytes += (vrl_ksv_sz + 1);
@@ -91,7 +83,8 @@ static inline u32 get_vrl_length(const u8 *buf)
 	return drm_hdcp_be24_to_cpu(buf);
 }
 
-static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
+static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count,
+				    u8 **revoked_ksv_list, u32 *revoked_ksv_cnt)
 {
 	struct hdcp_srm_header *header;
 	u32 vrl_length, ksv_count;
@@ -131,29 +124,28 @@ static int drm_hdcp_parse_hdcp1_srm(const u8 *buf, size_t count)
 	ksv_count = drm_hdcp_get_revoked_ksv_count(buf, vrl_length);
 	if (!ksv_count) {
 		DRM_DEBUG("Revoked KSV count is 0\n");
-		return count;
+		return 0;
 	}
 
-	kfree(srm_data->revoked_ksv_list);
-	srm_data->revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN,
-					     GFP_KERNEL);
-	if (!srm_data->revoked_ksv_list) {
+	*revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN, GFP_KERNEL);
+	if (!*revoked_ksv_list) {
 		DRM_ERROR("Out of Memory\n");
 		return -ENOMEM;
 	}
 
-	if (drm_hdcp_get_revoked_ksvs(buf, srm_data->revoked_ksv_list,
+	if (drm_hdcp_get_revoked_ksvs(buf, revoked_ksv_list,
 				      vrl_length) != ksv_count) {
-		srm_data->revoked_ksv_cnt = 0;
-		kfree(srm_data->revoked_ksv_list);
+		*revoked_ksv_cnt = 0;
+		kfree(*revoked_ksv_list);
 		return -EINVAL;
 	}
 
-	srm_data->revoked_ksv_cnt = ksv_count;
-	return count;
+	*revoked_ksv_cnt = ksv_count;
+	return 0;
 }
 
-static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
+static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count,
+				    u8 **revoked_ksv_list, u32 *revoked_ksv_cnt)
 {
 	struct hdcp_srm_header *header;
 	u32 vrl_length, ksv_count, ksv_sz;
@@ -195,13 +187,11 @@ static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
 	ksv_count = (*buf << 2) | DRM_HDCP_2_KSV_COUNT_2_LSBITS(*(buf + 1));
 	if (!ksv_count) {
 		DRM_DEBUG("Revoked KSV count is 0\n");
-		return count;
+		return 0;
 	}
 
-	kfree(srm_data->revoked_ksv_list);
-	srm_data->revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN,
-					     GFP_KERNEL);
-	if (!srm_data->revoked_ksv_list) {
+	*revoked_ksv_list = kcalloc(ksv_count, DRM_HDCP_KSV_LEN, GFP_KERNEL);
+	if (!*revoked_ksv_list) {
 		DRM_ERROR("Out of Memory\n");
 		return -ENOMEM;
 	}
@@ -210,10 +200,10 @@ static int drm_hdcp_parse_hdcp2_srm(const u8 *buf, size_t count)
 	buf += DRM_HDCP_2_NO_OF_DEV_PLUS_RESERVED_SZ;
 
 	DRM_DEBUG("Revoked KSVs: %d\n", ksv_count);
-	memcpy(srm_data->revoked_ksv_list, buf, ksv_sz);
+	memcpy(*revoked_ksv_list, buf, ksv_sz);
 
-	srm_data->revoked_ksv_cnt = ksv_count;
-	return count;
+	*revoked_ksv_cnt = ksv_count;
+	return 0;
 }
 
 static inline bool is_srm_version_hdcp1(const u8 *buf)
@@ -226,22 +216,27 @@ static inline bool is_srm_version_hdcp2(const u8 *buf)
 	return *buf == (u8)(DRM_HDCP_2_SRM_ID << 4 | DRM_HDCP_2_INDICATOR);
 }
 
-static void drm_hdcp_srm_update(const u8 *buf, size_t count)
+static int drm_hdcp_srm_update(const u8 *buf, size_t count,
+			       u8 **revoked_ksv_list, u32 *revoked_ksv_cnt)
 {
 	if (count < sizeof(struct hdcp_srm_header))
-		return;
+		return -EINVAL;
 
 	if (is_srm_version_hdcp1(buf))
-		drm_hdcp_parse_hdcp1_srm(buf, count);
+		return drm_hdcp_parse_hdcp1_srm(buf, count, revoked_ksv_list,
+						revoked_ksv_cnt);
 	else if (is_srm_version_hdcp2(buf))
-		drm_hdcp_parse_hdcp2_srm(buf, count);
+		return drm_hdcp_parse_hdcp2_srm(buf, count, revoked_ksv_list,
+						revoked_ksv_cnt);
+	else
+		return -EINVAL;
 }
 
-static void drm_hdcp_request_srm(struct drm_device *drm_dev)
+static int drm_hdcp_request_srm(struct drm_device *drm_dev,
+				u8 **revoked_ksv_list, u32 *revoked_ksv_cnt)
 {
 	char fw_name[36] = "display_hdcp_srm.bin";
 	const struct firmware *fw;
-
 	int ret;
 
 	ret = request_firmware_direct(&fw, (const char *)fw_name,
@@ -250,10 +245,12 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
 		goto exit;
 
 	if (fw->size && fw->data)
-		drm_hdcp_srm_update(fw->data, fw->size);
+		ret = drm_hdcp_srm_update(fw->data, fw->size, revoked_ksv_list,
+					  revoked_ksv_cnt);
 
 exit:
 	release_firmware(fw);
+	return ret;
 }
 
 /**
@@ -279,71 +276,34 @@ static void drm_hdcp_request_srm(struct drm_device *drm_dev)
  * https://www.digital-cp.com/sites/default/files/specifications/HDCP%20on%20HDMI%20Specification%20Rev2_2_Final1.pdf
  *
  * Returns:
- * TRUE on any of the KSV is revoked, else FALSE.
+ * Count of the revoked KSVs or -ve error number incase of the failure.
  */
-bool drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
-				 u32 ksv_count)
+int drm_hdcp_check_ksvs_revoked(struct drm_device *drm_dev, u8 *ksvs,
+				u32 ksv_count)
 {
-	u32 rev_ksv_cnt, cnt, i, j;
-	u8 *rev_ksv_list;
-
-	if (!srm_data)
-		return false;
-
-	mutex_lock(&srm_data->mutex);
-	drm_hdcp_request_srm(drm_dev);
-
-	rev_ksv_cnt = srm_data->revoked_ksv_cnt;
-	rev_ksv_list = srm_data->revoked_ksv_list;
-
-	/* If the Revoked ksv list is empty */
-	if (!rev_ksv_cnt || !rev_ksv_list) {
-		mutex_unlock(&srm_data->mutex);
-		return false;
-	}
-
-	for  (cnt = 0; cnt < ksv_count; cnt++) {
-		rev_ksv_list = srm_data->revoked_ksv_list;
-		for (i = 0; i < rev_ksv_cnt; i++) {
-			for (j = 0; j < DRM_HDCP_KSV_LEN; j++)
-				if (ksvs[j] != rev_ksv_list[j]) {
-					break;
-				} else if (j == (DRM_HDCP_KSV_LEN - 1)) {
-					DRM_DEBUG("Revoked KSV is ");
-					drm_hdcp_print_ksv(ksvs);
-					mutex_unlock(&srm_data->mutex);
-					return true;
-				}
-			/* Move the offset to next KSV in the revoked list */
-			rev_ksv_list += DRM_HDCP_KSV_LEN;
-		}
-
-		/* Iterate to next ksv_offset */
-		ksvs += DRM_HDCP_KSV_LEN;
-	}
-	mutex_unlock(&srm_data->mutex);
-	return false;
+	u32 revoked_ksv_cnt = 0, i, j;
+	u8 *revoked_ksv_list = NULL;
+	int ret = 0;
+
+	ret = drm_hdcp_request_srm(drm_dev, &revoked_ksv_list,
+				   &revoked_ksv_cnt);
+
+	/* revoked_ksv_cnt will be zero when above function failed */
+	for (i = 0; i < revoked_ksv_cnt; i++)
+		for  (j = 0; j < ksv_count; j++)
+			if (!memcmp(&ksvs[j * DRM_HDCP_KSV_LEN],
+				    &revoked_ksv_list[i * DRM_HDCP_KSV_LEN],
+				    DRM_HDCP_KSV_LEN)) {
+				DRM_DEBUG("Revoked KSV is ");
+				drm_hdcp_print_ksv(&ksvs[j * DRM_HDCP_KSV_LEN]);
+				ret++;
+			}
+
+	kfree(revoked_ksv_list);
+	return ret;
 }
 EXPORT_SYMBOL_GPL(drm_hdcp_check_ksvs_revoked);
 
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
-	if (srm_data) {
-		kfree(srm_data->revoked_ksv_list);
-		kfree(srm_data);
-	}
-}
-
 static struct drm_prop_enum_list drm_cp_enum_list[] = {
 	{ DRM_MODE_CONTENT_PROTECTION_UNDESIRED, "Undesired" },
 	{ DRM_MODE_CONTENT_PROTECTION_DESIRED, "Desired" },
diff --git a/drivers/gpu/drm/drm_internal.h b/drivers/gpu/drm/drm_internal.h
index aeec2e68d772..5714a78365ac 100644
--- a/drivers/gpu/drm/drm_internal.h
+++ b/drivers/gpu/drm/drm_internal.h
@@ -236,7 +236,3 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
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
diff --git a/include/drm/drm_hdcp.h b/include/drm/drm_hdcp.h
index 06a11202a097..d512089b873f 100644
--- a/include/drm/drm_hdcp.h
+++ b/include/drm/drm_hdcp.h
@@ -288,8 +288,8 @@ struct hdcp_srm_header {
 struct drm_device;
 struct drm_connector;
 
-bool drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
-				 u8 *ksvs, u32 ksv_count);
+int drm_hdcp_check_ksvs_revoked(struct drm_device *dev,
+				u8 *ksvs, u32 ksv_count);
 int drm_connector_attach_content_protection_property(
 		struct drm_connector *connector, bool hdcp_content_type);
 void drm_hdcp_update_content_protection(struct drm_connector *connector,
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
