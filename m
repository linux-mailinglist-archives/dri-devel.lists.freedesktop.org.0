Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA68E160D13
	for <lists+dri-devel@lfdr.de>; Mon, 17 Feb 2020 09:22:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8A836E8D1;
	Mon, 17 Feb 2020 08:20:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from crapouillou.net (outils.crapouillou.net [89.234.176.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 277CE89BF4
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Feb 2020 15:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net;
 s=mail; t=1581868716; h=from:from:sender:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hWPKAL7VcHZ83Yyg4q/gc+lgP9ejC9vw1JF+fldF7vg=;
 b=mSQz1x2zNZR9tW3vDl2l/CW/QWQGhWT9kP0iAPvo5LjtrZkvO4BOzyIgyisyq4csCYqTFW
 fyEC600I1QLJQ+TUIElJEFv3ty6gXotRMGKPGBZZeOXAa6jm6ROwnNgyt8JuSzKT9BL9v7
 gFbEK+iRhmRsTxEoZDeJnjVzNV4lZyw=
From: Paul Cercueil <paul@crapouillou.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 3/3] gpu/drm: ingenic: Add option to mmap GEM buffers cached
Date: Sun, 16 Feb 2020 12:58:11 -0300
Message-Id: <20200216155811.68463-3-paul@crapouillou.net>
In-Reply-To: <20200216155811.68463-1-paul@crapouillou.net>
References: <20200216155811.68463-1-paul@crapouillou.net>
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 17 Feb 2020 08:20:47 +0000
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

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---
 drivers/gpu/drm/ingenic/ingenic-drm.c | 41 +++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm.c b/drivers/gpu/drm/ingenic/ingenic-drm.c
index 9aa88fabbd2a..31f0346b55f0 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm.c
@@ -6,6 +6,7 @@
 
 #include <linux/clk.h>
 #include <linux/dma-mapping.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
@@ -30,6 +31,11 @@
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
@@ -378,16 +384,25 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 	struct ingenic_drm *priv = drm_plane_get_priv(plane);
 	struct drm_plane_state *state = plane->state;
 	unsigned int width, height, cpp;
+	unsigned long virt_addr;
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
+			virt_addr = (unsigned long)phys_to_virt(addr);
+			dma_cache_wback_inv(virt_addr, len);
+		}
 
 		priv->dma_hwdesc->addr = addr;
-		priv->dma_hwdesc->cmd = width * height * cpp / 4;
+		priv->dma_hwdesc->cmd = len / 4;
 		priv->dma_hwdesc->cmd |= JZ_LCD_CMD_EOF_IRQ;
 	}
 }
@@ -533,6 +548,28 @@ static void ingenic_drm_disable_vblank(struct drm_crtc *crtc)
 
 DEFINE_DRM_GEM_CMA_FOPS(ingenic_drm_fops);
 
+static int ingenic_drm_gem_mmap(struct drm_gem_object *obj,
+				struct vm_area_struct *vma)
+{
+	unsigned long start, off;
+
+	if (!ingenic_drm_cached_gem_buf)
+		return drm_gem_cma_prime_mmap(obj, vma);
+
+	off = vma->vm_pgoff << PAGE_SHIFT;
+	start = to_drm_gem_cma_obj(obj)->paddr;
+
+	off += start;
+
+	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
+	pgprot_val(vma->vm_page_prot) &= ~_CACHE_MASK;
+	pgprot_val(vma->vm_page_prot) |= _CACHE_CACHABLE_NONCOHERENT;
+
+	return io_remap_pfn_range(vma, vma->vm_start, off >> PAGE_SHIFT,
+				  vma->vm_end - vma->vm_start,
+				  vma->vm_page_prot);
+}
+
 static struct drm_driver ingenic_drm_driver_data = {
 	.driver_features	= DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 	.name			= "ingenic-drm",
@@ -554,7 +591,7 @@ static struct drm_driver ingenic_drm_driver_data = {
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
