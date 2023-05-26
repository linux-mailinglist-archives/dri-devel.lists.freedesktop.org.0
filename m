Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C6587121BF
	for <lists+dri-devel@lfdr.de>; Fri, 26 May 2023 10:02:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4FCF10E7B9;
	Fri, 26 May 2023 08:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.nfschina.com (unknown [42.101.60.195])
 by gabe.freedesktop.org (Postfix) with SMTP id 085F210E79F;
 Fri, 26 May 2023 03:33:22 +0000 (UTC)
Received: from localhost.localdomain (unknown [180.167.10.98])
 by mail.nfschina.com (Maildata Gateway V2.8.8) with ESMTPA id B711818010A35A; 
 Fri, 26 May 2023 11:32:27 +0800 (CST)
X-MD-Sfrom: suhui@nfschina.com
X-MD-SrcIP: 180.167.10.98
From: Su Hui <suhui@nfschina.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, christian.koenig@amd.com,
 Xinhui.Pan@amd.com, airlied@gmail.com, daniel@ffwll.ch, evan.quan@amd.com,
 l.stach@pengutronix.de, linux+etnaviv@armlinux.org.uk,
 christian.gmeiner@gmail.com, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, tomba@kernel.org, emma@anholt.net, airlied@redhat.com,
 kraxel@redhat.com, abrodkin@synopsys.com, ray.huang@amd.com,
 gurchetansingh@chromium.org, olvaffe@gmail.com, zackr@vmware.com,
 linux-graphics-maintainer@vmware.com, sumit.semwal@linaro.org
Subject: [PATCH] drm: Remove unnecessary (void*) conversions
Date: Fri, 26 May 2023 11:32:25 +0800
Message-Id: <20230526033225.1310824-1-suhui@nfschina.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 26 May 2023 08:02:45 +0000
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
Cc: Su Hui <suhui@nfschina.com>, nouveau@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 spice-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pointer variables of (void*) type do not require type cast.

Signed-off-by: Su Hui <suhui@nfschina.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c | 2 +-
 drivers/gpu/drm/amd/pm/amdgpu_pm.c                        | 2 +-
 drivers/gpu/drm/etnaviv/etnaviv_drv.c                     | 4 ++--
 drivers/gpu/drm/nouveau/nouveau_debugfs.c                 | 2 +-
 drivers/gpu/drm/omapdrm/omap_debugfs.c                    | 6 +++---
 drivers/gpu/drm/pl111/pl111_debugfs.c                     | 2 +-
 drivers/gpu/drm/qxl/qxl_debugfs.c                         | 4 ++--
 drivers/gpu/drm/tiny/arcpgu.c                             | 2 +-
 drivers/gpu/drm/ttm/ttm_resource.c                        | 3 +--
 drivers/gpu/drm/virtio/virtgpu_debugfs.c                  | 6 +++---
 drivers/gpu/drm/vmwgfx/ttm_object.c                       | 5 ++---
 drivers/gpu/drm/vmwgfx/vmwgfx_gem.c                       | 2 +-
 12 files changed, 19 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
index 827fcb4fb3b3..8a2c39927167 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c
@@ -3312,7 +3312,7 @@ static ssize_t dtn_log_write(
 
 static int mst_topo_show(struct seq_file *m, void *unused)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
+	struct amdgpu_device *adev = m->private;
 	struct drm_device *dev = adev_to_drm(adev);
 	struct drm_connector *connector;
 	struct drm_connector_list_iter conn_iter;
diff --git a/drivers/gpu/drm/amd/pm/amdgpu_pm.c b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
index 58c2246918fd..e6c870bd307b 100644
--- a/drivers/gpu/drm/amd/pm/amdgpu_pm.c
+++ b/drivers/gpu/drm/amd/pm/amdgpu_pm.c
@@ -3671,7 +3671,7 @@ static void amdgpu_parse_cg_state(struct seq_file *m, u64 flags)
 
 static int amdgpu_debugfs_pm_info_show(struct seq_file *m, void *unused)
 {
-	struct amdgpu_device *adev = (struct amdgpu_device *)m->private;
+	struct amdgpu_device *adev = m->private;
 	struct drm_device *dev = adev_to_drm(adev);
 	u64 flags = 0;
 	int r;
diff --git a/drivers/gpu/drm/etnaviv/etnaviv_drv.c b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
index 31a7f59ccb49..dd57f7164e9a 100644
--- a/drivers/gpu/drm/etnaviv/etnaviv_drv.c
+++ b/drivers/gpu/drm/etnaviv/etnaviv_drv.c
@@ -198,7 +198,7 @@ static int etnaviv_ring_show(struct etnaviv_gpu *gpu, struct seq_file *m)
 
 static int show_unlocked(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	int (*show)(struct drm_device *dev, struct seq_file *m) =
 			node->info_ent->data;
@@ -208,7 +208,7 @@ static int show_unlocked(struct seq_file *m, void *arg)
 
 static int show_each_gpu(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct etnaviv_drm_private *priv = dev->dev_private;
 	struct etnaviv_gpu *gpu;
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 2a36d1ca8fda..96b59d5d68ed 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -37,7 +37,7 @@
 static int
 nouveau_debugfs_vbios_image(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct nouveau_drm *drm = nouveau_drm(node->minor->dev);
 	int i;
 
diff --git a/drivers/gpu/drm/omapdrm/omap_debugfs.c b/drivers/gpu/drm/omapdrm/omap_debugfs.c
index a3d470468e5b..a94ce502e152 100644
--- a/drivers/gpu/drm/omapdrm/omap_debugfs.c
+++ b/drivers/gpu/drm/omapdrm/omap_debugfs.c
@@ -19,7 +19,7 @@
 
 static int gem_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct omap_drm_private *priv = dev->dev_private;
 
@@ -33,7 +33,7 @@ static int gem_show(struct seq_file *m, void *arg)
 
 static int mm_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct drm_printer p = drm_seq_file_printer(m);
 
@@ -45,7 +45,7 @@ static int mm_show(struct seq_file *m, void *arg)
 #ifdef CONFIG_DRM_FBDEV_EMULATION
 static int fb_show(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct drm_fb_helper *helper = dev->fb_helper;
 	struct drm_framebuffer *fb;
diff --git a/drivers/gpu/drm/pl111/pl111_debugfs.c b/drivers/gpu/drm/pl111/pl111_debugfs.c
index 6744fa16f464..4df03ec5d368 100644
--- a/drivers/gpu/drm/pl111/pl111_debugfs.c
+++ b/drivers/gpu/drm/pl111/pl111_debugfs.c
@@ -32,7 +32,7 @@ static const struct {
 
 static int pl111_debugfs_regs(struct seq_file *m, void *unused)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *dev = node->minor->dev;
 	struct pl111_drm_dev_private *priv = dev->dev_private;
 	int i;
diff --git a/drivers/gpu/drm/qxl/qxl_debugfs.c b/drivers/gpu/drm/qxl/qxl_debugfs.c
index 2d9ed3b94574..5b4fe3049529 100644
--- a/drivers/gpu/drm/qxl/qxl_debugfs.c
+++ b/drivers/gpu/drm/qxl/qxl_debugfs.c
@@ -38,7 +38,7 @@
 static int
 qxl_debugfs_irq_received(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct qxl_device *qdev = to_qxl(node->minor->dev);
 
 	seq_printf(m, "%d\n", atomic_read(&qdev->irq_received));
@@ -52,7 +52,7 @@ qxl_debugfs_irq_received(struct seq_file *m, void *data)
 static int
 qxl_debugfs_buffers_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct qxl_device *qdev = to_qxl(node->minor->dev);
 	struct qxl_bo *bo;
 
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..09f728355aba 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -338,7 +338,7 @@ static int arcpgu_unload(struct drm_device *drm)
 #ifdef CONFIG_DEBUG_FS
 static int arcpgu_show_pxlclock(struct seq_file *m, void *arg)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_info_node *node = m->private;
 	struct drm_device *drm = node->minor->dev;
 	struct arcpgu_drm_private *arcpgu = dev_to_arcpgu(drm);
 	unsigned long clkrate = clk_get_rate(arcpgu->clk);
diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7333f7a87a2f..540faabcf8a4 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -727,9 +727,8 @@ ttm_kmap_iter_linear_io_fini(struct ttm_kmap_iter_linear_io *iter_io,
 
 static int ttm_resource_manager_show(struct seq_file *m, void *unused)
 {
-	struct ttm_resource_manager *man =
-		(struct ttm_resource_manager *)m->private;
 	struct drm_printer p = drm_seq_file_printer(m);
+	struct ttm_resource_manager *man = m->private;
 	ttm_resource_manager_debug(man, &p);
 	return 0;
 }
diff --git a/drivers/gpu/drm/virtio/virtgpu_debugfs.c b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
index 853dd9aa397e..577691af9707 100644
--- a/drivers/gpu/drm/virtio/virtgpu_debugfs.c
+++ b/drivers/gpu/drm/virtio/virtgpu_debugfs.c
@@ -43,7 +43,7 @@ static void virtio_gpu_add_int(struct seq_file *m, const char *name, int value)
 
 static int virtio_gpu_features(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_info_node *node = m->private;
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 
 	virtio_gpu_add_bool(m, "virgl", vgdev->has_virgl_3d);
@@ -68,7 +68,7 @@ static int virtio_gpu_features(struct seq_file *m, void *data)
 static int
 virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *) m->private;
+	struct drm_info_node *node = m->private;
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 
 	seq_printf(m, "fence %llu %lld\n",
@@ -80,7 +80,7 @@ virtio_gpu_debugfs_irq_info(struct seq_file *m, void *data)
 static int
 virtio_gpu_debugfs_host_visible_mm(struct seq_file *m, void *data)
 {
-	struct drm_info_node *node = (struct drm_info_node *)m->private;
+	struct drm_info_node *node = m->private;
 	struct virtio_gpu_device *vgdev = node->minor->dev->dev_private;
 	struct drm_printer p;
 
diff --git a/drivers/gpu/drm/vmwgfx/ttm_object.c b/drivers/gpu/drm/vmwgfx/ttm_object.c
index ddf8373c1d77..e9e3cc8f5b49 100644
--- a/drivers/gpu/drm/vmwgfx/ttm_object.c
+++ b/drivers/gpu/drm/vmwgfx/ttm_object.c
@@ -513,8 +513,7 @@ static void ttm_prime_refcount_release(struct ttm_base_object **p_base)
  */
 static void ttm_prime_dmabuf_release(struct dma_buf *dma_buf)
 {
-	struct ttm_prime_object *prime =
-		(struct ttm_prime_object *) dma_buf->priv;
+	struct ttm_prime_object *prime = dma_buf->priv;
 	struct ttm_base_object *base = &prime->base;
 	struct ttm_object_device *tdev = base->tfile->tdev;
 
@@ -554,7 +553,7 @@ int ttm_prime_fd_to_handle(struct ttm_object_file *tfile,
 	if (dma_buf->ops != &tdev->ops)
 		return -ENOSYS;
 
-	prime = (struct ttm_prime_object *) dma_buf->priv;
+	prime = dma_buf->priv;
 	base = &prime->base;
 	*handle = base->handle;
 	ret = ttm_ref_object_add(tfile, base, NULL, false);
diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
index c0da89e16e6f..3267a4e61382 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
@@ -220,7 +220,7 @@ static void vmw_bo_print_info(int id, struct vmw_bo *bo, struct seq_file *m)
 
 static int vmw_debugfs_gem_info_show(struct seq_file *m, void *unused)
 {
-	struct vmw_private *vdev = (struct vmw_private *)m->private;
+	struct vmw_private *vdev = m->private;
 	struct drm_device *dev = &vdev->drm;
 	struct drm_file *file;
 	int r;
-- 
2.30.2

