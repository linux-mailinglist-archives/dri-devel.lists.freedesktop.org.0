Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5D4572217
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 20:02:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C083A959CC;
	Tue, 12 Jul 2022 18:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3D4B959D3
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 18:02:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657648919;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C5OGZ54BkukpL4sAN9zdgjqecv26RItadgoQAxP4YCk=;
 b=TEG+zszTaShT3RZ1Nebpr9uIy0nZXPnycwc85XgOPGWJpbhEnzl1HXMssacc28wMBA98lB
 TOHv1O0vhjqAXhwKT1mCLTjwwW681pqrdjLQwQSR8FoSVZD/SXe0C/sK7viav84IMNuKde
 Y5kuXy6Cth4Z6d0VHZYBl7IY8nwyZK4=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-397-k0gYzsrfP9O7yVOxSCzWGA-1; Tue, 12 Jul 2022 14:01:56 -0400
X-MC-Unique: k0gYzsrfP9O7yVOxSCzWGA-1
Received: by mail-ej1-f72.google.com with SMTP id
 qk18-20020a1709077f9200b0072b95d9eea3so13663ejc.4
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 11:01:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=C5OGZ54BkukpL4sAN9zdgjqecv26RItadgoQAxP4YCk=;
 b=WL83YOTS/M0a0Q6FCzVerkluiHm70J5s7/FOeNNt51VlFwUN0xlXsvSHkHkUa6sEZm
 9oz7D457+dbE0V4X2HuwLVOVdX0HgfkGlSr/7bD27AcjcWC1P5NZ34nK6qs5vEJAIByp
 5jh2gut5FCwnMFCrJRos6qjPQ8ef1Js2VYXCIhv6+piO+67Jv8ZD4mR90tgQwmKPsQec
 TiyMJXcXFnHfZbdNx1Sk2/VB8CHgjL6iOBkCOsVFL+JVnNMSvvYB2dLZpRKIv5iKEQcM
 sPxJSHQFNmGNAYTX1s8n2EZFuw3detUvaLvjMZI/glInh+RinLM18kKpr108gaW1RG8U
 +rsQ==
X-Gm-Message-State: AJIora/fhOmxKNea/YPOWnrL4vRN7+swacslwnO81/5bNa6yXdItjRqx
 /9uzMv294rszUi2NHNo3mX4cap7cQNp5QRwB7Kqr+BFlo/e1uG0NJTzeMTeC/uJ7jXe4n/qSGt1
 RvHwq8MxXYQnSOhITSERxhlW5ES7y
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id
 b10-20020a056402084a00b00426262d967emr32669162edz.286.1657648913629; 
 Tue, 12 Jul 2022 11:01:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tSZKaugVspWHi8401WA4aNhu4MK80wmcE70XZ/PjDNG4mBqhg1yChb50Gxnz4DgNLv3Ta4vA==
X-Received: by 2002:a05:6402:84a:b0:426:262d:967e with SMTP id
 b10-20020a056402084a00b00426262d967emr32669081edz.286.1657648913145; 
 Tue, 12 Jul 2022 11:01:53 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b0072b1bb3cc08sm4028352ejb.120.2022.07.12.11.01.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 11:01:52 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH drm-misc-next v4 3/4] drm/gem: rename struct
 drm_gem_dma_object.{paddr => dma_addr}
Date: Tue, 12 Jul 2022 20:01:38 +0200
Message-Id: <20220712180139.1886590-4-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220712180139.1886590-1-dakr@redhat.com>
References: <20220712180139.1886590-1-dakr@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dakr@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
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
Cc: Danilo Krummrich <dakr@redhat.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The field paddr of struct drm_gem_dma_object holds a DMA address, which
might actually be a physical address. However, depending on the platform,
it can also be a bus address or a virtual address managed by an IOMMU.

Hence, rename the field to dma_addr, which is more applicable.

In order to do this renaming the following coccinelle script was used:

```
	@@
	struct drm_gem_dma_object *gem;
	@@

	- gem->paddr
	+ gem->dma_addr

	@@
	struct drm_gem_dma_object gem;
	@@

	- gem.paddr
	+ gem.dma_addr

	@exists@
	typedef dma_addr_t;
	symbol paddr;
	@@

	dma_addr_t paddr;
	<...
	- paddr
	+ dma_addr
	...>

	@@
	symbol paddr;
	@@
	dma_addr_t
	- paddr
	+ dma_addr
	;

```

This patch is compile-time tested with:

```
	make ARCH={x86_64,arm,arm64} allyesconfig
	make ARCH={x86_64,arm,arm64} drivers/gpu/drm`
```

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   |  4 +--
 drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
 drivers/gpu/drm/arm/malidp_planes.c           | 12 ++++----
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  2 +-
 drivers/gpu/drm/drm_fb_dma_helper.c           | 10 +++----
 drivers/gpu/drm/drm_gem_dma_helper.c          | 23 +++++++-------
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  2 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  4 +--
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  6 ++--
 drivers/gpu/drm/imx/ipuv3-plane.c             |  6 ++--
 drivers/gpu/drm/meson/meson_overlay.c         |  6 ++--
 drivers/gpu/drm/meson/meson_plane.c           |  2 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             | 30 +++++++++----------
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  2 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  4 +--
 drivers/gpu/drm/shmobile/shmob_drm_plane.c    |  4 +--
 drivers/gpu/drm/sprd/sprd_dpu.c               |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  6 ++--
 drivers/gpu/drm/sti/sti_hqvdp.c               |  6 ++--
 drivers/gpu/drm/sun4i/sun4i_backend.c         | 12 ++++----
 drivers/gpu/drm/sun4i/sun4i_frontend.c        | 22 +++++++-------
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        | 14 ++++-----
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 14 ++++-----
 drivers/gpu/drm/tidss/tidss_dispc.c           | 16 +++++-----
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  2 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |  8 ++---
 drivers/gpu/drm/vc4/vc4_irq.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  4 +--
 drivers/gpu/drm/vc4/vc4_render_cl.c           | 14 ++++-----
 drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 +--
 drivers/gpu/drm/vc4/vc4_validate.c            | 12 ++++----
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  6 ++--
 include/drm/drm_gem_dma_helper.h              |  4 +--
 39 files changed, 142 insertions(+), 137 deletions(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index f1b27db5dad5..df5da5a44755 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -137,7 +137,7 @@ komeda_fb_none_afbc_size_check(struct komeda_dev *mdev, struct komeda_fb *kfb,
 		}
 
 		min_size = komeda_fb_get_pixel_addr(kfb, 0, fb->height, i)
-			 - to_drm_gem_dma_obj(obj)->paddr;
+			 - to_drm_gem_dma_obj(obj)->dma_addr;
 		if (obj->size < min_size) {
 			DRM_DEBUG_KMS("The fb->obj[%d] size: 0x%zx lower than the minimum requirement: 0x%llx.\n",
 				      i, obj->size, min_size);
@@ -260,7 +260,7 @@ komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 			+ plane_y * fb->pitches[plane];
 	}
 
-	return obj->paddr + offset;
+	return obj->dma_addr + offset;
 }
 
 /* if the fb can be supported by a specific layer */
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index cefae03f1bcc..ef76d0e6ee2f 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -170,7 +170,7 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 			return -EINVAL;
 		}
 		mw_state->pitches[i] = fb->pitches[i];
-		mw_state->addrs[i] = obj->paddr + fb->offsets[i];
+		mw_state->addrs[i] = obj->dma_addr + fb->offsets[i];
 	}
 	mw_state->n_planes = n_planes;
 
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 898b15d3bd70..1e0ef40f78db 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -715,7 +715,7 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 				       struct malidp_plane *mp,
 				       int plane_index)
 {
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u16 ptr;
 	struct drm_plane *plane = &mp->base;
 	bool afbc = fb->modifier ? true : false;
@@ -730,8 +730,8 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 	 * and _AD_CROP_V registers.
 	 */
 	if (!afbc) {
-		paddr = drm_fb_dma_get_gem_addr(fb, plane->state,
-						plane_index);
+		dma_addr = drm_fb_dma_get_gem_addr(fb, plane->state,
+						   plane_index);
 	} else {
 		struct drm_gem_dma_object *obj;
 
@@ -739,11 +739,11 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 
 		if (WARN_ON(!obj))
 			return;
-		paddr = obj->paddr;
+		dma_addr = obj->dma_addr;
 	}
 
-	malidp_hw_write(mp->hwdev, lower_32_bits(paddr), ptr);
-	malidp_hw_write(mp->hwdev, upper_32_bits(paddr), ptr + 4);
+	malidp_hw_write(mp->hwdev, lower_32_bits(dma_addr), ptr);
+	malidp_hw_write(mp->hwdev, upper_32_bits(dma_addr), ptr + 4);
 }
 
 static void malidp_de_set_plane_afbc(struct drm_plane *plane)
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index 996b03bac87f..55a3444a51d8 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -188,7 +188,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	if (!gem)
 		return;
-	writel(gem->paddr, priv->base + CRT_ADDR);
+	writel(gem->dma_addr, priv->base + CRT_ADDR);
 }
 
 static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 733101031e86..57ea569d5d2b 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -451,7 +451,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 	for (i = 0; i < state->nplanes; i++) {
 		struct drm_gem_dma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
 
-		state->dscrs[i]->addr = gem->paddr + state->offsets[i];
+		state->dscrs[i]->addr = gem->dma_addr + state->offsets[i];
 
 		atmel_hlcdc_layer_write_reg(&plane->layer,
 					    ATMEL_HLCDC_LAYER_PLANE_HEAD(i),
diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index b601073c22de..3b535ad1b07c 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -72,7 +72,7 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   unsigned int plane)
 {
 	struct drm_gem_dma_object *obj;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u8 h_div = 1, v_div = 1;
 	u32 block_w = drm_format_info_block_width(fb->format, plane);
 	u32 block_h = drm_format_info_block_height(fb->format, plane);
@@ -86,7 +86,7 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 	if (!obj)
 		return 0;
 
-	paddr = obj->paddr + fb->offsets[plane];
+	dma_addr = obj->dma_addr + fb->offsets[plane];
 
 	if (plane > 0) {
 		h_div = fb->format->hsub;
@@ -98,10 +98,10 @@ dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 	block_start_y = (sample_y / block_h) * block_h;
 	num_hblocks = sample_x / block_w;
 
-	paddr += fb->pitches[plane] * block_start_y;
-	paddr += block_size * num_hblocks;
+	dma_addr += fb->pitches[plane] * block_start_y;
+	dma_addr += block_size * num_hblocks;
 
-	return paddr;
+	return dma_addr;
 }
 EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index f1780c01c928..f6901ff97bbb 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -145,11 +145,12 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 
 	if (dma_obj->map_noncoherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
-						       &dma_obj->paddr,
+						       &dma_obj->dma_addr,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm->dev, size, &dma_obj->paddr,
+		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
+					      &dma_obj->dma_addr,
 					      GFP_KERNEL | __GFP_NOWARN);
 	}
 	if (!dma_obj->vaddr) {
@@ -234,11 +235,11 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 	} else if (dma_obj->vaddr) {
 		if (dma_obj->map_noncoherent)
 			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
-					     dma_obj->vaddr, dma_obj->paddr,
+					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
 			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
-				    dma_obj->vaddr, dma_obj->paddr);
+				    dma_obj->vaddr, dma_obj->dma_addr);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -396,12 +397,12 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_get_unmapped_area);
  * @p: DRM printer
  * @indent: Tab indentation level
  *
- * This function prints paddr and vaddr for use in e.g. debugfs output.
+ * This function prints dma_addr and vaddr for use in e.g. debugfs output.
  */
 void drm_gem_dma_print_info(const struct drm_gem_dma_object *dma_obj,
 			    struct drm_printer *p, unsigned int indent)
 {
-	drm_printf_indent(p, indent, "paddr=%pad\n", &dma_obj->paddr);
+	drm_printf_indent(p, indent, "dma_addr=%pad\n", &dma_obj->dma_addr);
 	drm_printf_indent(p, indent, "vaddr=%p\n", dma_obj->vaddr);
 }
 EXPORT_SYMBOL(drm_gem_dma_print_info);
@@ -428,7 +429,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 		return ERR_PTR(-ENOMEM);
 
 	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
-			      dma_obj->paddr, obj->size);
+			      dma_obj->dma_addr, obj->size);
 	if (ret < 0)
 		goto out;
 
@@ -473,10 +474,11 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
 	if (IS_ERR(dma_obj))
 		return ERR_CAST(dma_obj);
 
-	dma_obj->paddr = sg_dma_address(sgt->sgl);
+	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
 	dma_obj->sgt = sgt;
 
-	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->paddr, attach->dmabuf->size);
+	DRM_DEBUG_PRIME("dma_addr = %pad, size = %zu\n", &dma_obj->dma_addr,
+			attach->dmabuf->size);
 
 	return &dma_obj->base;
 }
@@ -539,7 +541,8 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 				     virt_to_page(dma_obj->vaddr));
 	} else {
 		ret = dma_mmap_wc(dma_obj->base.dev->dev, vma, dma_obj->vaddr,
-				  dma_obj->paddr, vma->vm_end - vma->vm_start);
+				  dma_obj->dma_addr,
+				  vma->vm_end - vma->vm_start);
 	}
 	if (ret)
 		drm_gem_vm_close(vma);
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index dd58b3f491dc..4176c32fa70f 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -136,7 +136,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 		     DCU_LAYER_POSY(new_state->crtc_y) |
 		     DCU_LAYER_POSX(new_state->crtc_x));
 	regmap_write(fsl_dev->regmap,
-		     DCU_CTRLDESCLN(index, 3), gem->paddr);
+		     DCU_CTRLDESCLN(index, 3), gem->dma_addr);
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4),
 		     DCU_LAYER_EN |
 		     DCU_LAYER_TRANS(0xff) |
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 49d93a020a62..96dd06c1e2f9 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -552,10 +552,10 @@ static void ade_rdma_set(void __iomem *base, struct drm_framebuffer *fb,
 	struct drm_gem_dma_object *obj = drm_fb_dma_get_gem_obj(fb, 0);
 	u32 reg_ctrl, reg_addr, reg_size, reg_stride, reg_space, reg_en;
 	u32 stride = fb->pitches[0];
-	u32 addr = (u32)obj->paddr + y * stride;
+	u32 addr = (u32) obj->dma_addr + y * stride;
 
 	DRM_DEBUG_DRIVER("rdma%d: (y=%d, height=%d), stride=%d, paddr=0x%x\n",
-			 ch + 1, y, in_h, stride, (u32)obj->paddr);
+			 ch + 1, y, in_h, stride, (u32) obj->dma_addr);
 	DRM_DEBUG_DRIVER("addr=0x%x, fb:%dx%d, pixel_format=%d(%p4cc)\n",
 			 addr, fb->width, fb->height, fmt,
 			 &fb->format->format);
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index 4c41c93ac900..ab6d32bad756 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -224,20 +224,20 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	if (!format->is_yuv ||
 	    format->format == DRM_FORMAT_NV12 ||
 	    format->format == DRM_FORMAT_NV21)
-		p1_ba = dma_obj->paddr + fb->offsets[0] +
+		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
 			fb->pitches[0] * (state->src.y1 >> 16) +
 			format->char_per_block[0] * (state->src.x1 >> 16);
 	else if (format->format == DRM_FORMAT_UYVY ||
 		 format->format == DRM_FORMAT_VYUY ||
 		 format->format == DRM_FORMAT_YUYV ||
 		 format->format == DRM_FORMAT_YVYU)
-		p1_ba = dma_obj->paddr + fb->offsets[0] +
+		p1_ba = dma_obj->dma_addr + fb->offsets[0] +
 			fb->pitches[0] * (state->src.y1 >> 16) +
 			2 * format->char_per_block[0] * (state->src.x1 >> 17);
 
 	if (format->format == DRM_FORMAT_NV12 ||
 	    format->format == DRM_FORMAT_NV21)
-		p2_ba = dma_obj->paddr + fb->offsets[1] +
+		p2_ba = dma_obj->dma_addr + fb->offsets[1] +
 			(((fb->pitches[1] >> 1) * (state->src.y1 >> 17) +
 			(state->src.x1 >> 17)) << 1);
 
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index 82a7524b11e7..2954248122cc 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -133,7 +133,7 @@ drm_plane_state_to_eba(struct drm_plane_state *state, int plane)
 	dma_obj = drm_fb_dma_get_gem_obj(fb, plane);
 	BUG_ON(!dma_obj);
 
-	return dma_obj->paddr + fb->offsets[plane] + fb->pitches[plane] * y +
+	return dma_obj->dma_addr + fb->offsets[plane] + fb->pitches[plane] * y +
 	       fb->format->cpp[plane] * x;
 }
 
@@ -152,7 +152,7 @@ drm_plane_state_to_ubo(struct drm_plane_state *state)
 	x /= fb->format->hsub;
 	y /= fb->format->vsub;
 
-	return dma_obj->paddr + fb->offsets[1] + fb->pitches[1] * y +
+	return dma_obj->dma_addr + fb->offsets[1] + fb->pitches[1] * y +
 	       fb->format->cpp[1] * x - eba;
 }
 
@@ -171,7 +171,7 @@ drm_plane_state_to_vbo(struct drm_plane_state *state)
 	x /= fb->format->hsub;
 	y /= fb->format->vsub;
 
-	return dma_obj->paddr + fb->offsets[2] + fb->pitches[2] * y +
+	return dma_obj->dma_addr + fb->offsets[2] + fb->pitches[2] * y +
 	       fb->format->cpp[2] * x - eba;
 }
 
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 187d8337455c..c04dc1a8d47a 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -652,7 +652,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	switch (priv->viu.vd1_planes) {
 	case 3:
 		gem = drm_fb_dma_get_gem_obj(fb, 2);
-		priv->viu.vd1_addr2 = gem->paddr + fb->offsets[2];
+		priv->viu.vd1_addr2 = gem->dma_addr + fb->offsets[2];
 		priv->viu.vd1_stride2 = fb->pitches[2];
 		priv->viu.vd1_height2 =
 			drm_format_info_plane_height(fb->format,
@@ -664,7 +664,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 		fallthrough;
 	case 2:
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
-		priv->viu.vd1_addr1 = gem->paddr + fb->offsets[1];
+		priv->viu.vd1_addr1 = gem->dma_addr + fb->offsets[1];
 		priv->viu.vd1_stride1 = fb->pitches[1];
 		priv->viu.vd1_height1 =
 			drm_format_info_plane_height(fb->format,
@@ -676,7 +676,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 		fallthrough;
 	case 1:
 		gem = drm_fb_dma_get_gem_obj(fb, 0);
-		priv->viu.vd1_addr0 = gem->paddr + fb->offsets[0];
+		priv->viu.vd1_addr0 = gem->dma_addr + fb->offsets[0];
 		priv->viu.vd1_stride0 = fb->pitches[0];
 		priv->viu.vd1_height0 =
 			drm_format_info_plane_height(fb->format,
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index cadfb3c0603b..554afa1bb1c1 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -368,7 +368,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	/* Update Canvas with buffer address */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
-	priv->viu.osd1_addr = gem->paddr;
+	priv->viu.osd1_addr = gem->dma_addr;
 	priv->viu.osd1_stride = fb->pitches[0];
 	priv->viu.osd1_height = fb->height;
 	priv->viu.osd1_width = fb->width;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index d9955f849692..ae90911c4347 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -353,7 +353,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 
 	pm_runtime_get_sync(drm->dev);
 	mxsfb_enable_axi_clk(mxsfb);
@@ -389,10 +389,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
-	if (paddr) {
-		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
-		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
+	dma_addr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	if (dma_addr) {
+		writel(dma_addr, mxsfb->base + mxsfb->devdata->cur_buf);
+		writel(dma_addr, mxsfb->base + mxsfb->devdata->next_buf);
 	}
 
 	mxsfb_enable_controller(mxsfb);
@@ -542,11 +542,11 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    plane);
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 
-	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
-	if (paddr)
-		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
+	dma_addr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	if (dma_addr)
+		writel(dma_addr, mxsfb->base + mxsfb->devdata->next_buf);
 }
 
 static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
@@ -557,11 +557,11 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	struct drm_plane_state *new_pstate = drm_atomic_get_new_plane_state(state,
 									    plane);
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u32 ctrl;
 
-	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
-	if (!paddr) {
+	dma_addr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	if (!dma_addr) {
 		writel(0, mxsfb->base + LCDC_AS_CTRL);
 		return;
 	}
@@ -572,16 +572,16 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	 * is understood, live with the 16 initial invalid pixels on the first
 	 * line and start 64 bytes within the framebuffer.
 	 */
-	paddr += 64;
+	dma_addr += 64;
 
-	writel(paddr, mxsfb->base + LCDC_AS_NEXT_BUF);
+	writel(dma_addr, mxsfb->base + LCDC_AS_NEXT_BUF);
 
 	/*
 	 * If the plane was previously disabled, write LCDC_AS_BUF as well to
 	 * provide the first buffer.
 	 */
 	if (!old_pstate->fb)
-		writel(paddr, mxsfb->base + LCDC_AS_BUF);
+		writel(dma_addr, mxsfb->base + LCDC_AS_BUF);
 
 	ctrl = AS_CTRL_AS_ENABLE | AS_CTRL_ALPHA(255);
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 3cd01f3829db..2032127cc015 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -366,7 +366,7 @@ struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	dma_obj->paddr = 0;
+	dma_obj->dma_addr = 0;
 	dma_obj->sgt = sgt;
 
 	return gem_obj;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 155bd4fadbd8..fb4a1cec183c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -352,7 +352,7 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
 
 		for (i = 0; i < state->format->planes; ++i) {
 			gem = drm_fb_dma_get_gem_obj(fb, i);
-			dma[i] = gem->paddr + fb->offsets[i];
+			dma[i] = gem->dma_addr + fb->offsets[i];
 		}
 	} else {
 		pitch = drm_rect_width(&state->state.src) >> 16;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index fc8715d68957..ce3908348309 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -213,7 +213,7 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			}
 		} else {
 			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->paddr, gem->base.size);
+					      gem->dma_addr, gem->base.size);
 			if (ret)
 				goto fail;
 		}
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index fdadea7d4793..dad1998720af 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -294,13 +294,13 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 
 	bpp = scrtc->format->yuv ? 8 : scrtc->format->bpp;
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	scrtc->dma[0] = gem->paddr + fb->offsets[0]
+	scrtc->dma[0] = gem->dma_addr + fb->offsets[0]
 		      + y * fb->pitches[0] + x * bpp / 8;
 
 	if (scrtc->format->yuv) {
 		bpp = scrtc->format->bpp - 8;
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
-		scrtc->dma[1] = gem->paddr + fb->offsets[1]
+		scrtc->dma[1] = gem->dma_addr + fb->offsets[1]
 			      + y / (bpp == 4 ? 2 : 1) * fb->pitches[1]
 			      + x * (bpp == 16 ? 2 : 1);
 	}
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 6d167e858d86..54228424793a 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -46,13 +46,13 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 
 	bpp = splane->format->yuv ? 8 : splane->format->bpp;
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	splane->dma[0] = gem->paddr + fb->offsets[0]
+	splane->dma[0] = gem->dma_addr + fb->offsets[0]
 		       + y * fb->pitches[0] + x * bpp / 8;
 
 	if (splane->format->yuv) {
 		bpp = splane->format->bpp - 8;
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
-		splane->dma[1] = gem->paddr + fb->offsets[1]
+		splane->dma[1] = gem->dma_addr + fb->offsets[1]
 			       + y / (bpp == 4 ? 2 : 1) * fb->pitches[1]
 			       + x * (bpp == 16 ? 2 : 1);
 	}
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index d9ed71a14478..63b4172e6d11 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -342,7 +342,7 @@ static void sprd_dpu_layer(struct sprd_dpu *dpu, struct drm_plane_state *state)
 
 	for (i = 0; i < fb->format->num_planes; i++) {
 		dma_obj = drm_fb_dma_get_gem_obj(fb, i);
-		addr = dma_obj->paddr + fb->offsets[i];
+		addr = dma_obj->dma_addr + fb->offsets[i];
 
 		if (i == 0)
 			layer_reg_wr(ctx, REG_LAY_BASE_ADDR0, addr, index);
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index 3ce9d4992176..43c72c2604a0 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -782,11 +782,11 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 
 	DRM_DEBUG_DRIVER("drm FB:%d format:%.4s phys@:0x%lx\n", fb->base.id,
 			 (char *)&fb->format->format,
-			 (unsigned long)dma_obj->paddr);
+			 (unsigned long) dma_obj->dma_addr);
 
 	/* pixel memory location */
 	bpp = fb->format->cpp[0];
-	top_field->gam_gdp_pml = (u32)dma_obj->paddr + fb->offsets[0];
+	top_field->gam_gdp_pml = (u32) dma_obj->dma_addr + fb->offsets[0];
 	top_field->gam_gdp_pml += src_x * bpp;
 	top_field->gam_gdp_pml += src_y * fb->pitches[0];
 
@@ -831,7 +831,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	dev_dbg(gdp->dev, "Current NVN:0x%X\n",
 		readl(gdp->regs + GAM_GDP_NVN_OFFSET));
 	dev_dbg(gdp->dev, "Posted buff: %lx current buff: %x\n",
-		(unsigned long)dma_obj->paddr,
+		(unsigned long) dma_obj->dma_addr,
 		readl(gdp->regs + GAM_GDP_PML_OFFSET));
 
 	if (!curr_list) {
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index ee274140274d..02b77279f6e4 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1182,11 +1182,11 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 
 	DRM_DEBUG_DRIVER("drm FB:%d format:%.4s phys@:0x%lx\n", fb->base.id,
 			 (char *)&fb->format->format,
-			 (unsigned long)dma_obj->paddr);
+			 (unsigned long) dma_obj->dma_addr);
 
 	/* Buffer planes address */
-	cmd->top.current_luma = (u32)dma_obj->paddr + fb->offsets[0];
-	cmd->top.current_chroma = (u32)dma_obj->paddr + fb->offsets[1];
+	cmd->top.current_luma = (u32) dma_obj->dma_addr + fb->offsets[0];
+	cmd->top.current_chroma = (u32) dma_obj->dma_addr + fb->offsets[1];
 
 	/* Pitches */
 	cmd->top.luma_processed_pitch = fb->pitches[0];
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 1fffb9568317..b75ccbaa5002 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -330,7 +330,7 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	u32 lo_paddr, hi_paddr;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bits\n", fb->pitches[0] * 8);
@@ -339,21 +339,21 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 		     fb->pitches[0] * 8);
 
 	/* Get the start of the displayed memory */
-	paddr = drm_fb_dma_get_gem_addr(fb, state, 0);
-	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
+	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &dma_addr);
 
 	if (fb->format->is_yuv)
-		return sun4i_backend_update_yuv_buffer(backend, fb, paddr);
+		return sun4i_backend_update_yuv_buffer(backend, fb, dma_addr);
 
 	/* Write the 32 lower bits of the address (in bits) */
-	lo_paddr = paddr << 3;
+	lo_paddr = dma_addr << 3;
 	DRM_DEBUG_DRIVER("Setting address lower bits to 0x%x\n", lo_paddr);
 	regmap_write(backend->engine.regs,
 		     SUN4I_BACKEND_LAYFB_L32ADD_REG(layer),
 		     lo_paddr);
 
 	/* And the upper bits */
-	hi_paddr = paddr >> 29;
+	hi_paddr = dma_addr >> 29;
 	DRM_DEBUG_DRIVER("Setting address high bits to 0x%x\n", hi_paddr);
 	regmap_update_bits(backend->engine.regs, SUN4I_BACKEND_LAYFB_H4ADD_REG,
 			   SUN4I_BACKEND_LAYFB_H4ADD_MSK(layer),
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index baeeda04691f..799ab7460ae5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -160,7 +160,7 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 	struct drm_framebuffer *fb = state->fb;
 	unsigned int strides[3] = {};
 
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	bool swap;
 
 	if (fb->modifier == DRM_FORMAT_MOD_ALLWINNER_TILED) {
@@ -221,22 +221,24 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 	swap = sun4i_frontend_format_chroma_requires_swap(fb->format->format);
 
 	/* Set the physical address of the buffer in memory */
-	paddr = drm_fb_dma_get_gem_addr(fb, state, 0);
-	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &paddr);
-	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, paddr);
+	dma_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
+	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &dma_addr);
+	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, dma_addr);
 
 	if (fb->format->num_planes > 1) {
-		paddr = drm_fb_dma_get_gem_addr(fb, state, swap ? 2 : 1);
-		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n", &paddr);
+		dma_addr = drm_fb_dma_get_gem_addr(fb, state, swap ? 2 : 1);
+		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n",
+				 &dma_addr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR1_REG,
-			     paddr);
+			     dma_addr);
 	}
 
 	if (fb->format->num_planes > 2) {
-		paddr = drm_fb_dma_get_gem_addr(fb, state, swap ? 1 : 2);
-		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n", &paddr);
+		dma_addr = drm_fb_dma_get_gem_addr(fb, state, swap ? 1 : 2);
+		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n",
+				 &dma_addr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR2_REG,
-			     paddr);
+			     dma_addr);
 	}
 }
 EXPORT_SYMBOL(sun4i_frontend_update_buffer);
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 7d05809bbbce..e2a0675bb49e 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -194,7 +194,7 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u32 ch_base;
 	int bpp;
 
@@ -203,15 +203,15 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	/* Get the physical address of the buffer in memory */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
-	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
+	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
 
 	/* Compute the start of the displayed memory */
 	bpp = fb->format->cpp[0];
-	paddr = gem->paddr + fb->offsets[0];
+	dma_addr = gem->dma_addr + fb->offsets[0];
 
 	/* Fixup framebuffer address for src coordinates */
-	paddr += (state->src.x1 >> 16) * bpp;
-	paddr += (state->src.y1 >> 16) * fb->pitches[0];
+	dma_addr += (state->src.x1 >> 16) * bpp;
+	dma_addr += (state->src.y1 >> 16) * fb->pitches[0];
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bytes\n", fb->pitches[0]);
@@ -219,11 +219,11 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 		     SUN8I_MIXER_CHAN_UI_LAYER_PITCH(ch_base, overlay),
 		     fb->pitches[0]);
 
-	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
+	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &dma_addr);
 
 	regmap_write(mixer->engine.regs,
 		     SUN8I_MIXER_CHAN_UI_LAYER_TOP_LADDR(ch_base, overlay),
-		     lower_32_bits(paddr));
+		     lower_32_bits(dma_addr));
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 84cc96302e69..385069f6f247 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -311,7 +311,7 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *gem;
 	u32 dx, dy, src_x, src_y;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
@@ -325,10 +325,10 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 		/* Get the physical address of the buffer in memory */
 		gem = drm_fb_dma_get_gem_obj(fb, i);
 
-		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
+		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
 
 		/* Compute the start of the displayed memory */
-		paddr = gem->paddr + fb->offsets[i];
+		dma_addr = gem->dma_addr + fb->offsets[i];
 
 		dx = src_x;
 		dy = src_y;
@@ -339,8 +339,8 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 		}
 
 		/* Fixup framebuffer address for src coordinates */
-		paddr += dx * format->cpp[i];
-		paddr += dy * fb->pitches[i];
+		dma_addr += dx * format->cpp[i];
+		dma_addr += dy * fb->pitches[i];
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
@@ -351,12 +351,12 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 			     fb->pitches[i]);
 
 		DRM_DEBUG_DRIVER("Setting %d. buffer address to %pad\n",
-				 i + 1, &paddr);
+				 i + 1, &dma_addr);
 
 		regmap_write(mixer->engine.regs,
 			     SUN8I_MIXER_CHAN_VI_LAYER_TOP_LADDR(ch_base,
 								 overlay, i),
-			     lower_32_bits(paddr));
+			     lower_32_bits(dma_addr));
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index 6f3fa37b9ca0..ad93acc9abd2 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1954,7 +1954,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 }
 
 static
-dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
+dma_addr_t dispc_plane_state_dma_addr(const struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
@@ -1963,7 +1963,7 @@ dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
 
 	gem = drm_fb_dma_get_gem_obj(state->fb, 0);
 
-	return gem->paddr + fb->offsets[0] + x * fb->format->cpp[0] +
+	return gem->dma_addr + fb->offsets[0] + x * fb->format->cpp[0] +
 		y * fb->pitches[0];
 }
 
@@ -1980,7 +1980,7 @@ dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
 
 	gem = drm_fb_dma_get_gem_obj(fb, 1);
 
-	return gem->paddr + fb->offsets[1] +
+	return gem->dma_addr + fb->offsets[1] +
 		(x * fb->format->cpp[1] / fb->format->hsub) +
 		(y * fb->pitches[1] / fb->format->vsub);
 }
@@ -1993,17 +1993,17 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
 	u32 fourcc = state->fb->format->format;
 	u16 cpp = state->fb->format->cpp[0];
 	u32 fb_width = state->fb->pitches[0] / cpp;
-	dma_addr_t paddr = dispc_plane_state_paddr(state);
+	dma_addr_t dma_addr = dispc_plane_state_dma_addr(state);
 	struct dispc_scaling_params scale;
 
 	dispc_vid_calc_scaling(dispc, state, &scale, lite);
 
 	dispc_plane_set_pixel_format(dispc, hw_plane, fourcc);
 
-	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_0, paddr & 0xffffffff);
-	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_0, (u64)paddr >> 32);
-	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_1, paddr & 0xffffffff);
-	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_1, (u64)paddr >> 32);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_0, dma_addr & 0xffffffff);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_0, (u64)dma_addr >> 32);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_1, dma_addr & 0xffffffff);
+	dispc_vid_write(dispc, hw_plane, DISPC_VID_BA_EXT_1, (u64)dma_addr >> 32);
 
 	dispc_vid_write(dispc, hw_plane, DISPC_VID_PICTURE_SIZE,
 			(scale.in_w - 1) | ((scale.in_h - 1) << 16));
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 9034b9778539..b5f60b2b2d0e 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -70,7 +70,7 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
-	start = gem->paddr + fb->offsets[0] +
+	start = gem->dma_addr + fb->offsets[0] +
 		crtc->y * fb->pitches[0] +
 		crtc->x * fb->format->cpp[0];
 
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 21d9e0bd67ba..bb302a3fd6b5 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -227,7 +227,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
 	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
-	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
+	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
 static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index 93af99de397f..d17272889727 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -297,7 +297,7 @@ static void vc4_bo_purge(struct drm_gem_object *obj)
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
-	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.paddr);
+	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr);
 	bo->base.vaddr = NULL;
 	bo->madv = __VC4_MADV_PURGED;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index d9a19204e944..950f799ba605 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -123,7 +123,7 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 			goto err_delete_handle;
 		}
 		bo_state[i].handle = handle;
-		bo_state[i].paddr = vc4_bo->base.paddr;
+		bo_state[i].paddr = vc4_bo->base.dma_addr;
 		bo_state[i].size = vc4_bo->base.base.size;
 	}
 
@@ -902,16 +902,16 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
 	list_add_tail(&to_vc4_bo(&exec->exec_bo->base)->unref_head,
 		      &exec->unref_list);
 
-	exec->ct0ca = exec->exec_bo->paddr + bin_offset;
+	exec->ct0ca = exec->exec_bo->dma_addr + bin_offset;
 
 	exec->bin_u = bin;
 
 	exec->shader_rec_v = exec->exec_bo->vaddr + shader_rec_offset;
-	exec->shader_rec_p = exec->exec_bo->paddr + shader_rec_offset;
+	exec->shader_rec_p = exec->exec_bo->dma_addr + shader_rec_offset;
 	exec->shader_rec_size = args->shader_rec_size;
 
 	exec->uniforms_v = exec->exec_bo->vaddr + uniforms_offset;
-	exec->uniforms_p = exec->exec_bo->paddr + uniforms_offset;
+	exec->uniforms_p = exec->exec_bo->dma_addr + uniforms_offset;
 	exec->uniforms_size = args->uniforms_size;
 
 	ret = vc4_validate_bin_cl(dev,
diff --git a/drivers/gpu/drm/vc4/vc4_irq.c b/drivers/gpu/drm/vc4/vc4_irq.c
index 4342fb43e8c1..f3a71932736d 100644
--- a/drivers/gpu/drm/vc4/vc4_irq.c
+++ b/drivers/gpu/drm/vc4/vc4_irq.c
@@ -105,7 +105,7 @@ vc4_overflow_mem_work(struct work_struct *work)
 	}
 	vc4->bin_alloc_overflow = BIT(bin_bo_slot);
 
-	V3D_WRITE(V3D_BPOA, bo->base.paddr + bin_bo_slot * vc4->bin_alloc_size);
+	V3D_WRITE(V3D_BPOA, bo->base.dma_addr + bin_bo_slot * vc4->bin_alloc_size);
 	V3D_WRITE(V3D_BPOS, bo->base.base.size);
 	V3D_WRITE(V3D_INTCTL, V3D_INT_OUTOMEM);
 	V3D_WRITE(V3D_INTENA, V3D_INT_OUTOMEM);
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index ad188cbf213d..fb9fcde28b72 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -360,7 +360,7 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 		return ret;
 
 	for (i = 0; i < num_planes; i++)
-		vc4_state->offsets[i] = bo->paddr + fb->offsets[i];
+		vc4_state->offsets[i] = bo->dma_addr + fb->offsets[i];
 
 	/*
 	 * We don't support subpixel source positioning for scaling,
@@ -1251,7 +1251,7 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	 * because this is only called on the primary plane.
 	 */
 	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
-	addr = bo->paddr + fb->offsets[0];
+	addr = bo->dma_addr + fb->offsets[0];
 
 	/* Write the new address into the hardware immediately.  The
 	 * scanout will start from this address as soon as the FIFO
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index de1c6425513d..e69c6d1d9185 100644
--- a/drivers/gpu/drm/vc4/vc4_render_cl.c
+++ b/drivers/gpu/drm/vc4/vc4_render_cl.c
@@ -101,7 +101,7 @@ static uint32_t vc4_full_res_offset(struct vc4_exec_info *exec,
 				    struct drm_vc4_submit_rcl_surface *surf,
 				    uint8_t x, uint8_t y)
 {
-	return bo->paddr + surf->offset + VC4_TILE_BUFFER_SIZE *
+	return bo->dma_addr + surf->offset + VC4_TILE_BUFFER_SIZE *
 		(DIV_ROUND_UP(exec->args->width, 32) * y + x);
 }
 
@@ -142,7 +142,7 @@ static void emit_tile(struct vc4_exec_info *exec,
 		} else {
 			rcl_u8(setup, VC4_PACKET_LOAD_TILE_BUFFER_GENERAL);
 			rcl_u16(setup, args->color_read.bits);
-			rcl_u32(setup, setup->color_read->paddr +
+			rcl_u32(setup, setup->color_read->dma_addr +
 				args->color_read.offset);
 		}
 	}
@@ -164,7 +164,7 @@ static void emit_tile(struct vc4_exec_info *exec,
 		} else {
 			rcl_u8(setup, VC4_PACKET_LOAD_TILE_BUFFER_GENERAL);
 			rcl_u16(setup, args->zs_read.bits);
-			rcl_u32(setup, setup->zs_read->paddr +
+			rcl_u32(setup, setup->zs_read->dma_addr +
 				args->zs_read.offset);
 		}
 	}
@@ -232,7 +232,7 @@ static void emit_tile(struct vc4_exec_info *exec,
 			(last_tile_write ?
 			 0 : VC4_STORE_TILE_BUFFER_DISABLE_COLOR_CLEAR));
 		rcl_u32(setup,
-			(setup->zs_write->paddr + args->zs_write.offset) |
+			(setup->zs_write->dma_addr + args->zs_write.offset) |
 			((last && last_tile_write) ?
 			 VC4_LOADSTORE_TILE_BUFFER_EOF : 0));
 	}
@@ -355,7 +355,7 @@ static int vc4_create_rcl_bo(struct drm_device *dev, struct vc4_exec_info *exec,
 
 	rcl_u8(setup, VC4_PACKET_TILE_RENDERING_MODE_CONFIG);
 	rcl_u32(setup,
-		(setup->color_write ? (setup->color_write->paddr +
+		(setup->color_write ? (setup->color_write->dma_addr +
 				       args->color_write.offset) :
 		 0));
 	rcl_u16(setup, args->width);
@@ -374,8 +374,8 @@ static int vc4_create_rcl_bo(struct drm_device *dev, struct vc4_exec_info *exec,
 	}
 
 	BUG_ON(setup->next_offset != size);
-	exec->ct1ca = setup->rcl->paddr;
-	exec->ct1ea = setup->rcl->paddr + setup->next_offset;
+	exec->ct1ca = setup->rcl->dma_addr;
+	exec->ct1ea = setup->rcl->dma_addr + setup->next_offset;
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index c96a7bf18c60..36e79864ba6c 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -313,7 +313,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		ctrl |= TXP_ALPHA_INVERT;
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
+	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
 	TXP_WRITE(TXP_DIM,
 		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index 7976aa10aff6..1864c92f3c85 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -259,8 +259,8 @@ static int bin_bo_alloc(struct vc4_dev *vc4)
 		}
 
 		/* Check if this BO won't trigger the addressing bug. */
-		if ((bo->base.paddr & 0xf0000000) ==
-		    ((bo->base.paddr + bo->base.base.size - 1) & 0xf0000000)) {
+		if ((bo->base.dma_addr & 0xf0000000) ==
+		    ((bo->base.dma_addr + bo->base.base.size - 1) & 0xf0000000)) {
 			vc4->bin_bo = bo;
 
 			/* Set up for allocating 512KB chunks of
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index f016615d4dbc..fdefcd7c1117 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -286,7 +286,7 @@ validate_indexed_prim_list(VALIDATE_ARGS)
 		return -EINVAL;
 	}
 
-	*(uint32_t *)(validated + 5) = ib->paddr + offset;
+	*(uint32_t *)(validated + 5) = ib->dma_addr + offset;
 
 	return 0;
 }
@@ -392,7 +392,7 @@ validate_tile_binning_config(VALIDATE_ARGS)
 	 * free when the job completes rendering.
 	 */
 	exec->bin_slots |= BIT(bin_slot);
-	bin_addr = vc4->bin_bo->base.paddr + bin_slot * vc4->bin_alloc_size;
+	bin_addr = vc4->bin_bo->base.dma_addr + bin_slot * vc4->bin_alloc_size;
 
 	/* The tile state data array is 48 bytes per tile, and we put it at
 	 * the start of a BO containing both it and the tile alloc.
@@ -596,7 +596,7 @@ reloc_tex(struct vc4_exec_info *exec,
 				  "outside of UBO\n");
 			goto fail;
 		}
-		*validated_p0 = tex->paddr + p0;
+		*validated_p0 = tex->dma_addr + p0;
 		return true;
 	}
 
@@ -724,7 +724,7 @@ reloc_tex(struct vc4_exec_info *exec,
 		offset -= level_size;
 	}
 
-	*validated_p0 = tex->paddr + p0;
+	*validated_p0 = tex->dma_addr + p0;
 
 	if (is_cs) {
 		exec->bin_dep_seqno = max(exec->bin_dep_seqno,
@@ -828,7 +828,7 @@ validate_gl_shader_rec(struct drm_device *dev,
 		void *uniform_data_u;
 		uint32_t tex, uni;
 
-		*(uint32_t *)(pkt_v + o) = bo[i]->paddr + src_offset;
+		*(uint32_t *)(pkt_v + o) = bo[i]->dma_addr + src_offset;
 
 		if (src_offset != 0) {
 			DRM_DEBUG("Shaders must be at offset 0 of "
@@ -916,7 +916,7 @@ validate_gl_shader_rec(struct drm_device *dev,
 			}
 		}
 
-		*(uint32_t *)(pkt_v + o) = vbo->paddr + offset;
+		*(uint32_t *)(pkt_v + o) = vbo->dma_addr + offset;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 3d93f0985ea8..f0bb3c0e4123 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1099,14 +1099,14 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
 		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
 		struct dma_async_tx_descriptor *desc;
-		dma_addr_t paddr;
+		dma_addr_t dma_addr;
 
-		paddr = drm_fb_dma_get_gem_addr(state->fb, state, i);
+		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
 		dma->sgl.size = width * info->cpp[i];
 		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
-		dma->xt.src_start = paddr;
+		dma->xt.src_start = dma_addr;
 		dma->xt.frame_size = 1;
 		dma->xt.dir = DMA_MEM_TO_DEV;
 		dma->xt.src_sgl = true;
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index 82805069b37a..8a043235dad8 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -11,7 +11,7 @@ struct drm_mode_create_dumb;
 /**
  * struct drm_gem_dma_object - GEM object backed by DMA memory allocations
  * @base: base GEM object
- * @paddr: DMA address of the backing memory
+ * @dma_addr: DMA address of the backing memory
  * @sgt: scatter/gather table for imported PRIME buffers. The table can have
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
@@ -20,7 +20,7 @@ struct drm_mode_create_dumb;
  */
 struct drm_gem_dma_object {
 	struct drm_gem_object base;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	struct sg_table *sgt;
 
 	/* For objects with DMA memory allocated by GEM DMA */
-- 
2.36.1

