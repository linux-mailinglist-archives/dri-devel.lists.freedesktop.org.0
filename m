Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0390F69EE27
	for <lists+dri-devel@lfdr.de>; Wed, 22 Feb 2023 06:06:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF7AE10E3A1;
	Wed, 22 Feb 2023 05:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1FA210E177
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Feb 2023 05:06:28 +0000 (UTC)
Received: from pendragon.ideasonboard.com (213-243-189-158.bb.dnainternet.fi
 [213.243.189.158])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 05CE29DE;
 Wed, 22 Feb 2023 06:06:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1677042387;
 bh=imn2q5E5nIdnrwQDNKhiRNX21Oip/rmQqdjeh/f+bg4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GwJk1TUNHz3AVPvYTLDhl9hsCYyEiOKgfwRbVGOAyYqMU6fHtKOI9nsjNpIP8qNUl
 c3ZwrDQg0sdUsojNODRBT4CWCZzA02Lx6DMTB5WMAZCBppvYZz3MO42E3Eyz2Bofox
 LhoqJvZn1GiA6pJLg86y/RAY/fqYMwnUVFPthaFE=
From: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: rcar-du: Don't write unimplemented ESCR and OTAR
 registers on Gen3
Date: Wed, 22 Feb 2023 07:06:22 +0200
Message-Id: <20230222050623.29080-2-laurent.pinchart+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
References: <20230222050623.29080-1-laurent.pinchart+renesas@ideasonboard.com>
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
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ESCR and OTAR registers are not present in all DU channels on Gen3
SoCs. ESCR only exists in channels that can be routed to an LVDS or
DPAD, and OTAR in channels that can be routed to a DPAD. Skip writing
those registers for other channels. This replaces the DU gen check, as
Gen4 doesn't have LVDS or DPAD outputs.

Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 5e552b326162..d6d29be6b4f4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -298,12 +298,25 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		escr = params.escr;
 	}
 
-	if (rcdu->info->gen < 4) {
+	/*
+	 * The ESCR register only exists in DU channels that can output to an
+	 * LVDS or DPAT, and the OTAR register in DU channels that can output
+	 * to a DPAD.
+	 */
+	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS0].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_LVDS1].possible_crtcs) &
+	    BIT(rcrtc->index)) {
 		dev_dbg(rcrtc->dev->dev, "%s: ESCR 0x%08x\n", __func__, escr);
 
 		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? ESCR13 : ESCR02, escr);
+	}
+
+	if ((rcdu->info->routes[RCAR_DU_OUTPUT_DPAD0].possible_crtcs |
+	     rcdu->info->routes[RCAR_DU_OUTPUT_DPAD1].possible_crtcs) &
+	    BIT(rcrtc->index))
 		rcar_du_crtc_write(rcrtc, rcrtc->index % 2 ? OTAR13 : OTAR02, 0);
-	}
 
 	/* Signal polarities */
 	dsmr = ((mode->flags & DRM_MODE_FLAG_PVSYNC) ? DSMR_VSL : 0)
-- 
Regards,

Laurent Pinchart

