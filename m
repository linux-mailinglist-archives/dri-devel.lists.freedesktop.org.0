Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1D7D642EE1
	for <lists+dri-devel@lfdr.de>; Mon,  5 Dec 2022 18:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CE1310E26C;
	Mon,  5 Dec 2022 17:33:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6576410E268
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Dec 2022 17:33:48 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 p13-20020a05600c468d00b003cf8859ed1bso10665214wmo.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Dec 2022 09:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DbOHaQWKqvBS1JahcuSixvUAmOZjyYpYLqTykMsal3g=;
 b=OJDc2nXt4r56jdPyin7fZ9LKcGXuy8iONnQUru8POHQw3B1nqBgPYER5dqW9NAFeTG
 OIC6dObP+kJjCtLK1m/l+ixOOcbwvlu1us5OM4ndSRZAaRGUfX3bfEpPTThfoJd3grcE
 8AVj7uu8tP0pnu18VkwtAYrcdPOtP71dgNmgYuEkKOcV2AbrjT8M5yHMD26DE2okFewh
 sC8Ft92x75Vq21FJADDv4Cg3DZTVDmkLDsg4Mmx4ssP9XpZvKyhBX74DI/7zf8xazHJT
 lva4UtBPGCuF9vT+UALqSK8gwVS66nQgSq97vJVE/RaBTSoSVukKTPrn4EIsCvznxDfW
 quZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DbOHaQWKqvBS1JahcuSixvUAmOZjyYpYLqTykMsal3g=;
 b=cx/7epRla2TvQMNwP8XZrkXQKZkL5Z7plwilW8cYlwZHBoI+cdIlt+KuE+X3xWMgMS
 k4elo5GZAm4X2dyWoleAcQDXTV06eFiw4gWFFAj76IEvfiL4uz03VrjRQ4aiCW4hkrhB
 pAeTm7aq/d+SDMtO1Ta8bV5xpxLjLGZS2lxZP3VtDXRMRKwEuTFz35Kwx+9MYWY6mUUI
 KHz9ny4vNoQHGf/kuZfhB7iw7+XnpP1G6eJwb6zWnuyvlhEzcE297d9R9Fwp/+3Db7tb
 yFjyb0OVsdmGhritJw7J92qwMCWevA/7fko1cxOgcGpMXIaQ4TuzDcMZOuthdsWVTKSK
 dMOw==
X-Gm-Message-State: ANoB5plKlE3t0agTcls8C018Y4A5LEOeHXiO/YtGtjnj+2S1uafWP2Fa
 um1ws7Pi19iELvZoUFj11ltODQ==
X-Google-Smtp-Source: AA0mqf4Sa/hXz+HQIjJMqWM+fo+koF1c3/WyuqO+yYE1Dp9Dr6xlmZQHPpo78Fk4qykgrfaMyQztIw==
X-Received: by 2002:a05:600c:46c8:b0:3cf:8896:e1de with SMTP id
 q8-20020a05600c46c800b003cf8896e1demr54854609wmo.4.1670261626921; 
 Mon, 05 Dec 2022 09:33:46 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 v15-20020a5d6b0f000000b002421ed1d8c8sm14524245wrw.103.2022.12.05.09.33.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Dec 2022 09:33:46 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/6] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Date: Mon,  5 Dec 2022 17:33:23 +0000
Message-Id: <20221205173328.1395350-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
References: <20221205173328.1395350-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philip Chen <philipchen@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>, andrzej.hajda@gmail.com,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sam Ravnborg <sam@ravnborg.org>

The atomic variants of enable/disable in drm_bridge_funcs are the
preferred operations - introduce these.

The ps8640 driver used the non-atomic variants of the drm_bridge_chain_pre_enable/
drm_bridge_chain_post_disable - convert these to the atomic variants.

v2:
  - Init state operations in drm_bridge_funcs (Laurent)

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Cc: Jitao Shi <jitao.shi@mediatek.com>
Cc: Philip Chen <philipchen@chromium.org>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 drivers/gpu/drm/bridge/parade-ps8640.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/parade-ps8640.c b/drivers/gpu/drm/bridge/parade-ps8640.c
index f74090a9cc9e..4b361d7d5e44 100644
--- a/drivers/gpu/drm/bridge/parade-ps8640.c
+++ b/drivers/gpu/drm/bridge/parade-ps8640.c
@@ -15,6 +15,7 @@
 
 #include <drm/display/drm_dp_aux_bus.h>
 #include <drm/display/drm_dp_helper.h>
+#include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_mipi_dsi.h>
@@ -442,7 +443,8 @@ static const struct dev_pm_ops ps8640_pm_ops = {
 				pm_runtime_force_resume)
 };
 
-static void ps8640_pre_enable(struct drm_bridge *bridge)
+static void ps8640_atomic_pre_enable(struct drm_bridge *bridge,
+				     struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 	struct regmap *map = ps_bridge->regmap[PAGE2_TOP_CNTL];
@@ -476,7 +478,8 @@ static void ps8640_pre_enable(struct drm_bridge *bridge)
 	ps_bridge->pre_enabled = true;
 }
 
-static void ps8640_post_disable(struct drm_bridge *bridge)
+static void ps8640_atomic_post_disable(struct drm_bridge *bridge,
+				       struct drm_bridge_state *old_bridge_state)
 {
 	struct ps8640 *ps_bridge = bridge_to_ps8640(bridge);
 
@@ -554,7 +557,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * EDID, for this chip, we need to do a full poweron, otherwise it will
 	 * fail.
 	 */
-	drm_bridge_chain_pre_enable(bridge);
+	drm_atomic_bridge_chain_pre_enable(bridge, connector->state->state);
 
 	edid = drm_get_edid(connector,
 			    ps_bridge->page[PAGE0_DP_CNTL]->adapter);
@@ -564,7 +567,7 @@ static struct edid *ps8640_bridge_get_edid(struct drm_bridge *bridge,
 	 * before, return the chip to its original power state.
 	 */
 	if (poweroff)
-		drm_bridge_chain_post_disable(bridge);
+		drm_atomic_bridge_chain_post_disable(bridge, connector->state->state);
 
 	return edid;
 }
@@ -579,8 +582,11 @@ static const struct drm_bridge_funcs ps8640_bridge_funcs = {
 	.attach = ps8640_bridge_attach,
 	.detach = ps8640_bridge_detach,
 	.get_edid = ps8640_bridge_get_edid,
-	.post_disable = ps8640_post_disable,
-	.pre_enable = ps8640_pre_enable,
+	.atomic_post_disable = ps8640_atomic_post_disable,
+	.atomic_pre_enable = ps8640_atomic_pre_enable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static int ps8640_bridge_get_dsi_resources(struct device *dev, struct ps8640 *ps_bridge)
-- 
2.34.1

