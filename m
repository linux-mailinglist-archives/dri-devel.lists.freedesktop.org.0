Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48079402248
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 04:40:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E792B89C33;
	Tue,  7 Sep 2021 02:39:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 488DE89C33
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Sep 2021 02:39:58 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 0B2E782BD6;
 Tue,  7 Sep 2021 04:39:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1630982395;
 bh=aEq5Q1L25EKmoYcKymQFyColcYb20Cj6I9LdiPjOmxE=;
 h=From:To:Cc:Subject:Date:From;
 b=lrfuR1O6a38pvuTzA3hnGQjMvrMMvV2MEzj1BhpHQD59kTi/fvHdtGg+VJiie6HTa
 Uw+9vxUlxxhdTT083TcA3s9V3PDu/9LvY+HZh9z7PST+4zFALapkSLVQGu12CYKtpF
 m0tqqiKJfDsBD7RFLgQ/jtjAEVpz09NkhEeoDozeJer7OUxTvYIerM6pRLefxeegmH
 Y7N4IYUsdfesrO95l9BDqISwCaGGVcjq/rUSQyFe0n8h38YAdPoPLXjKvZFLYlHtTo
 gevMfwX36/tprQ6hkhoikW5JOZ5WTeMY2Q9x5mQKyKUFGythwgr0Hv1upuJvIxmSZG
 J2NYsHwmqbr3A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>, Jagan Teki <jagan@amarulasolutions.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Linus Walleij <linus.walleij@linaro.org>,
 Robert Foss <robert.foss@linaro.org>, Sam Ravnborg <sam@ravnborg.org>
Subject: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register after
 enabling the bridge
Date: Tue,  7 Sep 2021 04:39:48 +0200
Message-Id: <20210907023948.871281-1-marex@denx.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
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

In rare cases, the bridge may not start up correctly, which usually
leads to no display output. In case this happens, warn about it in
the kernel log.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
---
NOTE: See the following:
https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video
https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index a32f70bc68ea4..4ea71d7f0bfbc 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
 	/* Clear all errors that got asserted during initialization. */
 	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
 	regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
+
+	usleep_range(10000, 12000);
+	regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
+	if (pval)
+		dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
 }
 
 static void sn65dsi83_atomic_disable(struct drm_bridge *bridge,
-- 
2.33.0

