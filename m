Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C574056A9D7
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:40:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A1E212B9C1;
	Thu,  7 Jul 2022 17:40:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 325DC1136FE
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657215636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aFFXax8J2rgI3pDmElf9QcSVZVXD94cIkwIxPc7VIz0=;
 b=Upjuh2pBZdmsHJkotJAjcdtqeDSm5fH77ugQxVDFcCxrh3yCn98KDUr90dl3A/ep6Sc4W9
 5IPQ1IC1+kmhEF2h8yEL5YTxCVoAKta4RZclE7A/aiG+v4m/AXr9zDjbnu2eJOokTEarvM
 BhDPhFejqJTf/sZttSr7utT++JTIkZY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-460-6U3Jl2DgPXaOvAjnTK-iBA-1; Thu, 07 Jul 2022 13:40:32 -0400
X-MC-Unique: 6U3Jl2DgPXaOvAjnTK-iBA-1
Received: by mail-ed1-f69.google.com with SMTP id
 x21-20020a05640226d500b00435bd7f9367so14301659edd.8
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 10:40:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aFFXax8J2rgI3pDmElf9QcSVZVXD94cIkwIxPc7VIz0=;
 b=MHFepUKIUC+RsQ8ccr7AZr2BIf5pxn46z13Ithzm6l1oNUVtRVh9uencoaB5QTAvuP
 asJeIwZFVVx+b7QVImCQOs4uvpu9udQUg1G3XIJLnDzJOOocnakrsk7pqX9zvovvq6qY
 pxYWcmdIPnMmEPN0DAX8ZUh9Avzo6NP81Ec6Nc/6aGG+4WcuVPsFHrKWrjjIDvFYeR9B
 VkvQSV0QfpHdtQu6mEiplnb+WWWLJ/Nez4w4QRAf/DzfKFTtKRVuBY3BLVFEyUWTN6ds
 aGnfPhTojM0B8Ya5z2ddmiR/BDg547iOrqwaGHbQYk2zrC0Ea9upKySnGD1xdSC8pxan
 fc0Q==
X-Gm-Message-State: AJIora/rkl73GVLb+fi8HKddsF3LKA7V/RVc1V5Ri5XttQKmn12LY/HD
 HDx+hvrrM7/i26vTmEFolzwCGlpdQbA3/Up2uKcMAsxhl9B/Zk0tKMPnPkNAaNejul9qv2bmo2R
 +aHV+H6xZ3iPFH0lrbmm5m6L/o7Y8
X-Received: by 2002:a17:907:72d5:b0:722:def3:9160 with SMTP id
 du21-20020a17090772d500b00722def39160mr46431351ejc.164.1657215629920; 
 Thu, 07 Jul 2022 10:40:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1s1FVCaEuoHFWuuoGvLxF96duqfOxWFJd6pjw/+cy6dgMSEDtpXm8MbFnxhYLEmDTyUwsS9SQ==
X-Received: by 2002:a17:907:72d5:b0:722:def3:9160 with SMTP id
 du21-20020a17090772d500b00722def39160mr46431311ejc.164.1657215629460; 
 Thu, 07 Jul 2022 10:40:29 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jp1-20020a170906f74100b006fe0abb00f0sm19092424ejb.209.2022.07.07.10.40.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:40:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH v3 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr =>
 dma_addr}
Date: Thu,  7 Jul 2022 19:40:02 +0200
Message-Id: <20220707174003.1390017-4-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220707174003.1390017-1-dakr@redhat.com>
References: <20220707174003.1390017-1-dakr@redhat.com>
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
index 0fc6c5069e00..a9a5dc40dba6 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -168,7 +168,7 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 			return -EINVAL;
 		}
 		mw_state->pitches[i] = fb->pitches[i];
-		mw_state->addrs[i] = obj->paddr + fb->offsets[i];
+		mw_state->addrs[i] = obj->dma_addr + fb->offsets[i];
 	}
 	mw_state->n_planes = n_planes;
 
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 75be194d4f13..a0fd03c428ad 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -713,7 +713,7 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 				       struct malidp_plane *mp,
 				       int plane_index)
 {
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u16 ptr;
 	struct drm_plane *plane = &mp->base;
 	bool afbc = fb->modifier ? true : false;
@@ -728,8 +728,8 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 	 * and _AD_CROP_V registers.
 	 */
 	if (!afbc) {
-		paddr = drm_fb_dma_get_gem_addr(fb, plane->state,
-						plane_index);
+		dma_addr = drm_fb_dma_get_gem_addr(fb, plane->state,
+						   plane_index);
 	} else {
 		struct drm_gem_dma_object *obj;
 
@@ -737,11 +737,11 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 
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
index a6259b7d9c1f..a0cd3757f912 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -187,7 +187,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	if (!gem)
 		return;
-	writel(gem->paddr, priv->base + CRT_ADDR);
+	writel(gem->dma_addr, priv->base + CRT_ADDR);
 }
 
 static int aspeed_gfx_enable_vblank(struct drm_simple_display_pipe *pipe)
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index d7855ced9d0c..bb6c8c547b10 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -449,7 +449,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
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
index 56fc1a1e7f87..946051a41541 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -135,11 +135,12 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 
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
@@ -221,11 +222,11 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
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
@@ -383,12 +384,12 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_get_unmapped_area);
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
@@ -415,7 +416,7 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 		return ERR_PTR(-ENOMEM);
 
 	ret = dma_get_sgtable(obj->dev->dev, sgt, dma_obj->vaddr,
-			      dma_obj->paddr, obj->size);
+			      dma_obj->dma_addr, obj->size);
 	if (ret < 0)
 		goto out;
 
@@ -460,10 +461,11 @@ drm_gem_dma_prime_import_sg_table(struct drm_device *dev,
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
@@ -526,7 +528,8 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
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
index 7614b4558393..facba62d8fa0 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -135,7 +135,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 		     DCU_LAYER_POSY(new_state->crtc_y) |
 		     DCU_LAYER_POSX(new_state->crtc_x));
 	regmap_write(fsl_dev->regmap,
-		     DCU_CTRLDESCLN(index, 3), gem->paddr);
+		     DCU_CTRLDESCLN(index, 3), gem->dma_addr);
 	regmap_write(fsl_dev->regmap, DCU_CTRLDESCLN(index, 4),
 		     DCU_LAYER_EN |
 		     DCU_LAYER_TRANS(0xff) |
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 25b717a8697e..0771408fa932 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -551,10 +551,10 @@ static void ade_rdma_set(void __iomem *base, struct drm_framebuffer *fb,
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
index fdf5ae23b15c..5cd3e624bba5 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -222,20 +222,20 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
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
index bad63e2e11b3..7bbd4b8208fa 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -131,7 +131,7 @@ drm_plane_state_to_eba(struct drm_plane_state *state, int plane)
 	dma_obj = drm_fb_dma_get_gem_obj(fb, plane);
 	BUG_ON(!dma_obj);
 
-	return dma_obj->paddr + fb->offsets[plane] + fb->pitches[plane] * y +
+	return dma_obj->dma_addr + fb->offsets[plane] + fb->pitches[plane] * y +
 	       fb->format->cpp[plane] * x;
 }
 
@@ -150,7 +150,7 @@ drm_plane_state_to_ubo(struct drm_plane_state *state)
 	x /= fb->format->hsub;
 	y /= fb->format->vsub;
 
-	return dma_obj->paddr + fb->offsets[1] + fb->pitches[1] * y +
+	return dma_obj->dma_addr + fb->offsets[1] + fb->pitches[1] * y +
 	       fb->format->cpp[1] * x - eba;
 }
 
@@ -169,7 +169,7 @@ drm_plane_state_to_vbo(struct drm_plane_state *state)
 	x /= fb->format->hsub;
 	y /= fb->format->vsub;
 
-	return dma_obj->paddr + fb->offsets[2] + fb->pitches[2] * y +
+	return dma_obj->dma_addr + fb->offsets[2] + fb->pitches[2] * y +
 	       fb->format->cpp[2] * x - eba;
 }
 
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index 03d5b8d44db6..47249effffb9 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -650,7 +650,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 	switch (priv->viu.vd1_planes) {
 	case 3:
 		gem = drm_fb_dma_get_gem_obj(fb, 2);
-		priv->viu.vd1_addr2 = gem->paddr + fb->offsets[2];
+		priv->viu.vd1_addr2 = gem->dma_addr + fb->offsets[2];
 		priv->viu.vd1_stride2 = fb->pitches[2];
 		priv->viu.vd1_height2 =
 			drm_format_info_plane_height(fb->format,
@@ -662,7 +662,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 		fallthrough;
 	case 2:
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
-		priv->viu.vd1_addr1 = gem->paddr + fb->offsets[1];
+		priv->viu.vd1_addr1 = gem->dma_addr + fb->offsets[1];
 		priv->viu.vd1_stride1 = fb->pitches[1];
 		priv->viu.vd1_height1 =
 			drm_format_info_plane_height(fb->format,
@@ -674,7 +674,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 		fallthrough;
 	case 1:
 		gem = drm_fb_dma_get_gem_obj(fb, 0);
-		priv->viu.vd1_addr0 = gem->paddr + fb->offsets[0];
+		priv->viu.vd1_addr0 = gem->dma_addr + fb->offsets[0];
 		priv->viu.vd1_stride0 = fb->pitches[0];
 		priv->viu.vd1_height0 =
 			drm_format_info_plane_height(fb->format,
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 01a6d4a6c83e..77d2644d2ac6 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -366,7 +366,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	/* Update Canvas with buffer address */
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
-	priv->viu.osd1_addr = gem->paddr;
+	priv->viu.osd1_addr = gem->dma_addr;
 	priv->viu.osd1_stride = fb->pitches[0];
 	priv->viu.osd1_height = fb->height;
 	priv->viu.osd1_width = fb->width;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 2e7571bb4f68..17739d9f8a48 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -351,7 +351,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	struct drm_bridge_state *bridge_state = NULL;
 	struct drm_device *drm = mxsfb->drm;
 	u32 bus_format = 0;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 
 	pm_runtime_get_sync(drm->dev);
 	mxsfb_enable_axi_clk(mxsfb);
@@ -387,10 +387,10 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
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
@@ -540,11 +540,11 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
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
@@ -555,11 +555,11 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
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
@@ -570,16 +570,16 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
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
index fdede5afc056..2b99094d3428 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -365,7 +365,7 @@ struct drm_gem_object *rcar_du_gem_prime_import_sg_table(struct drm_device *dev,
 		return ERR_PTR(ret);
 	}
 
-	dma_obj->paddr = 0;
+	dma_obj->dma_addr = 0;
 	dma_obj->sgt = sgt;
 
 	return gem_obj;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 30fa14224dd1..42ee1848d8ef 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -350,7 +350,7 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
 
 		for (i = 0; i < state->format->planes; ++i) {
 			gem = drm_fb_dma_get_gem_obj(fb, i);
-			dma[i] = gem->paddr + fb->offsets[i];
+			dma[i] = gem->dma_addr + fb->offsets[i];
 		}
 	} else {
 		pitch = drm_rect_width(&state->state.src) >> 16;
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 9a0477a7e07b..c16cb50a6a99 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -211,7 +211,7 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 			}
 		} else {
 			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->paddr, gem->base.size);
+					      gem->dma_addr, gem->base.size);
 			if (ret)
 				goto fail;
 		}
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 8996988f5e09..c06542297e07 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -293,13 +293,13 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 
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
index 939c2861217b..377e9003eaf5 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -45,13 +45,13 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 
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
index 5cbbf86dd509..a5700262b94e 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -340,7 +340,7 @@ static void sprd_dpu_layer(struct sprd_dpu *dpu, struct drm_plane_state *state)
 
 	for (i = 0; i < fb->format->num_planes; i++) {
 		dma_obj = drm_fb_dma_get_gem_obj(fb, i);
-		addr = dma_obj->paddr + fb->offsets[i];
+		addr = dma_obj->dma_addr + fb->offsets[i];
 
 		if (i == 0)
 			layer_reg_wr(ctx, REG_LAY_BASE_ADDR0, addr, index);
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index bdefb88b0af7..01f744a30547 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -780,11 +780,11 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 
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
 
@@ -829,7 +829,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	dev_dbg(gdp->dev, "Current NVN:0x%X\n",
 		readl(gdp->regs + GAM_GDP_NVN_OFFSET));
 	dev_dbg(gdp->dev, "Posted buff: %lx current buff: %x\n",
-		(unsigned long)dma_obj->paddr,
+		(unsigned long) dma_obj->dma_addr,
 		readl(gdp->regs + GAM_GDP_PML_OFFSET));
 
 	if (!curr_list) {
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 8433bd4d62dd..681af5feee28 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -1180,11 +1180,11 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 
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
index 59297bbcb060..ac54a6fab88a 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -328,7 +328,7 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	u32 lo_paddr, hi_paddr;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 
 	/* Set the line width */
 	DRM_DEBUG_DRIVER("Layer line width: %d bits\n", fb->pitches[0] * 8);
@@ -337,21 +337,21 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
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
index 8de9a59198e3..0f93c3aec917 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -192,7 +192,7 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	struct drm_plane_state *state = plane->state;
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u32 ch_base;
 	int bpp;
 
@@ -201,15 +201,15 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
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
@@ -217,11 +217,11 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
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
index a0a2ee9f0a47..3df15d25c3df 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -309,7 +309,7 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	const struct drm_format_info *format = fb->format;
 	struct drm_gem_dma_object *gem;
 	u32 dx, dy, src_x, src_y;
-	dma_addr_t paddr;
+	dma_addr_t dma_addr;
 	u32 ch_base;
 	int i;
 
@@ -323,10 +323,10 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 		/* Get the physical address of the buffer in memory */
 		gem = drm_fb_dma_get_gem_obj(fb, i);
 
-		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
+		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->dma_addr);
 
 		/* Compute the start of the displayed memory */
-		paddr = gem->paddr + fb->offsets[i];
+		dma_addr = gem->dma_addr + fb->offsets[i];
 
 		dx = src_x;
 		dy = src_y;
@@ -337,8 +337,8 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 		}
 
 		/* Fixup framebuffer address for src coordinates */
-		paddr += dx * format->cpp[i];
-		paddr += dy * fb->pitches[i];
+		dma_addr += dx * format->cpp[i];
+		dma_addr += dy * fb->pitches[i];
 
 		/* Set the line width */
 		DRM_DEBUG_DRIVER("Layer %d. line width: %d bytes\n",
@@ -349,12 +349,12 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
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
index 962d37aeb2b1..98bbf00e3dbf 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -1951,7 +1951,7 @@ int dispc_plane_check(struct dispc_device *dispc, u32 hw_plane,
 }
 
 static
-dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
+dma_addr_t dispc_plane_state_dma_addr(const struct drm_plane_state *state)
 {
 	struct drm_framebuffer *fb = state->fb;
 	struct drm_gem_dma_object *gem;
@@ -1960,7 +1960,7 @@ dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
 
 	gem = drm_fb_dma_get_gem_obj(state->fb, 0);
 
-	return gem->paddr + fb->offsets[0] + x * fb->format->cpp[0] +
+	return gem->dma_addr + fb->offsets[0] + x * fb->format->cpp[0] +
 		y * fb->pitches[0];
 }
 
@@ -1977,7 +1977,7 @@ dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
 
 	gem = drm_fb_dma_get_gem_obj(fb, 1);
 
-	return gem->paddr + fb->offsets[1] +
+	return gem->dma_addr + fb->offsets[1] +
 		(x * fb->format->cpp[1] / fb->format->hsub) +
 		(y * fb->pitches[1] / fb->format->vsub);
 }
@@ -1990,17 +1990,17 @@ int dispc_plane_setup(struct dispc_device *dispc, u32 hw_plane,
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
index b0c92894ba9b..ceba5e3f8331 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -69,7 +69,7 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
-	start = gem->paddr + fb->offsets[0] +
+	start = gem->dma_addr + fb->offsets[0] +
 		crtc->y * fb->pitches[0] +
 		crtc->x * fb->format->cpp[0];
 
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e9ebd22bf0c2..98d829813c0a 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -225,7 +225,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
 	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
-	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
+	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->dma_addr);
 }
 
 static const struct drm_simple_display_pipe_funcs arc_pgu_pipe_funcs = {
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index da22e1de35bc..cdbe6e7432ac 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -301,7 +301,7 @@ static void vc4_bo_purge(struct drm_gem_object *obj)
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
-	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.paddr);
+	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr);
 	bo->base.vaddr = NULL;
 	bo->madv = __VC4_MADV_PURGED;
 }
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index dbd375c89733..b7c85e47c4ed 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -126,7 +126,7 @@ vc4_get_hang_state_ioctl(struct drm_device *dev, void *data,
 			goto err_delete_handle;
 		}
 		bo_state[i].handle = handle;
-		bo_state[i].paddr = vc4_bo->base.paddr;
+		bo_state[i].paddr = vc4_bo->base.dma_addr;
 		bo_state[i].size = vc4_bo->base.base.size;
 	}
 
@@ -917,16 +917,16 @@ vc4_get_bcl(struct drm_device *dev, struct vc4_exec_info *exec)
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
index 2eacfb6773d2..8cdc26b66259 100644
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
index afb4547b48a8..8f2983a665d2 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -359,7 +359,7 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 		return ret;
 
 	for (i = 0; i < num_planes; i++)
-		vc4_state->offsets[i] = bo->paddr + fb->offsets[i];
+		vc4_state->offsets[i] = bo->dma_addr + fb->offsets[i];
 
 	/* We don't support subpixel source positioning for scaling. */
 	if ((state->src.x1 & subpixel_src_mask) ||
@@ -1221,7 +1221,7 @@ void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 	 * because this is only called on the primary plane.
 	 */
 	WARN_ON_ONCE(plane->state->crtc_x < 0 || plane->state->crtc_y < 0);
-	addr = bo->paddr + fb->offsets[0];
+	addr = bo->dma_addr + fb->offsets[0];
 
 	/* Write the new address into the hardware immediately.  The
 	 * scanout will start from this address as soon as the FIFO
diff --git a/drivers/gpu/drm/vc4/vc4_render_cl.c b/drivers/gpu/drm/vc4/vc4_render_cl.c
index c8a92023238c..1bda5010f15a 100644
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
index 03d191d3b18c..4a26f722c2a2 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -312,7 +312,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		ctrl |= TXP_ALPHA_INVERT;
 
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
-	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
+	TXP_WRITE(TXP_DST_PTR, gem->dma_addr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
 	TXP_WRITE(TXP_DIM,
 		  VC4_SET_FIELD(mode->hdisplay, TXP_WIDTH) |
diff --git a/drivers/gpu/drm/vc4/vc4_v3d.c b/drivers/gpu/drm/vc4/vc4_v3d.c
index d42fea5c0e63..c6c7c4910e2d 100644
--- a/drivers/gpu/drm/vc4/vc4_v3d.c
+++ b/drivers/gpu/drm/vc4/vc4_v3d.c
@@ -268,8 +268,8 @@ static int bin_bo_alloc(struct vc4_dev *vc4)
 		}
 
 		/* Check if this BO won't trigger the addressing bug. */
-		if ((bo->base.paddr & 0xf0000000) ==
-		    ((bo->base.paddr + bo->base.base.size - 1) & 0xf0000000)) {
+		if ((bo->base.dma_addr & 0xf0000000) ==
+		    ((bo->base.dma_addr + bo->base.base.size - 1) & 0xf0000000)) {
 			vc4->bin_bo = bo;
 
 			/* Set up for allocating 512KB chunks of
diff --git a/drivers/gpu/drm/vc4/vc4_validate.c b/drivers/gpu/drm/vc4/vc4_validate.c
index d5dc6b51ec69..520231af4df9 100644
--- a/drivers/gpu/drm/vc4/vc4_validate.c
+++ b/drivers/gpu/drm/vc4/vc4_validate.c
@@ -294,7 +294,7 @@ validate_indexed_prim_list(VALIDATE_ARGS)
 		return -EINVAL;
 	}
 
-	*(uint32_t *)(validated + 5) = ib->paddr + offset;
+	*(uint32_t *)(validated + 5) = ib->dma_addr + offset;
 
 	return 0;
 }
@@ -400,7 +400,7 @@ validate_tile_binning_config(VALIDATE_ARGS)
 	 * free when the job completes rendering.
 	 */
 	exec->bin_slots |= BIT(bin_slot);
-	bin_addr = vc4->bin_bo->base.paddr + bin_slot * vc4->bin_alloc_size;
+	bin_addr = vc4->bin_bo->base.dma_addr + bin_slot * vc4->bin_alloc_size;
 
 	/* The tile state data array is 48 bytes per tile, and we put it at
 	 * the start of a BO containing both it and the tile alloc.
@@ -608,7 +608,7 @@ reloc_tex(struct vc4_exec_info *exec,
 				  "outside of UBO\n");
 			goto fail;
 		}
-		*validated_p0 = tex->paddr + p0;
+		*validated_p0 = tex->dma_addr + p0;
 		return true;
 	}
 
@@ -736,7 +736,7 @@ reloc_tex(struct vc4_exec_info *exec,
 		offset -= level_size;
 	}
 
-	*validated_p0 = tex->paddr + p0;
+	*validated_p0 = tex->dma_addr + p0;
 
 	if (is_cs) {
 		exec->bin_dep_seqno = max(exec->bin_dep_seqno,
@@ -840,7 +840,7 @@ validate_gl_shader_rec(struct drm_device *dev,
 		void *uniform_data_u;
 		uint32_t tex, uni;
 
-		*(uint32_t *)(pkt_v + o) = bo[i]->paddr + src_offset;
+		*(uint32_t *)(pkt_v + o) = bo[i]->dma_addr + src_offset;
 
 		if (src_offset != 0) {
 			DRM_DEBUG("Shaders must be at offset 0 of "
@@ -928,7 +928,7 @@ validate_gl_shader_rec(struct drm_device *dev,
 			}
 		}
 
-		*(uint32_t *)(pkt_v + o) = vbo->paddr + offset;
+		*(uint32_t *)(pkt_v + o) = vbo->dma_addr + offset;
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 6cebe0a4a224..aa3e10eefb48 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -1098,14 +1098,14 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
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

