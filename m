Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 398179E578A
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 14:45:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEC4710EE7D;
	Thu,  5 Dec 2024 13:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="FRd3OIXR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB1ED10EE7B
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 13:45:39 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id C5B997E2;
 Thu,  5 Dec 2024 14:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733406310;
 bh=651yUJ3SOtPxI9SLtR8kAqHP9JQdu5ewO/5FNbSS4yk=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=FRd3OIXRNJ3VTteya0GRg9q03H1nOn+UuwWGO/Ws1s+rM2ExSgh5j63LRLQko+KzN
 S9vFKpYaV0Clyf4fIztKbiN/08dOa6drTrzrKIx/Qh7f0CaugHwz0c4vFZ4FMWdXEZ
 SGCZTNCNonOnufWB9FHLGqhNXLDFZmPhvnf8dnlg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Thu, 05 Dec 2024 15:45:02 +0200
Subject: [PATCH v2 07/10] drm/rcar-du: Add support for r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-rcar-gh-dsi-v2-7-42471851df86@ideasonboard.com>
References: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
In-Reply-To: <20241205-rcar-gh-dsi-v2-0-42471851df86@ideasonboard.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, LUU HOAI <hoai.luu.ub@renesas.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Biju Das <biju.das.jz@bp.renesas.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 linux-clk@vger.kernel.org, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2684;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=RrykyNfIyB41TV80DwRgbVHMjY7DN/gcVc889n+vDYQ=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnUa5zaCo2rNqn+no0kOadxLN/ek7WZVNUML/q4
 W5zIbRiu8aJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ1GucwAKCRD6PaqMvJYe
 9Vy+D/4hNJ07ZRFXZ3wswId13B519MnnyP4cXSaPJ98OmaJfwSzosccQymCdCwYQEEk4/MS9t2Z
 UwY/ISq/8+7Vo0U5dLQpBugbNaOIGmXvmT1XNB9ItU0nwoGaYGQzz35Gjww8+mcHPRkdz+tseTh
 c1GWs+XFAg6jAAjn/fijrxrFqCdgeHtCPyOIydYKdqKEuokwuhT9DKTsCrdH0W6rix8xmq5cScR
 4WSvz9YuW1Un+G6TCVfICmd/JvA/961NQpYzwhXeZHzxnT8UgVnderJW0esm+syo+8qIdmBGSO3
 gfnYomsUAnm+Irprq6MeRbZTtpI7rv78bvAdKWe0lRjvvNJKnaoeJq0Kyh6Bfw4FIY+TA26hZl3
 +ULYBZV8RgmBsRGoNVA4frZMGvCipfOZ+l2dYQKfTDsSy63aS3rg4XSraNF4X4Qokr4OuemAy5A
 uOL1bGHKFjpjif8hzHu2vQbR1WfBkShkMxbPJkKBMtV1kLv8jajX0+yyVibjKvYp+eSjVjRtCRX
 3TI3szlAUMptOngbSIwUAtuPHu+HJllsQ71ZT0SXIq+lxuYaCDHFsAP/iTqIaDASBQCnZv16SxL
 PhYS2L8L+N1W2JC5k3vzSXFJIQTJJUHjQ9jBerkxfVz2rPRTQfAwiKowlcYLxPJDFhZvKtowtTe
 mEF7gYbeVMzj3Jg==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

Add support for r8a779h0. It is very similar to r8a779g0, but has only
one output.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 18 ++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c |  4 +++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index fb719d9aff10..7858e10839f2 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -545,6 +545,23 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
+	.gen = 4,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_NO_BLENDING,
+	.channels_mask = BIT(0),
+	.routes = {
+		/* R8A779H0 has one MIPI DSI output. */
+		[RCAR_DU_OUTPUT_DSI0] = {
+			.possible_crtcs = BIT(0),
+			.port = 0,
+		},
+	},
+	.num_rpf = 5,
+	.dsi_clk_mask = BIT(0),
+};
+
 static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a7742", .data = &rcar_du_r8a7790_info },
 	{ .compatible = "renesas,du-r8a7743", .data = &rzg1_du_r8a7743_info },
@@ -571,6 +588,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
 	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
+	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
index 0fbf6abbde6e..b9ae6cc43702 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
@@ -107,10 +107,12 @@ static void rcar_du_group_setup_didsr(struct rcar_du_group *rgrp)
 		 */
 		rcrtc = rcdu->crtcs;
 		num_crtcs = rcdu->num_crtcs;
-	} else if (rcdu->info->gen >= 3 && rgrp->num_crtcs > 1) {
+	} else if ((rcdu->info->gen == 3 && rgrp->num_crtcs > 1) ||
+		   rcdu->info->gen == 4) {
 		/*
 		 * On Gen3 dot clocks are setup through per-group registers,
 		 * only available when the group has two channels.
+		 * On Gen4 the registers are there for single channel too.
 		 */
 		rcrtc = &rcdu->crtcs[rgrp->index * 2];
 		num_crtcs = rgrp->num_crtcs;

-- 
2.43.0

