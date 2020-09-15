Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F35426A826
	for <lists+dri-devel@lfdr.de>; Tue, 15 Sep 2020 17:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D507E6E8EE;
	Tue, 15 Sep 2020 15:00:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 989D26E8E5;
 Tue, 15 Sep 2020 15:00:19 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8AFDDB2B5;
 Tue, 15 Sep 2020 15:00:33 +0000 (UTC)
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
Subject: [PATCH v2 19/21] drm/xen: Introduce GEM object functions
Date: Tue, 15 Sep 2020 16:59:56 +0200
Message-Id: <20200915145958.19993-20-tzimmermann@suse.de>
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
per-instance callbacks in xen. The only exception is gem_prime_mmap,
which is non-trivial to convert.

v2:
	* convert xen_drm_drv_free_object_unlocked() to static
	  callback (Oleksandr)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Acked-by: Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>
---
 drivers/gpu/drm/xen/xen_drm_front.c     | 44 ++++++++++---------------
 drivers/gpu/drm/xen/xen_drm_front.h     |  2 ++
 drivers/gpu/drm/xen/xen_drm_front_gem.c | 15 +++++++++
 3 files changed, 34 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/xen/xen_drm_front.c b/drivers/gpu/drm/xen/xen_drm_front.c
index cc93a8c9547b..98b6d2ba088a 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.c
+++ b/drivers/gpu/drm/xen/xen_drm_front.c
@@ -381,6 +381,23 @@ void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
 					fb_cookie);
 }
 
+void xen_drm_front_gem_object_free(struct drm_gem_object *obj)
+{
+	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
+	int idx;
+
+	if (drm_dev_enter(obj->dev, &idx)) {
+		xen_drm_front_dbuf_destroy(drm_info->front_info,
+					   xen_drm_front_dbuf_to_cookie(obj));
+		drm_dev_exit(idx);
+	} else {
+		dbuf_free(&drm_info->front_info->dbuf_list,
+			  xen_drm_front_dbuf_to_cookie(obj));
+	}
+
+	xen_drm_front_gem_free_object_unlocked(obj);
+}
+
 static int xen_drm_drv_dumb_create(struct drm_file *filp,
 				   struct drm_device *dev,
 				   struct drm_mode_create_dumb *args)
@@ -435,23 +452,6 @@ static int xen_drm_drv_dumb_create(struct drm_file *filp,
 	return ret;
 }
 
-static void xen_drm_drv_free_object_unlocked(struct drm_gem_object *obj)
-{
-	struct xen_drm_front_drm_info *drm_info = obj->dev->dev_private;
-	int idx;
-
-	if (drm_dev_enter(obj->dev, &idx)) {
-		xen_drm_front_dbuf_destroy(drm_info->front_info,
-					   xen_drm_front_dbuf_to_cookie(obj));
-		drm_dev_exit(idx);
-	} else {
-		dbuf_free(&drm_info->front_info->dbuf_list,
-			  xen_drm_front_dbuf_to_cookie(obj));
-	}
-
-	xen_drm_front_gem_free_object_unlocked(obj);
-}
-
 static void xen_drm_drv_release(struct drm_device *dev)
 {
 	struct xen_drm_front_drm_info *drm_info = dev->dev_private;
@@ -483,22 +483,12 @@ static const struct file_operations xen_drm_dev_fops = {
 	.mmap           = xen_drm_front_gem_mmap,
 };
 
-static const struct vm_operations_struct xen_drm_drv_vm_ops = {
-	.open           = drm_gem_vm_open,
-	.close          = drm_gem_vm_close,
-};
-
 static struct drm_driver xen_drm_driver = {
 	.driver_features           = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.release                   = xen_drm_drv_release,
-	.gem_vm_ops                = &xen_drm_drv_vm_ops,
-	.gem_free_object_unlocked  = xen_drm_drv_free_object_unlocked,
 	.prime_handle_to_fd        = drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle        = drm_gem_prime_fd_to_handle,
 	.gem_prime_import_sg_table = xen_drm_front_gem_import_sg_table,
-	.gem_prime_get_sg_table    = xen_drm_front_gem_get_sg_table,
-	.gem_prime_vmap            = xen_drm_front_gem_prime_vmap,
-	.gem_prime_vunmap          = xen_drm_front_gem_prime_vunmap,
 	.gem_prime_mmap            = xen_drm_front_gem_prime_mmap,
 	.dumb_create               = xen_drm_drv_dumb_create,
 	.fops                      = &xen_drm_dev_fops,
diff --git a/drivers/gpu/drm/xen/xen_drm_front.h b/drivers/gpu/drm/xen/xen_drm_front.h
index 54486d89650e..cefafe859aba 100644
--- a/drivers/gpu/drm/xen/xen_drm_front.h
+++ b/drivers/gpu/drm/xen/xen_drm_front.h
@@ -160,4 +160,6 @@ int xen_drm_front_page_flip(struct xen_drm_front_info *front_info,
 void xen_drm_front_on_frame_done(struct xen_drm_front_info *front_info,
 				 int conn_idx, u64 fb_cookie);
 
+void xen_drm_front_gem_object_free(struct drm_gem_object *obj);
+
 #endif /* __XEN_DRM_FRONT_H_ */
diff --git a/drivers/gpu/drm/xen/xen_drm_front_gem.c b/drivers/gpu/drm/xen/xen_drm_front_gem.c
index a8aefaa38bd3..f3830a0d1808 100644
--- a/drivers/gpu/drm/xen/xen_drm_front_gem.c
+++ b/drivers/gpu/drm/xen/xen_drm_front_gem.c
@@ -57,6 +57,19 @@ static void gem_free_pages_array(struct xen_gem_object *xen_obj)
 	xen_obj->pages = NULL;
 }
 
+static const struct vm_operations_struct xen_drm_drv_vm_ops = {
+	.open           = drm_gem_vm_open,
+	.close          = drm_gem_vm_close,
+};
+
+static const struct drm_gem_object_funcs xen_drm_front_gem_object_funcs = {
+	.free = xen_drm_front_gem_object_free,
+	.get_sg_table = xen_drm_front_gem_get_sg_table,
+	.vmap = xen_drm_front_gem_prime_vmap,
+	.vunmap = xen_drm_front_gem_prime_vunmap,
+	.vm_ops = &xen_drm_drv_vm_ops,
+};
+
 static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
 					     size_t size)
 {
@@ -67,6 +80,8 @@ static struct xen_gem_object *gem_create_obj(struct drm_device *dev,
 	if (!xen_obj)
 		return ERR_PTR(-ENOMEM);
 
+	xen_obj->base.funcs = &xen_drm_front_gem_object_funcs;
+
 	ret = drm_gem_object_init(dev, &xen_obj->base, size);
 	if (ret < 0) {
 		kfree(xen_obj);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
