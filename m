Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48FC473659E
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jun 2023 10:03:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ED7B10E28C;
	Tue, 20 Jun 2023 08:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A2510E286
 for <dri-devel@lists.freedesktop.org>; Tue, 20 Jun 2023 08:03:01 +0000 (UTC)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id A6089218B5;
 Tue, 20 Jun 2023 08:02:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1687248179; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTC678EwWEGjVTONfeUTUI9xAzfafSd+foWxBIuDq1Y=;
 b=qRLU1ZnDVRSSh/NXdzXlbBPh2WHMwgMvmQRrwe4w2qCltGpSjYOFcoYXiwpcsJzjASSlkq
 B7W2EiXiUlRzKbQRv6/yV6NWTOCrzaWdycfYRtxdQlLS7EFIiNWMc50i70MSmh21AyE476
 DzyqZYaYki7oVMoeaM4i88/cqwtyaiE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1687248179;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PTC678EwWEGjVTONfeUTUI9xAzfafSd+foWxBIuDq1Y=;
 b=PuQInNo4CDt7so35InJwgyFOP2Sq7DQ5WzBiSGIi9H+mcSnn4EPT7fHITbwNRjugjWrknG
 WdGeHJZyn4ciTdCQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 63D2D1346D;
 Tue, 20 Jun 2023 08:02:59 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id aPBTFzNdkWRQEAAAMHmgww
 (envelope-from <tzimmermann@suse.de>); Tue, 20 Jun 2023 08:02:59 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@ffwll.ch, airlied@gmail.com, mripard@kernel.org,
 maarten.lankhorst@linux.intel.com, zackr@vmware.com, contact@emersion.fr,
 linux-graphics-maintainer@vmware.com, alexdeucher@gmail.com,
 quic_jhugo@quicinc.com
Subject: [PATCH v2 2/3] drm: Clear fd/handle callbacks in struct drm_driver
Date: Tue, 20 Jun 2023 09:59:58 +0200
Message-ID: <20230620080252.16368-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230620080252.16368-1-tzimmermann@suse.de>
References: <20230620080252.16368-1-tzimmermann@suse.de>
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
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Clear all assignments of struct drm_driver's fd/handle callbacks to
drm_gem_prime_fd_to_handle() and drm_gem_prime_handle_to_fd(). These
functions are called by default. Add a TODO item to convert vmwgfx
to the defaults as well.

v2:
	* remove TODO item (Zack)
	* also update amdgpu's amdgpu_partition_driver

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Simon Ser <contact@emersion.fr>
Acked-by: Alex Deucher <alexander.deucher@amd.com>
Acked-by: Jeffrey Hugo <quic_jhugo@quicinc.com> # qaic
---
 drivers/accel/ivpu/ivpu_drv.c                 |  2 --
 drivers/accel/qaic/qaic_drv.c                 |  1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  4 ----
 drivers/gpu/drm/armada/armada_drv.c           |  2 --
 drivers/gpu/drm/drm_prime.c                   | 13 ++++---------
 drivers/gpu/drm/etnaviv/etnaviv_drv.c         |  2 --
 drivers/gpu/drm/exynos/exynos_drm_drv.c       |  2 --
 drivers/gpu/drm/i915/i915_driver.c            |  2 --
 drivers/gpu/drm/lima/lima_drv.c               |  2 --
 drivers/gpu/drm/mediatek/mtk_drm_drv.c        |  2 --
 drivers/gpu/drm/msm/msm_drv.c                 |  2 --
 drivers/gpu/drm/nouveau/nouveau_drm.c         |  2 --
 drivers/gpu/drm/omapdrm/omap_drv.c            |  2 --
 drivers/gpu/drm/panfrost/panfrost_drv.c       |  2 --
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 --
 drivers/gpu/drm/qxl/qxl_drv.c                 |  2 --
 drivers/gpu/drm/radeon/radeon_drv.c           |  2 --
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c |  2 --
 drivers/gpu/drm/rockchip/rockchip_drm_drv.c   |  2 --
 drivers/gpu/drm/tegra/drm.c                   |  2 --
 drivers/gpu/drm/v3d/v3d_drv.c                 |  2 --
 drivers/gpu/drm/virtio/virtgpu_drv.c          |  2 --
 drivers/gpu/drm/xen/xen_drm_front.c           |  2 --
 include/drm/drm_gem_dma_helper.h              |  8 ++------
 include/drm/drm_gem_shmem_helper.h            |  4 +---
 include/drm/drm_gem_vram_helper.h             |  8 +++-----
 26 files changed, 10 insertions(+), 68 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_drv.c b/drivers/accel/ivpu/ivpu_drv.c
index 9f2b9fdcc5498..5167a65cf7bbc 100644
--- a/drivers/accel/ivpu/ivpu_drv.c
+++ b/drivers/accel/ivpu/ivpu_drv.c
@@ -373,8 +373,6 @@ static const struct drm_driver driver = {
 
 	.open = ivpu_open,
 	.postclose = ivpu_postclose,
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = ivpu_gem_prime_import,
 
 	.ioctls = ivpu_drm_ioctls,
diff --git a/drivers/accel/qaic/qaic_drv.c b/drivers/accel/qaic/qaic_drv.c
index b5ba550a0c040..b5de82e6eb4d5 100644
--- a/drivers/accel/qaic/qaic_drv.c
+++ b/drivers/accel/qaic/qaic_drv.c
@@ -165,7 +165,6 @@ static const struct drm_driver qaic_accel_driver = {
 
 	.ioctls			= qaic_drm_ioctls,
 	.num_ioctls		= ARRAY_SIZE(qaic_drm_ioctls),
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= qaic_gem_prime_import,
 };
 
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
index 07e16ad465d06..56dc69bc8b89a 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
@@ -2850,8 +2850,6 @@ static const struct drm_driver amdgpu_kms_driver = {
 	.show_fdinfo = amdgpu_show_fdinfo,
 #endif
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
 
 	.name = DRIVER_NAME,
@@ -2876,8 +2874,6 @@ const struct drm_driver amdgpu_partition_driver = {
 	.fops = &amdgpu_driver_kms_fops,
 	.release = &amdgpu_driver_release_kms,
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = amdgpu_gem_prime_import,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index e120144d4b470..e8d2fe955909a 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -37,8 +37,6 @@ static const struct drm_ioctl_desc armada_ioctls[] = {
 DEFINE_DRM_GEM_FOPS(armada_drm_fops);
 
 static const struct drm_driver armada_drm_driver = {
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= armada_gem_prime_import,
 	.dumb_create		= armada_gem_dumb_create,
 	.major			= 1,
diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index 27a41d5e11d75..3d37ee4c4ea4f 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -51,15 +51,10 @@ MODULE_IMPORT_NS(DMA_BUF);
  * between applications, they can't be guessed like the globally unique GEM
  * names.
  *
- * Drivers that support the PRIME API implement the
- * &drm_driver.prime_handle_to_fd and &drm_driver.prime_fd_to_handle operations.
- * GEM based drivers must use drm_gem_prime_handle_to_fd() and
- * drm_gem_prime_fd_to_handle() to implement these. For GEM based drivers the
- * actual driver interfaces is provided through the &drm_gem_object_funcs.export
- * and &drm_driver.gem_prime_import hooks.
- *
- * &dma_buf_ops implementations for GEM drivers are all individually exported
- * for drivers which need to overwrite or reimplement some of them.
+ * Drivers that support the PRIME API implement the drm_gem_object_funcs.export
+ * and &drm_driver.gem_prime_import hooks. &dma_buf_ops implementations for
+ * drivers are all individually exported for drivers which need to overwrite
+ * or reimplement some of them.
  *
  * Reference Counting for GEM Drivers
  * ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 00223a8749092..ea55f6b7b744a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -481,8 +481,6 @@ static const struct drm_driver etnaviv_drm_driver = {
 	.driver_features    = DRIVER_GEM | DRIVER_RENDER,
 	.open               = etnaviv_open,
 	.postclose           = etnaviv_postclose,
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = etnaviv_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = etnaviv_debugfs_init,
diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm/exynos/exynos_drm_drv.c
index c9e3c88fb329c..8399256cb5c9d 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
@@ -109,8 +109,6 @@ static const struct drm_driver exynos_drm_driver = {
 	.open			= exynos_drm_open,
 	.postclose		= exynos_drm_postclose,
 	.dumb_create		= exynos_drm_gem_dumb_create,
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import	= exynos_drm_gem_prime_import,
 	.gem_prime_import_sg_table	= exynos_drm_gem_prime_import_sg_table,
 	.ioctls			= exynos_ioctls,
diff --git a/drivers/gpu/drm/i915/i915_driver.c b/drivers/gpu/drm/i915/i915_driver.c
index 0ad0c5885ec27..222d0a1f3b558 100644
--- a/drivers/gpu/drm/i915/i915_driver.c
+++ b/drivers/gpu/drm/i915/i915_driver.c
@@ -1818,8 +1818,6 @@ static const struct drm_driver i915_drm_driver = {
 	.postclose = i915_driver_postclose,
 	.show_fdinfo = PTR_IF(IS_ENABLED(CONFIG_PROC_FS), i915_drm_client_fdinfo),
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = i915_gem_prime_import,
 
 	.dumb_create = i915_gem_dumb_create,
diff --git a/drivers/gpu/drm/lima/lima_drv.c b/drivers/gpu/drm/lima/lima_drv.c
index 65c31dc38049a..3dd078f443bb5 100644
--- a/drivers/gpu/drm/lima/lima_drv.c
+++ b/drivers/gpu/drm/lima/lima_drv.c
@@ -276,9 +276,7 @@ static const struct drm_driver lima_drm_driver = {
 	.patchlevel         = 0,
 
 	.gem_create_object  = lima_gem_create_object,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table,
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 };
 
 struct lima_block_reader {
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index 5693bb8d29ce4..7fb65eb95c559 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -556,8 +556,6 @@ static const struct drm_driver mtk_drm_driver = {
 
 	.dumb_create = mtk_drm_gem_dumb_create,
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = mtk_drm_gem_prime_import,
 	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.fops = &mtk_drm_fops,
diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 47efa3c4492c4..2a0e3529598b6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1086,8 +1086,6 @@ static const struct drm_driver msm_driver = {
 	.postclose          = msm_postclose,
 	.dumb_create        = msm_gem_dumb_create,
 	.dumb_map_offset    = msm_gem_dumb_map_offset,
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = msm_gem_prime_import_sg_table,
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init       = msm_debugfs_init,
diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 51f1918b44d36..ca3bb8075357b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -1240,8 +1240,6 @@ driver_stub = {
 	.num_ioctls = ARRAY_SIZE(nouveau_ioctls),
 	.fops = &nouveau_driver_fops,
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = nouveau_gem_prime_import_sg_table,
 
 	.dumb_create = nouveau_display_dumb_create,
diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 671d26b9d339e..e2697fe80e62b 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -655,8 +655,6 @@ static const struct drm_driver omap_drm_driver = {
 #ifdef CONFIG_DEBUG_FS
 	.debugfs_init = omap_debugfs_init,
 #endif
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = omap_gem_prime_import,
 	.dumb_create = omap_gem_dumb_create,
 	.dumb_map_offset = omap_gem_dumb_map_offset,
diff --git a/drivers/gpu/drm/panfrost/panfrost_drv.c b/drivers/gpu/drm/panfrost/panfrost_drv.c
index d2916bf435473..d54004ccd4b22 100644
--- a/drivers/gpu/drm/panfrost/panfrost_drv.c
+++ b/drivers/gpu/drm/panfrost/panfrost_drv.c
@@ -539,8 +539,6 @@ static const struct drm_driver panfrost_drm_driver = {
 	.minor			= 2,
 
 	.gem_create_object	= panfrost_gem_create_object,
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = panfrost_gem_prime_import_sg_table,
 };
 
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index c4b8357ea9996..ba3b5b5f0cdfe 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -224,8 +224,6 @@ static const struct drm_driver pl111_drm_driver = {
 	.minor = 0,
 	.patchlevel = 0,
 	.dumb_create = drm_gem_dma_dumb_create,
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = pl111_gem_import_sg_table,
 
 #if defined(CONFIG_DEBUG_FS)
diff --git a/drivers/gpu/drm/qxl/qxl_drv.c b/drivers/gpu/drm/qxl/qxl_drv.c
index a3b83f89e0616..b30ede1cf62d3 100644
--- a/drivers/gpu/drm/qxl/qxl_drv.c
+++ b/drivers/gpu/drm/qxl/qxl_drv.c
@@ -290,8 +290,6 @@ static struct drm_driver qxl_driver = {
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = qxl_debugfs_init,
 #endif
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = qxl_gem_prime_import_sg_table,
 	.fops = &qxl_fops,
 	.ioctls = qxl_ioctls,
diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index cf1b960c4200c..39cdede460b51 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -604,8 +604,6 @@ static const struct drm_driver kms_driver = {
 	.dumb_map_offset = radeon_mode_dumb_mmap,
 	.fops = &radeon_driver_kms_fops,
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index 4280ff5fa91f2..a4f3615f3291d 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -605,8 +605,6 @@ DEFINE_DRM_GEM_DMA_FOPS(rcar_du_fops);
 static const struct drm_driver rcar_du_driver = {
 	.driver_features	= DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.dumb_create		= rcar_du_dumb_create,
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = rcar_du_gem_prime_import_sg_table,
 	.fops			= &rcar_du_fops,
 	.name			= "rcar-du",
diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
index b8cf89f0cc566..e35be6ea28496 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.c
@@ -224,8 +224,6 @@ DEFINE_DRM_GEM_FOPS(rockchip_drm_driver_fops);
 static const struct drm_driver rockchip_drm_driver = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.dumb_create		= rockchip_gem_dumb_create,
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table	= rockchip_gem_prime_import_sg_table,
 	.fops			= &rockchip_drm_driver_fops,
 	.name	= DRIVER_NAME,
diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index 35ff303c6674f..ff36171c8fb70 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -887,8 +887,6 @@ static const struct drm_driver tegra_drm_driver = {
 	.debugfs_init = tegra_debugfs_init,
 #endif
 
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = tegra_gem_prime_import,
 
 	.dumb_create = tegra_bo_dumb_create,
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 845a36e36450d..ffbbe9d527d32 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -171,8 +171,6 @@ static const struct drm_driver v3d_drm_driver = {
 #endif
 
 	.gem_create_object = v3d_create_object,
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = v3d_prime_import_sg_table,
 
 	.ioctls = v3d_drm_ioctls,
diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.c b/drivers/gpu/drm/virtio/virtgpu_drv.c
index 91ace7a44f2a6..a7ec5a3770da6 100644
--- a/drivers/gpu/drm/virtio/virtgpu_drv.c
+++ b/drivers/gpu/drm/virtio/virtgpu_drv.c
@@ -186,8 +186,6 @@ static const struct drm_driver driver = {
 #if defined(CONFIG_DEBUG_FS)
 	.debugfs_init = virtio_gpu_debugfs_init,
 #endif
-	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
 	.gem_prime_import = virtgpu_gem_prime_import,
 	.gem_prime_import_sg_table = virtgpu_gem_prime_import_sg_table,
 
diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index 62c3c13b3a175..7e9431c50c5a2 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -474,8 +474,6 @@ DEFINE_DRM_GEM_FOPS(xen_drm_dev_fops);
 static const struct drm_driver xen_drm_driver = {
 	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.release                   = xen_drm_drv_release,
-	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index 61da596780b64..a827bde494f61 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -166,9 +166,7 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
  * DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE() instead.
  */
 #define DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE(dumb_create_func) \
-	.dumb_create		= (dumb_create_func), \
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
+	.dumb_create		   = (dumb_create_func), \
 	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table
 
 /**
@@ -203,9 +201,7 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
  * DRM_GEM_DMA_DRIVER_OPS_WITH_DUMB_CREATE() instead.
  */
 #define DRM_GEM_DMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(dumb_create_func) \
-	.dumb_create		= dumb_create_func, \
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
+	.dumb_create		   = (dumb_create_func), \
 	.gem_prime_import_sg_table = drm_gem_dma_prime_import_sg_table_vmap
 
 /**
diff --git a/include/drm/drm_gem_shmem_helper.h b/include/drm/drm_gem_shmem_helper.h
index 46eb46e690630..52a976e6796a4 100644
--- a/include/drm/drm_gem_shmem_helper.h
+++ b/include/drm/drm_gem_shmem_helper.h
@@ -290,9 +290,7 @@ int drm_gem_shmem_dumb_create(struct drm_file *file, struct drm_device *dev,
  * the &drm_driver structure.
  */
 #define DRM_GEM_SHMEM_DRIVER_OPS \
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd, \
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle, \
 	.gem_prime_import_sg_table = drm_gem_shmem_prime_import_sg_table, \
-	.dumb_create		= drm_gem_shmem_dumb_create
+	.dumb_create		   = drm_gem_shmem_dumb_create
 
 #endif /* __DRM_GEM_SHMEM_HELPER_H__ */
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 6b265cb9f45a4..e18429f09e537 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -157,11 +157,9 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
  * &struct drm_driver with default functions.
  */
 #define DRM_GEM_VRAM_DRIVER \
-	.debugfs_init             = drm_vram_mm_debugfs_init, \
-	.dumb_create		  = drm_gem_vram_driver_dumb_create, \
-	.dumb_map_offset	  = drm_gem_ttm_dumb_map_offset, \
-	.prime_handle_to_fd	  = drm_gem_prime_handle_to_fd, \
-	.prime_fd_to_handle	  = drm_gem_prime_fd_to_handle
+	.debugfs_init	 = drm_vram_mm_debugfs_init, \
+	.dumb_create	 = drm_gem_vram_driver_dumb_create, \
+	.dumb_map_offset = drm_gem_ttm_dumb_map_offset
 
 /*
  *  VRAM memory manager
-- 
2.41.0

