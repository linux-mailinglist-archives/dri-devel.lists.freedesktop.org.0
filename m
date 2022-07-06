Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8182D56888E
	for <lists+dri-devel@lfdr.de>; Wed,  6 Jul 2022 14:44:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DA710FF52;
	Wed,  6 Jul 2022 12:44:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF20110FF50
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Jul 2022 12:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657111472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wU+mPgXw65HGfedwYwlTjGUt4b7R8HzvCYFgdfNKNEo=;
 b=NkBKmFVg0w+z7MHSuNH1wHbv0XCYuhsv3DoOslwf6O2FTH4+yC4TQFPMW2y007XjFfCddS
 KbuTks04S4t0gbwRHLZ9pCsMyVFNYpK1ZmJoXU0AhV1Mi7fXco9KBV2lUoPGl7QUuVK68Y
 kLkrNyQY2XzK+WZihThBpX/YQFjbZA8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-517-nN6-YJ5fOs-tcPRpissf1A-1; Wed, 06 Jul 2022 08:44:31 -0400
X-MC-Unique: nN6-YJ5fOs-tcPRpissf1A-1
Received: by mail-ed1-f69.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so11508153edf.7
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Jul 2022 05:44:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wU+mPgXw65HGfedwYwlTjGUt4b7R8HzvCYFgdfNKNEo=;
 b=Io9+cR3Qf/OfXijiRQHTfyg0BpsoNj8qy34yDESMd5OXxNzvycPVYh985aEMYZbMZL
 ZOBnAfZxKhP1AyCrdDAfbt+MvsILOW/jVwxoe1hVrOmo5fYF64aiCvHT/RVQeM85HkMC
 ldlqKrd2//8oy4gx156qAzSrjNsBoAR0QP4jE5NmqJnujUGwwr2mBYsIx7YBeUjC1hhn
 8wNyidhVDY244KSBRStwfHQ12llwRWtvy6S3vSAlSEFhNevKZhM0kLIJxj6GHwSQJcn9
 jhs+6RABE+ogAr5a05eVFU/YKWxSN9j9PQXhalAroht1XIOrhhPlbP7EsK4i/PLE6/sf
 QpQw==
X-Gm-Message-State: AJIora8ZMM8BX4ihIIP1d2oe0Ya+KqDlXPQdWwJ+Br7hq85GzKVewp/G
 o3Sss9sdgTaRUu0tUUW6iVQtpi4xad+xenxym923po28zhuaybVAUUaplvaw6NYUXX57Mu/p2Up
 PFPgNT4uShDlFPVbs9mPyL3k8eSBV
X-Received: by 2002:a05:6402:5510:b0:43a:76ff:b044 with SMTP id
 fi16-20020a056402551000b0043a76ffb044mr12567044edb.197.1657111469257; 
 Wed, 06 Jul 2022 05:44:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1u40FNYNqIvGE1SsdDWKUk8C5WgM7UYr8B1j+fFKny1RusJ8BB2IF70/lnOxCaE+VLbmGV/sg==
X-Received: by 2002:a05:6402:5510:b0:43a:76ff:b044 with SMTP id
 fi16-20020a056402551000b0043a76ffb044mr12567000edb.197.1657111468885; 
 Wed, 06 Jul 2022 05:44:28 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 v26-20020a170906489a00b00705f6dab05bsm17237433ejq.183.2022.07.06.05.44.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 05:44:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH v2 3/4] drm/gem: rename struct drm_gem_dma_object.{paddr =>
 dma_addr}
Date: Wed,  6 Jul 2022 14:43:51 +0200
Message-Id: <20220706124352.874528-4-dakr@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706124352.874528-1-dakr@redhat.com>
References: <20220706124352.874528-1-dakr@redhat.com>
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

Since 'paddr' is a very commonly used term and symbol name a simple regex
does not do the trick. Instead, users of the struct were fixed up
iteratively with a trial and error approach building with
`make allyesconfig && make drivers/gpu/drm`.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 .../arm/display/komeda/komeda_framebuffer.c   |  4 ++--
 drivers/gpu/drm/arm/malidp_mw.c               |  2 +-
 drivers/gpu/drm/arm/malidp_planes.c           | 12 +++++-----
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  2 +-
 drivers/gpu/drm/drm_fb_dma_helper.c           | 10 ++++----
 drivers/gpu/drm/drm_gem_dma_helper.c          | 23 +++++++++++--------
 drivers/gpu/drm/imx/ipuv3-plane.c             |  6 ++---
 drivers/gpu/drm/sprd/sprd_dpu.c               |  2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        | 14 +++++------
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        | 14 +++++------
 drivers/gpu/drm/tidss/tidss_dispc.c           | 16 ++++++-------
 drivers/gpu/drm/tiny/arcpgu.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 drivers/gpu/drm/vc4/vc4_gem.c                 |  8 +++----
 drivers/gpu/drm/vc4/vc4_irq.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               |  4 ++--
 drivers/gpu/drm/vc4/vc4_render_cl.c           | 14 +++++------
 drivers/gpu/drm/vc4/vc4_txp.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_v3d.c                 |  4 ++--
 drivers/gpu/drm/vc4/vc4_validate.c            | 12 +++++-----
 include/drm/drm_gem_dma_helper.h              |  4 ++--
 21 files changed, 81 insertions(+), 78 deletions(-)

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
index 56fc1a1e7f87..8851d294bb53 100644
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
+							 attach->dmabuf->size);
 
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

