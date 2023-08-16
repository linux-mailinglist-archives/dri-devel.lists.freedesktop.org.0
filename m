Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B50DB77DF31
	for <lists+dri-devel@lfdr.de>; Wed, 16 Aug 2023 12:45:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3FF410E33C;
	Wed, 16 Aug 2023 10:45:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be
 [IPv6:2a02:1800:110:4::f00:1a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A636C10E32E
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Aug 2023 10:44:44 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5d0c:f209:12a7:4ce5])
 by albert.telenet-ops.be with bizsmtp
 id aAkh2A01645ualL06AkhRA; Wed, 16 Aug 2023 12:44:43 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWE0x-000osp-BQ;
 Wed, 16 Aug 2023 12:44:41 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qWDAw-00674y-IZ;
 Wed, 16 Aug 2023 11:50:50 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v3 11/41] drm: renesas: shmobile: Improve
 shmob_drm_format_info table
Date: Wed, 16 Aug 2023 11:50:18 +0200
Message-Id: <23228c37a0b15c3cfe8e0d02f16892ea273f023a.1692178020.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1692178020.git.geert+renesas@glider.be>
References: <cover.1692178020.git.geert+renesas@glider.be>
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
Cc: linux-renesas-soc@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve the table containing hardware information related to the
supported plane formats:
  1. Move (part of) the overlay format register settings from multiple
     switch() statements spread across the code into the table, like is
     already done for the primary plane register settings,
  2. Remove the .yuv field, as that information can easily be extracted
     from the register settings using a new helper macro,
  3. Shrink and move the .bpp field to reduce table size.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
v3:
  - No changes,

v2:
  - Add Reviewed-by.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 29 ++--------
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.c  | 42 ++++++++++----
 .../gpu/drm/renesas/shmobile/shmob_drm_kms.h  |  9 ++-
 .../drm/renesas/shmobile/shmob_drm_plane.c    | 56 ++-----------------
 4 files changed, 47 insertions(+), 89 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index a0e1a49c84d5691a..2cdf8f9b06e5feb8 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -191,31 +191,12 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	lcdc_write(sdev, LDDFR, format->lddfr | LDDFR_CF1);
 	lcdc_write(sdev, LDMLSR, scrtc->line_size);
 	lcdc_write(sdev, LDSA1R, scrtc->dma[0]);
-	if (format->yuv)
+	if (shmob_drm_format_is_yuv(format))
 		lcdc_write(sdev, LDSA2R, scrtc->dma[1]);
 	lcdc_write(sdev, LDSM1R, 0);
 
 	/* Word and long word swap. */
-	switch (format->fourcc) {
-	case DRM_FORMAT_RGB565:
-	case DRM_FORMAT_NV21:
-	case DRM_FORMAT_NV61:
-	case DRM_FORMAT_NV42:
-		value = LDDDSR_LS | LDDDSR_WS;
-		break;
-	case DRM_FORMAT_RGB888:
-	case DRM_FORMAT_NV12:
-	case DRM_FORMAT_NV16:
-	case DRM_FORMAT_NV24:
-		value = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS;
-		break;
-	case DRM_FORMAT_ARGB8888:
-	case DRM_FORMAT_XRGB8888:
-	default:
-		value = LDDDSR_LS;
-		break;
-	}
-	lcdc_write(sdev, LDDDSR, value);
+	lcdc_write(sdev, LDDDSR, format->ldddsr);
 
 	/* Setup planes. */
 	drm_for_each_legacy_plane(plane, dev) {
@@ -271,12 +252,12 @@ static void shmob_drm_crtc_compute_base(struct shmob_drm_crtc *scrtc,
 	struct drm_gem_dma_object *gem;
 	unsigned int bpp;
 
-	bpp = scrtc->format->yuv ? 8 : scrtc->format->bpp;
+	bpp = shmob_drm_format_is_yuv(scrtc->format) ? 8 : scrtc->format->bpp;
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	scrtc->dma[0] = gem->dma_addr + fb->offsets[0]
 		      + y * fb->pitches[0] + x * bpp / 8;
 
-	if (scrtc->format->yuv) {
+	if (shmob_drm_format_is_yuv(scrtc->format)) {
 		bpp = scrtc->format->bpp - 8;
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
 		scrtc->dma[1] = gem->dma_addr + fb->offsets[1]
@@ -293,7 +274,7 @@ static void shmob_drm_crtc_update_base(struct shmob_drm_crtc *scrtc)
 	shmob_drm_crtc_compute_base(scrtc, crtc->x, crtc->y);
 
 	lcdc_write_mirror(sdev, LDSA1R, scrtc->dma[0]);
-	if (scrtc->format->yuv)
+	if (shmob_drm_format_is_yuv(scrtc->format))
 		lcdc_write_mirror(sdev, LDSA2R, scrtc->dma[1]);
 
 	lcdc_write(sdev, LDRCNTR, lcdc_read(sdev, LDRCNTR) ^ LDRCNTR_MRS);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
index 99381cc0abf3ae1f..8fd360149743f8e2 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.c
@@ -27,53 +27,73 @@ static const struct shmob_drm_format_info shmob_drm_format_infos[] = {
 	{
 		.fourcc = DRM_FORMAT_RGB565,
 		.bpp = 16,
-		.yuv = false,
 		.lddfr = LDDFR_PKF_RGB16,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_RY | LDBBSIFR_RPKF_RGB16,
 	}, {
 		.fourcc = DRM_FORMAT_RGB888,
 		.bpp = 24,
-		.yuv = false,
 		.lddfr = LDDFR_PKF_RGB24,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_SWPB | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24,
 	}, {
 		.fourcc = DRM_FORMAT_ARGB8888,
 		.bpp = 32,
-		.yuv = false,
 		.lddfr = LDDFR_PKF_ARGB32,
+		.ldddsr = LDDDSR_LS,
+		.ldbbsifr = LDBBSIFR_AL_PK | LDBBSIFR_SWPL | LDBBSIFR_RY |
+			    LDBBSIFR_RPKF_ARGB32,
 	}, {
 		.fourcc = DRM_FORMAT_XRGB8888,
 		.bpp = 32,
-		.yuv = false,
 		.lddfr = LDDFR_PKF_ARGB32,
+		.ldddsr = LDDDSR_LS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_RY |
+			    LDBBSIFR_RPKF_ARGB32,
 	}, {
 		.fourcc = DRM_FORMAT_NV12,
 		.bpp = 12,
-		.yuv = true,
 		.lddfr = LDDFR_CC | LDDFR_YF_420,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_SWPB | LDBBSIFR_CHRR_420,
 	}, {
 		.fourcc = DRM_FORMAT_NV21,
 		.bpp = 12,
-		.yuv = true,
 		.lddfr = LDDFR_CC | LDDFR_YF_420,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_CHRR_420,
 	}, {
 		.fourcc = DRM_FORMAT_NV16,
 		.bpp = 16,
-		.yuv = true,
 		.lddfr = LDDFR_CC | LDDFR_YF_422,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_SWPB | LDBBSIFR_CHRR_422,
 	}, {
 		.fourcc = DRM_FORMAT_NV61,
 		.bpp = 16,
-		.yuv = true,
 		.lddfr = LDDFR_CC | LDDFR_YF_422,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_CHRR_422,
 	}, {
 		.fourcc = DRM_FORMAT_NV24,
 		.bpp = 24,
-		.yuv = true,
 		.lddfr = LDDFR_CC | LDDFR_YF_444,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS | LDDDSR_BS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_SWPB | LDBBSIFR_CHRR_444,
 	}, {
 		.fourcc = DRM_FORMAT_NV42,
 		.bpp = 24,
-		.yuv = true,
 		.lddfr = LDDFR_CC | LDDFR_YF_444,
+		.ldddsr = LDDDSR_LS | LDDDSR_WS,
+		.ldbbsifr = LDBBSIFR_AL_1 | LDBBSIFR_SWPL | LDBBSIFR_SWPW |
+			    LDBBSIFR_CHRR_444,
 	},
 };
 
@@ -112,7 +132,7 @@ shmob_drm_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 		return ERR_PTR(-EINVAL);
 	}
 
-	if (format->yuv) {
+	if (shmob_drm_format_is_yuv(format)) {
 		unsigned int chroma_cpp = format->bpp == 24 ? 2 : 1;
 
 		if (mode_cmd->pitches[1] != mode_cmd->pitches[0] * chroma_cpp) {
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h
index 0347b1fd2338a84d..590162c3db20209d 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_kms.h
@@ -17,11 +17,14 @@ struct shmob_drm_device;
 
 struct shmob_drm_format_info {
 	u32 fourcc;
-	unsigned int bpp;
-	bool yuv;
-	u32 lddfr;
+	u32 lddfr;	/* LCD Data Format Register */
+	u16 ldbbsifr;	/* CHn Source Image Format Register low bits */
+	u8 ldddsr;	/* LCDC Input Image Data Swap Register low bits */
+	u8 bpp;
 };
 
+#define shmob_drm_format_is_yuv(format)	((format)->lddfr & LDDFR_CC)
+
 const struct shmob_drm_format_info *shmob_drm_format_info(u32 fourcc);
 
 int shmob_drm_modeset_init(struct shmob_drm_device *sdev);
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
index 36fedb2b74c8b7a2..0b2ab153e9ae76df 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_plane.c
@@ -43,12 +43,12 @@ static void shmob_drm_plane_compute_base(struct shmob_drm_plane *splane,
 	struct drm_gem_dma_object *gem;
 	unsigned int bpp;
 
-	bpp = splane->format->yuv ? 8 : splane->format->bpp;
+	bpp = shmob_drm_format_is_yuv(splane->format) ? 8 : splane->format->bpp;
 	gem = drm_fb_dma_get_gem_obj(fb, 0);
 	splane->dma[0] = gem->dma_addr + fb->offsets[0]
 		       + y * fb->pitches[0] + x * bpp / 8;
 
-	if (splane->format->yuv) {
+	if (shmob_drm_format_is_yuv(splane->format)) {
 		bpp = splane->format->bpp - 8;
 		gem = drm_fb_dma_get_gem_obj(fb, 1);
 		splane->dma[1] = gem->dma_addr + fb->offsets[1]
@@ -64,54 +64,8 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	u32 format;
 
 	/* TODO: Support ROP3 mode */
-	format = LDBBSIFR_EN | (splane->alpha << LDBBSIFR_LAY_SHIFT);
-
-	switch (splane->format->fourcc) {
-	case DRM_FORMAT_RGB565:
-	case DRM_FORMAT_NV21:
-	case DRM_FORMAT_NV61:
-	case DRM_FORMAT_NV42:
-		format |= LDBBSIFR_SWPL | LDBBSIFR_SWPW;
-		break;
-	case DRM_FORMAT_RGB888:
-	case DRM_FORMAT_NV12:
-	case DRM_FORMAT_NV16:
-	case DRM_FORMAT_NV24:
-		format |= LDBBSIFR_SWPL | LDBBSIFR_SWPW | LDBBSIFR_SWPB;
-		break;
-	case DRM_FORMAT_ARGB8888:
-	case DRM_FORMAT_XRGB8888:
-	default:
-		format |= LDBBSIFR_SWPL;
-		break;
-	}
-
-	switch (splane->format->fourcc) {
-	case DRM_FORMAT_RGB565:
-		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB16;
-		break;
-	case DRM_FORMAT_RGB888:
-		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_RGB24;
-		break;
-	case DRM_FORMAT_ARGB8888:
-		format |= LDBBSIFR_AL_PK | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;
-		break;
-	case DRM_FORMAT_XRGB8888:
-		format |= LDBBSIFR_AL_1 | LDBBSIFR_RY | LDBBSIFR_RPKF_ARGB32;
-		break;
-	case DRM_FORMAT_NV12:
-	case DRM_FORMAT_NV21:
-		format |= LDBBSIFR_AL_1 | LDBBSIFR_CHRR_420;
-		break;
-	case DRM_FORMAT_NV16:
-	case DRM_FORMAT_NV61:
-		format |= LDBBSIFR_AL_1 | LDBBSIFR_CHRR_422;
-		break;
-	case DRM_FORMAT_NV24:
-	case DRM_FORMAT_NV42:
-		format |= LDBBSIFR_AL_1 | LDBBSIFR_CHRR_444;
-		break;
-	}
+	format = LDBBSIFR_EN | (splane->alpha << LDBBSIFR_LAY_SHIFT) |
+		 splane->format->ldbbsifr;
 
 #define plane_reg_dump(sdev, splane, reg) \
 	dev_dbg(sdev->ddev->dev, "%s(%u): %s 0x%08x 0x%08x\n", __func__, \
@@ -144,7 +98,7 @@ static void __shmob_drm_plane_setup(struct shmob_drm_plane *splane,
 	shmob_drm_plane_compute_base(splane, fb, splane->src_x, splane->src_y);
 
 	lcdc_write(sdev, LDBnBSAYR(splane->index), splane->dma[0]);
-	if (splane->format->yuv)
+	if (shmob_drm_format_is_yuv(splane->format))
 		lcdc_write(sdev, LDBnBSACR(splane->index), splane->dma[1]);
 
 	lcdc_write(sdev, LDBCR,
-- 
2.34.1

