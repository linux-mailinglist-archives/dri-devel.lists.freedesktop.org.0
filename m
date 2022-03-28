Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 994C24EA287
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 23:44:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D724010EDAE;
	Mon, 28 Mar 2022 21:44:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB5D010E121
 for <dri-devel@lists.freedesktop.org>; Mon, 28 Mar 2022 21:43:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1E83883F93;
 Mon, 28 Mar 2022 23:43:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648503833;
 bh=M4guXbay1bq9Fh9l6PhuYPjb1XtUeWrqVGE9sQFWkMo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=wqvcUO0jtsYpketDpBVovbr7paZuxeqxA1+flWEOqCB52Zwz5BRVQ1oOgUU5YQrp1
 xyFBui9gM8ml8FCgejnmA01sBStB3nmQBGntFkljzBniyNvc4h+J3gYjxfcb573Uww
 IKD1OFe+pikMLoeMFWq5yzEWwObU/RBRmlDZ6zpLFh+RhUe6C5jAu7jchOQGWFHSDa
 igYZlE15y9TTuWQLUcgtcWPfmqe5w3y2tfAlaZAfmqqtBPqmVOHTH/l/6b4+TQgkl2
 cO06H1cGMADBn2aqjNtldQkwiR4PPEorgDcFVPTnXHJ9ixcisFo38RqFQt3bIlU1x6
 GhOKFWx2P790A==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 04/11] drm/bridge: tc358767: Convert to atomic ops
Date: Mon, 28 Mar 2022 23:43:17 +0200
Message-Id: <20220328214324.252472-5-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220328214324.252472-1-marex@denx.de>
References: <20220328214324.252472-1-marex@denx.de>
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

Use the atomic version of the enable/disable operations to continue the
transition to the atomic API. This will be needed to access the mode
from the atomic state.

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
---
 drivers/gpu/drm/bridge/tc358767.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 23e0280f484de..f88d8e616f7f8 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1234,7 +1234,9 @@ static int tc_edp_stream_disable(struct tc_data *tc)
 	return 0;
 }
 
-static void tc_edp_bridge_enable(struct drm_bridge *bridge)
+static void
+tc_edp_bridge_atomic_enable(struct drm_bridge *bridge,
+			    struct drm_bridge_state *old_bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
@@ -1259,7 +1261,9 @@ static void tc_edp_bridge_enable(struct drm_bridge *bridge)
 	}
 }
 
-static void tc_edp_bridge_disable(struct drm_bridge *bridge)
+static void
+tc_edp_bridge_atomic_disable(struct drm_bridge *bridge,
+			     struct drm_bridge_state *old_bridge_state)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 	int ret;
@@ -1459,11 +1463,14 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.detach = tc_edp_bridge_detach,
 	.mode_valid = tc_edp_mode_valid,
 	.mode_set = tc_bridge_mode_set,
-	.enable = tc_edp_bridge_enable,
-	.disable = tc_edp_bridge_disable,
+	.atomic_enable = tc_edp_bridge_atomic_enable,
+	.atomic_disable = tc_edp_bridge_atomic_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
 	.detect = tc_bridge_detect,
 	.get_edid = tc_get_edid,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
 };
 
 static bool tc_readable_reg(struct device *dev, unsigned int reg)
-- 
2.35.1

