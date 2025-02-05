Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22276A2848F
	for <lists+dri-devel@lfdr.de>; Wed,  5 Feb 2025 07:40:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296D910E73B;
	Wed,  5 Feb 2025 06:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="TIQSSz97";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0921F10E73D
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2025 06:40:35 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 452025C118E;
 Wed,  5 Feb 2025 06:39:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7467CC4CEE6;
 Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738737634;
 bh=h4uoZiDaDCnjp4xbn++cw3iPpGRIxoOC4t2uGuV8Lr8=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
 b=TIQSSz97U8yWHdkz4Ovgfc11YSHdnxE+u8jlcx/5Bygf3DqvyTsI/dT1k1OP+tvZv
 7ybCmiFfkz/xgIEQu+YQY4dsSY8FutA9ExDuJcLtXRbO31gAJr1fZxHqIr+Cdb3x2T
 slPZ70SI06vxCP6nCqSAB/b+bWsuy0cmyNzW7pEjKwixws2U7njQ5I3urkmUj56bfS
 IvXUXIEYDNvO9e4Hp8IIz4jACe9Eis1m0zEqh4EFJeSKlgPWZ7AEpYz2ZdJi7O8208
 W0pE9d8RUIjGTpgN7lQSvcLe+yJ+VpOLxDWSO9TDXE4Vhjmuj7ajcBqrl+R9sz/kHi
 6hXMZ4EtmLOng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 61866C02199;
 Wed,  5 Feb 2025 06:40:34 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Wed, 05 Feb 2025 14:41:04 +0800
Subject: [PATCH v3 2/2] drm/bridge: it6505: add audio support to
 drm_bridge_funcs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250205-add-audio-codec-v3-2-26cfadb2d81f@ite.com.tw>
References: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
In-Reply-To: <20250205-add-audio-codec-v3-0-26cfadb2d81f@ite.com.tw>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: treapking@chromium.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, 
 Hermes Wu <Hermes.wu@ite.com.tw>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738737663; l=2998;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=ALqN5ab0u4x0omcwFuCJ35/u/+RI1mf1aEJhjK4tFQs=;
 b=oSN8pAg0gEhe90kCJmKSJhBKKMKU0FbNorw4tsyh+YfjvjrGj/tgUFTW92DavYy8DbTeqw1+8
 VkjM8QF1HRtBtw4mXS+aLQPsRrC5C4F+7z2KDJw6LVunN7+TDl/C7SW
X-Developer-Key: i=Hermes.wu@ite.com.tw; a=ed25519;
 pk=qho5Dawp2WWj9CGyjtJ6/Y10xH8odjRdS6SXDaDAerU=
X-Endpoint-Received: by B4 Relay for Hermes.wu@ite.com.tw/20241230 with
 auth_id=310
X-Original-From: Hermes Wu <Hermes.wu@ite.com.tw>
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
Reply-To: Hermes.wu@ite.com.tw
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Hermes Wu <Hermes.wu@ite.com.tw>

For supporting audio form I2S to DP audio data sub stream.
Add hdmi_audio callbacks to drm_bridge_funcs for the HDMI codec
framework.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 46 +++++++++++++++++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 4c766854de14093b80949bdb410488f504b24db8..832c4e3ff4ada31367788faed9583da676e36cf8 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3342,6 +3342,46 @@ it6505_bridge_hdmi_tmds_char_rate_valid(const struct drm_bridge *bridge,
 	return MODE_OK;
 }
 
+static int it6505_bridge_hdmi_audio_startup(struct drm_connector *connector,
+					    struct drm_bridge *bridge)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	struct device *dev = it6505->dev;
+
+	if (!it6505->powered || it6505->enable_drv_hold)
+		return -EIO;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "Audio enable");
+	it6505_enable_audio(it6505);
+
+	return 0;
+}
+
+static int it6505_bridge_hdmi_audio_prepare(struct drm_connector *connector,
+					    struct drm_bridge *bridge,
+					    struct hdmi_codec_daifmt *fmt,
+					    struct hdmi_codec_params *hparms)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+	int err;
+
+	err = it6505_audio_setup_hw_params(it6505, hparms);
+	if (err < 0)
+		return err;
+
+	return drm_atomic_helper_connector_hdmi_update_audio_infoframe(connector,
+								       &hparms->cea);
+}
+
+static void it6505_bridge_hdmi_audio_shutdown(struct drm_connector *connector,
+					      struct drm_bridge *bridge)
+{
+	struct it6505 *it6505 = bridge_to_it6505(bridge);
+
+	if (it6505->powered && !it6505->enable_drv_hold)
+		it6505_disable_audio(it6505);
+}
+
 static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -3358,6 +3398,9 @@ static const struct drm_bridge_funcs it6505_bridge_funcs = {
 	.hdmi_clear_infoframe = it6505_bridge_hdmi_clear_infoframe,
 	.hdmi_write_infoframe = it6505_bridge_hdmi_write_infoframe,
 	.hdmi_tmds_char_rate_valid = it6505_bridge_hdmi_tmds_char_rate_valid,
+	.hdmi_audio_startup = it6505_bridge_hdmi_audio_startup,
+	.hdmi_audio_prepare = it6505_bridge_hdmi_audio_prepare,
+	.hdmi_audio_shutdown = it6505_bridge_hdmi_audio_shutdown,
 };
 
 static __maybe_unused int it6505_bridge_resume(struct device *dev)
@@ -3746,6 +3789,9 @@ static int it6505_i2c_probe(struct i2c_client *client)
 			     DRM_BRIDGE_OP_HPD | DRM_BRIDGE_OP_HDMI;
 	it6505->bridge.vendor = "iTE";
 	it6505->bridge.product = "IT6505";
+	it6505->bridge.hdmi_audio_dev = dev;
+	it6505->bridge.hdmi_audio_max_i2s_playback_channels = 2;
+	it6505->bridge.hdmi_audio_dai_port = 1;
 	drm_bridge_add(&it6505->bridge);
 
 	return 0;

-- 
2.34.1


