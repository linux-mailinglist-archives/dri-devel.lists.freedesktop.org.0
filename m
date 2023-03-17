Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8040D6BF642
	for <lists+dri-devel@lfdr.de>; Sat, 18 Mar 2023 00:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5636D10E432;
	Fri, 17 Mar 2023 23:24:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ams.source.kernel.org (ams.source.kernel.org
 [IPv6:2604:1380:4601:e00::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18F9010E285
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Mar 2023 23:24:03 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id B8463B826FE;
 Fri, 17 Mar 2023 23:24:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20D6CC433D2;
 Fri, 17 Mar 2023 23:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1679095440;
 bh=a2pmQKhWvqek1TX2Y5M9kp9YI0QTZuxBZ8Pn1du4Q14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YswHAzC7nKZ15q/r11zI/x/msEanukF5qbiQVlo9kmxcb4imSfUdgxHC9nQVQlKmp
 htOtDJTCF5ahTyuAPLjbLuCZcsSLe3+oE2LiWMed61UxmDvDhmkr5hl3+eTrYiOaub
 hTjygRfkTY9+6NMGVsHon8iQHSS3RrNPdxFoCwzUKpfMfQ2uopFDRtv1CEbl7pLs6C
 Ddy41hsOte1nfpEaXYN55KkmWz2hG2+xQSyomJHDrBTDMuYc1o3QfVoc6vE+XbV20I
 BYB7NnV3phVhss+f+0IEh2lXGjap2VQbGX/pIzE9kdQTR+u+lfdpUB9MyHux/k1xWS
 6QAvDo2OohBlw==
Received: by mercury (Postfix, from userid 1000)
 id DD4561062101; Sat, 18 Mar 2023 00:23:57 +0100 (CET)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCHv1 3/7] drm/panel: sitronix-st7789v: add SPI ID table
Date: Sat, 18 Mar 2023 00:23:51 +0100
Message-Id: <20230317232355.1554980-4-sre@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230317232355.1554980-1-sre@kernel.org>
References: <20230317232355.1554980-1-sre@kernel.org>
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

