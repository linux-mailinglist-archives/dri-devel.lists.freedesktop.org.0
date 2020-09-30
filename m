Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39D9527FB4F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B0FA56E161;
	Thu,  1 Oct 2020 08:15:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B88936E7D1
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 17:17:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601486219; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pIdTpoIPruFr7zDIb5GEOw9aXWxj4OPiHxHv5ba4g4M=;
 b=OsmF8Szlaf1dkvepalM6e6Wg9Av0V4QRmzmc4gtuZGzQgljOp2uaP/tpzHshzIdOzpy3xt
 BZwh6RSsb/u80Di9iucXTw/aoKPwww71tbT5kOhmLhvVmhxSnhzErpgtv+fIG0T+M/KDzQ
 C9rg6fxTyXIAiGBmhz6S+sPSucmC3UU=
From: Paul Cercueil <paul@crapouillou.net>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 2/3] drm/ingenic: Update code to mmap GEM buffers cached
Date: Wed, 30 Sep 2020 19:16:43 +0200
Message-Id: <20200930171644.299363-2-paul@crapouillou.net>
In-Reply-To: <20200930165212.GA8833@lst.de>
References: <20200930165212.GA8833@lst.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Oct 2020 08:15:43 +0000
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
Cc: Stephen Rothwell <sfr@canb.auug.org.au>, Dave Airlie <airlied@linux.ie>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>, Paul Cercueil <paul@crapouillou.net>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DMA API changed at the same time commit 37054fc81443 ("gpu/drm:
ingenic: Add option to mmap GEM buffers cached") was added. Rework the
code to work with the new DMA API.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 24 +++++++----------------
 1 file changed, 7 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 0225dc1f5eb8..07a1da7266e4 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -526,12 +526,10 @@ void ingenic_drm_sync_data(struct device *dev,
 			   struct drm_plane_state *state)
 {
 	const struct drm_format_info *finfo = state->fb->format;
-	struct ingenic_drm *priv = dev_get_drvdata(dev);
 	struct drm_atomic_helper_damage_iter iter;
 	unsigned int offset, i;
 	struct drm_rect clip;
 	dma_addr_t paddr;
-	void *addr;
 
 	if (!ingenic_drm_cached_gem_buf)
 		return;
@@ -541,12 +539,11 @@ void ingenic_drm_sync_data(struct device *dev,
 	drm_atomic_for_each_plane_damage(&iter, &clip) {
 		for (i = 0; i < finfo->num_planes; i++) {
 			paddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
-			addr = phys_to_virt(paddr);
 
 			/* Ignore x1/x2 values, invalidate complete lines */
 			offset = clip.y1 * state->fb->pitches[i];
 
-			dma_cache_sync(priv->dev, addr + offset,
+			dma_sync_single_for_device(dev, paddr + offset,
 				       (clip.y2 - clip.y1) * state->fb->pitches[i],
 				       DMA_TO_DEVICE);
 		}
@@ -766,14 +763,6 @@ static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
 				struct vm_area_struct *vma)
 {
 	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
-	struct device *dev = cma_obj->base.dev->dev;
-	unsigned long attrs;
-	int ret;
-
-	if (ingenic_drm_cached_gem_buf)
-		attrs = DMA_ATTR_NON_CONSISTENT;
-	else
-		attrs = DMA_ATTR_WRITE_COMBINE;
 
 	/*
 	 * Clear the VM_PFNMAP flag that was set by drm_gem_mmap(), and set the
@@ -784,12 +773,13 @@ static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
 	vma->vm_pgoff = 0;
 	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
 
-	ret = dma_mmap_attrs(dev, vma, cma_obj->vaddr, cma_obj->paddr,
-			     vma->vm_end - vma->vm_start, attrs);
-	if (ret)
-		drm_gem_vm_close(vma);
+	if (!ingenic_drm_cached_gem_buf)
+		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
 
-	return ret;
+	return remap_pfn_range(vma, vma->vm_start,
+			       cma_obj->paddr >> PAGE_SHIFT,
+			       vma->vm_end - vma->vm_start,
+			       vma->vm_page_prot);
 }
 
 static int ingenic_drm_gem_cma_mmap(struct file *filp,
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
