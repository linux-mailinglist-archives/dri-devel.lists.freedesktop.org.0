Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F325F6A368B
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 03:02:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D43CA10E1B6;
	Mon, 27 Feb 2023 02:02:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35B1910E1B6
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Feb 2023 02:02:36 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 1B589CE0F25;
 Mon, 27 Feb 2023 02:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7294DC4339B;
 Mon, 27 Feb 2023 02:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1677463352;
 bh=LpXzCM5yte2TW4eMOYttPL7OAEITFa1C5o+bkmkB6sQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dLFujfB5pohasG8M6nnTAE1VIsn8gOV391nunB3gI4BY5t9KhlN2cMUGMC3sHB7Mv
 bOjzVvC/HPqTUzOVVeepCSwzY+o1wHmKIQS+Gq89xBNyGY5SRinMFHeW+uVsEeu27u
 vFgil4f3pUWZ807GZZVuhiciWUPJ6Lt9FLE1vJe+rEehkkwEk5rkWbvEfhgLVzZIHL
 pGSQL6nicdwW282NE0jIyT+ZlIvw0/IszuKLrqNe1AVsDnlCVUgZ2p+PXisDLOS1tu
 4T1rvB4tJqME7Ggs+dFxQSe+2OKlQxGqfopHShsCtl66OmfS2WPbaBLciKQk84VqsG
 ZEsQ6ulrHDpUA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 6.2 25/60] drm: rcar-du: Add quirk for H3 ES1.x pclk
 workaround
Date: Sun, 26 Feb 2023 21:00:10 -0500
Message-Id: <20230227020045.1045105-25-sashal@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230227020045.1045105-1-sashal@kernel.org>
References: <20230227020045.1045105-1-sashal@kernel.org>
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
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org,
 kieran.bingham+renesas@ideasonboard.com, laurent.pinchart@ideasonboard.com,
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>

[ Upstream commit 4f548bc48a2b4c4e54eecfddb6f7d24aa1b98768 ]

rcar_du_crtc.c does a soc_device_match() in
rcar_du_crtc_set_display_timing() to find out if the SoC is H3 ES1.x, and
if so, apply a workaround.

We will need another H3 ES1.x check in the following patch, so rather than
adding more soc_device_match() calls, let's add a rcar_du_device_info
entry for the ES1, and a quirk flag,
RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY, for the workaround.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/gpu/drm/rcar-du/rcar_du_crtc.c |  8 +----
 drivers/gpu/drm/rcar-du/rcar_du_drv.c  | 48 ++++++++++++++++++++++++++
 drivers/gpu/drm/rcar-du/rcar_du_drv.h  |  1 +
 3 files changed, 50 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
index 3619e1ddeb620..f2d3266509cc1 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_crtc.c
@@ -10,7 +10,6 @@
 #include <linux/clk.h>
 #include <linux/mutex.h>
 #include <linux/platform_device.h>
-#include <linux/sys_soc.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -204,11 +203,6 @@ static void rcar_du_escr_divider(struct clk *clk, unsigned long target,
 	}
 }
 
-static const struct soc_device_attribute rcar_du_r8a7795_es1[] = {
-	{ .soc_id = "r8a7795", .revision = "ES1.*" },
-	{ /* sentinel */ }
-};
-
 static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 {
 	const struct drm_display_mode *mode = &rcrtc->crtc.state->adjusted_mode;
@@ -238,7 +232,7 @@ static void rcar_du_crtc_set_display_timing(struct rcar_du_crtc *rcrtc)
 		 * no post-divider when a display PLL is present (as shown by
 		 * the workaround breaking HDMI output on M3-W during testing).
 		 */
-		if (soc_device_match(rcar_du_r8a7795_es1)) {
+		if (rcdu->info->quirks & RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY) {
 			target *= 2;
 			div = 1;
 		}
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.c b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
index d003e8d9e7a26..c479996f8e91e 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.c
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.c
@@ -16,6 +16,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm.h>
 #include <linux/slab.h>
+#include <linux/sys_soc.h>
 #include <linux/wait.h>
 
 #include <drm/drm_atomic_helper.h>
@@ -386,6 +387,42 @@ static const struct rcar_du_device_info rcar_du_r8a7795_info = {
 	.dpll_mask =  BIT(2) | BIT(1),
 };
 
+static const struct rcar_du_device_info rcar_du_r8a7795_es1_info = {
+	.gen = 3,
+	.features = RCAR_DU_FEATURE_CRTC_IRQ
+		  | RCAR_DU_FEATURE_CRTC_CLOCK
+		  | RCAR_DU_FEATURE_VSP1_SOURCE
+		  | RCAR_DU_FEATURE_INTERLACED
+		  | RCAR_DU_FEATURE_TVM_SYNC,
+	.quirks = RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY,
+	.channels_mask = BIT(3) | BIT(2) | BIT(1) | BIT(0),
+	.routes = {
+		/*
+		 * R8A7795 has one RGB output, two HDMI outputs and one
+		 * LVDS output.
+		 */
+		[RCAR_DU_OUTPUT_DPAD0] = {
+			.possible_crtcs = BIT(3),
+			.port = 0,
+		},
+		[RCAR_DU_OUTPUT_HDMI0] = {
+			.possible_crtcs = BIT(1),
+			.port = 1,
+		},
+		[RCAR_DU_OUTPUT_HDMI1] = {
+			.possible_crtcs = BIT(2),
+			.port = 2,
+		},
+		[RCAR_DU_OUTPUT_LVDS0] = {
+			.possible_crtcs = BIT(0),
+			.port = 3,
+		},
+	},
+	.num_lvds = 1,
+	.num_rpf = 5,
+	.dpll_mask =  BIT(2) | BIT(1),
+};
+
 static const struct rcar_du_device_info rcar_du_r8a7796_info = {
 	.gen = 3,
 	.features = RCAR_DU_FEATURE_CRTC_IRQ
@@ -554,6 +591,11 @@ static const struct of_device_id rcar_du_of_table[] = {
 
 MODULE_DEVICE_TABLE(of, rcar_du_of_table);
 
+static const struct soc_device_attribute rcar_du_soc_table[] = {
+	{ .soc_id = "r8a7795", .revision = "ES1.*", .data = &rcar_du_r8a7795_es1_info },
+	{ /* sentinel */ }
+};
+
 const char *rcar_du_output_name(enum rcar_du_output output)
 {
 	static const char * const names[] = {
@@ -645,6 +687,7 @@ static void rcar_du_shutdown(struct platform_device *pdev)
 
 static int rcar_du_probe(struct platform_device *pdev)
 {
+	const struct soc_device_attribute *soc_attr;
 	struct rcar_du_device *rcdu;
 	unsigned int mask;
 	int ret;
@@ -659,8 +702,13 @@ static int rcar_du_probe(struct platform_device *pdev)
 		return PTR_ERR(rcdu);
 
 	rcdu->dev = &pdev->dev;
+
 	rcdu->info = of_device_get_match_data(rcdu->dev);
 
+	soc_attr = soc_device_match(rcar_du_soc_table);
+	if (soc_attr)
+		rcdu->info = soc_attr->data;
+
 	platform_set_drvdata(pdev, rcdu);
 
 	/* I/O resources */
diff --git a/drivers/gpu/drm/rcar-du/rcar_du_drv.h b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
index 5cfa2bb7ad93d..df87ccab146f4 100644
--- a/drivers/gpu/drm/rcar-du/rcar_du_drv.h
+++ b/drivers/gpu/drm/rcar-du/rcar_du_drv.h
@@ -34,6 +34,7 @@ struct rcar_du_device;
 #define RCAR_DU_FEATURE_NO_BLENDING	BIT(5)	/* PnMR.SPIM does not have ALP nor EOR bits */
 
 #define RCAR_DU_QUIRK_ALIGN_128B	BIT(0)	/* Align pitches to 128 bytes */
+#define RCAR_DU_QUIRK_H3_ES1_PCLK_STABILITY BIT(1)	/* H3 ES1 has pclk stability issue */
 
 enum rcar_du_output {
 	RCAR_DU_OUTPUT_DPAD0,
-- 
2.39.0

