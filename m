Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378DF752EBF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A62610E7B8;
	Fri, 14 Jul 2023 01:38:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F55810E7AB
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:08 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 535A661BE7;
 Fri, 14 Jul 2023 01:38:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E25CC43391;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=Yz2WLdihy2cH3NLgwzal4tjdyU5OuV1nw3L8ogj7TNI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ElmvuO0AzQAHTExm1eL3Pr0z3ijuwCOvIz3Wso7OgiIp4JteopEROMpZ1ysINuHjx
 d4tBmsHove9QJEAjJA3rJzIF3t5wwRjaadgAgMdfsoJfSjhkTDEv+81FAGqTS2nt0w
 DBCMDnKaJnSjH835aAow1Mdyf98wtOj3lVdoIfLPXdrnKasyfNkTvbJmTTIE0gJndg
 kaW+hZZgK470Od+3X5YB5tMsG+/q8WBCjv/lDYVPrRy4BTg1/f8ML9tv1IZ7wTJCtE
 Hcr8SBEkvJS338SFyaEisMDm7UXqKAXRSBnvuR8viair8BTjvaRLLOhCc2iaeZgSZt
 plus0XsmLz5Vw==
Received: by mercury (Postfix, from userid 1000)
 id D58DE1067695; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 05/19] drm/panel: sitronix-st7789v: make reset GPIO optional
Date: Fri, 14 Jul 2023 03:37:42 +0200
Message-Id: <20230714013756.1546769-6-sre@kernel.org>
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

The reset pin might not be software controllable from the SoC,
so make it optional.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index f7566551b5e2..1d43b8cc1647 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -369,7 +369,7 @@ static int st7789v_probe(struct spi_device *spi)
 	if (IS_ERR(ctx->power))
 		return PTR_ERR(ctx->power);
 
-	ctx->reset = devm_gpiod_get(&spi->dev, "reset", GPIOD_OUT_LOW);
+	ctx->reset = devm_gpiod_get_optional(&spi->dev, "reset", GPIOD_OUT_LOW);
 	if (IS_ERR(ctx->reset)) {
 		dev_err(&spi->dev, "Couldn't get our reset line\n");
 		return PTR_ERR(ctx->reset);
-- 
2.40.1

