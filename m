Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA8C4624DB
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 23:28:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 891176E418;
	Mon, 29 Nov 2021 22:28:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE78A6E418
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 22:28:42 +0000 (UTC)
Received: from pendragon.lan (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id BA38C1265;
 Mon, 29 Nov 2021 23:28:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1638224921;
 bh=iEz4yIc/2ZWMiOZEtQrMskqszikTKS07kUXp7qZ9/uk=;
 h=From:To:Cc:Subject:Date:From;
 b=CukuMHgzqKr9aZOKQd/Dig+/bhrvD+4FAvb6BZ081PaIFi/FIX27pgl7DjWAFa4gb
 3l1gjXSip4ydFb5baYH2z8nvbwr7mISDSeHWsN39GfH2U+Bti2fHpSPjXQ0ebBjL+a
 jg31wtCrUAPoXWzYy5eNXlDXQUO733fN84RkR3qg=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: Fix CRTC timings when CMM is used
Date: Tue, 30 Nov 2021 00:28:13 +0200
Message-Id: <20211129222813.28079-1-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.32.0
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
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When the CMM is enabled, an offset of 25 pixels must be subtracted from
the HDS (horizontal display start) and HDE (horizontal display end)
registers. Fix the timings calculation, and take this into account in
the mode validation.

This fixes a visible horizontal offset in the image with VGA monitors.
HDMI monitors seem to be generally more tolerant to incorrect timings,
but may be affected too.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 5672830ca184..ee6ba74627a2 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -215,6 +215,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
 	struct rcar_du_device *rcdu = rcrtc->dev;
 	unsigned long mode_clock = mode->clock * 1000;
+	unsigned int hdse_offset;
 	u32 dsmr;
 	u32 escr;
 
@@ -298,10 +299,15 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 	     | DSMR_DIPM_DISP | DSMR_CSPM;
 	rcar_du_crtc_write(rcrtc, DSMR, dsmr);
 
+	hdse_offset = 19;
+	if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
+		hdse_offset += 25;
+
 	/* Display timings */
-	rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start - 19);
+	rcar_du_crtc_write(rcrtc, HDSR, mode->htotal - mode->hsync_start -
+					hdse_offset);
 	rcar_du_crtc_write(rcrtc, HDER, mode->htotal - mode->hsync_start +
-					mode->hdisplay - 19);
+					mode->hdisplay - hdse_offset);
 	rcar_du_crtc_write(rcrtc, HSWR, mode->hsync_end -
 					mode->hsync_start - 1);
 	rcar_du_crtc_write(rcrtc, HCR,  mode->htotal - 1);
@@ -836,6 +842,7 @@ rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
 	struct rcar_du_crtc *rcrtc = to_rcar_crtc(crtc);
 	struct rcar_du_device *rcdu = rcrtc->dev;
 	bool interlaced = mode->flags & DRM_MODE_FLAG_INTERLACE;
+	unsigned int min_sync_porch;
 	unsigned int vbp;
 
 	if (interlaced && !rcar_du_has(rcdu, RCAR_DU_FEATURE_INTERLACED))
@@ -843,9 +850,14 @@ rcar_du_crtc_mode_valid(struct drm_crtc *crtc,
 
 	/*
 	 * The hardware requires a minimum combined horizontal sync and back
-	 * porch of 20 pixels and a minimum vertical back porch of 3 lines.
+	 * porch of 20 pixels (when CMM isn't used) or 45 pixels (when CMM is
+	 * used), and a minimum vertical back porch of 3 lines.
 	 */
-	if (mode->htotal - mode->hsync_start < 20)
+	min_sync_porch = 20;
+	if (rcrtc->group->cmms_mask & BIT(rcrtc->index % 2))
+		min_sync_porch += 25;
+
+	if (mode->htotal - mode->hsync_start < min_sync_porch)
 		return MODE_HBLANK_NARROW;
 
 	vbp = (mode->vtotal - mode->vsync_end) / (interlaced ? 2 : 1);

base-commit: c18c8891111bb5e014e144716044991112f16833
prerequisite-patch-id: dc9121a1b85ea05bf3eae2b0ac2168d47101ee87
-- 
Regards,

Laurent Pinchart

