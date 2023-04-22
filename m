Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58ED66EBB41
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:50:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7A7910E19D;
	Sat, 22 Apr 2023 20:50:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1D8010E18F
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:29 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D6BC61543;
 Sat, 22 Apr 2023 20:50:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB110C433D2;
 Sat, 22 Apr 2023 20:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196628;
 bh=a2pmQKhWvqek1TX2Y5M9kp9YI0QTZuxBZ8Pn1du4Q14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WTdf1W/fhgUsR36kxaQSiJtoiR0FUIqR3aEKF1oR7hKnc5ccdAN/vjXf/171iKs8S
 /IUpoe7vueYk3sl2ueUv2v4kwD4JDp7HNTN8AIMjYXVCFQFx200rUzXx/cswDw3S5T
 Cs0n4GQHE8ONmawLjvCHehhC88dpXxqvVokRDX0zkzJ9iGb9+lRe6IFdjyl99ZwIqg
 F5yM99O8cGdls2LnruIVq5sgXLacc6Mnk2SVhyEetE3+TKfozolG7jEf+oIqlUZ0Kx
 XFEcjpEZr6X11UBcABurU+9vvVOB96bryMOC3rrKgLa5sJregtRzpcUu6MIcpwX5kh
 Q0zeFG0IzG7cw==
Received: by mercury (Postfix, from userid 1000)
 id 0DE791066CC1; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 03/13] drm/panel: sitronix-st7789v: add SPI ID table
Date: Sat, 22 Apr 2023 22:50:02 +0200
Message-Id: <20230422205012.2464933-4-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230422205012.2464933-1-sre@kernel.org>
References: <20230422205012.2464933-1-sre@kernel.org>
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
 Michael Riesch <michael.riesch@wolfvision.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SPI device drivers should also have a SPI ID table.

Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index bbc4569cbcdc..e4d8dea1db36 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -394,6 +394,12 @@ static void st7789v_remove(struct spi_device *spi)
 	drm_panel_remove(&ctx->panel);
 }
 
+static const struct spi_device_id st7789v_spi_id[] = {
+	{ "st7789v" },
+	{ }
+};
+MODULE_DEVICE_TABLE(spi, st7789v_spi_id);
+
 static const struct of_device_id st7789v_of_match[] = {
 	{ .compatible = "sitronix,st7789v" },
 	{ }
@@ -403,6 +409,7 @@ MODULE_DEVICE_TABLE(of, st7789v_of_match);
 static struct spi_driver st7789v_driver = {
 	.probe = st7789v_probe,
 	.remove = st7789v_remove,
+	.id_table = st7789v_spi_id,
 	.driver = {
 		.name = "st7789v",
 		.of_match_table = st7789v_of_match,
-- 
2.39.2

