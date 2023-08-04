Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EDFF76FEB6
	for <lists+dri-devel@lfdr.de>; Fri,  4 Aug 2023 12:44:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8B1310E6CD;
	Fri,  4 Aug 2023 10:44:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 991E810E6CB
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Aug 2023 10:44:41 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B21ED188E;
 Fri,  4 Aug 2023 12:43:34 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1691145815;
 bh=rtp9mGXPYI+O3f2aQFTiJmta7zUghg7DuTpPSnMYVrU=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=ogHmPUfZs6vovAKVCrGMNPw6M8LeS3Z0RaiFNbFy2ICeJueV++UWVIJREG2oaD5Nc
 5iRKFrToeFG0nM7TVHvkv0O1j8wga9YGP+2RqEQjwKPgfhvaWzKS+KlC0GWFQUQBFO
 I5qbvgZ0z97r+Dc29xy+53K6Rrb21foDNyMixXQM=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Fri, 04 Aug 2023 13:44:07 +0300
Subject: [PATCH 02/11] drm/bridge: tc358768: Fix bit updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230804-tc358768-v1-2-1afd44b7826b@ideasonboard.com>
References: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
In-Reply-To: <20230804-tc358768-v1-0-1afd44b7826b@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1966;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=rtp9mGXPYI+O3f2aQFTiJmta7zUghg7DuTpPSnMYVrU=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBkzNaRHlppAaUlp8wmp8JUbwlcKbfRJpNDPjydH
 YYi+Al1AKWJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZMzWkQAKCRD6PaqMvJYe
 9R8aD/91CxuRAWCF7MErsxmijuy+KAwtPMqSW0zBy2N6+cCaXwDex4qa57bXDMHnlvmo3h2kLYw
 VkoEqMtdAVe123Cxi7jJXLBTvV/4FmQNdl+oGMumHwf/HpXPo8htpApWiFrf8m+fybRVXQZ5lAo
 fOtFiuF319tJONUj5P4t3Y9/k3zsJPoXEgC8HdGt5xXf+HPTDUgQHU/0PDPQSP6y8wE0KmOQOdT
 UZ5NHK5MSFnchZZgqgZM6XP9Sq54GShRmgjf+iDajV85zHO77y2rvB0QGAXXaEYWM3nyHvvPv77
 ptl/yPC/YwktitF95mwf9UALiB+VBA8YKok/qap9k0bIwclno/8JYwBsK2bfTKhN6q3ZhuZUyKW
 MGzFAQtnWb+agPRefMO1eiBJ4mMRY7Jp6NFLyWvRDxIY/fb356yzIBaX8g6JwjbQuarWrL/Xwxy
 INQPQ70R9YZRCyaKsEtoEXvb+zJ4BBuOwrXYEEkeyCxPYk/RKSzyee5LccSWhyqCf1BAWFaw134
 PqBHf/bU8/SEy5jDNhyLGN1+xsPba4DP262HhsVhDJ67RwsVjk1Fbybtf/H1loICZ6e/Ow2PjR0
 xxcjAwC97H936jk0jI9AThKf1Cbs7EmFnpo6yQl+RSdmCi6SCe4fRjZVwWxdkkfTJ2DenXxfpso
 xJMzgO12Zbn5/bA==
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
Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/bridge/tc358768.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358768.c b/drivers/gpu/drm/bridge/tc358768.c
index bc97a837955b..b668f77673c3 100644
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

