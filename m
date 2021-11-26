Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A5345F1B7
	for <lists+dri-devel@lfdr.de>; Fri, 26 Nov 2021 17:20:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F3916F978;
	Fri, 26 Nov 2021 16:20:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5146F910
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 16:19:56 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id b40so25473416lfv.10
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Nov 2021 08:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kfCGGQxmJYAAbJN5Gn/Us5aT7XWQ41BpqEskSKXA+Zs=;
 b=Ipmb1hI9I3LqLAc4llsJHl8SJTx2kQzibPyGtPfp1/Y9A/sitqwO0RqDuE0gjNdEt3
 U+0W0ViUB2CPahHhsK7KVNGns9Z8jt/FYPP0cjQvn7dESQqWi8Va5Jh+Xj2mRBnUVKwR
 pRQEQzuQ8hKBJKybPue8TReT5JYIrhAPmynoIiwTZ+JveVEZUIGW5lBjK8kOYondYiDw
 xijCIdN89JkFulH9e1AcfdEmuQrrXBL/9XuwXmQZiqhE1opM0tGGrE7TF/sEFlGbqbYj
 uyQ+CnQ78FVMhmhDoYi9TRW2C0gJ1OaFAeO/r4E/ouHa+q8N83UA48cPvgwYAMIhkMvS
 vSlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kfCGGQxmJYAAbJN5Gn/Us5aT7XWQ41BpqEskSKXA+Zs=;
 b=vDA7aYz0GTNPWFK3IAI2zjO9gM+60lnPOAdJGLbQ/I5cFYBYJ6nizwmChzuQvEKugP
 pOFZAPL7AZWXH7mqwXjUDYic5LHKXVOmY98WGY10Q1iOKvja3RfIbQPU3igh7Km1dRp0
 iefkXE2hRCqJp+TJsD5RP4I34Kys+Hh+pcAcZ41hz1e4hLTvbUdze1qBVwSaK/iACDxT
 aEKx7iAsxk2KdHpQH9PmLAbjnEvFlXhUeXKcD05nnUDXC+KUPVyx3t2qhJvu/jLO951l
 ivirav+hiQ/YlMD49jdl417YaVD/GGfjBpUaZomUYq9WPZWBu8dFxcDqkuYQbDP1vKsW
 zdIw==
X-Gm-Message-State: AOAM532A8qywE8OMXfgogW4mczxqSbkStxd/Bcz6ZO7Ys4af3fMyCtz1
 jn1TUtBgaos9hMglmYuA8vE=
X-Google-Smtp-Source: ABdhPJyJGEksZUgkHKxVYIKdv5rjrh2hlfjVuxNe0IU+N7eMkjjTtROdMS/3zbsAC58jieHxUE6U6A==
X-Received: by 2002:ac2:5607:: with SMTP id v7mr30465207lfd.71.1637943595108; 
 Fri, 26 Nov 2021 08:19:55 -0800 (PST)
Received: from localhost.localdomain (94-29-48-99.dynamic.spd-mgts.ru.
 [94.29.48.99])
 by smtp.gmail.com with ESMTPSA id t7sm613381lfl.260.2021.11.26.08.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Nov 2021 08:19:54 -0800 (PST)
From: Dmitry Osipenko <digetx@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>, Mark Brown <broonie@kernel.org>,
 Takashi Iwai <tiwai@suse.com>, Jaroslav Kysela <perex@perex.cz>,
 Liam Girdwood <lgirdwood@gmail.com>, Agneli <poczt@protonmail.ch>,
 Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 15/20] drm/tegra: hdmi: Register audio CODEC on Tegra20
Date: Fri, 26 Nov 2021 19:18:02 +0300
Message-Id: <20211126161807.15776-16-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211126161807.15776-1-digetx@gmail.com>
References: <20211126161807.15776-1-digetx@gmail.com>
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
 Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Tegra20 SoC supports only S/PDIF source for HDMI audio. Register ASoC HDMI
S/PDIF CODEC for Tegra20, it will be linked with the S/PDIF CPU DAI.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/gpu/drm/tegra/Kconfig |   3 +
 drivers/gpu/drm/tegra/hdmi.c  | 153 +++++++++++++++++++++++++++++++---
 2 files changed, 145 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tegra/Kconfig b/drivers/gpu/drm/tegra/Kconfig
index 32fe64553d2e..40f0d14cb240 100644
--- a/drivers/gpu/drm/tegra/Kconfig
+++ b/drivers/gpu/drm/tegra/Kconfig
@@ -13,6 +13,9 @@ config DRM_TEGRA_ORIG
 	select INTERCONNECT
 	select IOMMU_IOVA
 	select CEC_CORE if CEC_NOTIFIER
+	select SND_SIMPLE_CARD if SND_SOC_TEGRA20_SPDIF
+	select SND_SOC_HDMI_CODEC if SND_SOC_TEGRA20_SPDIF
+	select SND_AUDIO_GRAPH_CARD if SND_SOC_TEGRA20_SPDIF
 	help
 	  Choose this option if you have an NVIDIA Tegra SoC.
 
diff --git a/drivers/gpu/drm/tegra/hdmi.c b/drivers/gpu/drm/tegra/hdmi.c
index 142ad696426f..a99861f95e89 100644
--- a/drivers/gpu/drm/tegra/hdmi.c
+++ b/drivers/gpu/drm/tegra/hdmi.c
@@ -18,6 +18,8 @@
 
 #include <soc/tegra/common.h>
 
+#include <sound/hdmi-codec.h>
+
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_debugfs.h>
@@ -81,6 +83,9 @@ struct tegra_hdmi {
 	bool dvi;
 
 	struct drm_info_list *debugfs_files;
+
+	struct platform_device *audio_pdev;
+	struct mutex audio_lock;
 };
 
 static inline struct tegra_hdmi *
@@ -363,6 +368,18 @@ static const struct tmds_config tegra124_tmds_config[] = {
 	},
 };
 
+static void tegra_hdmi_audio_lock(struct tegra_hdmi *hdmi)
+{
+	mutex_lock(&hdmi->audio_lock);
+	disable_irq(hdmi->irq);
+}
+
+static void tegra_hdmi_audio_unlock(struct tegra_hdmi *hdmi)
+{
+	enable_irq(hdmi->irq);
+	mutex_unlock(&hdmi->audio_lock);
+}
+
 static int
 tegra_hdmi_get_audio_config(unsigned int audio_freq, unsigned int pix_clock,
 			    struct tegra_hdmi_audio_config *config)
@@ -832,6 +849,23 @@ static void tegra_hdmi_setup_tmds(struct tegra_hdmi *hdmi,
 				  HDMI_NV_PDISP_SOR_IO_PEAK_CURRENT);
 }
 
+static int tegra_hdmi_reconfigure_audio(struct tegra_hdmi *hdmi)
+{
+	int err;
+
+	err = tegra_hdmi_setup_audio(hdmi);
+	if (err < 0) {
+		tegra_hdmi_disable_audio_infoframe(hdmi);
+		tegra_hdmi_disable_audio(hdmi);
+	} else {
+		tegra_hdmi_setup_audio_infoframe(hdmi);
+		tegra_hdmi_enable_audio_infoframe(hdmi);
+		tegra_hdmi_enable_audio(hdmi);
+	}
+
+	return err;
+}
+
 static bool tegra_output_is_hdmi(struct tegra_output *output)
 {
 	struct edid *edid;
@@ -1138,6 +1172,8 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
 	u32 value;
 	int err;
 
+	tegra_hdmi_audio_lock(hdmi);
+
 	/*
 	 * The following accesses registers of the display controller, so make
 	 * sure it's only executed when the output is attached to one.
@@ -1162,6 +1198,10 @@ static void tegra_hdmi_encoder_disable(struct drm_encoder *encoder)
 	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_ENABLE);
 	tegra_hdmi_writel(hdmi, 0, HDMI_NV_PDISP_INT_MASK);
 
+	hdmi->pixel_clock = 0;
+
+	tegra_hdmi_audio_unlock(hdmi);
+
 	err = host1x_client_suspend(&hdmi->client);
 	if (err < 0)
 		dev_err(hdmi->dev, "failed to suspend: %d\n", err);
@@ -1185,6 +1225,8 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 		return;
 	}
 
+	tegra_hdmi_audio_lock(hdmi);
+
 	/*
 	 * Enable and unmask the HDA codec SCRATCH0 register interrupt. This
 	 * is used for interoperability between the HDA codec driver and the
@@ -1390,6 +1432,8 @@ static void tegra_hdmi_encoder_enable(struct drm_encoder *encoder)
 	}
 
 	/* TODO: add HDCP support */
+
+	tegra_hdmi_audio_unlock(hdmi);
 }
 
 static int
@@ -1419,6 +1463,91 @@ static const struct drm_encoder_helper_funcs tegra_hdmi_encoder_helper_funcs = {
 	.atomic_check = tegra_hdmi_encoder_atomic_check,
 };
 
+static int tegra_hdmi_hw_params(struct device *dev, void *data,
+				struct hdmi_codec_daifmt *fmt,
+				struct hdmi_codec_params *hparms)
+{
+	struct tegra_hdmi *hdmi = data;
+	int ret = 0;
+
+	tegra_hdmi_audio_lock(hdmi);
+
+	hdmi->format.sample_rate = hparms->sample_rate;
+	hdmi->format.channels = hparms->channels;
+
+	if (hdmi->pixel_clock && !hdmi->dvi)
+		ret = tegra_hdmi_reconfigure_audio(hdmi);
+
+	tegra_hdmi_audio_unlock(hdmi);
+
+	return ret;
+}
+
+static int tegra_hdmi_audio_startup(struct device *dev, void *data)
+{
+	struct tegra_hdmi *hdmi = data;
+	int ret;
+
+	ret = host1x_client_resume(&hdmi->client);
+	if (ret < 0)
+		dev_err(hdmi->dev, "failed to resume: %d\n", ret);
+
+	return ret;
+}
+
+static void tegra_hdmi_audio_shutdown(struct device *dev, void *data)
+{
+	struct tegra_hdmi *hdmi = data;
+	int ret;
+
+	tegra_hdmi_audio_lock(hdmi);
+
+	hdmi->format.sample_rate = 0;
+	hdmi->format.channels = 0;
+
+	tegra_hdmi_audio_unlock(hdmi);
+
+	ret = host1x_client_suspend(&hdmi->client);
+	if (ret < 0)
+		dev_err(hdmi->dev, "failed to suspend: %d\n", ret);
+}
+
+static const struct hdmi_codec_ops tegra_hdmi_codec_ops = {
+	.hw_params = tegra_hdmi_hw_params,
+	.audio_startup = tegra_hdmi_audio_startup,
+	.audio_shutdown = tegra_hdmi_audio_shutdown,
+};
+
+static int tegra_hdmi_codec_register(struct tegra_hdmi *hdmi)
+{
+	struct hdmi_codec_pdata codec_data = {};
+
+	if (hdmi->config->has_hda)
+		return 0;
+
+	codec_data.ops = &tegra_hdmi_codec_ops;
+	codec_data.data = hdmi;
+	codec_data.spdif = 1;
+
+	hdmi->audio_pdev = platform_device_register_data(hdmi->dev,
+							 HDMI_CODEC_DRV_NAME,
+							 PLATFORM_DEVID_AUTO,
+							 &codec_data,
+							 sizeof(codec_data));
+	if (IS_ERR(hdmi->audio_pdev))
+		return PTR_ERR(hdmi->audio_pdev);
+
+	hdmi->format.channels = 2;
+
+	return 0;
+}
+
+static void tegra_hdmi_codec_unregister(struct tegra_hdmi *hdmi)
+{
+	if (hdmi->audio_pdev)
+		platform_device_unregister(hdmi->audio_pdev);
+}
+
 static int tegra_hdmi_init(struct host1x_client *client)
 {
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
@@ -1471,8 +1600,16 @@ static int tegra_hdmi_init(struct host1x_client *client)
 		goto disable_pll;
 	}
 
+	err = tegra_hdmi_codec_register(hdmi);
+	if (err < 0) {
+		dev_err(hdmi->dev, "failed to register audio codec: %d\n", err);
+		goto disable_vdd;
+	}
+
 	return 0;
 
+disable_vdd:
+	regulator_disable(hdmi->vdd);
 disable_pll:
 	regulator_disable(hdmi->pll);
 disable_hdmi:
@@ -1487,6 +1624,8 @@ static int tegra_hdmi_exit(struct host1x_client *client)
 {
 	struct tegra_hdmi *hdmi = host1x_client_to_hdmi(client);
 
+	tegra_hdmi_codec_unregister(hdmi);
+
 	tegra_output_exit(&hdmi->output);
 
 	regulator_disable(hdmi->vdd);
@@ -1611,7 +1750,6 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 {
 	struct tegra_hdmi *hdmi = data;
 	u32 value;
-	int err;
 
 	value = tegra_hdmi_readl(hdmi, HDMI_NV_PDISP_INT_STATUS);
 	tegra_hdmi_writel(hdmi, value, HDMI_NV_PDISP_INT_STATUS);
@@ -1626,16 +1764,7 @@ static irqreturn_t tegra_hdmi_irq(int irq, void *data)
 			format = value & SOR_AUDIO_HDA_CODEC_SCRATCH0_FMT_MASK;
 
 			tegra_hda_parse_format(format, &hdmi->format);
-
-			err = tegra_hdmi_setup_audio(hdmi);
-			if (err < 0) {
-				tegra_hdmi_disable_audio_infoframe(hdmi);
-				tegra_hdmi_disable_audio(hdmi);
-			} else {
-				tegra_hdmi_setup_audio_infoframe(hdmi);
-				tegra_hdmi_enable_audio_infoframe(hdmi);
-				tegra_hdmi_enable_audio(hdmi);
-			}
+			tegra_hdmi_reconfigure_audio(hdmi);
 		} else {
 			tegra_hdmi_disable_audio_infoframe(hdmi);
 			tegra_hdmi_disable_audio(hdmi);
@@ -1663,6 +1792,8 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
 	hdmi->stereo = false;
 	hdmi->dvi = false;
 
+	mutex_init(&hdmi->audio_lock);
+
 	hdmi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (IS_ERR(hdmi->clk)) {
 		dev_err(&pdev->dev, "failed to get clock\n");
-- 
2.33.1

