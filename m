Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE177582DA
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jul 2023 18:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CB4310E38E;
	Tue, 18 Jul 2023 16:55:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from xavier.telenet-ops.be (xavier.telenet-ops.be
 [IPv6:2a02:1800:120:4::f00:14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E78210E38E
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jul 2023 16:54:54 +0000 (UTC)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:5803:2d6d:5bbc:e252])
 by xavier.telenet-ops.be with bizsmtp
 id Ngur2A00J0ucMBo01gur1S; Tue, 18 Jul 2023 18:54:52 +0200
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtp (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyD-001nYO-AE;
 Tue, 18 Jul 2023 18:54:51 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
 (envelope-from <geert@linux-m68k.org>) id 1qLnyN-000gcJ-BM;
 Tue, 18 Jul 2023 18:54:51 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH v2 15/41] drm: renesas: shmobile: Remove support for SYS panels
Date: Tue, 18 Jul 2023 18:54:20 +0200
Message-Id: <1b6d7f51fb685c589ffa7d6394ac8f3d4390e904.1689698048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1689698048.git.geert+renesas@glider.be>
References: <cover.1689698048.git.geert+renesas@glider.be>
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

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

SYS panels are not used, and have no defined DT bindings.  Remove their
support to avoid impeding DT support.  It can always be added back
later.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - No changes.

Changes compared to Laurent's original:
  - Remove "/* TODO: Setup SYS panel */" comment.
---
 .../gpu/drm/renesas/shmobile/shmob_drm_crtc.c | 20 ---------------
 .../gpu/drm/renesas/shmobile/shmob_drm_drv.c  | 11 --------
 include/linux/platform_data/shmob_drm.h       | 25 -------------------
 3 files changed, 56 deletions(-)

diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
index 2ccb2fbfea26b5bf..015263ac2100c11e 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_crtc.c
@@ -55,24 +55,6 @@ static void shmob_drm_crtc_setup_geometry(struct shmob_drm_crtc *scrtc)
 	      | ((idata->flags & SHMOB_DRM_IFACE_FL_DWCNT) ? LDMT1R_DWCNT : 0);
 	lcdc_write(sdev, LDMT1R, value);
 
-	if (idata->interface >= SHMOB_DRM_IFACE_SYS8A &&
-	    idata->interface <= SHMOB_DRM_IFACE_SYS24) {
-		/* Setup SYS bus. */
-		value = (idata->sys.cs_setup << LDMT2R_CSUP_SHIFT)
-		      | (idata->sys.vsync_active_high ? LDMT2R_RSV : 0)
-		      | (idata->sys.vsync_dir_input ? LDMT2R_VSEL : 0)
-		      | (idata->sys.write_setup << LDMT2R_WCSC_SHIFT)
-		      | (idata->sys.write_cycle << LDMT2R_WCEC_SHIFT)
-		      | (idata->sys.write_strobe << LDMT2R_WCLW_SHIFT);
-		lcdc_write(sdev, LDMT2R, value);
-
-		value = (idata->sys.read_latch << LDMT3R_RDLC_SHIFT)
-		      | (idata->sys.read_setup << LDMT3R_RCSC_SHIFT)
-		      | (idata->sys.read_cycle << LDMT3R_RCEC_SHIFT)
-		      | (idata->sys.read_strobe << LDMT3R_RCLW_SHIFT);
-		lcdc_write(sdev, LDMT3R, value);
-	}
-
 	value = ((mode->hdisplay / 8) << 16)			/* HDCN */
 	      | (mode->htotal / 8);				/* HTCN */
 	lcdc_write(sdev, LDHCNR, value);
@@ -180,8 +162,6 @@ static void shmob_drm_crtc_start(struct shmob_drm_crtc *scrtc)
 	lcdc_write(sdev, LDDCKSTPR, 0);
 	lcdc_wait_bit(sdev, LDDCKSTPR, ~0, 0);
 
-	/* TODO: Setup SYS panel */
-
 	/* Setup geometry, format, frame buffer memory and operation mode. */
 	shmob_drm_crtc_setup_geometry(scrtc);
 
diff --git a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
index 1157b4894ff319cd..782767fc66d00c4f 100644
--- a/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
+++ b/drivers/gpu/drm/renesas/shmobile/shmob_drm_drv.c
@@ -43,17 +43,6 @@ static int shmob_drm_init_interface(struct shmob_drm_device *sdev)
 		[SHMOB_DRM_IFACE_RGB18] = LDMT1R_MIFTYP_RGB18,
 		[SHMOB_DRM_IFACE_RGB24] = LDMT1R_MIFTYP_RGB24,
 		[SHMOB_DRM_IFACE_YUV422] = LDMT1R_MIFTYP_YCBCR,
-		[SHMOB_DRM_IFACE_SYS8A] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS8A,
-		[SHMOB_DRM_IFACE_SYS8B] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS8B,
-		[SHMOB_DRM_IFACE_SYS8C] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS8C,
-		[SHMOB_DRM_IFACE_SYS8D] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS8D,
-		[SHMOB_DRM_IFACE_SYS9] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS9,
-		[SHMOB_DRM_IFACE_SYS12] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS12,
-		[SHMOB_DRM_IFACE_SYS16A] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS16A,
-		[SHMOB_DRM_IFACE_SYS16B] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS16B,
-		[SHMOB_DRM_IFACE_SYS16C] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS16C,
-		[SHMOB_DRM_IFACE_SYS18] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS18,
-		[SHMOB_DRM_IFACE_SYS24] = LDMT1R_IFM | LDMT1R_MIFTYP_SYS24,
 	};
 
 	if (sdev->pdata->iface.interface >= ARRAY_SIZE(ldmt1r)) {
diff --git a/include/linux/platform_data/shmob_drm.h b/include/linux/platform_data/shmob_drm.h
index b6b5b6607fb5e52c..b728e24222d99158 100644
--- a/include/linux/platform_data/shmob_drm.h
+++ b/include/linux/platform_data/shmob_drm.h
@@ -27,17 +27,6 @@ enum shmob_drm_interface {
 	SHMOB_DRM_IFACE_RGB18,		/* 18bpp */
 	SHMOB_DRM_IFACE_RGB24,		/* 24bpp */
 	SHMOB_DRM_IFACE_YUV422,		/* 16bpp */
-	SHMOB_DRM_IFACE_SYS8A,		/* 24bpp, 8:8:8 */
-	SHMOB_DRM_IFACE_SYS8B,		/* 18bpp, 8:8:2 */
-	SHMOB_DRM_IFACE_SYS8C,		/* 18bpp, 2:8:8 */
-	SHMOB_DRM_IFACE_SYS8D,		/* 16bpp, 8:8 */
-	SHMOB_DRM_IFACE_SYS9,		/* 18bpp, 9:9 */
-	SHMOB_DRM_IFACE_SYS12,		/* 24bpp, 12:12 */
-	SHMOB_DRM_IFACE_SYS16A,		/* 16bpp */
-	SHMOB_DRM_IFACE_SYS16B,		/* 18bpp, 16:2 */
-	SHMOB_DRM_IFACE_SYS16C,		/* 18bpp, 2:16 */
-	SHMOB_DRM_IFACE_SYS18,		/* 18bpp */
-	SHMOB_DRM_IFACE_SYS24,		/* 24bpp */
 };
 
 struct shmob_drm_panel_data {
@@ -46,19 +35,6 @@ struct shmob_drm_panel_data {
 	struct drm_mode_modeinfo mode;
 };
 
-struct shmob_drm_sys_interface_data {
-	unsigned int read_latch:6;
-	unsigned int read_setup:8;
-	unsigned int read_cycle:8;
-	unsigned int read_strobe:8;
-	unsigned int write_setup:8;
-	unsigned int write_cycle:8;
-	unsigned int write_strobe:8;
-	unsigned int cs_setup:3;
-	unsigned int vsync_active_high:1;
-	unsigned int vsync_dir_input:1;
-};
-
 #define SHMOB_DRM_IFACE_FL_DWPOL (1 << 0) /* Rising edge dot clock data latch */
 #define SHMOB_DRM_IFACE_FL_DIPOL (1 << 1) /* Active low display enable */
 #define SHMOB_DRM_IFACE_FL_DAPOL (1 << 2) /* Active low display data */
@@ -67,7 +43,6 @@ struct shmob_drm_sys_interface_data {
 
 struct shmob_drm_interface_data {
 	enum shmob_drm_interface interface;
-	struct shmob_drm_sys_interface_data sys;
 	unsigned int clk_div;
 	unsigned int flags;
 };
-- 
2.34.1

