Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7488B60E4EC
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 17:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBB0410E587;
	Wed, 26 Oct 2022 15:36:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2A110E57A
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Oct 2022 15:36:18 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id E04148506D;
 Wed, 26 Oct 2022 17:36:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1666798577;
 bh=9qoYmupISd93qvSG2w4/mvWIPasPCnmEAPTxTIr1jYw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qKTMJNva+RGoMKMJNaifJ97sfpq/eRwZFkwPP2X9AIwRiCf9Y6RIlLXJ+NZBcp0Zz
 70kqDmiI0Nxb3HtGtpWiGDJL16PB4UckdWLgbKRUjc1ZJMIdgkfNcvDiR7DCvkRwb3
 zStPqpl8N773T3C2RSSu+v1+6dDV0vinuu6uF+YgJydf7AqIkLkwwKl5FnlunOpFJV
 11lvKjuTLFklW6/Qmv1BM2jR09KaNHM1ZA7vlwx+OBHnURTWk0nv38yVcaodBzY31c
 eI0Wgddii0F/L3t9R6PfcqUOY2Lbn5oRMLq6vKEhslaZ5IgjQi4Hz8UvYv3chM5S0h
 zNxIh8z0Ac7xQ==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm: bridge: samsung-dsim: Select DSI HS clock rate from
 downstream bridge limits
Date: Wed, 26 Oct 2022 17:35:59 +0200
Message-Id: <20221026153559.387041-3-marex@denx.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221026153559.387041-1-marex@denx.de>
References: <20221026153559.387041-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.6 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Sam Ravnborg <sam@ravnborg.org>, Maxime Ripard <maxime@cerno.tech>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the downstream bridge state reports DSI HS clock minimum and
maximum limits, find the most suitable DSI HS clock rate and use it
for the DSI link.

Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 34 +++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index 9623923036292..697329d0faa35 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1399,7 +1399,41 @@ static int samsung_dsim_atomic_check(struct drm_bridge *bridge,
 {
 	struct samsung_dsim *dsi = bridge_to_dsi(bridge);
 	struct drm_display_mode *adjusted_mode = &crtc_state->adjusted_mode;
+	struct drm_bridge *next_bridge = drm_bridge_get_next_bridge(bridge);
+	struct drm_bridge_state *next_bridge_state;
 
+	/* This DSIM bridge can produce HS clock in range of 12..750 MHz */
+	bridge_state->hs_rate_min = 12000;
+	bridge_state->hs_rate_max = 750000;
+
+	if (next_bridge) {
+		next_bridge_state = drm_atomic_get_new_bridge_state(crtc_state->state,
+								    next_bridge);
+		/*
+		 * This bridge ability to provide HS clock does not overlap
+		 * with next bridge HS clock requirements, link constraints
+		 * are not met and link can not be operational.
+		 */
+		if (bridge_state->hs_rate_max < next_bridge_state->hs_rate_min ||
+		    bridge_state->hs_rate_min > next_bridge_state->hs_rate_max)
+			goto exit;
+
+		/*
+		 * In case the nearest bridge specifies DSI HS clock rate
+		 * and supports DSI burst mode, run the DSI link at highest
+		 * supported DSI HS clock frequency to achieve the shortest
+		 * transfer bursts, longest time in LP mode between bursts,
+		 * and thus most power efficient transfer.
+		 *
+		 * Note that DSI HS clock lane frequency is
+		 * DSIM PLL output / 2 .
+		 */
+		dsi->burst_clk_rate = min(bridge_state->hs_rate_max,
+					  next_bridge_state->hs_rate_max) *
+				      2 * 1000;
+	}
+
+exit:
 	/*
 	 * The i.MX8M Mini/Nano glue logic between LCDIF and DSIM
 	 * inverts HS/VS/DE sync signals polarity, therefore, while
-- 
2.35.1

