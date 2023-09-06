Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BE7935A3
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 08:51:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAAAA10E572;
	Wed,  6 Sep 2023 06:51:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A07E310E570
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 06:51:31 +0000 (UTC)
Received: from [127.0.1.1] (91-154-35-171.elisa-laajakaista.fi [91.154.35.171])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B5C7C10FC;
 Wed,  6 Sep 2023 08:50:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1693983003;
 bh=eXYrSM7ApA2MbVOUtXFJ2obroG8H/iokUFgcNEvT5zg=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=rJuCV/RxcYAYic9CyTl6ELDJNb2jJGrhKvWr4FiZabIIj5TC2NiePMxCOZSkoyyBi
 TQL6146GzsgPbCKhVkIgu0luuWEnia6jaj8pQpFr0AQX8aYIVT8oLX2NgJpCWdK6xz
 lfoubA4LJndpeglekfgADQGFCyRNMdfLxU79rIsg=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Wed, 06 Sep 2023 09:50:51 +0300
Subject: [PATCH v4 04/12] drm/bridge: tc358768: Fix bit updates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230906-tc358768-v4-4-31725f008a50@ideasonboard.com>
References: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
In-Reply-To: <20230906-tc358768-v4-0-31725f008a50@ideasonboard.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Maxim Schwalm <maxim.schwalm@gmail.com>, 
 Francesco Dolcini <francesco@dolcini.it>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2146;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=eXYrSM7ApA2MbVOUtXFJ2obroG8H/iokUFgcNEvT5zg=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBk+CFpVVmAbU8LCF1vT/Tlh+9yQWh9BrxwgFrl2
 ZRjo+V4nZSJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZPghaQAKCRD6PaqMvJYe
 9Z8YEACpJPXt7noW0NY1sBaNG85kH6iMKb7sEOfxUuRnD4Y3b4KHDkC/DKmUYyL8PMuJvu2gVBz
 3cG6zO/A0hPAAhYmWoG+gmc4QwXvFdEi9Q9VwD8Z+pqYupzadMI5lqcqLsWv/ZT7NUusDfhtkNg
 wAJee2fMjQ2XISA5ZG0q2F3gGIlrO/mgMoQGJN09CV4ZV5K7/kUHdFDFNJaa7SHAm2Ps+4yzfAD
 wwuNAahNqqLReI5KgmZHRTaK74q3Re/LflJLXLOoaPTImoUxTMat+74MDoyUaueA8ZwPPT7YsFC
 9tqLv+tZHLRr3EvEMV3NOyUD8x7L82VXdBZ0agMKNjB8N+zLJlxNtazNO2BT3wLdHjigeQIv+ue
 FxAihvdDtjwJ83rscXJbkIieAvFMIuRVdr8jDQ7A7rz0We0QO/vnyCCY7oxAc7E/PMraO0ayZF4
 aclez97YOJmSIcqQqpNMbULj+uy8adGQCfpVawuUFNfwcjdW+JC3Pz9GSg5hoB8KCbDxIPdpHmH
 /LiYUOvgz2NYY9WKUcuflVdvuaIc7lci7WHqYgmC+QZQc/S9Zz44toH1SRoCfsBflsCjUWUGn3h
 Alo/9T/dpxO+jd9HgIsoZpSdHRRxQgftBBquYjXG+fn+2Zt6WkzUaW1jCxzUQLr+pA0ApV3Jqlj
 dn0mbpyWdwy3NnQ==
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
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Aradhya Bhatia <a-bhatia1@ti.com>
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
Tested-by: Maxim Schwalm <maxim.schwalm@gmail.com> # Asus TF700T
Tested-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
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

