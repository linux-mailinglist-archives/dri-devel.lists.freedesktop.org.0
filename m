Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F3CA99EC2
	for <lists+dri-devel@lfdr.de>; Thu, 24 Apr 2025 04:22:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B975110E70A;
	Thu, 24 Apr 2025 02:22:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="Np44YfqV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E191510E70A
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Apr 2025 02:22:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1745461317; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=D9YKukOO06LFocYHXR+XuoED+pM5nxjnde5dAW1x+W/2EGGWxuFU96cED6QSZHhLQyQ0ALpZNb2bhgmRtGJUgf2hiP4wmTN8+AQNjDjB9nVsWg43+/Duzsk3wxTx0CHuJC1KRxuf3Dw/NkRs6uXrx4uPwFvmx5csYUnhIyC0OMA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1745461317;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=oPo5HC4f0VmWgzIL2d3M39qcNqxCcrq8Pb1HyzIZFG0=; 
 b=bHFxYVdikCNdW8RJ7ViCasb4Y1xxAJ56PU09b3aZEcRJLFy6pc2ZuPMHcirh8pFumJYPOO1X8HLxw/hshVb0vabWsHRd5GZjEgq+jj5BqObI01W+/4jX3AL2kDOSS6iVeCh3AMHLYHdOunK/zceYyKeLk0s/5RqhHvsf7KT7alA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745461317; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=oPo5HC4f0VmWgzIL2d3M39qcNqxCcrq8Pb1HyzIZFG0=;
 b=Np44YfqVU0o6SJ5VDdd2tNIMSq4H63jqYQWMfdxAzbW78AR2X74+3/WWjImSodmw
 7cWL3QiV2QsPkDDVL5pQwXp22ah4eMSgzLKrmALWz05gtb0/rBxTseidJVvIA3L1ds8
 KI/bt9dmgszeaUEOXXgo8Bf0ZjWvt/KPzpo0MZ9k=
Received: by mx.zohomail.com with SMTPS id 1745461316314157.08780131295953;
 Wed, 23 Apr 2025 19:21:56 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org,
 Boris Brezillon <boris.brezillon@collabora.com>, kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 Rob Herring <robh@kernel.org>, Steven Price <steven.price@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 2/3] drm/panfrost: Add driver IOCTL for setting BO labels
Date: Thu, 24 Apr 2025 03:21:31 +0100
Message-ID: <20250424022138.709303-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250424022138.709303-1-adrian.larumbe@collabora.com>
References: <20250424022138.709303-1-adrian.larumbe@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Allow UM to label a BO for which it possesses a DRM handle.

Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 44 ++++++++++++++++++++++++-
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
 include/uapi/drm/panfrost_drm.h         | 20 +++++++++++
 3 files changed, 65 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index b87f83e94eda..b0ab76d67e96 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -495,6 +495,46 @@ static int panfrost_ioctl_madvise(struct drm_device *dev, void *data,
 	return ret;
 }
 
+static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
+				       struct drm_file *file)
+{
+	struct drm_panfrost_set_label_bo *args = data;
+	struct drm_gem_object *obj;
+	const char *label = NULL;
+	int ret = 0;
+
+	if (args->pad)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->label) {
+		label = strndup_user((const char __user *)(uintptr_t)args->label,
+				     PANFROST_BO_LABEL_MAXLEN);
+		if (IS_ERR(label)) {
+			ret = PTR_ERR(label);
+			if (ret == -EINVAL)
+				ret = -E2BIG;
+			goto err_put_obj;
+		}
+	}
+
+	/*
+	 * We treat passing a label of length 0 and passing a NULL label
+	 * differently, because even though they might seem conceptually
+	 * similar, future uses of the BO label might expect a different
+	 * behaviour in each case.
+	 */
+	panfrost_gem_set_label(obj, label);
+
+err_put_obj:
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -561,6 +601,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(PERFCNT_ENABLE,	perfcnt_enable,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
@@ -625,6 +666,7 @@ static const struct file_operations panfrost_drm_driver_fops = {
  * - 1.2 - adds AFBC_FEATURES query
  * - 1.3 - adds JD_REQ_CYCLE_COUNT job requirement for SUBMIT
  *       - adds SYSTEM_TIMESTAMP and SYSTEM_TIMESTAMP_FREQUENCY queries
+ * - 1.4 - adds SET_LABEL_BO
  */
 static const struct drm_driver panfrost_drm_driver = {
 	.driver_features	= DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ,
@@ -637,7 +679,7 @@ static const struct drm_driver panfrost_drm_driver = {
 	.name			= "panfrost",
 	.desc			= "panfrost DRM",
 	.major			= 1,
-	.minor			= 3,
+	.minor			= 4,
 
 	.gem_create_object	= panfrost_gem_create_object,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index c0be2934f229..842e025b9bdc 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -9,6 +9,8 @@
 
 struct panfrost_mmu;
 
+#define PANFROST_BO_LABEL_MAXLEN	4096
+
 struct panfrost_gem_object {
 	struct drm_gem_shmem_object base;
 	struct sg_table *sgts;
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 568724be6628..b0445c5e514d 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -21,6 +21,7 @@ extern "C" {
 #define DRM_PANFROST_PERFCNT_ENABLE		0x06
 #define DRM_PANFROST_PERFCNT_DUMP		0x07
 #define DRM_PANFROST_MADVISE			0x08
+#define DRM_PANFROST_SET_LABEL_BO		0x09
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -29,6 +30,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_GET_PARAM		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_PARAM, struct drm_panfrost_get_param)
 #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
 #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
+#define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -227,6 +229,24 @@ struct drm_panfrost_madvise {
 	__u32 retained;       /* out, whether backing store still exists */
 };
 
+/**
+ * struct drm_panfrost_set_label_bo - ioctl argument for labelling Panfrost BOs.
+ */
+struct drm_panfrost_set_label_bo {
+	/** @handle: Handle of the buffer object to label. */
+	__u32 handle;
+
+	/**  @pad: MBZ. */
+	__u32 pad;
+
+	/**
+	 * @label: User pointer to a NUL-terminated string
+	 *
+	 * Length cannot be greater than 4096
+	 */
+	__u64 label;
+};
+
 /* Definitions for coredump decoding in user space */
 #define PANFROSTDUMP_MAJOR 1
 #define PANFROSTDUMP_MINOR 0
-- 
2.48.1

