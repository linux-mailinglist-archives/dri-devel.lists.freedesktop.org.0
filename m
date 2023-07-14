Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 56DA6752EBB
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jul 2023 03:38:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD2210E7B3;
	Fri, 14 Jul 2023 01:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43FFC10E0C8
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jul 2023 01:38:06 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B867161BC4;
 Fri, 14 Jul 2023 01:38:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58042C433CA;
 Fri, 14 Jul 2023 01:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1689298684;
 bh=BWX8AXPfJ5gQEAV6Gfsqwd1FF8WXCoKoYTywoJ22YAI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=JQzQ13H+HlDBwkhGckSx6+UVsUTgf01rN2VxwEfLMhsxfJGPZLGnBuvfOxvWSxQks
 wt91ai0vjK/Pr0I7lWxhituUXXkHgRO12rL0GZn9l+Tlj67Osv4QOkuKXGO9dEUWVG
 A3vJGVPYi1pHSnDFHLxRxYUCMRAJcAYdGvbveGn1ENNQNNxlWqV+w1fRvE8cR4SVaU
 UxMc/R6KmA1KYHwtLhDuWXj1J3bAywXFGfyW9wbBfnEbKnDQV81wRveWWhOqXyQB8/
 Mue7M4xbPx9oH0g5OLt671GIFyUpkCXnxMpWP7g8yRoCinZ7hLT6D2s5w1ltqRlwVq
 r6NojQosdpfMA==
Received: by mercury (Postfix, from userid 1000)
 id D82FB1067696; Fri, 14 Jul 2023 03:37:58 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v3 06/19] drm/panel: sitronix-st7789v: simplify
 st7789v_spi_write
Date: Fri, 14 Jul 2023 03:37:43 +0200
Message-Id: <20230714013756.1546769-7-sre@kernel.org>
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

st7789v_spi_write initializes a message with just
a single transfer, spi_sync_transfer can be used
for that.

Reviewed-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Sebastian Reichel <sre@kernel.org>
---
 drivers/gpu/drm/panel/panel-sitronix-st7789v.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
index 1d43b8cc1647..6290bd49d055 100644
--- a/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
+++ b/drivers/gpu/drm/panel/panel-sitronix-st7789v.c
@@ -129,17 +129,13 @@ static int st7789v_spi_write(struct st7789v *ctx, enum st7789v_prefix prefix,
 			     u8 data)
 {
 	struct spi_transfer xfer = { };
-	struct spi_message msg;
 	u16 txbuf = ((prefix & 1) << 8) | data;
 
-	spi_message_init(&msg);
-
 	xfer.tx_buf = &txbuf;
 	xfer.bits_per_word = 9;
 	xfer.len = sizeof(txbuf);
 
-	spi_message_add_tail(&xfer, &msg);
-	return spi_sync(ctx->spi, &msg);
+	return spi_sync_transfer(ctx->spi, &xfer, 1);
 }
 
 static int st7789v_write_command(struct st7789v *ctx, u8 cmd)
-- 
2.40.1

