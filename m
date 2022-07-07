Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 394AB56A9D6
	for <lists+dri-devel@lfdr.de>; Thu,  7 Jul 2022 19:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B82E111A82B;
	Thu,  7 Jul 2022 17:40:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0A8112108
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Jul 2022 17:40:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657215636;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gEOE8JPsiRlXACE0QGv4Uq/LQKct7ySq92gAK9aa5Po=;
 b=HQDz3fR8EHZHuYGDKFHwijVEVOwHERJ8IuaDTRRlXbX+pYvm/aJepdQwG2DbSmPs2GOLYU
 Z926SmVA66xnvtojDR142HyX13ApYz9el7yL2g3h2YLs0Nwu09q0MZvxXT2NimkJt51o+N
 jANrvnrb6DPgeZYmfxuTZSqSJ6e50pE=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-9lz6mXbGMQ-0WzEuU59SIA-1; Thu, 07 Jul 2022 13:40:29 -0400
X-MC-Unique: 9lz6mXbGMQ-0WzEuU59SIA-1
Received: by mail-ed1-f72.google.com with SMTP id
 f13-20020a0564021e8d00b00437a2acb543so14287744edf.7
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Jul 2022 10:40:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gEOE8JPsiRlXACE0QGv4Uq/LQKct7ySq92gAK9aa5Po=;
 b=D4Lasq7Exawjlif4m4zA50Dfg9DXabUGwTAzL5Gu3W3yz+JkidXWIu+UBHu6q5tydK
 JH3pk61TVvdehsEEVmW05mojEZgj5qDoK2+JQWgJFEMs5BDl+oVn6Xhpz9EW+GsxVyuv
 QbVkaOrx9yRbBEpW3YJ9nlm7AVbjfirHQIfF8izt7x7lRh7jD8P/wngAxdJ2uxd8OggK
 cKVnJzqNVGFi6RSLZgIjzgrbcUZGZXS62pNXfbEIiyx/Xlr4vDdK/YKCPkUFzHgN27/O
 smeb0sfqyZgPLevmmB+NIJdeO1ZqVni4kKia9HeKJz/aTn1hU07+uY7I8UEcYDZkTKMZ
 w2zw==
X-Gm-Message-State: AJIora/R1n5z4I2C2CkIKdovkynslfFswUE4+p6NiBgjLgzQe99k4Bed
 HwOFr15LN/3PbZBpsxnAV5utPEvQ99uT+b88EfPpzEkstUVBsNJ0enIeBKomAa/9fHPEInnWau0
 uumubS9F0hB65Qb6LyIlWyJrSdx29
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id
 i21-20020a05640242d500b004331727b31cmr55073569edc.9.1657215627214; 
 Thu, 07 Jul 2022 10:40:27 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tEmCaO+9FcHVFSJ96lXpiaZIy3LSQJBnjmrVlIWRyhZCrpjcCS6VzgWERPQaZXAmZXiuOjIA==
X-Received: by 2002:a05:6402:42d5:b0:433:1727:b31c with SMTP id
 i21-20020a05640242d500b004331727b31cmr55073498edc.9.1657215626610; 
 Thu, 07 Jul 2022 10:40:26 -0700 (PDT)
Received: from pollux.redhat.com ([2a02:810d:4b40:2ee8:642:1aff:fe31:a15c])
 by smtp.gmail.com with ESMTPSA id
 jp1-20020a170906f74100b006fe0abb00f0sm19092424ejb.209.2022.07.07.10.40.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jul 2022 10:40:26 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, laurent.pinchart@ideasonboard.com, airlied@linux.ie,
 tzimmermann@suse.de
Subject: [PATCH v3 1/4] drm/fb: rename FB CMA helpers to FB DMA helpers
Date: Thu,  7 Jul 2022 19:40:00 +0200
Message-Id: <20220707174003.1390017-2-dakr@redhat.com>
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
 drivers/gpu/drm/mcde/mcde_display.c           |  6 +--
 drivers/gpu/drm/mcde/mcde_drv.c               |  4 +-
 drivers/gpu/drm/meson/meson_overlay.c         |  8 ++--
 drivers/gpu/drm/meson/meson_plane.c           |  4 +-
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
 drivers/gpu/drm/vc4/vc4_crtc.c                |  8 ++--
 drivers/gpu/drm/vc4/vc4_drv.c                 |  2 +-
 drivers/gpu/drm/vc4/vc4_plane.c               | 10 ++---
 drivers/gpu/drm/vc4/vc4_txp.c                 |  4 +-
 drivers/gpu/drm/xlnx/zynqmp_disp.c            |  4 +-
 ...rm_fb_cma_helper.h => drm_fb_dma_helper.h} | 10 ++---
 74 files changed, 186 insertions(+), 181 deletions(-)
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
index 15fe3163f822..1240e77c4962 100644
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
index 7adb065169e9..20543fe7154d 100644
--- a/drivers/gpu/drm/arm/hdlcd_crtc.c
+++ b/drivers/gpu/drm/arm/hdlcd_crtc.c
@@ -18,7 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_of.h>
@@ -273,7 +273,7 @@ static void hdlcd_plane_atomic_update(struct drm_plane *plane,
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
index 204c869d9fe2..d341df370422 100644
--- a/drivers/gpu/drm/arm/malidp_mw.c
+++ b/drivers/gpu/drm/arm/malidp_mw.c
@@ -9,7 +9,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_probe_helper.h>
@@ -158,7 +158,7 @@ malidp_mw_encoder_atomic_check(struct drm_encoder *encoder,
 
 	n_planes = fb->format->num_planes;
 	for (i = 0; i < n_planes; i++) {
-		struct drm_gem_cma_object *obj = drm_fb_cma_get_gem_obj(fb, i);
+		struct drm_gem_cma_object *obj = drm_fb_dma_get_gem_obj(fb, i);
 		/* memory write buffers are never rotated */
 		u8 alignment = malidp_hw_get_pitch_align(malidp->dev, 0);
 
diff --git a/drivers/gpu/drm/arm/malidp_planes.c b/drivers/gpu/drm/arm/malidp_planes.c
index 338cec4a3fff..281889389a49 100644
--- a/drivers/gpu/drm/arm/malidp_planes.c
+++ b/drivers/gpu/drm/arm/malidp_planes.c
@@ -12,7 +12,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
@@ -721,19 +721,19 @@ static void malidp_set_plane_base_addr(struct drm_framebuffer *fb,
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
index 827e62c1daba..a86aaab6d7ac 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_crtc.c
@@ -7,7 +7,7 @@
 
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -184,7 +184,7 @@ static void aspeed_gfx_pipe_update(struct drm_simple_display_pipe *pipe,
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
index a077d93c78d7..349c99585ff5 100644
--- a/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
+++ b/drivers/gpu/drm/atmel-hlcdc/atmel_hlcdc_plane.c
@@ -11,7 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -447,7 +447,7 @@ static void atmel_hlcdc_plane_update_buffers(struct atmel_hlcdc_plane *plane,
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
index 8fe953d6e0a9..f00083191792 100644
--- a/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
+++ b/drivers/gpu/drm/fsl-dcu/fsl_dcu_drm_plane.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -94,7 +94,7 @@ static void fsl_dcu_drm_plane_atomic_update(struct drm_plane *plane,
 	if (index < 0)
 		return;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	switch (fb->format->format) {
 	case DRM_FORMAT_RGB565:
diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 1ab94620776f..eea51a6dd8ab 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -24,7 +24,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -548,7 +548,7 @@ static const struct drm_crtc_funcs ade_crtc_funcs = {
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
index ac45d54acd4e..7794018252c2 100644
--- a/drivers/gpu/drm/imx/dcss/dcss-plane.c
+++ b/drivers/gpu/drm/imx/dcss/dcss-plane.c
@@ -5,7 +5,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 
@@ -154,7 +154,7 @@ static int dcss_plane_atomic_check(struct drm_plane *plane,
 	if (!fb || !new_plane_state->crtc)
 		return 0;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	WARN_ON(!cma_obj);
 
 	crtc_state = drm_atomic_get_existing_crtc_state(state,
@@ -216,7 +216,7 @@ static void dcss_plane_atomic_set_base(struct dcss_plane *dcss_plane)
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
index 36b32e8806e3..3fcaf7b335b3 100644
--- a/drivers/gpu/drm/imx/ipuv3-plane.c
+++ b/drivers/gpu/drm/imx/ipuv3-plane.c
@@ -7,7 +7,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -128,7 +128,7 @@ drm_plane_state_to_eba(struct drm_plane_state *state, int plane)
 	int x = state->src.x1 >> 16;
 	int y = state->src.y1 >> 16;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, plane);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, plane);
 	BUG_ON(!cma_obj);
 
 	return cma_obj->paddr + fb->offsets[plane] + fb->pitches[plane] * y +
@@ -144,7 +144,7 @@ drm_plane_state_to_ubo(struct drm_plane_state *state)
 	int x = state->src.x1 >> 16;
 	int y = state->src.y1 >> 16;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 1);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 1);
 	BUG_ON(!cma_obj);
 
 	x /= fb->format->hsub;
@@ -163,7 +163,7 @@ drm_plane_state_to_vbo(struct drm_plane_state *state)
 	int x = state->src.x1 >> 16;
 	int y = state->src.y1 >> 16;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 2);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 2);
 	BUG_ON(!cma_obj);
 
 	x /= fb->format->hsub;
diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index 8eb0ad501a7b..88ece2c6c7a1 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -30,7 +30,7 @@
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_gem_cma_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
@@ -666,12 +666,12 @@ static void ingenic_drm_plane_atomic_update(struct drm_plane *plane,
 
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
index 2737fc521e15..273fe84c8abc 100644
--- a/drivers/gpu/drm/ingenic/ingenic-ipu.c
+++ b/drivers/gpu/drm/ingenic/ingenic-ipu.c
@@ -22,7 +22,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -362,15 +362,15 @@ static void ingenic_ipu_plane_atomic_update(struct drm_plane *plane,
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
index 2735b8eb3537..3768d6b03a1a 100644
--- a/drivers/gpu/drm/kmb/kmb_plane.c
+++ b/drivers/gpu/drm/kmb/kmb_plane.c
@@ -7,7 +7,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -402,7 +402,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_LINE_WIDTH(plane_id),
 		      (width * fb->format->cpp[0]));
 
-	addr[Y_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state, 0);
+	addr[Y_PLANE] = drm_fb_dma_get_gem_addr(fb, new_plane_state, 0);
 	kmb_write_lcd(kmb, LCD_LAYERn_DMA_START_ADDR(plane_id),
 		      addr[Y_PLANE] + fb->offsets[0]);
 	val = get_pixel_format(fb->format->format);
@@ -414,7 +414,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 		kmb_write_lcd(kmb, LCD_LAYERn_DMA_CB_LINE_WIDTH(plane_id),
 			      (width * fb->format->cpp[0]));
 
-		addr[U_PLANE] = drm_fb_cma_get_gem_addr(fb, new_plane_state,
+		addr[U_PLANE] = drm_fb_dma_get_gem_addr(fb, new_plane_state,
 							U_PLANE);
 		/* check if Cb/Cr is swapped*/
 		if (num_planes == 3 && (val & LCD_LAYER_CRCB_ORDER))
@@ -435,7 +435,7 @@ static void kmb_plane_atomic_update(struct drm_plane *plane,
 				      LCD_LAYERn_DMA_CR_LINE_WIDTH(plane_id),
 				      ((width) * fb->format->cpp[0]));
 
-			addr[V_PLANE] = drm_fb_cma_get_gem_addr(fb,
+			addr[V_PLANE] = drm_fb_dma_get_gem_addr(fb,
 								new_plane_state,
 								V_PLANE);
 
diff --git a/drivers/gpu/drm/mcde/mcde_display.c b/drivers/gpu/drm/mcde/mcde_display.c
index ce12a36e2db4..920b1430565b 100644
--- a/drivers/gpu/drm/mcde/mcde_display.c
+++ b/drivers/gpu/drm/mcde/mcde_display.c
@@ -11,7 +11,7 @@
 #include <linux/media-bus-format.h>
 
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -164,7 +164,7 @@ static int mcde_display_check(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = pstate->fb;
 
 	if (fb) {
-		u32 offset = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		/* FB base address must be dword aligned. */
 		if (offset & 3) {
@@ -1423,7 +1423,7 @@ static void mcde_display_update(struct drm_simple_display_pipe *pipe,
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
index dfef8afcc245..9aaad048f931 100644
--- a/drivers/gpu/drm/meson/meson_overlay.c
+++ b/drivers/gpu/drm/meson/meson_overlay.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -649,7 +649,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 
 	switch (priv->viu.vd1_planes) {
 	case 3:
-		gem = drm_fb_cma_get_gem_obj(fb, 2);
+		gem = drm_fb_dma_get_gem_obj(fb, 2);
 		priv->viu.vd1_addr2 = gem->paddr + fb->offsets[2];
 		priv->viu.vd1_stride2 = fb->pitches[2];
 		priv->viu.vd1_height2 =
@@ -661,7 +661,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 			 priv->viu.vd1_height2);
 		fallthrough;
 	case 2:
-		gem = drm_fb_cma_get_gem_obj(fb, 1);
+		gem = drm_fb_dma_get_gem_obj(fb, 1);
 		priv->viu.vd1_addr1 = gem->paddr + fb->offsets[1];
 		priv->viu.vd1_stride1 = fb->pitches[1];
 		priv->viu.vd1_height1 =
@@ -673,7 +673,7 @@ static void meson_overlay_atomic_update(struct drm_plane *plane,
 			 priv->viu.vd1_height1);
 		fallthrough;
 	case 1:
-		gem = drm_fb_cma_get_gem_obj(fb, 0);
+		gem = drm_fb_dma_get_gem_obj(fb, 0);
 		priv->viu.vd1_addr0 = gem->paddr + fb->offsets[0];
 		priv->viu.vd1_stride0 = fb->pitches[0];
 		priv->viu.vd1_height0 =
diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/meson/meson_plane.c
index 8640a8a8a469..a292f502f1b2 100644
--- a/drivers/gpu/drm/meson/meson_plane.c
+++ b/drivers/gpu/drm/meson/meson_plane.c
@@ -14,7 +14,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -364,7 +364,7 @@ static void meson_plane_atomic_update(struct drm_plane *plane,
 	}
 
 	/* Update Canvas with buffer address */
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	priv->viu.osd1_addr = gem->paddr;
 	priv->viu.osd1_stride = fb->pitches[0];
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index f021ab2c4520..3529b483762a 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -19,7 +19,7 @@
 #include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_encoder.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -387,7 +387,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr) {
 		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
@@ -542,7 +542,7 @@ static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
 									    plane);
 	dma_addr_t paddr;
 
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (paddr)
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
 }
@@ -558,7 +558,7 @@ static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
 	dma_addr_t paddr;
 	u32 ctrl;
 
-	paddr = drm_fb_cma_get_gem_addr(new_pstate->fb, new_pstate, 0);
+	paddr = drm_fb_dma_get_gem_addr(new_pstate->fb, new_pstate, 0);
 	if (!paddr) {
 		writel(0, mxsfb->base + LCDC_AS_CTRL);
 		return;
diff --git a/drivers/gpu/drm/pl111/pl111_display.c b/drivers/gpu/drm/pl111/pl111_display.c
index 443e3b932322..905b597423d9 100644
--- a/drivers/gpu/drm/pl111/pl111_display.c
+++ b/drivers/gpu/drm/pl111/pl111_display.c
@@ -14,7 +14,7 @@
 #include <linux/dma-buf.h>
 #include <linux/of_graph.h>
 
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -92,7 +92,7 @@ static int pl111_display_check(struct drm_simple_display_pipe *pipe,
 		return -EINVAL;
 
 	if (fb) {
-		u32 offset = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		/* FB base address must be dword aligned. */
 		if (offset & 3)
@@ -396,7 +396,7 @@ static void pl111_display_update(struct drm_simple_display_pipe *pipe,
 	struct drm_framebuffer *fb = pstate->fb;
 
 	if (fb) {
-		u32 addr = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 addr = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		writel(addr, priv->regs + CLCD_UBAS);
 	}
diff --git a/drivers/gpu/drm/pl111/pl111_drv.c b/drivers/gpu/drm/pl111/pl111_drv.c
index 520301b405f1..5852af7374dd 100644
--- a/drivers/gpu/drm/pl111/pl111_drv.c
+++ b/drivers/gpu/drm/pl111/pl111_drv.c
@@ -48,7 +48,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
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
index 190dbb7f15dd..c39d901b21d3 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_kms.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_kms.c
@@ -11,7 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_managed.h>
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_plane.c b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
index 5c1c7bb04f3f..274dc5f1fc2d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_plane.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_plane.c
@@ -11,7 +11,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -349,7 +349,7 @@ static void rcar_du_plane_setup_scanout(struct rcar_du_group *rgrp,
 			pitch = fb->pitches[0] * 8 / state->format->bpp;
 
 		for (i = 0; i < state->format->planes; ++i) {
-			gem = drm_fb_cma_get_gem_obj(fb, i);
+			gem = drm_fb_dma_get_gem_obj(fb, i);
 			dma[i] = gem->paddr + fb->offsets[i];
 		}
 	} else {
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
index 8eb9b2b097ae..07f69b656832 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_vsp.c
@@ -10,7 +10,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -182,7 +182,7 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 	int ret;
 
 	for (i = 0; i < fb->format->num_planes; ++i) {
-		struct drm_gem_cma_object *gem = drm_fb_cma_get_gem_obj(fb, i);
+		struct drm_gem_cma_object *gem = drm_fb_dma_get_gem_obj(fb, i);
 		struct sg_table *sgt = &sg_tables[i];
 
 		if (gem->sgt) {
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
index 03556dbfcafb..215f1294293d 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_crtc.c
@@ -12,7 +12,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -292,13 +292,13 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
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
index 7a866d6ce6bb..1dfb9e4bf215 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_kms.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
index cbc464f006b4..c68f56d9136c 100644
--- a/drivers/gpu/drm/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/shmobile/shmob_drm_plane.c
@@ -9,7 +9,7 @@
 
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 
@@ -44,13 +44,13 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
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
index 08394444dd6e..52923ceebd1d 100644
--- a/drivers/gpu/drm/solomon/ssd130x.c
+++ b/drivers/gpu/drm/solomon/ssd130x.c
@@ -20,7 +20,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_damage_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_format_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
diff --git a/drivers/gpu/drm/sprd/sprd_dpu.c b/drivers/gpu/drm/sprd/sprd_dpu.c
index 1637203ea103..c9d380cc9fce 100644
--- a/drivers/gpu/drm/sprd/sprd_dpu.c
+++ b/drivers/gpu/drm/sprd/sprd_dpu.c
@@ -18,7 +18,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc_helper.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -339,7 +339,7 @@ static void sprd_dpu_layer(struct sprd_dpu *dpu, struct drm_plane_state *state)
 	size = (src_w & 0xffff) | (src_h << 16);
 
 	for (i = 0; i < fb->format->num_planes; i++) {
-		cma_obj = drm_fb_cma_get_gem_obj(fb, i);
+		cma_obj = drm_fb_dma_get_gem_obj(fb, i);
 		addr = cma_obj->paddr + fb->offsets[i];
 
 		if (i == 0)
diff --git a/drivers/gpu/drm/sti/sti_cursor.c b/drivers/gpu/drm/sti/sti_cursor.c
index 414c9973aa6d..dd82673ebc23 100644
--- a/drivers/gpu/drm/sti/sti_cursor.c
+++ b/drivers/gpu/drm/sti/sti_cursor.c
@@ -11,7 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 
 #include "sti_compositor.h"
@@ -242,7 +242,7 @@ static int sti_cursor_atomic_check(struct drm_plane *drm_plane,
 		}
 	}
 
-	if (!drm_fb_cma_get_gem_obj(fb, 0)) {
+	if (!drm_fb_dma_get_gem_obj(fb, 0)) {
 		DRM_ERROR("Can't get CMA GEM object for fb\n");
 		return -EINVAL;
 	}
@@ -277,7 +277,7 @@ static void sti_cursor_atomic_update(struct drm_plane *drm_plane,
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
index b58415f2e4d8..6b1b541adc9d 100644
--- a/drivers/gpu/drm/sti/sti_gdp.c
+++ b/drivers/gpu/drm/sti/sti_gdp.c
@@ -11,7 +11,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 
@@ -656,7 +656,7 @@ static int sti_gdp_atomic_check(struct drm_plane *drm_plane,
 		return -EINVAL;
 	}
 
-	if (!drm_fb_cma_get_gem_obj(fb, 0)) {
+	if (!drm_fb_dma_get_gem_obj(fb, 0)) {
 		DRM_ERROR("Can't get CMA GEM object for fb\n");
 		return -EINVAL;
 	}
@@ -776,7 +776,7 @@ static void sti_gdp_atomic_update(struct drm_plane *drm_plane,
 	top_field->gam_gdp_ctl |= sti_gdp_get_alpharange(format);
 	top_field->gam_gdp_ppt &= ~GAM_GDP_PPT_IGNORE;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 
 	DRM_DEBUG_DRIVER("drm FB:%d format:%.4s phys@:0x%lx\n", fb->base.id,
 			 (char *)&fb->format->format,
diff --git a/drivers/gpu/drm/sti/sti_hqvdp.c b/drivers/gpu/drm/sti/sti_hqvdp.c
index 2201a50353eb..af1185d393ee 100644
--- a/drivers/gpu/drm/sti/sti_hqvdp.c
+++ b/drivers/gpu/drm/sti/sti_hqvdp.c
@@ -15,7 +15,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 
@@ -1053,7 +1053,7 @@ static int sti_hqvdp_atomic_check(struct drm_plane *drm_plane,
 		return -EINVAL;
 	}
 
-	if (!drm_fb_cma_get_gem_obj(fb, 0)) {
+	if (!drm_fb_dma_get_gem_obj(fb, 0)) {
 		DRM_ERROR("Can't get CMA GEM object for fb\n");
 		return -EINVAL;
 	}
@@ -1176,7 +1176,7 @@ static void sti_hqvdp_atomic_update(struct drm_plane *drm_plane,
 	cmd->iqi.sat_gain = IQI_SAT_GAIN_DFLT;
 	cmd->iqi.pxf_conf = IQI_PXF_CONF_DFLT;
 
-	cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 
 	DRM_DEBUG_DRIVER("drm FB:%d format:%.4s phys@:0x%lx\n", fb->base.id,
 			 (char *)&fb->format->format,
diff --git a/drivers/gpu/drm/sti/sti_plane.c b/drivers/gpu/drm/sti/sti_plane.c
index 173409cdb99e..00bfdfac2709 100644
--- a/drivers/gpu/drm/sti/sti_plane.c
+++ b/drivers/gpu/drm/sti/sti_plane.c
@@ -8,7 +8,7 @@
 
 #include <linux/types.h>
 
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 
diff --git a/drivers/gpu/drm/stm/drv.c b/drivers/gpu/drm/stm/drv.c
index 0da7cce2a1a2..7d0bd699416f 100644
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
index 6bd45df8f5a7..377de80c4d97 100644
--- a/drivers/gpu/drm/stm/ltdc.c
+++ b/drivers/gpu/drm/stm/ltdc.c
@@ -25,7 +25,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -1309,7 +1309,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 	regmap_write_bits(ldev->regmap, LTDC_L1CFBLNR + lofs, LXCFBLNR_CFBLN, line_number);
 
 	/* Sets the FB address */
-	paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 0);
+	paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 0);
 
 	DRM_DEBUG_DRIVER("fb: phys 0x%08x", paddr);
 	regmap_write(ldev->regmap, LTDC_L1CFBAR + lofs, paddr);
@@ -1320,7 +1320,7 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			case DRM_FORMAT_NV12:
 			case DRM_FORMAT_NV21:
 			/* Configure the auxiliary frame buffer address 0 & 1 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 1);
 			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
 			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr + 1);
 
@@ -1334,11 +1334,11 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			break;
 			case DRM_FORMAT_YUV420:
 			/* Configure the auxiliary frame buffer address 0 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 1);
 			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
 
 			/* Configure the auxiliary frame buffer address 1 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
+			paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 2);
 			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
 
 			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
@@ -1354,11 +1354,11 @@ static void ltdc_plane_atomic_update(struct drm_plane *plane,
 			break;
 			case DRM_FORMAT_YVU420:
 			/* Configure the auxiliary frame buffer address 0 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 2);
+			paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 2);
 			regmap_write(ldev->regmap, LTDC_L1AFBA0R + lofs, paddr);
 
 			/* Configure the auxiliary frame buffer address 1 */
-			paddr = (u32)drm_fb_cma_get_gem_addr(fb, newstate, 1);
+			paddr = (u32)drm_fb_dma_get_gem_addr(fb, newstate, 1);
 			regmap_write(ldev->regmap, LTDC_L1AFBA1R + lofs, paddr);
 
 			line_length = ((fb->format->cpp[0] * (x1 - x0 + 1)) >> 1) +
diff --git a/drivers/gpu/drm/sun4i/sun4i_backend.c b/drivers/gpu/drm/sun4i/sun4i_backend.c
index decd95ad519d..103f13dc7ae0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_backend.c
+++ b/drivers/gpu/drm/sun4i/sun4i_backend.c
@@ -18,7 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -337,7 +337,7 @@ int sun4i_backend_update_layer_buffer(struct sun4i_backend *backend,
 		     fb->pitches[0] * 8);
 
 	/* Get the start of the displayed memory */
-	paddr = drm_fb_cma_get_gem_addr(fb, state, 0);
+	paddr = drm_fb_dma_get_gem_addr(fb, state, 0);
 	DRM_DEBUG_DRIVER("Setting buffer address to %pad\n", &paddr);
 
 	if (fb->format->is_yuv)
diff --git a/drivers/gpu/drm/sun4i/sun4i_drv.c b/drivers/gpu/drm/sun4i/sun4i_drv.c
index 6eb1aabdb161..70b08d4a65ff 100644
--- a/drivers/gpu/drm/sun4i/sun4i_drv.c
+++ b/drivers/gpu/drm/sun4i/sun4i_drv.c
@@ -17,7 +17,7 @@
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
index 875a1156c04e..0422e73fcd4f 100644
--- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
@@ -16,7 +16,7 @@
 
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
 #include <drm/drm_probe_helper.h>
diff --git a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
index 4632dea2dc1e..d310e459c1b6 100644
--- a/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_ui_layer.c
@@ -12,7 +12,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -199,7 +199,7 @@ static int sun8i_ui_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 	ch_base = sun8i_channel_base(mixer, channel);
 
 	/* Get the physical address of the buffer in memory */
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
 
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index f7d0b082d634..d7713df4ee73 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -6,7 +6,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -321,7 +321,7 @@ static int sun8i_vi_layer_update_buffer(struct sun8i_mixer *mixer, int channel,
 
 	for (i = 0; i < format->num_planes; i++) {
 		/* Get the physical address of the buffer in memory */
-		gem = drm_fb_cma_get_gem_obj(fb, i);
+		gem = drm_fb_dma_get_gem_obj(fb, i);
 
 		DRM_DEBUG_DRIVER("Using GEM @ %pad\n", &gem->paddr);
 
diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index c04dda8353fd..308361e49c5e 100644
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
index dae47853b728..0261e16ea689 100644
--- a/drivers/gpu/drm/tidss/tidss_dispc.c
+++ b/drivers/gpu/drm/tidss/tidss_dispc.c
@@ -22,7 +22,7 @@
 #include <linux/sys_soc.h>
 
 #include <drm/drm_fourcc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_panel.h>
 
@@ -1958,7 +1958,7 @@ dma_addr_t dispc_plane_state_paddr(const struct drm_plane_state *state)
 	u32 x = state->src_x >> 16;
 	u32 y = state->src_y >> 16;
 
-	gem = drm_fb_cma_get_gem_obj(state->fb, 0);
+	gem = drm_fb_dma_get_gem_obj(state->fb, 0);
 
 	return gem->paddr + fb->offsets[0] + x * fb->format->cpp[0] +
 		y * fb->pitches[0];
@@ -1975,7 +1975,7 @@ dma_addr_t dispc_plane_state_p_uv_addr(const struct drm_plane_state *state)
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
index 217415ec8eea..a11b3f058f63 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -9,7 +9,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_crtc_helper.h>
 #include <drm/drm_fourcc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_gem_atomic_helper.h>
 
 #include "tidss_crtc.h"
diff --git a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
index 0dae7d5806bb..f74f98009eb7 100644
--- a/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
+++ b/drivers/gpu/drm/tilcdc/tilcdc_crtc.c
@@ -12,7 +12,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
 #include <drm/drm_modeset_helper_vtables.h>
@@ -67,7 +67,7 @@ static void set_scanout(struct drm_crtc *crtc, struct drm_framebuffer *fb)
 	dma_addr_t start, end;
 	u64 dma_base_and_ceiling;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 
 	start = gem->paddr + fb->offsets[0] +
 		crtc->y * fb->pitches[0] +
diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index f0fa3b15c341..fb6e97c22959 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -10,7 +10,7 @@
 #include <drm/drm_debugfs.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -224,7 +224,7 @@ static void arc_pgu_update(struct drm_simple_display_pipe *pipe,
 		return;
 
 	arcpgu = pipe_to_arcpgu_priv(pipe);
-	gem = drm_fb_cma_get_gem_obj(pipe->plane.state->fb, 0);
+	gem = drm_fb_dma_get_gem_obj(pipe->plane.state->fb, 0);
 	arc_pgu_write(arcpgu, ARCPGU_REG_BUF0_ADDR, gem->paddr);
 }
 
diff --git a/drivers/gpu/drm/tiny/ili9225.c b/drivers/gpu/drm/tiny/ili9225.c
index cc92eb9f2a07..7ddf6b9ac2f5 100644
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
 #include <drm/drm_gem_atomic_helper.h>
@@ -77,7 +77,7 @@ static inline int ili9225_command(struct mipi_dbi *dbi, u8 cmd, u16 data)
 
 static void ili9225_fb_dirty(struct drm_framebuffer *fb, struct drm_rect *rect)
 {
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(fb->dev);
 	unsigned int height = rect->y2 - rect->y1;
 	unsigned int width = rect->x2 - rect->x1;
diff --git a/drivers/gpu/drm/tiny/repaper.c b/drivers/gpu/drm/tiny/repaper.c
index a096fb8b83e9..30f56f4ce722 100644
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
 #include <drm/drm_gem_atomic_helper.h>
@@ -510,7 +510,7 @@ static void repaper_get_temperature(struct repaper_epd *epd)
 
 static int repaper_fb_dirty(struct drm_framebuffer *fb)
 {
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	struct repaper_epd *epd = drm_to_epd(fb->dev);
 	struct drm_rect clip;
 	int idx, ret = 0;
diff --git a/drivers/gpu/drm/tiny/st7586.c b/drivers/gpu/drm/tiny/st7586.c
index 3f38faa1cd8c..66da78a203ce 100644
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
 #include <drm/drm_gem_atomic_helper.h>
@@ -91,7 +91,7 @@ static void st7586_xrgb8888_to_gray332(u8 *dst, void *vaddr,
 static int st7586_buf_copy(void *dst, struct drm_framebuffer *fb,
 			   struct drm_rect *clip)
 {
-	struct drm_gem_cma_object *cma_obj = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_obj = drm_fb_dma_get_gem_obj(fb, 0);
 	void *src = cma_obj->vaddr;
 	int ret = 0;
 
diff --git a/drivers/gpu/drm/tve200/tve200_display.c b/drivers/gpu/drm/tve200/tve200_display.c
index 17b8c8dd169d..64674781e9dd 100644
--- a/drivers/gpu/drm/tve200/tve200_display.c
+++ b/drivers/gpu/drm/tve200/tve200_display.c
@@ -15,7 +15,7 @@
 #include <linux/of_graph.h>
 #include <linux/delay.h>
 
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_gem_cma_helper.h>
@@ -89,7 +89,7 @@ static int tve200_display_check(struct drm_simple_display_pipe *pipe,
 	}
 
 	if (fb) {
-		u32 offset = drm_fb_cma_get_gem_addr(fb, pstate, 0);
+		u32 offset = drm_fb_dma_get_gem_addr(fb, pstate, 0);
 
 		/* FB base address must be dword aligned. */
 		if (offset & 3) {
@@ -266,14 +266,14 @@ static void tve200_display_update(struct drm_simple_display_pipe *pipe,
 
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
index 1afcd54fbbd5..965028b2047f 100644
--- a/drivers/gpu/drm/v3d/v3d_drv.c
+++ b/drivers/gpu/drm/v3d/v3d_drv.c
@@ -23,7 +23,7 @@
 #include <linux/reset.h>
 
 #include <drm/drm_drv.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_managed.h>
 #include <uapi/drm/v3d_drm.h>
diff --git a/drivers/gpu/drm/vc4/vc4_crtc.c b/drivers/gpu/drm/vc4/vc4_crtc.c
index 9355213dc883..1a472c5a46ce 100644
--- a/drivers/gpu/drm/vc4/vc4_crtc.c
+++ b/drivers/gpu/drm/vc4/vc4_crtc.c
@@ -37,7 +37,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -817,7 +817,7 @@ static void vc4_async_page_flip_seqno_complete(struct vc4_seqno_cb *cb)
 
 	if (flip_state->old_fb) {
 		struct drm_gem_cma_object *cma_bo =
-			drm_fb_cma_get_gem_obj(flip_state->old_fb, 0);
+			drm_fb_dma_get_gem_obj(flip_state->old_fb, 0);
 		bo = to_vc4_bo(&cma_bo->base);
 	}
 
@@ -850,7 +850,7 @@ static int vc4_async_set_fence_cb(struct drm_device *dev,
 				  struct vc4_async_flip_state *flip_state)
 {
 	struct drm_framebuffer *fb = flip_state->fb;
-	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_bo = drm_fb_dma_get_gem_obj(fb, 0);
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct dma_fence *fence;
 	int ret;
@@ -938,7 +938,7 @@ static int vc4_async_page_flip(struct drm_crtc *crtc,
 {
 	struct drm_device *dev = crtc->dev;
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
-	struct drm_gem_cma_object *cma_bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *cma_bo = drm_fb_dma_get_gem_obj(fb, 0);
 	struct vc4_bo *bo = to_vc4_bo(&cma_bo->base);
 	int ret;
 
diff --git a/drivers/gpu/drm/vc4/vc4_drv.c b/drivers/gpu/drm/vc4/vc4_drv.c
index 0f0f0263e744..cd89abf55062 100644
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
index 1e866dc00ac3..afeeae682e4e 100644
--- a/drivers/gpu/drm/vc4/vc4_plane.c
+++ b/drivers/gpu/drm/vc4/vc4_plane.c
@@ -18,7 +18,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_uapi.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_plane_helper.h>
@@ -338,7 +338,7 @@ static int vc4_plane_setup_clipping_and_scaling(struct drm_plane_state *state)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(state);
 	struct drm_framebuffer *fb = state->fb;
-	struct drm_gem_cma_object *bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	u32 subpixel_src_mask = (1 << 16) - 1;
 	int num_planes = fb->format->num_planes;
 	struct drm_crtc_state *crtc_state;
@@ -1214,7 +1214,7 @@ u32 vc4_plane_dlist_size(const struct drm_plane_state *state)
 void vc4_plane_async_set_fb(struct drm_plane *plane, struct drm_framebuffer *fb)
 {
 	struct vc4_plane_state *vc4_state = to_vc4_plane_state(plane->state);
-	struct drm_gem_cma_object *bo = drm_fb_cma_get_gem_obj(fb, 0);
+	struct drm_gem_cma_object *bo = drm_fb_dma_get_gem_obj(fb, 0);
 	uint32_t addr;
 
 	/* We're skipping the address adjustment for negative origin,
@@ -1358,7 +1358,7 @@ static int vc4_prepare_fb(struct drm_plane *plane,
 	if (!state->fb)
 		return 0;
 
-	bo = to_vc4_bo(&drm_fb_cma_get_gem_obj(state->fb, 0)->base);
+	bo = to_vc4_bo(&drm_fb_dma_get_gem_obj(state->fb, 0)->base);
 
 	drm_gem_plane_helper_prepare_fb(plane, state);
 
@@ -1376,7 +1376,7 @@ static void vc4_cleanup_fb(struct drm_plane *plane,
 	if (plane->state->fb == state->fb || !state->fb)
 		return;
 
-	bo = to_vc4_bo(&drm_fb_cma_get_gem_obj(state->fb, 0)->base);
+	bo = to_vc4_bo(&drm_fb_dma_get_gem_obj(state->fb, 0)->base);
 	vc4_bo_dec_usecnt(bo);
 }
 
diff --git a/drivers/gpu/drm/vc4/vc4_txp.c b/drivers/gpu/drm/vc4/vc4_txp.c
index 3579d487402e..5e018cafa272 100644
--- a/drivers/gpu/drm/vc4/vc4_txp.c
+++ b/drivers/gpu/drm/vc4/vc4_txp.c
@@ -16,7 +16,7 @@
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_edid.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
@@ -311,7 +311,7 @@ static void vc4_txp_connector_atomic_commit(struct drm_connector *conn,
 		 */
 		ctrl |= TXP_ALPHA_INVERT;
 
-	gem = drm_fb_cma_get_gem_obj(fb, 0);
+	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	TXP_WRITE(TXP_DST_PTR, gem->paddr + fb->offsets[0]);
 	TXP_WRITE(TXP_DST_PITCH, fb->pitches[0]);
 	TXP_WRITE(TXP_DIM,
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 11c409cbc88e..6cebe0a4a224 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -14,7 +14,7 @@
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
-#include <drm/drm_fb_cma_helper.h>
+#include <drm/drm_fb_dma_helper.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
@@ -1100,7 +1100,7 @@ static int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
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

