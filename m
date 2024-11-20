Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76E2D9D3AFE
	for <lists+dri-devel@lfdr.de>; Wed, 20 Nov 2024 13:45:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDDE10E75A;
	Wed, 20 Nov 2024 12:45:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="qHoBbVsw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A9AA10E752
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Nov 2024 12:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1732106733;
 bh=62MWb0W3FoEZklIFiANKvjjN/F+9iZKr8pt24AzKqZE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qHoBbVswYmrKTPWvBMRLK8xnMTmt2SJHWRv6n7kpUCI9U10rZoYBGu2EE7I9oxhdq
 rZSBTURRUk1B75JJSMcfl4apN6QunuSstxWA/s1bXaHLLuvcpiDzDmzGbKSzDoa76R
 ZIzC5pf1yVxFo1o/ICwFCLJ3+JOHyzjjOTrNTQDZEwh4bg6Pi7HjMtYtKa0XdVmu9N
 wtMRawNbZSPZT5p8LUbKb2aPF615WVMJHTBM0qu7Yn/k6l3oDhnkyUFHa5d0QUoC5A
 pKRQ7sgdk/YfjHrSjFTYfwxH2hlwm3sMxcBl6QyM1ggZWqU0OQzNdlk7gNoW+3+gXz
 XToIFqkBsuPrQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 3AD1A17E3663;
 Wed, 20 Nov 2024 13:45:32 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 ck.hu@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Subject: [PATCH v1 6/7] drm/mediatek: mtk_hdmi: Split driver and add common
 probe function
Date: Wed, 20 Nov 2024 13:45:11 +0100
Message-ID: <20241120124512.134278-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
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

In preparation for adding a new driver for the HDMI TX v2 IP,
split out the functions that will be common between the already
present mtk_hdmi (v1) driver and the new one.

Since the probe flow for both drivers is 90% similar, add a common
probe function that will be called from each driver's .probe()
callback, avoiding lots of code duplication.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/Kconfig           |  11 +-
 drivers/gpu/drm/mediatek/Makefile          |   1 +
 drivers/gpu/drm/mediatek/mtk_hdmi.c        | 671 +++------------------
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 370 ++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 199 ++++++
 5 files changed, 673 insertions(+), 579 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index 3d2436272ff2..cae23fe165c7 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -34,10 +34,19 @@ config DRM_MEDIATEK_DP
 	help
 	  DRM/KMS Display Port driver for MediaTek SoCs.
 
+config DRM_MEDIATEK_HDMI_COMMON
+	tristate
+	depends on DRM_MEDIATEK
+	select DRM_DISPLAY_HDMI_HELPER
+	select DRM_DISPLAY_HELPER
+	select SND_SOC_HDMI_CODEC if SND_SOC
+	help
+	  MediaTek SoC HDMI common library
+
 config DRM_MEDIATEK_HDMI
 	tristate "DRM HDMI Support for Mediatek SoCs"
 	depends on DRM_MEDIATEK
-	select SND_SOC_HDMI_CODEC if SND_SOC
+	select DRM_MEDIATEK_HDMI_COMMON
 	select PHY_MTK_HDMI
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 32a2ed6c0cfe..8973d7ba37d3 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -25,6 +25,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 			  mtk_hdmi.o \
 			  mtk_hdmi_ddc.o
 
+obj-$(CONFIG_DRM_MEDIATEK_HDMI_COMMON) += mtk_hdmi_common.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk_dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 9e8d9144cf86..f20015ea1f97 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -31,6 +31,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "mtk_cec.h"
+#include "mtk_hdmi_common.h"
 #include "mtk_hdmi_regs.h"
 
 #define NCTS_BYTES	7
@@ -43,149 +44,13 @@ enum mtk_hdmi_clk_id {
 	MTK_HDMI_CLK_COUNT
 };
 
-enum hdmi_aud_input_type {
-	HDMI_AUD_INPUT_I2S = 0,
-	HDMI_AUD_INPUT_SPDIF,
-};
-
-enum hdmi_aud_i2s_fmt {
-	HDMI_I2S_MODE_RJT_24BIT = 0,
-	HDMI_I2S_MODE_RJT_16BIT,
-	HDMI_I2S_MODE_LJT_24BIT,
-	HDMI_I2S_MODE_LJT_16BIT,
-	HDMI_I2S_MODE_I2S_24BIT,
-	HDMI_I2S_MODE_I2S_16BIT
-};
-
-enum hdmi_aud_mclk {
-	HDMI_AUD_MCLK_128FS,
-	HDMI_AUD_MCLK_192FS,
-	HDMI_AUD_MCLK_256FS,
-	HDMI_AUD_MCLK_384FS,
-	HDMI_AUD_MCLK_512FS,
-	HDMI_AUD_MCLK_768FS,
-	HDMI_AUD_MCLK_1152FS,
-};
-
-enum hdmi_aud_channel_type {
-	HDMI_AUD_CHAN_TYPE_1_0 = 0,
-	HDMI_AUD_CHAN_TYPE_1_1,
-	HDMI_AUD_CHAN_TYPE_2_0,
-	HDMI_AUD_CHAN_TYPE_2_1,
-	HDMI_AUD_CHAN_TYPE_3_0,
-	HDMI_AUD_CHAN_TYPE_3_1,
-	HDMI_AUD_CHAN_TYPE_4_0,
-	HDMI_AUD_CHAN_TYPE_4_1,
-	HDMI_AUD_CHAN_TYPE_5_0,
-	HDMI_AUD_CHAN_TYPE_5_1,
-	HDMI_AUD_CHAN_TYPE_6_0,
-	HDMI_AUD_CHAN_TYPE_6_1,
-	HDMI_AUD_CHAN_TYPE_7_0,
-	HDMI_AUD_CHAN_TYPE_7_1,
-	HDMI_AUD_CHAN_TYPE_3_0_LRS,
-	HDMI_AUD_CHAN_TYPE_3_1_LRS,
-	HDMI_AUD_CHAN_TYPE_4_0_CLRS,
-	HDMI_AUD_CHAN_TYPE_4_1_CLRS,
-	HDMI_AUD_CHAN_TYPE_6_1_CS,
-	HDMI_AUD_CHAN_TYPE_6_1_CH,
-	HDMI_AUD_CHAN_TYPE_6_1_OH,
-	HDMI_AUD_CHAN_TYPE_6_1_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_LH_RH,
-	HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_7_1_LC_RC,
-	HDMI_AUD_CHAN_TYPE_7_1_LW_RW,
-	HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD,
-	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS,
-	HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS,
-	HDMI_AUD_CHAN_TYPE_7_1_CS_CH,
-	HDMI_AUD_CHAN_TYPE_7_1_CS_OH,
-	HDMI_AUD_CHAN_TYPE_7_1_CS_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_CH_OH,
-	HDMI_AUD_CHAN_TYPE_7_1_CH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_OH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_6_0_CS,
-	HDMI_AUD_CHAN_TYPE_6_0_CH,
-	HDMI_AUD_CHAN_TYPE_6_0_OH,
-	HDMI_AUD_CHAN_TYPE_6_0_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_LH_RH,
-	HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_7_0_LC_RC,
-	HDMI_AUD_CHAN_TYPE_7_0_LW_RW,
-	HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD,
-	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS,
-	HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS,
-	HDMI_AUD_CHAN_TYPE_7_0_CS_CH,
-	HDMI_AUD_CHAN_TYPE_7_0_CS_OH,
-	HDMI_AUD_CHAN_TYPE_7_0_CS_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_CH_OH,
-	HDMI_AUD_CHAN_TYPE_7_0_CH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_OH_CHR,
-	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR,
-	HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS,
-	HDMI_AUD_CHAN_TYPE_UNKNOWN = 0xFF
-};
-
-enum hdmi_aud_channel_swap_type {
-	HDMI_AUD_SWAP_LR,
-	HDMI_AUD_SWAP_LFE_CC,
-	HDMI_AUD_SWAP_LSRS,
-	HDMI_AUD_SWAP_RLS_RRS,
-	HDMI_AUD_SWAP_LR_STATUS,
-};
-
-struct hdmi_audio_param {
-	enum hdmi_audio_coding_type aud_codec;
-	enum hdmi_audio_sample_size aud_sampe_size;
-	enum hdmi_aud_input_type aud_input_type;
-	enum hdmi_aud_i2s_fmt aud_i2s_fmt;
-	enum hdmi_aud_mclk aud_mclk;
-	enum hdmi_aud_channel_type aud_input_chan_type;
-	struct hdmi_codec_params codec_params;
-};
-
-struct mtk_hdmi_conf {
-	bool tz_disabled;
-	bool cea_modes_only;
-	unsigned long max_mode_clock;
-};
-
-struct mtk_hdmi {
-	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
-	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
-	struct device *dev;
-	const struct mtk_hdmi_conf *conf;
-	struct phy *phy;
-	struct device *cec_dev;
-	struct i2c_adapter *ddc_adpt;
-	struct clk *clk[MTK_HDMI_CLK_COUNT];
-	struct drm_display_mode mode;
-	bool dvi_mode;
-	u32 min_clock;
-	u32 max_clock;
-	u32 max_hdisplay;
-	u32 max_vdisplay;
-	u32 ibias;
-	u32 ibias_up;
-	struct regmap *sys_regmap;
-	unsigned int sys_offset;
-	struct regmap *regs;
-	enum hdmi_colorspace csp;
-	struct hdmi_audio_param aud_param;
-	bool audio_enable;
-	bool powered;
-	bool enabled;
-	hdmi_codec_plugged_cb plugged_cb;
-	struct device *codec_dev;
-	struct mutex update_plugged_status_lock;
+const char * const mtk_hdmi_clk_names_v1[MTK_HDMI_CLK_COUNT] = {
+	[MTK_HDMI_CLK_HDMI_PIXEL] = "pixel",
+	[MTK_HDMI_CLK_HDMI_PLL] = "pll",
+	[MTK_HDMI_CLK_AUD_BCLK] = "bclk",
+	[MTK_HDMI_CLK_AUD_SPDIF] = "spdif",
 };
 
-static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
-{
-	return container_of(b, struct mtk_hdmi, bridge);
-}
-
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 {
 	regmap_update_bits(hdmi->regs, VIDEO_SOURCE_SEL,
@@ -606,81 +471,6 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
 	regmap_write(hdmi->regs, GRL_CFG5, val);
 }
 
-struct hdmi_acr_n {
-	unsigned int clock;
-	unsigned int n[3];
-};
-
-/* Recommended N values from HDMI specification, tables 7-1 to 7-3 */
-static const struct hdmi_acr_n hdmi_rec_n_table[] = {
-	/* Clock, N: 32kHz 44.1kHz 48kHz */
-	{  25175, {  4576,  7007,  6864 } },
-	{  74176, { 11648, 17836, 11648 } },
-	{ 148352, { 11648,  8918,  5824 } },
-	{ 296703, {  5824,  4459,  5824 } },
-	{ 297000, {  3072,  4704,  5120 } },
-	{      0, {  4096,  6272,  6144 } }, /* all other TMDS clocks */
-};
-
-/**
- * hdmi_recommended_n() - Return N value recommended by HDMI specification
- * @freq: audio sample rate in Hz
- * @clock: rounded TMDS clock in kHz
- */
-static unsigned int hdmi_recommended_n(unsigned int freq, unsigned int clock)
-{
-	const struct hdmi_acr_n *recommended;
-	unsigned int i;
-
-	for (i = 0; i < ARRAY_SIZE(hdmi_rec_n_table) - 1; i++) {
-		if (clock == hdmi_rec_n_table[i].clock)
-			break;
-	}
-	recommended = hdmi_rec_n_table + i;
-
-	switch (freq) {
-	case 32000:
-		return recommended->n[0];
-	case 44100:
-		return recommended->n[1];
-	case 48000:
-		return recommended->n[2];
-	case 88200:
-		return recommended->n[1] * 2;
-	case 96000:
-		return recommended->n[2] * 2;
-	case 176400:
-		return recommended->n[1] * 4;
-	case 192000:
-		return recommended->n[2] * 4;
-	default:
-		return (128 * freq) / 1000;
-	}
-}
-
-static unsigned int hdmi_mode_clock_to_hz(unsigned int clock)
-{
-	switch (clock) {
-	case 25175:
-		return 25174825;	/* 25.2/1.001 MHz */
-	case 74176:
-		return 74175824;	/* 74.25/1.001 MHz */
-	case 148352:
-		return 148351648;	/* 148.5/1.001 MHz */
-	case 296703:
-		return 296703297;	/* 297/1.001 MHz */
-	default:
-		return clock * 1000;
-	}
-}
-
-static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
-				      unsigned int tmds_clock, unsigned int n)
-{
-	return DIV_ROUND_CLOSEST_ULL((u64)hdmi_mode_clock_to_hz(tmds_clock) * n,
-				     128 * audio_sample_rate);
-}
-
 static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 				    unsigned int cts)
 {
@@ -710,9 +500,13 @@ static void mtk_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi,
 				     unsigned int clock)
 {
 	unsigned int n, cts;
+	int ret;
 
-	n = hdmi_recommended_n(sample_rate, clock);
-	cts = hdmi_expected_cts(sample_rate, clock, n);
+	ret = mtk_hdmi_get_ncts(sample_rate, clock, &n, &cts);
+	if (ret) {
+		dev_err(hdmi->dev, "Invalid sample rate: %u\n", sample_rate);
+		return;
+	}
 
 	dev_dbg(hdmi->dev, "%s: sample_rate=%u, clock=%d, cts=%u, n=%u\n",
 		__func__, sample_rate, clock, n, cts);
@@ -829,7 +623,6 @@ static void mtk_hdmi_video_set_display_mode(struct mtk_hdmi *hdmi,
 	mtk_hdmi_hw_msic_setting(hdmi, mode);
 }
 
-
 static void mtk_hdmi_aud_set_input(struct mtk_hdmi *hdmi)
 {
 	enum hdmi_aud_channel_type chan_type;
@@ -920,56 +713,6 @@ static int mtk_hdmi_aud_output_config(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi,
-					struct drm_display_mode *mode)
-{
-	struct hdmi_avi_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_AVI_INFOFRAME_SIZE];
-	ssize_t err;
-
-	err = drm_hdmi_avi_infoframe_from_display_mode(&frame,
-						       hdmi->curr_conn, mode);
-	if (err < 0) {
-		dev_err(hdmi->dev,
-			"Failed to get AVI infoframe from mode: %zd\n", err);
-		return err;
-	}
-
-	err = hdmi_avi_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
-		return err;
-	}
-
-	mtk_hdmi_hw_send_info_frame(hdmi, buffer, sizeof(buffer));
-	return 0;
-}
-
-static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi,
-					const char *vendor,
-					const char *product)
-{
-	struct hdmi_spd_infoframe frame;
-	u8 buffer[HDMI_INFOFRAME_HEADER_SIZE + HDMI_SPD_INFOFRAME_SIZE];
-	ssize_t err;
-
-	err = hdmi_spd_infoframe_init(&frame, vendor, product);
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n",
-			err);
-		return err;
-	}
-
-	err = hdmi_spd_infoframe_pack(&frame, buffer, sizeof(buffer));
-	if (err < 0) {
-		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
-		return err;
-	}
-
-	mtk_hdmi_hw_send_info_frame(hdmi, buffer, sizeof(buffer));
-	return 0;
-}
-
 static int mtk_hdmi_setup_audio_infoframe(struct mtk_hdmi *hdmi)
 {
 	struct hdmi_audio_infoframe frame;
@@ -1026,21 +769,6 @@ static int mtk_hdmi_setup_vendor_specific_infoframe(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static int mtk_hdmi_output_init(struct mtk_hdmi *hdmi)
-{
-	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
-
-	hdmi->csp = HDMI_COLORSPACE_RGB;
-	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-	aud_param->aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
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
@@ -1095,27 +823,6 @@ static int mtk_hdmi_output_set_display_mode(struct mtk_hdmi *hdmi,
 	return 0;
 }
 
-static const char * const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] = {
-	[MTK_HDMI_CLK_HDMI_PIXEL] = "pixel",
-	[MTK_HDMI_CLK_HDMI_PLL] = "pll",
-	[MTK_HDMI_CLK_AUD_BCLK] = "bclk",
-	[MTK_HDMI_CLK_AUD_SPDIF] = "spdif",
-};
-
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi,
-				struct device_node *np)
-{
-	int i;
-
-	for (i = 0; i < ARRAY_SIZE(mtk_hdmi_clk_names); i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np,
-						  mtk_hdmi_clk_names[i]);
-		if (IS_ERR(hdmi->clk[i]))
-			return PTR_ERR(hdmi->clk[i]);
-	}
-	return 0;
-}
-
 static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
 {
 	int ret;
@@ -1125,13 +832,12 @@ static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
 		return ret;
 
 	ret = clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_AUD_SPDIF]);
-	if (ret)
-		goto err;
+	if (ret) {
+		clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
+		return ret;
+	}
 
 	return 0;
-err:
-	clk_disable_unprepare(hdmi->clk[MTK_HDMI_CLK_AUD_BCLK]);
-	return ret;
 }
 
 static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
@@ -1143,10 +849,11 @@ static void mtk_hdmi_clk_disable_audio(struct mtk_hdmi *hdmi)
 static enum drm_connector_status
 mtk_hdmi_update_plugged_status(struct mtk_hdmi *hdmi)
 {
-	bool connected;
+	bool connected = true;
 
 	mutex_lock(&hdmi->update_plugged_status_lock);
-	connected = mtk_cec_hpd_high(hdmi->cec_dev);
+	if (hdmi->cec_dev)
+		connected = mtk_cec_hpd_high(hdmi->cec_dev);
 	if (hdmi->plugged_cb && hdmi->codec_dev)
 		hdmi->plugged_cb(hdmi->codec_dev, connected);
 	mutex_unlock(&hdmi->update_plugged_status_lock);
@@ -1254,18 +961,12 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
 			return ret;
 	}
 
-	mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
+	if (hdmi->cec_dev)
+		mtk_cec_set_hpd_event(hdmi->cec_dev, mtk_hdmi_hpd_event, hdmi->dev);
 
 	return 0;
 }
 
-static bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
-				       const struct drm_display_mode *mode,
-				       struct drm_display_mode *adjusted_mode)
-{
-	return true;
-}
-
 static void mtk_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					   struct drm_bridge_state *old_bridge_state)
 {
@@ -1297,28 +998,6 @@ static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
 	hdmi->powered = false;
 }
 
-static void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-				const struct drm_display_mode *mode,
-				const struct drm_display_mode *adjusted_mode)
-{
-	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
-
-	dev_dbg(hdmi->dev, "cur info: name:%s, hdisplay:%d\n",
-		adjusted_mode->name, adjusted_mode->hdisplay);
-	dev_dbg(hdmi->dev, "hsync_start:%d,hsync_end:%d, htotal:%d",
-		adjusted_mode->hsync_start, adjusted_mode->hsync_end,
-		adjusted_mode->htotal);
-	dev_dbg(hdmi->dev, "hskew:%d, vdisplay:%d\n",
-		adjusted_mode->hskew, adjusted_mode->vdisplay);
-	dev_dbg(hdmi->dev, "vsync_start:%d, vsync_end:%d, vtotal:%d",
-		adjusted_mode->vsync_start, adjusted_mode->vsync_end,
-		adjusted_mode->vtotal);
-	dev_dbg(hdmi->dev, "vscan:%d, flag:%d\n",
-		adjusted_mode->vscan, adjusted_mode->flags);
-
-	drm_mode_copy(&hdmi->mode, adjusted_mode);
-}
-
 static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 					      struct drm_bridge_state *old_state)
 {
@@ -1330,21 +1009,13 @@ static void mtk_hdmi_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 	hdmi->powered = true;
 }
 
-static void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi,
-				    struct drm_display_mode *mode)
-{
-	mtk_hdmi_setup_audio_infoframe(hdmi);
-	mtk_hdmi_setup_avi_infoframe(hdmi, mode);
-	mtk_hdmi_setup_spd_infoframe(hdmi, "mediatek", "On-chip HDMI");
-	if (mode->flags & DRM_MODE_FLAG_3D_MASK)
-		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, mode);
-}
-
 static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 					  struct drm_bridge_state *old_state)
 {
 	struct drm_atomic_state *state = old_state->base.state;
 	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+	u8 buffer_spd[HDMI_INFOFRAME_SIZE(SPD)];
+	u8 buffer_avi[HDMI_INFOFRAME_SIZE(AVI)];
 
 	/* Retrieve the connector through the atomic state. */
 	hdmi->curr_conn = drm_atomic_get_new_connector_for_encoder(state,
@@ -1354,12 +1025,16 @@ static void mtk_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PLL]);
 	clk_prepare_enable(hdmi->clk[MTK_HDMI_CLK_HDMI_PIXEL]);
 	phy_power_on(hdmi->phy);
-	mtk_hdmi_send_infoframe(hdmi, &hdmi->mode);
+	mtk_hdmi_setup_audio_infoframe(hdmi);
+	mtk_hdmi_send_infoframe(hdmi, buffer_spd, sizeof(buffer_spd),
+				buffer_avi, sizeof(buffer_avi), &hdmi->mode);
+	if (hdmi->mode.flags & DRM_MODE_FLAG_3D_MASK)
+		mtk_hdmi_setup_vendor_specific_infoframe(hdmi, &hdmi->mode);
 
 	hdmi->enabled = true;
 }
 
-static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
+const struct drm_bridge_funcs mtk_mt8183_hdmi_bridge_funcs = {
 	.mode_valid = mtk_hdmi_bridge_mode_valid,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -1375,105 +1050,6 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.edid_read = mtk_hdmi_bridge_edid_read,
 };
 
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi,
-				   struct platform_device *pdev)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *cec_np, *remote, *i2c_np;
-	struct platform_device *cec_pdev;
-	struct regmap *regmap;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np);
-	if (ret) {
-		if (ret != -EPROBE_DEFER)
-			dev_err(dev, "Failed to get clocks: %d\n", ret);
-
-		return ret;
-	}
-
-	/* The CEC module handles HDMI hotplug detection */
-	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np) {
-		dev_err(dev, "Failed to find CEC node\n");
-		return -EINVAL;
-	}
-
-	cec_pdev = of_find_device_by_node(cec_np);
-	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n",
-			cec_np);
-		of_node_put(cec_np);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(cec_np);
-	hdmi->cec_dev = &cec_pdev->dev;
-
-	/*
-	 * The mediatek,syscon-hdmi property contains a phandle link to the
-	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
-	 * registers it contains.
-	 */
-	regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1,
-					 &hdmi->sys_offset);
-	if (IS_ERR(regmap))
-		ret = PTR_ERR(regmap);
-	if (ret) {
-		dev_err(dev,
-			"Failed to get system configuration registers: %d\n",
-			ret);
-		goto put_device;
-	}
-	hdmi->sys_regmap = regmap;
-
-	hdmi->regs = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(hdmi->regs)) {
-		ret = PTR_ERR(hdmi->regs);
-		goto put_device;
-	}
-
-	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote) {
-		ret = -EINVAL;
-		goto put_device;
-	}
-
-	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
-			dev_err(dev, "Waiting for external bridge\n");
-			of_node_put(remote);
-			ret = -EPROBE_DEFER;
-			goto put_device;
-		}
-	}
-
-	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
-	if (!i2c_np) {
-		dev_err(dev, "Failed to find ddc-i2c-bus node in %pOF\n",
-			remote);
-		of_node_put(remote);
-		ret = -EINVAL;
-		goto put_device;
-	}
-	of_node_put(remote);
-
-	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
-	of_node_put(i2c_np);
-	if (!hdmi->ddc_adpt) {
-		dev_err(dev, "Failed to get ddc i2c adapter by node\n");
-		ret = -EINVAL;
-		goto put_device;
-	}
-
-	return 0;
-put_device:
-	put_device(hdmi->cec_dev);
-	return ret;
-}
-
 /*
  * HDMI audio codec callbacks
  */
@@ -1528,14 +1104,14 @@ static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 	switch (daifmt->fmt) {
 	case HDMI_I2S:
 		hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-		hdmi_params.aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		hdmi_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
 		hdmi_params.aud_input_type = HDMI_AUD_INPUT_I2S;
 		hdmi_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
 		hdmi_params.aud_mclk = HDMI_AUD_MCLK_128FS;
 		break;
 	case HDMI_SPDIF:
 		hdmi_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-		hdmi_params.aud_sampe_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		hdmi_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
 		hdmi_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
 		break;
 	default:
@@ -1590,6 +1166,7 @@ static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf,
 		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
 	else
 		memset(buf, 0, len);
+
 	return 0;
 }
 
@@ -1619,89 +1196,20 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.no_capture_mute = 1,
 };
 
-static int mtk_hdmi_register_audio_driver(struct device *dev)
-{
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &mtk_hdmi_audio_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = hdmi,
-	};
-	struct platform_device *pdev;
-
-	pdev = platform_device_register_data(dev, HDMI_CODEC_DRV_NAME,
-					     PLATFORM_DEVID_AUTO, &codec_data,
-					     sizeof(codec_data));
-	if (IS_ERR(pdev))
-		return PTR_ERR(pdev);
-
-	DRM_INFO("%s driver bound to HDMI\n", HDMI_CODEC_DRV_NAME);
-	return 0;
-}
-
-static int mtk_hdmi_probe(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi;
-	struct device *dev = &pdev->dev;
-	int ret;
-
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
-
-	hdmi->dev = dev;
-	hdmi->conf = of_device_get_match_data(dev);
-
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev);
-	if (ret)
-		return ret;
-
-	hdmi->phy = devm_phy_get(dev, "hdmi");
-	if (IS_ERR(hdmi->phy))
-		return dev_err_probe(dev, PTR_ERR(hdmi->phy),
-				     "Failed to get HDMI PHY\n");
-
-	mutex_init(&hdmi->update_plugged_status_lock);
-	platform_set_drvdata(pdev, hdmi);
-
-	ret = mtk_hdmi_output_init(hdmi);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to initialize hdmi output\n");
-
-	ret = mtk_hdmi_register_audio_driver(dev);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to register audio driver\n");
-
-	hdmi->bridge.funcs = &mtk_hdmi_bridge_funcs;
-	hdmi->bridge.of_node = pdev->dev.of_node;
-	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
-			 | DRM_BRIDGE_OP_HPD;
-	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
-	drm_bridge_add(&hdmi->bridge);
-
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		drm_bridge_remove(&hdmi->bridge);
-		return dev_err_probe(dev, ret,
-				     "Failed to enable audio clocks\n");
-	}
-
-	return 0;
-}
-
-static void mtk_hdmi_remove(struct platform_device *pdev)
+static void mtk_hdmi_audio_init(struct mtk_hdmi *hdmi, struct hdmi_codec_pdata *codec_data)
 {
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
 
-	drm_bridge_remove(&hdmi->bridge);
-	mtk_hdmi_clk_disable_audio(hdmi);
+	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
+	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
+	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+	codec_data->ops = &mtk_hdmi_audio_codec_ops;
 }
 
-#ifdef CONFIG_PM_SLEEP
-static int mtk_hdmi_suspend(struct device *dev)
+static __maybe_unused int mtk_hdmi_suspend(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
 
@@ -1710,74 +1218,81 @@ static int mtk_hdmi_suspend(struct device *dev)
 	return 0;
 }
 
-static int mtk_hdmi_resume(struct device *dev)
+static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 {
 	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	int ret = 0;
-
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret) {
-		dev_err(dev, "hdmi resume failed!\n");
-		return ret;
-	}
 
-	return 0;
+	return mtk_hdmi_clk_enable_audio(hdmi);
 }
-#endif
-static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops,
-			 mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
+
+static const struct mtk_hdmi_ver_conf mtk_hdmi_v1_ver_conf = {
+	.bridge_funcs = &mtk_mt8183_hdmi_bridge_funcs,
+	.mtk_hdmi_audio_init = mtk_hdmi_audio_init,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names_v1,
+	.num_clocks = ARRAY_SIZE(mtk_hdmi_clk_names_v1)
+};
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
 	.max_mode_clock = 148500,
 	.cea_modes_only = true,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
-static const struct of_device_id mtk_hdmi_of_ids[] = {
-	{ .compatible = "mediatek,mt2701-hdmi",
-	  .data = &mtk_hdmi_conf_mt2701,
-	},
-	{ .compatible = "mediatek,mt8167-hdmi",
-	  .data = &mtk_hdmi_conf_mt8167,
-	},
-	{ .compatible = "mediatek,mt8173-hdmi",
-	},
-	{}
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173 = {
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
-MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
 
-static struct platform_driver mtk_hdmi_driver = {
-	.probe = mtk_hdmi_probe,
-	.remove_new = mtk_hdmi_remove,
-	.driver = {
-		.name = "mediatek-drm-hdmi",
-		.of_match_table = mtk_hdmi_of_ids,
-		.pm = &mtk_hdmi_pm_ops,
-	},
-};
+static int mtk_hdmi_probe(struct platform_device *pdev)
+{
+	struct mtk_hdmi *hdmi;
+	int ret;
 
-static struct platform_driver * const mtk_hdmi_drivers[] = {
-	&mtk_hdmi_driver,
-};
+	hdmi = devm_kzalloc(&pdev->dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return -ENOMEM;
 
-static int __init mtk_hdmitx_init(void)
-{
-	return platform_register_drivers(mtk_hdmi_drivers,
-					 ARRAY_SIZE(mtk_hdmi_drivers));
+	ret = mtk_hdmi_common_probe(pdev, hdmi);
+	if (ret)
+		return ret;
+
+	return mtk_hdmi_clk_enable_audio(hdmi);
 }
 
-static void __exit mtk_hdmitx_exit(void)
+static void mtk_hdmi_remove(struct platform_device *pdev)
 {
-	platform_unregister_drivers(mtk_hdmi_drivers,
-				    ARRAY_SIZE(mtk_hdmi_drivers));
+	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
+
+	mtk_hdmi_clk_disable_audio(hdmi);
+	i2c_put_adapter(hdmi->ddc_adpt);
 }
 
-module_init(mtk_hdmitx_init);
-module_exit(mtk_hdmitx_exit);
+static const struct of_device_id mtk_drm_hdmi_of_ids[] = {
+	{ .compatible = "mediatek,mt2701-hdmi", .data = &mtk_hdmi_conf_mt2701 },
+	{ .compatible = "mediatek,mt8167-hdmi", .data = &mtk_hdmi_conf_mt8167 },
+	{ .compatible = "mediatek,mt8173-hdmi", .data = &mtk_hdmi_conf_mt8173 },
+	{ /* sentinel */ }
+};
+MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_of_ids);
+
+static struct platform_driver mtk_hdmi_driver = {
+	.probe = mtk_hdmi_probe,
+	.remove = mtk_hdmi_remove,
+	.driver = {
+		.name = "mediatek-drm-hdmi",
+		.of_match_table = mtk_drm_hdmi_of_ids,
+		.pm = &mtk_hdmi_pm_ops,
+	},
+};
+module_platform_driver(mtk_hdmi_driver);
 
 MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
 MODULE_LICENSE("GPL v2");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
new file mode 100644
index 000000000000..c80ff05a6e83
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ * Copyright (c) 2024 Collabora Ltd.
+ *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
+ */
+
+#include <drm/drm_modes.h>
+#include <linux/device.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/math.h>
+#include <linux/of.h>
+#include <linux/of_platform.h>
+#include <linux/platform_device.h>
+#include <linux/mfd/syscon.h>
+#include <sound/hdmi-codec.h>
+
+#include "mtk_hdmi_common.h"
+
+struct hdmi_acr_n {
+	unsigned int clock;
+	unsigned int n[3];
+};
+
+/* Recommended N values from HDMI specification, tables 7-1 to 7-3 */
+static const struct hdmi_acr_n hdmi_rec_n_table[] = {
+	/* Clock, N: 32kHz 44.1kHz 48kHz */
+	{ 25175,  {  4576,  7007,  6864 } },
+	{ 74176,  { 11648, 17836, 11648 } },
+	{ 148352, { 11648,  8918,  5824 } },
+	{ 296703, {  5824,  4459,  5824 } },
+	{ 297000, {  3072,  4704,  5120 } },
+	{ 0,      {  4096,  6272,  6144 } }, /* all other TMDS clocks */
+};
+
+/**
+ * hdmi_recommended_n() - Return N value recommended by HDMI specification
+ * @freq: audio sample rate in Hz
+ * @clock: rounded TMDS clock in kHz
+ */
+static int hdmi_recommended_n(unsigned int freq, unsigned int clock)
+{
+	const struct hdmi_acr_n *recommended;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(hdmi_rec_n_table) - 1; i++) {
+		if (clock == hdmi_rec_n_table[i].clock)
+			break;
+	}
+
+	if (i == ARRAY_SIZE(hdmi_rec_n_table))
+		return -EINVAL;
+
+	recommended = hdmi_rec_n_table + i;
+
+	switch (freq) {
+	case 32000:
+		return recommended->n[0];
+	case 44100:
+		return recommended->n[1];
+	case 48000:
+		return recommended->n[2];
+	case 88200:
+		return recommended->n[1] * 2;
+	case 96000:
+		return recommended->n[2] * 2;
+	case 176400:
+		return recommended->n[1] * 4;
+	case 192000:
+		return recommended->n[2] * 4;
+	default:
+		return (128 * freq) / 1000;
+	}
+}
+
+static unsigned int hdmi_mode_clock_to_hz(unsigned int clock)
+{
+	switch (clock) {
+	case 25175:
+		return 25174825; /* 25.2/1.001 MHz */
+	case 74176:
+		return 74175824; /* 74.25/1.001 MHz */
+	case 148352:
+		return 148351648; /* 148.5/1.001 MHz */
+	case 296703:
+		return 296703297; /* 297/1.001 MHz */
+	default:
+		return clock * 1000;
+	}
+}
+
+static unsigned int hdmi_expected_cts(unsigned int audio_sample_rate,
+				      unsigned int tmds_clock, unsigned int n)
+{
+	return DIV_ROUND_CLOSEST_ULL((u64)hdmi_mode_clock_to_hz(tmds_clock) * n,
+				     128 * audio_sample_rate);
+}
+
+int mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
+		      unsigned int *n, unsigned int *cts)
+{
+	int rec_n = hdmi_recommended_n(sample_rate, clock);
+
+	if (rec_n < 0)
+		return rec_n;
+
+	*cts = hdmi_expected_cts(sample_rate, clock, rec_n);
+	*n = rec_n;
+
+	return 0;
+}
+
+static int mtk_hdmi_setup_spd_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz,
+					const char *vendor, const char *product)
+{
+	struct hdmi_spd_infoframe frame;
+	ssize_t err;
+
+	err = hdmi_spd_infoframe_init(&frame, vendor, product);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to initialize SPD infoframe: %zd\n", err);
+		return err;
+	}
+
+	err = hdmi_spd_infoframe_pack(&frame, buffer, bufsz);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack SDP infoframe: %zd\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+				const char * const *mtk_hdmi_clk_names, size_t num_clocks)
+{
+	int i;
+
+	for (i = 0; i < num_clocks; i++) {
+		hdmi->clk[i] = of_clk_get_by_name(np, mtk_hdmi_clk_names[i]);
+
+		if (IS_ERR(hdmi->clk[i]))
+			return PTR_ERR(hdmi->clk[i]);
+	}
+
+	return 0;
+}
+
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode)
+{
+	return true;
+}
+
+void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			      const struct drm_display_mode *mode,
+			      const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	drm_mode_copy(&hdmi->mode, adjusted_mode);
+}
+
+static int mtk_hdmi_setup_avi_infoframe(struct mtk_hdmi *hdmi, u8 *buffer, size_t bufsz,
+					struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	ssize_t err;
+
+	err = drm_hdmi_avi_infoframe_from_display_mode(&frame, hdmi->curr_conn, mode);
+	if (err < 0) {
+		dev_err(hdmi->dev,
+			"Failed to get AVI infoframe from mode: %zd\n", err);
+		return err;
+	}
+
+	err = hdmi_avi_infoframe_pack(&frame, buffer, bufsz);
+	if (err < 0) {
+		dev_err(hdmi->dev, "Failed to pack AVI infoframe: %zd\n", err);
+		return err;
+	}
+
+	return 0;
+}
+
+void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
+			     u8 *buffer_avi, size_t bufsz_avi, struct drm_display_mode *mode)
+{
+	mtk_hdmi_setup_avi_infoframe(hdmi, buffer_avi, bufsz_avi, mode);
+	mtk_hdmi_setup_spd_infoframe(hdmi, buffer_spd, bufsz_spd, "mediatek", "On-chip HDMI");
+}
+
+static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
+{
+	struct platform_device *cec_pdev;
+	struct device_node *cec_np;
+	int ret;
+
+	/* The CEC module handles HDMI hotplug detection */
+	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
+	if (!cec_np)
+		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
+
+	cec_pdev = of_find_device_by_node(cec_np);
+	if (!cec_pdev) {
+		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
+		of_node_put(cec_np);
+		return -EPROBE_DEFER;
+	}
+	of_node_put(cec_np);
+
+	/*
+	 * The mediatek,syscon-hdmi property contains a phandle link to the
+	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
+	 * registers it contains.
+	 */
+	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
+	if (IS_ERR(hdmi->sys_regmap))
+		return PTR_ERR(hdmi->sys_regmap);
+
+	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to get system configuration registers\n");
+
+	hdmi->cec_dev = &cec_pdev->dev;
+	return 0;
+}
+
+static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
+				   const char * const *clk_names, size_t num_clocks)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct device_node *remote, *i2c_np;
+	int ret;
+
+	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to get clocks\n");
+
+	hdmi->irq = platform_get_irq(pdev, 0);
+	if (!hdmi->irq)
+		return hdmi->irq;
+
+	hdmi->regs = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+	if (!remote)
+		return dev_err_probe(dev, -EINVAL, "Cannot find HDMI input port\n");
+
+	if (!of_device_is_compatible(remote, "hdmi-connector")) {
+		hdmi->next_bridge = of_drm_find_bridge(remote);
+		if (!hdmi->next_bridge) {
+			dev_err(dev, "Waiting for external bridge\n");
+			of_node_put(remote);
+			return -EPROBE_DEFER;
+		}
+	}
+
+	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
+	if (!i2c_np) {
+		of_node_put(pdev->dev.of_node);
+		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
+	}
+
+	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
+	of_node_put(i2c_np);
+	if (!hdmi->ddc_adpt) {
+		dev_err(dev, "Failed to get ddc i2c adapter by node");
+		return -EPROBE_DEFER;
+	}
+
+	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
+	if (ret == -ENOTSUPP)
+		dev_info(dev, "CEC support unavailable: node not found\n");
+	else if (ret)
+		return ret;
+
+	return 0;
+}
+
+static void mtk_hdmi_unregister_audio_driver(void *data)
+{
+	platform_device_unregister(data);
+}
+
+static int mtk_hdmi_register_audio_driver(struct device *dev)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+	struct hdmi_codec_pdata codec_data = {
+		.i2s = 1,
+		.max_i2s_channels = 2,
+		.data = hdmi,
+	};
+	int ret;
+
+	if (hdmi->conf->ver_conf->mtk_hdmi_audio_init)
+		hdmi->conf->ver_conf->mtk_hdmi_audio_init(hdmi, &codec_data);
+
+	hdmi->audio_pdev = platform_device_register_data(dev,
+							 HDMI_CODEC_DRV_NAME,
+							 PLATFORM_DEVID_AUTO,
+							 &codec_data,
+							 sizeof(codec_data));
+	if (IS_ERR(hdmi->audio_pdev))
+		return PTR_ERR(hdmi->audio_pdev);
+
+	ret = devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_driver,
+				       hdmi->audio_pdev);
+	if (ret) {
+		platform_device_unregister(hdmi->audio_pdev);
+		return ret;
+	}
+
+	return 0;
+}
+
+int mtk_hdmi_common_probe(struct platform_device *pdev, struct mtk_hdmi *hdmi)
+{
+	const struct mtk_hdmi_ver_conf *ver_conf;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	hdmi->dev = dev;
+	hdmi->conf = of_device_get_match_data(dev);
+	ver_conf = hdmi->conf->ver_conf;
+
+	hdmi->clk = devm_kcalloc(dev, ver_conf->num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
+	if (!hdmi->clk)
+		return -ENOMEM;
+
+	hdmi->phy = devm_phy_get(dev, "hdmi");
+	if (IS_ERR(hdmi->phy))
+		return dev_err_probe(dev, PTR_ERR(hdmi->phy), "Failed to get HDMI PHY\n");
+
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, ver_conf->mtk_hdmi_clock_names,
+				      ver_conf->num_clocks);
+	if (ret)
+		return ret;
+
+	platform_set_drvdata(pdev, hdmi);
+
+	ret = mtk_hdmi_register_audio_driver(dev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Cannot register HDMI Audio driver\n");
+
+	hdmi->bridge.funcs = ver_conf->bridge_funcs;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.ddc = hdmi->ddc_adpt;
+
+	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to add bridge\n");
+
+	return 0;
+}
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_AUTHOR("Can Zeng <can.zeng@mediatek.com>");
+MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
+MODULE_DESCRIPTION("MediaTek HDMI Common Library");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
new file mode 100644
index 000000000000..b00357a4cbf3
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -0,0 +1,199 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2022 BayLibre, SAS
+ */
+
+#ifndef _MTK_HDMI_COMMON_H
+#define _MTK_HDMI_COMMON_H
+
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_bridge.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_print.h>
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/hdmi.h>
+#include <linux/i2c.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+
+#include <sound/hdmi-codec.h>
+
+enum hdmi_aud_input_type {
+	HDMI_AUD_INPUT_I2S = 0,
+	HDMI_AUD_INPUT_SPDIF,
+};
+
+enum hdmi_aud_i2s_fmt {
+	HDMI_I2S_MODE_RJT_24BIT = 0,
+	HDMI_I2S_MODE_RJT_16BIT,
+	HDMI_I2S_MODE_LJT_24BIT,
+	HDMI_I2S_MODE_LJT_16BIT,
+	HDMI_I2S_MODE_I2S_24BIT,
+	HDMI_I2S_MODE_I2S_16BIT
+};
+
+enum hdmi_aud_mclk {
+	HDMI_AUD_MCLK_128FS,
+	HDMI_AUD_MCLK_192FS,
+	HDMI_AUD_MCLK_256FS,
+	HDMI_AUD_MCLK_384FS,
+	HDMI_AUD_MCLK_512FS,
+	HDMI_AUD_MCLK_768FS,
+	HDMI_AUD_MCLK_1152FS,
+};
+
+enum hdmi_aud_channel_type {
+	HDMI_AUD_CHAN_TYPE_1_0 = 0,
+	HDMI_AUD_CHAN_TYPE_1_1,
+	HDMI_AUD_CHAN_TYPE_2_0,
+	HDMI_AUD_CHAN_TYPE_2_1,
+	HDMI_AUD_CHAN_TYPE_3_0,
+	HDMI_AUD_CHAN_TYPE_3_1,
+	HDMI_AUD_CHAN_TYPE_4_0,
+	HDMI_AUD_CHAN_TYPE_4_1,
+	HDMI_AUD_CHAN_TYPE_5_0,
+	HDMI_AUD_CHAN_TYPE_5_1,
+	HDMI_AUD_CHAN_TYPE_6_0,
+	HDMI_AUD_CHAN_TYPE_6_1,
+	HDMI_AUD_CHAN_TYPE_7_0,
+	HDMI_AUD_CHAN_TYPE_7_1,
+	HDMI_AUD_CHAN_TYPE_3_0_LRS,
+	HDMI_AUD_CHAN_TYPE_3_1_LRS,
+	HDMI_AUD_CHAN_TYPE_4_0_CLRS,
+	HDMI_AUD_CHAN_TYPE_4_1_CLRS,
+	HDMI_AUD_CHAN_TYPE_6_1_CS,
+	HDMI_AUD_CHAN_TYPE_6_1_CH,
+	HDMI_AUD_CHAN_TYPE_6_1_OH,
+	HDMI_AUD_CHAN_TYPE_6_1_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_LH_RH,
+	HDMI_AUD_CHAN_TYPE_7_1_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_7_1_LC_RC,
+	HDMI_AUD_CHAN_TYPE_7_1_LW_RW,
+	HDMI_AUD_CHAN_TYPE_7_1_LSD_RSD,
+	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS,
+	HDMI_AUD_CHAN_TYPE_7_1_LHS_RHS,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_CH,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_OH,
+	HDMI_AUD_CHAN_TYPE_7_1_CS_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_CH_OH,
+	HDMI_AUD_CHAN_TYPE_7_1_CH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_OH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_1_LSS_RSS_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_6_0_CS,
+	HDMI_AUD_CHAN_TYPE_6_0_CH,
+	HDMI_AUD_CHAN_TYPE_6_0_OH,
+	HDMI_AUD_CHAN_TYPE_6_0_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_LH_RH,
+	HDMI_AUD_CHAN_TYPE_7_0_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_7_0_LC_RC,
+	HDMI_AUD_CHAN_TYPE_7_0_LW_RW,
+	HDMI_AUD_CHAN_TYPE_7_0_LSD_RSD,
+	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS,
+	HDMI_AUD_CHAN_TYPE_7_0_LHS_RHS,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_CH,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_OH,
+	HDMI_AUD_CHAN_TYPE_7_0_CS_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_CH_OH,
+	HDMI_AUD_CHAN_TYPE_7_0_CH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_OH_CHR,
+	HDMI_AUD_CHAN_TYPE_7_0_LSS_RSS_LSR_RSR,
+	HDMI_AUD_CHAN_TYPE_8_0_LH_RH_CS,
+	HDMI_AUD_CHAN_TYPE_UNKNOWN = 0xFF
+};
+
+enum hdmi_aud_channel_swap_type {
+	HDMI_AUD_SWAP_LR,
+	HDMI_AUD_SWAP_LFE_CC,
+	HDMI_AUD_SWAP_LSRS,
+	HDMI_AUD_SWAP_RLS_RRS,
+	HDMI_AUD_SWAP_LR_STATUS,
+};
+
+enum hdmi_hpd_state {
+	HDMI_PLUG_OUT = 0,
+	HDMI_PLUG_IN_AND_SINK_POWER_ON,
+	HDMI_PLUG_IN_ONLY,
+};
+
+struct hdmi_audio_param {
+	enum hdmi_audio_coding_type aud_codec;
+	enum hdmi_audio_sample_size aud_sample_size;
+	enum hdmi_aud_input_type aud_input_type;
+	enum hdmi_aud_i2s_fmt aud_i2s_fmt;
+	enum hdmi_aud_mclk aud_mclk;
+	enum hdmi_aud_channel_type aud_input_chan_type;
+	struct hdmi_codec_params codec_params;
+};
+
+struct mtk_hdmi {
+	struct drm_bridge bridge;
+	struct device *dev;
+	const struct mtk_hdmi_conf *conf;
+	struct phy *phy;
+	struct i2c_adapter *ddc_adpt;
+	struct clk **clk;
+	struct drm_display_mode mode;
+	bool dvi_mode;
+	struct regmap *sys_regmap;
+	unsigned int sys_offset;
+	struct regmap *regs;
+
+	bool powered;
+	bool enabled;
+	unsigned int irq;
+	enum hdmi_hpd_state hpd;
+
+	/* Audio */
+	struct platform_device *audio_pdev;
+	struct hdmi_audio_param aud_param;
+	bool audio_enable;
+
+	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
+	struct mutex update_plugged_status_lock;
+	struct device *cec_dev;
+	struct device *codec_dev;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct drm_bridge *next_bridge;
+};
+
+struct mtk_hdmi_ver_conf {
+	void (*mtk_hdmi_audio_init)(struct mtk_hdmi *hdmi, struct hdmi_codec_pdata *codec_data);
+	const struct drm_bridge_funcs *bridge_funcs;
+	const char * const *mtk_hdmi_clock_names;
+	int num_clocks;
+};
+
+struct mtk_hdmi_conf {
+	const struct mtk_hdmi_ver_conf *ver_conf;
+	bool tz_disabled;
+	bool cea_modes_only;
+	unsigned long max_mode_clock;
+};
+
+static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_hdmi, bridge);
+}
+
+void mtk_hdmi_send_infoframe(struct mtk_hdmi *hdmi, u8 *buffer_spd, size_t bufsz_spd,
+			     u8 *buffer_avi, size_t bufsz_avi, struct drm_display_mode *mode);
+int mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
+		      unsigned int *n, unsigned int *cts);
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode);
+void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			      const struct drm_display_mode *mode,
+			      const struct drm_display_mode *adjusted_mode);
+int mtk_hdmi_common_probe(struct platform_device *pdev, struct mtk_hdmi *hdmi);
+int mtk_drm_hdmi_probe(struct platform_device *pdev);
+int mtk_drm_hdmi_remove(struct platform_device *pdev);
+
+#endif //_MTK_HDMI_COMMON_H
-- 
2.47.0

