Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 499F422E3E5
	for <lists+dri-devel@lfdr.de>; Mon, 27 Jul 2020 04:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66A676E1B3;
	Mon, 27 Jul 2020 02:07:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4025C6E14A
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Jul 2020 02:07:29 +0000 (UTC)
Received: from pendragon.bb.dnainternet.fi (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 769632F15;
 Mon, 27 Jul 2020 04:07:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1595815647;
 bh=t/+b/WNfDZudmGjID0JIYi1ok8k0f1aTek84yRp5Oic=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t6jhHIUBBR2Fr0EY6BdlyLEXZI79j5a3NVsj1Wqq3z0YUJbzLSypb95YXbpbK9jpO
 WgK6mbcoQTWufd/OKGcjc41XPVlW5b0DuiZYSObTbl0XSHPxAajvP4BKtAuJnlEFRJ
 ap7jKJZBERn2AjhfCuCDMeXr7p6QUmlXRexS0W5U=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 22/22] drm: mxsfb: Support the alpha plane
Date: Mon, 27 Jul 2020 05:06:54 +0300
Message-Id: <20200727020654.8231-23-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
References: <20200727020654.8231-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
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
Cc: Marek Vasut <marex@denx.de>, linux-imx@nxp.com, kernel@pengutronix.de,
 robert.chiras@nxp.com, leonard.crestez@nxp.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The LCDIF in the i.MX6SX and i.MX7 have a second plane called the alpha
plane. Support it.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
Reviewed-by: Stefan Agner <stefan@agner.ch>
---
Changes since v1:

- Split whitespace cleanup to a separate patch
---
 drivers/gpu/drm/mxsfb/mxsfb_drv.c  |   3 +
 drivers/gpu/drm/mxsfb/mxsfb_drv.h  |   6 +-
 drivers/gpu/drm/mxsfb/mxsfb_kms.c  | 129 +++++++++++++++++++++++++----
 drivers/gpu/drm/mxsfb/mxsfb_regs.h |  22 +++++
 4 files changed, 144 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.c b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
index bb80e12d9120..8c549c3931af 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.c
@@ -49,6 +49,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.next_buf	= LCDC_V3_NEXT_BUF,
 		.hs_wdth_mask	= 0xff,
 		.hs_wdth_shift	= 24,
+		.has_overlay	= false,
 	},
 	[MXSFB_V4] = {
 		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
@@ -56,6 +57,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.next_buf	= LCDC_V4_NEXT_BUF,
 		.hs_wdth_mask	= 0x3fff,
 		.hs_wdth_shift	= 18,
+		.has_overlay	= false,
 	},
 	[MXSFB_V6] = {
 		.transfer_count	= LCDC_V4_TRANSFER_COUNT,
@@ -63,6 +65,7 @@ static const struct mxsfb_devdata mxsfb_devdata[] = {
 		.next_buf	= LCDC_V4_NEXT_BUF,
 		.hs_wdth_mask	= 0x3fff,
 		.hs_wdth_shift	= 18,
+		.has_overlay	= true,
 	},
 };
 
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_drv.h b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
index f883b56caed3..399d23e91ed1 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_drv.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_drv.h
@@ -21,6 +21,7 @@ struct mxsfb_devdata {
 	unsigned int	next_buf;
 	unsigned int	hs_wdth_mask;
 	unsigned int	hs_wdth_shift;
+	bool		has_overlay;
 };
 
 struct mxsfb_drm_private {
@@ -32,7 +33,10 @@ struct mxsfb_drm_private {
 	struct clk			*clk_disp_axi;
 
 	struct drm_device		*drm;
-	struct drm_plane		plane;
+	struct {
+		struct drm_plane	primary;
+		struct drm_plane	overlay;
+	} planes;
 	struct drm_crtc			crtc;
 	struct drm_encoder		encoder;
 	struct drm_connector		*connector;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 505aa7e24239..b721b8b262ce 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -169,9 +169,9 @@ static int mxsfb_reset_block(struct mxsfb_drm_private *mxsfb)
 	return clear_poll_bit(mxsfb->base + LCDC_CTRL, CTRL_CLKGATE);
 }
 
-static dma_addr_t mxsfb_get_fb_paddr(struct mxsfb_drm_private *mxsfb)
+static dma_addr_t mxsfb_get_fb_paddr(struct drm_plane *plane)
 {
-	struct drm_framebuffer *fb = mxsfb->plane.state->fb;
+	struct drm_framebuffer *fb = plane->state->fb;
 	struct drm_gem_cma_object *gem;
 
 	if (!fb)
@@ -206,6 +206,9 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb)
 	/* Clear the FIFOs */
 	writel(CTRL1_FIFO_CLEAR, mxsfb->base + LCDC_CTRL1 + REG_SET);
 
+	if (mxsfb->devdata->has_overlay)
+		writel(0, mxsfb->base + LCDC_AS_CTRL);
+
 	mxsfb_set_formats(mxsfb);
 
 	clk_set_rate(mxsfb->clk, m->crtc_clock * 1000);
@@ -313,7 +316,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc *crtc,
 	mxsfb_crtc_mode_set_nofb(mxsfb);
 
 	/* Write cur_buf as well to avoid an initial corrupt frame */
-	paddr = mxsfb_get_fb_paddr(mxsfb);
+	paddr = mxsfb_get_fb_paddr(crtc->primary);
 	if (paddr) {
 		writel(paddr, mxsfb->base + mxsfb->devdata->cur_buf);
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
@@ -410,20 +413,85 @@ static int mxsfb_plane_atomic_check(struct drm_plane *plane,
 						   false, true);
 }
 
-static void mxsfb_plane_atomic_update(struct drm_plane *plane,
-				      struct drm_plane_state *old_pstate)
+static void mxsfb_plane_primary_atomic_update(struct drm_plane *plane,
+					      struct drm_plane_state *old_pstate)
 {
 	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
 	dma_addr_t paddr;
 
-	paddr = mxsfb_get_fb_paddr(mxsfb);
+	paddr = mxsfb_get_fb_paddr(plane);
 	if (paddr)
 		writel(paddr, mxsfb->base + mxsfb->devdata->next_buf);
 }
 
-static const struct drm_plane_helper_funcs mxsfb_plane_helper_funcs = {
+static void mxsfb_plane_overlay_atomic_update(struct drm_plane *plane,
+					      struct drm_plane_state *old_pstate)
+{
+	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(plane->dev);
+	struct drm_plane_state *state = plane->state;
+	dma_addr_t paddr;
+	u32 ctrl;
+
+	paddr = mxsfb_get_fb_paddr(plane);
+	if (!paddr) {
+		writel(0, mxsfb->base + LCDC_AS_CTRL);
+		return;
+	}
+
+	/*
+	 * HACK: The hardware seems to output 64 bytes of data of unknown
+	 * origin, and then to proceed with the framebuffer. Until the reason
+	 * is understood, live with the 16 initial invalid pixels on the first
+	 * line and start 64 bytes within the framebuffer.
+	 */
+	paddr += 64;
+
+	writel(paddr, mxsfb->base + LCDC_AS_NEXT_BUF);
+
+	/*
+	 * If the plane was previously disabled, write LCDC_AS_BUF as well to
+	 * provide the first buffer.
+	 */
+	if (!old_pstate->fb)
+		writel(paddr, mxsfb->base + LCDC_AS_BUF);
+
+	ctrl = AS_CTRL_AS_ENABLE | AS_CTRL_ALPHA(255);
+
+	switch (state->fb->format->format) {
+	case DRM_FORMAT_XRGB4444:
+		ctrl |= AS_CTRL_FORMAT_RGB444 | AS_CTRL_ALPHA_CTRL_OVERRIDE;
+		break;
+	case DRM_FORMAT_ARGB4444:
+		ctrl |= AS_CTRL_FORMAT_ARGB4444 | AS_CTRL_ALPHA_CTRL_EMBEDDED;
+		break;
+	case DRM_FORMAT_XRGB1555:
+		ctrl |= AS_CTRL_FORMAT_RGB555 | AS_CTRL_ALPHA_CTRL_OVERRIDE;
+		break;
+	case DRM_FORMAT_ARGB1555:
+		ctrl |= AS_CTRL_FORMAT_ARGB1555 | AS_CTRL_ALPHA_CTRL_EMBEDDED;
+		break;
+	case DRM_FORMAT_RGB565:
+		ctrl |= AS_CTRL_FORMAT_RGB565 | AS_CTRL_ALPHA_CTRL_OVERRIDE;
+		break;
+	case DRM_FORMAT_XRGB8888:
+		ctrl |= AS_CTRL_FORMAT_RGB888 | AS_CTRL_ALPHA_CTRL_OVERRIDE;
+		break;
+	case DRM_FORMAT_ARGB8888:
+		ctrl |= AS_CTRL_FORMAT_ARGB8888 | AS_CTRL_ALPHA_CTRL_EMBEDDED;
+		break;
+	}
+
+	writel(ctrl, mxsfb->base + LCDC_AS_CTRL);
+}
+
+static const struct drm_plane_helper_funcs mxsfb_plane_primary_helper_funcs = {
 	.atomic_check = mxsfb_plane_atomic_check,
-	.atomic_update = mxsfb_plane_atomic_update,
+	.atomic_update = mxsfb_plane_primary_atomic_update,
+};
+
+static const struct drm_plane_helper_funcs mxsfb_plane_overlay_helper_funcs = {
+	.atomic_check = mxsfb_plane_atomic_check,
+	.atomic_update = mxsfb_plane_overlay_atomic_update,
 };
 
 static const struct drm_plane_funcs mxsfb_plane_funcs = {
@@ -435,9 +503,19 @@ static const struct drm_plane_funcs mxsfb_plane_funcs = {
 	.atomic_destroy_state	= drm_atomic_helper_plane_destroy_state,
 };
 
-static const uint32_t mxsfb_formats[] = {
+static const uint32_t mxsfb_primary_plane_formats[] = {
+	DRM_FORMAT_RGB565,
 	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_RGB565
+};
+
+static const uint32_t mxsfb_overlay_plane_formats[] = {
+	DRM_FORMAT_XRGB4444,
+	DRM_FORMAT_ARGB4444,
+	DRM_FORMAT_XRGB1555,
+	DRM_FORMAT_ARGB1555,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_ARGB8888,
 };
 
 static const uint64_t mxsfb_modifiers[] = {
@@ -445,23 +523,44 @@ static const uint64_t mxsfb_modifiers[] = {
 	DRM_FORMAT_MOD_INVALID
 };
 
+/* -----------------------------------------------------------------------------
+ * Initialization
+ */
+
 int mxsfb_kms_init(struct mxsfb_drm_private *mxsfb)
 {
 	struct drm_encoder *encoder = &mxsfb->encoder;
-	struct drm_plane *plane = &mxsfb->plane;
 	struct drm_crtc *crtc = &mxsfb->crtc;
 	int ret;
 
-	drm_plane_helper_add(plane, &mxsfb_plane_helper_funcs);
-	ret = drm_universal_plane_init(mxsfb->drm, plane, 0, &mxsfb_plane_funcs,
-				       mxsfb_formats, ARRAY_SIZE(mxsfb_formats),
+	drm_plane_helper_add(&mxsfb->planes.primary,
+			     &mxsfb_plane_primary_helper_funcs);
+	ret = drm_universal_plane_init(mxsfb->drm, &mxsfb->planes.primary, 1,
+				       &mxsfb_plane_funcs,
+				       mxsfb_primary_plane_formats,
+				       ARRAY_SIZE(mxsfb_primary_plane_formats),
 				       mxsfb_modifiers, DRM_PLANE_TYPE_PRIMARY,
 				       NULL);
 	if (ret)
 		return ret;
 
+	if (mxsfb->devdata->has_overlay) {
+		drm_plane_helper_add(&mxsfb->planes.overlay,
+				     &mxsfb_plane_overlay_helper_funcs);
+		ret = drm_universal_plane_init(mxsfb->drm,
+					       &mxsfb->planes.overlay, 1,
+					       &mxsfb_plane_funcs,
+					       mxsfb_overlay_plane_formats,
+					       ARRAY_SIZE(mxsfb_overlay_plane_formats),
+					       mxsfb_modifiers, DRM_PLANE_TYPE_OVERLAY,
+					       NULL);
+		if (ret)
+			return ret;
+	}
+
 	drm_crtc_helper_add(crtc, &mxsfb_crtc_helper_funcs);
-	ret = drm_crtc_init_with_planes(mxsfb->drm, crtc, plane, NULL,
+	ret = drm_crtc_init_with_planes(mxsfb->drm, crtc,
+					&mxsfb->planes.primary, NULL,
 					&mxsfb_crtc_funcs, NULL);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/mxsfb/mxsfb_regs.h b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
index 8ebb52bb1b46..55d28a27f912 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_regs.h
+++ b/drivers/gpu/drm/mxsfb/mxsfb_regs.h
@@ -27,6 +27,11 @@
 #define LCDC_VDCTRL4			0xb0
 #define LCDC_V4_DEBUG0			0x1d0
 #define LCDC_V3_DEBUG0			0x1f0
+#define LCDC_AS_CTRL			0x210
+#define LCDC_AS_BUF			0x220
+#define LCDC_AS_NEXT_BUF		0x230
+#define LCDC_AS_CLRKEYLOW		0x240
+#define LCDC_AS_CLRKEYHIGH		0x250
 
 #define CTRL_SFTRST			BIT(31)
 #define CTRL_CLKGATE			BIT(30)
@@ -90,6 +95,23 @@
 #define DEBUG0_HSYNC			BIT(26)
 #define DEBUG0_VSYNC			BIT(25)
 
+#define AS_CTRL_PS_DISABLE		BIT(23)
+#define AS_CTRL_ALPHA_INVERT		BIT(20)
+#define AS_CTRL_ALPHA(a)		(((a) & 0xff) << 8)
+#define AS_CTRL_FORMAT_RGB565		(0xe << 4)
+#define AS_CTRL_FORMAT_RGB444		(0xd << 4)
+#define AS_CTRL_FORMAT_RGB555		(0xc << 4)
+#define AS_CTRL_FORMAT_ARGB4444		(0x9 << 4)
+#define AS_CTRL_FORMAT_ARGB1555		(0x8 << 4)
+#define AS_CTRL_FORMAT_RGB888		(0x4 << 4)
+#define AS_CTRL_FORMAT_ARGB8888		(0x0 << 4)
+#define AS_CTRL_ENABLE_COLORKEY		BIT(3)
+#define AS_CTRL_ALPHA_CTRL_ROP		(3 << 1)
+#define AS_CTRL_ALPHA_CTRL_MULTIPLY	(2 << 1)
+#define AS_CTRL_ALPHA_CTRL_OVERRIDE	(1 << 1)
+#define AS_CTRL_ALPHA_CTRL_EMBEDDED	(0 << 1)
+#define AS_CTRL_AS_ENABLE		BIT(0)
+
 #define MXSFB_MIN_XRES			120
 #define MXSFB_MIN_YRES			120
 #define MXSFB_MAX_XRES			0xffff
-- 
Regards,

Laurent Pinchart

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
