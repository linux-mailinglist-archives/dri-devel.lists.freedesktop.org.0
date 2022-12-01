Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09917640519
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 11:49:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0386410E6CD;
	Fri,  2 Dec 2022 10:48:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19A4810E012
 for <dri-devel@lists.freedesktop.org>; Thu,  1 Dec 2022 09:56:57 +0000 (UTC)
Received: from desky.lan (91-154-32-225.elisa-laajakaista.fi [91.154.32.225])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id E78EB2D9;
 Thu,  1 Dec 2022 10:56:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1669888615;
 bh=3fphJVPxicGLurGTXvkQUE9p+5BG3KUJATq5hRVNQpM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JjZveGnccVG0mRCUc2Krgf70dukhK233RlMWRCxAxF/Cy3ff2haCHmQ4nHQvyLyL5
 0A5bnUV/DHjxRJLvRoJSeJuwJPl736Jki7zLHOYpa15unG6uLp3JaB+5HJnluFUVLT
 CvE/kVoCD8Hm0Z2L+1dPiqYzZsWZvYEdc61/Qm2g=
From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/7] drm: rcar-du: Add r8a779g0 support
Date: Thu,  1 Dec 2022 11:56:30 +0200
Message-Id: <20221201095631.89448-7-tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
References: <20221201095631.89448-1-tomi.valkeinen+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 02 Dec 2022 10:48:00 +0000
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jonas Karlman <jonas@kwiboo.se>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add support for DU on r8a779g0, which is identical to DU on r8a779a0.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/rcar-du/rcar_du_drv.c   | 22 ++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_group.c |  2 +-
 2 files changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d003e8d9e7a2..46c60a2d710d 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -524,6 +524,27 @@ static const struct rcar_du_device_info rcar_du_r8a779a0_info = {
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
+	.gen = 4,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_NO_BLENDING,
+	.channels_mask = BIT(1) | BIT(0),
+	.routes = {
+		/* R8A779G0 has two MIPI DSI outputs. */
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_DSI1] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+	},
+	.num_rpf = 5,
+	.dsi_clk_mask =  BIT(1) | BIT(0),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -549,6 +570,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77990", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
+	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_group.c b/drivers/gpu/drm/rcar-du/rcar_du_group.c
index 1fe8581577ed..6da01760ede5 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_group.c
@@ -107,7 +107,7 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 		 */
 		rcrtc = rcdu->crtcs;
 		num_crtcs = rcdu->num_crtcs;
-	} else if (rcdu->info->gen == 3 && rgrp->num_crtcs > 1) {
+	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
 		/*
 		 * On Gen3 dot clocks are setup through per-group registers,
 		 * only available when the group has two channels.
-- 
2.34.1

