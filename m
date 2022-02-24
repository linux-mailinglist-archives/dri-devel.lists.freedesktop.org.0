Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4884C3657
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9654410E299;
	Thu, 24 Feb 2022 19:58:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DD3F10E284
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:58:55 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id D60B383CDE;
 Thu, 24 Feb 2022 20:58:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645732734;
 bh=sTh5c0zKpXgUa5F8blHtuG9WGhFJxzZwcvoM7i/kvoA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cWG0TsSDoUuMKY5GzGO6S8oliYmoYORZsSvTzE6UIfMqqjMT9v1QIUggET4310r5a
 N7b3NGZsI+Ps+yirT1539PDObL+/Q3kgjerHzo0MhhIww/6weREBg0RkGMwaPalI7I
 HXYQMb2bVo8aByEzWhE+PpzWFjLogd3kLmm4vC2DvpSJ59fhb58SKl3UDCHrRe3YAs
 j1R7/JDiyX3r/wquaXgu1oI+I3HM6ep2h1GycUC1ohRaFQyG6TGz6IGlRFSDw+lsfQ
 +zRQ2FdE0A0lRILpb76M8QTHWTnpMZpjs6v0il1B02vHasMncMdITXsTweSvRt4y73
 MXkKQmFSL5X0Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 08/12] drm/bridge: tc358767: Wrap (e)DP aux I2C
 registration into tc_aux_link_setup()
Date: Thu, 24 Feb 2022 20:58:13 +0100
Message-Id: <20220224195817.68504-9-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224195817.68504-1-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <narmstrong@baylibre.com>,
 Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This bit of code is (e)DP and aux I2C link specific, move it into
tc_aux_link_setup() to permit cleaner addition of DSI-to-DPI mode.
No functional change.

Reviewed-by: Lucas Stach <l.stach@pengutronix.de>
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
V3: - Add RB from Lucas
---
 drivers/gpu/drm/bridge/tc358767.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index e9cec6f8e0e9d..b4ae4dd5b89aa 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -656,6 +656,12 @@ static int tc_aux_link_setup(struct tc_data *tc)
 	if (ret)
 		goto err;
 
+	/* Register DP AUX channel */
+	tc->aux.name = "TC358767 AUX i2c adapter";
+	tc->aux.dev = tc->dev;
+	tc->aux.transfer = tc_aux_transfer;
+	drm_dp_aux_init(&tc->aux);
+
 	return 0;
 err:
 	dev_err(tc->dev, "tc_aux_link_setup failed: %d\n", ret);
@@ -1751,12 +1757,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
-	/* Register DP AUX channel */
-	tc->aux.name = "TC358767 AUX i2c adapter";
-	tc->aux.dev = tc->dev;
-	tc->aux.transfer = tc_aux_transfer;
-	drm_dp_aux_init(&tc->aux);
-
 	tc->bridge.funcs = &tc_edp_bridge_funcs;
 	if (tc->hpd_pin >= 0)
 		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
-- 
2.34.1

