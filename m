Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF73257778E
	for <lists+dri-devel@lfdr.de>; Sun, 17 Jul 2022 19:45:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C1B5913DF;
	Sun, 17 Jul 2022 17:45:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay4-1.pub.mailoutpod1-cph3.one.com
 (mailrelay4-1.pub.mailoutpod1-cph3.one.com [46.30.210.185])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AC09113C9A
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Jul 2022 17:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=OH+7B1dv6A/IsRaDuE+rP9ZN0s2pjNrgOB/nzBGQAF4=;
 b=fWaLsgjbGnWlwD1onXdQrk08KNmgroH9ExsH4/Ift4sAngkj5dHZZeaU6aUso4nGiFWB4+XSXh5Ws
 pmqYAI4z6M60JDgostVEB+rl7FUJckPUEDUN4xhel4YIgWWOZWCGr35ofFTmCaR08iCoTw9THx9YCw
 o0pWj2Jn1T/2JB/U1HaFXekXWJ+0KhCkAZSle+lF/tVrfKXydHBJTLlSCx00y7cAJEM+6e7yAnJDMD
 qr2K5KY1vgubuZVeA2LpLDuOtJp3T4uMUh1PFVnGhn9FvOOtftDrivGqYMgcDsYeH0ldGOHyT95jDt
 qiDfcDerFT5tBGGxdEplvsJWhnJdOrA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=content-transfer-encoding:mime-version:references:in-reply-to:message-id:date:
 subject:cc:to:from:from;
 bh=OH+7B1dv6A/IsRaDuE+rP9ZN0s2pjNrgOB/nzBGQAF4=;
 b=n2sJMNE96nAy24OFbfHMHie+x45T7Ns0ZQgtqjazvcJXj1t5lB0PGXZsCWOlRyX3uwu92NbAFY70O
 +S9MCToCw==
X-HalOne-Cookie: 0b59a70e3f6c156b2b4c6740a14cbfe11b04ef81
X-HalOne-ID: 3677d553-05f8-11ed-823f-d0431ea8bb10
Received: from mailproxy1.cst.dirpod4-cph3.one.com
 (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay4.pub.mailoutpod1-cph3.one.com (Halon) with ESMTPSA
 id 3677d553-05f8-11ed-823f-d0431ea8bb10;
 Sun, 17 Jul 2022 17:45:14 +0000 (UTC)
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v1 06/12] drm/bridge: cros-ec-anx7688: Use
 drm_bridge_funcs.atomic_check
Date: Sun, 17 Jul 2022 19:44:48 +0200
Message-Id: <20220717174454.46616-7-sam@ravnborg.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220717174454.46616-1-sam@ravnborg.org>
References: <20220717174454.46616-1-sam@ravnborg.org>
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
Cc: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 David Airlie <airlied@linux.ie>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Guenter Roeck <groeck@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 chrome-platform@lists.linux.dev, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Arnd Bergmann <arnd@arndb.de>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Philip Chen <philipchen@chromium.org>,
 linux-renesas-soc@vger.kernel.org,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Cai Huoqing <cai.huoqing@linux.dev>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Replace the deprecated drm_bridge_funcs.mode_fixup() with
drm_bridge_funcs.atomic_check().

drm_bridge_funcs.atomic_check() requires the atomic state operations,
update these to the default implementations.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Benson Leung <bleung@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: chrome-platform@lists.linux.dev
---
 drivers/gpu/drm/bridge/cros-ec-anx7688.c | 28 +++++++++++++++---------
 1 file changed, 18 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cros-ec-anx7688.c b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
index 0f6d907432e3..fc19ea87926f 100644
--- a/drivers/gpu/drm/bridge/cros-ec-anx7688.c
+++ b/drivers/gpu/drm/bridge/cros-ec-anx7688.c
@@ -5,6 +5,7 @@
  * Copyright 2020 Google LLC
  */
 
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_print.h>
 #include <linux/i2c.h>
@@ -45,9 +46,10 @@ bridge_to_cros_ec_anx7688(struct drm_bridge *bridge)
 	return container_of(bridge, struct cros_ec_anx7688, bridge);
 }
 
-static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
-					      const struct drm_display_mode *mode,
-					      struct drm_display_mode *adjusted_mode)
+static int cros_ec_anx7688_bridge_atomic_check(struct drm_bridge *bridge,
+					       struct drm_bridge_state *bridge_state,
+					       struct drm_crtc_state *crtc_state,
+					       struct drm_connector_state *conn_state)
 {
 	struct cros_ec_anx7688 *anx = bridge_to_cros_ec_anx7688(bridge);
 	int totalbw, requiredbw;
@@ -56,13 +58,13 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
 	int ret;
 
 	if (!anx->filter)
-		return true;
+		return 0;
 
 	/* Read both regs 0x85 (bandwidth) and 0x86 (lane count). */
 	ret = regmap_bulk_read(anx->regmap, ANX7688_DP_BANDWIDTH_REG, regs, 2);
 	if (ret < 0) {
 		DRM_ERROR("Failed to read bandwidth/lane count\n");
-		return false;
+		return ret;
 	}
 	dpbw = regs[0];
 	lanecount = regs[1];
@@ -71,28 +73,34 @@ static bool cros_ec_anx7688_bridge_mode_fixup(struct drm_bridge *bridge,
 	if (dpbw > 0x19 || lanecount > 2) {
 		DRM_ERROR("Invalid bandwidth/lane count (%02x/%d)\n", dpbw,
 			  lanecount);
-		return false;
+		return -EINVAL;
 	}
 
 	/* Compute available bandwidth (kHz) */
 	totalbw = dpbw * lanecount * 270000 * 8 / 10;
 
 	/* Required bandwidth (8 bpc, kHz) */
-	requiredbw = mode->clock * 8 * 3;
+	requiredbw = crtc_state->mode.clock * 8 * 3;
 
 	DRM_DEBUG_KMS("DP bandwidth: %d kHz (%02x/%d); mode requires %d Khz\n",
 		      totalbw, dpbw, lanecount, requiredbw);
 
 	if (totalbw == 0) {
 		DRM_ERROR("Bandwidth/lane count are 0, not rejecting modes\n");
-		return true;
+		return 0;
 	}
 
-	return totalbw >= requiredbw;
+	if (totalbw < requiredbw)
+		return -EINVAL;
+
+	return 0;
 }
 
 static const struct drm_bridge_funcs cros_ec_anx7688_bridge_funcs = {
-	.mode_fixup = cros_ec_anx7688_bridge_mode_fixup,
+	.atomic_check = cros_ec_anx7688_bridge_atomic_check,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int cros_ec_anx7688_bridge_probe(struct i2c_client *client)
-- 
2.34.1

