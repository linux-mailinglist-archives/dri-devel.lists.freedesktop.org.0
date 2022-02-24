Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABBB4C3662
	for <lists+dri-devel@lfdr.de>; Thu, 24 Feb 2022 20:59:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C2F310E3C6;
	Thu, 24 Feb 2022 19:59:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BCDD10E2A7
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Feb 2022 19:58:54 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 7B7CC83CD6;
 Thu, 24 Feb 2022 20:58:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1645732732;
 bh=Xvsk03LR7//NzuOEvPz2HgAShsxh1uK15yKs/p0HZMI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Oh23PyPC+sUZ5WF0+apEt+TuRTNqHh1Kcr030NjrHGsOrwEQxX2Bt3wd201fBFlp5
 q2MlQa6pXwhe4sUPuWr6Q9crsJE+IYA1c1zik5ReKBNKdX0G5OpBvJTVgM3UOgZZlg
 R7LKmiiZT7a+oW9WvwuknnXrlA8bXZtgq+2lUCXqEKcMM55zamjZHvy1q9ZcSlsOzC
 fU/jBnkunAz6FfUQfX2MXp6Z6oM0btY40l/XFccZ9fb1yyh4kE4kN9JvGzaClM5gnN
 gVTtfYjSQLiEYjxrn1gvZhgZpQJdq7U0pD4ll8jwngdkenztr1Vnl9Ori2skuN9vqd
 45kRhxL7CW+ZA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH V3 05/12] drm/bridge: tc358767: Implement atomic_check callback
Date: Thu, 24 Feb 2022 20:58:10 +0100
Message-Id: <20220224195817.68504-6-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220224195817.68504-1-marex@denx.de>
References: <20220224195817.68504-1-marex@denx.de>
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

Implement .atomic_check callback which prevents user space from setting
unsupported mode. The tc_edp_common_atomic_check() variant is already
prepared for DSI-to-DPI mode addition, which has different frequency
limits.

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
---
 drivers/gpu/drm/bridge/tc358767.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index f88d8e616f7f8..e95153d9c1499 100644
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
2.34.1

