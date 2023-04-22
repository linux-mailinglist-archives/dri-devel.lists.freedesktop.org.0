Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CED16EBB4B
	for <lists+dri-devel@lfdr.de>; Sat, 22 Apr 2023 22:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CD4F10E1EE;
	Sat, 22 Apr 2023 20:51:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653A310E181
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Apr 2023 20:50:31 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E25B660DD8;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22B98C433D2;
 Sat, 22 Apr 2023 20:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1682196630;
 bh=qucudSlPchI3svnOIhdFV9BiouDXG/kOilDZtzG2V8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=AdtXJEch7BT8FPzNbIzVkdDmmBN2p3kL10NBU5moWj61DTwmx15WvtMOgLtFRT4Nc
 j0NuC+dNOZghYWBXTiRsfswdEwu0zp8Q2YkSOVlLuspQsRBQ8KKWMV1sNGbIjESE0+
 shqLCVXQfdjzEH/fZgLTNBa3ehTuZ/F0WEr2MVBkpyCE+8xxl1gM4PerEry/t4qg2F
 k7MzN7tQw+uf+0qt9q9RdI3zZUkPy0l2k4smddLZe8UquDZWV5NopOLJdn3bKFPSzi
 JHQPQeXcgWQQm510KcncwLOFQ7A6x1ZubWPp5nVkNkb2mlz2XHJZ4pdH5dvwJJkVWl
 GHz6/Og4WB9uA==
Received: by mercury (Postfix, from userid 1000)
 id 14A471066CC6; Sat, 22 Apr 2023 22:50:25 +0200 (CEST)
From: Sebastian Reichel <sre@kernel.org>
To: Sebastian Reichel <sre@kernel.org>
Subject: [PATCH v2 06/13] drm/panel: sitronix-st7789v: simplify
 st7789v_spi_write
Date: Sat, 22 Apr 2023 22:50:05 +0200
Message-Id: <20230422205012.2464933-7-sre@kernel.org>
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

st7789v_spi_write initializes a message with just
a single transfer, spi_sync_transfer can be used
for that.

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
2.39.2

