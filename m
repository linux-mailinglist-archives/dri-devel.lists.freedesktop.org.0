Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65A9E153FE2
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618C86F9EB;
	Thu,  6 Feb 2020 08:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x84a.google.com (mail-qt1-x84a.google.com
 [IPv6:2607:f8b0:4864:20::84a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 382806F9AE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Feb 2020 03:18:22 +0000 (UTC)
Received: by mail-qt1-x84a.google.com with SMTP id l1so2868315qtp.21
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 19:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=GKdSBpWKS5JubKvYHooQ1tsJLs+L1G4clF+7s5FbyHw=;
 b=naFzHNYgTkl6FjZpBOkCA2X/QrskO3Nyj3+Up6Q4sv70fhZlsQ9OfLbIfk1r0c13f4
 eZ7iIngf+0/feqrVf4l2k8moJ1SVAXQLPEgJmjMmLuiAAM62o0X1gRX7fFP7t6Mr4H36
 0+tUG3s5KDIURJ7Z1Rk1MINTJQ76nBZiKGmkjah2srKyBHJuv9h4O7MfxPvMBZK1fY6M
 wiMDH4EIJkavj55219XnSvbSenUmn+5oNJblgUzaI2YDjn6mPonp1jk3SsKy5ukJVDVO
 t+iWto0HpgeelkmDD2dNdvWDV9C80RAhjpVNvaLx92zuCH5OS92Vsn3t90c9w2TAruRG
 +bSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=GKdSBpWKS5JubKvYHooQ1tsJLs+L1G4clF+7s5FbyHw=;
 b=HEVGlTsWrLLNK+G+ke0rpBHNNs/T0rkhyBlV5KzjGF3qZZilcBTwqQtc4P64vQadjP
 q465R0/5PHfS/CVsTWfDpEy2xg+t1sj2E03Gcp9kpsIi+/dn44uLxLrne0/RCjJJ0Mr/
 XWSFn6kkYjwcqRLTbVYlo2XYzqJJ6s/LcC2XHnZiB53OMDG7xdNT29oy/XYZHUZemdy+
 jeQ500LjD/Tz2YToWYaYzm7dWzuqiBXfaM6+stQb5dxbVZGflvTT3bExP8ir0f/0Wjpb
 UM1R4hRtNMvxGs9tuU43qyWxNvS6YlSzTgOCItsFD8MD5TUkVjL1aS7/QbPv1GTQNimh
 WD+Q==
X-Gm-Message-State: APjAAAVxpl6hCyu3mgqpOVPs4Q82q8ARdKRMRG3Pcmj3o9fPkxr2XO2I
 tc3bxdXzAFcD3x9hhGXCVlKYcNoqhyb2
X-Google-Smtp-Source: APXvYqyJ0n0UFWdJRGiNBcfGeJ9XTuOgIvFLDSVvgEpiQSthosjpQX4dk4r4oRet+K8HdyV3vkafiTKoFhUX
X-Received: by 2002:a0c:ffc4:: with SMTP id h4mr662384qvv.233.1580959101083;
 Wed, 05 Feb 2020 19:18:21 -0800 (PST)
Date: Thu,  6 Feb 2020 11:17:51 +0800
In-Reply-To: <20200206031752.193298-1-tzungbi@google.com>
Message-Id: <20200206102509.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
Mime-Version: 1.0
References: <20200206031752.193298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH v2 2/3] drm/mediatek: support HDMI jack status reporting
From: Tzung-Bi Shih <tzungbi@google.com>
To: broonie@kernel.org, airlied@linux.ie, daniel@ffwll.ch
X-Mailman-Approved-At: Thu, 06 Feb 2020 08:17:51 +0000
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
Cc: alsa-devel@alsa-project.org, cychiang@google.com, tzungbi@google.com,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, dgreid@google.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

1.
Provides a callback (i.e. mtk_hdmi_audio_hook_plugged_cb) to hdmi-codec.
When ASoC machine driver calls hdmi_codec_set_jack_detect(), the
callback will be invoked to save plugged_cb and codec_dev parameters.

+---------+  set_jack_  +------------+ plugged_cb  +----------+
| machine | ----------> | hdmi-codec | ----------> | mtk-hdmi |
+---------+  detect()   +------------+ codec_dev   +----------+

2.
When there is any jack status changes, mtk-hdmi will call the
plugged_cb() to notify hdmi-codec.  And then hdmi-codec will call
snd_soc_jack_report().

+----------+ plugged_cb  +------------+
| mtk-hdmi | ----------> | hdmi-codec | -> snd_soc_jack_report()
+----------+ codec_dev   +------------+
             connector_status

Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 34 ++++++++++++++++++++++++++---
 1 file changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 23c2b0e8693d..fccdd975947d 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -169,6 +169,8 @@ struct mtk_hdmi {
 	bool audio_enable;
 	bool powered;
 	bool enabled;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
 };
 
 static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
@@ -1194,13 +1196,23 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
 }
 
+static enum drm_connector_status
+mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
+{
+	bool connected = mtk_cec_hpd_high(hdmi->cec_dev);
+
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev, connected);
+
+	return connected ?
+	       connector_status_connected : connector_status_disconnected;
+}
+
 static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
 						  bool force)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
-
-	return mtk_cec_hpd_high(hdmi->cec_dev) ?
-	       connector_status_connected : connector_status_disconnected;
+	return mtk_hdmi_update_plugged_status(hdmi);
 }
 
 static void hdmi_conn_destroy(struct drm_connector *conn)
@@ -1648,20 +1660,36 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 	return 0;
 }
 
+static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
+					  hdmi_codec_plugged_cb fn,
+					  struct device *codec_dev)
+{
+	struct mtk_hdmi *hdmi = data;
+
+	hdmi->plugged_cb = fn;
+	hdmi->codec_dev = codec_dev;
+	mtk_hdmi_update_plugged_status(hdmi);
+
+	return 0;
+}
+
 static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.hw_params = mtk_hdmi_audio_hw_params,
 	.audio_startup = mtk_hdmi_audio_startup,
 	.audio_shutdown = mtk_hdmi_audio_shutdown,
 	.digital_mute = mtk_hdmi_audio_digital_mute,
 	.get_eld = mtk_hdmi_audio_get_eld,
+	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
 };
 
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
 		.i2s = 1,
+		.data = hdmi,
 	};
 	struct platform_device *pdev;
 
-- 
2.25.0.341.g760bfbb309-goog

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
