Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7126A059BD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 12:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D1A110EB9A;
	Wed,  8 Jan 2025 11:29:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="C51dj+Vg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B2910EB9A
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Jan 2025 11:29:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736335713;
 bh=q5GaH7cXP5oXFqTHRfcZX5XakVx1t07qmKY1REFce6k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=C51dj+Vg8k4vK4OgzYW13kgdxlXDw03iLn4bIGHmYlK6frwuerF7Z7f6v3YJU1+gB
 j7ipyC0ugQdIF43J+QR+t23NzSGDnRRZDtmcN9fdqt2raa/OB2sji8tWEGZ2R8vceI
 PysFrO2Y2wlKi5FkuH0hcSJ8v/J9WfNff3d0GhWbz2nqWFMqf1mvYZuajOF6mgeIfl
 PcIm5/lwXLlMAzwzD1qEKEIwxmRcQKCwmscekluaJlgdbOASzmgYv+LmEhAiKFbYeu
 unCetogG66DH0EjjE0hHAa46n05siETSlB3VjTQsqJLfHsUW7ibwunsscV07y9QbKf
 bkuaMJAJf5LRQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 2625D17E1555;
 Wed,  8 Jan 2025 12:28:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, jie.qiu@mediatek.com,
 junzhi.zhao@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, dmitry.baryshkov@linaro.org, lewis.liao@mediatek.com,
 ives.chenjh@mediatek.com, tommyyl.chen@mediatek.com,
 jason-jh.lin@mediatek.com
Subject: [PATCH v4 23/34] drm/mediatek: mtk_hdmi: Move output init to
 mtk_hdmi_register_audio_driver()
Date: Wed,  8 Jan 2025 12:27:33 +0100
Message-ID: <20250108112744.64686-24-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
References: <20250108112744.64686-1-angelogioacchino.delregno@collabora.com>
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

In preparation for moving the common bits of this driver, merge the
contents of mtk_hdmi_output_init in mtk_hdmi_register_audio_driver
function to aggregate all of the initial audio setup together in
the same function and to make it clear that all of the setup that
is performed in mtk_hdmi_output_init is specifically related only
to audio and not video.

While at it, also remove the "%s driver bound to HDMI" debugging
print disguised as informative.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_hdmi.c | 28 ++++++++--------------------
 1 file changed, 8 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 970392a094e0..cc75f9caabc5 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -1025,20 +1025,6 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
-{
-	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
-
-	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
-	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
-	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
-	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
-
-	return 0;
-}
-
 static void mtk_hdmi_audio_enable(struct mtk_hdmi *hdmi)
 {
 	mtk_hdmi_hw_send_aud_packet(hdmi, true);
@@ -1617,6 +1603,7 @@ static void mtk_hdmi_unregister_audio_driver(void *data)
 static int mtk_hdmi_register_audio_driver(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 	struct hdmi_codec_pdata codec_data = {
 		.ops = &mtk_hdmi_audio_codec_ops,
 		.max_i2s_channels = 2,
@@ -1625,6 +1612,13 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	};
 	int ret;
 
+	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
+	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
+	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+
 	hdmi->audio_pdev = platform_device_register_data(dev,
 							 HDMI_CODEC_DRV_NAME,
 							 PLATFORM_DEVID_AUTO,
@@ -1638,7 +1632,6 @@ static int mtk_hdmi_register_audio_driver(struct device *dev)
 	if (ret)
 		return ret;
 
-	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
 	return 0;
 }
 
@@ -1667,11 +1660,6 @@ static int mtk_hdmi_probe(struct platform_device *pdev)
 	mutex_init(&hdmi->update_plugged_status_lock);
 	platform_set_drvdata(pdev, hdmi);
 
-	ret = mtk_hdmi_output_init(hdmi);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize hdmi output\n");
-
 	ret = mtk_hdmi_register_audio_driver(dev);
 	if (ret)
 		return dev_err_probe(dev, ret,
-- 
2.47.0

