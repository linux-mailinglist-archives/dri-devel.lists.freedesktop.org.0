Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E412382DA6E
	for <lists+dri-devel@lfdr.de>; Mon, 15 Jan 2024 14:44:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 717BA10E2DC;
	Mon, 15 Jan 2024 13:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E688B10E2F7
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jan 2024 13:44:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705326288; x=1736862288;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=enbg1ENrsYoUy43bhV+UzZSZIMw+jig1+Q1kHU8hX4U=;
 b=LTQMdt/RUFoOUgYaZs+bmF9l/zv0uj6pXyEyI//TktsSQt6PQPnd+EGC
 tYLjOZCP4lrzDgvrtqLpXR22fR9euhKc234zCg2GZ+G1PxwgmNGNfdtXU
 lX/HRnkOQkX9yzbOgaP3rBIrZp5EXb1HFQLAnTgg0tPBJOvD3zPy/WOXz
 t0Egyvw9Up6l860u/t+dfj6S+SKKYuN+e/8Lyp8S++nuoFZ9YoJvvISNh
 xl5Cgqm9FlyVx6vTig7lsp/ld7TitfC33TrXX0hH3zHnx69fL6Oe3duZJ
 AIgKHquraZJEVk+pv0GZeckLIQL7+lvmO1isVIwxssnXnl37Uo7+e94t6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10953"; a="403378769"
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="403378769"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,196,1695711600"; d="scan'208";a="25472228"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2024 05:44:48 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 7/9] accel/ivpu: Disable buffer sharing among VPU contexts
Date: Mon, 15 Jan 2024 14:44:32 +0100
Message-ID: <20240115134434.493839-8-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
References: <20240115134434.493839-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: oded.gabbay@gmail.com, quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was not supported properly. A buffer was imported to another VPU
context as a separate buffer object with duplicated sgt.
Both exported and imported buffers could be DMA mapped causing a double
mapping on the same device.

Buffers imported from another VPU context will now just increase
reference count, leaving only a single sgt, fixing the problem above.
Buffers still can't be shared among VPU contexts because each has its
own MMU mapping and ivpu_bo only supports single MMU mappings.

The solution would be to use a mapping list as in panfrost or etnaviv
drivers and it will be implemented in future if required.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 44 +++++------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 4de454bfbf91..95e731e13941 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -222,6 +222,12 @@ static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
 	struct ivpu_addr_range *range;
 
+	if (bo->ctx) {
+		ivpu_warn(vdev, "Can't add BO to ctx %u: already in ctx %u\n",
+			  file_priv->ctx.id, bo->ctx->id);
+		return -EALREADY;
+	}
+
 	if (bo->flags & DRM_IVPU_BO_SHAVE_MEM)
 		range = &vdev->hw->ranges.shave;
 	else if (bo->flags & DRM_IVPU_BO_DMA_MEM)
@@ -252,47 +258,9 @@ static void ivpu_bo_free(struct drm_gem_object *obj)
 	drm_gem_shmem_free(&bo->base);
 }
 
-static const struct dma_buf_ops ivpu_bo_dmabuf_ops =  {
-	.cache_sgt_mapping = true,
-	.attach = drm_gem_map_attach,
-	.detach = drm_gem_map_detach,
-	.map_dma_buf = drm_gem_map_dma_buf,
-	.unmap_dma_buf = drm_gem_unmap_dma_buf,
-	.release = drm_gem_dmabuf_release,
-	.mmap = drm_gem_dmabuf_mmap,
-	.vmap = drm_gem_dmabuf_vmap,
-	.vunmap = drm_gem_dmabuf_vunmap,
-};
-
-static struct dma_buf *ivpu_bo_export(struct drm_gem_object *obj, int flags)
-{
-	struct drm_device *dev = obj->dev;
-	struct dma_buf_export_info exp_info = {
-		.exp_name = KBUILD_MODNAME,
-		.owner = dev->driver->fops->owner,
-		.ops = &ivpu_bo_dmabuf_ops,
-		.size = obj->size,
-		.flags = flags,
-		.priv = obj,
-		.resv = obj->resv,
-	};
-	void *sgt;
-
-	/*
-	 * Make sure that pages are allocated and dma-mapped before exporting the bo.
-	 * DMA-mapping is required if the bo will be imported to the same device.
-	 */
-	sgt = drm_gem_shmem_get_pages_sgt(to_drm_gem_shmem_obj(obj));
-	if (IS_ERR(sgt))
-		return sgt;
-
-	return drm_gem_dmabuf_export(dev, &exp_info);
-}
-
 static const struct drm_gem_object_funcs ivpu_gem_funcs = {
 	.free = ivpu_bo_free,
 	.open = ivpu_bo_open,
-	.export = ivpu_bo_export,
 	.print_info = drm_gem_shmem_object_print_info,
 	.pin = drm_gem_shmem_object_pin,
 	.unpin = drm_gem_shmem_object_unpin,
-- 
2.43.0

