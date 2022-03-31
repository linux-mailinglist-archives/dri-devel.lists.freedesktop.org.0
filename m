Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D2C834EDCA9
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:21:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0839610F3AC;
	Thu, 31 Mar 2022 15:21:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 450FA10F397
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:20:43 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 9878184217;
 Thu, 31 Mar 2022 17:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648740041;
 bh=oDiZrPKc407V19YyY9IHD9ryLgp1qqSxDm2GfnPIUT8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lFG+0rcHYeJKLwC0quiPhlyEW3R7KGBVueFHi5kYKZGV6hk3R8YQhD0fgquDMtPPA
 PWCvuU3uWwpOtLwS/VyD5todbZerhZqnSNT85LMoGLWz5l/6cvGxDbSiv3/w62oGAL
 v4+6LuMu9T/FwSh9FyQ9oJLZfQmujl/w36jastwxLhn2nDmr4sc6V7mM65BC1oK7Vf
 jGbFCBHHWVZqG0VdxKFFcgzXC0OsaK9XW6MBlBXebKlfWxgwx+fCdvAIUwKUvssY2l
 gKMaWUjO/pMf7jV4oGrhT+KPAnddE4J9/h8EWG1fiCqNSmiH54n2F8my5/2KWzdBQV
 b/+E22BgGiy7w==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 08/11] drm/bridge: tc358767: Move bridge ops setup into
 tc_probe_edp_bridge_endpoint()
Date: Thu, 31 Mar 2022 17:19:49 +0200
Message-Id: <20220331151952.13221-9-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220331151952.13221-1-marex@denx.de>
References: <20220331151952.13221-1-marex@denx.de>
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
Cc: Marek Vasut <marex@denx.de>, Jonas Karlman <jonas@kwiboo.se>,
 Neil Armstrong <narmstrong@baylibre.com>, robert.foss@linaro.org,
 Maxime Ripard <maxime@cerno.tech>, Sam Ravnborg <sam@ravnborg.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The bridge ops are specific to the bridge configuration, move them
into tc_probe_edp_bridge_endpoint() to permit cleaner addition of
DSI-to-DPI mode. No functional change.

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
V3: - No change
V4: - Add RB/TB from Lucas
V5: - No change
V6: - No change
---
 drivers/gpu/drm/bridge/tc358767.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 8a8b495aa0ad..8c468f77618d 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1613,6 +1613,11 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	}
 
+	tc->bridge.funcs = &tc_edp_bridge_funcs;
+	if (tc->hpd_pin >= 0)
+		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
+
 	return ret;
 }
 
@@ -1742,11 +1747,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
-	tc->bridge.funcs = &tc_edp_bridge_funcs;
-	if (tc->hpd_pin >= 0)
-		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
-	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
-
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
-- 
2.35.1

