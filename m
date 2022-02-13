Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 761294B38EC
	for <lists+dri-devel@lfdr.de>; Sun, 13 Feb 2022 03:27:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D5EA10E1A6;
	Sun, 13 Feb 2022 02:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86C3810E1A6
 for <dri-devel@lists.freedesktop.org>; Sun, 13 Feb 2022 02:27:04 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 3A1A983095;
 Sun, 13 Feb 2022 03:27:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1644719222;
 bh=9zhagREQC9QDVIBVCcMDLxnDGxs/W1+y6okQrZrfq2Y=;
 h=From:To:Cc:Subject:Date:From;
 b=GY+9lQNW/FcAGNAkZMx7+jeQwK7Lh4Z/SBswUzs+yagK9DjzHog7F6/mqylvB9LhR
 J0sDsaCT4FPyQvI7xSCVOcXFzTc2mEuXczcnIAtMnMgFiuixCb9KKc/cfSVzCnClMy
 g3/aJUhZflxOttuR5Ivm909HtSdLkhpCyTV+9p24YD9bk4x5tPZ9NSV8xtPp40fqWi
 HjDdJakUyOXZHvZTIJ9dCOGRx+cuSAB4ST94Tx5obpFpwJPsuWqB9Cl1IHvFNeIGS9
 8P7P5+zZHN7s5hGwAa1YM88ECbn5My7ysDDvtXPmhxmHzYq3HWZHRt0kUIcAibVzDw
 JXEfpKsoeCJCQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH][RESEND] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
Date: Sun, 13 Feb 2022 03:26:48 +0100
Message-Id: <20220213022648.495895-1-marex@denx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.5 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Jagan Teki <jagan@amarulasolutions.com>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 19daaddd29a41..1d7c154ea1d79 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -488,6 +488,11 @@ static void sn65dsi83_atomic_enable(struct drm_bridge *bridge,
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
2.34.1

