Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0785616F924
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:09:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1072B6E20D;
	Wed, 26 Feb 2020 08:08:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD1DF8937C
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Feb 2020 04:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1582691458; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CFJ68ft8qkdRIMc6G1Srh+NvxS7BejwewDvBTrbklnA=;
 b=yH2NZdkvLYwaL1pCuoXsr5jU8sl0LBH8AkBUKmaWwQ0iYEm4cIHG9Qu69Kw9R6wSdKM6C5
 UbVSFV28tWqRWEdWJfSEmKvmDdzmYxV/0UYDReIEM44xJ3hEOgZ1cO3XGqH6MOMUDlarJA
 WEd5AwmyUJJEsObeZFZ6as01HJljW3s=
From: Paul Cercueil <paul@crapouillou.net>
To: Daniel Vetter <daniel@ffwll.ch>,
	David Airlie <airlied@linux.ie>
Subject: [PATCH v2 3/3] gpu/drm: ingenic: Add option to mmap GEM buffers cached
Date: Wed, 26 Feb 2020 01:30:41 -0300
Message-Id: <20200226043041.289764-3-paul@crapouillou.net>
In-Reply-To: <20200226043041.289764-1-paul@crapouillou.net>
References: <20200226043041.289764-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: Paul Cercueil <paul@crapouillou.net>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ingenic SoCs are most notably used in cheap chinese handheld gaming
consoles. There, the games and applications generally render in software
directly in the emulated framebuffer using SDL1.

Since the emulated framebuffer is mapped as write-combine by default,
these applications start to run really slow as soon as alpha-blending is
used.

Add a 'cached_gem_buffers' option to the ingenic-drm driver to mmap the
GEM buffers as fully cached to address this issue.

v2: Use standard noncoherent DMA APIs

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 35 +++++++++++++++++++++++++--
 1 file changed, 33 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 3f8cc98d41fe..e51ac8d62d27 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -6,6 +6,8 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/dma-noncoherent.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -30,6 +32,11 @@
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
 
+static bool ingenic_drm_cached_gem_buf;
+module_param_named(cached_gem_buffers, ingenic_drm_cached_gem_buf, bool, 0400);
+MODULE_PARM_DESC(cached_gem_buffers,
+		 "Enable fully cached GEM buffers [default=false]");
+
 #define JZ_REG_LCD_CFG				0x00
 #define JZ_REG_LCD_VSYNC			0x04
 #define JZ_REG_LCD_HSYNC			0x08
@@ -379,15 +386,23 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct drm_plane_state *state = plane->state;
 	unsigned int width, height, cpp;
 	dma_addr_t addr;
+	uint32_t len;
 
 	if (state && state->fb) {
 		addr = drm_fb_cma_get_gem_addr(state->fb, state, 0);
+
 		width = state->src_w >> 16;
 		height = state->src_h >> 16;
 		cpp = state->fb->format->cpp[plane->index];
+		len = width * height * cpp;
+
+		if (ingenic_drm_cached_gem_buf) {
+			dma_cache_sync(priv->dev, phys_to_virt(addr),
+				       len, DMA_TO_DEVICE);
+		}
 
 		priv->dma_hwdesc->addr = addr;
-		priv->dma_hwdesc->cmd = width * height * cpp / 4;
+		priv->dma_hwdesc->cmd = len / 4;
 		priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
 	}
 }
@@ -532,6 +547,22 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 
 DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
 
+static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
+				struct vm_area_struct *vma)
+{
+	struct drm_gem_cma_object *cma_obj = to_drm_gem_cma_obj(obj);
+	struct ingenic_drm *priv = drm_device_get_priv(obj->dev);
+	unsigned long attrs = DMA_ATTR_NON_CONSISTENT;
+
+	if (!ingenic_drm_cached_gem_buf)
+		return drm_gem_cma_prime_mmap(obj, vma);
+
+	vma->vm_page_prot = dma_pgprot(priv->dev, vma->vm_page_prot, attrs);
+
+	return dma_mmap_attrs(priv->dev, vma, cma_obj->vaddr, cma_obj->paddr,
+			      vma->vm_end - vma->vm_start, attrs);
+}
+
 static struct drm_driver ingenic_drm_driver_data = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name			= "ingenic-drm",
@@ -553,7 +584,7 @@ static struct drm_driver ingenic_drm_driver_data = {
 	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
 	.gem_prime_vmap		= drm_gem_cma_prime_vmap,
 	.gem_prime_vunmap	= drm_gem_cma_prime_vunmap,
-	.gem_prime_mmap		= drm_gem_cma_prime_mmap,
+	.gem_prime_mmap		= ingenic_drm_gem_mmap,
 
 	.irq_handler		= ingenic_drm_irq_handler,
 	.release		= ingenic_drm_release,
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
