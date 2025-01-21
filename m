Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F043A179AE
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 09:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA5710E145;
	Tue, 21 Jan 2025 08:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="e6+Rx7F6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 975AD10E145
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 08:59:05 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 4E57E5C4B8B;
 Tue, 21 Jan 2025 08:58:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 677BFC4CEE1;
 Tue, 21 Jan 2025 08:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1737449944;
 bh=ZKtlqcztY7Hpd/Vh+Gr4qJVD0t32A5Jl+0O19+x+bUY=;
 h=From:Date:Subject:To:Cc:Reply-To:From;
 b=e6+Rx7F6U41mc3MzIvN553otKG9LXKV6aOi4qojl1bVJYtNS930ta5ST23bJ7ZFvC
 mQ9kBcxCvJqwDbnErW4jjW6BvsTrP2Zx1s99+SNnElQlTP6qEAvDhh4KaX703KUXbm
 lFZpFz1RXhev7QPYaFyfDNPULZvNViVyhh/ZcXNA1H+l8ZauoY/QOi5yfEhn+EiGIv
 Xt7+Pz7OVh8bov7cZPhmO5CuFX7Xdy2PQ8WfQk90gwgqUbuTiCjnYtRpmG8haYj+I9
 9J97gvQ2AE7trA+nBZ7xNmE6aKSfwV68nGuBkTy809jt7JsRF7eXZYq1wU4cyR5KU1
 3y6r+SxfbXcXQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org
 (localhost.localdomain [127.0.0.1])
 by smtp.lore.kernel.org (Postfix) with ESMTP id 52A7FC02185;
 Tue, 21 Jan 2025 08:59:04 +0000 (UTC)
From: Hermes Wu via B4 Relay <devnull+Hermes.wu.ite.com.tw@kernel.org>
Date: Tue, 21 Jan 2025 16:59:22 +0800
Subject: [PATCH] drm/bridge: it6505: support hdmi_codec_ops for audio
 stream setup
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250121-add-audio-codec-v1-1-e3ff71b3c819@ite.com.tw>
X-B4-Tracking: v=1; b=H4sIAOlhj2cC/x3MPQqAMAxA4atIZgNtqb9XEYeSRM1ipUURxLtbH
 L/hvQeyJJUMY/VAkkuzxr3A1hXQFvZVULkYnHGNsdZjYMZwskakyELY08C+M60LLUGpjiSL3v9
 xmt/3A0PP2gphAAAA
X-Change-ID: 20250114-add-audio-codec-8c9d47062a6c
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737449969; l=3823;
 i=Hermes.wu@ite.com.tw; s=20241230; h=from:subject:message-id;
 bh=o/uOLwDi0jNIFs2+m/4EDSQBoFNMPYbT+UZqOKKtS8Y=;
 b=6m907IQVQsjUNfZLPRY4w8LQ0JC3NzzPoQAIL98YyXMSxeNjz9uWiT/79KmBn++gM4faLGfUr
 O3xiRHZ8HhwB/x7rm/BjlVkwXzEOWyiA9nScJSRR+1oLaGEMVc3QVnN
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

IT6505 supports audio form I2S to DP audio data sub stream

Support audio codec operation include
hw_params, audio_startup, audio_shutdown, hook_plugged_cb.

In order to prevent pop noise from sink devise, delay audio by
after I2S signal is enable by source.

Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
---
 drivers/gpu/drm/bridge/ite-it6505.c | 67 ++++++++++++++++++++++++++++++++++---
 1 file changed, 62 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
index 88ef76a37fe6accacdd343839ff2569b31b18ceb..9dc58d307dae360ffab5df15e8fe8420d084c764 100644
--- a/drivers/gpu/drm/bridge/ite-it6505.c
+++ b/drivers/gpu/drm/bridge/ite-it6505.c
@@ -3095,18 +3095,39 @@ static int __maybe_unused it6505_audio_setup_hw_params(struct it6505 *it6505,
 	return 0;
 }
 
-static void __maybe_unused it6505_audio_shutdown(struct device *dev, void *data)
+static void it6505_audio_shutdown(struct device *dev, void *data)
 {
 	struct it6505 *it6505 = dev_get_drvdata(dev);
 
+	cancel_delayed_work_sync(&it6505->delayed_audio);
+
 	if (it6505->powered)
 		it6505_disable_audio(it6505);
 }
 
-static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
-						       void *data,
-						       hdmi_codec_plugged_cb fn,
-						       struct device *codec_dev)
+static int it6505_audio_hw_params(struct device *dev,
+				  void *data,
+				  struct hdmi_codec_daifmt *daifmt,
+				  struct hdmi_codec_params *params)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	return it6505_audio_setup_hw_params(it6505, params);
+}
+
+static int it6505_audio_startup(struct device *dev, void *data)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+
+	queue_delayed_work(system_wq, &it6505->delayed_audio,
+			   msecs_to_jiffies(180));
+	return 0;
+}
+
+static int it6505_audio_hook_plugged_cb(struct device *dev,
+					void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
 {
 	struct it6505 *it6505 = data;
 
@@ -3117,6 +3138,36 @@ static int __maybe_unused it6505_audio_hook_plugged_cb(struct device *dev,
 	return 0;
 }
 
+static const struct hdmi_codec_ops it6505_audio_codec_ops = {
+	.hw_params = it6505_audio_hw_params,
+	.audio_startup = it6505_audio_startup,
+	.audio_shutdown = it6505_audio_shutdown,
+	.hook_plugged_cb = it6505_audio_hook_plugged_cb,
+};
+
+static int it6505_register_audio_driver(struct device *dev)
+{
+	struct it6505 *it6505 = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &it6505_audio_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = it6505,
+	};
+	struct platform_device *pdev;
+
+	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
+					     PLATFORM_DEVID_AUTO, &codec_data,
+					     sizeof(codec_data));
+	if (IS_ERR(pdev))
+		return PTR_ERR(pdev);
+
+	INIT_DELAYED_WORK(&it6505->delayed_audio, it6505_delayed_audio);
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+
+	return 0;
+}
+
 static inline struct it6505 *bridge_to_it6505(struct drm_bridge *bridge)
 {
 	return container_of(bridge, struct it6505, bridge);
@@ -3677,6 +3728,12 @@ static int it6505_i2c_probe(struct i2c_client *client)
 		return err;
 	}
 
+	err = it6505_register_audio_driver(dev);
+	if (err < 0) {
+		dev_err(dev, "Failed to register audio driver: %d", err);
+		return err;
+	}
+
 	INIT_WORK(&it6505->link_works, it6505_link_training_work);
 	INIT_WORK(&it6505->hdcp_wait_ksv_list, it6505_hdcp_wait_ksv_list);
 	INIT_DELAYED_WORK(&it6505->hdcp_work, it6505_hdcp_work);

---
base-commit: fe003bcb69f7bff9ff2b30b659b004dbafe52907
change-id: 20250114-add-audio-codec-8c9d47062a6c

Best regards,
-- 
Hermes Wu <Hermes.wu@ite.com.tw>


