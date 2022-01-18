Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F1649169C
	for <lists+dri-devel@lfdr.de>; Tue, 18 Jan 2022 03:35:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6BB21128F2;
	Tue, 18 Jan 2022 02:35:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C04E1128F3
 for <dri-devel@lists.freedesktop.org>; Tue, 18 Jan 2022 02:35:54 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 924D0612C8;
 Tue, 18 Jan 2022 02:35:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D006C36AE3;
 Tue, 18 Jan 2022 02:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642473353;
 bh=Rkw3g01TUkhbxguTqpap1lKFkPkmErFrADVBGX68Kt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AaL47V/xOvd3xPwufxhORgwg5mDZ+VG+l0x+Ga9gwS7UakBMtHW59t3xJbU4rnRTu
 ZZMM+fKchbtyU4yPk/ntgskWuNeCzxKds3/e07jEuMNwSB7jv8I+isAT9qirksmkuX
 EsTr1OaVITK4lYkH1CH1IZgQNwixQ0tQT8ODgN3bMnp2UPUX+J0UP75WGnzXbRn+CB
 rqWiH1dVJdpl+B3DBxgNZS2PBhN/iOffvnt7xj8MfCBh1iCapzK3EWmc2iVHpYxdS2
 yUZUt9kx3/91wmBWb3kbS4oRZFDQCM5pEsxY4Le/jf9kRHUH4Lk0PGuma+bBquSFgr
 oNyCJVOLC7NHg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 082/188] drm: rcar-du: Fix CRTC timings when CMM
 is used
Date: Mon, 17 Jan 2022 21:30:06 -0500
Message-Id: <20220118023152.1948105-82-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220118023152.1948105-1-sashal@kernel.org>
References: <20220118023152.1948105-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, airlied@linux.ie,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

[ Upstream commit f0ce591dc9a97067c6e783a2eaccd22c5476144d ]

When the CMM is enabled, an offset of 25 pixels must be subtracted from
the HDS (horizontal display start) and HDE (horizontal display end)
registers. Fix the timings calculation, and take this into account in
the mode validation.

This fixes a visible horizontal offset in the image with VGA monitors.
HDMI monitors seem to be generally more tolerant to incorrect timings,
but may be affected too.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index ea7e39d035457..ee7e375ee6724 100644
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
-- 
2.34.1

