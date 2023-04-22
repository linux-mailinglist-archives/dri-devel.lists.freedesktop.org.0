Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 852636EBB49
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:51:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1DC410E201;
	Sat, 22 Apr 2023 20:51:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E408D10E181
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 74D7D6146B;
 Sat, 22 Apr 2023 20:50:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48683C4339E;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=qSwlGWERs1iLO9M6K70WivJnuxc3M3Ft0dJO8xZoQJg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WR0Y2Gkj8T3l8/g3V/e8fiXBUxcANbDupyE0B/Q659iKEKhTAQUZcsnarxo5od6si
 znbRTZLKLRJAY5+pyhzFutqtes/QWu1HbVXTrVIaEgsVq6n7tXtQLu+etq43fEJBEM
 j19RBI4qH8lknwNqM591bJGsClcnCr2TegH22VkgvW6XapB62heg1dP1UDQSvVT0wO
 bFAR2HdF67wIHIJoL51AWnF6UDK1EoCj6pGHTAopcp/DejPJL/sI3PkO3guXoDC9y8
 nrwUDxYkCjCkGClsi6Boyau1iv5tCPXkOIKOWACSf2pOCbVMaETq0qk4ZTXqbdzYPS
 tcAO0YLp6nSyA==
Received: by mercury (Postfix, from userid 1000)
 id 127C91066CC4; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 05/13] drm/panel: sitronix-st7789v: make reset GPIO optional
Date: Sat, 22 Apr 2023 22:50:04 +0200
Message-Id: <20230422205012.2464933-6-sre@kernel.org>
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

The reset pin might not be software controllable from the SoC,
so make it optional.

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
2.39.2

