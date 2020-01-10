Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8127A138665
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2020 13:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950356E524;
	Sun, 12 Jan 2020 12:36:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [IPv6:2001:470:0:1f2::b869:4820])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D7D86EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 14:12:13 +0000 (UTC)
Received: from localhost.localdomain ([94.155.250.134])
 by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Jan 2020 06:12:04 -0800
From: Stefan Mavrodiev <stefan@olimex.com>
To: Dan Williams <dan.j.williams@intel.com>, Vinod Koul <vkoul@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list),
 dmaengine@vger.kernel.org (open list:DMA GENERIC OFFLOAD ENGINE SUBSYSTEM),
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Allwinner sunXi SoC
 support), 
 dri-devel@lists.freedesktop.org (open list:DRM DRIVERS FOR ALLWINNER A10)
Subject: [PATCH 2/2] drm: sun4i: hdmi: Add support for sun4i HDMI encoder audio
Date: Fri, 10 Jan 2020 16:11:40 +0200
Message-Id: <20200110141140.28527-3-stefan@olimex.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200110141140.28527-1-stefan@olimex.com>
References: <20200110141140.28527-1-stefan@olimex.com>
X-Mailman-Approved-At: Sun, 12 Jan 2020 12:36:09 +0000
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
Cc: linux-sunxi@googlegroups.com, Stefan Mavrodiev <stefan@olimex.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add HDMI audio support for the sun4i-hdmi encoder, used on
the older Allwinner chips - A10, A20, A31.

Most of the code is based on the BSP implementation. In it
dditional formats are supported (S20_3LE and S24_LE), however
there where some problems with them and only S16_LE is left.

Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
---
 drivers/gpu/drm/sun4i/Kconfig            |   1 +
 drivers/gpu/drm/sun4i/Makefile           |   1 +
 drivers/gpu/drm/sun4i/sun4i_hdmi.h       |  30 ++
 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c | 375 +++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c   |   4 +
 5 files changed, 411 insertions(+)
 create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c

diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
index 37e90e42943f..192b732b10cd 100644
--- a/drivers/gpu/drm/sun4i/Kconfig
+++ b/drivers/gpu/drm/sun4i/Kconfig
@@ -19,6 +19,7 @@ if DRM_SUN4I
 config DRM_SUN4I_HDMI
        tristate "Allwinner A10 HDMI Controller Support"
        default DRM_SUN4I
+       select SND_PCM_ELD
        help
 	  Choose this option if you have an Allwinner SoC with an HDMI
 	  controller.
diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
index 0d04f2447b01..e2d82b451c36 100644
--- a/drivers/gpu/drm/sun4i/Makefile
+++ b/drivers/gpu/drm/sun4i/Makefile
@@ -5,6 +5,7 @@ sun4i-frontend-y		+= sun4i_frontend.o
 sun4i-drm-y			+= sun4i_drv.o
 sun4i-drm-y			+= sun4i_framebuffer.o
 
+sun4i-drm-hdmi-y		+= sun4i_hdmi_audio.o
 sun4i-drm-hdmi-y		+= sun4i_hdmi_ddc_clk.o
 sun4i-drm-hdmi-y		+= sun4i_hdmi_enc.o
 sun4i-drm-hdmi-y		+= sun4i_hdmi_i2c.o
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
index 7ad3f06c127e..456964e681b0 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
@@ -42,7 +42,32 @@
 #define SUN4I_HDMI_VID_TIMING_POL_VSYNC		BIT(1)
 #define SUN4I_HDMI_VID_TIMING_POL_HSYNC		BIT(0)
 
+#define SUN4I_HDMI_AUDIO_CTRL_REG	0x040
+#define SUN4I_HDMI_AUDIO_CTRL_ENABLE		BIT(31)
+#define SUN4I_HDMI_AUDIO_CTRL_RESET		BIT(30)
+
+#define SUN4I_HDMI_AUDIO_FMT_REG	0x048
+#define SUN4I_HDMI_AUDIO_FMT_SRC		BIT(31)
+#define SUN4I_HDMI_AUDIO_FMT_LAYOUT		BIT(3)
+#define SUN4I_HDMI_AUDIO_FMT_CH_CFG(n)		(n - 1)
+#define SUN4I_HDMI_AUDIO_FMT_CH_CFG_MASK	GENMASK(2, 0)
+
+#define SUN4I_HDMI_AUDIO_PCM_REG	0x4c
+#define SUN4I_HDMI_AUDIO_PCM_CH_MAP(n, m)	((m - 1) << (n * 4))
+#define SUN4I_HDMI_AUDIO_PCM_CH_MAP_MASK(n)	(GENMASK(2, 0) << (n * 4))
+
+#define SUN4I_HDMI_AUDIO_CTS_REG	0x050
+#define SUN4I_HDMI_AUDIO_CTS(n)			(n & GENMASK(19, 0))
+
+#define SUN4I_HDMI_AUDIO_N_REG		0x054
+#define SUN4I_HDMI_AUDIO_N(n)			(n & GENMASK(19, 0))
+
+#define SUN4I_HDMI_AUDIO_STAT0_REG	0x58
+#define SUN4I_HDMI_AUDIO_STAT0_FREQ(n)		(n << 24)
+#define SUN4I_HDMI_AUDIO_STAT0_FREQ_MASK	GENMASK(27, 24)
+
 #define SUN4I_HDMI_AVI_INFOFRAME_REG(n)	(0x080 + (n))
+#define SUN4I_HDMI_AUDIO_INFOFRAME_REG(n)	(0x0a0 + (n))
 
 #define SUN4I_HDMI_PAD_CTRL0_REG	0x200
 #define SUN4I_HDMI_PAD_CTRL0_BIASEN		BIT(31)
@@ -283,9 +308,13 @@ struct sun4i_hdmi {
 	struct regmap_field	*field_ddc_sda_en;
 	struct regmap_field	*field_ddc_sck_en;
 
+	u8			hdmi_audio_channels;
+
 	struct sun4i_drv	*drv;
 
 	bool			hdmi_monitor;
+	bool			hdmi_audio;
+
 	struct cec_adapter	*cec_adap;
 
 	const struct sun4i_hdmi_variant	*variant;
@@ -294,5 +323,6 @@ struct sun4i_hdmi {
 int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
 int sun4i_tmds_create(struct sun4i_hdmi *hdmi);
 int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi);
+int sun4i_hdmi_audio_create(struct sun4i_hdmi *hdmi);
 
 #endif /* _SUN4I_HDMI_H_ */
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
new file mode 100644
index 000000000000..b6d4199d15ce
--- /dev/null
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
@@ -0,0 +1,375 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2020 Olimex Ltd.
+ *   Author: Stefan Mavrodiev <stefan@olimex.com>
+ */
+#include <linux/dma-mapping.h>
+#include <linux/dmaengine.h>
+#include <linux/module.h>
+#include <linux/of_dma.h>
+#include <linux/regmap.h>
+
+#include <drm/drm_print.h>
+
+#include <sound/dmaengine_pcm.h>
+#include <sound/pcm_drm_eld.h>
+#include <sound/pcm_params.h>
+#include <sound/soc.h>
+
+#include "sun4i_hdmi.h"
+
+static const struct snd_soc_dapm_widget sun4i_hdmi_audio_widgets[] = {
+	SND_SOC_DAPM_OUTPUT("TX"),
+};
+
+static const struct snd_soc_dapm_route sun4i_hdmi_audio_routes[] = {
+	{ "TX", NULL, "Playback" },
+};
+
+static const struct snd_soc_component_driver sun4i_hdmi_audio_component = {
+	.dapm_widgets		= sun4i_hdmi_audio_widgets,
+	.num_dapm_widgets	= ARRAY_SIZE(sun4i_hdmi_audio_widgets),
+	.dapm_routes		= sun4i_hdmi_audio_routes,
+	.num_dapm_routes	= ARRAY_SIZE(sun4i_hdmi_audio_routes),
+};
+
+static int sun4i_hdmi_audio_startup(struct snd_pcm_substream *substream,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
+	struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
+	u32 reg;
+	int ret;
+
+	regmap_write(hdmi->regmap, SUN4I_HDMI_AUDIO_CTRL_REG, 0);
+	regmap_write(hdmi->regmap,
+		     SUN4I_HDMI_AUDIO_CTRL_REG,
+		     SUN4I_HDMI_AUDIO_CTRL_RESET);
+	ret = regmap_read_poll_timeout(hdmi->regmap,
+				       SUN4I_HDMI_AUDIO_CTRL_REG,
+				       reg, !reg, 100, 50000);
+	if (ret < 0) {
+		DRM_ERROR("Failed to reset HDMI Audio\n");
+		return ret;
+	}
+
+	regmap_write(hdmi->regmap,
+		     SUN4I_HDMI_AUDIO_CTRL_REG,
+		     SUN4I_HDMI_AUDIO_CTRL_ENABLE);
+
+	return snd_pcm_hw_constraint_eld(substream->runtime,
+					 hdmi->connector.eld);
+}
+
+static void sun4i_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
+	struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
+
+	regmap_write(hdmi->regmap, SUN4I_HDMI_AUDIO_CTRL_REG, 0);
+}
+
+static int sun4i_hdmi_setup_audio_infoframes(struct sun4i_hdmi *hdmi)
+{
+	union hdmi_infoframe frame;
+	u8 buffer[14];
+	int i, ret;
+
+	ret = hdmi_audio_infoframe_init(&frame.audio);
+	if (ret < 0) {
+		DRM_ERROR("Failed to init HDMI audio infoframe\n");
+		return ret;
+	}
+
+	frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
+	frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
+	frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
+	frame.audio.channels = hdmi->hdmi_audio_channels;
+
+	ret = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
+	if (ret < 0) {
+		DRM_ERROR("Failed to pack HDMI audio infoframe\n");
+		return ret;
+	}
+
+	for (i = 0; i < sizeof(buffer); i++)
+		writeb(buffer[i],
+		       hdmi->base + SUN4I_HDMI_AUDIO_INFOFRAME_REG(i));
+
+	return 0;
+}
+
+static void sun4i_hdmi_audio_set_cts_n(struct sun4i_hdmi *hdmi,
+				       struct snd_pcm_hw_params *params)
+{
+	struct drm_encoder *encoder = &hdmi->encoder;
+	struct drm_crtc *crtc = encoder->crtc;
+	const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
+	u32 rate = params_rate(params);
+	u32 n, cts;
+	u64 tmp;
+
+	/**
+	 * Calculate Cycle Time Stamp (CTS) and Numerator (N):
+	 *
+	 * N = 128 * Samplerate / 1000
+	 * CTS = (Ftdms * N) / (128 * Samplerate)
+	 */
+
+	n = 128 * rate / 1000;
+	tmp = (u64)(mode->clock * 1000) * n;
+	do_div(tmp, 128 * rate);
+	cts = tmp;
+
+	regmap_write(hdmi->regmap,
+		     SUN4I_HDMI_AUDIO_CTS_REG,
+		     SUN4I_HDMI_AUDIO_CTS(cts));
+
+	regmap_write(hdmi->regmap,
+		     SUN4I_HDMI_AUDIO_N_REG,
+		     SUN4I_HDMI_AUDIO_N(n));
+}
+
+static int sun4i_hdmi_audio_set_hw_rate(struct sun4i_hdmi *hdmi,
+					struct snd_pcm_hw_params *params)
+{
+	u32 rate = params_rate(params);
+	u32 val;
+
+	switch (rate) {
+	case 44100:
+		val = 0x0;
+		break;
+	case 48000:
+		val = 0x2;
+		break;
+	case 32000:
+		val = 0x3;
+		break;
+	case 88200:
+		val = 0x8;
+		break;
+	case 96000:
+		val = 0x9;
+		break;
+	case 176400:
+		val = 0xc;
+		break;
+	case 192000:
+		val = 0xe;
+		break;
+	default:
+		return -EINVAL;
+	}
+
+	regmap_update_bits(hdmi->regmap,
+			   SUN4I_HDMI_AUDIO_STAT0_REG,
+			   SUN4I_HDMI_AUDIO_STAT0_FREQ_MASK,
+			   SUN4I_HDMI_AUDIO_STAT0_FREQ(val));
+
+	return 0;
+}
+
+static int sun4i_hdmi_audio_set_hw_channels(struct sun4i_hdmi *hdmi,
+					    struct snd_pcm_hw_params *params)
+{
+	u32 channels = params_channels(params);
+
+	if (channels > 8)
+		return -EINVAL;
+
+	hdmi->hdmi_audio_channels = channels;
+
+	regmap_update_bits(hdmi->regmap,
+			   SUN4I_HDMI_AUDIO_FMT_REG,
+			   SUN4I_HDMI_AUDIO_FMT_LAYOUT,
+			   (channels > 2) ? SUN4I_HDMI_AUDIO_FMT_LAYOUT : 0);
+
+	regmap_update_bits(hdmi->regmap,
+			   SUN4I_HDMI_AUDIO_FMT_REG,
+			   SUN4I_HDMI_AUDIO_FMT_CH_CFG_MASK,
+			   SUN4I_HDMI_AUDIO_FMT_CH_CFG(channels));
+
+	regmap_write(hdmi->regmap, SUN4I_HDMI_AUDIO_PCM_REG, 0x76543210);
+
+	/**
+	 * If only one channel is required, send the same sample
+	 * to the sink device as a left and right channel.
+	 */
+	if (channels == 1)
+		regmap_update_bits(hdmi->regmap,
+				   SUN4I_HDMI_AUDIO_PCM_REG,
+				   SUN4I_HDMI_AUDIO_PCM_CH_MAP_MASK(1),
+				   SUN4I_HDMI_AUDIO_PCM_CH_MAP(1, 1));
+
+	return 0;
+}
+
+static int sun4i_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
+				      struct snd_pcm_hw_params *params,
+				      struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
+	struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
+	int ret;
+
+	ret = sun4i_hdmi_audio_set_hw_rate(hdmi, params);
+	if (ret)
+		return ret;
+
+	ret = sun4i_hdmi_audio_set_hw_channels(hdmi, params);
+	if (ret)
+		return ret;
+
+	sun4i_hdmi_audio_set_cts_n(hdmi, params);
+
+	return 0;
+}
+
+static int sun4i_hdmi_audio_trigger(struct snd_pcm_substream *substream,
+				    int cmd,
+				    struct snd_soc_dai *dai)
+{
+	struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
+	struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
+	int ret = 0;
+
+	switch (cmd) {
+	case SNDRV_PCM_TRIGGER_START:
+		ret = sun4i_hdmi_setup_audio_infoframes(hdmi);
+		break;
+	default:
+		break;
+	}
+
+	return ret;
+}
+
+static const struct snd_soc_dai_ops sun4i_hdmi_audio_dai_ops = {
+	.startup = sun4i_hdmi_audio_startup,
+	.shutdown = sun4i_hdmi_audio_shutdown,
+	.hw_params = sun4i_hdmi_audio_hw_params,
+	.trigger = sun4i_hdmi_audio_trigger,
+};
+
+static int sun4i_hdmi_audio_dai_probe(struct snd_soc_dai *dai)
+{
+	struct snd_dmaengine_dai_dma_data *dma_data;
+
+	dma_data = devm_kzalloc(dai->dev, sizeof(*dma_data), GFP_KERNEL);
+	if (!dma_data)
+		return -ENOMEM;
+
+	dma_data->addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
+	dma_data->maxburst = 8;
+
+	snd_soc_dai_init_dma_data(dai, dma_data, NULL);
+
+	return 0;
+}
+
+static struct snd_soc_dai_driver sun4i_hdmi_audio_dai = {
+	.name = "HDMI",
+	.ops = &sun4i_hdmi_audio_dai_ops,
+	.probe = sun4i_hdmi_audio_dai_probe,
+	.playback = {
+		.stream_name	= "Playback",
+		.channels_min	= 1,
+		.channels_max	= 8,
+		.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+		.rates		= SNDRV_PCM_RATE_8000_192000,
+	},
+};
+
+static const struct snd_pcm_hardware sun4i_hdmi_audio_pcm_hardware = {
+	.info			= SNDRV_PCM_INFO_INTERLEAVED |
+				  SNDRV_PCM_INFO_BLOCK_TRANSFER |
+				  SNDRV_PCM_INFO_MMAP |
+				  SNDRV_PCM_INFO_MMAP_VALID |
+				  SNDRV_PCM_INFO_PAUSE |
+				  SNDRV_PCM_INFO_RESUME,
+	.formats		= SNDRV_PCM_FMTBIT_S16_LE,
+	.rates                  = SNDRV_PCM_RATE_8000_192000,
+	.rate_min               = 8000,
+	.rate_max               = 192000,
+	.channels_min           = 1,
+	.channels_max           = 8,
+	.buffer_bytes_max	= 128 * 1024,
+	.period_bytes_min	= 4 * 1024,
+	.period_bytes_max	= 32 * 1024,
+	.periods_min		= 2,
+	.periods_max		= 8,
+	.fifo_size		= 128,
+};
+
+static const struct snd_dmaengine_pcm_config sun4i_hdmi_audio_pcm_config = {
+	.chan_names[SNDRV_PCM_STREAM_PLAYBACK] = "audio-tx",
+	.pcm_hardware = &sun4i_hdmi_audio_pcm_hardware,
+	.prealloc_buffer_size = 128 * 1024,
+	.prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
+};
+
+struct snd_soc_card sun4i_hdmi_audio_card = {
+	.name = "sun4i-hdmi",
+};
+
+int sun4i_hdmi_audio_create(struct sun4i_hdmi *hdmi)
+{
+	struct snd_soc_card *card = &sun4i_hdmi_audio_card;
+	struct snd_soc_dai_link_component *comp;
+	struct snd_soc_dai_link *link;
+	int ret;
+
+	ret = devm_snd_dmaengine_pcm_register(hdmi->dev,
+					      &sun4i_hdmi_audio_pcm_config, 0);
+	if (ret) {
+		DRM_ERROR("Could not register PCM\n");
+		return ret;
+	}
+
+	ret = devm_snd_soc_register_component(hdmi->dev,
+					      &sun4i_hdmi_audio_component,
+					      &sun4i_hdmi_audio_dai, 1);
+	if (ret) {
+		DRM_ERROR("Could not register DAI\n");
+		return ret;
+	}
+
+	link = devm_kzalloc(hdmi->dev, sizeof(*link), GFP_KERNEL);
+	if (!link)
+		return -ENOMEM;
+
+	comp = devm_kzalloc(hdmi->dev, sizeof(*comp) * 3, GFP_KERNEL);
+	if (!comp)
+		return -ENOMEM;
+
+	link->cpus = &comp[0];
+	link->codecs = &comp[1];
+	link->platforms = &comp[2];
+
+	link->num_cpus = 1;
+	link->num_codecs = 1;
+	link->num_platforms = 1;
+
+	link->playback_only = 1;
+
+	link->name = "SUN4I-HDMI";
+	link->stream_name = "SUN4I-HDMI PCM";
+
+	link->codecs->name = dev_name(hdmi->dev);
+	link->codecs->dai_name	= sun4i_hdmi_audio_dai.name;
+
+	link->cpus->dai_name = dev_name(hdmi->dev);
+
+	link->platforms->name = dev_name(hdmi->dev);
+
+	link->dai_fmt = SND_SOC_DAIFMT_I2S;
+
+	card->dai_link = link;
+	card->num_links = 1;
+	card->dev = hdmi->dev;
+
+	snd_soc_card_set_drvdata(card, hdmi);
+	return devm_snd_soc_register_card(hdmi->dev, card);
+}
diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
index a7c4654445c7..79ecd89fb705 100644
--- a/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
+++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c
@@ -114,6 +114,9 @@ static void sun4i_hdmi_enable(struct drm_encoder *encoder)
 		val |= SUN4I_HDMI_VID_CTRL_HDMI_MODE;
 
 	writel(val, hdmi->base + SUN4I_HDMI_VID_CTRL_REG);
+
+	if (hdmi->hdmi_audio && sun4i_hdmi_audio_create(hdmi))
+		DRM_ERROR("Couldn't create the HDMI audio adapter\n");
 }
 
 static void sun4i_hdmi_mode_set(struct drm_encoder *encoder,
@@ -218,6 +221,7 @@ static int sun4i_hdmi_get_modes(struct drm_connector *connector)
 	if (!edid)
 		return 0;
 
+	hdmi->hdmi_audio = drm_detect_monitor_audio(edid);
 	hdmi->hdmi_monitor = drm_detect_hdmi_monitor(edid);
 	DRM_DEBUG_DRIVER("Monitor is %s monitor\n",
 			 hdmi->hdmi_monitor ? "an HDMI" : "a DVI");
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
