Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9629CB31B8B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Aug 2025 16:30:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8420310EB27;
	Fri, 22 Aug 2025 14:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gfxstrand-net.20230601.gappssmtp.com header.i=@gfxstrand-net.20230601.gappssmtp.com header.b="YFrX8L63";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com
 [209.85.222.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89A1210EB1F
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 14:30:18 +0000 (UTC)
Received: by mail-qk1-f169.google.com with SMTP id
 af79cd13be357-7e87031323aso252205785a.0
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Aug 2025 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gfxstrand-net.20230601.gappssmtp.com; s=20230601; t=1755873017; x=1756477817;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rTghSicuxlqckIH3SZuWmvfmkyjQRZ/7lHbizLGotXc=;
 b=YFrX8L63hkUfBnScLK5mm8meCjcrbO2+6Q2oM9ZSw5QwfgsresMOpz3AFoR2FA5ECq
 Bj+hxMG/PDTAs07BD2E9HEw1u5HSps0ILt5SLj7VWLZyhFq88j0fwmsZsr73GxDwz0fm
 K73jRtXafCv/mMNPR1L/yH34t/RRt+rB4Hcmb+yuAVYi/hKZw/MEhMlaoQShUXM99DG+
 Kv+cw4dD7F0FLiBQmbdpYpel/alZn3JWjx9qoTfqpqzlLqKLlgAM48S6977S62urhKL4
 AodJFoopSV+LyAB2hpwra/2GPMFjMow3Cid2qTll5p6n9zskE/yidc/BvfOY2alkek21
 9vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755873017; x=1756477817;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rTghSicuxlqckIH3SZuWmvfmkyjQRZ/7lHbizLGotXc=;
 b=Pg45mOlyBUg79u2BLE7OeoGtyrvQ6gKvMVzblTf6AbjIJpq49WF7s4SfmoXUqY4xAb
 R3g3deLuIg9/wY5aw7iddyuwoPMwzWELEuHlEmZvgvlsAYIuYclXr+TTgq9U4JnS/znf
 pOwaxKZfuu9oy1EDXMJLEFb3xMG1HUiTfOUBJiEbD2hUpzQcVh8KbzFzr2jcKloVbOle
 c3x8Y2bIhz5s3c+V9t2MpO2nTGvSPePjz5QQOYv3tC132hswPLXDU/nQh4TZ3pydAkKf
 0KG2gC+H128DiFkR6UdsOnLd56eKorPk4iNrLavS44UtXVO4MjLf0UCJ6Oslcc6Vy3MK
 9T7A==
X-Gm-Message-State: AOJu0YyZ2HVUjHwiYa0IwEPLhLGsaq+HcNs0G0N5DW5M1yjreLOZoqJt
 MGn6oI3KAM4nswOWHEhFumkfy3u0H+XFtj5kyHtLAhtTg3pCWr+OetKPTWnJEfyMWQzvtLHWCeA
 hPJlgwdc=
X-Gm-Gg: ASbGncuhQauwp9C0oyQ1gx6mhnSBNMvPE/tBJu6UTbVxcUy+6CkRF8FdATycBiPuxyE
 ZPXgNA9nRdkb2oj3tuuMZq1TdnAPRre59G89BFXtufLIUex6638vFwVKhXVnRTjElIGc7I4hJAJ
 9Y8b9AMzurHqE/bWs1xUlhtyYbC6PEB+yoskqtDSjruDBen2pZh46XtyPpnxQjvRkZoJbQY9t5s
 +irJRbTDGZ3eLdAd1gpOWprqcBxnoe4XUmHwm+hQDLSELFBsJjWJ7vqMJvCInWbZLeOQa+uBeft
 zQ+Xs19FyqRTdndMfY75d/1eMA/fqDd1m5baUWz0GT2vX6+I5L78iB6vm+Fnhde6FuVl8EbzV/P
 n+CgqxwUjzvjCVBF/ApqaUmY4BYSOWbY=
X-Google-Smtp-Source: AGHT+IEKVSeFi04rQKxLovnwbjKL92At7x5pDW++vXCZmAIKA3ZPUc3lb/wlaAir0rZmYrldGOQ0JA==
X-Received: by 2002:a05:620a:a211:b0:7e8:8eca:7718 with SMTP id
 af79cd13be357-7ea10fd21e2mr359215685a.32.1755873015182; 
 Fri, 22 Aug 2025 07:30:15 -0700 (PDT)
Received: from kermit.lan ([65.93.159.244]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4b2b8e6023asm420131cf.53.2025.08.22.07.30.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Aug 2025 07:30:14 -0700 (PDT)
From: Faith Ekstrand <faith@gfxstrand.net>
X-Google-Original-From: Faith Ekstrand <faith.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Cc: Faith Ekstrand <faith.ekstrand@collabora.com>
Subject: [PATCH 6/7] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Date: Fri, 22 Aug 2025 10:29:15 -0400
Message-ID: <20250822142954.902402-7-faith.ekstrand@collabora.com>
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
 drivers/gpu/drm/panfrost/panfrost_drv.c | 57 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c | 20 +++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 +
 include/uapi/drm/panfrost_drm.h         | 45 +++++++++++++++++++
 4 files changed, 124 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index ac2a3939f0c1..7d6e2b803a2b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -539,6 +539,62 @@ static int panfrost_ioctl_set_label_bo(struct drm_device *ddev, void *data,
 	return ret;
 }
 
+#define PANFROST_BO_SYNC_OP_FLAGS \
+	(PANFROST_BO_SYNC_TO_DEVICE | \
+	 PANFROST_BO_SYNC_FROM_DEVICE)
+
+static int panfrost_ioctl_sync_bo(struct drm_device *ddev, void *data,
+				  struct drm_file *file)
+{
+	struct drm_panfrost_sync_bo *args = data;
+	struct drm_panfrost_bo_sync_op *ops;
+	struct drm_gem_object *obj;
+	int ret;
+	u32 i;
+
+	if (args->pad)
+		return -EINVAL;
+
+	ops = kvmalloc_array(args->op_count, sizeof(*ops), GFP_KERNEL);
+	if (!ops) {
+		DRM_DEBUG("Failed to allocate incoming BO sync ops array\n");
+		return -ENOMEM;
+	}
+
+	if (copy_from_user(ops, (void __user *)(uintptr_t)args->ops,
+			   args->op_count * sizeof(*ops))) {
+		DRM_DEBUG("Failed to copy in BO sync ops\n");
+		ret = -EFAULT;
+		goto err_ops;
+	}
+
+	for (i = 0; i < args->op_count; i++) {
+		if (ops[i].flags & ~PANFROST_BO_SYNC_OP_FLAGS) {
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
+		ret = panfrost_gem_sync(obj, ops[i].flags,
+					ops[i].offset, ops[i].size);
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
 int panfrost_unstable_ioctl_check(void)
 {
 	if (!unstable_ioctls)
@@ -606,6 +662,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(PERFCNT_DUMP,	perfcnt_dump,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(MADVISE,		madvise,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 9a707055d946..805a14145206 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -368,6 +368,26 @@ panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
 	kfree_const(old_label);
 }
 
+int
+panfrost_gem_sync(struct drm_gem_object *obj, u32 flags,
+		  u32 offset, u32 size)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	enum dma_data_direction dir = DMA_NONE;
+
+	if ((flags & PANFROST_BO_SYNC_TO_DEVICE) &&
+	    (flags & PANFROST_BO_SYNC_FROM_DEVICE))
+		return -EINVAL;
+	else if (flags & PANFROST_BO_SYNC_TO_DEVICE)
+		dir = DMA_TO_DEVICE;
+	else if (flags & PANFROST_BO_SYNC_FROM_DEVICE)
+		dir = DMA_FROM_DEVICE;
+	else
+		return 0;
+
+	return drm_gem_shmem_sync_mmap(&bo->base, offset, size, dir);
+}
+
 void
 panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label)
 {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index 8de3e76f2717..6a0e090aa59b 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -148,6 +148,8 @@ int panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
 void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
+int panfrost_gem_sync(struct drm_gem_object *obj, u32 flags,
+		      u32 offset, u32 size);
 void panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index e09b6f25acb2..166535132455 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -22,6 +22,7 @@ extern "C" {
 #define DRM_PANFROST_PERFCNT_DUMP		0x07
 #define DRM_PANFROST_MADVISE			0x08
 #define DRM_PANFROST_SET_LABEL_BO		0x09
+#define DRM_PANFROST_SYNC_BO			0x0a
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -31,6 +32,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_GET_BO_OFFSET	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_GET_BO_OFFSET, struct drm_panfrost_get_bo_offset)
 #define DRM_IOCTL_PANFROST_MADVISE		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_MADVISE, struct drm_panfrost_madvise)
 #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
+#define DRM_IOCTL_PANFROST_SYNC_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_sync_bo)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -249,6 +251,49 @@ struct drm_panfrost_set_label_bo {
 	__u64 label;
 };
 
+/* Valid flags to pass to drm_panfrost_bo_sync_op */
+#define PANFROST_BO_SYNC_TO_DEVICE	1
+#define PANFROST_BO_SYNC_FROM_DEVICE	2
+
+/**
+ * struct drm_panthor_bo_flush_map_op - BO map sync op
+ */
+struct drm_panfrost_bo_sync_op {
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
+	__u32 offset;
+
+	/**
+	 * @size: Size of the range to sync
+	 *
+	 * @size + @offset will be rounded up to the nearest cache line as
+	 * needed.
+	 */
+	__u32 size;
+};
+
+/**
+ * struct drm_panfrost_sync_bo - ioctl argument for syncing BO maps
+ */
+struct drm_panfrost_sync_bo {
+	/** Array of struct drm_panfrost_bo_sync_op */
+	__u64 ops;
+
+	/** Number of BO sync ops */
+	__u32 op_count;
+
+	__u32 pad;
+};
+
 /* Definitions for coredump decoding in user space */
 #define PANFROSTDUMP_MAJOR 1
 #define PANFROSTDUMP_MINOR 0
-- 
2.50.1

