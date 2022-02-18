Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9B54BAEEB
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:01:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C03F10E213;
	Fri, 18 Feb 2022 01:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B18A610E213
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:20 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1CD5083B6E;
 Fri, 18 Feb 2022 02:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645146079;
 bh=hRawi8Q4wi/28fuNLF/DzsRA5NbbK9dngBEsmyN1u4k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uDAfxUwxJKqK334n3Rmp67E5imyTsLXw5WN+eMgQ9IsDbcj2WClsC/VKWiCjH1WGC
 3kgW/MTc4DUKup7db0QMk/2688zlchhe8iBSGbdwfLGr0JZv0cX9DAlrrCMx204AR2
 KzkRpW8IvvgO0vcCNI/LKHk9U0rKsPfYgpECRH2ZW3jecuIhQnk3zgLyhzE0UsGnNr
 NC+yRohKHfjDjWyE2jTrtqPiS0I3OerFEI/RvvyV9KXWO7l7QThj6evAkCIeVvl7XU
 bUUyPGftF5asAYHnbD0RESMCvh3XwYzPrnTMbnQk+x2SIDJu7QgMeOTAr3TjOyT3Zf
 CuW3D8x7gn0pw==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 07/11] drm/bridge: tc358767: Wrap (e)DP aux I2C
 registration into tc_aux_link_setup()
Date: Fri, 18 Feb 2022 02:00:50 +0100
Message-Id: <20220218010054.315026-8-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218010054.315026-1-marex@denx.de>
References: <20220218010054.315026-1-marex@denx.de>
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

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
---
 drivers/gpu/drm/bridge/tc358767.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 450a472888ba9..55b7f3fb9eec9 100644
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
 	tc->bridge.funcs = &tc_bridge_funcs;
 	if (tc->hpd_pin >= 0)
 		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
-- 
2.34.1

