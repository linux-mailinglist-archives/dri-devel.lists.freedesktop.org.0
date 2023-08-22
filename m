Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 48BF47846EA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Aug 2023 18:20:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AC0510E3AC;
	Tue, 22 Aug 2023 16:20:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15FFC10E3A3
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Aug 2023 16:20:06 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1492D87E0;
 Tue, 22 Aug 2023 18:18:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1692721128;
 bh=oiBuwIaPMPE+jS3H7n/2pUtTE6Vc2yzE7HECj902nxU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=EzxZlWVIeYSKn/4nUdgNYrkW56Ui7W5yQi3XQ7RaYewIaHbIrv/Nda7H5JgtzuC59
 CAkxNOgFp8Ujye6Q7QRybLecRvKhKgZYjZk5E9UL3tdaQWkVfxL+dvUnjdC1DV2Zie
 ZOwFAS+nE8JvMJ0256zKJRjucX4+25LpHTk5lO2E=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 22 Aug 2023 19:19:37 +0300
Subject: [PATCH v3 04/12] drm/bridge: tc358768: Fix bit updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230822-tc358768-v3-4-c82405dac0c1@ideasonboard.com>
References: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
In-Reply-To: <20230822-tc358768-v3-0-c82405dac0c1@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=oiBuwIaPMPE+jS3H7n/2pUtTE6Vc2yzE7HECj902nxU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk5OAr8GpwKXhNo0EzpZhs7CgeXIe5yS51dSq+h
 kLEVSIuawOJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZOTgKwAKCRD6PaqMvJYe
 9YjWEACAFAp2icbhM5YxVPRVxXacwjSPc4w50GnByzqLcxBzVOdyTHT7LCws0BTZ9lV/krurxOM
 oDlUFUnveSQp+/VrYa4qhmu0OSAecPiu6W87RbV+2ZiqJlylngmqjDwuEPkcCbqftvMhRCyXux/
 zn1IqkOZqwUy1fZ6mMVGnnVqK/kaPAQ0Z9YzmVUdIpcRxsjy8GlxO6eBafV1zN05a324RAQpAs1
 3EbLaHoCsC89xaXfr3JWqWCoDcFYpKaW7I43arBSv1vdYkVZ8e4cr1BgNF5AE1VMzoj+MCF4Ve9
 AZGgQNV971ajReSC5nPuaE04EI7RZVIyl3bxC9tqJ6OMHFDeZ59Q5Csjh4ae6eobm08mizX81OY
 vFXwEBzXQscrGTiAfOFp3QrU+LrGofhCeqIVURBij+bGmN+PLGjwED74Ez8M92kYaiFcc2yjrQ4
 tDGTiRlE9dO7Ya90ErJjcxYTJA1RUtynnRs5JYW5HQc6ki/8/dwZCwmunhRp+rLfJzkXfHVtYzA
 zznxQ2oVRUMauZeDF9kPmotyA/xCAmqD4GwXCXxPLf7VUVFdAn6pKRSJ8Mffty19cU/06+UaL/N
 1LH0GWn7SjPZpRS+DUK8knDFf2buZUA32elkVgwMP365PWN321gHUypKtoK7wL41GB6JWMfnq2L
 Ek9jJHHqO26Iu0w==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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
Cc: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Aradhya Bhatia <a-bhatia1@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The driver has a few places where it does:

if (thing_is_enabled_in_config)
	update_thing_bit_in_hw()

This means that if the thing is _not_ enabled, the bit never gets
cleared. This affects the h/vsyncs and continuous DSI clock bits.

Fix the driver to always update the bit.

Fixes: ff1ca6397b1d ("drm/bridge: Add tc358768 driver")
Reviewed-by: Peter Ujfalusi <peter.ujfalusi@gmail.com>
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index 963ac550509b..99992af23f1e 100644
--- a/drivers/gpu/drm/bridge/tc358768.c
+++ b/drivers/gpu/drm/bridge/tc358768.c
@@ -794,8 +794,8 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 		val |= BIT(i + 1);
 	tc358768_write(priv, TC358768_HSTXVREGEN, val);
 
-	if (!(mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS))
-		tc358768_write(priv, TC358768_TXOPTIONCNTRL, 0x1);
+	tc358768_write(priv, TC358768_TXOPTIONCNTRL,
+		       (mode_flags & MIPI_DSI_CLOCK_NON_CONTINUOUS) ? 0 : BIT(0));
 
 	/* TXTAGOCNT[26:16] RXTASURECNT[10:0] */
 	val = tc358768_to_ns((lptxcnt + 1) * dsibclk_nsk * 4);
@@ -861,11 +861,12 @@ static void tc358768_bridge_pre_enable(struct drm_bridge *bridge)
 	tc358768_write(priv, TC358768_DSI_HACT, hact);
 
 	/* VSYNC polarity */
-	if (!(mode->flags & DRM_MODE_FLAG_NVSYNC))
-		tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5), BIT(5));
+	tc358768_update_bits(priv, TC358768_CONFCTL, BIT(5),
+			     (mode->flags & DRM_MODE_FLAG_PVSYNC) ? BIT(5) : 0);
+
 	/* HSYNC polarity */
-	if (mode->flags & DRM_MODE_FLAG_PHSYNC)
-		tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0), BIT(0));
+	tc358768_update_bits(priv, TC358768_PP_MISC, BIT(0),
+			     (mode->flags & DRM_MODE_FLAG_PHSYNC) ? BIT(0) : 0);
 
 	/* Start DSI Tx */
 	tc358768_write(priv, TC358768_DSI_START, 0x1);

-- 
2.34.1

