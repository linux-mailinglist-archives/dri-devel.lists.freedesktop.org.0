Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2131D572214
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 20:01:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DC71959D5;
	Tue, 12 Jul 2022 18:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FF0D959CC
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 18:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657648912;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j0PXG4DHt3OX0/LlUePdx+5WwZT67OQtdeBafIuSrsc=;
 b=G5GikWAG/n1sQj0+IG2BmhVj2Hz5OWqHSdaCVA5HIY/TRbYasA4mJqT5BMVc+PFexpx+PE
 lZdbmaUt0CUH6tlj3pbCET+LaDWoZfbPZYqj4ULbbyzPdzMYm3go6PSqIGFEsGIhtuRPMU
 y0T/MM1rmkOASus0XVXa6p6TzxiPazU=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-373-2bm36BnMOFm4yhTcxpcJPg-1; Tue, 12 Jul 2022 14:01:50 -0400
X-MC-Unique: 2bm36BnMOFm4yhTcxpcJPg-1
Received: by mail-ej1-f71.google.com with SMTP id
 sd24-20020a1709076e1800b0072b582293c2so2234988ejc.0
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 11:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=j0PXG4DHt3OX0/LlUePdx+5WwZT67OQtdeBafIuSrsc=;
 b=4KoTRz3iWcZPJux0MrPdcNB1Hge8cuZmB89vnguDhd7pAZx6QG7zx+lqaxbjrK/C0a
 kMnaZlS9sKpBwGyYQ+0S6rn//+hwFaytsdG7cggZHeN2P6TxnCY/RMtRWZp6xdBCegnt
 00eQgA6xRrjugduANvG93Eh3nMBSmzM9gqZ7v6CvdthESjZ0EG7btkjOrFz2H5iKy9R2
 sK6h15MpHWyawfJwu3LSL72/HxaTf5Caz/HPIMsV3sKeWkex6SZyDeV+H9crVKCVwDAm
 53kZcXrFrR1z6qL1TTDHimsCJlz7omOAfSRk1lAYuCCfkk+Qa22U7ZmEkV47iIvtnrAN
 8hgA==
X-Gm-Message-State: AJIora/Zogwvbul+EErFgff/OLfKLFPOzuDKsLKkfPxosRMDap6ImPpu
 xEHUWVhdFZIS7Slf/pVm/KLjqJ/sfcpcoJowBZScVRPL6/p6PHEmdGbSzHLzWHxi/i/CuuAy8XM
 Lh7iQoEjgfwOYUS3LkNdhg3IX/k5W
X-Received: by 2002:a05:6402:4016:b0:43a:f310:9522 with SMTP id
 d22-20020a056402401600b0043af3109522mr4350139eda.200.1657648908530; 
 Tue, 12 Jul 2022 11:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t54Q94mpxONjgYvuUZqNtwv/0mD6y76/fWDVPQwhVdGQgV6DeBDWFTJYd2kG+NpDecGiGdpw==
X-Received: by 2002:a05:6402:4016:b0:43a:f310:9522 with SMTP id
 d22-20020a056402401600b0043af3109522mr4350057eda.200.1657648907750; 
 Tue, 12 Jul 2022 11:01:47 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 gx16-20020a170906f1d000b0072b1bb3cc08sm4028352ejb.120.2022.07.12.11.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Jul 2022 11:01:47 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH drm-misc-next v4 1/4] drm/fb: rename FB CMA helpers to FB DMA
 helpers
Date: Tue, 12 Jul 2022 20:01:36 +0200
Message-Id: <20220712180139.1886590-2-dakr@redhat.com>
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

Rename "FB CMA" helpers to "FB DMA" helpers - considering the hierarchy
of APIs (mm/cma -> dma -> fb dma) calling them "FB DMA" seems to be
more applicable.

Besides that, commit e57924d4ae80 ("drm/doc: Task to rename CMA helpers")
requests to rename the CMA helpers and implies that people seem to be
confused about the naming.

In order to do this renaming the following script was used:

```
	#!/bin/bash

	DIRS="drivers/gpu include/drm Documentation/gpu"

	REGEX_SYM_UPPER="[0-9A-Z_\-]"
	REGEX_SYM_LOWER="[0-9a-z_\-]"

	REGEX_GREP_UPPER="(${REGEX_SYM_UPPER}*)(FB)_CMA_(${REGEX_SYM_UPPER}*)"
	REGEX_GREP_LOWER="(${REGEX_SYM_LOWER}*)(fb)_cma_(${REGEX_SYM_LOWER}*)"

	REGEX_SED_UPPER="s/${REGEX_GREP_UPPER}/\1\2_DMA_\3/g"
	REGEX_SED_LOWER="s/${REGEX_GREP_LOWER}/\1\2_dma_\3/g"

	# Find all upper case 'CMA' symbols and replace them with 'DMA'.
	for ff in $(grep -REHl "${REGEX_GREP_UPPER}" $DIRS)
	do
	       sed -i -E "$REGEX_SED_UPPER" $ff
	done

	# Find all lower case 'cma' symbols and replace them with 'dma'.
	for ff in $(grep -REHl "${REGEX_GREP_LOWER}" $DIRS)
	do
	       sed -i -E "$REGEX_SED_LOWER" $ff
	done

	# Replace all occurrences of 'CMA' / 'cma' in comments and
	# documentation files with 'DMA' / 'dma'.
	for ff in $(grep -RiHl " cma " $DIRS)
	do
		sed -i -E "s/ cma / dma /g" $ff
		sed -i -E "s/ CMA / DMA /g" $ff
	done
```

Only a few more manual modifications were needed, e.g. reverting the
following modifications in some DRM Kconfig files

    -       select CMA if HAVE_DMA_CONTIGUOUS
    +       select DMA if HAVE_DMA_CONTIGUOUS

as well as manually picking the occurrences of 'CMA'/'cma' in comments and
documentation which relate to "FB CMA", but not "GEM CMA".

This patch is compile-time tested building a x86_64 kernel with
`make allyesconfig && make drivers/gpu/drm`.

Acked-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 Documentation/gpu/drm-kms-helpers.rst         |  8 ++--
 drivers/gpu/drm/Makefile                      |  2 +-
 .../arm/display/komeda/komeda_framebuffer.c   |  4 +-
 drivers/gpu/drm/arm/hdlcd_crtc.c              |  4 +-
 drivers/gpu/drm/arm/hdlcd_drv.c               |  2 +-
 drivers/gpu/drm/arm/malidp_drv.c              |  2 +-
 drivers/gpu/drm/arm/malidp_mw.c               |  4 +-
 drivers/gpu/drm/arm/malidp_planes.c           |  8 ++--
 drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c      |  4 +-
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c       |  2 +-
 .../gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c   |  4 +-
 ...rm_fb_cma_helper.c => drm_fb_dma_helper.c} | 43 +++++++++++--------
 drivers/gpu/drm/drm_format_helper.c           |  4 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c     |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c     |  2 +-
 drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c   |  4 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_ade.c   |  4 +-
 .../gpu/drm/hisilicon/kirin/kirin_drm_drv.c   |  2 +-
 drivers/gpu/drm/imx/dcss/dcss-plane.c         |  6 +--
 drivers/gpu/drm/imx/imx-drm-core.c            |  2 +-
 drivers/gpu/drm/imx/ipuv3-crtc.c              |  2 +-
 drivers/gpu/drm/imx/ipuv3-plane.c             |  8 ++--
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c     |  6 +--
 drivers/gpu/drm/ingenic/ingenic-ipu.c         | 10 ++---
 drivers/gpu/drm/kmb/kmb_plane.c               |  8 ++--
 drivers/gpu/drm/logicvc/logicvc_layer.c       |  6 +--
 drivers/gpu/drm/logicvc/logicvc_mode.c        |  2 +-
 drivers/gpu/drm/mcde/mcde_display.c           |  6 +--
 drivers/gpu/drm/mcde/mcde_drv.c               |  4 +-
 drivers/gpu/drm/meson/meson_overlay.c         |  8 ++--
 drivers/gpu/drm/meson/meson_plane.c           |  4 +-
 drivers/gpu/drm/mxsfb/lcdif_kms.c             |  6 +--
 drivers/gpu/drm/mxsfb/mxsfb_kms.c             |  8 ++--
 drivers/gpu/drm/pl111/pl111_display.c         |  6 +--
 drivers/gpu/drm/pl111/pl111_drv.c             |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c        |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_drv.c         |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_kms.c         |  2 +-
 drivers/gpu/drm/rcar-du/rcar_du_plane.c       |  4 +-
 drivers/gpu/drm/rcar-du/rcar_du_vsp.c         |  4 +-
 drivers/gpu/drm/shmobile/shmob_drm_crtc.c     |  6 +--
 drivers/gpu/drm/shmobile/shmob_drm_kms.c      |  2 +-
 drivers/gpu/drm/shmobile/shmob_drm_plane.c    |  6 +--
 drivers/gpu/drm/solomon/ssd130x.c             |  2 +-
 drivers/gpu/drm/sprd/sprd_dpu.c               |  4 +-
 drivers/gpu/drm/sti/sti_cursor.c              |  6 +--
 drivers/gpu/drm/sti/sti_drv.c                 |  2 +-
 drivers/gpu/drm/sti/sti_gdp.c                 |  6 +--
 drivers/gpu/drm/sti/sti_hqvdp.c               |  6 +--
 drivers/gpu/drm/sti/sti_plane.c               |  2 +-
 drivers/gpu/drm/stm/drv.c                     |  2 +-
 drivers/gpu/drm/stm/ltdc.c                    | 14 +++---
 drivers/gpu/drm/sun4i/sun4i_backend.c         |  4 +-
 drivers/gpu/drm/sun4i/sun4i_drv.c             |  2 +-
 drivers/gpu/drm/sun4i/sun4i_frontend.c        |  8 ++--
 drivers/gpu/drm/sun4i/sun8i_mixer.c           |  2 +-
 drivers/gpu/drm/sun4i/sun8i_ui_layer.c        |  4 +-
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c        |  4 +-
 drivers/gpu/drm/tegra/fb.c                    |  2 +-
 drivers/gpu/drm/tidss/tidss_crtc.c            |  2 +-
 drivers/gpu/drm/tidss/tidss_dispc.c           |  6 +--
 drivers/gpu/drm/tidss/tidss_kms.c             |  2 +-
 drivers/gpu/drm/tidss/tidss_plane.c           |  2 +-
 drivers/gpu/drm/tilcdc/tilcdc_crtc.c          |  4 +-
 drivers/gpu/drm/tiny/arcpgu.c                 |  4 +-
 drivers/gpu/drm/tiny/ili9225.c                |  4 +-
 drivers/gpu/drm/tiny/repaper.c                |  4 +-
 drivers/gpu/drm/tiny/st7586.c                 |  4 +-
 drivers/gpu/drm/tve200/tve200_display.c       | 10 ++---
 drivers/gpu/drm/tve200/tve200_drv.c           |  2 +-
 drivers/gpu/drm/v3d/v3d_drv.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_crtc.c                |  6 +--
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               | 10 ++---
 drivers/gpu/drm/vc4/vc4_txp.c                 |  4 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  4 +-
 ...rm_fb_cma_helper.h => drm_fb_dma_helper.h} | 10 ++---
 77 files changed, 192 insertions(+), 187 deletions(-)
 rename drivers/gpu/drm/{drm_fb_cma_helper.c => drm_fb_dma_helper.c} (70%)
 rename include/drm/{drm_fb_cma_helper.h => drm_fb_dma_helper.h} (56%)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 2d473bc64c9f..dbc85fd7a971 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -122,13 +122,13 @@ format Helper Functions Reference
 .. kernel-doc:: drivers/gpu/drm/drm_format_helper.c
    :export:
 
-Framebuffer CMA Helper Functions Reference
+Framebuffer DMA Helper Functions Reference
 ==========================================
 
-.. kernel-doc:: drivers/gpu/drm/drm_fb_cma_helper.c
-   :doc: framebuffer cma helper functions
+.. kernel-doc:: drivers/gpu/drm/drm_fb_dma_helper.c
+   :doc: framebuffer dma helper functions
 
-.. kernel-doc:: drivers/gpu/drm/drm_fb_cma_helper.c
+.. kernel-doc:: drivers/gpu/drm/drm_fb_dma_helper.c
    :export:
 
 Framebuffer GEM Helper Reference
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 25016dcab55e..1d6e4f672b59 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -41,7 +41,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_cma_helper-y := drm_gem_cma_helper.o
-drm_cma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_cma_helper.o
+drm_cma_helper-$(CONFIG_DRM_KMS_HELPER) += drm_fb_dma_helper.o
 obj-$(CONFIG_DRM_GEM_CMA_HELPER) += drm_cma_helper.o
 
 drm_shmem_helper-y := drm_gem_shmem_helper.o
diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index 3c372d2deb0a..ea45da663dfb 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -5,7 +5,7 @@
  *
  */
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -247,7 +247,7 @@ komeda_fb_get_pixel_addr(struct komeda_fb *kfb, int x, int y, int plane)
 		return -EINVAL;
 	}
 
-	obj = drm_fb_cma_get_gem_obj(fb, plane);
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
 
 	offset = fb->offsets[plane];
 	if (!fb->modifier) {
diff --git a/drivers/gpu/drm/arm/hdlcd_crtc.c b/drivers/gpu/drm/arm/hdlcd_crtc.c
index afc9cd856501..3413ddbaec30 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -18,7 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -274,7 +274,7 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
 		return;
 
 	dest_h = drm_rect_height(&new_plane_state->dst);
-	scanout_start = drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
+	scanout_start = drm_fb_dma_get_gem_addr(fb, new_plane_state, 0);
 
 	hdlcd = plane->dev->dev_private;
 	hdlcd_write(hdlcd, HDLCD_REG_FB_LINE_LENGTH, fb->pitches[0]);
diff --git a/drivers/gpu/drm/arm/hdlcd_drv.c b/drivers/gpu/drm/arm/hdlcd_drv.c
index e89ae0ec60eb..fab18135f12b 100644
--- a/drivers/gpu/drm/arm/hdlcd_drv.c
+++ b/drivers/gpu/drm/arm/hdlcd_drv.c
@@ -25,7 +25,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index d5aef21426cf..4e78a64c5d37 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/arm/malidp_mw.c b/drivers/gpu/drm/arm/malidp_mw.c
index b66ca5b33a7f..7a9c900626ec 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -160,7 +160,7 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 
 	n_planes = fb->format->num_planes;
 	for (i = 0; i < n_planes; i++) {
-		struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(fb, i);
+		struct drm_gem_cma_object *obj = drm_fb_dma_get_gem_obj(fb, i);
 		/* memory write buffers are never rotated */
 		u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 0);
 
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 8a9562642d16..fd6172f433d5 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -13,7 +13,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -723,19 +723,19 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
 	ptr = mp->layer->ptr + (plane_index << 4);
 
 	/*
-	 * drm_fb_cma_get_gem_addr() alters the physical base address of the
+	 * drm_fb_dma_get_gem_addr() alters the physical base address of the
 	 * framebuffer as per the plane's src_x, src_y co-ordinates (ie to
 	 * take care of source cropping).
 	 * For AFBC, this is not needed as the cropping is handled by _AD_CROP_H
 	 * and _AD_CROP_V registers.
 	 */
 	if (!afbc) {
-		paddr = drm_fb_cma_get_gem_addr(fb, plane->state,
+		paddr = drm_fb_dma_get_gem_addr(fb, plane->state,
 						plane_index);
 	} else {
 		struct drm_gem_cma_object *obj;
 
-		obj = drm_fb_cma_get_gem_obj(fb, plane_index);
+		obj = drm_fb_dma_get_gem_obj(fb, plane_index);
 
 		if (WARN_ON(!obj))
 			return;
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
index f3788d7d82d6..cc4d0fa6262c 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -7,7 +7,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -185,7 +185,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!fb)
 		return;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	if (!gem)
 		return;
 	writel(gem->paddr, priv->base + CRT_ADDR);
diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index 7780b72de9e8..ff2cfc622072 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
index 2306ceb3e999..f9b0c81944bf 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -12,7 +12,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -449,7 +449,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
 	sr = atmel_hlcdc_layer_read_reg(&plane->layer, ATMEL_HLCDC_LAYER_CHSR);
 
 	for (i = 0; i < state->nplanes; i++) {
-		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
+		struct drm_gem_cma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
 
 		state->dscrs[i]->addr = gem->paddr + state->offsets[i];
 
diff --git a/drivers/gpu/drm/drm_fb_cma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
similarity index 70%
rename from drivers/gpu/drm/drm_fb_cma_helper.c
rename to drivers/gpu/drm/drm_fb_dma_helper.c
index 69c57273b184..85fd21cd9dda 100644
--- a/drivers/gpu/drm/drm_fb_cma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * drm kms/fb cma (contiguous memory allocator) helper functions
+ * drm kms/fb dma helper functions
  *
  * Copyright (C) 2012 Analog Devices Inc.
  *   Author: Lars-Peter Clausen <lars@metafoo.de>
@@ -10,7 +10,7 @@
  */
 
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -20,17 +20,22 @@
 #include <linux/module.h>
 
 /**
- * DOC: framebuffer cma helper functions
+ * DOC: framebuffer dma helper functions
  *
- * Provides helper functions for creating a cma (contiguous memory allocator)
- * backed framebuffer.
+ * Provides helper functions for creating a DMA-contiguous framebuffer.
+ *
+ * Depending on the platform, the buffers may be physically non-contiguous and
+ * mapped through an IOMMU or a similar mechanism, or allocated from
+ * physically-contiguous memory (using, for instance, CMA or a pool of memory
+ * reserved at early boot). This is handled behind the scenes by the DMA mapping
+ * API.
  *
  * drm_gem_fb_create() is used in the &drm_mode_config_funcs.fb_create
- * callback function to create a cma backed framebuffer.
+ * callback function to create a DMA-contiguous framebuffer.
  */
 
 /**
- * drm_fb_cma_get_gem_obj() - Get CMA GEM object for framebuffer
+ * drm_fb_dma_get_gem_obj() - Get CMA GEM object for framebuffer
  * @fb: The framebuffer
  * @plane: Which plane
  *
@@ -38,7 +43,7 @@
  *
  * This function will usually be called from the CRTC callback functions.
  */
-struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
+struct drm_gem_cma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 						  unsigned int plane)
 {
 	struct drm_gem_object *gem;
@@ -49,20 +54,20 @@ struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
 
 	return to_drm_gem_cma_obj(gem);
 }
-EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_obj);
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_obj);
 
 /**
- * drm_fb_cma_get_gem_addr() - Get physical address for framebuffer, for pixel
+ * drm_fb_dma_get_gem_addr() - Get DMA (bus) address for framebuffer, for pixel
  * formats where values are grouped in blocks this will get you the beginning of
  * the block
  * @fb: The framebuffer
  * @state: Which state of drm plane
  * @plane: Which plane
- * Return the CMA GEM address for given framebuffer.
+ * Return the DMA GEM address for given framebuffer.
  *
  * This function will usually be called from the PLANE callback functions.
  */
-dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
+dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane)
 {
@@ -77,7 +82,7 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
 	u32 block_start_y;
 	u32 num_hblocks;
 
-	obj = drm_fb_cma_get_gem_obj(fb, plane);
+	obj = drm_fb_dma_get_gem_obj(fb, plane);
 	if (!obj)
 		return 0;
 
@@ -98,10 +103,10 @@ dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
 
 	return paddr;
 }
-EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
+EXPORT_SYMBOL_GPL(drm_fb_dma_get_gem_addr);
 
 /**
- * drm_fb_cma_sync_non_coherent - Sync GEM object to non-coherent backing
+ * drm_fb_dma_sync_non_coherent - Sync GEM object to non-coherent backing
  *	memory
  * @drm: DRM device
  * @old_state: Old plane state
@@ -112,7 +117,7 @@ EXPORT_SYMBOL_GPL(drm_fb_cma_get_gem_addr);
  * in a plane's .atomic_update ensures that all the data in the backing
  * memory have been written to RAM.
  */
-void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
+void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state)
 {
@@ -125,11 +130,11 @@ void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
 	size_t nb_bytes;
 
 	for (i = 0; i < finfo->num_planes; i++) {
-		cma_obj = drm_fb_cma_get_gem_obj(state->fb, i);
+		cma_obj = drm_fb_dma_get_gem_obj(state->fb, i);
 		if (!cma_obj->map_noncoherent)
 			continue;
 
-		daddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
+		daddr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 		drm_atomic_helper_damage_iter_init(&iter, old_state, state);
 
 		drm_atomic_for_each_plane_damage(&iter, &clip) {
@@ -142,4 +147,4 @@ void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
 		}
 	}
 }
-EXPORT_SYMBOL_GPL(drm_fb_cma_sync_non_coherent);
+EXPORT_SYMBOL_GPL(drm_fb_dma_sync_non_coherent);
diff --git a/drivers/gpu/drm/drm_format_helper.c b/drivers/gpu/drm/drm_format_helper.c
index a3ccd8bc966f..3d2a590b35ec 100644
--- a/drivers/gpu/drm/drm_format_helper.c
+++ b/drivers/gpu/drm/drm_format_helper.c
@@ -54,7 +54,7 @@ static int drm_fb_xfrm(void *dst, unsigned long dst_pitch, unsigned long dst_pix
 	const void *sbuf;
 
 	/*
-	 * Some source buffers, such as CMA memory, use write-combine
+	 * Some source buffers, such as DMA memory, use write-combine
 	 * caching, so reads are uncached. Speed up access by fetching
 	 * one line at a time.
 	 */
@@ -664,7 +664,7 @@ void drm_fb_xrgb8888_to_mono(void *dst, unsigned int dst_pitch, const void *vadd
 		dst_pitch = DIV_ROUND_UP(linepixels, 8);
 
 	/*
-	 * The cma memory is write-combined so reads are uncached.
+	 * The dma memory is write-combined so reads are uncached.
 	 * Speed up by fetching one line at a time.
 	 *
 	 * Also, format conversion from XR24 to monochrome are done
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
index 7a503bf08d0f..58c69206414b 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_drv.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_modeset_helper.h>
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
index d763f53f480c..17cbe1afc263 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_kms.c
@@ -6,7 +6,7 @@
  */
 
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
 
diff --git a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
index 0cd527f0c146..8f2bf26ec87a 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -95,7 +95,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 	if (index < 0)
 		return;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 61c29c2834e6..80d8d175b8c7 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -24,7 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -549,7 +549,7 @@ static const struct drm_crtc_funcs ade_crtc_funcs = {
 static void ade_rdma_set(void __iomem *base, struct drm_framebuffer *fb,
 			 u32 ch, u32 y, u32 in_h, u32 fmt)
 {
-	struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *obj = drm_fb_dma_get_gem_obj(fb, 0);
 	u32 reg_ctrl, reg_addr, reg_size, reg_stride, reg_space, reg_en;
 	u32 stride = fb->pitches[0];
 	u32 addr = (u32)obj->paddr + y * stride;
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
index 2af51df6dca7..d16f9a69cf0c 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_drv.c
@@ -19,7 +19,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/imx/dcss/dcss-plane.c b/drivers/gpu/drm/imx/dcss/dcss-plane.c
index c29f343f33e5..a333c13c9ebc 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -6,7 +6,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -156,7 +156,7 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 	if (!fb || !new_plane_state->crtc)
 		return 0;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	WARN_ON(!cma_obj);
 
 	crtc_state = drm_atomic_get_existing_crtc_state(state,
@@ -218,7 +218,7 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
 	struct dcss_dev *dcss = plane->dev->dev_private;
 	struct drm_framebuffer *fb = state->fb;
 	const struct drm_format_info *format = fb->format;
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	unsigned long p1_ba = 0, p2_ba = 0;
 
 	if (!format->is_yuv ||
diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index a57812ec36b1..5923e8e42fd4 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/imx/ipuv3-crtc.c b/drivers/gpu/drm/imx/ipuv3-crtc.c
index f7863d6dea80..38121f3a0f18 100644
--- a/drivers/gpu/drm/imx/ipuv3-crtc.c
+++ b/drivers/gpu/drm/imx/ipuv3-crtc.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/imx/ipuv3-plane.c b/drivers/gpu/drm/imx/ipuv3-plane.c
index ea5f594955df..40db9287b5f1 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -8,7 +8,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -130,7 +130,7 @@ drm_plane_state_to_eba(struct drm_plane_state *state, int plane)
 	int x = state->src.x1 >> 16;
 	int y = state->src.y1 >> 16;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, plane);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, plane);
 	BUG_ON(!cma_obj);
 
 	return cma_obj->paddr + fb->offsets[plane] + fb->pitches[plane] * y +
@@ -146,7 +146,7 @@ drm_plane_state_to_ubo(struct drm_plane_state *state)
 	int x = state->src.x1 >> 16;
 	int y = state->src.y1 >> 16;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 1);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 1);
 	BUG_ON(!cma_obj);
 
 	x /= fb->format->hsub;
@@ -165,7 +165,7 @@ drm_plane_state_to_vbo(struct drm_plane_state *state)
 	int x = state->src.x1 >> 16;
 	int y = state->src.y1 >> 16;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 2);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 2);
 	BUG_ON(!cma_obj);
 
 	x /= fb->format->hsub;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 4de729bbf152..1850d7225e22 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -31,7 +31,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -670,12 +670,12 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 
 	if (newstate && newstate->fb) {
 		if (priv->soc_info->map_noncoherent)
-			drm_fb_cma_sync_non_coherent(&priv->drm, oldstate, newstate);
+			drm_fb_dma_sync_non_coherent(&priv->drm, oldstate, newstate);
 
 		crtc_state = newstate->crtc->state;
 		plane_id = !!(priv->soc_info->has_osd && plane != &priv->f0);
 
-		addr = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
+		addr = drm_fb_dma_get_gem_addr(newstate->fb, newstate, 0);
 		width = newstate->src_w >> 16;
 		height = newstate->src_h >> 16;
 		cpp = newstate->fb->format->cpp[0];
diff --git a/drivers/gpu/drm/ingenic/ingenic-ipu.c b/drivers/gpu/drm/ingenic/ingenic-ipu.c
index d13f58ad4769..adbfd00b4dd5 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -22,7 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -363,15 +363,15 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	if (ingenic_drm_map_noncoherent(ipu->master))
-		drm_fb_cma_sync_non_coherent(ipu->drm, oldstate, newstate);
+		drm_fb_dma_sync_non_coherent(ipu->drm, oldstate, newstate);
 
 	/* New addresses will be committed in vblank handler... */
-	ipu->addr_y = drm_fb_cma_get_gem_addr(newstate->fb, newstate, 0);
+	ipu->addr_y = drm_fb_dma_get_gem_addr(newstate->fb, newstate, 0);
 	if (finfo->num_planes > 1)
-		ipu->addr_u = drm_fb_cma_get_gem_addr(newstate->fb, newstate,
+		ipu->addr_u = drm_fb_dma_get_gem_addr(newstate->fb, newstate,
 						      1);
 	if (finfo->num_planes > 2)
-		ipu->addr_v = drm_fb_cma_get_gem_addr(newstate->fb, newstate,
+		ipu->addr_v = drm_fb_dma_get_gem_addr(newstate->fb, newstate,
 						      2);
 
 	if (!needs_modeset)
diff --git a/drivers/gpu/drm/kmb/kmb_plane.c b/drivers/gpu/drm/kmb/kmb_plane.c
index 89d055a089a6..2b7deb4cb75d 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -8,7 +8,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -404,7 +404,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
 		      (width * fb->format->cpp[0]));
 
-	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
+	addr[Y_PLANE] = drm_fb_dma_get_gem_addr(fb, new_plane_state, 0);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
 		      addr[Y_PLANE] + fb->offsets[0]);
 	val = get_pixel_format(fb->format->format);
@@ -416,7 +416,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
 			      (width * fb->format->cpp[0]));
 
-		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state,
+		addr[U_PLANE] = drm_fb_dma_get_gem_addr(fb, new_plane_state,
 							U_PLANE);
 		/* check if Cb/Cr is swapped*/
 		if (num_planes == 3 && (val & LCD_LAYER_CRCB_ORDER))
@@ -437,7 +437,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
 				      ((width) * fb->format->cpp[0]));
 
-			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
+			addr[V_PLANE] = drm_fb_dma_get_gem_addr(fb,
 								new_plane_state,
 								V_PLANE);
 
diff --git a/drivers/gpu/drm/logicvc/logicvc_layer.c b/drivers/gpu/drm/logicvc/logicvc_layer.c
index 441e3cfce4cf..f100bb7e35a8 100644
--- a/drivers/gpu/drm/logicvc/logicvc_layer.c
+++ b/drivers/gpu/drm/logicvc/logicvc_layer.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_plane.h>
@@ -158,7 +158,7 @@ static void logicvc_plane_atomic_update(struct drm_plane *drm_plane,
 		     new_state->crtc_h - 1);
 
 	if (logicvc->caps->layer_address) {
-		phys_addr_t fb_addr = drm_fb_cma_get_gem_addr(fb, new_state, 0);
+		phys_addr_t fb_addr = drm_fb_dma_get_gem_addr(fb, new_state, 0);
 
 		regmap_write(logicvc->regmap, LOGICVC_LAYER_ADDRESS_REG(index),
 			     fb_addr);
@@ -281,7 +281,7 @@ int logicvc_layer_buffer_find_setup(struct logicvc_drm *logicvc,
 		return -ENOMEM;
 	}
 
-	fb_addr = drm_fb_cma_get_gem_addr(fb, state, 0);
+	fb_addr = drm_fb_dma_get_gem_addr(fb, state, 0);
 	if (fb_addr < logicvc->reserved_mem_base) {
 		drm_err(drm_dev,
 			"Framebuffer memory below reserved memory base!\n");
diff --git a/drivers/gpu/drm/logicvc/logicvc_mode.c b/drivers/gpu/drm/logicvc/logicvc_mode.c
index 11940704f644..96b9ce0e2f63 100644
--- a/drivers/gpu/drm/logicvc/logicvc_mode.c
+++ b/drivers/gpu/drm/logicvc/logicvc_mode.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index 4df477540d07..9247da47f0cf 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -11,7 +11,7 @@
 #include <linux/media-bus-format.h>
 
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -165,7 +165,7 @@ static int mcde_display_check(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = pstate->fb;
 
 	if (fb) {
-		u32 offset = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		/* FB base address must be dword aligned. */
 		if (offset & 3) {
@@ -1424,7 +1424,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
 	 * from the DRM core before the display is enabled.
 	 */
 	if (fb) {
-		mcde_set_extsrc(mcde, drm_fb_cma_get_gem_addr(fb, pstate, 0));
+		mcde_set_extsrc(mcde, drm_fb_dma_get_gem_addr(fb, pstate, 0));
 		dev_info_once(mcde->dev, "first update of display contents\n");
 		/*
 		 * Usually the flow is already active, unless we are in
diff --git a/drivers/gpu/drm/mcde/mcde_drv.c b/drivers/gpu/drm/mcde/mcde_drv.c
index e601baa87e55..509c2b03bc42 100644
--- a/drivers/gpu/drm/mcde/mcde_drv.c
+++ b/drivers/gpu/drm/mcde/mcde_drv.c
@@ -37,7 +37,7 @@
  * (effectively using channels 0..3) for concurrent use.
  *
  * In the current DRM/KMS setup, we use one external source, one overlay,
- * one FIFO and one formatter which we connect to the simple CMA framebuffer
+ * one FIFO and one formatter which we connect to the simple DMA framebuffer
  * helpers. We then provide a bridge to the DSI port, and on the DSI port
  * bridge we connect hang a panel bridge or other bridge. This may be subject
  * to change as we exploit more of the hardware capabilities.
@@ -68,7 +68,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/meson/meson_overlay.c b/drivers/gpu/drm/meson/meson_overlay.c
index b4a0518c1028..796ff5e395b3 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -11,7 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -651,7 +651,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	switch (priv->viu.vd1_planes) {
 	case 3:
-		gem = drm_fb_cma_get_gem_obj(fb, 2);
+		gem = drm_fb_dma_get_gem_obj(fb, 2);
 		priv->viu.vd1_addr2 = gem->paddr + fb->offsets[2];
 		priv->viu.vd1_stride2 = fb->pitches[2];
 		priv->viu.vd1_height2 =
@@ -663,7 +663,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 			 priv->viu.vd1_height2);
 		fallthrough;
 	case 2:
-		gem = drm_fb_cma_get_gem_obj(fb, 1);
+		gem = drm_fb_dma_get_gem_obj(fb, 1);
 		priv->viu.vd1_addr1 = gem->paddr + fb->offsets[1];
 		priv->viu.vd1_stride1 = fb->pitches[1];
 		priv->viu.vd1_height1 =
@@ -675,7 +675,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 			 priv->viu.vd1_height1);
 		fallthrough;
 	case 1:
-		gem = drm_fb_cma_get_gem_obj(fb, 0);
+		gem = drm_fb_dma_get_gem_obj(fb, 0);
 		priv->viu.vd1_addr0 = gem->paddr + fb->offsets[0];
 		priv->viu.vd1_stride0 = fb->pitches[0];
 		priv->viu.vd1_height0 =
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index b9ac932af8d0..691673ab0983 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -15,7 +15,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -366,7 +366,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	/* Update Canvas with buffer address */
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	priv->viu.osd1_addr = gem->paddr;
 	priv->viu.osd1_stride = fb->pitches[0];
diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/lcdif_kms.c
index 1bec1279c8b5..4c257c34d8ff 100644
--- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
+++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
@@ -18,7 +18,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -297,7 +297,7 @@ static void lcdif_crtc_atomic_enable(struct drm_crtc *crtc,
 	lcdif_crtc_mode_set_nofb(lcdif, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr) {
 		writel(lower_32_bits(paddr),
 		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
@@ -406,7 +406,7 @@ static void lcdif_plane_primary_atomic_update(struct drm_plane *plane,
 									    plane);
 	dma_addr_t paddr;
 
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr) {
 		writel(lower_32_bits(paddr),
 		       lcdif->base + LCDC_V8_CTRLDESCL_LOW0_4);
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index e38ce5737a5f..34e9ce4de65b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -20,7 +20,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -389,7 +389,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr) {
 		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
@@ -544,7 +544,7 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 									    plane);
 	dma_addr_t paddr;
 
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr)
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
 }
@@ -560,7 +560,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	dma_addr_t paddr;
 	u32 ctrl;
 
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (!paddr) {
 		writel(0, mxsfb->base + LCDC_AS_CTRL);
 		return;
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 6263346f24c6..5f2429c3633e 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -15,7 +15,7 @@
 #include <linux/media-bus-format.h>
 #include <linux/of_graph.h>
 
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -94,7 +94,7 @@ static int pl111_display_check(struct drm_simple_display_pipe *pipe,
 		return -EINVAL;
 
 	if (fb) {
-		u32 offset = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		/* FB base address must be dword aligned. */
 		if (offset & 3)
@@ -398,7 +398,7 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = pstate->fb;
 
 	if (fb) {
-		u32 addr = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 addr = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		writel(addr, priv->regs + CLCD_UBAS);
 	}
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 19a4324bd356..57490c3a72d9 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -48,7 +48,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index f361a604337f..9404dc32668e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -17,7 +17,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index 957ea97541d5..3d8f6e9cfb3c 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_kms.c b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
index 0f09e1ee0390..a1fe6f53e358 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -11,7 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index e98b76db703a..8f62bc3b2a76 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -12,7 +12,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -351,7 +351,7 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
 			pitch = fb->pitches[0] * 8 / state->format->bpp;
 
 		for (i = 0; i < state->format->planes; ++i) {
-			gem = drm_fb_cma_get_gem_obj(fb, i);
+			gem = drm_fb_dma_get_gem_obj(fb, i);
 			dma[i] = gem->paddr + fb->offsets[i];
 		}
 	} else {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index e778fd52f890..bc0be6aa71d3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -11,7 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -184,7 +184,7 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 	int ret;
 
 	for (i = 0; i < fb->format->num_planes; ++i) {
-		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
+		struct drm_gem_cma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
 		struct sg_table *sgt = &sg_tables[i];
 
 		if (gem->sgt) {
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 071a929e9fe3..d2c82f2a822e 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -12,7 +12,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -293,13 +293,13 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 	unsigned int bpp;
 
 	bpp = scrtc->format->yuv ? 8 : scrtc->format->bpp;
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	scrtc->dma[0] = gem->paddr + fb->offsets[0]
 		      + y * fb->pitches[0] + x * bpp / 8;
 
 	if (scrtc->format->yuv) {
 		bpp = scrtc->format->bpp - 8;
-		gem = drm_fb_cma_get_gem_obj(fb, 1);
+		gem = drm_fb_dma_get_gem_obj(fb, 1);
 		scrtc->dma[1] = gem->paddr + fb->offsets[1]
 			      + y / (bpp == 4 ? 2 : 1) * fb->pitches[1]
 			      + x * (bpp == 16 ? 2 : 1);
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
index 68d21be784aa..7fa407adf677 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index 4763ea8e1af0..6fa64bce0c91 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -45,13 +45,13 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 	unsigned int bpp;
 
 	bpp = splane->format->yuv ? 8 : splane->format->bpp;
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	splane->dma[0] = gem->paddr + fb->offsets[0]
 		       + y * fb->pitches[0] + x * bpp / 8;
 
 	if (splane->format->yuv) {
 		bpp = splane->format->bpp - 8;
-		gem = drm_fb_cma_get_gem_obj(fb, 1);
+		gem = drm_fb_dma_get_gem_obj(fb, 1);
 		splane->dma[1] = gem->paddr + fb->offsets[1]
 			       + y / (bpp == 4 ? 2 : 1) * fb->pitches[1]
 			       + x * (bpp == 16 ? 2 : 1);
diff --git a/drivers/gpu/drm/solomon/ssd130x.c b/drivers/gpu/drm/solomon/ssd130x.c
index 77f80b0d3a5e..eb5a0662ce06 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -21,7 +21,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 3664089b6983..fb23b2f34e44 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -341,7 +341,7 @@ static void sprd_dpu_layer(struct sprd_dpu *dpu, struct drm_plane_state *state)
 	size = (src_w & 0xffff) | (src_h << 16);
 
 	for (i = 0; i < fb->format->num_planes; i++) {
-		cma_obj = drm_fb_cma_get_gem_obj(fb, i);
+		cma_obj = drm_fb_dma_get_gem_obj(fb, i);
 		addr = cma_obj->paddr + fb->offsets[i];
 
 		if (i == 0)
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 1e9bd4241f10..d374fa50be60 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -11,7 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 
@@ -243,7 +243,7 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 		}
 	}
 
-	if (!drm_fb_cma_get_gem_obj(fb, 0)) {
+	if (!drm_fb_dma_get_gem_obj(fb, 0)) {
 		DRM_ERROR("Can't get CMA GEM object for fb\n");
 		return -EINVAL;
 	}
@@ -278,7 +278,7 @@ static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
 	dst_x = newstate->crtc_x;
 	dst_y = newstate->crtc_y;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 
 	/* Convert ARGB8888 to CLUT8 */
 	sti_cursor_argb8888_to_clut8(cursor, (u32 *)cma_obj->vaddr);
diff --git a/drivers/gpu/drm/sti/sti_drv.c b/drivers/gpu/drm/sti/sti_drv.c
index d858209cf8de..d5528d53ecdd 100644
--- a/drivers/gpu/drm/sti/sti_drv.c
+++ b/drivers/gpu/drm/sti/sti_drv.c
@@ -14,7 +14,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_debugfs.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/sti/sti_gdp.c b/drivers/gpu/drm/sti/sti_gdp.c
index af783f599306..623a09163f9f 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -12,7 +12,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -658,7 +658,7 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 		return -EINVAL;
 	}
 
-	if (!drm_fb_cma_get_gem_obj(fb, 0)) {
+	if (!drm_fb_dma_get_gem_obj(fb, 0)) {
 		DRM_ERROR("Can't get CMA GEM object for fb\n");
 		return -EINVAL;
 	}
@@ -778,7 +778,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	top_field->gam_gdp_ctl |= sti_gdp_get_alpharange(format);
 	top_field->gam_gdp_ppt &= ~GAM_GDP_PPT_IGNORE;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 
 	DRM_DEBUG_DRIVER("drm FB:%d format:%.4s phys@:0x%lx\n", fb->base.id,
 			 (char *)&fb->format->format,
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 271982080437..26284c5f5b22 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -16,7 +16,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -1055,7 +1055,7 @@ static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
 		return -EINVAL;
 	}
 
-	if (!drm_fb_cma_get_gem_obj(fb, 0)) {
+	if (!drm_fb_dma_get_gem_obj(fb, 0)) {
 		DRM_ERROR("Can't get CMA GEM object for fb\n");
 		return -EINVAL;
 	}
@@ -1178,7 +1178,7 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 	cmd->iqi.sat_gain = IQI_SAT_GAIN_DFLT;
 	cmd->iqi.pxf_conf = IQI_PXF_CONF_DFLT;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 
 	DRM_DEBUG_DRIVER("drm FB:%d format:%.4s phys@:0x%lx\n", fb->base.id,
 			 (char *)&fb->format->format,
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index c74b524663ab..10d8081a550e 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -9,7 +9,7 @@
 #include <linux/types.h>
 
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index c63945dc2260..c6377fab2179 100644
--- a/drivers/gpu/drm/stm/drv.c
+++ b/drivers/gpu/drm/stm/drv.c
@@ -18,7 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/stm/ltdc.c b/drivers/gpu/drm/stm/ltdc.c
index da7a0a183b27..344c072acb6b 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -28,7 +28,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -1347,7 +1347,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	/* Sets the FB address */
-	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
+	paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 0);
 
 	if (newstate->rotation & DRM_MODE_REFLECT_X)
 		paddr += (fb->format->cpp[0] * (x1 - x0 + 1)) - 1;
@@ -1381,7 +1381,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			case DRM_FORMAT_NV12:
 			case DRM_FORMAT_NV21:
 			/* Configure the auxiliary frame buffer address 0 */
-			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			paddr1 = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 1);
 
 			if (newstate->rotation & DRM_MODE_REFLECT_X)
 				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
@@ -1393,8 +1393,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			break;
 			case DRM_FORMAT_YUV420:
 			/* Configure the auxiliary frame buffer address 0 & 1 */
-			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
-			paddr2 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
+			paddr1 = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 1);
+			paddr2 = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 2);
 
 			if (newstate->rotation & DRM_MODE_REFLECT_X) {
 				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
@@ -1411,8 +1411,8 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			break;
 			case DRM_FORMAT_YVU420:
 			/* Configure the auxiliary frame buffer address 0 & 1 */
-			paddr1 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
-			paddr2 = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			paddr1 = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 2);
+			paddr2 = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 1);
 
 			if (newstate->rotation & DRM_MODE_REFLECT_X) {
 				paddr1 += ((fb->format->cpp[1] * (x1 - x0 + 1)) >> 1) - 1;
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index 287e8c4bbaea..9deda9591b04 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -339,7 +339,7 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 		     fb->pitches[0] * 8);
 
 	/* Get the start of the displayed memory */
-	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
+	paddr = drm_fb_dma_get_gem_addr(fb, state, 0);
 	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
 
 	if (fb->format->is_yuv)
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 275f7e4a03ae..8df3efa5a6c5 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -16,7 +16,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_module.h>
diff --git a/drivers/gpu/drm/sun4i/sun4i_frontend.c b/drivers/gpu/drm/sun4i/sun4i_frontend.c
index 462fae73eae9..4a811e803dac 100644
--- a/drivers/gpu/drm/sun4i/sun4i_frontend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_frontend.c
@@ -14,7 +14,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -221,19 +221,19 @@ void sun4i_frontend_update_buffer(struct sun4i_frontend *frontend,
 	swap = sun4i_frontend_format_chroma_requires_swap(fb->format->format);
 
 	/* Set the physical address of the buffer in memory */
-	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
+	paddr = drm_fb_dma_get_gem_addr(fb, state, 0);
 	DRM_DEBUG_DRIVER("Setting buffer #0 address to %pad\n", &paddr);
 	regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR0_REG, paddr);
 
 	if (fb->format->num_planes > 1) {
-		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 2 : 1);
+		paddr = drm_fb_dma_get_gem_addr(fb, state, swap ? 2 : 1);
 		DRM_DEBUG_DRIVER("Setting buffer #1 address to %pad\n", &paddr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR1_REG,
 			     paddr);
 	}
 
 	if (fb->format->num_planes > 2) {
-		paddr = drm_fb_cma_get_gem_addr(fb, state, swap ? 1 : 2);
+		paddr = drm_fb_dma_get_gem_addr(fb, state, swap ? 1 : 2);
 		DRM_DEBUG_DRIVER("Setting buffer #2 address to %pad\n", &paddr);
 		regmap_write(frontend->regs, SUN4I_FRONTEND_BUF_ADDR2_REG,
 			     paddr);
diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/sun8i_mixer.c
index 648b38a73066..cda2c9b9cbf3 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -16,7 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 36da962de394..de0f999fec01 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -13,7 +13,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -201,7 +201,7 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	/* Get the physical address of the buffer in memory */
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 1fee6499bdd3..16f8120f5471 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -7,7 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -323,7 +323,7 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the physical address of the buffer in memory */
-		gem = drm_fb_cma_get_gem_obj(fb, i);
+		gem = drm_fb_dma_get_gem_obj(fb, i);
 
 		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
 
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index ed828de5ac01..9291209154a7 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -3,7 +3,7 @@
  * Copyright (C) 2012-2013 Avionic Design GmbH
  * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
  *
- * Based on the KMS/FB CMA helpers
+ * Based on the KMS/FB DMA helpers
  *   Copyright (C) 2012 Analog Devices Inc.
  */
 
diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index 2218da3b3ca3..87b9b7633e77 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -8,7 +8,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_vblank.h>
diff --git a/drivers/gpu/drm/tidss/tidss_dispc.c b/drivers/gpu/drm/tidss/tidss_dispc.c
index dd3c6a606ae2..cdd9a64f9736 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -24,7 +24,7 @@
 
 #include <drm/drm_blend.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_panel.h>
@@ -1961,7 +1961,7 @@ dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
 	u32 x = state->src_x >> 16;
 	u32 y = state->src_y >> 16;
 
-	gem = drm_fb_cma_get_gem_obj(state->fb, 0);
+	gem = drm_fb_dma_get_gem_obj(state->fb, 0);
 
 	return gem->paddr + fb->offsets[0] + x * fb->format->cpp[0] +
 		y * fb->pitches[0];
@@ -1978,7 +1978,7 @@ dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
 	if (WARN_ON(state->fb->format->num_planes != 2))
 		return 0;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 1);
+	gem = drm_fb_dma_get_gem_obj(fb, 1);
 
 	return gem->paddr + fb->offsets[1] +
 		(x * fb->format->cpp[1] / fb->format->hsub) +
diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index 666e527a0acf..8b9dd5e90021 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_of.h>
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index 68a85a94ffcb..162c32e97ea5 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -11,7 +11,7 @@
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 
 #include "tidss_crtc.h"
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 509fbae8c9a6..bd4f52242c0a 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -12,7 +12,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -68,7 +68,7 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 	dma_addr_t start, end;
 	u64 dma_base_and_ceiling;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	start = gem->paddr + fb->offsets[0] +
 		crtc->y * fb->pitches[0] +
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index 7461cb401407..cdf320c547fb 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -11,7 +11,7 @@
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -226,7 +226,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
+	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
 }
 
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index 8d686eecd5f4..fc73ffa46a19 100644
--- a/drivers/gpu/drm/tiny/ili9225.c
+++ b/drivers/gpu/drm/tiny/ili9225.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
@@ -78,7 +78,7 @@ static inline int ili9225_command(struct mipi_dbi *dbi, u8 cmd, u16 data)
 
 static void ili9225_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index 013790c45d0a..6d3b5b3cb955 100644
--- a/drivers/gpu/drm/tiny/repaper.c
+++ b/drivers/gpu/drm/tiny/repaper.c
@@ -25,7 +25,7 @@
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
@@ -511,7 +511,7 @@ static void repaper_get_temperature(struct repaper_epd *epd)
 
 static int repaper_fb_dirty(struct drm_framebuffer *fb)
 {
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
 	struct drm_rect clip;
 	int idx, ret = 0;
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 8eddb020c43e..b1584b362c79 100644
--- a/drivers/gpu/drm/tiny/st7586.c
+++ b/drivers/gpu/drm/tiny/st7586.c
@@ -15,7 +15,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_framebuffer.h>
@@ -92,7 +92,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 static int st7586_buf_copy(void *dst, struct drm_framebuffer *fb,
 			   struct drm_rect *clip)
 {
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	void *src = cma_obj->vaddr;
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 771bad881714..6647aab8a25e 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -15,7 +15,7 @@
 #include <linux/of_graph.h>
 #include <linux/delay.h>
 
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -90,7 +90,7 @@ static int tve200_display_check(struct drm_simple_display_pipe *pipe,
 	}
 
 	if (fb) {
-		u32 offset = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		/* FB base address must be dword aligned. */
 		if (offset & 3) {
@@ -267,14 +267,14 @@ static void tve200_display_update(struct drm_simple_display_pipe *pipe,
 
 	if (fb) {
 		/* For RGB, the Y component is used as base address */
-		writel(drm_fb_cma_get_gem_addr(fb, pstate, 0),
+		writel(drm_fb_dma_get_gem_addr(fb, pstate, 0),
 		       priv->regs + TVE200_Y_FRAME_BASE_ADDR);
 
 		/* For three plane YUV we need two more addresses */
 		if (fb->format->format == DRM_FORMAT_YUV420) {
-			writel(drm_fb_cma_get_gem_addr(fb, pstate, 1),
+			writel(drm_fb_dma_get_gem_addr(fb, pstate, 1),
 			       priv->regs + TVE200_U_FRAME_BASE_ADDR);
-			writel(drm_fb_cma_get_gem_addr(fb, pstate, 2),
+			writel(drm_fb_dma_get_gem_addr(fb, pstate, 2),
 			       priv->regs + TVE200_V_FRAME_BASE_ADDR);
 		}
 	}
diff --git a/drivers/gpu/drm/tve200/tve200_drv.c b/drivers/gpu/drm/tve200/tve200_drv.c
index 6d9d2921abf4..db8129c9ade8 100644
--- a/drivers/gpu/drm/tve200/tve200_drv.c
+++ b/drivers/gpu/drm/tve200/tve200_drv.c
@@ -39,7 +39,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
diff --git a/drivers/gpu/drm/v3d/v3d_drv.c b/drivers/gpu/drm/v3d/v3d_drv.c
index 8c7f910daa28..1e7bb1583953 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -22,7 +22,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_managed.h>
 #include <uapi/drm/v3d_drm.h>
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index fb95ed1e3515..8fd0b93c3457 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -37,7 +37,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -817,7 +817,7 @@ vc4_async_page_flip_complete(struct vc4_seqno_cb *cb)
 		struct drm_gem_cma_object *cma_bo;
 		struct vc4_bo *bo;
 
-		cma_bo = drm_fb_cma_get_gem_obj(flip_state->old_fb, 0);
+		cma_bo = drm_fb_dma_get_gem_obj(flip_state->old_fb, 0);
 		bo = to_vc4_bo(&cma_bo->base);
 		vc4_bo_dec_usecnt(bo);
 		drm_framebuffer_put(flip_state->old_fb);
@@ -841,7 +841,7 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 	struct drm_plane *plane = crtc->primary;
 	int ret = 0;
 	struct vc4_async_flip_state *flip_state;
-	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_bo = drm_fb_dma_get_gem_obj(fb, 0);
 	struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
 
 	/* Increment the BO usecnt here, so that we never end up with an
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 680eaef7287f..2c789fe8e7ad 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.c
+++ b/drivers/gpu/drm/vc4/vc4_drv.c
@@ -33,7 +33,7 @@
 #include <drm/drm_aperture.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_vblank.h>
 
diff --git a/drivers/gpu/drm/vc4/vc4_plane.c b/drivers/gpu/drm/vc4/vc4_plane.c
index 5507f2cd7a27..75b07e6b3103 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -19,7 +19,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_blend.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -340,7 +340,7 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_cma_object *bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	int num_planes = fb->format->num_planes;
 	struct drm_crtc_state *crtc_state;
 	u32 h_subsample = fb->format->hsub;
@@ -1244,7 +1244,7 @@ u32 vc4_plane_dlist_size(const struct drm_plane_state *state)
 void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
-	struct drm_gem_cma_object *bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	uint32_t addr;
 
 	/* We're skipping the address adjustment for negative origin,
@@ -1384,7 +1384,7 @@ static int vc4_prepare_fb(struct drm_plane *plane,
 	if (!state->fb)
 		return 0;
 
-	bo = to_vc4_bo(&drm_fb_cma_get_gem_obj(state->fb, 0)->base);
+	bo = to_vc4_bo(&drm_fb_dma_get_gem_obj(state->fb, 0)->base);
 
 	drm_gem_plane_helper_prepare_fb(plane, state);
 
@@ -1402,7 +1402,7 @@ static void vc4_cleanup_fb(struct drm_plane *plane,
 	if (plane->state->fb == state->fb || !state->fb)
 		return;
 
-	bo = to_vc4_bo(&drm_fb_cma_get_gem_obj(state->fb, 0)->base);
+	bo = to_vc4_bo(&drm_fb_dma_get_gem_obj(state->fb, 0)->base);
 	vc4_bo_dec_usecnt(bo);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index d20b0bc51a18..51c7c729e211 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_panel.h>
@@ -312,7 +312,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		 */
 		ctrl |= TXP_ALPHA_INVERT;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
 	TXP_WRITE(TXP_DIM,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index cc32aa89cf8f..3d93f0985ea8 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -15,7 +15,7 @@
 #include <drm/drm_blend.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
@@ -1101,7 +1101,7 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
 		struct dma_async_tx_descriptor *desc;
 		dma_addr_t paddr;
 
-		paddr = drm_fb_cma_get_gem_addr(state->fb, state, i);
+		paddr = drm_fb_dma_get_gem_addr(state->fb, state, i);
 
 		dma->xt.numf = height;
 		dma->sgl.size = width * info->cpp[i];
diff --git a/include/drm/drm_fb_cma_helper.h b/include/drm/drm_fb_dma_helper.h
similarity index 56%
rename from include/drm/drm_fb_cma_helper.h
rename to include/drm/drm_fb_dma_helper.h
index 6447e34528f8..05f657363b30 100644
--- a/include/drm/drm_fb_cma_helper.h
+++ b/include/drm/drm_fb_dma_helper.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
-#ifndef __DRM_FB_CMA_HELPER_H__
-#define __DRM_FB_CMA_HELPER_H__
+#ifndef __DRM_FB_DMA_HELPER_H__
+#define __DRM_FB_DMA_HELPER_H__
 
 #include <linux/types.h>
 
@@ -8,14 +8,14 @@ struct drm_device;
 struct drm_framebuffer;
 struct drm_plane_state;
 
-struct drm_gem_cma_object *drm_fb_cma_get_gem_obj(struct drm_framebuffer *fb,
+struct drm_gem_cma_object *drm_fb_dma_get_gem_obj(struct drm_framebuffer *fb,
 	unsigned int plane);
 
-dma_addr_t drm_fb_cma_get_gem_addr(struct drm_framebuffer *fb,
+dma_addr_t drm_fb_dma_get_gem_addr(struct drm_framebuffer *fb,
 				   struct drm_plane_state *state,
 				   unsigned int plane);
 
-void drm_fb_cma_sync_non_coherent(struct drm_device *drm,
+void drm_fb_dma_sync_non_coherent(struct drm_device *drm,
 				  struct drm_plane_state *old_state,
 				  struct drm_plane_state *state);
 
-- 
2.36.1

