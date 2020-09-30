Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64D27FB48
	for <lists+dri-devel@lfdr.de>; Thu,  1 Oct 2020 10:16:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D096E876;
	Thu,  1 Oct 2020 08:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA8D26E5BD
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Sep 2020 17:17:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1601486221; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MXd9FesjqBdfbqp1WDnMgZQG0KSCw8ALHirqsj8ZIvU=;
 b=Q1M8TCreSMw4TEd/wVmYXUwXkzJWC/396oJNC4iYtdLXeXIX61dDCkObyoa5q4mgf1/JFq
 tyix7UkRyRWzxk5pe34OdvxuB2Axya0XEnpgBhz8Oa8Bj0lZEwFc6LZ5n3yqpss4kAAzwE
 rhzoJB7K3N5mZJenx1iM9S34L9Wg4tY=
From: Paul Cercueil <paul@crapouillou.net>
To: Christoph Hellwig <hch@lst.de>
Subject: [PATCH 3/3] drm/ingenic: Alloc cached GEM buffers with
 dma_alloc_noncoherent
Date: Wed, 30 Sep 2020 19:16:44 +0200
Message-Id: <20200930171644.299363-3-paul@crapouillou.net>
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

It turns out that if you want to mmap GEM buffers fully cached, then
they should be allocated as such as well. Who would have known?

Introduce a custom .dumb_create callback, that will behave just like
drm_gem_cma_dumb_create(), except that it will allocate the GEM buffer
using dma_alloc_noncoherent() if non-coherent memory is what we want.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 48 ++++++++++++++++++++++-
 1 file changed, 47 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 07a1da7266e4..8ece269c040f 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -794,6 +794,52 @@ static int ingenic_drm_gem_cma_mmap(struct file *filp,
 	return ingenic_drm_gem_mmap(vma->vm_private_data, vma);
 }
 
+static int ingenic_drm_gem_cma_dumb_create(struct drm_file *file_priv,
+					   struct drm_device *drm,
+					   struct drm_mode_create_dumb *args)
+{
+	/*
+	 * This is basically a copy of drm_gem_cma_dumb_create, which supports
+	 * creating fully cached GEM buffers.
+	 */
+	struct drm_gem_cma_object *cma_obj;
+	struct drm_gem_object *gem_obj;
+	size_t size;
+	int ret;
+
+	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
+	args->size = args->pitch * args->height;
+
+	size = PAGE_ALIGN(args->size);
+
+	cma_obj = drm_gem_cma_create_noalloc(drm, size);
+	if (IS_ERR(cma_obj))
+		return PTR_ERR(cma_obj);
+
+	if (ingenic_drm_cached_gem_buf) {
+		cma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
+						       &cma_obj->paddr,
+						       DMA_TO_DEVICE,
+						       GFP_KERNEL | __GFP_NOWARN);
+	} else {
+		cma_obj->vaddr = dma_alloc_wc(drm->dev, size, &cma_obj->paddr,
+					      GFP_KERNEL | __GFP_NOWARN);
+	}
+	if (!cma_obj->vaddr) {
+		dev_err(drm->dev, "Failed to allocate buffer with size %zu\n", size);
+		ret = -ENOMEM;
+		goto out_gem_object_put;
+	}
+
+	gem_obj = &cma_obj->base;
+
+	ret = drm_gem_handle_create(file_priv, gem_obj, &args->handle);
+
+out_gem_object_put:
+	drm_gem_object_put(gem_obj);
+	return ret;
+}
+
 static const struct file_operations ingenic_drm_fops = {
 	.owner		= THIS_MODULE,
 	.open		= drm_open,
@@ -816,7 +862,7 @@ static struct drm_driver ingenic_drm_driver_data = {
 	.patchlevel		= 0,
 
 	.fops			= &ingenic_drm_fops,
-	DRM_GEM_CMA_DRIVER_OPS,
+	DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE(ingenic_drm_gem_cma_dumb_create),
 
 	.irq_handler		= ingenic_drm_irq_handler,
 };
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
