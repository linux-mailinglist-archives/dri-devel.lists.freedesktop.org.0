Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D022752EC0
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08DA210E7B7;
	Fri, 14 Jul 2023 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 372C910E0AD
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B469361BBE;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F6E6C433D9;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=EyFDzV4ddqw1sjwHBTSR4kWEp2hOqnAjhUV748qVmZI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HysJGfs/dIwxuKwN3vBYM0JpBWVvtSNxLGpwu9TNJpI3Ie6yITYRQ5ZlzvdRFhAV1
 sm0BCuMYOalW0M3sx5jvgtizhq9QiQYD1KBjGWpnJvah4OAPEUrnCWSo+FZrM8eHtt
 mxDXBSfDJvl9+GWOBH34u+2mo7sJMRHvPyDI8DlQ37YPjm1AxXoIxejrxJ0sCcjZNN
 u1TMZUeL6nmsrSwibZ/p6SqMifWqJ+L2YO4lQliO9ludKlt/vbAUvZjpB+VuWnFT87
 TDW/iTkCWoikzVAeaLfzkVCAOoFRm6YF6+0jqyp21w+zYH/UQ0snemsabIGtoR1NVx
 kSZvCf/n4GTSg==
Received: by mercury (Postfix, from userid 1000)
 id DAB131067697; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 07/19] drm/panel: sitronix-st7789v: improve error handling
Date: Fri, 14 Jul 2023 03:37:44 +0200
Message-Id: <20230714013756.1546769-8-sre@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230714013756.1546769-1-sre@kernel.org>
References: <20230714013756.1546769-1-sre@kernel.org>
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
Cc: devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Gerald Loacker <gerald.loacker@wolfvision.net>,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Miquel Raynal <miquel.raynal@bootlin.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve error handling in the probe routine, so that probe
defer errors are captured in /sys/kernel/debug/devices_deferred

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 .../gpu/drm/panel/panel-sitronix-st7789v.c    | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 6290bd49d055..a6d6155ef45c 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -348,32 +348,33 @@ static const struct drm_panel_funcs st7789v_drm_funcs = {
 
 static int st7789v_probe(struct spi_device *spi)
 {
+	struct device *dev = &spi->dev;
 	struct st7789v *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(&spi->dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
 	spi_set_drvdata(spi, ctx);
 	ctx->spi = spi;
 
-	drm_panel_init(&ctx->panel, &spi->dev, &st7789v_drm_funcs,
+	drm_panel_init(&ctx->panel, dev, &st7789v_drm_funcs,
 		       DRM_MODE_CONNECTOR_DPI);
 
-	ctx->power = devm_regulator_get(&spi->dev, "power");
-	if (IS_ERR(ctx->power))
-		return PTR_ERR(ctx->power);
+	ctx->power = devm_regulator_get(dev, "power");
+	ret = PTR_ERR_OR_ZERO(ctx->power);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get regulator\n");
 
-	ctx->reset = devm_gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
-	if (IS_ERR(ctx->reset)) {
-		dev_err(&spi->dev, "Couldn't get our reset line\n");
-		return PTR_ERR(ctx->reset);
-	}
+	ctx->reset = devm_gpiod_get_optional(dev, "reset", GPIOD_OUT_LOW);
+	ret = PTR_ERR_OR_ZERO(ctx->reset);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get reset line\n");
 
 	ret = drm_panel_of_backlight(&ctx->panel);
 	if (ret)
-		return ret;
+		return dev_err_probe(dev, ret, "Failed to get backlight\n");
 
 	drm_panel_add(&ctx->panel);
 
-- 
2.40.1

