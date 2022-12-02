Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F6056408B5
	for <lists+dri-devel@lfdr.de>; Fri,  2 Dec 2022 15:47:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D1510E143;
	Fri,  2 Dec 2022 14:47:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1D010E0C0
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Dec 2022 14:47:32 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 f13-20020a1cc90d000000b003d08c4cf679so612969wmb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 02 Dec 2022 06:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t0KqE1aOwcyJOkz1Tnwq3P+1yMCqCbfKFsbnGJh8UIo=;
 b=CGgUT30AjVZcCEkmnydJCTCFoTE91pKUxa5l/RG2+X9PnyydbcDIGxSQGDHkDV0pWn
 i++Ag8tutQtgXhOCto4MMHaNkv6jzixMp/lgz5C1neubKYvbrSfci8CooI2E9eGFHPtN
 UjXZFs1iUZOo9CUZLPXCRjy56gkT/zTATaMR8MLr1xVDWbBUyPIViX3FTgjzTwuXS3rr
 CX1Rq41yuppDkXRA18JFH5HY1Kol1l/JAuXrksjjj16bOt+T8f9u926lWsoT8AfMF20K
 qSYhVWJ3L2whsEiLkvsSb/lmquzdm5GJu5p0OUDO45FxLEVDvyAdnStYhnI0RoWdugye
 apNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t0KqE1aOwcyJOkz1Tnwq3P+1yMCqCbfKFsbnGJh8UIo=;
 b=HWOKhWo7yWhuWIWwOEJu2AiqKZ/MxCnou9RaCRWratLrZqMR9gvVjA35wTbr8vF1PK
 zHpdALf7af5URh5u/UTM3GktcwrYsIWIlccSBjNR5b/YKWuUBczMX0hssfrDui+4ibxf
 T8RNC1PkkYhHxk/s++jESxe+nVB9XgR1gNHP34qawyXs/7LGf/UbkDeVucOqcaCZIppS
 Z/bDTaVygZx0voIbRzaYeW8Q4NT7bzWEONzelfXs/7e9tj6Mu9yIy6e9kgQXQb63CL0b
 gJ0eZFoGosNW1f2/N9nDR4eBWp+/ygmkgBHryRbZckMjAHg/GA0NwPj435JJOs8OaHJH
 VPAQ==
X-Gm-Message-State: ANoB5pnGpfvRJSuvoNrONF4Wv7QHfEhj75V7hQm3kyCSJXfD/ptWvqv4
 J0SvusTIi8ZtFnTHdgD+nd37ww==
X-Google-Smtp-Source: AA0mqf4BkZk54zidIw/2q9VaY4sD7Yuxy4VezDXCihcDcO6yp3MCPgSzoB4xgMdWYV+Ylha+vMyAdQ==
X-Received: by 2002:a1c:790a:0:b0:3cf:e137:b31d with SMTP id
 l10-20020a1c790a000000b003cfe137b31dmr42548510wme.205.1669992451310; 
 Fri, 02 Dec 2022 06:47:31 -0800 (PST)
Received: from dave-Ubuntu2204.pitowers.org ([93.93.133.154])
 by smtp.googlemail.com with ESMTPSA id
 n29-20020a05600c3b9d00b003c21ba7d7d6sm10700152wms.44.2022.12.02.06.47.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Dec 2022 06:47:30 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 1/5] drm/bridge: ps8640: Use atomic variants of
 drm_bridge_funcs
Date: Fri,  2 Dec 2022 14:28:12 +0000
Message-Id: <20221202142816.860381-2-dave.stevenson@raspberrypi.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
References: <20221202142816.860381-1-dave.stevenson@raspberrypi.com>
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
Cc: Marek Vasut <marex@denx.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Philip Chen <philipchen@chromium.org>, Jitao Shi <jitao.shi@mediatek.com>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Douglas Anderson <dianders@chromium.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andrzej.hajda@gmail.com, Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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
Cc: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Cc: Philip Chen <philipchen@chromium.org>
Cc: Andrzej Hajda <a.hajda@samsung.com>
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

