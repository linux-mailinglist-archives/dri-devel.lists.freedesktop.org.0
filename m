Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A2C45EA77
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 10:35:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C776E6EA7F;
	Fri, 26 Nov 2021 09:35:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA7056EA7F
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 09:35:20 +0000 (UTC)
Received: from Monstersaurus.local
 (cpc89244-aztw30-2-0-cust3082.18-1.cable.virginm.net [86.31.172.11])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 8BDEF340;
 Fri, 26 Nov 2021 10:35:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1637919318;
 bh=Kb1OjapeoZTA+Iy4gBvfvPpWnG0GA3u3IPVikYIXN7E=;
 h=From:To:Cc:Subject:Date:From;
 b=ZNti6pkY7q/Z8RUd2JtDrlhrCBvhQ47Hps5L/L7Ilw+YL6zLAG+FLdzhCKhyzC9AB
 FCcBZQFMTxBpkz6eIdtgMwxMwOo3aUfSkxa/sSD5ErlOPQrIiOjTacVGbpuE/IwQTb
 dMYHu52u/YhMK3aaYpVipEuPfSPnkY8mDEK3fjRY=
From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To: linux-renesas-soc@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: rcar-du: crtc: Support external DSI dot clock
Date: Fri, 26 Nov 2021 09:35:14 +0000
Message-Id: <20211126093514.927340-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.30.2
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
Cc: David Airlie <airlied@linux.ie>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On platforms with an external clock, both the group and crtc must be
handled accordingly to correctly pass through the external clock and
configure the DU to use the external rate.

The CRTC support was missed while adding the DSI support on the r8a779a0
which led to the output clocks being incorrectly determined.

Ensure that when a CRTC is routed through the DSI encoder, the external
clock is used without any further divider being applied.

Fixes: b291fdcf5114 ("drm: rcar-du: Add r8a779a0 device support")
Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 5672830ca184..5236f917cc68 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -261,12 +261,13 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		rcar_du_group_write(rcrtc->group, DPLLCR, dpllcr);
 
 		escr = ESCR_DCLKSEL_DCLKIN | div;
-	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index)) {
+	} else if (rcdu->info->lvds_clk_mask & BIT(rcrtc->index) ||
+		   rcdu->info->dsi_clk_mask & BIT(rcrtc->index)) {
 		/*
-		 * Use the LVDS PLL output as the dot clock when outputting to
-		 * the LVDS encoder on an SoC that supports this clock routing
-		 * option. We use the clock directly in that case, without any
-		 * additional divider.
+		 * Use the external LVDS or DSI PLL output as the dot clock when
+		 * outputting to the LVDS or DSI encoder on an SoC that supports
+		 * this clock routing option. We use the clock directly in that
+		 * case, without any additional divider.
 		 */
 		escr = ESCR_DCLKSEL_DCLKIN;
 	} else {
-- 
2.30.2

