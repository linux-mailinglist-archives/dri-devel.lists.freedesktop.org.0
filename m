Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A95A248E30A
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 04:49:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D52F210EB73;
	Fri, 14 Jan 2022 03:49:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de
 [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3EFA10E9B0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 03:48:59 +0000 (UTC)
Received: from tr.lan (ip-89-176-112-137.net.upcbroadband.cz [89.176.112.137])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id 1EB12832E3;
 Fri, 14 Jan 2022 04:48:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1642132138;
 bh=mWCcy1cMwuWQSR9h6bGOVjg0YrbkV7CNSAxPFSMWUOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rb0OMRLP1qwJDFXkkeZ5sfdRuq7muY+MsSsW5J/j6mJxZcbjNw5mJGVEL0z4T2gBz
 2Ywjm2XMGuA3rBMozEYOqbBHjArhyxtYuS0Gx5HcGX5tMtO/99UAtegEPwbSwyW0lY
 gZnt0Q77H34QluNzCaHSSVNvHulZBwzYPZU80rEzztHmtFXmhXLKkgvLoiFhTjNggR
 4+JczfGlTzwK+tapAw8QQnhERe+Bj4FwB3lfeu+Zl7Rjlh+IandfqHE4egkc9Ahthc
 30YaAggbXE5F+1do9AFT5yfilHJFkvg0M56iVrtE8ZEAG9r2A0lfE4OzPMmCIWPet0
 nmkOlYBWB7BWA==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/14] drm: bridge: icn6211: Retrieve the display mode from
 the state
Date: Fri, 14 Jan 2022 04:48:29 +0100
Message-Id: <20220114034838.546267-5-marex@denx.de>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220114034838.546267-1-marex@denx.de>
References: <20220114034838.546267-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
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
Cc: Marek Vasut <marex@denx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sam Ravnborg <sam@ravnborg.org>, Jagan Teki <jagan@amarulasolutions.com>,
 Robert Foss <robert.foss@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Retrieve display mode structure from panel or atomic state in
bridge_to_mode(). This completes the transition to the atomic
API.

Signed-off-by: Marek Vasut <marex@denx.de>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
To: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/bridge/chipone-icn6211.c | 26 +++++++++++++++++++++---
 1 file changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chipone-icn6211.c b/drivers/gpu/drm/bridge/chipone-icn6211.c
index 14d28e7356aaa..d6db1e77b5a35 100644
--- a/drivers/gpu/drm/bridge/chipone-icn6211.c
+++ b/drivers/gpu/drm/bridge/chipone-icn6211.c
@@ -146,9 +146,28 @@ static inline struct chipone *bridge_to_chipone(struct drm_bridge *bridge)
 	return container_of(bridge, struct chipone, bridge);
 }
 
-static struct drm_display_mode *bridge_to_mode(struct drm_bridge *bridge)
+static const struct drm_display_mode *
+bridge_to_mode(struct drm_bridge *bridge, struct drm_atomic_state *state)
 {
-	return &bridge->encoder->crtc->state->adjusted_mode;
+	const struct drm_crtc_state *crtc_state;
+	struct drm_connector *connector;
+	struct drm_crtc *crtc;
+
+	/* Try to retrieve panel mode first. */
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	if (!list_empty(&connector->modes)) {
+		return list_first_entry(&connector->modes,
+					struct drm_display_mode, head);
+	}
+
+	/*
+	 * Retrieve the CRTC adjusted mode. This requires a little dance to go
+	 * from the bridge to the encoder, to the connector and to the CRTC.
+	 */
+	crtc = drm_atomic_get_new_connector_state(state, connector)->crtc;
+	crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
+	return &crtc_state->adjusted_mode;
 }
 
 static inline int chipone_dsi_write(struct chipone *icn,  const void *seq,
@@ -169,7 +188,8 @@ static void chipone_atomic_enable(struct drm_bridge *bridge,
 				  struct drm_bridge_state *old_bridge_state)
 {
 	struct chipone *icn = bridge_to_chipone(bridge);
-	struct drm_display_mode *mode = bridge_to_mode(bridge);
+	struct drm_atomic_state *state = old_bridge_state->base.state;
+	const struct drm_display_mode *mode = bridge_to_mode(bridge, state);
 	u16 hfp, hbp, hsync;
 
 	ICN6211_DSI(icn, MIPI_CFG_PW, MIPI_CFG_PW_CONFIG_DSI);
-- 
2.34.1

