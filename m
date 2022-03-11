Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 266574D672F
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 18:06:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D4510E36F;
	Fri, 11 Mar 2022 17:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9A6210E29C
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Mar 2022 17:06:27 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8E1AC83AEF;
 Fri, 11 Mar 2022 18:06:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1647018386;
 bh=YSWtvHkDu/U57mRJHlPZYxK4wKb07I3BMyExLp2CZ7w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QHjMdAKQDrMZBIrtZMNway4MNDK52kUKrjvMl0R1pDUvEu6XayY88JuNae4Gw7TPo
 W4RKiQLeGISC0SHkvta3h+lrp1wFdfoUT+sIWCJIj8WGfp2+GzB50uXgSFIlBp/P7Y
 OCPUhBIkzhexvKp+gk9iflttbqSyTMOBLNENC1Ex+PPbVy1SO4JcCHR2SoKXlp4rbS
 LzIfzQgnO8Nx/kAX1fZrvw9LQPhKGPC7Gfi6ihCvdsQU+MMJMvIpwrHlxRmQan+Zsb
 omMGr/7yyVNlbFLDii/2gdixL0ZKjznMg6Z5yFM5OVYsoiKlRssYYcqxvL1Df/dTHB
 ZmClRC8rKMjMg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/7] drm: mxsfb: Factor out mxsfb_set_mode()
Date: Fri, 11 Mar 2022 18:05:59 +0100
Message-Id: <20220311170601.50995-5-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220311170601.50995-1-marex@denx.de>
References: <20220311170601.50995-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
X-Virus-Status: Clean
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Robby Cai <robby.cai@nxp.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Pull mode registers programming from mxsfb_enable_controller() into
dedicated function mxsfb_set_mode(). This is a clean up. No functional
change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Robby Cai <robby.cai@nxp.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Stefan Agner <stefan@agner.ch>
---
V2: No change
---
 drivers/gpu/drm/mxsfb/mxsfb_kms.c | 96 +++++++++++++++++--------------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
index 7b0abd0472aae..14f5cc590a51b 100644
--- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
+++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
@@ -111,6 +111,57 @@ static void mxsfb_set_formats(struct mxsfb_drm_private *mxsfb,
 	writel(ctrl, mxsfb->base + LCDC_CTRL);
 }
 
+static void mxsfb_set_mode(struct mxsfb_drm_private *mxsfb, u32 bus_flags)
+{
+	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
+	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
+
+	writel(TRANSFER_COUNT_SET_VCOUNT(m->crtc_vdisplay) |
+	       TRANSFER_COUNT_SET_HCOUNT(m->crtc_hdisplay),
+	       mxsfb->base + mxsfb->devdata->transfer_count);
+
+	vsync_pulse_len = m->crtc_vsync_end - m->crtc_vsync_start;
+
+	vdctrl0 = VDCTRL0_ENABLE_PRESENT |	/* Always in DOTCLOCK mode */
+		  VDCTRL0_VSYNC_PERIOD_UNIT |
+		  VDCTRL0_VSYNC_PULSE_WIDTH_UNIT |
+		  VDCTRL0_SET_VSYNC_PULSE_WIDTH(vsync_pulse_len);
+	if (m->flags & DRM_MODE_FLAG_PHSYNC)
+		vdctrl0 |= VDCTRL0_HSYNC_ACT_HIGH;
+	if (m->flags & DRM_MODE_FLAG_PVSYNC)
+		vdctrl0 |= VDCTRL0_VSYNC_ACT_HIGH;
+	/* Make sure Data Enable is high active by default */
+	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
+		vdctrl0 |= VDCTRL0_ENABLE_ACT_HIGH;
+	/*
+	 * DRM_BUS_FLAG_PIXDATA_DRIVE_ defines are controller centric,
+	 * controllers VDCTRL0_DOTCLK is display centric.
+	 * Drive on positive edge       -> display samples on falling edge
+	 * DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE -> VDCTRL0_DOTCLK_ACT_FALLING
+	 */
+	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
+		vdctrl0 |= VDCTRL0_DOTCLK_ACT_FALLING;
+
+	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
+
+	/* Frame length in lines. */
+	writel(m->crtc_vtotal, mxsfb->base + LCDC_VDCTRL1);
+
+	/* Line length in units of clocks or pixels. */
+	hsync_pulse_len = m->crtc_hsync_end - m->crtc_hsync_start;
+	writel(set_hsync_pulse_width(mxsfb, hsync_pulse_len) |
+	       VDCTRL2_SET_HSYNC_PERIOD(m->crtc_htotal),
+	       mxsfb->base + LCDC_VDCTRL2);
+
+	writel(SET_HOR_WAIT_CNT(m->crtc_htotal - m->crtc_hsync_start) |
+	       SET_VERT_WAIT_CNT(m->crtc_vtotal - m->crtc_vsync_start),
+	       mxsfb->base + LCDC_VDCTRL3);
+
+	writel(SET_DOTCLK_H_VALID_DATA_CNT(m->hdisplay),
+	       mxsfb->base + LCDC_VDCTRL4);
+
+}
+
 static void mxsfb_enable_controller(struct mxsfb_drm_private *mxsfb)
 {
 	u32 reg;
@@ -236,7 +287,6 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 	struct drm_device *drm = mxsfb->crtc.dev;
 	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
 	u32 bus_flags = mxsfb->connector->display_info.bus_flags;
-	u32 vdctrl0, vsync_pulse_len, hsync_pulse_len;
 	int err;
 
 	/* Mandatory eLCDIF reset as per the Reference Manual */
@@ -256,49 +306,7 @@ static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
 			     bus_flags);
 	DRM_DEV_DEBUG_DRIVER(drm->dev, "Mode flags: 0x%08X\n", m->flags);
 
-	writel(TRANSFER_COUNT_SET_VCOUNT(m->crtc_vdisplay) |
-	       TRANSFER_COUNT_SET_HCOUNT(m->crtc_hdisplay),
-	       mxsfb->base + mxsfb->devdata->transfer_count);
-
-	vsync_pulse_len = m->crtc_vsync_end - m->crtc_vsync_start;
-
-	vdctrl0 = VDCTRL0_ENABLE_PRESENT |	/* Always in DOTCLOCK mode */
-		  VDCTRL0_VSYNC_PERIOD_UNIT |
-		  VDCTRL0_VSYNC_PULSE_WIDTH_UNIT |
-		  VDCTRL0_SET_VSYNC_PULSE_WIDTH(vsync_pulse_len);
-	if (m->flags & DRM_MODE_FLAG_PHSYNC)
-		vdctrl0 |= VDCTRL0_HSYNC_ACT_HIGH;
-	if (m->flags & DRM_MODE_FLAG_PVSYNC)
-		vdctrl0 |= VDCTRL0_VSYNC_ACT_HIGH;
-	/* Make sure Data Enable is high active by default */
-	if (!(bus_flags & DRM_BUS_FLAG_DE_LOW))
-		vdctrl0 |= VDCTRL0_ENABLE_ACT_HIGH;
-	/*
-	 * DRM_BUS_FLAG_PIXDATA_DRIVE_ defines are controller centric,
-	 * controllers VDCTRL0_DOTCLK is display centric.
-	 * Drive on positive edge       -> display samples on falling edge
-	 * DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE -> VDCTRL0_DOTCLK_ACT_FALLING
-	 */
-	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_POSEDGE)
-		vdctrl0 |= VDCTRL0_DOTCLK_ACT_FALLING;
-
-	writel(vdctrl0, mxsfb->base + LCDC_VDCTRL0);
-
-	/* Frame length in lines. */
-	writel(m->crtc_vtotal, mxsfb->base + LCDC_VDCTRL1);
-
-	/* Line length in units of clocks or pixels. */
-	hsync_pulse_len = m->crtc_hsync_end - m->crtc_hsync_start;
-	writel(set_hsync_pulse_width(mxsfb, hsync_pulse_len) |
-	       VDCTRL2_SET_HSYNC_PERIOD(m->crtc_htotal),
-	       mxsfb->base + LCDC_VDCTRL2);
-
-	writel(SET_HOR_WAIT_CNT(m->crtc_htotal - m->crtc_hsync_start) |
-	       SET_VERT_WAIT_CNT(m->crtc_vtotal - m->crtc_vsync_start),
-	       mxsfb->base + LCDC_VDCTRL3);
-
-	writel(SET_DOTCLK_H_VALID_DATA_CNT(m->hdisplay),
-	       mxsfb->base + LCDC_VDCTRL4);
+	mxsfb_set_mode(mxsfb, bus_flags);
 }
 
 static int mxsfb_crtc_atomic_check(struct drm_crtc *crtc,
-- 
2.34.1

