Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B0A0C9167D2
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 14:29:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79D9310E042;
	Tue, 25 Jun 2024 12:29:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=denx.de header.i=@denx.de header.b="oGtniYh/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E033310E023
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 12:28:53 +0000 (UTC)
Received: from tr.lan (ip-86-49-120-218.bb.vodafone.cz [86.49.120.218])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: marex@denx.de)
 by phobos.denx.de (Postfix) with ESMTPSA id B9CE2884AC;
 Tue, 25 Jun 2024 14:28:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
 s=phobos-20191101; t=1719318532;
 bh=F6nfKiQiWkE4KWp+x9b0p6eAIbIAcRpgkxEnHcGwJHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=oGtniYh/T5tOMumKil9/ND2yeceI+pCdUxJRf235+f4Kbf44s0T1roaNScCtHUC8t
 EMGVLm3g8xWDT/W0wJg8TUqbjCHNIjra6mhm2SpTn24fnk9OBrwQJY05ltc4CK8EVT
 WtUhw7j73PCzjtL6sKOs4DbNk1othRG2keZRKjQkZovlYsSts993MC4vtiFZxT+t4m
 TfJDhPxGDsBQEoh57YEvTlKElGGZW7nr03A8xmJWu9MP7TC9x/5An8Y3NLAlVFBJCk
 4UKWYmmjhygPXvb4MrlW1ClBTznLg6qy5TG2B0tmPuc0DYl8+FLRa3UX8Xq2nfobHm
 FLS32PozvGs6Q==
From: Marek Vasut <marex@denx.de>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@denx.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 Adam Ford <aford173@gmail.com>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Inki Dae <inki.dae@samsung.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Maxime Ripard <mripard@kernel.org>, Michael Walle <mwalle@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, kernel@dh-electronics.com
Subject: [PATCH v2 2/2] drm/bridge: tc358767: Reset chip again on attach
Date: Tue, 25 Jun 2024 14:26:11 +0200
Message-ID: <20240625122824.148163-2-marex@denx.de>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240625122824.148163-1-marex@denx.de>
References: <20240625122824.148163-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In case the chip is released from reset using the RESX signal while the
DSI lanes are in non-LP11 mode, the chip may enter some sort of debug
mode, where its internal clock run at 1/6th of expected clock rate. In
this mode, the AUX channel also operates at 1/6th of the 10 MHz mandated
by DP specification, which breaks DPCD communication.

There is no known software way of bringing the chip out of this state
once the chip enters it, except for toggling the RESX signal and
performing full reset.

The chip may enter this mode when the chip was released from reset in
probe(), because at that point the DSI lane mode is undefined.

When the .attach callback is called, the DSI link is surely in LP11 mode.
Toggle the RESX signal here and reconfigure the AUX channel. That way,
the AUX channel communication from this point on does surely run at
10 MHz as it should.

Reviewed-by: Alexander Stein <alexander.stein@ew.tq-group.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Adam Ford <aford173@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@gmail.com>
Cc: Frieder Schrempf <frieder.schrempf@kontron.de>
Cc: Inki Dae <inki.dae@samsung.com>
Cc: Jagan Teki <jagan@amarulasolutions.com>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Michael Walle <mwalle@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: kernel@dh-electronics.com
---
V2: Add RB from Alexander
---
 drivers/gpu/drm/bridge/tc358767.c | 50 +++++++++++++++++++++++++++++++
 1 file changed, 50 insertions(+)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 6bda26ca6b917..7d8797b3d8579 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1749,10 +1749,30 @@ static const struct drm_connector_funcs tc_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static void tc_bridge_reset(struct tc_data *tc)
+{
+	if (!tc->reset_gpio)
+		return;
+
+	gpiod_set_value_cansleep(tc->reset_gpio, 0);
+	usleep_range(10000, 11000);
+	gpiod_set_value_cansleep(tc->reset_gpio, 1);
+	usleep_range(5000, 10000);
+}
+
 static int tc_dpi_bridge_attach(struct drm_bridge *bridge,
 				enum drm_bridge_attach_flags flags)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
+	int ret;
+
+	if (tc->reset_gpio) {
+		tc_bridge_reset(tc);
+
+		ret = tc_set_syspllparam(tc);
+		if (ret)
+			return ret;
+	}
 
 	if (!tc->panel_bridge)
 		return 0;
@@ -1769,6 +1789,36 @@ static int tc_edp_bridge_attach(struct drm_bridge *bridge,
 	struct drm_device *drm = bridge->dev;
 	int ret;
 
+	if (tc->reset_gpio) {
+		/*
+		 * In case the chip is released from reset using the RESX
+		 * signal while the DSI lanes are in non-LP11 mode, the chip
+		 * may enter some sort of debug mode, where its internal
+		 * clock run at 1/6th of expected clock rate. In this mode,
+		 * the AUX channel also operates at 1/6th of the 10 MHz
+		 * mandated by DP specification, which breaks DPCD
+		 * communication.
+		 *
+		 * There is no known software way of bringing the chip out of
+		 * this state once the chip enters it, except for toggling
+		 * the RESX signal and performing full reset.
+		 *
+		 * The chip may enter this mode when the chip was released
+		 * from reset in probe(), because at that point the DSI lane
+		 * mode is undefined.
+		 *
+		 * At this point, the DSI link is surely in LP11 mode. Toggle
+		 * the RESX signal here and reconfigure the AUX channel. That
+		 * way, the AUX channel communication from this point on does
+		 * surely run at 10 MHz as it should.
+		 */
+		tc_bridge_reset(tc);
+
+		ret = tc_aux_link_setup(tc);
+		if (ret)
+			return ret;
+	}
+
 	if (tc->panel_bridge) {
 		/* If a connector is required then this driver shall create it */
 		ret = drm_bridge_attach(tc->bridge.encoder, tc->panel_bridge,
-- 
2.43.0

