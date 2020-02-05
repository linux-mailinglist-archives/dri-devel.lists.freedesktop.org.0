Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A78B7153FED
	for <lists+dri-devel@lfdr.de>; Thu,  6 Feb 2020 09:18:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6B326F9FF;
	Thu,  6 Feb 2020 08:17:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qk1-x749.google.com (mail-qk1-x749.google.com
 [IPv6:2607:f8b0:4864:20::749])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091EB6F4F8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Feb 2020 09:38:12 +0000 (UTC)
Received: by mail-qk1-x749.google.com with SMTP id f22so885497qka.10
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Feb 2020 01:38:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=cX29gQ3Pe2nYNSmOPNFjk0KmvqrTptDWTP83/iCAsdA=;
 b=ixbOIq8maNz1diHMn2lwgN76Wks4PKPS2JD5s1qhsxg+f4Lw0HcqZx/CFcJ9zvGF4J
 LdRZO6zI4PrghmZbrzhz9Pbwie595/SdQzw5i15qqaE+duNoGAAqdtlsNeC6JHyhuEIZ
 wY/1FPuOwOsaQX0vF2Mfr2OBuD+Bo41BB4mt/scYJFiZO46DLSj63t3xkl6x4wvV0mlR
 eALP5NYK254rYDixapJgUG0dE8WxxHbbwmH81ICXVqOr03qEWAbgmbb0Vima2BWBTg3c
 tknLYkEmLkGeT7M35AhA0k5pSX9LfGwnO3rPNRi2+iDmLmtm7GOpv+gWKnrTdCr6XaVk
 1Ogg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=cX29gQ3Pe2nYNSmOPNFjk0KmvqrTptDWTP83/iCAsdA=;
 b=CM9a0NMwVoUu1A7JNpQSury5okHf4Iim78/XtTeR2qgdddn7fFhqzuIaznR54UI5F+
 mN5gLc8Em8O6CqJyPLlzQt0I6Q6Y9c9fVKEMKHEO5P6UrgfA1Euacj2Kp71CsR03Floq
 i0rbD8FpjOp93VYT4ifLEIT92cQ/Txy+edFDe5l6wid1aUzjYxwS+Bs6Uj4fnGfrneAj
 QNm9BDR0/0jeM9yRACD3q89depUMMiW0TBxJZOPsTPxH0BMKKVe+QfCyyvReYj+AddPC
 hmeO5pfd8GCCFGQLKvOo1WKNVrKJ8MU1SOKh+6WoM1nDhopf2o1JIFfreFbKm+v8fF9H
 TDgw==
X-Gm-Message-State: APjAAAVSXjbOU5BGBfmfaQQd0XAh8u0D2w+CBLVuUYWkWP69M21mnlCE
 +MYcZBMITGhC8Vi1kWxFHSkyVf1f5zOM
X-Google-Smtp-Source: APXvYqzvqZ+I6q7rsrnsbANQ2Td41uSXPBSKwBl8ZrPWLMClutzjKDkU8rsrWO96kwNDsFR8NBUJJAomYVqM
X-Received: by 2002:a0c:fe0d:: with SMTP id x13mr31660627qvr.88.1580895491114; 
 Wed, 05 Feb 2020 01:38:11 -0800 (PST)
Date: Wed,  5 Feb 2020 17:37:44 +0800
In-Reply-To: <20200205093745.79298-1-tzungbi@google.com>
Message-Id: <20200205170416.2.I230fd59de28e73934a91cb01424e25b9e84727f4@changeid>
Mime-Version: 1.0
References: <20200205093745.79298-1-tzungbi@google.com>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
Subject: [PATCH 2/3] drm/mediatek: support HDMI jack status reporting
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 41 +++++++++++++++++++++++++++--
 1 file changed, 39 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 23c2b0e8693d..15736ed0a96a 100644
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
@@ -1194,13 +1196,27 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
 }
 
+static void mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi,
+					   enum drm_connector_status status)
+{
+	if (hdmi->plugged_cb && hdmi->codec_dev)
+		hdmi->plugged_cb(hdmi->codec_dev,
+				 status == connector_status_connected);
+}
+
 static enum drm_connector_status hdmi_conn_detect(struct drm_connector *conn,
 						  bool force)
 {
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_conn(conn);
+	enum drm_connector_status status;
 
-	return mtk_cec_hpd_high(hdmi->cec_dev) ?
-	       connector_status_connected : connector_status_disconnected;
+	if (mtk_cec_hpd_high(hdmi->cec_dev))
+		status = connector_status_connected;
+	else
+		status = connector_status_disconnected;
+
+	mtk_hdmi_update_plugged_status(hdmi, status);
+	return status;
 }
 
 static void hdmi_conn_destroy(struct drm_connector *conn)
@@ -1648,20 +1664,41 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
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
+
+	if (mtk_cec_hpd_high(hdmi->cec_dev))
+		mtk_hdmi_update_plugged_status(
+				hdmi, connector_status_connected);
+	else
+		mtk_hdmi_update_plugged_status(
+				hdmi, connector_status_disconnected);
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
