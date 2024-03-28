Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846F9879120
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 10:41:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AD30112D53;
	Tue, 12 Mar 2024 09:41:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="Me3+7Xpk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D9B1129E6
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 09:41:40 +0000 (UTC)
Received: from [127.0.1.1] (91-154-34-181.elisa-laajakaista.fi [91.154.34.181])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id B9CC829E2;
 Tue, 12 Mar 2024 10:41:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1710236478;
 bh=Omq365Kj1al0RkJPvgZIzFzSXcfY8a+g04YUU/Wsn9U=;
 h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
 b=Me3+7XpkCvjOmgD0iGPMOG+c4XkBqN0bc8kelLSJ8HoS5h6iy9y3GEdh62J6Nd1EF
 p1p8TShvn5hXfT35+wbZqnoccgczZzAD8C+/DpqfUWd5S4WBrXSvKcRx69/xin9707
 l4Dl5o1nGYUzJw1LE3rZZ8RfreGS9Mv/MOILGS9s=
From: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Date: Tue, 12 Mar 2024 11:41:05 +0200
Subject: [PATCH 4/4] drm: xlnx: zynqmp_dpsub: Add DP audio support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240312-xilinx-dp-audio-v1-4-696c79facbb9@ideasonboard.com>
References: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
In-Reply-To: <20240312-xilinx-dp-audio-v1-0-696c79facbb9@ideasonboard.com>
To: Lars-Peter Clausen <lars@metafoo.de>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Vishal Sagar <vishal.sagar@amd.com>, 
 Anatoliy Klymenko <anatoliy.klymenko@amd.com>, 
 =?utf-8?q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=26252;
 i=tomi.valkeinen@ideasonboard.com; h=from:subject:message-id;
 bh=Omq365Kj1al0RkJPvgZIzFzSXcfY8a+g04YUU/Wsn9U=;
 b=owEBbQKS/ZANAwAIAfo9qoy8lh71AcsmYgBl8CNLlRoaCNVfWP0CGafK1Yxc07VRaLJU+Pgye
 tud1l/qSaCJAjMEAAEIAB0WIQTEOAw+ll79gQef86f6PaqMvJYe9QUCZfAjSwAKCRD6PaqMvJYe
 9VZgD/9N8M11mqaqbMhXHn3c5tjP3xXHrh3dN+R2Is6wPKduw1MSg5A/JIRtEZ3lNd5dmw8d/4F
 dwTWacYjZ5UwCSGQQMSOgtZNvdIqSXcrNJ85DfwGZv4kPhCVMeFpbitHcs8uJUJUvNblUscpeud
 35x2LdrESkTNp+rbwaIeEbDZHA0bFYUhrMj8gNpiVqaUsDmaZcKsiVaR9a9QBNiQRvI+IFrO0nl
 +7sAXSiIcuZiY0mPRZsVbpnMQnlJs4PXL6quEJr+XW0t/bk5ct/ei9hhYHnbT/eXX45dtXaIS1j
 vQ0mLPz/spqHKdUcRLLo6/NtVxms24I7L3x9tds3ApiiOL4H0GdvejgrrrI62dJN1bsFqekWCxq
 oziX1Khk9WP2K1sde53QI0m/AIIQLsbClXzSgDOrRmdW2T7MU6E4a5Rmc3k0wLJbNxsJ9Iz+0lk
 2CODLf+FllwzoaRHzls2pMvDrJnVRsTsc+LEpZ+cQebXRHjhU2RggbOPyUsXq9+xWWfjR30tnYl
 P45u1dFoZL4RgCEG2JfVlnDTJRCucYd1nL034tNLiE2Lpzxrsp6Ptlv2XvqM5c4QYF4qFzXcXAb
 Tz8512AK5A2thnZxPx3c747XUCxgZqceLC6WiIGMd6O0grlsQOVfeoPHSPBxdNhiD9foAVdo0td
 hAsqYq5Czb/4U5A==
X-Developer-Key: i=tomi.valkeinen@ideasonboard.com; a=openpgp;
 fpr=C4380C3E965EFD81079FF3A7FA3DAA8CBC961EF5
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

Add basic DisplayPort audio support.

Support non-live audio playback from two PCMs (DMA channels), and the
volume control in the audio mixer.

As older dtb files may not have the audio DMA channels defined, the
driver will just mark the audio support as disabled if the audio DMA is
missing, and will continue with only display support.

Note: Reset doesn't seem to work (ZYNQMP_DISP_AUD_SOFT_RESET). If we do
a reset, audio playback won't start again even if, afaics, we do set up
all the necessary registers. So, at the moment, resetting the audio
block in dp_dai_hw_free() is commented out.

Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
---
 drivers/gpu/drm/xlnx/Kconfig            |   9 +
 drivers/gpu/drm/xlnx/Makefile           |   1 +
 drivers/gpu/drm/xlnx/zynqmp_disp.c      |  50 ----
 drivers/gpu/drm/xlnx/zynqmp_disp_regs.h |   7 +-
 drivers/gpu/drm/xlnx/zynqmp_dp.c        |  54 ++--
 drivers/gpu/drm/xlnx/zynqmp_dp.h        |   7 +
 drivers/gpu/drm/xlnx/zynqmp_dp_audio.c  | 461 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/xlnx/zynqmp_dpsub.c     |  39 +--
 drivers/gpu/drm/xlnx/zynqmp_dpsub.h     |  15 +-
 9 files changed, 540 insertions(+), 103 deletions(-)

diff --git a/drivers/gpu/drm/xlnx/Kconfig b/drivers/gpu/drm/xlnx/Kconfig
index 68ee897de9d7..d88cfbaf2863 100644
--- a/drivers/gpu/drm/xlnx/Kconfig
+++ b/drivers/gpu/drm/xlnx/Kconfig
@@ -15,3 +15,12 @@ config DRM_ZYNQMP_DPSUB
 	  This is a DRM/KMS driver for ZynqMP DisplayPort controller. Choose
 	  this option if you have a Xilinx ZynqMP SoC with DisplayPort
 	  subsystem.
+
+config DRM_ZYNQMP_DPSUB_AUDIO
+	bool "ZynqMP DisplayPort Audio Support"
+	depends on DRM_ZYNQMP_DPSUB
+	depends on SND && SND_SOC
+	select SND_SOC_GENERIC_DMAENGINE_PCM
+	help
+	  Choose this option to enable DisplayPort audio support in the ZynqMP
+	  DisplayPort driver.
diff --git a/drivers/gpu/drm/xlnx/Makefile b/drivers/gpu/drm/xlnx/Makefile
index ea1422a39502..ab6e2ffd7e8d 100644
--- a/drivers/gpu/drm/xlnx/Makefile
+++ b/drivers/gpu/drm/xlnx/Makefile
@@ -1,2 +1,3 @@
 zynqmp-dpsub-y := zynqmp_disp.o zynqmp_dpsub.o zynqmp_dp.o zynqmp_kms.o
+zynqmp-dpsub-$(CONFIG_DRM_ZYNQMP_DPSUB_AUDIO) += zynqmp_dp_audio.o
 obj-$(CONFIG_DRM_ZYNQMP_DPSUB) += zynqmp-dpsub.o
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
index 407bc07cec69..d2bf0e2d0135 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
@@ -130,7 +130,6 @@ struct zynqmp_disp_layer {
  * @dpsub: Display subsystem
  * @blend.base: Register I/O base address for the blender
  * @avbuf.base: Register I/O base address for the audio/video buffer manager
- * @audio.base: Registers I/O base address for the audio mixer
  * @layers: Layers (planes)
  */
 struct zynqmp_disp {
@@ -143,9 +142,6 @@ struct zynqmp_disp {
 	struct {
 		void __iomem *base;
 	} avbuf;
-	struct {
-		void __iomem *base;
-	} audio;
 
 	struct zynqmp_disp_layer layers[ZYNQMP_DPSUB_NUM_LAYERS];
 };
@@ -807,42 +803,6 @@ static void zynqmp_disp_blend_layer_disable(struct zynqmp_disp *disp,
 					csc_zero_offsets);
 }
 
-/* -----------------------------------------------------------------------------
- * Audio Mixer
- */
-
-static void zynqmp_disp_audio_write(struct zynqmp_disp *disp, int reg, u32 val)
-{
-	writel(val, disp->audio.base + reg);
-}
-
-/**
- * zynqmp_disp_audio_enable - Enable the audio mixer
- * @disp: Display controller
- *
- * Enable the audio mixer by de-asserting the soft reset. The audio state is set to
- * default values by the reset, set the default mixer volume explicitly.
- */
-static void zynqmp_disp_audio_enable(struct zynqmp_disp *disp)
-{
-	/* Clear the audio soft reset register as it's an non-reset flop. */
-	zynqmp_disp_audio_write(disp, ZYNQMP_DISP_AUD_SOFT_RESET, 0);
-	zynqmp_disp_audio_write(disp, ZYNQMP_DISP_AUD_MIXER_VOLUME,
-				ZYNQMP_DISP_AUD_MIXER_VOLUME_NO_SCALE);
-}
-
-/**
- * zynqmp_disp_audio_disable - Disable the audio mixer
- * @disp: Display controller
- *
- * Disable the audio mixer by asserting its soft reset.
- */
-static void zynqmp_disp_audio_disable(struct zynqmp_disp *disp)
-{
-	zynqmp_disp_audio_write(disp, ZYNQMP_DISP_AUD_SOFT_RESET,
-				ZYNQMP_DISP_AUD_SOFT_RESET_AUD_SRST);
-}
-
 /* -----------------------------------------------------------------------------
  * ZynqMP Display Layer & DRM Plane
  */
@@ -1169,8 +1129,6 @@ void zynqmp_disp_enable(struct zynqmp_disp *disp)
 					     true);
 	zynqmp_disp_avbuf_enable_channels(disp);
 	zynqmp_disp_avbuf_enable_audio(disp);
-
-	zynqmp_disp_audio_enable(disp);
 }
 
 /**
@@ -1179,8 +1137,6 @@ void zynqmp_disp_enable(struct zynqmp_disp *disp)
  */
 void zynqmp_disp_disable(struct zynqmp_disp *disp)
 {
-	zynqmp_disp_audio_disable(disp);
-
 	zynqmp_disp_avbuf_disable_audio(disp);
 	zynqmp_disp_avbuf_disable_channels(disp);
 	zynqmp_disp_avbuf_disable(disp);
@@ -1249,12 +1205,6 @@ int zynqmp_disp_probe(struct zynqmp_dpsub *dpsub)
 		goto error;
 	}
 
-	disp->audio.base = devm_platform_ioremap_resource_byname(pdev, "aud");
-	if (IS_ERR(disp->audio.base)) {
-		ret = PTR_ERR(disp->audio.base);
-		goto error;
-	}
-
 	ret = zynqmp_disp_create_layers(disp);
 	if (ret)
 		goto error;
diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
index f92a006d5070..77cfa181a615 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_disp_regs.h
@@ -177,12 +177,7 @@
 #define ZYNQMP_DISP_AUD_MIXER_VOLUME			0x0
 #define ZYNQMP_DISP_AUD_MIXER_VOLUME_NO_SCALE		0x20002000
 #define ZYNQMP_DISP_AUD_MIXER_META_DATA			0x4
-#define ZYNQMP_DISP_AUD_CH_STATUS0			0x8
-#define ZYNQMP_DISP_AUD_CH_STATUS1			0xc
-#define ZYNQMP_DISP_AUD_CH_STATUS2			0x10
-#define ZYNQMP_DISP_AUD_CH_STATUS3			0x14
-#define ZYNQMP_DISP_AUD_CH_STATUS4			0x18
-#define ZYNQMP_DISP_AUD_CH_STATUS5			0x1c
+#define ZYNQMP_DISP_AUD_CH_STATUS(x)			(0x8 + ((x) * 4))
 #define ZYNQMP_DISP_AUD_CH_A_DATA0			0x20
 #define ZYNQMP_DISP_AUD_CH_A_DATA1			0x24
 #define ZYNQMP_DISP_AUD_CH_A_DATA2			0x28
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.c b/drivers/gpu/drm/xlnx/zynqmp_dp.c
index a0606fab0e22..4383ea93423c 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.c
@@ -1227,7 +1227,6 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 {
 	u8 lane_cnt = dp->mode.lane_cnt;
 	u32 reg, wpl;
-	unsigned int rate;
 
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_HTOTAL, mode->htotal);
 	zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_VTOTAL, mode->vtotal);
@@ -1252,18 +1251,8 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 		reg = drm_dp_bw_code_to_link_rate(dp->mode.bw_code);
 		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_N_VID, reg);
 		zynqmp_dp_write(dp, ZYNQMP_DP_MAIN_STREAM_M_VID, mode->clock);
-		rate = zynqmp_dpsub_get_audio_clk_rate(dp->dpsub);
-		if (rate) {
-			dev_dbg(dp->dev, "Audio rate: %d\n", rate / 512);
-			zynqmp_dp_write(dp, ZYNQMP_DP_TX_N_AUD, reg);
-			zynqmp_dp_write(dp, ZYNQMP_DP_TX_M_AUD, rate / 1000);
-		}
 	}
 
-	/* Only 2 channel audio is supported now */
-	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
-		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CHANNELS, 1);
-
 	zynqmp_dp_write(dp, ZYNQMP_DP_USER_PIX_WIDTH, 1);
 
 	/* Translate to the native 16 bit datapath based on IP core spec */
@@ -1272,6 +1261,44 @@ static void zynqmp_dp_encoder_mode_set_stream(struct zynqmp_dp *dp,
 	zynqmp_dp_write(dp, ZYNQMP_DP_USER_DATA_COUNT_PER_LANE, reg);
 }
 
+/* -----------------------------------------------------------------------------
+ * Audio
+ */
+
+void zynqmp_dp_audio_set_channels(struct zynqmp_dp *dp,
+				  unsigned int num_channels)
+{
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CHANNELS, num_channels - 1);
+}
+
+void zynqmp_dp_audio_enable(struct zynqmp_dp *dp)
+{
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 1);
+}
+
+void zynqmp_dp_audio_disable(struct zynqmp_dp *dp)
+{
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
+}
+
+void zynqmp_dp_audio_write_n_m(struct zynqmp_dp *dp)
+{
+	unsigned int rate;
+	u32 link_rate;
+
+	if (!(dp->config.misc0 & ZYNQMP_DP_MAIN_STREAM_MISC0_SYNC_LOCK))
+		return;
+
+	link_rate = drm_dp_bw_code_to_link_rate(dp->mode.bw_code);
+
+	rate = clk_get_rate(dp->dpsub->aud_clk);
+
+	dev_dbg(dp->dev, "Audio rate: %d\n", rate / 512);
+
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_N_AUD, link_rate);
+	zynqmp_dp_write(dp, ZYNQMP_DP_TX_M_AUD, rate / 1000);
+}
+
 /* -----------------------------------------------------------------------------
  * DISP Configuration
  */
@@ -1445,8 +1472,7 @@ static void zynqmp_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	/* Enable the encoder */
 	dp->enabled = true;
 	zynqmp_dp_update_misc(dp);
-	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
-		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 1);
+
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN, 0);
 	if (dp->status == connector_status_connected) {
 		for (i = 0; i < 3; i++) {
@@ -1479,8 +1505,6 @@ static void zynqmp_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 	drm_dp_dpcd_writeb(&dp->aux, DP_SET_POWER, DP_SET_POWER_D3);
 	zynqmp_dp_write(dp, ZYNQMP_DP_TX_PHY_POWER_DOWN,
 			ZYNQMP_DP_TX_PHY_POWER_DOWN_ALL);
-	if (zynqmp_dpsub_audio_enabled(dp->dpsub))
-		zynqmp_dp_write(dp, ZYNQMP_DP_TX_AUDIO_CONTROL, 0);
 
 	zynqmp_dp_disp_disable(dp, old_bridge_state);
 
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp.h b/drivers/gpu/drm/xlnx/zynqmp_dp.h
index f077d7fbd0ad..a3257793e23a 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dp.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp.h
@@ -22,4 +22,11 @@ void zynqmp_dp_disable_vblank(struct zynqmp_dp *dp);
 int zynqmp_dp_probe(struct zynqmp_dpsub *dpsub);
 void zynqmp_dp_remove(struct zynqmp_dpsub *dpsub);
 
+void zynqmp_dp_audio_set_channels(struct zynqmp_dp *dp,
+				  unsigned int num_channels);
+void zynqmp_dp_audio_enable(struct zynqmp_dp *dp);
+void zynqmp_dp_audio_disable(struct zynqmp_dp *dp);
+
+void zynqmp_dp_audio_write_n_m(struct zynqmp_dp *dp);
+
 #endif /* _ZYNQMP_DP_H_ */
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
new file mode 100644
index 000000000000..8fdab557f3b2
--- /dev/null
+++ b/drivers/gpu/drm/xlnx/zynqmp_dp_audio.c
@@ -0,0 +1,461 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * ZynqMP DisplayPort Subsystem Driver - Audio support
+ *
+ * Copyright (C) 2015 - 2023 Xilinx, Inc.
+ *
+ * Authors:
+ * - Hyun Woo Kwon <hyun.kwon@xilinx.com>
+ * - Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
+ */
+
+#include <linux/clk.h>
+#include <linux/device.h>
+#include <linux/mutex.h>
+#include <linux/pm_runtime.h>
+
+#include <sound/asoundef.h>
+#include <sound/core.h>
+#include <sound/dmaengine_pcm.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/soc.h>
+#include <sound/tlv.h>
+
+#include "zynqmp_disp_regs.h"
+#include "zynqmp_dp.h"
+#include "zynqmp_dpsub.h"
+
+#define ZYNQMP_DISP_AUD_SMPL_RATE_TO_CLK 512
+#define ZYNQMP_NUM_PCMS 2
+
+struct zynqmp_dpsub_audio {
+	void __iomem *base;
+
+	struct snd_soc_card card;
+
+	const char *dai_name;
+	const char *link_names[ZYNQMP_NUM_PCMS];
+	const char *pcm_names[ZYNQMP_NUM_PCMS];
+
+	struct snd_soc_dai_driver dai_driver;
+	struct snd_dmaengine_pcm_config pcm_configs[2];
+
+	struct snd_soc_dai_link links[ZYNQMP_NUM_PCMS];
+
+	struct {
+		struct snd_soc_dai_link_component cpu;
+		struct snd_soc_dai_link_component codec;
+		struct snd_soc_dai_link_component platform;
+	} components[ZYNQMP_NUM_PCMS];
+
+	/*
+	 * Protects:
+	 * - enabled_streams
+	 * - volumes
+	 * - current_rate
+	 */
+	struct mutex enable_lock;
+
+	u32 enabled_streams;
+	u32 current_rate;
+
+	u16 volumes[2];
+};
+
+static const struct snd_pcm_hardware zynqmp_dp_pcm_hw = {
+	.info = SNDRV_PCM_INFO_MMAP |
+		SNDRV_PCM_INFO_MMAP_VALID |
+		SNDRV_PCM_INFO_INTERLEAVED |
+		SNDRV_PCM_INFO_PAUSE |
+		SNDRV_PCM_INFO_RESUME |
+		SNDRV_PCM_INFO_NO_PERIOD_WAKEUP,
+
+	.buffer_bytes_max       = 128 * 1024,
+	.period_bytes_min       = 256,
+	.period_bytes_max       = 1024 * 1024,
+	.periods_min            = 2,
+	.periods_max            = 256,
+};
+
+static int zynqmp_dp_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime = substream->runtime;
+
+	snd_pcm_hw_constraint_step(runtime, 0, SNDRV_PCM_HW_PARAM_PERIOD_BYTES,
+				   256);
+
+	return 0;
+}
+
+static const struct snd_soc_ops zynqmp_dp_ops = {
+	.startup = zynqmp_dp_startup,
+};
+
+static void zynqmp_dp_audio_write(struct zynqmp_dpsub_audio *audio, int reg,
+				  u32 val)
+{
+	writel(val, audio->base + reg);
+}
+
+static int dp_dai_hw_params(struct snd_pcm_substream *substream,
+			    struct snd_pcm_hw_params *params,
+			    struct snd_soc_dai *socdai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct zynqmp_dpsub *dpsub =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+	struct zynqmp_dpsub_audio *audio = dpsub->audio;
+	int ret;
+	u32 sample_rate;
+	struct snd_aes_iec958 iec = { 0 };
+	unsigned long rate;
+
+	sample_rate = params_rate(params);
+
+	if (sample_rate != 48000 && sample_rate != 44100)
+		return -EINVAL;
+
+	mutex_lock(&audio->enable_lock);
+
+	if (audio->enabled_streams && audio->current_rate != sample_rate) {
+		dev_err(dpsub->dev,
+			"Can't change rate while playback enabled\n");
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	if (audio->enabled_streams > 0) {
+		/* Nothing to do */
+		audio->enabled_streams++;
+		mutex_unlock(&audio->enable_lock);
+		return 0;
+	}
+
+	audio->current_rate = sample_rate;
+
+	/* Note: clock rate can only be changed if the clock is disabled */
+	ret = clk_set_rate(dpsub->aud_clk,
+			   sample_rate * ZYNQMP_DISP_AUD_SMPL_RATE_TO_CLK);
+	if (ret) {
+		dev_err(dpsub->dev, "can't set aud_clk to %u err:%d\n",
+			sample_rate * ZYNQMP_DISP_AUD_SMPL_RATE_TO_CLK, ret);
+		goto err_unlock;
+	}
+
+	clk_prepare_enable(dpsub->aud_clk);
+
+	rate = clk_get_rate(dpsub->aud_clk);
+
+	/* Ignore some offset +- 10 */
+	if (abs(sample_rate * ZYNQMP_DISP_AUD_SMPL_RATE_TO_CLK - rate) > 10) {
+		dev_err(dpsub->dev, "aud_clk offset is higher: %ld\n",
+			sample_rate * ZYNQMP_DISP_AUD_SMPL_RATE_TO_CLK - rate);
+		clk_disable_unprepare(dpsub->aud_clk);
+		ret = -EINVAL;
+		goto err_unlock;
+	}
+
+	pm_runtime_get_sync(dpsub->dev);
+
+	zynqmp_dp_audio_write(audio, ZYNQMP_DISP_AUD_MIXER_VOLUME,
+			      audio->volumes[0] | (audio->volumes[1] << 16));
+
+	/* Clear the audio soft reset register as it's an non-reset flop. */
+	zynqmp_dp_audio_write(audio, ZYNQMP_DISP_AUD_SOFT_RESET, 0);
+
+	/* Only 2 channel audio is supported now */
+	zynqmp_dp_audio_set_channels(dpsub->dp, 2);
+
+	zynqmp_dp_audio_write_n_m(dpsub->dp);
+
+	/* Channel status */
+
+	if (sample_rate == 48000)
+		iec.status[3] = IEC958_AES3_CON_FS_48000;
+	else
+		iec.status[3] = IEC958_AES3_CON_FS_44100;
+
+	for (unsigned int i = 0; i < AES_IEC958_STATUS_SIZE / 4; ++i) {
+		u32 v;
+
+		v = (iec.status[(i * 4) + 0] << 0) |
+		    (iec.status[(i * 4) + 1] << 8) |
+		    (iec.status[(i * 4) + 2] << 16) |
+		    (iec.status[(i * 4) + 3] << 24);
+
+		zynqmp_dp_audio_write(audio, ZYNQMP_DISP_AUD_CH_STATUS(i), v);
+	}
+
+	zynqmp_dp_audio_enable(dpsub->dp);
+
+	audio->enabled_streams++;
+
+	mutex_unlock(&audio->enable_lock);
+
+	return 0;
+
+err_unlock:
+	mutex_unlock(&audio->enable_lock);
+	return ret;
+}
+
+static int dp_dai_hw_free(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *socdai)
+{
+	struct snd_soc_pcm_runtime *rtd = snd_soc_substream_to_rtd(substream);
+	struct zynqmp_dpsub *dpsub =
+		snd_soc_dai_get_drvdata(snd_soc_rtd_to_cpu(rtd, 0));
+	struct zynqmp_dpsub_audio *audio = dpsub->audio;
+
+	mutex_lock(&audio->enable_lock);
+
+	/* Nothing to do */
+	if (audio->enabled_streams > 1) {
+		audio->enabled_streams--;
+		mutex_unlock(&audio->enable_lock);
+		return 0;
+	}
+
+	pm_runtime_put(dpsub->dev);
+
+	zynqmp_dp_audio_disable(dpsub->dp);
+
+	/*
+	 * Reset doesn't work. If we assert reset between audio stop and start,
+	 * the audio won't start anymore. Probably we are missing writing
+	 * some audio related registers. A/B buf?
+	 */
+	/*
+	zynqmp_disp_audio_write(audio, ZYNQMP_DISP_AUD_SOFT_RESET,
+				ZYNQMP_DISP_AUD_SOFT_RESET_AUD_SRST);
+	*/
+
+	clk_disable_unprepare(dpsub->aud_clk);
+
+	audio->current_rate = 0;
+	audio->enabled_streams--;
+
+	mutex_unlock(&audio->enable_lock);
+
+	return 0;
+}
+
+static const struct snd_soc_dai_ops zynqmp_dp_dai_ops = {
+	.hw_params	= dp_dai_hw_params,
+	.hw_free	= dp_dai_hw_free,
+};
+
+/*
+ * Min = 10 * log10(0x1 / 0x2000) = -39.13
+ * Max = 10 * log10(0xffffff / 0x2000) = 9.03
+ */
+static const DECLARE_TLV_DB_RANGE(zynqmp_dp_tlv,
+	0x0, 0x0, TLV_DB_SCALE_ITEM(TLV_DB_GAIN_MUTE, -3913, 1),
+	0x1, 0x2000, TLV_DB_LINEAR_ITEM(-3913, 0),
+	0x2000, 0xffff, TLV_DB_LINEAR_ITEM(0, 903),
+);
+
+static const struct snd_kcontrol_new zynqmp_dp_snd_controls[] = {
+	SOC_SINGLE_TLV("Input0 Playback Volume", 0,
+		       0, 0xffff, 0, zynqmp_dp_tlv),
+	SOC_SINGLE_TLV("Input1 Playback Volume", 1,
+		       0, 0xffff, 0, zynqmp_dp_tlv),
+};
+
+/*
+ * Note: these read & write functions only support two "registers", 0 and 1,
+ * for volume 0 and 1. In other words, these are not real register read/write
+ * functions.
+ *
+ * This is done to support caching the volume value for the case where the
+ * hardware is not enabled, and also to support locking as volumes 0 and 1
+ * are in the same register.
+ */
+static unsigned int zynqmp_dp_dai_read(struct snd_soc_component *component,
+				       unsigned int reg)
+{
+	struct zynqmp_dpsub *dpsub = dev_get_drvdata(component->dev);
+	struct zynqmp_dpsub_audio *audio = dpsub->audio;
+
+	return audio->volumes[reg];
+}
+
+static int zynqmp_dp_dai_write(struct snd_soc_component *component,
+			       unsigned int reg, unsigned int val)
+{
+	struct zynqmp_dpsub *dpsub = dev_get_drvdata(component->dev);
+	struct zynqmp_dpsub_audio *audio = dpsub->audio;
+
+	mutex_lock(&audio->enable_lock);
+
+	audio->volumes[reg] = val;
+
+	if (audio->enabled_streams)
+		zynqmp_dp_audio_write(audio, ZYNQMP_DISP_AUD_MIXER_VOLUME,
+				      audio->volumes[0] |
+				      (audio->volumes[1] << 16));
+
+	mutex_unlock(&audio->enable_lock);
+
+	return 0;
+}
+
+static const struct snd_soc_component_driver zynqmp_dp_component_driver = {
+	.idle_bias_on		= 1,
+	.use_pmdown_time	= 1,
+	.endianness		= 1,
+	.controls		= zynqmp_dp_snd_controls,
+	.num_controls		= ARRAY_SIZE(zynqmp_dp_snd_controls),
+	.read			= zynqmp_dp_dai_read,
+	.write			= zynqmp_dp_dai_write,
+};
+
+int zynqmp_audio_init(struct zynqmp_dpsub *dpsub)
+{
+	struct platform_device *pdev = to_platform_device(dpsub->dev);
+	struct device *dev = dpsub->dev;
+	struct zynqmp_dpsub_audio *audio;
+	struct snd_soc_card *card;
+	void *dev_data;
+	int ret;
+
+	if (!dpsub->aud_clk)
+		return 0;
+
+	audio = devm_kzalloc(dev, sizeof(*audio), GFP_KERNEL);
+	if (!audio)
+		return -ENOMEM;
+
+	dpsub->audio = audio;
+
+	mutex_init(&audio->enable_lock);
+
+	/* 0x2000 is the zero level, no change */
+	audio->volumes[0] = 0x2000;
+	audio->volumes[1] = 0x2000;
+
+	audio->dai_name = devm_kasprintf(dev, GFP_KERNEL,
+					 "%s-dai", dev_name(dev));
+
+	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
+		audio->link_names[i] = devm_kasprintf(dev, GFP_KERNEL,
+						      "%s-dp-%u", dev_name(dev), i);
+		audio->pcm_names[i] = devm_kasprintf(dev, GFP_KERNEL,
+						     "%s-pcm-%u", dev_name(dev), i);
+	}
+
+	audio->base = devm_platform_ioremap_resource_byname(pdev, "aud");
+	if (IS_ERR(audio->base))
+		return PTR_ERR(audio->base);
+
+	/* Create CPU DAI */
+
+	audio->dai_driver = (struct snd_soc_dai_driver) {
+		.name		= audio->dai_name,
+		.ops		= &zynqmp_dp_dai_ops,
+		.playback	= {
+			.channels_min	= 2,
+			.channels_max	= 2,
+			.rates		= SNDRV_PCM_RATE_44100 | SNDRV_PCM_RATE_48000,
+			.formats	= SNDRV_PCM_FMTBIT_S16_LE,
+		},
+	};
+
+	ret = devm_snd_soc_register_component(dev, &zynqmp_dp_component_driver,
+					      &audio->dai_driver, 1);
+	if (ret) {
+		dev_err(dev, "Failed to register CPU DAI\n");
+		return ret;
+	}
+
+	/* Create PCMs */
+
+	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
+		struct snd_dmaengine_pcm_config *pcm_config =
+			&audio->pcm_configs[i];
+
+		*pcm_config = (struct snd_dmaengine_pcm_config){
+			.name = audio->pcm_names[i],
+			.pcm_hardware = &zynqmp_dp_pcm_hw,
+			.prealloc_buffer_size = 64 * 1024,
+			.chan_names[SNDRV_PCM_STREAM_PLAYBACK] =
+				i == 0 ? "aud0" : "aud1",
+		};
+
+		ret = devm_snd_dmaengine_pcm_register(dev, pcm_config, 0);
+		if (ret) {
+			dev_err(dev, "Failed to register PCM %u\n", i);
+			return ret;
+		}
+	}
+
+	/* Create card */
+
+	card = &audio->card;
+	card->name = "DisplayPort";
+	card->long_name = "DisplayPort Monitor";
+	card->driver_name = "zynqmp_dpsub";
+	card->dev = dev;
+	card->owner = THIS_MODULE;
+	card->num_links = ZYNQMP_NUM_PCMS;
+	card->dai_link = audio->links;
+
+	for (unsigned int i = 0; i < ZYNQMP_NUM_PCMS; ++i) {
+		struct snd_soc_dai_link *link = &card->dai_link[i];
+
+		link->ops = &zynqmp_dp_ops;
+
+		link->name = audio->link_names[i];
+		link->stream_name = audio->link_names[i];
+
+		link->cpus = &audio->components[i].cpu;
+		link->num_cpus = 1;
+		link->cpus[0].dai_name = audio->dai_name;
+
+		link->codecs = &audio->components[i].codec;
+		link->num_codecs = 1;
+		link->codecs[0].name = "snd-soc-dummy";
+		link->codecs[0].dai_name = "snd-soc-dummy-dai";
+
+		link->platforms = &audio->components[i].platform;
+		link->num_platforms = 1;
+		link->platforms[0].name = audio->pcm_names[i];
+	}
+
+	/*
+	 * HACK: devm_snd_soc_register_card() overwrites current drvdata
+	 * so we need to hack it back.
+	 */
+	dev_data = dev_get_drvdata(dev);
+	ret = devm_snd_soc_register_card(dev, card);
+	dev_set_drvdata(dev, dev_data);
+	if (ret) {
+		/*
+		 * As older dtbs may not have the audio channel dmas defined,
+		 * instead of returning an error here we'll continue and just
+		 * mark the audio as disabled.
+		 */
+		dev_err(dev, "Failed to register sound card, disabling audio support\n");
+
+		devm_kfree(dev, audio);
+		dpsub->audio = NULL;
+
+		return 0;
+	}
+
+	return 0;
+}
+
+void zynqmp_audio_uninit(struct zynqmp_dpsub *dpsub)
+{
+	struct zynqmp_dpsub_audio *audio = dpsub->audio;
+
+	if (!audio)
+		return;
+
+	if (!dpsub->aud_clk)
+		return;
+
+	mutex_destroy(&audio->enable_lock);
+}
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
index 88eb33acd5f0..2b7dd38d3def 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
@@ -56,36 +56,6 @@ static const struct dev_pm_ops zynqmp_dpsub_pm_ops = {
 	SET_SYSTEM_SLEEP_PM_OPS(zynqmp_dpsub_suspend, zynqmp_dpsub_resume)
 };
 
-/* -----------------------------------------------------------------------------
- * DPSUB Configuration
- */
-
-/**
- * zynqmp_dpsub_audio_enabled - If the audio is enabled
- * @dpsub: DisplayPort subsystem
- *
- * Return if the audio is enabled depending on the audio clock.
- *
- * Return: true if audio is enabled, or false.
- */
-bool zynqmp_dpsub_audio_enabled(struct zynqmp_dpsub *dpsub)
-{
-	return !!dpsub->aud_clk;
-}
-
-/**
- * zynqmp_dpsub_get_audio_clk_rate - Get the current audio clock rate
- * @dpsub: DisplayPort subsystem
- *
- * Return: the current audio clock rate.
- */
-unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub)
-{
-	if (zynqmp_dpsub_audio_enabled(dpsub))
-		return 0;
-	return clk_get_rate(dpsub->aud_clk);
-}
-
 /* -----------------------------------------------------------------------------
  * Probe & Remove
  */
@@ -264,10 +234,17 @@ static int zynqmp_dpsub_probe(struct platform_device *pdev)
 		drm_bridge_add(dpsub->bridge);
 	}
 
+	ret = zynqmp_audio_init(dpsub);
+	if (ret)
+		goto err_drm_cleanup;
+
 	dev_info(&pdev->dev, "ZynqMP DisplayPort Subsystem driver probed");
 
 	return 0;
 
+err_drm_cleanup:
+	if (dpsub->drm)
+		zynqmp_dpsub_drm_cleanup(dpsub);
 err_disp:
 	zynqmp_disp_remove(dpsub);
 err_dp:
@@ -286,6 +263,8 @@ static void zynqmp_dpsub_remove(struct platform_device *pdev)
 {
 	struct zynqmp_dpsub *dpsub = platform_get_drvdata(pdev);
 
+	zynqmp_audio_uninit(dpsub);
+
 	if (dpsub->drm)
 		zynqmp_dpsub_drm_cleanup(dpsub);
 	else
diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
index 09ea01878f2a..9951d0176476 100644
--- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
+++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.h
@@ -12,6 +12,8 @@
 #ifndef _ZYNQMP_DPSUB_H_
 #define _ZYNQMP_DPSUB_H_
 
+#include <linux/types.h>
+
 struct clk;
 struct device;
 struct drm_bridge;
@@ -39,6 +41,8 @@ enum zynqmp_dpsub_format {
 	ZYNQMP_DPSUB_FORMAT_YONLY,
 };
 
+struct zynqmp_dpsub_audio;
+
 /**
  * struct zynqmp_dpsub - ZynqMP DisplayPort Subsystem
  * @dev: The physical device
@@ -76,10 +80,17 @@ struct zynqmp_dpsub {
 	struct zynqmp_dp *dp;
 
 	unsigned int dma_align;
+
+	struct zynqmp_dpsub_audio *audio;
 };
 
-bool zynqmp_dpsub_audio_enabled(struct zynqmp_dpsub *dpsub);
-unsigned int zynqmp_dpsub_get_audio_clk_rate(struct zynqmp_dpsub *dpsub);
+#ifdef CONFIG_DRM_ZYNQMP_DPSUB_AUDIO
+int zynqmp_audio_init(struct zynqmp_dpsub *dpsub);
+void zynqmp_audio_uninit(struct zynqmp_dpsub *dpsub);
+#else
+static inline int zynqmp_audio_init(struct zynqmp_dpsub *dpsub) { return 0; }
+static inline void zynqmp_audio_uninit(struct zynqmp_dpsub *dpsub) { }
+#endif
 
 void zynqmp_dpsub_release(struct zynqmp_dpsub *dpsub);
 

-- 
2.34.1

