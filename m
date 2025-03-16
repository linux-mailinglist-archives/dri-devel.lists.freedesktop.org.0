Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBF3A63794
	for <lists+dri-devel@lfdr.de>; Sun, 16 Mar 2025 22:53:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D64689919;
	Sun, 16 Mar 2025 21:52:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=adrian.larumbe@collabora.com header.b="ZHpRVe4M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (unknown [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C366B10E14A
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Mar 2025 21:52:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1742161952; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=mHKAZTWd8u3cotcpn0328vk/MmJzjHsvgG0P42iH4s/Qjq0bvhpNu+9QQI8+i9m30KCLlQxzpUiuk8wFZtQZ0Lc+deIMy+hMMdzYC0EzSqWan7A3+pGpyUmsqJayfCnljBL9rzeYaJWarUGcFQaTBVFZNPjyKoYFY5zIVaFFB3Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1742161952;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=HhL0GLMTz2Ju84VAoiVwHc8lIHzsuy6JBZH84oiDEiA=; 
 b=DZsjZ5H5bFy2W5RiGYoc4UBCGG5y2Z/ha7laT81a/ooTwFPR1F38U+r7ZsUxYcDPxogzh12Olm4t8EHXEbSosIEMwU42kvAT5mmW369Z6Q4tcltNLKUS0lJZPzVbzc8c80+DjFutKr7QtzUYjTfUlczwh2XieKMyi1VvwsmBtBs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=adrian.larumbe@collabora.com;
 dmarc=pass header.from=<adrian.larumbe@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1742161952; 
 s=zohomail; d=collabora.com; i=adrian.larumbe@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=HhL0GLMTz2Ju84VAoiVwHc8lIHzsuy6JBZH84oiDEiA=;
 b=ZHpRVe4M4ssdlXYj6NFI43ewVkNTwBuYFugnRtcdQBUFmnHAVYLS10soUUKkG9Hn
 IehuFGuxKvl1SldX846LVLKe63tNLnI7iA0dmnLN5yX2mm+lvVTkDLP5VJhYo680II7
 R7xudXVajPCE4fOvNqw7sdx1pYNx3wbNjP3inCjA=
Received: by mx.zohomail.com with SMTPS id 1742161951219560.9766150699046;
 Sun, 16 Mar 2025 14:52:31 -0700 (PDT)
From: =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com,
 =?UTF-8?q?Adri=C3=A1n=20Larumbe?= <adrian.larumbe@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] drm/panthor: Add driver IOCTL for setting BO labels
Date: Sun, 16 Mar 2025 21:51:33 +0000
Message-ID: <20250316215139.3940623-3-adrian.larumbe@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
References: <20250316215139.3940623-1-adrian.larumbe@collabora.com>
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
 drivers/gpu/drm/panthor/panthor_drv.c | 31 +++++++++++++++++++++++++++
 include/uapi/drm/panthor_drm.h        | 14 ++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 310bb44abe1a..f41b8946258f 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1330,6 +1330,35 @@ static int panthor_ioctl_vm_get_state(struct drm_device *ddev, void *data,
 	return 0;
 }
 
+static int panthor_ioctl_label_bo(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_panthor_label_bo *args = data;
+	struct drm_gem_object *obj;
+	const char *label;
+	int ret = 0;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	if (args->len && args->label) {
+		label = strndup_user(u64_to_user_ptr(args->label), args->len + 1);
+		if (IS_ERR(label)) {
+			ret = PTR_ERR(label);
+			goto err_label;
+		}
+	} else
+		label = NULL;
+
+	panthor_gem_label_bo(obj, label);
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
@@ -1399,6 +1428,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(TILER_HEAP_CREATE, tiler_heap_create, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(TILER_HEAP_DESTROY, tiler_heap_destroy, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(LABEL_BO, label_bo, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
@@ -1508,6 +1538,7 @@ static void panthor_debugfs_init(struct drm_minor *minor)
  * - 1.2 - adds DEV_QUERY_GROUP_PRIORITIES_INFO query
  *       - adds PANTHOR_GROUP_PRIORITY_REALTIME priority
  * - 1.3 - adds DRM_PANTHOR_GROUP_STATE_INNOCENT flag
+ * - 1.4 - adds DRM_IOCTL_PANTHOR_LABEL_BO ioctl
  */
 static const struct drm_driver panthor_drm_driver = {
 	.driver_features = DRIVER_RENDER | DRIVER_GEM | DRIVER_SYNCOBJ |
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index 97e2c4510e69..1a7ed567d36a 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -127,6 +127,9 @@ enum drm_panthor_ioctl_id {
 
 	/** @DRM_PANTHOR_TILER_HEAP_DESTROY: Destroy a tiler heap. */
 	DRM_PANTHOR_TILER_HEAP_DESTROY,
+
+	/** @DRM_PANTHOR_LABEL_BO: Label a BO. */
+	DRM_PANTHOR_LABEL_BO,
 };
 
 /**
@@ -977,6 +980,15 @@ struct drm_panthor_tiler_heap_destroy {
 	__u32 pad;
 };
 
+/**
+ * struct drm_panthor_label_bo - Arguments passed to DRM_IOCTL_PANTHOR_LABEL_BO
+ */
+struct drm_panthor_label_bo {
+	__u32 handle;
+	__u32 len;
+	__u64 label;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1019,6 +1031,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_CREATE, tiler_heap_create),
 	DRM_IOCTL_PANTHOR_TILER_HEAP_DESTROY =
 		DRM_IOCTL_PANTHOR(WR, TILER_HEAP_DESTROY, tiler_heap_destroy),
+	DRM_IOCTL_PANTHOR_LABEL_BO =
+		DRM_IOCTL_PANTHOR(WR, LABEL_BO, label_bo),
 };
 
 #if defined(__cplusplus)
-- 
2.48.1

