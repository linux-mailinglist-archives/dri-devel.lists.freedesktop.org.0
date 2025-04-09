Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 645EEA83347
	for <lists+dri-devel@lfdr.de>; Wed,  9 Apr 2025 23:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEA9C10E335;
	Wed,  9 Apr 2025 21:23:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZBq6ZJOU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42D9110E335
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Apr 2025 21:23:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1744233782; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=FJV3pc833bIRbPzVyXzTulmDXoxzq3MrffAKUsmNPkA1UvsqTgzgtgowqrPvf+jhlSnol3lXgs585er6eoJa3RdluIKLwJjDWt7gga7LfNymZD1PRoxm3X6/G2jfTbZIOYj66pvg6Z8TYsxWCUMWINRSayXPsHYoMlEeHlrJwv4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1744233782;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Ir19yE+MXtexO3ipzJRCOl2IVHxCkNiTqTV3u8pxkUk=; 
 b=fHEcVEJ4CVHAXVZALmgSI0u0lRGQ2an5a1Rl9C7858fjHrqAL4z3wz1hdur30oFvGbNxDlvVPa4fVOOnHoYSHwqkxSSuNJn3Qsr046Eb3pKi4GIcNy/PNRAgUdjWtHHPbrrfjNAlKfIB+IHV9K13S93h8SE++t2ut9eqqDK6lic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1744233782; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Ir19yE+MXtexO3ipzJRCOl2IVHxCkNiTqTV3u8pxkUk=;
 b=ZBq6ZJOU1HsFJ+Y16JojgdrM/QuC1cGN0FmJDin2XW4k5Noh8OVo4uHFFGNuKSxG
 3Ssqd+FRxHrr9hFADBsQMgjN0CSkh9s8rl4M34PuGdCws5n2dntIJzOg8yXLBIpCtR1
 LdqCCwSAX8Y0Yi2tBkDF2N+UotMHTLjtkUZ/raHk=
Received: by mx.zohomail.com with SMTPS id 1744233780141531.26184077911;
 Wed, 9 Apr 2025 14:23:00 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH v6 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Date: Wed,  9 Apr 2025 22:22:20 +0100
Message-ID: <20250409212233.2036154-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250409212233.2036154-1-adrian.larumbe@collabora.com>
References: <20250409212233.2036154-1-adrian.larumbe@collabora.com>
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
Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 42 ++++++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.h |  2 ++
 include/uapi/drm/panthor_drm.h        | 23 +++++++++++++++
 3 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e32073..983b24f1236c 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1331,6 +1331,44 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_bo_set_label(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_panthor_bo_set_label *args = data;
+	struct drm_gem_object *obj;
+	const char *label;
+	int ret = 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->size && args->label) {
+		if (args->size > PANTHOR_BO_LABEL_MAXLEN) {
+			ret = -E2BIG;
+			goto err_label;
+		}
+
+		label = strndup_user(u64_to_user_ptr(args->label), args->size);
+		if (IS_ERR(label)) {
+			ret = PTR_ERR(label);
+			goto err_label;
+		}
+	} else if (args->size && !args->label) {
+		ret = -EINVAL;
+		goto err_label;
+	} else {
+		label = NULL;
+	}
+
+	panthor_gem_bo_set_label(obj, label);
+
+err_label:
+	drm_gem_object_put(obj);
+
+	return ret;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1400,6 +1438,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1509,6 +1548,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DRM_IOCTL_PANTHOR_BO_SET_LABEL ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
@@ -1522,7 +1562,7 @@ static const struct drm_driver panthor_drm_driver = {
 	.name = "panthor",
 	.desc = "Panthor DRM driver",
 	.major = 1,
-	.minor = 3,
+	.minor = 4,
 
 	.gem_create_object = panthor_gem_create_object,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index af0d77338860..beba066b4974 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -13,6 +13,8 @@
 
 struct panthor_vm;
 
+#define PANTHOR_BO_LABEL_MAXLEN	PAGE_SIZE
+
 /**
  * struct panthor_gem_object - Driver specific GEM object.
  */
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..12b1994499a9 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_BO_SET_LABEL: Label a BO. */
+	DRM_PANTHOR_BO_SET_LABEL,
 };
 
 /**
@@ -977,6 +980,24 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_bo_set_label - Arguments passed to DRM_IOCTL_PANTHOR_BO_SET_LABEL
+ */
+struct drm_panthor_bo_set_label {
+	/** @handle: Handle of the buffer object to label. */
+	__u32 handle;
+
+	/**
+	 * @size: Length of the label, including the NULL terminator.
+	 *
+	 * Cannot be greater than the OS page size.
+	 */
+	__u32 size;
+
+	/** @label: User pointer to a NULL-terminated string */
+	__u64 label;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1019,6 +1040,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_BO_SET_LABEL =
+		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 };
 
 #if defined(__cplusplus)
-- 
2.48.1

