Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5BF88252B0
	for <lists+dri-devel@lfdr.de>; Fri,  5 Jan 2024 12:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B006A10E5D8;
	Fri,  5 Jan 2024 11:22:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56BF510E5D8
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Jan 2024 11:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704453756; x=1735989756;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sPUAaaf3LerwMJ12lWX/WxCMZQfD4w4jzBbiKkPslow=;
 b=jrIoZpHYRNaF3xDkQziwg58rpYQYRcsib81zZrngCMnwZAAYvThG7F3M
 THgDq7OmO6Y+TQ812B3g/14SEBs3hLRqFsd7r8j2L9ydeLD1FCV6NOu5b
 EAArom1J70v0cjPynBbu8/NYAA2zZ0MFpCr0QU0rZS+roeCwDrnBBgQYD
 ChQrdlNCnF7aUKdU2c7gQ0nz/sQ+KWyxCLKRiwpsL2gIFBwf6Lj6pUVsP
 i8gg/6JdvKrK0gzCgR+kV+9m2v3Yt+MbeHCz+ylb8tshPqRtw4q/Zo+H7
 QRIxhuIjgLVn2KIZOZ+my+iM8ZhSS1E39ajPGKjGay+g7EYzsLThwsmyk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4255452"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="4255452"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="756918741"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; d="scan'208";a="756918741"
Received: from jlawryno.igk.intel.com ([10.91.220.59])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jan 2024 03:22:34 -0800
From: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/10] accel/ivpu: Disable buffer sharing among VPU contexts
Date: Fri,  5 Jan 2024 12:22:16 +0100
Message-ID: <20240105112218.351265-9-jacek.lawrynowicz@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
References: <20240105112218.351265-1-jacek.lawrynowicz@linux.intel.com>
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
Cc: quic_jhugo@quicinc.com,
 Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This was not supported properly. A buffer was imported to another VPU
context as a separate buffer object with duplicated sgt.
Both exported and imported buffers could be DMA mapped causing a double
mapping on the same device.

Imported buffer from another VPU context will now have just reference
increased and there will be a single sgt fixing above problem but
buffers still can't be shared among VPU contexts because each context
have its own MMU mapping and ivpu_bo supports only single MMU mapping.

The solution would be to use a mapping list as in panfrost or etnaviv
drivers and it will be implemented in future if required.

Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
---
 drivers/accel/ivpu/ivpu_gem.c | 44 +++++------------------------------
 1 file changed, 6 insertions(+), 38 deletions(-)

diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
index 4de454bfbf91..8cb4d337552e 100644
--- a/drivers/accel/ivpu/ivpu_gem.c
+++ b/drivers/accel/ivpu/ivpu_gem.c
@@ -222,6 +222,12 @@ static int ivpu_bo_open(struct drm_gem_object *obj, struct drm_file *file)
 	struct ivpu_bo *bo = to_ivpu_bo(obj);
 	struct ivpu_addr_range *range;
 
+	if (bo->ctx) {
+		ivpu_warn(vdev, "Can't add BO (vpu_addr 0x%llx) to ctx %u: already in ctx %u\n",
+			  bo->vpu_addr, file_priv->ctx.id, bo->ctx->id);
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

