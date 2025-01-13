Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A09BBA0BA8A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 15:53:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0996B10E6BF;
	Mon, 13 Jan 2025 14:53:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=collabora.com header.i=@collabora.com header.b="luimjMDv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bali.collaboradmins.com (bali.collaboradmins.com
 [148.251.105.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA6F10E6C3
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 14:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1736780000;
 bh=ATzhcVLlN3ZRJ6IRypoTOaIb1jC7neBeo2Xn+4IXBks=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=luimjMDvSNOMY7zsRfD6Q02mvvU/rrXV89DoJcdKTNdf5/88nN8paf2QItW4FS8EW
 a+yXtlJeYgWeLpFwiiDh2Wh7HeepoF77FE90Ghgh5b5ze/AfZa+/NsYQJvO2WQmyse
 nxOOxLAF2juoNvTi/pALz5q3MDrOleNMk4VbhJCGUKvRDtk0XXlpY9aX0y46Cn1FpC
 CI8TD9PXFcDjDqXDn4nsC4mnENiQbgOe5pWzKf50rV0h96bvmff7UrksY31pHUTvrT
 9k1vwNNJhyxayrLmqnBj5VPHa8ZfzNCBA7uqlaJ4wxEH4wvu2/RLJyhZgyEKp1sUWv
 9zsQ29889Niag==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by bali.collaboradmins.com (Postfix) with ESMTPSA id 276AA17E0FBD;
 Mon, 13 Jan 2025 15:53:19 +0100 (CET)
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
Subject: [PATCH v5 29/34] drm/mediatek: mtk_hdmi: Split driver and add common
 probe function
Date: Mon, 13 Jan 2025 15:52:27 +0100
Message-ID: <20250113145232.227674-30-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
References: <20250113145232.227674-1-angelogioacchino.delregno@collabora.com>
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
 drivers/gpu/drm/mediatek/mtk_hdmi.c        | 553 +--------------------
 drivers/gpu/drm/mediatek/mtk_hdmi_common.c | 426 ++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_hdmi_common.h | 188 +++++++
 5 files changed, 648 insertions(+), 531 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_hdmi_common.h

diff --git a/drivers/gpu/drm/mediatek/Kconfig b/drivers/gpu/drm/mediatek/Kconfig
index e47debd60619..994b48b82d44 100644
--- a/drivers/gpu/drm/mediatek/Kconfig
+++ b/drivers/gpu/drm/mediatek/Kconfig
@@ -30,9 +30,18 @@ config DRM_MEDIATEK_DP
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
 	help
 	  DRM/KMS HDMI driver for Mediatek SoCs
diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 43afd0a26d14..78cf2d4fc85f 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -21,6 +21,7 @@ mediatek-drm-y := mtk_crtc.o \
 
 obj-$(CONFIG_DRM_MEDIATEK) += mediatek-drm.o
 
+obj-$(CONFIG_DRM_MEDIATEK_HDMI_COMMON) += mtk_hdmi_common.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_cec.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi.o
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mtk_hdmi_ddc.o
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi.c b/drivers/gpu/drm/mediatek/mtk_hdmi.c
index 138c6283c038..7940c9b598c1 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi.c
@@ -31,6 +31,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include "mtk_cec.h"
+#include "mtk_hdmi_common.h"
 #include "mtk_hdmi_regs.h"
 
 #define NCTS_BYTES	7
@@ -43,143 +44,6 @@ enum mtk_hdmi_clk_id {
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
-	enum hdmi_audio_sample_size aud_sample_size;
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
-	struct clk **clk;
-	struct drm_display_mode mode;
-	bool dvi_mode;
-	struct regmap *sys_regmap;
-	unsigned int sys_offset;
-	struct regmap *regs;
-	struct platform_device *audio_pdev;
-	struct hdmi_audio_param aud_param;
-	bool audio_enable;
-	bool powered;
-	bool enabled;
-	hdmi_codec_plugged_cb plugged_cb;
-	struct device *codec_dev;
-	struct mutex update_plugged_status_lock;
-};
-
-static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
-{
-	return container_of(b, struct mtk_hdmi, bridge);
-}
-
 static void mtk_hdmi_hw_vid_black(struct mtk_hdmi *hdmi, bool black)
 {
 	regmap_update_bits(hdmi->regs, VIDEO_SOURCE_SEL,
@@ -600,88 +464,6 @@ static void mtk_hdmi_hw_aud_set_mclk(struct mtk_hdmi *hdmi,
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
-static void mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
-			      unsigned int *n, unsigned int *cts)
-{
-	*n = hdmi_recommended_n(sample_rate, clock);
-	*cts = hdmi_expected_cts(sample_rate, clock, *n);
-}
-
 static void do_hdmi_hw_aud_set_ncts(struct mtk_hdmi *hdmi, unsigned int n,
 				    unsigned int cts)
 {
@@ -1072,21 +854,6 @@ static const char * const mtk_hdmi_clk_names[MTK_HDMI_CLK_COUNT] = {
 	[MTK_HDMI_CLK_AUD_SPDIF] = "spdif",
 };
 
-static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
-				const char * const *clock_names, size_t num_clocks)
-{
-	int i;
-
-	for (i = 0; i < num_clocks; i++) {
-		hdmi->clk[i] = of_clk_get_by_name(np, clock_names[i]);
-
-		if (IS_ERR(hdmi->clk[i]))
-			return PTR_ERR(hdmi->clk[i]);
-	}
-
-	return 0;
-}
-
 static int mtk_hdmi_clk_enable_audio(struct mtk_hdmi *hdmi)
 {
 	int ret;
@@ -1229,13 +996,6 @@ static int mtk_hdmi_bridge_attach(struct drm_bridge *bridge,
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
@@ -1267,28 +1027,6 @@ static void mtk_hdmi_bridge_atomic_post_disable(struct drm_bridge *bridge,
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
@@ -1345,167 +1083,10 @@ static const struct drm_bridge_funcs mtk_hdmi_bridge_funcs = {
 	.edid_read = mtk_hdmi_bridge_edid_read,
 };
 
-static int mtk_hdmi_get_cec_dev(struct mtk_hdmi *hdmi, struct device *dev, struct device_node *np)
-{
-	struct platform_device *cec_pdev;
-	struct device_node *cec_np;
-	int ret;
-
-	/* The CEC module handles HDMI hotplug detection */
-	cec_np = of_get_compatible_child(np->parent, "mediatek,mt8173-cec");
-	if (!cec_np)
-		return dev_err_probe(dev, -ENOTSUPP, "Failed to find CEC node\n");
-
-	cec_pdev = of_find_device_by_node(cec_np);
-	if (!cec_pdev) {
-		dev_err(hdmi->dev, "Waiting for CEC device %pOF\n", cec_np);
-		of_node_put(cec_np);
-		return -EPROBE_DEFER;
-	}
-	of_node_put(cec_np);
-
-	/*
-	 * The mediatek,syscon-hdmi property contains a phandle link to the
-	 * MMSYS_CONFIG device and the register offset of the HDMI_SYS_CFG
-	 * registers it contains.
-	 */
-	hdmi->sys_regmap = syscon_regmap_lookup_by_phandle(np, "mediatek,syscon-hdmi");
-	if (IS_ERR(hdmi->sys_regmap))
-		return PTR_ERR(hdmi->sys_regmap);
-
-	ret = of_property_read_u32_index(np, "mediatek,syscon-hdmi", 1, &hdmi->sys_offset);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to get system configuration registers\n");
-
-	hdmi->cec_dev = &cec_pdev->dev;
-	return 0;
-}
-
-static int mtk_hdmi_dt_parse_pdata(struct mtk_hdmi *hdmi, struct platform_device *pdev,
-				   const char * const *clk_names, size_t num_clocks)
-{
-	struct device *dev = &pdev->dev;
-	struct device_node *np = dev->of_node;
-	struct device_node *remote, *i2c_np;
-	int ret;
-
-	ret = mtk_hdmi_get_all_clk(hdmi, np, clk_names, num_clocks);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to get clocks\n");
-
-	hdmi->regs = device_node_to_regmap(dev->of_node);
-	if (IS_ERR(hdmi->regs))
-		return PTR_ERR(hdmi->regs);
-
-	remote = of_graph_get_remote_node(np, 1, 0);
-	if (!remote)
-		return -EINVAL;
-
-	if (!of_device_is_compatible(remote, "hdmi-connector")) {
-		hdmi->next_bridge = of_drm_find_bridge(remote);
-		if (!hdmi->next_bridge) {
-			dev_err(dev, "Waiting for external bridge\n");
-			of_node_put(remote);
-			return -EPROBE_DEFER;
-		}
-	}
-
-	i2c_np = of_parse_phandle(remote, "ddc-i2c-bus", 0);
-	of_node_put(remote);
-	if (!i2c_np)
-		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
-
-	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
-	of_node_put(i2c_np);
-	if (!hdmi->ddc_adpt)
-		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
-
-	ret = mtk_hdmi_get_cec_dev(hdmi, dev, np);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 /*
  * HDMI audio codec callbacks
  */
 
-static int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi,
-				 struct hdmi_codec_daifmt *daifmt,
-				 struct hdmi_codec_params *params)
-{
-	struct hdmi_audio_param aud_params = { 0 };
-	unsigned int chan = params->cea.channels;
-
-	dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
-		params->sample_rate, params->sample_width, chan);
-
-	if (!hdmi->bridge.encoder)
-		return -ENODEV;
-
-	switch (chan) {
-	case 2:
-		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
-		break;
-	case 4:
-		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
-		break;
-	case 6:
-		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
-		break;
-	case 8:
-		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
-		break;
-	default:
-		dev_err(hdmi->dev, "channel[%d] not supported!\n", chan);
-		return -EINVAL;
-	}
-
-	switch (params->sample_rate) {
-	case 32000:
-	case 44100:
-	case 48000:
-	case 88200:
-	case 96000:
-	case 176400:
-	case 192000:
-		break;
-	default:
-		dev_err(hdmi->dev, "rate[%d] not supported!\n",
-			params->sample_rate);
-		return -EINVAL;
-	}
-
-	switch (daifmt->fmt) {
-	case HDMI_I2S:
-		aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-		aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-		aud_params.aud_input_type = HDMI_AUD_INPUT_I2S;
-		aud_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
-		aud_params.aud_mclk = HDMI_AUD_MCLK_128FS;
-		break;
-	case HDMI_SPDIF:
-		aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-		aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-		aud_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
-		break;
-	default:
-		dev_err(hdmi->dev, "%s: Invalid DAI format %d\n", __func__,
-			daifmt->fmt);
-		return -EINVAL;
-	}
-	memcpy(&aud_params.codec_params, params, sizeof(aud_params.codec_params));
-	memcpy(&hdmi->aud_param, &aud_params, sizeof(aud_params));
-
-	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
-		aud_params.aud_codec, aud_params.aud_input_type,
-		aud_params.aud_input_chan_type, aud_params.codec_params.sample_rate);
-
-	return 0;
-}
-
 static int mtk_hdmi_audio_hw_params(struct device *dev, void *data,
 				    struct hdmi_codec_daifmt *daifmt,
 				    struct hdmi_codec_params *params)
@@ -1553,26 +1134,6 @@ mtk_hdmi_audio_mute(struct device *dev, void *data,
 	return 0;
 }
 
-static int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size_t len)
-{
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-
-	if (hdmi->enabled)
-		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
-	else
-		memset(buf, 0, len);
-	return 0;
-}
-
-static void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
-					  struct device *codec_dev)
-{
-	mutex_lock(&hdmi->update_plugged_status_lock);
-	hdmi->plugged_cb = fn;
-	hdmi->codec_dev = codec_dev;
-	mutex_unlock(&hdmi->update_plugged_status_lock);
-}
-
 static int mtk_hdmi_audio_hook_plugged_cb(struct device *dev, void *data,
 					  hdmi_codec_plugged_cb fn,
 					  struct device *codec_dev)
@@ -1594,100 +1155,18 @@ static const struct hdmi_codec_ops mtk_hdmi_audio_codec_ops = {
 	.hook_plugged_cb = mtk_hdmi_audio_hook_plugged_cb,
 };
 
-static void mtk_hdmi_unregister_audio_driver(void *data)
-{
-	platform_device_unregister(data);
-}
-
-static int mtk_hdmi_register_audio_driver(struct device *dev)
-{
-	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
-	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
-	struct hdmi_codec_pdata codec_data = {
-		.ops = &mtk_hdmi_audio_codec_ops,
-		.max_i2s_channels = 2,
-		.i2s = 1,
-		.data = hdmi,
-		.no_capture_mute = 1,
-	};
-	int ret;
-
-	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
-	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
-	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
-	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
-	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
-	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
-
-	hdmi->audio_pdev = platform_device_register_data(dev,
-							 HDMI_CODEC_DRV_NAME,
-							 PLATFORM_DEVID_AUTO,
-							 &codec_data,
-							 sizeof(codec_data));
-	if (IS_ERR(hdmi->audio_pdev))
-		return PTR_ERR(hdmi->audio_pdev);
-
-	ret = devm_add_action_or_reset(dev, mtk_hdmi_unregister_audio_driver,
-				       hdmi->audio_pdev);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
 static int mtk_hdmi_probe(struct platform_device *pdev)
 {
 	struct mtk_hdmi *hdmi;
-	struct device *dev = &pdev->dev;
-	const int num_clocks = MTK_HDMI_CLK_COUNT;
-	int ret;
-
-	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
-	if (!hdmi)
-		return -ENOMEM;
 
-	hdmi->dev = dev;
-	hdmi->conf = of_device_get_match_data(dev);
+	hdmi = mtk_hdmi_common_probe(pdev);
+	if (IS_ERR(hdmi))
+		return PTR_ERR(hdmi);
 
-	hdmi->clk = devm_kcalloc(dev, num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
-	if (!hdmi->clk)
-		return -ENOMEM;
-
-	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, mtk_hdmi_clk_names, num_clocks);
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
-	hdmi->bridge.vendor = "MediaTek";
-	hdmi->bridge.product = "On-Chip HDMI";
-
-	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
-	if (ret)
-		return dev_err_probe(dev, ret, "Failed to add bridge\n");
+	if (!hdmi->cec_dev)
+		return dev_err_probe(hdmi->dev, -ENODEV, "CEC is required by HDMIv1\n");
 
-	ret = mtk_hdmi_clk_enable_audio(hdmi);
-	if (ret)
-		return dev_err_probe(dev, ret,
-				     "Failed to enable audio clocks\n");
-
-	return 0;
+	return mtk_hdmi_clk_enable_audio(hdmi);
 }
 
 static void mtk_hdmi_remove(struct platform_device *pdev)
@@ -1715,19 +1194,32 @@ static __maybe_unused int mtk_hdmi_resume(struct device *dev)
 
 static SIMPLE_DEV_PM_OPS(mtk_hdmi_pm_ops, mtk_hdmi_suspend, mtk_hdmi_resume);
 
+static const struct mtk_hdmi_ver_conf mtk_hdmi_v1_ver_conf = {
+	.bridge_funcs = &mtk_hdmi_bridge_funcs,
+	.codec_ops = &mtk_hdmi_audio_codec_ops,
+	.mtk_hdmi_clock_names = mtk_hdmi_clk_names,
+	.num_clocks = ARRAY_SIZE(mtk_hdmi_clk_names)
+};
+
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt2701 = {
 	.tz_disabled = true,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8167 = {
-	.max_mode_clock = 148500,
 	.cea_modes_only = true,
+	.max_mode_clock = 148500,
+	.ver_conf = &mtk_hdmi_v1_ver_conf
+};
+
+static const struct mtk_hdmi_conf mtk_hdmi_conf_mt8173 = {
+	.ver_conf = &mtk_hdmi_v1_ver_conf
 };
 
 static const struct of_device_id mtk_hdmi_of_ids[] = {
 	{ .compatible = "mediatek,mt2701-hdmi", .data = &mtk_hdmi_conf_mt2701 },
 	{ .compatible = "mediatek,mt8167-hdmi", .data = &mtk_hdmi_conf_mt8167 },
-	{ .compatible = "mediatek,mt8173-hdmi" },
+	{ .compatible = "mediatek,mt8173-hdmi", .data = &mtk_hdmi_conf_mt8173 },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, mtk_hdmi_of_ids);
@@ -1747,3 +1239,4 @@ MODULE_AUTHOR("Jie Qiu <jie.qiu@mediatek.com>");
 MODULE_DESCRIPTION("MediaTek HDMI Driver");
 MODULE_LICENSE("GPL v2");
 MODULE_IMPORT_NS("DRM_MTK_HDMI_V1");
+MODULE_IMPORT_NS("DRM_MTK_HDMI");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.c b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
new file mode 100644
index 000000000000..7dc7ba46f44d
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.c
@@ -0,0 +1,426 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2014 MediaTek Inc.
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
+	{  25175, {  4576,  7007,  6864 } },
+	{  74176, { 11648, 17836, 11648 } },
+	{ 148352, { 11648,  8918,  5824 } },
+	{ 296703, {  5824,  4459,  5824 } },
+	{ 297000, {  3072,  4704,  5120 } },
+	{      0, {  4096,  6272,  6144 } }, /* all other TMDS clocks */
+};
+
+/**
+ * hdmi_recommended_n() - Return N value recommended by HDMI specification
+ * @freq: audio sample rate in Hz
+ * @clock: rounded TMDS clock in kHz
+ */
+static unsigned int hdmi_recommended_n(unsigned int freq, unsigned int clock)
+{
+	const struct hdmi_acr_n *recommended;
+	unsigned int i;
+
+	for (i = 0; i < ARRAY_SIZE(hdmi_rec_n_table) - 1; i++) {
+		if (clock == hdmi_rec_n_table[i].clock)
+			break;
+	}
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
+		return 25174825;	/* 25.2/1.001 MHz */
+	case 74176:
+		return 74175824;	/* 74.25/1.001 MHz */
+	case 148352:
+		return 148351648;	/* 148.5/1.001 MHz */
+	case 296703:
+		return 296703297;	/* 297/1.001 MHz */
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
+void mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
+		       unsigned int *n, unsigned int *cts)
+{
+	*n = hdmi_recommended_n(sample_rate, clock);
+	*cts = hdmi_expected_cts(sample_rate, clock, *n);
+}
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_get_ncts, "DRM_MTK_HDMI");
+
+int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi,
+			  struct hdmi_codec_daifmt *daifmt,
+			  struct hdmi_codec_params *params)
+{
+	struct hdmi_audio_param aud_params = { 0 };
+	unsigned int chan = params->cea.channels;
+
+	dev_dbg(hdmi->dev, "%s: %u Hz, %d bit, %d channels\n", __func__,
+		params->sample_rate, params->sample_width, chan);
+
+	if (!hdmi->bridge.encoder)
+		return -ENODEV;
+
+	switch (chan) {
+	case 2:
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
+		break;
+	case 4:
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_4_0;
+		break;
+	case 6:
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_5_1;
+		break;
+	case 8:
+		aud_params.aud_input_chan_type = HDMI_AUD_CHAN_TYPE_7_1;
+		break;
+	default:
+		dev_err(hdmi->dev, "channel[%d] not supported!\n", chan);
+		return -EINVAL;
+	}
+
+	switch (params->sample_rate) {
+	case 32000:
+	case 44100:
+	case 48000:
+	case 88200:
+	case 96000:
+	case 176400:
+	case 192000:
+		break;
+	default:
+		dev_err(hdmi->dev, "rate[%d] not supported!\n",
+			params->sample_rate);
+		return -EINVAL;
+	}
+
+	switch (daifmt->fmt) {
+	case HDMI_I2S:
+		aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+		aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		aud_params.aud_input_type = HDMI_AUD_INPUT_I2S;
+		aud_params.aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+		aud_params.aud_mclk = HDMI_AUD_MCLK_128FS;
+		break;
+	case HDMI_SPDIF:
+		aud_params.aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+		aud_params.aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+		aud_params.aud_input_type = HDMI_AUD_INPUT_SPDIF;
+		break;
+	default:
+		dev_err(hdmi->dev, "%s: Invalid DAI format %d\n", __func__,
+			daifmt->fmt);
+		return -EINVAL;
+	}
+	memcpy(&aud_params.codec_params, params, sizeof(aud_params.codec_params));
+	memcpy(&hdmi->aud_param, &aud_params, sizeof(aud_params));
+
+	dev_dbg(hdmi->dev, "codec:%d, input:%d, channel:%d, fs:%d\n",
+		aud_params.aud_codec, aud_params.aud_input_type,
+		aud_params.aud_input_chan_type, aud_params.codec_params.sample_rate);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_audio_params, "DRM_MTK_HDMI");
+
+int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size_t len)
+{
+	struct mtk_hdmi *hdmi = dev_get_drvdata(dev);
+
+	if (hdmi->enabled)
+		memcpy(buf, hdmi->curr_conn->eld, min(sizeof(hdmi->curr_conn->eld), len));
+	else
+		memset(buf, 0, len);
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_audio_get_eld, "DRM_MTK_HDMI");
+
+void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
+				   struct device *codec_dev)
+{
+	mutex_lock(&hdmi->update_plugged_status_lock);
+	hdmi->plugged_cb = fn;
+	hdmi->codec_dev = codec_dev;
+	mutex_unlock(&hdmi->update_plugged_status_lock);
+}
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_audio_set_plugged_cb, "DRM_MTK_HDMI");
+
+static int mtk_hdmi_get_all_clk(struct mtk_hdmi *hdmi, struct device_node *np,
+				const char * const *clock_names, size_t num_clocks)
+{
+	int i;
+
+	for (i = 0; i < num_clocks; i++) {
+		hdmi->clk[i] = of_clk_get_by_name(np, clock_names[i]);
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
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_bridge_mode_fixup, "DRM_MTK_HDMI");
+
+void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			      const struct drm_display_mode *mode,
+			      const struct drm_display_mode *adjusted_mode)
+{
+	struct mtk_hdmi *hdmi = hdmi_ctx_from_bridge(bridge);
+
+	dev_dbg(hdmi->dev, "cur info: name:%s, hdisplay:%d\n",
+		adjusted_mode->name, adjusted_mode->hdisplay);
+	dev_dbg(hdmi->dev, "hsync_start:%d,hsync_end:%d, htotal:%d",
+		adjusted_mode->hsync_start, adjusted_mode->hsync_end,
+		adjusted_mode->htotal);
+	dev_dbg(hdmi->dev, "hskew:%d, vdisplay:%d\n",
+		adjusted_mode->hskew, adjusted_mode->vdisplay);
+	dev_dbg(hdmi->dev, "vsync_start:%d, vsync_end:%d, vtotal:%d",
+		adjusted_mode->vsync_start, adjusted_mode->vsync_end,
+		adjusted_mode->vtotal);
+	dev_dbg(hdmi->dev, "vscan:%d, flag:%d\n",
+		adjusted_mode->vscan, adjusted_mode->flags);
+
+	drm_mode_copy(&hdmi->mode, adjusted_mode);
+}
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_bridge_mode_set, "DRM_MTK_HDMI");
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
+	hdmi->regs = device_node_to_regmap(dev->of_node);
+	if (IS_ERR(hdmi->regs))
+		return PTR_ERR(hdmi->regs);
+
+	remote = of_graph_get_remote_node(np, 1, 0);
+	if (!remote)
+		return -EINVAL;
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
+	of_node_put(remote);
+	if (!i2c_np)
+		return dev_err_probe(dev, -EINVAL, "No ddc-i2c-bus in connector\n");
+
+	hdmi->ddc_adpt = of_find_i2c_adapter_by_node(i2c_np);
+	of_node_put(i2c_np);
+	if (!hdmi->ddc_adpt)
+		return dev_err_probe(dev, -EINVAL, "Failed to get ddc i2c adapter by node\n");
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
+	struct hdmi_audio_param *aud_param = &hdmi->aud_param;
+	struct hdmi_codec_pdata codec_data = {
+		.ops = hdmi->conf->ver_conf->codec_ops,
+		.max_i2s_channels = 2,
+		.i2s = 1,
+		.data = hdmi,
+	};
+	int ret;
+
+	aud_param->aud_codec = HDMI_AUDIO_CODING_TYPE_PCM;
+	aud_param->aud_sample_size = HDMI_AUDIO_SAMPLE_SIZE_16;
+	aud_param->aud_input_type = HDMI_AUD_INPUT_I2S;
+	aud_param->aud_i2s_fmt = HDMI_I2S_MODE_I2S_24BIT;
+	aud_param->aud_mclk = HDMI_AUD_MCLK_128FS;
+	aud_param->aud_input_chan_type = HDMI_AUD_CHAN_TYPE_2_0;
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
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev)
+{
+	const struct mtk_hdmi_ver_conf *ver_conf;
+	struct device *dev = &pdev->dev;
+	struct mtk_hdmi *hdmi;
+	int ret;
+
+	hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
+	if (!hdmi)
+		return ERR_PTR(-ENOMEM);
+
+	hdmi->dev = dev;
+	hdmi->conf = of_device_get_match_data(dev);
+	ver_conf = hdmi->conf->ver_conf;
+
+	hdmi->clk = devm_kcalloc(dev, ver_conf->num_clocks, sizeof(*hdmi->clk), GFP_KERNEL);
+	if (!hdmi->clk)
+		return ERR_PTR(-ENOMEM);
+
+	ret = mtk_hdmi_dt_parse_pdata(hdmi, pdev, ver_conf->mtk_hdmi_clock_names,
+				      ver_conf->num_clocks);
+	if (ret)
+		return ERR_PTR(ret);
+
+	hdmi->phy = devm_phy_get(dev, "hdmi");
+	if (IS_ERR(hdmi->phy))
+		return dev_err_cast_probe(dev, hdmi->phy, "Failed to get HDMI PHY\n");
+
+	mutex_init(&hdmi->update_plugged_status_lock);
+	platform_set_drvdata(pdev, hdmi);
+
+	ret = mtk_hdmi_register_audio_driver(dev);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret, "Cannot register HDMI Audio driver\n");
+
+	hdmi->bridge.funcs = ver_conf->bridge_funcs;
+	hdmi->bridge.of_node = pdev->dev.of_node;
+	hdmi->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID
+			 | DRM_BRIDGE_OP_HPD;
+	hdmi->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
+	hdmi->bridge.vendor = "MediaTek";
+	hdmi->bridge.product = "On-Chip HDMI";
+
+	ret = devm_drm_bridge_add(dev, &hdmi->bridge);
+	if (ret)
+		return dev_err_ptr_probe(dev, ret, "Failed to add bridge\n");
+
+	return hdmi;
+}
+EXPORT_SYMBOL_NS_GPL(mtk_hdmi_common_probe, "DRM_MTK_HDMI");
+
+MODULE_AUTHOR("AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>");
+MODULE_DESCRIPTION("MediaTek HDMI Common Library");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_common.h b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
new file mode 100644
index 000000000000..d3de8afff40f
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_common.h
@@ -0,0 +1,188 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2021 MediaTek Inc.
+ * Copyright (c) 2024 Collabora Ltd.
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
+struct mtk_hdmi_ver_conf {
+	const struct drm_bridge_funcs *bridge_funcs;
+	const struct hdmi_codec_ops *codec_ops;
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
+struct mtk_hdmi {
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_connector *curr_conn;/* current connector (only valid when 'enabled') */
+	struct device *dev;
+	const struct mtk_hdmi_conf *conf;
+	struct phy *phy;
+	struct device *cec_dev;
+	struct i2c_adapter *ddc_adpt;
+	struct clk **clk;
+	struct drm_display_mode mode;
+	bool dvi_mode;
+	struct regmap *sys_regmap;
+	unsigned int sys_offset;
+	struct regmap *regs;
+	struct platform_device *audio_pdev;
+	struct hdmi_audio_param aud_param;
+	bool audio_enable;
+	bool powered;
+	bool enabled;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct device *codec_dev;
+	struct mutex update_plugged_status_lock;
+};
+
+static inline struct mtk_hdmi *hdmi_ctx_from_bridge(struct drm_bridge *b)
+{
+	return container_of(b, struct mtk_hdmi, bridge);
+}
+
+
+int mtk_hdmi_audio_get_eld(struct device *dev, void *data, uint8_t *buf, size_t len);
+void mtk_hdmi_audio_set_plugged_cb(struct mtk_hdmi *hdmi, hdmi_codec_plugged_cb fn,
+				   struct device *codec_dev);
+int mtk_hdmi_audio_params(struct mtk_hdmi *hdmi, struct hdmi_codec_daifmt *daifmt,
+			  struct hdmi_codec_params *params);
+void mtk_hdmi_get_ncts(unsigned int sample_rate, unsigned int clock,
+		       unsigned int *n, unsigned int *cts);
+bool mtk_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				const struct drm_display_mode *mode,
+				struct drm_display_mode *adjusted_mode);
+void mtk_hdmi_bridge_mode_set(struct drm_bridge *bridge,
+			      const struct drm_display_mode *mode,
+			      const struct drm_display_mode *adjusted_mode);
+struct mtk_hdmi *mtk_hdmi_common_probe(struct platform_device *pdev);
+#endif /* _MTK_HDMI_COMMON_H */
-- 
2.47.0

