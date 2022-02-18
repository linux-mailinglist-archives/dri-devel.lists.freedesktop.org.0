Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46A0F4BAEEC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 02:01:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F97710E950;
	Fri, 18 Feb 2022 01:01:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B8F010E931
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Feb 2022 01:01:21 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 8571B83B71;
 Fri, 18 Feb 2022 02:01:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645146079;
 bh=yrZDWDqNLRXYnNiTQHOXVlg7VIMa49MwqiGSnyRjcYY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=tHToSSxHyIOQo8OtLjuz+LgrXqMp6ToU6255Lsctd7vm2HwfkUBdADQqgpQUqSMIW
 cArypZn0IkznRr6/sGMyW/hsYvnDuy2CwyiwuoLS/oHbEJiKvpH3h9G1gbmt2xH+G7
 MOaj01jMkHRKnkx52xy4pKvSYqvvwSctH8mY6p5kXs7JuH/2OwivyEOLtys1cmIsdi
 CNZu7jCrRFegxlZpQ9ttmb/FGUTcz+LGxDDk4yWv0JmipBgAV+MOs8488hKcgN2sA2
 MG7S0c5z7LRVk37QqqF9XFP+lxZR/byZpSnRU20N2FQqlc5T7dvLYpaQWsqJj3UPcU
 Iwk9+KohOMO6Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V2 08/11] drm/bridge: tc358767: Move bridge ops setup into
 tc_probe_edp_bridge_endpoint()
Date: Fri, 18 Feb 2022 02:00:51 +0100
Message-Id: <20220218010054.315026-9-marex@denx.de>
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

The bridge ops are specific to the bridge configuration, move them
into tc_probe_edp_bridge_endpoint() to permit cleaner addition of
DSI-to-DPI mode. No functional change.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
V2: - New patch
---
 drivers/gpu/drm/bridge/tc358767.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 55b7f3fb9eec9..7dae18de76c97 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1676,6 +1676,11 @@ static int tc_probe_edp_bridge_endpoint(struct tc_data *tc)
 		tc->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 	}
 
+	tc->bridge.funcs = &tc_bridge_funcs;
+	if (tc->hpd_pin >= 0)
+		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
+	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
+
 	return ret;
 }
 
@@ -1757,11 +1762,6 @@ static int tc_probe(struct i2c_client *client, const struct i2c_device_id *id)
 	if (ret)
 		return ret;
 
-	tc->bridge.funcs = &tc_bridge_funcs;
-	if (tc->hpd_pin >= 0)
-		tc->bridge.ops |= DRM_BRIDGE_OP_DETECT;
-	tc->bridge.ops |= DRM_BRIDGE_OP_EDID;
-
 	tc->bridge.of_node = dev->of_node;
 	drm_bridge_add(&tc->bridge);
 
-- 
2.34.1

