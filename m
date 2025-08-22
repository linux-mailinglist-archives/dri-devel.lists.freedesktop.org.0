Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C120DB31B88
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F302A10EB22;
	Fri, 22 Aug 2025 14:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="tzKWwK9c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com
 [209.85.160.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F215E10EB1C
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:12 +0000 (UTC)
Received: by mail-qt1-f170.google.com with SMTP id
 d75a77b69052e-4b0fa7ed37dso32583801cf.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873012; x=1756477812;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7ZFJ18Ge1FGX/ewMfzhgNh+95auzeb3p3zE9HJq9lBw=;
 b=tzKWwK9cydUVGqAU/9U2x1HLiy00teURFKdfkjRPEQbhR7z4QmXr4wX6HvOsaWNeMQ
 GSjieZaYTdroC56bWrF9TTh5FISSseXHedQMGoaN5lcQZpuaAD8YU1ZAvP0gPboB4f5Y
 9bYJH1wK2Z9jla+/h+0IiFQmAAhccTIIAd3ZM+7q/sObwjKvLKbC9qfzLak4s+uyeahZ
 hdELAvgQhaHSP9P8+0G+0YCtV21GtkzOgnILJGLzddv/RFEu+AICt42iyItE9/Iu3Rt7
 mDYuz2jpfZedeC+iDpSSqX1CsFQnV3FjFzNLwfb4G4ncw3dfnqwZup3WHhGTafYEV2m3
 l+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873012; x=1756477812;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7ZFJ18Ge1FGX/ewMfzhgNh+95auzeb3p3zE9HJq9lBw=;
 b=GHdboO3ezAntV7aMcqlsm/GOjv3fR9etREafEwX55eWZPTUFELK2NQP77dqCwYFVx3
 sfW6jep80vmEIi7xh6nqS4CqP1gf5B81mCKrm6ph/Ut9dTH0TwSN0RWx1m5kjWP74tfR
 oUZf/6J/il9YvFoBwk07iO6Cdskt0ZQdtbKOX6F+3iGi+ZfCIx1wmXyC+Rtf0Z4tE6bs
 toopPWU9OeGSgg+SmlxroP2s/PwwoR6rVBD6hxYu2aHpP58jUkwIsxb4lE5l1DzTr2JL
 C6Gh9daRuiNidCTOHE8b8Ja8JwjB/4kSAZ6nXgSChuEAewZzo7HuTupSrPxXsDoNxVOW
 kYaQ==
X-Gm-Message-State: AOJu0YxmTwRorSdf5AuFPjBw5AdbRU5k3bHhX64xOvGKqin9XXXlkZEq
 W7mEkJBDEf4/qN7qqphcWPYD7ROuM5yHJusQRAI28wa3etGMRn+4A1osdRocFcOWVvRNOmdwXBI
 DubEW2Ac=
X-Gm-Gg: ASbGncs9urQ5VUiXVp4O5im4vRh8rThckP5VrURl4D0yQV5RgGmGaNq0rVgDo/3SEd+
 7pDer80ZQvWE8EuUaGsTiAt2iLnqscWXJl1WaHBhsS27oggOjsAgfghvDzpT0pplJx1diDLqFPm
 qfDRZUscOn9eCY5lcdRF86H6CXhccERZPjrQ7j1hMTsKgBh2GyrHne8kzoX+NLi3My9CXKQwE1z
 mdO2fjfvOJhFYelNjLoxlJU9yQzaDC52larj6U7tI8yhZMdQ1y7/KGO4hqhbQjx0aCUdZjWxLS5
 JyqjK0QvEb5zyYXRWR8wlWYvziZJcH9aceY/vTUzxYE1RUXWKstyAO/LhKh6jUvbjs8lS9mY99V
 jYz/xNQ4uYXWJLKpIvRJYWdNP41tkSA4=
X-Google-Smtp-Source: AGHT+IFzHGTGsQMyKNE4yRbmyiGO7f6L/f4saQAXo1dIrKl+CEFlg3ImbbUWGsbu6mclqynE6jlMQA==
X-Received: by 2002:ac8:7d8f:0:b0:4a7:81f6:331e with SMTP id
 d75a77b69052e-4b2aae2cc46mr42687231cf.6.1755873011385; 
 Fri, 22 Aug 2025 07:30:11 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:10 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 3/7] drm/panthor: Add a PANTHOR_BO_SYNC ioctl
Date: Fri, 22 Aug 2025 10:29:12 -0400
Message-ID: <20250822142954.902402-4-faith.ekstrand@collabora.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250822142954.902402-1-faith.ekstrand@collabora.com>
References: <20250822142954.902402-1-faith.ekstrand@collabora.com>
MIME-Version: 1.0
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

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
---
 drivers/gpu/drm/panthor/panthor_drv.c | 47 ++++++++++++++++++++++-
 drivers/gpu/drm/panthor/panthor_gem.c | 20 ++++++++++
 drivers/gpu/drm/panthor/panthor_gem.h |  3 ++
 include/uapi/drm/panthor_drm.h        | 55 +++++++++++++++++++++++++++
 4 files changed, 124 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06ae6a2aeb16..1527966604e1 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -175,7 +175,8 @@ panthor_get_uobj_array(const struct drm_panthor_obj_array *in, u32 min_stride,
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_sync_op, timeline_value), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_submit, syncs), \
 		 PANTHOR_UOBJ_DECL(struct drm_panthor_queue_create, ringbuf_size), \
-		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs))
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_vm_bind_op, syncs), \
+		 PANTHOR_UOBJ_DECL(struct drm_panthor_bo_sync_op, size))
 
 /**
  * PANTHOR_UOBJ_SET() - Copy a kernel object to a user object.
@@ -1398,6 +1399,49 @@ static int panthor_ioctl_set_user_mmio_offset(struct drm_device *ddev,
 	return 0;
 }
 
+#define PANTHOR_BO_SYNC_OP_FLAGS \
+	(DRM_PANTHOR_BO_SYNC_TO_DEVICE | \
+	 DRM_PANTHOR_BO_SYNC_FROM_DEVICE)
+
+static int panthor_ioctl_bo_sync(struct drm_device *ddev, void *data,
+				 struct drm_file *file)
+{
+	struct drm_panthor_bo_sync *args = data;
+	struct drm_panthor_bo_sync_op *ops;
+	struct drm_gem_object *obj;
+	int ret = 0;
+
+	ret = PANTHOR_UOBJ_GET_ARRAY(ops, &args->ops);
+	if (ret)
+		return ret;
+
+	for (u32 i = 0; i < args->ops.count; i++) {
+		if (ops[i].flags & ~PANTHOR_BO_SYNC_OP_FLAGS) {
+			ret = -EINVAL;
+			goto err_ops;
+		}
+
+		obj = drm_gem_object_lookup(file, ops[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			goto err_ops;
+		}
+
+		ret = panthor_gem_bo_sync(obj, ops[i].flags,
+					  ops[i].offset, ops[i].size);
+
+		drm_gem_object_put(obj);
+
+		if (ret)
+			goto err_ops;
+	}
+
+err_ops:
+	kvfree(ops);
+
+	return ret;
+}
+
 static int
 panthor_open(struct drm_device *ddev, struct drm_file *file)
 {
@@ -1481,6 +1525,7 @@ static const struct drm_ioctl_desc panthor_drm_driver_ioctls[] = {
 	PANTHOR_IOCTL(GROUP_SUBMIT, group_submit, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(BO_SET_LABEL, bo_set_label, DRM_RENDER_ALLOW),
 	PANTHOR_IOCTL(SET_USER_MMIO_OFFSET, set_user_mmio_offset, DRM_RENDER_ALLOW),
+	PANTHOR_IOCTL(BO_SYNC, bo_sync, DRM_RENDER_ALLOW),
 };
 
 static int panthor_mmap(struct file *filp, struct vm_area_struct *vma)
diff --git a/drivers/gpu/drm/panthor/panthor_gem.c b/drivers/gpu/drm/panthor/panthor_gem.c
index 530bad12d545..31f5d76002ec 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.c
+++ b/drivers/gpu/drm/panthor/panthor_gem.c
@@ -344,6 +344,26 @@ panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label)
 	panthor_gem_bo_set_label(bo->obj, str);
 }
 
+int
+panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
+		    u64 offset, u64 size)
+{
+	struct panthor_gem_object *bo = to_panthor_bo(obj);
+	enum dma_data_direction dir = DMA_NONE;
+
+	if ((flags & DRM_PANTHOR_BO_SYNC_TO_DEVICE) &&
+	    (flags & DRM_PANTHOR_BO_SYNC_FROM_DEVICE))
+		return -EINVAL;
+	else if (flags & DRM_PANTHOR_BO_SYNC_TO_DEVICE)
+		dir = DMA_TO_DEVICE;
+	else if (flags & DRM_PANTHOR_BO_SYNC_FROM_DEVICE)
+		dir = DMA_FROM_DEVICE;
+	else
+		return 0;
+
+	return drm_gem_shmem_sync_mmap(&bo->base, offset, size, dir);
+}
+
 #ifdef CONFIG_DEBUG_FS
 struct gem_size_totals {
 	size_t size;
diff --git a/drivers/gpu/drm/panthor/panthor_gem.h b/drivers/gpu/drm/panthor/panthor_gem.h
index 8fc7215e9b90..36fe392ee627 100644
--- a/drivers/gpu/drm/panthor/panthor_gem.h
+++ b/drivers/gpu/drm/panthor/panthor_gem.h
@@ -159,6 +159,9 @@ panthor_gem_create_with_handle(struct drm_file *file,
 void panthor_gem_bo_set_label(struct drm_gem_object *obj, const char *label);
 void panthor_gem_kernel_bo_set_label(struct panthor_kernel_bo *bo, const char *label);
 
+int panthor_gem_bo_sync(struct drm_gem_object *obj, u32 flags,
+			u64 offset, u64 size);
+
 static inline u64
 panthor_kernel_bo_gpuva(struct panthor_kernel_bo *bo)
 {
diff --git a/include/uapi/drm/panthor_drm.h b/include/uapi/drm/panthor_drm.h
index bf47369c0220..77b3ca5f6150 100644
--- a/include/uapi/drm/panthor_drm.h
+++ b/include/uapi/drm/panthor_drm.h
@@ -144,6 +144,9 @@ enum drm_panthor_ioctl_id {
 	 * pgoff_t size.
 	 */
 	DRM_PANTHOR_SET_USER_MMIO_OFFSET,
+
+	/** @DRM_PANTHOR_BO_SYNC: Sync BO data to/from the device */
+	DRM_PANTHOR_BO_SYNC,
 };
 
 /**
@@ -1047,6 +1050,56 @@ struct drm_panthor_set_user_mmio_offset {
 	__u64 offset;
 };
 
+/**
+ * enum drm_panthor_bo_sync_op_flags - BO sync flags
+ */
+enum drm_panthor_bo_sync_op_flags {
+	/**
+	 * @DRM_PANTHOR_BO_SYNC_TO_DEVICE: Sync data from the CPU to the
+	 * device.
+	 */
+	DRM_PANTHOR_BO_SYNC_TO_DEVICE = (1 << 0),
+
+	/**
+	 * @DRM_PANTHOR_BO_SYNC_TO_DEVICE: Sync data from the device to the
+	 * CPU.
+	 */
+	DRM_PANTHOR_BO_SYNC_FROM_DEVICE = (1 << 1),
+};
+
+/**
+ * struct drm_panthor_bo_sync_op - BO map sync op
+ */
+struct drm_panthor_bo_sync_op {
+	/** @handle: Handle of the buffer object to sync. */
+	__u32 handle;
+
+	/** @flags: Flags controlling the sync operation. */
+	__u32 flags;
+
+	/**
+	 * @offset: Offset into the BO at which the sync range starts.
+	 *
+	 * This will be rounded down to the nearest cache line as needed.
+	 */
+	__u64 offset;
+
+	/**
+	 * @size: Size of the range to sync
+	 *
+	 * @size + @offset will be rounded up to the nearest cache line as
+	 * needed.
+	 */
+	__u64 size;
+};
+
+struct drm_panthor_bo_sync {
+	/**
+	 * @ops: Array of struct drm_panthor_bo_sync_op sync operations.
+	 */
+	struct drm_panthor_obj_array ops;
+};
+
 /**
  * DRM_IOCTL_PANTHOR() - Build a Panthor IOCTL number
  * @__access: Access type. Must be R, W or RW.
@@ -1093,6 +1146,8 @@ enum {
 		DRM_IOCTL_PANTHOR(WR, BO_SET_LABEL, bo_set_label),
 	DRM_IOCTL_PANTHOR_SET_USER_MMIO_OFFSET =
 		DRM_IOCTL_PANTHOR(WR, SET_USER_MMIO_OFFSET, set_user_mmio_offset),
+	DRM_IOCTL_PANTHOR_BO_SYNC =
+		DRM_IOCTL_PANTHOR(WR, BO_SYNC, bo_sync),
 };
 
 #if defined(__cplusplus)
-- 
2.50.1

