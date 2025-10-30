Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1118C2077E
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 15:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4024310E9B0;
	Thu, 30 Oct 2025 14:05:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="CiTKCv1b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8DF10E9AB;
 Thu, 30 Oct 2025 14:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1761833150;
 bh=IdZRqwfZs+4orjx0GO4zMdLCPigbWu4eJR2qyPSsNZA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CiTKCv1bvx3rHPwqdt+y9iYDg07wW16SEMQH3/U9jQsgNgNo6rky6VfMOQ8PhVIIb
 P4i7bXAz1Rv5J7sJXulLAgGISzxuSLhyvqNufbeKbgimO+W7XYoii4rpXtnkHWHnG8
 Ya1SA7iHp8DHtbtzBfRRqEAN3kpz0wsSWaMkCuKSFSqNBX0ssx5xcakbqDWcKbrsSr
 v6F8M7cVctqvJTsU396OY5Nqd4yn4Sf7irjGx++EAN6IrMQEVPjJoqlN1hZJ8JkpPu
 +Y3o1xlbCYytM6DvyG/e/jLQPRFBhp8YI6+aqQqgesAURl0fdnW/ShRGyAYoxI1EoU
 3Gy7laX4jF9rw==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:a2a7:f53:ebb0:945e])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: bbrezillon)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 48D1617E35DC;
 Thu, 30 Oct 2025 15:05:49 +0100 (CET)
From: Boris Brezillon <boris.brezillon@collabora.com>
To: Steven Price <steven.price@arm.com>
Cc: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Melissa Wen <mwen@igalia.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>
Subject: [PATCH v5 13/16] drm/panfrost: Add a PANFROST_SYNC_BO ioctl
Date: Thu, 30 Oct 2025 15:05:22 +0100
Message-ID: <20251030140525.366636-14-boris.brezillon@collabora.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251030140525.366636-1-boris.brezillon@collabora.com>
References: <20251030140525.366636-1-boris.brezillon@collabora.com>
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

From: Faith Ekstrand <faith.ekstrand@collabora.com>

This will be used by the UMD to synchronize CPU-cached mappings when
the UMD can't do it directly (no usermode cache maintenance instruction
on Arm32).

v2:
- Add more to the commit message
- Change the flags to better match the drm_gem_shmem_sync semantics

v3:
- Add Steve's R-b

v4:
- No changes

v5:
- Drop Steve's R-b (semantics changes requiring a new review)

Signed-off-by: Faith Ekstrand <faith.ekstrand@collabora.com>
Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_drv.c | 48 +++++++++++++++++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.c | 21 +++++++++++
 drivers/gpu/drm/panfrost/panfrost_gem.h |  2 ++
 include/uapi/drm/panfrost_drm.h         | 45 +++++++++++++++++++++++
 4 files changed, 116 insertions(+)

diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index 6c08a4907eea..f6692bd3fdaf 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -579,6 +579,53 @@ static int panfrost_ioctl_jm_ctx_destroy(struct drm_device *dev, void *data,
 	return panfrost_jm_ctx_destroy(file, args->handle);
 }
 
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
+		obj = drm_gem_object_lookup(file, ops[i].handle);
+		if (!obj) {
+			ret = -ENOENT;
+			goto err_ops;
+		}
+
+		ret = panfrost_gem_sync(obj, ops[i].type,
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
@@ -648,6 +695,7 @@ static const struct drm_ioctl_desc panfrost_drm_driver_ioctls[] = {
 	PANFROST_IOCTL(SET_LABEL_BO,	set_label_bo,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(JM_CTX_CREATE,	jm_ctx_create,	DRM_RENDER_ALLOW),
 	PANFROST_IOCTL(JM_CTX_DESTROY,	jm_ctx_destroy,	DRM_RENDER_ALLOW),
+	PANFROST_IOCTL(SYNC_BO,		sync_bo,	DRM_RENDER_ALLOW),
 };
 
 static void panfrost_gpu_show_fdinfo(struct panfrost_device *pfdev,
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.c b/drivers/gpu/drm/panfrost/panfrost_gem.c
index 070ea7108af6..05d3f8a6fa78 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.c
@@ -384,6 +384,27 @@ panfrost_gem_set_label(struct drm_gem_object *obj, const char *label)
 	kfree_const(old_label);
 }
 
+int
+panfrost_gem_sync(struct drm_gem_object *obj, u32 type,
+		  u32 offset, u32 size)
+{
+	struct panfrost_gem_object *bo = to_panfrost_bo(obj);
+	enum drm_gem_shmem_sync_type shmem_sync_type;
+
+	switch (type) {
+	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH:
+		shmem_sync_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH;
+		break;
+	case PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE:
+		shmem_sync_type = DRM_GEM_SHMEM_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	return drm_gem_shmem_sync(&bo->base, offset, size, shmem_sync_type);
+}
+
 void
 panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label)
 {
diff --git a/drivers/gpu/drm/panfrost/panfrost_gem.h b/drivers/gpu/drm/panfrost/panfrost_gem.h
index c63264464271..87b918f30baa 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gem.h
+++ b/drivers/gpu/drm/panfrost/panfrost_gem.h
@@ -150,6 +150,8 @@ int panfrost_gem_shrinker_init(struct drm_device *dev);
 void panfrost_gem_shrinker_cleanup(struct drm_device *dev);
 
 void panfrost_gem_set_label(struct drm_gem_object *obj, const char *label);
+int panfrost_gem_sync(struct drm_gem_object *obj, u32 type,
+		      u32 offset, u32 size);
 void panfrost_gem_internal_set_label(struct drm_gem_object *obj, const char *label);
 
 #ifdef CONFIG_DEBUG_FS
diff --git a/include/uapi/drm/panfrost_drm.h b/include/uapi/drm/panfrost_drm.h
index 9bd8fa401400..98f93dc87b34 100644
--- a/include/uapi/drm/panfrost_drm.h
+++ b/include/uapi/drm/panfrost_drm.h
@@ -24,6 +24,7 @@ extern "C" {
 #define DRM_PANFROST_SET_LABEL_BO		0x09
 #define DRM_PANFROST_JM_CTX_CREATE		0x0a
 #define DRM_PANFROST_JM_CTX_DESTROY		0x0b
+#define DRM_PANFROST_SYNC_BO			0x0c
 
 #define DRM_IOCTL_PANFROST_SUBMIT		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_SUBMIT, struct drm_panfrost_submit)
 #define DRM_IOCTL_PANFROST_WAIT_BO		DRM_IOW(DRM_COMMAND_BASE + DRM_PANFROST_WAIT_BO, struct drm_panfrost_wait_bo)
@@ -35,6 +36,7 @@ extern "C" {
 #define DRM_IOCTL_PANFROST_SET_LABEL_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SET_LABEL_BO, struct drm_panfrost_set_label_bo)
 #define DRM_IOCTL_PANFROST_JM_CTX_CREATE	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_CREATE, struct drm_panfrost_jm_ctx_create)
 #define DRM_IOCTL_PANFROST_JM_CTX_DESTROY	DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_JM_CTX_DESTROY, struct drm_panfrost_jm_ctx_destroy)
+#define DRM_IOCTL_PANFROST_SYNC_BO		DRM_IOWR(DRM_COMMAND_BASE + DRM_PANFROST_SYNC_BO, struct drm_panfrost_sync_bo)
 
 /*
  * Unstable ioctl(s): only exposed when the unsafe unstable_ioctls module
@@ -266,6 +268,49 @@ struct drm_panfrost_set_label_bo {
 	__u64 label;
 };
 
+/* Valid flags to pass to drm_panfrost_bo_sync_op */
+#define PANFROST_BO_SYNC_CPU_CACHE_FLUSH			0
+#define PANFROST_BO_SYNC_CPU_CACHE_FLUSH_AND_INVALIDATE		1
+
+/**
+ * struct drm_panthor_bo_flush_map_op - BO map sync op
+ */
+struct drm_panfrost_bo_sync_op {
+	/** @handle: Handle of the buffer object to sync. */
+	__u32 handle;
+
+	/** @type: Type of sync operation. */
+	__u32 type;
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
2.51.0

