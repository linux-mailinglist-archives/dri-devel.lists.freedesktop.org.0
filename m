Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F1A4B4EA9AF
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 10:50:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 37C3110E7F0;
	Tue, 29 Mar 2022 08:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0D3510E7EE
 for <dri-devel@lists.freedesktop.org>; Tue, 29 Mar 2022 08:50:40 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 306CA83FB9;
 Tue, 29 Mar 2022 10:50:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648543839;
 bh=oUuhEEtreQKlJiLKjQS8UrSWZTwYWNFC4temnxED8Y8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OGuhvmXGvUt59Hc8gd1g2uXZmGzBV6K3OD7redFyO+jYF7Bd3yhtjpWT1TRc6nijz
 4Da8jrmVR8dW4tEwtbduKudp5ycYdqzRV3g/LVS1U1C/IP+BFvCPT9/io262jAFM6Z
 gXZ/z95BqAkiu/Fbj9/8FQVnEyTmSWxszc+i2exp/XO4RcaLzjVDRax8SX5D0yihm8
 77Q/2nfudk2hwteC5gGOEJOaoB7W+ZIHreP7F4k2NUtbNinPvTXft2J7KTgiv1jto0
 Mx3eliA5/6oOf84wmxDAETJdWCzxlh8Yy/bM46FoJFrdG2Xqfv7jjW23fjDiTjLB7F
 ZZrs7PolGcppA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v5 07/11] drm/bridge: tc358767: Wrap (e)DP aux I2C
 registration into tc_aux_link_setup()
Date: Tue, 29 Mar 2022 10:50:11 +0200
Message-Id: <20220329085015.39159-8-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220329085015.39159-1-marex@denx.de>
References: <20220329085015.39159-1-marex@denx.de>
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
Tested-by: Lucas Stach <l.stach@pengutronix.de> # In both DPI to eDP and DSI to DPI mode.
Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
V3: - Add RB from Lucas
V4: - Add TB from Lucas
V5: - No change
---
 drivers/gpu/drm/bridge/tc358767.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 0f24156543bae..8a8b495aa0ad1 100644
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
@@ -1736,12 +1742,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
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
2.35.1

