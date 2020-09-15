Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 751EB26A81F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:01:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F8786E8ED;
	Tue, 15 Sep 2020 15:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 880856E8B7;
 Tue, 15 Sep 2020 15:00:13 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 69E72B13B;
 Tue, 15 Sep 2020 15:00:27 +0000 (UTC)
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
 emil.velikov@collabora.com
Subject: [PATCH v2 12/21] drm/radeon: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:49 +0200
Message-Id: <20200915145958.19993-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200915145958.19993-1-tzimmermann@suse.de>
References: <20200915145958.19993-1-tzimmermann@suse.de>
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
per-instance callbacks in radeon.

v2:
	* move object-function instance to radeon_gem.c (Christian)
	* set callbacks in radeon_gem_object_create() (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/radeon/radeon_drv.c | 23 +--------------------
 drivers/gpu/drm/radeon/radeon_gem.c | 31 +++++++++++++++++++++++++----
 2 files changed, 28 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/radeon/radeon_drv.c b/drivers/gpu/drm/radeon/radeon_drv.c
index 4cd30613fa1d..65061c949aee 100644
--- a/drivers/gpu/drm/radeon/radeon_drv.c
+++ b/drivers/gpu/drm/radeon/radeon_drv.c
@@ -124,13 +124,6 @@ void radeon_driver_irq_preinstall_kms(struct drm_device *dev);
 int radeon_driver_irq_postinstall_kms(struct drm_device *dev);
 void radeon_driver_irq_uninstall_kms(struct drm_device *dev);
 irqreturn_t radeon_driver_irq_handler_kms(int irq, void *arg);
-void radeon_gem_object_free(struct drm_gem_object *obj);
-int radeon_gem_object_open(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-void radeon_gem_object_close(struct drm_gem_object *obj,
-				struct drm_file *file_priv);
-struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
-					int flags);
 extern int radeon_get_crtc_scanoutpos(struct drm_device *dev, unsigned int crtc,
 				      unsigned int flags, int *vpos, int *hpos,
 				      ktime_t *stime, ktime_t *etime,
@@ -145,14 +138,9 @@ int radeon_mode_dumb_mmap(struct drm_file *filp,
 int radeon_mode_dumb_create(struct drm_file *file_priv,
 			    struct drm_device *dev,
 			    struct drm_mode_create_dumb *args);
-struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
 struct drm_gem_object *radeon_gem_prime_import_sg_table(struct drm_device *dev,
 							struct dma_buf_attachment *,
 							struct sg_table *sg);
-int radeon_gem_prime_pin(struct drm_gem_object *obj);
-void radeon_gem_prime_unpin(struct drm_gem_object *obj);
-void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
-void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
 
 /* atpx handler */
 #if defined(CONFIG_VGA_SWITCHEROO)
@@ -550,7 +538,7 @@ long radeon_drm_ioctl(struct file *filp,
 	}
 
 	ret = drm_ioctl(filp, cmd, arg);
-	
+
 	pm_runtime_mark_last_busy(dev->dev);
 	pm_runtime_put_autosuspend(dev->dev);
 	return ret;
@@ -609,22 +597,13 @@ static struct drm_driver kms_driver = {
 	.irq_uninstall = radeon_driver_irq_uninstall_kms,
 	.irq_handler = radeon_driver_irq_handler_kms,
 	.ioctls = radeon_ioctls_kms,
-	.gem_free_object_unlocked = radeon_gem_object_free,
-	.gem_open_object = radeon_gem_object_open,
-	.gem_close_object = radeon_gem_object_close,
 	.dumb_create = radeon_mode_dumb_create,
 	.dumb_map_offset = radeon_mode_dumb_mmap,
 	.fops = &radeon_driver_kms_fops,
 
 	.prime_handle_to_fd = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
-	.gem_prime_export = radeon_gem_prime_export,
-	.gem_prime_pin = radeon_gem_prime_pin,
-	.gem_prime_unpin = radeon_gem_prime_unpin,
-	.gem_prime_get_sg_table = radeon_gem_prime_get_sg_table,
 	.gem_prime_import_sg_table = radeon_gem_prime_import_sg_table,
-	.gem_prime_vmap = radeon_gem_prime_vmap,
-	.gem_prime_vunmap = radeon_gem_prime_vunmap,
 
 	.name = DRIVER_NAME,
 	.desc = DRIVER_DESC,
diff --git a/drivers/gpu/drm/radeon/radeon_gem.c b/drivers/gpu/drm/radeon/radeon_gem.c
index e5c4271e64ed..0ccd7213e41f 100644
--- a/drivers/gpu/drm/radeon/radeon_gem.c
+++ b/drivers/gpu/drm/radeon/radeon_gem.c
@@ -35,7 +35,17 @@
 
 #include "radeon.h"
 
-void radeon_gem_object_free(struct drm_gem_object *gobj)
+struct dma_buf *radeon_gem_prime_export(struct drm_gem_object *gobj,
+					int flags);
+struct sg_table *radeon_gem_prime_get_sg_table(struct drm_gem_object *obj);
+int radeon_gem_prime_pin(struct drm_gem_object *obj);
+void radeon_gem_prime_unpin(struct drm_gem_object *obj);
+void *radeon_gem_prime_vmap(struct drm_gem_object *obj);
+void radeon_gem_prime_vunmap(struct drm_gem_object *obj, void *vaddr);
+
+static const struct drm_gem_object_funcs radeon_gem_object_funcs;
+
+static void radeon_gem_object_free(struct drm_gem_object *gobj)
 {
 	struct radeon_bo *robj = gem_to_radeon_bo(gobj);
 
@@ -85,6 +95,7 @@ int radeon_gem_object_create(struct radeon_device *rdev, unsigned long size,
 		return r;
 	}
 	*obj = &robj->tbo.base;
+	(*obj)->funcs = &radeon_gem_object_funcs;
 	robj->pid = task_pid_nr(current);
 
 	mutex_lock(&rdev->gem.mutex);
@@ -146,7 +157,7 @@ void radeon_gem_fini(struct radeon_device *rdev)
  * Call from drm_gem_handle_create which appear in both new and open ioctl
  * case.
  */
-int radeon_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv)
+static int radeon_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_priv)
 {
 	struct radeon_bo *rbo = gem_to_radeon_bo(obj);
 	struct radeon_device *rdev = rbo->rdev;
@@ -176,8 +187,8 @@ int radeon_gem_object_open(struct drm_gem_object *obj, struct drm_file *file_pri
 	return 0;
 }
 
-void radeon_gem_object_close(struct drm_gem_object *obj,
-			     struct drm_file *file_priv)
+static void radeon_gem_object_close(struct drm_gem_object *obj,
+				    struct drm_file *file_priv)
 {
 	struct radeon_bo *rbo = gem_to_radeon_bo(obj);
 	struct radeon_device *rdev = rbo->rdev;
@@ -216,6 +227,18 @@ static int radeon_gem_handle_lockup(struct radeon_device *rdev, int r)
 	return r;
 }
 
+static const struct drm_gem_object_funcs radeon_gem_object_funcs = {
+	.free = radeon_gem_object_free,
+	.open = radeon_gem_object_open,
+	.close = radeon_gem_object_close,
+	.export = radeon_gem_prime_export,
+	.pin = radeon_gem_prime_pin,
+	.unpin = radeon_gem_prime_unpin,
+	.get_sg_table = radeon_gem_prime_get_sg_table,
+	.vmap = radeon_gem_prime_vmap,
+	.vunmap = radeon_gem_prime_vunmap,
+};
+
 /*
  * GEM ioctls.
  */
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
