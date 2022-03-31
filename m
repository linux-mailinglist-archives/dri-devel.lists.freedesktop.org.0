Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992084EDCA5
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 17:20:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E57E510F397;
	Thu, 31 Mar 2022 15:20:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A43410F3AC
 for <dri-devel@lists.freedesktop.org>; Thu, 31 Mar 2022 15:20:37 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7F03D84217;
 Thu, 31 Mar 2022 17:20:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1648740035;
 bh=awXL3I7O72PLmijs23RwXwYFEzpjTmbC3Ypb3WrtN/E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IZPjrXxUI3wkRHHHK4b9Ga7aNNMdnMduSsVohL/1drL5HIZp5odv1gQ99rDkBVmYr
 xwV6Jlzp4+JiggZvMkySN+BlskrSiqdE2HvN4g0b/rW/kEHPVqkUlBU9rJC2tRwuyP
 hEvRtmK2aD0NU7sFjgaSTNszy07n86ABHluX83L67VVI0pFiAUwvaCJEYDEk2QIRgu
 3mfi2ITzQUL3OBGrHWrJdOn+lgZ6CPkPmWQbqA8979LYdLpomA9QPSvcvjuUDXAUsQ
 lY+QZR8odN8l775jeC2gxI5Q21ZZ4T6A4kXe1qRVsZan/1ncwjtvEuaPHpmVWw/hwY
 r6iMq9ZPuFUsg==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v6 05/11] drm/bridge: tc358767: Implement atomic_check callback
Date: Thu, 31 Mar 2022 17:19:46 +0200
Message-Id: <20220331151952.13221-6-marex@denx.de>
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

Implement .atomic_check callback which prevents user space from setting
unsupported mode. The tc_edp_common_atomic_check() variant is already
prepared for DSI-to-DPI mode addition, which has different frequency
limits.

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
V3: - Drop edp from tc_edp_common_atomic_check,
      s@\<tc_edp_common_atomic_check\>@tc_common_atomic_check@g
    - Return -EINVAL in case clock frequency is too high
V4: - Add RB/TB by Lucas
V5: - No change
V6: - No change
---
 drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f88d8e616f7f..e95153d9c149 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1289,6 +1289,31 @@ static bool tc_bridge_mode_fixup(struct drm_bridge *bridge,
 	return true;
 }
 
+static int tc_common_atomic_check(struct drm_bridge *bridge,
+				  struct drm_bridge_state *bridge_state,
+				  struct drm_crtc_state *crtc_state,
+				  struct drm_connector_state *conn_state,
+				  const unsigned int max_khz)
+{
+	tc_bridge_mode_fixup(bridge, &crtc_state->mode,
+			     &crtc_state->adjusted_mode);
+
+	if (crtc_state->adjusted_mode.clock > max_khz)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int tc_edp_atomic_check(struct drm_bridge *bridge,
+			       struct drm_bridge_state *bridge_state,
+			       struct drm_crtc_state *crtc_state,
+			       struct drm_connector_state *conn_state)
+{
+	/* DPI->(e)DP interface clock limitation: upto 154 MHz */
+	return tc_common_atomic_check(bridge, bridge_state, crtc_state,
+				      conn_state, 154000);
+}
+
 static enum drm_mode_status
 tc_edp_mode_valid(struct drm_bridge *bridge,
 		  const struct drm_display_info *info,
@@ -1463,6 +1488,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.detach = tc_edp_bridge_detach,
 	.mode_valid = tc_edp_mode_valid,
 	.mode_set = tc_bridge_mode_set,
+	.atomic_check = tc_edp_atomic_check,
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
 	.mode_fixup = tc_bridge_mode_fixup,
-- 
2.35.1

