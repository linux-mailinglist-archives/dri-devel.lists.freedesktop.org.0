Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F39275610
	for <lists+dri-devel@lfdr.de>; Wed, 23 Sep 2020 12:22:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39AC36E919;
	Wed, 23 Sep 2020 10:22:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60D2E6E959;
 Wed, 23 Sep 2020 10:22:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 364BEB016;
 Wed, 23 Sep 2020 10:22:49 +0000 (UTC)
From: Thomas Zimmermann <tzimmermann@suse.de>
To: alexander.deucher@amd.com, christian.koenig@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com,
 heiko@sntech.de, thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com, laurentiu.palcu@oss.nxp.com,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, linux-imx@nxp.com
Subject: [PATCH v3 11/22] drm/omapdrm: Introduce GEM object functions
Date: Wed, 23 Sep 2020 12:21:48 +0200
Message-Id: <20200923102159.24084-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923102159.24084-1-tzimmermann@suse.de>
References: <20200923102159.24084-1-tzimmermann@suse.de>
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
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>, nouveau@lists.freedesktop.org,
 linux-tegra@vger.kernel.org, xen-devel@lists.xenproject.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

GEM object functions deprecate several similar callback interfaces in
struct drm_driver. This patch replaces the per-driver callbacks with
per-instance callbacks in omapdrm.

v2:
	* make omap_gem_free_object() static (Tomi)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/omapdrm/omap_drv.c |  9 ---------
 drivers/gpu/drm/omapdrm/omap_gem.c | 18 ++++++++++++++++--
 drivers/gpu/drm/omapdrm/omap_gem.h |  2 --
 3 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm/omap_drv.c
index 53d5e184ee77..2e598b8b72af 100644
--- a/drivers/gpu/drm/omapdrm/omap_drv.c
+++ b/drivers/gpu/drm/omapdrm/omap_drv.c
@@ -521,12 +521,6 @@ static int dev_open(struct drm_device *dev, struct drm_file *file)
 	return 0;
 }
 
-static const struct vm_operations_struct omap_gem_vm_ops = {
-	.fault = omap_gem_fault,
-	.open = drm_gem_vm_open,
-	.close = drm_gem_vm_close,
-};
-
 static const struct file_operations omapdriver_fops = {
 	.owner = THIS_MODULE,
 	.open = drm_open,
@@ -549,10 +543,7 @@ static struct drm_driver omap_drm_driver = {
 #endif
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = omap_gem_prime_export,
 	.gem_prime_import = omap_gem_prime_import,
-	.gem_free_object_unlocked = omap_gem_free_object,
-	.gem_vm_ops = &omap_gem_vm_ops,
 	.dumb_create = omap_gem_dumb_create,
 	.dumb_map_offset = omap_gem_dumb_map_offset,
 	.ioctls = ioctls,
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index f67f223c6479..d8e09792793a 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -487,7 +487,7 @@ static vm_fault_t omap_gem_fault_2d(struct drm_gem_object *obj,
  * vma->vm_private_data points to the GEM object that is backing this
  * mapping.
  */
-vm_fault_t omap_gem_fault(struct vm_fault *vmf)
+static vm_fault_t omap_gem_fault(struct vm_fault *vmf)
 {
 	struct vm_area_struct *vma = vmf->vma;
 	struct drm_gem_object *obj = vma->vm_private_data;
@@ -1089,7 +1089,7 @@ void omap_gem_describe_objects(struct list_head *list, struct seq_file *m)
  * Constructor & Destructor
  */
 
-void omap_gem_free_object(struct drm_gem_object *obj)
+static void omap_gem_free_object(struct drm_gem_object *obj)
 {
 	struct drm_device *dev = obj->dev;
 	struct omap_drm_private *priv = dev->dev_private;
@@ -1169,6 +1169,18 @@ static bool omap_gem_validate_flags(struct drm_device *dev, u32 flags)
 	return true;
 }
 
+static const struct vm_operations_struct omap_gem_vm_ops = {
+	.fault = omap_gem_fault,
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs omap_gem_object_funcs = {
+	.free = omap_gem_free_object,
+	.export = omap_gem_prime_export,
+	.vm_ops = &omap_gem_vm_ops,
+};
+
 /* GEM buffer object constructor */
 struct drm_gem_object *omap_gem_new(struct drm_device *dev,
 		union omap_gem_size gsize, u32 flags)
@@ -1236,6 +1248,8 @@ struct drm_gem_object *omap_gem_new(struct drm_device *dev,
 		size = PAGE_ALIGN(gsize.bytes);
 	}
 
+	obj->funcs = &omap_gem_object_funcs;
+
 	/* Initialize the GEM object. */
 	if (!(flags & OMAP_BO_MEM_SHMEM)) {
 		drm_gem_private_object_init(dev, obj, size);
diff --git a/drivers/gpu/drm/omapdrm/omap_gem.h b/drivers/gpu/drm/omapdrm/omap_gem.h
index 729b7812a815..eda9b4839c30 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.h
+++ b/drivers/gpu/drm/omapdrm/omap_gem.h
@@ -48,7 +48,6 @@ struct drm_gem_object *omap_gem_new_dmabuf(struct drm_device *dev, size_t size,
 		struct sg_table *sgt);
 int omap_gem_new_handle(struct drm_device *dev, struct drm_file *file,
 		union omap_gem_size gsize, u32 flags, u32 *handle);
-void omap_gem_free_object(struct drm_gem_object *obj);
 void *omap_gem_vaddr(struct drm_gem_object *obj);
 
 /* Dumb Buffers Interface */
@@ -69,7 +68,6 @@ struct dma_buf *omap_gem_prime_export(struct drm_gem_object *obj, int flags);
 struct drm_gem_object *omap_gem_prime_import(struct drm_device *dev,
 		struct dma_buf *buffer);
 
-vm_fault_t omap_gem_fault(struct vm_fault *vmf);
 int omap_gem_roll(struct drm_gem_object *obj, u32 roll);
 void omap_gem_cpu_sync_page(struct drm_gem_object *obj, int pgoff);
 void omap_gem_dma_sync_buffer(struct drm_gem_object *obj,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
