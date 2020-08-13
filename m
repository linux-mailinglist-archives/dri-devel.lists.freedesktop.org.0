Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABF23243655
	for <lists+dri-devel@lfdr.de>; Thu, 13 Aug 2020 10:37:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8956E976;
	Thu, 13 Aug 2020 08:36:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 163E66E58B;
 Thu, 13 Aug 2020 08:36:54 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 8D1EAAFB1;
 Thu, 13 Aug 2020 08:37:14 +0000 (UTC)
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
 matthew.auld@intel.com, abdiel.janulgue@linux.intel.com,
 tvrtko.ursulin@linux.intel.com, andi.shyti@intel.com, sam@ravnborg.org,
 miaoqinglang@huawei.com, emil.velikov@collabora.com
Subject: [PATCH 02/20] drm/armada: Introduce GEM object functions
Date: Thu, 13 Aug 2020 10:36:26 +0200
Message-Id: <20200813083644.31711-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200813083644.31711-1-tzimmermann@suse.de>
References: <20200813083644.31711-1-tzimmermann@suse.de>
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
per-instance callbacks in armada.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/armada/armada_drv.c |  3 ---
 drivers/gpu/drm/armada/armada_gem.c | 12 +++++++++++-
 drivers/gpu/drm/armada/armada_gem.h |  2 --
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_drv.c b/drivers/gpu/drm/armada/armada_drv.c
index 5fc25c3f445c..9bccfd894be9 100644
--- a/drivers/gpu/drm/armada/armada_drv.c
+++ b/drivers/gpu/drm/armada/armada_drv.c
@@ -37,13 +37,10 @@ DEFINE_DRM_GEM_FOPS(armada_drm_fops);
 
 static struct drm_driver armada_drm_driver = {
 	.lastclose		= drm_fb_helper_lastclose,
-	.gem_free_object_unlocked = armada_gem_free_object,
 	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
 	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_export	= armada_gem_prime_export,
 	.gem_prime_import	= armada_gem_prime_import,
 	.dumb_create		= armada_gem_dumb_create,
-	.gem_vm_ops		= &armada_gem_vm_ops,
 	.major			= 1,
 	.minor			= 0,
 	.name			= "armada-drm",
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 8005614d2e6b..81c9da65045c 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -25,7 +25,7 @@ static vm_fault_t armada_gem_vm_fault(struct vm_fault *vmf)
 	return vmf_insert_pfn(vmf->vma, vmf->address, pfn);
 }
 
-const struct vm_operations_struct armada_gem_vm_ops = {
+static const struct vm_operations_struct armada_gem_vm_ops = {
 	.fault	= armada_gem_vm_fault,
 	.open	= drm_gem_vm_open,
 	.close	= drm_gem_vm_close,
@@ -184,6 +184,12 @@ armada_gem_map_object(struct drm_device *dev, struct armada_gem_object *dobj)
 	return dobj->addr;
 }
 
+static const struct drm_gem_object_funcs armada_gem_object_funcs = {
+	.free = armada_gem_free_object,
+	.export = armada_gem_prime_export,
+	.vm_ops = &armada_gem_vm_ops,
+};
+
 struct armada_gem_object *
 armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
 {
@@ -195,6 +201,8 @@ armada_gem_alloc_private_object(struct drm_device *dev, size_t size)
 	if (!obj)
 		return NULL;
 
+	obj->obj.funcs = &armada_gem_object_funcs;
+
 	drm_gem_private_object_init(dev, &obj->obj, size);
 
 	DRM_DEBUG_DRIVER("alloc private obj %p size %zu\n", obj, size);
@@ -214,6 +222,8 @@ static struct armada_gem_object *armada_gem_alloc_object(struct drm_device *dev,
 	if (!obj)
 		return NULL;
 
+	obj->obj.funcs = &armada_gem_object_funcs;
+
 	if (drm_gem_object_init(dev, &obj->obj, size)) {
 		kfree(obj);
 		return NULL;
diff --git a/drivers/gpu/drm/armada/armada_gem.h b/drivers/gpu/drm/armada/armada_gem.h
index de04cc2c8f0e..ffcc7e8dd351 100644
--- a/drivers/gpu/drm/armada/armada_gem.h
+++ b/drivers/gpu/drm/armada/armada_gem.h
@@ -21,8 +21,6 @@ struct armada_gem_object {
 	void			*update_data;
 };
 
-extern const struct vm_operations_struct armada_gem_vm_ops;
-
 #define drm_to_armada_gem(o) container_of(o, struct armada_gem_object, obj)
 
 void armada_gem_free_object(struct drm_gem_object *);
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
