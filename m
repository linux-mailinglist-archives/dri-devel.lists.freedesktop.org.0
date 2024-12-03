Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A23609E14F2
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:02:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2201410E93E;
	Tue,  3 Dec 2024 08:02:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nBQnEvzF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F710E93E
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 08:02:52 +0000 (UTC)
Received: from [127.0.1.1] (91-157-155-49.elisa-laajakaista.fi [91.157.155.49])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 486C914A4;
 Tue,  3 Dec 2024 09:02:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1733212944;
 bh=0PxIHlbI6IJoNkjAoQKMyDLMZwOimdUI9mhWsmyA35k=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=nBQnEvzFllUOssZ0pcvyvPlHRUpmZn3tylr7adKGGfsqOWarF7mTnL8EjXKGw5f0D
 Kv1QTwglkzuxEIdig46kvMw+WXxF0Wi0aK2eJnA+NpOWr2EDSKD7YnTfLdeTs7dcY5
 LVtOpGT7ZL8gYVQq8hksyOGdA/vVKXIHvHP/Q53Y=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 03 Dec 2024 10:01:40 +0200
Subject: [PATCH 6/9] drm/rcar-du: Add support for r8a779h0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-rcar-gh-dsi-v1-6-738ae1a95d2a@ideasonboard.com>
References: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
In-Reply-To: <20241203-rcar-gh-dsi-v1-0-738ae1a95d2a@ideasonboard.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4076;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=SEkqiCMGlCis7w9MzoEHhBVFRgNQB66t1BAlMYf2ujc=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBnTrsevNp2o+t7+FbDi5lqP7MiIdW8bP3/bOEkH
 6LVnJ/EwaWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZ067HgAKCRD6PaqMvJYe
 9W9lD/9WgOQdO6ax56TdSSpxyP1rj4wX3flFy0rUDX2BsGWSzo4rK5QwgAoRjlmkdknP2wdJA49
 r5I1LMO9FPoSBqrD4LHfDCM+7rkxBhLNRjWXuAASHVQ0N1+OBBLu1m7xGSk/zi2nuZjgdj45fdi
 W4kpNNHa8xzdQtOg9MriLTysjUe81BJ39XjKTRS4Z1TeGq7aeSztewvL7YAaf5HrRgMphtCe6l5
 0UqXHn+M4mIbhlcRXrdT8wUCXYHIC1o1TtURvl6JzdWzMZss8LupwKr8h4Z3FE7m+igAT6g3JtW
 L0UdRrdfd9cpOb7O/3VclebLVu0OGQoOLQxVvJtj6msSk/7Je6qy2NKFRDyr7gPAF4aNiq+RgEj
 +SRPfhP45H9n8+aeBQIaSdYthj9zVGH5Nyp9GT0wtijH05ElOx9UeuLoxiXMO74N0udjshiz7bH
 mY8ZhFE8VMiPmFp/KNSUEBkwz5TSBHv7bTuBUzLbNGjbxZGBsER/T4UE76lT+ghKDMRt/P/RaXu
 A4IxMBfuOLCt8pphpWPCQYcvQyh4j5oZR7KQUowILjW/jprER6nIdvR53zg3krGfTLh10Khj+AZ
 EGWWoXU++jfLkfVzNy6bJGnpqLmVgRMnhAJl3JBTP6O5D0Jv3LznExyMzebPJYBXlGgVA/v6YvL
 XraDMkS3TDdO6YQ==
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
---
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c   | 19 +++++++++++++++++++
 drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h   |  1 +
 drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c | 16 ++++++++++------
 3 files changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
index fb719d9aff10..afbc74e18cce 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.c
@@ -545,6 +545,24 @@ static const struct rcar_du_device_info rcar_du_r8a779g0_info = {
 	.dsi_clk_mask =  BIT(1) | BIT(0),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a779h0_info = {
+	.gen = 4,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_NO_BLENDING
+		  | RCAR_DU_FEATURE_NO_DPTSR,
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
@@ -571,6 +589,7 @@ static const struct of_device_id rcar_du_of_table[] = {
 	{ .compatible = "renesas,du-r8a77995", .data = &rcar_du_r8a7799x_info },
 	{ .compatible = "renesas,du-r8a779a0", .data = &rcar_du_r8a779a0_info },
 	{ .compatible = "renesas,du-r8a779g0", .data = &rcar_du_r8a779g0_info },
+	{ .compatible = "renesas,du-r8a779h0", .data = &rcar_du_r8a779h0_info },
 	{ }
 };
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
index 5cfa2bb7ad93..d7004f76f735 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_drv.h
@@ -32,6 +32,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_INTERLACED	BIT(3)	/* HW supports interlaced */
 #define RCAR_DU_FEATURE_TVM_SYNC	BIT(4)	/* Has TV switch/sync modes */
 #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
+#define RCAR_DU_FEATURE_NO_DPTSR	BIT(6)  /* V4M does not have DPTSR */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
 
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_group.c
index 2ccd2581f544..132d930670eb 100644
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
@@ -185,11 +187,13 @@ static void rcar_du_group_setup(struct rcar_du_group *rgrp)
 		dorcr |= DORCR_PG1T | DORCR_DK1S | DORCR_PG1D_DS1;
 	rcar_du_group_write(rgrp, DORCR, dorcr);
 
-	/* Apply planes to CRTCs association. */
-	mutex_lock(&rgrp->lock);
-	rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
-			    rgrp->dptsr_planes);
-	mutex_unlock(&rgrp->lock);
+	if (!rcar_du_has(rcdu, RCAR_DU_FEATURE_NO_DPTSR)) {
+		/* Apply planes to CRTCs association. */
+		mutex_lock(&rgrp->lock);
+		rcar_du_group_write(rgrp, DPTSR, (rgrp->dptsr_planes << 16) |
+				    rgrp->dptsr_planes);
+		mutex_unlock(&rgrp->lock);
+	}
 }
 
 /*

-- 
2.43.0

