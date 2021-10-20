Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F4843528A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 20:19:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 596D56E4F3;
	Wed, 20 Oct 2021 18:19:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFCE06E8F8
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Oct 2021 18:19:20 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 44dc8572-31d2-11ec-ac3c-0050568cd888;
 Wed, 20 Oct 2021 18:19:30 +0000 (UTC)
Received: from saturn.localdomain (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id E73F2194B6F;
 Wed, 20 Oct 2021 20:19:17 +0200 (CEST)
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Philip Chen <philipchen@chromium.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Robert Foss <robert.foss@linaro.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Andrzej Hajda <a.hajda@samsung.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Subject: [PATCH v2 4/7] drm/bridge: lontium-lt9611: Use atomic variants of
 drm_bridge_funcs
Date: Wed, 20 Oct 2021 20:18:58 +0200
Message-Id: <20211020181901.2114645-5-sam@ravnborg.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211020181901.2114645-1-sam@ravnborg.org>
References: <20211020181901.2114645-1-sam@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The atomic variants of enable/disable in drm_bridge_funcs are the
preferred operations - introduce these.

Use of mode_set is deprecated - merge the functionality with
atomic_enable()

v2:
  - Added check if crtc_state is NULL (Maxime)
  - Updated to use drm_atomic_get_new_crtc_for_bridge()

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Andrzej Hajda <a.hajda@samsung.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/bridge/lontium-lt9611.c | 75 +++++++++++--------------
 1 file changed, 33 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt9611.c b/drivers/gpu/drm/bridge/lontium-lt9611.c
index 29b1ce2140ab..cdc3d5f8dcac 100644
--- a/drivers/gpu/drm/bridge/lontium-lt9611.c
+++ b/drivers/gpu/drm/bridge/lontium-lt9611.c
@@ -700,9 +700,23 @@ lt9611_connector_mode_valid(struct drm_connector *connector,
 }
 
 /* bridge funcs */
-static void lt9611_bridge_enable(struct drm_bridge *bridge)
+static void lt9611_bridge_atomic_enable(struct drm_bridge *bridge,
+					struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
+	const struct drm_display_mode *mode;
+	const struct drm_crtc_state *crtc_state;
+	struct hdmi_avi_infoframe avi_frame;
+	int ret;
+
+	crtc_state = drm_atomic_get_new_crtc_for_bridge(old_bridge_state->base.state,
+							bridge);
+	if (!crtc_state) {
+		dev_err(lt9611->dev, "no crtc_state available\n");
+		return;
+	}
+
+	mode = &crtc_state->mode;
 
 	if (lt9611_power_on(lt9611)) {
 		dev_err(lt9611->dev, "power on failed\n");
@@ -719,9 +733,21 @@ static void lt9611_bridge_enable(struct drm_bridge *bridge)
 
 	/* Enable HDMI output */
 	regmap_write(lt9611->regmap, 0x8130, 0xea);
+
+	lt9611_mipi_input_digital(lt9611, mode);
+	lt9611_pll_setup(lt9611, mode);
+	lt9611_mipi_video_setup(lt9611, mode);
+	lt9611_pcr_setup(lt9611, mode);
+
+	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
+						       &lt9611->connector,
+						       mode);
+	if (!ret)
+		lt9611->vic = avi_frame.video_code;
 }
 
-static void lt9611_bridge_disable(struct drm_bridge *bridge)
+static void lt9611_bridge_atomic_disable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 	int ret;
@@ -877,48 +903,14 @@ static enum drm_mode_status lt9611_bridge_mode_valid(struct drm_bridge *bridge,
 		return MODE_OK;
 }
 
-static void lt9611_bridge_pre_enable(struct drm_bridge *bridge)
-{
-	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-
-	if (!lt9611->sleep)
-		return;
-
-	lt9611_reset(lt9611);
-	regmap_write(lt9611->regmap, 0x80ee, 0x01);
-
-	lt9611->sleep = false;
-}
-
-static void lt9611_bridge_post_disable(struct drm_bridge *bridge)
+static void lt9611_bridge_atomic_post_disable(struct drm_bridge *bridge,
+					      struct drm_bridge_state *old_bridge_state)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
 
 	lt9611_sleep_setup(lt9611);
 }
 
-static void lt9611_bridge_mode_set(struct drm_bridge *bridge,
-				   const struct drm_display_mode *mode,
-				   const struct drm_display_mode *adj_mode)
-{
-	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
-	struct hdmi_avi_infoframe avi_frame;
-	int ret;
-
-	lt9611_bridge_pre_enable(bridge);
-
-	lt9611_mipi_input_digital(lt9611, mode);
-	lt9611_pll_setup(lt9611, mode);
-	lt9611_mipi_video_setup(lt9611, mode);
-	lt9611_pcr_setup(lt9611, mode);
-
-	ret = drm_hdmi_avi_infoframe_from_display_mode(&avi_frame,
-						       &lt9611->connector,
-						       mode);
-	if (!ret)
-		lt9611->vic = avi_frame.video_code;
-}
-
 static enum drm_connector_status lt9611_bridge_detect(struct drm_bridge *bridge)
 {
 	struct lt9611 *lt9611 = bridge_to_lt9611(bridge);
@@ -954,10 +946,9 @@ static const struct drm_bridge_funcs lt9611_bridge_funcs = {
 	.attach = lt9611_bridge_attach,
 	.detach = lt9611_bridge_detach,
 	.mode_valid = lt9611_bridge_mode_valid,
-	.enable = lt9611_bridge_enable,
-	.disable = lt9611_bridge_disable,
-	.post_disable = lt9611_bridge_post_disable,
-	.mode_set = lt9611_bridge_mode_set,
+	.atomic_enable = lt9611_bridge_atomic_enable,
+	.atomic_disable = lt9611_bridge_atomic_disable,
+	.atomic_post_disable = lt9611_bridge_atomic_post_disable,
 	.detect = lt9611_bridge_detect,
 	.get_edid = lt9611_bridge_get_edid,
 	.hpd_enable = lt9611_bridge_hpd_enable,
-- 
2.30.2

