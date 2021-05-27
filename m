Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C42A3938E8
	for <lists+dri-devel@lfdr.de>; Fri, 28 May 2021 01:03:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA40C6E158;
	Thu, 27 May 2021 23:03:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from aposti.net (aposti.net [89.234.176.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A21E6E158
 for <dri-devel@lists.freedesktop.org>; Thu, 27 May 2021 23:03:49 +0000 (UTC)
From: Paul Cercueil <paul@crapouillou.net>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm: Fix for GEM buffers with write-combine memory
Date: Fri, 28 May 2021 00:03:34 +0100
Message-Id: <20210527230334.151947-1-paul@crapouillou.net>
In-Reply-To: <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
References: <26b5424a-ff4c-090b-a08f-0e3e32278180@ideasonboard.com>
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
Cc: Paul Cercueil <paul@crapouillou.net>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, list@opendingux.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The previous commit wrongly assumed that dma_mmap_wc() could be replaced
by pgprot_writecombine() + dma_mmap_pages(). It did work on my setup,
but did not work everywhere.

Use dma_mmap_wc() when the buffer has the write-combine cache attribute,
and dma_mmap_pages() when it has the non-coherent cache attribute.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reported-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Fixes: cf8ccbc72d61 ("drm: Add support for GEM buffers backed by non-coherent memory")
---
 drivers/gpu/drm/drm_gem_cma_helper.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_cma_helper.c b/drivers/gpu/drm/drm_gem_cma_helper.c
index 235c7a63da2b..4c3772651954 100644
--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -514,13 +514,17 @@ int drm_gem_cma_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
 
 	cma_obj = to_drm_gem_cma_obj(obj);
 
-	vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
-	if (!cma_obj->map_noncoherent)
-		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
+	if (cma_obj->map_noncoherent) {
+		vma->vm_page_prot = vm_get_page_prot(vma->vm_flags);
+
+		ret = dma_mmap_pages(cma_obj->base.dev->dev,
+				     vma, vma->vm_end - vma->vm_start,
+				     virt_to_page(cma_obj->vaddr));
+	} else {
+		ret = dma_mmap_wc(cma_obj->base.dev->dev, vma, cma_obj->vaddr,
+				  cma_obj->paddr, vma->vm_end - vma->vm_start);
 
-	ret = dma_mmap_pages(cma_obj->base.dev->dev,
-			     vma, vma->vm_end - vma->vm_start,
-			     virt_to_page(cma_obj->vaddr));
+	}
 	if (ret)
 		drm_gem_vm_close(vma);
 
-- 
2.30.2

