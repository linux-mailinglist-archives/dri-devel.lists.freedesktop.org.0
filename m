Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A5BEE48F0CF
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jan 2022 21:17:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1948A10E1C0;
	Fri, 14 Jan 2022 20:17:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6713E10E1C6
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 20:17:15 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id s15so3738742pfw.1
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jan 2022 12:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WzNR7uSNnSdg4hsXrt3ZJe57Rjz9RsU1uoLFUYgup5s=;
 b=CrBAAcV6rcqYR96Cru/pA8UOx2tnvMIIOfcqFcAownzSFPyuPgvkhzfxi/+POTmI6F
 s3dystHa98fH+SbgMv8XKpF0nN2hyQmJRb/usWgQVAeEMKkFbOl1RLbU6G0QKyJYa1cp
 atbPBFu4vpIdYe+oAsO4YZx7Pu3BhgN/ev32M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WzNR7uSNnSdg4hsXrt3ZJe57Rjz9RsU1uoLFUYgup5s=;
 b=io983H0Vc1QIRMATQ5W5ljFUxshbEgq4aDmcuDZCp5TAWQgtHoQ9pe+86BvdqmpoMl
 4CmBAvB+wszhstopDJ+IN7EKAnmSJz/daNKvsJWLHjCJhtFmLZjJjoc30WX7OX/gkip1
 Yo7e+edRZYBlzQs+nfazczPFLKMkcogsHXflyILTXUkazd/uNZdn8TdvcJd3Ps9lHdd2
 Ba/z4YWAIPmqgP6RHV0Wf3qOnokw1j7zwRqfpNkZosDbJ3Ef/NIW7cWHMNoRP4Y/BjGo
 fxPjd/0GKbmrVMCNbbgTIBgs/FvVHfjB+SWhjhKs2s5u9s6DnDhStAj0oiMCrvnYI34t
 qZ5w==
X-Gm-Message-State: AOAM531XIweyDlG3rOQZsoIRVTy9OyUH2TLiDmHT4M/8HDxLZT3R8Jd8
 yPN3dD6UT4cPy2XHxqpnE7tz0A==
X-Google-Smtp-Source: ABdhPJyHj22cXTGtfbh2J7pBTC9HY1zTyXX803MbP2uAPR8gM88DcF40tdq9nbUgQqifT6xthI1Ncw==
X-Received: by 2002:a63:4620:: with SMTP id t32mr3538422pga.531.1642191435052; 
 Fri, 14 Jan 2022 12:17:15 -0800 (PST)
Received: from localhost ([2620:15c:202:201:76ab:ede1:503d:1c39])
 by smtp.gmail.com with UTF8SMTPSA id p50sm5982690pfw.51.2022.01.14.12.17.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 12:17:14 -0800 (PST)
From: Brian Norris <briannorris@chromium.org>
To: Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 2/3] drm/rockchip: cdn-dp: Support HDMI codec plug-change
 callback
Date: Fri, 14 Jan 2022 12:16:51 -0800
Message-Id: <20220114121515.2.I20d754a1228aa5c51a18c8eb15a2c60dec25b639@changeid>
X-Mailer: git-send-email 2.34.1.703.g22d0c6ccf7-goog
In-Reply-To: <20220114201652.3875838-1-briannorris@chromium.org>
References: <20220114201652.3875838-1-briannorris@chromium.org>
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 Lin Huang <hl@rock-chips.com>, Brian Norris <briannorris@chromium.org>,
 Sandy Huang <hjc@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Some audio servers like to monitor a jack device (perhaps combined with
EDID, for audio-presence info) to determine DP/HDMI audio presence.

Signed-off-by: Brian Norris <briannorris@chromium.org>
---

 drivers/gpu/drm/rockchip/cdn-dp-core.c | 28 ++++++++++++++++++++++++++
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  4 ++++
 2 files changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index 16497c31d9f9..edd6a1fc46cd 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -586,6 +586,13 @@ static bool cdn_dp_check_link_status(struct cdn_dp_device *dp)
 	return drm_dp_channel_eq_ok(link_status, min(port->lanes, sink_lanes));
 }
 
+static void cdn_dp_audio_handle_plugged_change(struct cdn_dp_device *dp,
+					       bool plugged)
+{
+	if (dp->codec_dev)
+		dp->plugged_cb(dp->codec_dev, plugged);
+}
+
 static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 {
 	struct cdn_dp_device *dp = encoder_to_dp(encoder);
@@ -641,6 +648,9 @@ static void cdn_dp_encoder_enable(struct drm_encoder *encoder)
 		DRM_DEV_ERROR(dp->dev, "Failed to valid video %d\n", ret);
 		goto out;
 	}
+
+	cdn_dp_audio_handle_plugged_change(dp, true);
+
 out:
 	mutex_unlock(&dp->lock);
 }
@@ -651,6 +661,8 @@ static void cdn_dp_encoder_disable(struct drm_encoder *encoder)
 	int ret;
 
 	mutex_lock(&dp->lock);
+	cdn_dp_audio_handle_plugged_change(dp, false);
+
 	if (dp->active) {
 		ret = cdn_dp_disable(dp);
 		if (ret) {
@@ -846,11 +858,27 @@ static int cdn_dp_audio_get_eld(struct device *dev, void *data,
 	return 0;
 }
 
+static int cdn_dp_audio_hook_plugged_cb(struct device *dev, void *data,
+					hdmi_codec_plugged_cb fn,
+					struct device *codec_dev)
+{
+	struct cdn_dp_device *dp = dev_get_drvdata(dev);
+
+	mutex_lock(&dp->lock);
+	dp->plugged_cb = fn;
+	dp->codec_dev = codec_dev;
+	cdn_dp_audio_handle_plugged_change(dp, dp->connected);
+	mutex_unlock(&dp->lock);
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops audio_codec_ops = {
 	.hw_params = cdn_dp_audio_hw_params,
 	.audio_shutdown = cdn_dp_audio_shutdown,
 	.mute_stream = cdn_dp_audio_mute_stream,
 	.get_eld = cdn_dp_audio_get_eld,
+	.hook_plugged_cb = cdn_dp_audio_hook_plugged_cb,
 	.no_capture_mute = 1,
 };
 
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 81ac9b658a70..d808a9de45ed 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -10,6 +10,7 @@
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
+#include <sound/hdmi-codec.h>
 
 #include "rockchip_drm_drv.h"
 
@@ -101,5 +102,8 @@ struct cdn_dp_device {
 
 	u8 dpcd[DP_RECEIVER_CAP_SIZE];
 	bool sink_has_audio;
+
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
 };
 #endif  /* _CDN_DP_CORE_H */
-- 
2.34.1.703.g22d0c6ccf7-goog

