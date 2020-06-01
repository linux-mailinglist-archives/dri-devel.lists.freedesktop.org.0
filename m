Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B42251E9E3A
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jun 2020 08:29:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E23E6E03E;
	Mon,  1 Jun 2020 06:29:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from inva021.nxp.com (inva021.nxp.com [92.121.34.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82E406E03E
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jun 2020 06:29:44 +0000 (UTC)
Received: from inva021.nxp.com (localhost [127.0.0.1])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 85D322004D7;
 Mon,  1 Jun 2020 08:23:19 +0200 (CEST)
Received: from invc005.ap-rdc01.nxp.com (invc005.ap-rdc01.nxp.com
 [165.114.16.14])
 by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 71D232004B9;
 Mon,  1 Jun 2020 08:23:13 +0200 (CEST)
Received: from localhost.localdomain (mega.ap.freescale.net [10.192.208.232])
 by invc005.ap-rdc01.nxp.com (Postfix) with ESMTP id 44904402E8;
 Mon,  1 Jun 2020 14:23:06 +0800 (SGT)
From: sandor.yu@nxp.com
To: a.hajda@samsung.com, narmstrong@baylibre.com,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@siol.net, heiko@sntech.de, hjc@rock-chips.com,
 Sandor.yu@nxp.com, dkos@cadence.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 2/7] drm: bridge: cadence: Create cadence fold
Date: Mon,  1 Jun 2020 14:17:32 +0800
Message-Id: <a189cd4b68fe822f236d6d3585de0aea5554706a.1590982881.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
In-Reply-To: <cover.1590982881.git.Sandor.yu@nxp.com>
References: <cover.1590982881.git.Sandor.yu@nxp.com>
X-Virus-Scanned: ClamAV using ClamSMTP
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
Cc: linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Sandor Yu <Sandor.yu@nxp.com>

Create new directory drm/bridge/cadence.
Cadence MHDP DP and HDMI bridge dirver will added later.

drm/rockchip/cdn-dp-reg.c will separate to three files.
 - cdns-mhdp-common.c: Provide basic MHDP register read/write via mailbox.
   public firmware load, event, edid and HPD functions that will be
   refered in MHDP DP and HDMI drivers.
 - cdns-hdp-audio.c: MHDP Audio specific functions
 - cdns-mhdp-dp.c: MHDP DP specific functions, DPCD and link traning
   functions.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/Kconfig                |   2 +
 drivers/gpu/drm/bridge/Makefile               |   1 +
 drivers/gpu/drm/bridge/cadence/Kconfig        |   7 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   3 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-audio.c  | 198 +++++++++
 .../cadence/cdns-mhdp-common.c}               | 418 ++++--------------
 .../gpu/drm/bridge/cadence/cdns-mhdp-common.h |  23 +
 drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c | 174 ++++++++
 drivers/gpu/drm/rockchip/Kconfig              |   1 +
 drivers/gpu/drm/rockchip/Makefile             |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.c        |   2 +-
 drivers/gpu/drm/rockchip/cdn-dp-core.h        |   2 +-
 .../drm/bridge/cdns-mhdp.h                    |   9 +-
 13 files changed, 494 insertions(+), 348 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/Kconfig
 create mode 100644 drivers/gpu/drm/bridge/cadence/Makefile
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
 rename drivers/gpu/drm/{rockchip/cdn-dp-reg.c => bridge/cadence/cdns-mhdp-common.c} (64%)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
 rename drivers/gpu/drm/rockchip/cdn-dp-reg.h => include/drm/bridge/cdns-mhdp.h (98%)

diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
index aaed2347ace9..c764150fb228 100644
--- a/drivers/gpu/drm/bridge/Kconfig
+++ b/drivers/gpu/drm/bridge/Kconfig
@@ -184,6 +184,8 @@ source "drivers/gpu/drm/bridge/analogix/Kconfig"
 
 source "drivers/gpu/drm/bridge/adv7511/Kconfig"
 
+source "drivers/gpu/drm/bridge/cadence/Kconfig"
+
 source "drivers/gpu/drm/bridge/synopsys/Kconfig"
 
 endmenu
diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
index 6fb062b5b0f0..5d61c1d43b67 100644
--- a/drivers/gpu/drm/bridge/Makefile
+++ b/drivers/gpu/drm/bridge/Makefile
@@ -20,4 +20,5 @@ obj-$(CONFIG_DRM_TI_TFP410) += ti-tfp410.o
 obj-$(CONFIG_DRM_TI_TPD12S015) += ti-tpd12s015.o
 
 obj-y += analogix/
+obj-y += cadence/
 obj-y += synopsys/
diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
new file mode 100644
index 000000000000..48c1b0f77dc6
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -0,0 +1,7 @@
+config DRM_CDNS_MHDP
+	tristate "Cadence MHDP COMMON API driver"
+	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
+	depends on OF
+	help
+	  Support Cadence MHDP API library.
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
new file mode 100644
index 000000000000..ddb2ba4fb852
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0-only
+cdns_mhdp_drmcore-y := cdns-mhdp-common.o cdns-mhdp-audio.o cdns-mhdp-dp.o
+obj-$(CONFIG_DRM_CDNS_MHDP)		+= cdns_mhdp_drmcore.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
new file mode 100644
index 000000000000..8f51de0672ab
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-audio.c
@@ -0,0 +1,198 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Fuzhou Rockchip Electronics Co.Ltd
+ * Author: Chris Zhong <zyw@rock-chips.com>
+ */
+#include <linux/clk.h>
+#include <linux/reset.h>
+#include <drm/bridge/cdns-mhdp.h>
+#include <sound/hdmi-codec.h>
+#include <drm/drm_of.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
+
+#include "cdns-mhdp-common.h"
+
+#define CDNS_DP_SPDIF_CLK		200000000
+
+int cdns_mhdp_audio_stop(struct cdns_mhdp_device *mhdp, struct audio_info *audio)
+{
+	int ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, AUDIO_PACK_CONTROL, 0);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "audio stop failed: %d\n", ret);
+		return ret;
+	}
+
+	cdns_mhdp_bus_write(0, mhdp, SPDIF_CTRL_ADDR);
+
+	/* clearn the audio config and reset */
+	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNFG);
+	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, AUDIO_SRC_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNTL);
+
+	/* reset smpl2pckt component  */
+	cdns_mhdp_bus_write(0, mhdp, SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, SMPL2PKT_CNTL);
+
+	/* reset FIFO */
+	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, FIFO_CNTL);
+	cdns_mhdp_bus_write(0, mhdp, FIFO_CNTL);
+
+	if (audio->format == AFMT_SPDIF_INT)
+		clk_disable_unprepare(mhdp->spdif_clk);
+
+	return 0;
+}
+EXPORT_SYMBOL(cdns_mhdp_audio_stop);
+
+int cdns_mhdp_audio_mute(struct cdns_mhdp_device *mhdp, bool enable)
+{
+	int ret = true;
+
+	ret = cdns_mhdp_reg_write_bit(mhdp, DP_VB_ID, 4, 1, enable);
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "audio mute failed: %d\n", ret);
+
+	return ret;
+}
+EXPORT_SYMBOL(cdns_mhdp_audio_mute);
+
+static void cdns_mhdp_audio_config_i2s(struct cdns_mhdp_device *mhdp,
+				       struct audio_info *audio)
+{
+	int sub_pckt_num = 1, i2s_port_en_val = 0xf, i;
+	u32 val;
+
+	if (audio->channels == 2) {
+		if (mhdp->dp.num_lanes == 1)
+			sub_pckt_num = 2;
+		else
+			sub_pckt_num = 4;
+
+		i2s_port_en_val = 1;
+	} else if (audio->channels == 4) {
+		i2s_port_en_val = 3;
+	}
+
+	cdns_mhdp_bus_write(0x0, mhdp, SPDIF_CTRL_ADDR);
+
+	cdns_mhdp_bus_write(SYNC_WR_TO_CH_ZERO, mhdp, FIFO_CNTL);
+
+	val = MAX_NUM_CH(audio->channels);
+	val |= NUM_OF_I2S_PORTS(audio->channels);
+	val |= AUDIO_TYPE_LPCM;
+	val |= CFG_SUB_PCKT_NUM(sub_pckt_num);
+	cdns_mhdp_bus_write(val, mhdp, SMPL2PKT_CNFG);
+
+	if (audio->sample_width == 16)
+		val = 0;
+	else if (audio->sample_width == 24)
+		val = 1 << 9;
+	else
+		val = 2 << 9;
+
+	val |= AUDIO_CH_NUM(audio->channels);
+	val |= I2S_DEC_PORT_EN(i2s_port_en_val);
+	val |= TRANS_SMPL_WIDTH_32;
+	cdns_mhdp_bus_write(val, mhdp, AUDIO_SRC_CNFG);
+
+	for (i = 0; i < (audio->channels + 1) / 2; i++) {
+		if (audio->sample_width == 16)
+			val = (0x02 << 8) | (0x02 << 20);
+		else if (audio->sample_width == 24)
+			val = (0x0b << 8) | (0x0b << 20);
+
+		val |= ((2 * i) << 4) | ((2 * i + 1) << 16);
+		cdns_mhdp_bus_write(val, mhdp, STTS_BIT_CH(i));
+	}
+
+	switch (audio->sample_rate) {
+	case 32000:
+		val = SAMPLING_FREQ(3) |
+		      ORIGINAL_SAMP_FREQ(0xc);
+		break;
+	case 44100:
+		val = SAMPLING_FREQ(0) |
+		      ORIGINAL_SAMP_FREQ(0xf);
+		break;
+	case 48000:
+		val = SAMPLING_FREQ(2) |
+		      ORIGINAL_SAMP_FREQ(0xd);
+		break;
+	case 88200:
+		val = SAMPLING_FREQ(8) |
+		      ORIGINAL_SAMP_FREQ(0x7);
+		break;
+	case 96000:
+		val = SAMPLING_FREQ(0xa) |
+		      ORIGINAL_SAMP_FREQ(5);
+		break;
+	case 176400:
+		val = SAMPLING_FREQ(0xc) |
+		      ORIGINAL_SAMP_FREQ(3);
+		break;
+	case 192000:
+		val = SAMPLING_FREQ(0xe) |
+		      ORIGINAL_SAMP_FREQ(1);
+		break;
+	}
+	val |= 4;
+	cdns_mhdp_bus_write(val, mhdp, COM_CH_STTS_BITS);
+
+	cdns_mhdp_bus_write(SMPL2PKT_EN, mhdp, SMPL2PKT_CNTL);
+	cdns_mhdp_bus_write(I2S_DEC_START, mhdp, AUDIO_SRC_CNTL);
+}
+
+static void cdns_mhdp_audio_config_spdif(struct cdns_mhdp_device *mhdp)
+{
+	u32 val;
+
+	cdns_mhdp_bus_write(SYNC_WR_TO_CH_ZERO, mhdp, FIFO_CNTL);
+
+	val = MAX_NUM_CH(2) | AUDIO_TYPE_LPCM | CFG_SUB_PCKT_NUM(4);
+	cdns_mhdp_bus_write(val, mhdp, SMPL2PKT_CNFG);
+	cdns_mhdp_bus_write(SMPL2PKT_EN, mhdp, SMPL2PKT_CNTL);
+
+	val = SPDIF_ENABLE | SPDIF_AVG_SEL | SPDIF_JITTER_BYPASS;
+	cdns_mhdp_bus_write(val, mhdp, SPDIF_CTRL_ADDR);
+
+	clk_prepare_enable(mhdp->spdif_clk);
+	clk_set_rate(mhdp->spdif_clk, CDNS_DP_SPDIF_CLK);
+}
+
+int cdns_mhdp_audio_config(struct cdns_mhdp_device *mhdp,
+							struct audio_info *audio)
+{
+	int ret;
+
+	/* reset the spdif clk before config */
+	if (audio->format == AFMT_SPDIF_INT) {
+		reset_control_assert(mhdp->spdif_rst);
+		reset_control_deassert(mhdp->spdif_rst);
+	}
+
+	ret = cdns_mhdp_reg_write(mhdp, CM_LANE_CTRL, LANE_REF_CYC);
+	if (ret)
+		goto err_audio_config;
+
+	ret = cdns_mhdp_reg_write(mhdp, CM_CTRL, 0);
+	if (ret)
+		goto err_audio_config;
+
+	if (audio->format == AFMT_I2S)
+		cdns_mhdp_audio_config_i2s(mhdp, audio);
+	else if (audio->format == AFMT_SPDIF_INT)
+		cdns_mhdp_audio_config_spdif(mhdp);
+
+	ret = cdns_mhdp_reg_write(mhdp, AUDIO_PACK_CONTROL, AUDIO_PACK_EN);
+
+err_audio_config:
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "audio config failed: %d\n", ret);
+	return ret;
+}
+EXPORT_SYMBOL(cdns_mhdp_audio_config);
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
similarity index 64%
rename from drivers/gpu/drm/rockchip/cdn-dp-reg.c
rename to drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
index f7ccf93fe5e1..efb39cf5f48b 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.c
@@ -11,16 +11,14 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/reset.h>
-
-#include "cdn-dp-core.h"
-#include "cdn-dp-reg.h"
+#include <drm/bridge/cdns-mhdp.h>
+#include <drm/drm_modes.h>
+#include <drm/drm_print.h>
 
 #define CDNS_DP_SPDIF_CLK		200000000
 #define FW_ALIVE_TIMEOUT_US		1000000
 #define MAILBOX_RETRY_US		1000
 #define MAILBOX_TIMEOUT_US		5000000
-#define LINK_TRAINING_RETRY_MS		20
-#define LINK_TRAINING_TIMEOUT_MS	500
 
 u32 cdns_mhdp_bus_read(struct cdns_mhdp_device *mhdp, u32 offset)
 {
@@ -36,6 +34,7 @@ void cdns_mhdp_set_fw_clk(struct cdns_mhdp_device *mhdp, unsigned long clk)
 {
 	cdns_mhdp_bus_write(clk / 1000000, mhdp, SW_CLK_H);
 }
+EXPORT_SYMBOL(cdns_mhdp_set_fw_clk);
 
 void cdns_mhdp_clock_reset(struct cdns_mhdp_device *mhdp)
 {
@@ -85,6 +84,26 @@ void cdns_mhdp_clock_reset(struct cdns_mhdp_device *mhdp)
 	/* enable Mailbox and PIF interrupt */
 	cdns_mhdp_bus_write(0, mhdp, APB_INT_MASK);
 }
+EXPORT_SYMBOL(cdns_mhdp_clock_reset);
+
+bool cdns_mhdp_check_alive(struct cdns_mhdp_device *mhdp)
+{
+	u32  alive, newalive;
+	u8 retries_left = 50;
+
+	alive = cdns_mhdp_bus_read(mhdp, KEEP_ALIVE);
+
+	while (retries_left--) {
+		udelay(2);
+
+		newalive = cdns_mhdp_bus_read(mhdp, KEEP_ALIVE);
+		if (alive == newalive)
+			continue;
+		return true;
+	}
+	return false;
+}
+EXPORT_SYMBOL(cdns_mhdp_check_alive);
 
 static int mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
 {
@@ -190,6 +209,51 @@ int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
 	return 0;
 }
 
+int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr)
+{
+	u8 msg[4], resp[8];
+	u32 val;
+	int ret;
+
+	if (addr == 0) {
+		ret = -EINVAL;
+		goto err_reg_read;
+	}
+
+	put_unaligned_be32(addr, msg);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
+				     GENERAL_READ_REGISTER,
+				     sizeof(msg), msg);
+	if (ret)
+		goto err_reg_read;
+
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_GENERAL,
+						 GENERAL_READ_REGISTER,
+						 sizeof(resp));
+	if (ret)
+		goto err_reg_read;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, resp, sizeof(resp));
+	if (ret)
+		goto err_reg_read;
+
+	/* Returned address value should be the same as requested */
+	if (memcmp(msg, resp, sizeof(msg))) {
+		ret = -EINVAL;
+		goto err_reg_read;
+	}
+
+	val = get_unaligned_be32(resp + 4);
+
+	return val;
+
+err_reg_read:
+	DRM_DEV_ERROR(mhdp->dev, "Failed to read register.\n");
+
+	return ret;
+}
+
 int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32 val)
 {
 	u8 msg[8];
@@ -215,68 +279,6 @@ int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
 				      DPTX_WRITE_FIELD, sizeof(field), field);
 }
 
-int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
-			u32 addr, u8 *data, u16 len)
-{
-	u8 msg[5], reg[5];
-	int ret;
-
-	put_unaligned_be16(len, msg);
-	put_unaligned_be24(addr, msg + 2);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_READ_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto err_dpcd_read;
-
-	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
-						 DPTX_READ_DPCD,
-						 sizeof(reg) + len);
-	if (ret)
-		goto err_dpcd_read;
-
-	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto err_dpcd_read;
-
-	ret = cdns_mhdp_mailbox_read_receive(mhdp, data, len);
-
-err_dpcd_read:
-	return ret;
-}
-
-int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
-{
-	u8 msg[6], reg[5];
-	int ret;
-
-	put_unaligned_be16(1, msg);
-	put_unaligned_be24(addr, msg + 2);
-	msg[5] = value;
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto err_dpcd_write;
-
-	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
-						 DPTX_WRITE_DPCD, sizeof(reg));
-	if (ret)
-		goto err_dpcd_write;
-
-	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto err_dpcd_write;
-
-	if (addr != get_unaligned_be24(reg + 2))
-		ret = -EINVAL;
-
-err_dpcd_write:
-	if (ret)
-		DRM_DEV_ERROR(mhdp->dev, "dpcd write failed: %d\n", ret);
-	return ret;
-}
-
 int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp, const u32 *i_mem,
 			    u32 i_size, const u32 *d_mem, u32 d_size)
 {
@@ -318,6 +320,7 @@ int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp, const u32 *i_mem,
 
 	return 0;
 }
+EXPORT_SYMBOL(cdns_mhdp_load_firmware);
 
 int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 {
@@ -352,6 +355,7 @@ int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 		DRM_DEV_ERROR(mhdp->dev, "set firmware active failed\n");
 	return ret;
 }
+EXPORT_SYMBOL(cdns_mhdp_set_firmware_active);
 
 int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp, bool flip)
 {
@@ -381,6 +385,7 @@ int cdns_mhdp_set_host_cap(struct cdns_mhdp_device *mhdp, bool flip)
 		DRM_DEV_ERROR(mhdp->dev, "set host cap failed: %d\n", ret);
 	return ret;
 }
+EXPORT_SYMBOL(cdns_mhdp_set_host_cap);
 
 int cdns_mhdp_event_config(struct cdns_mhdp_device *mhdp)
 {
@@ -398,11 +403,13 @@ int cdns_mhdp_event_config(struct cdns_mhdp_device *mhdp)
 
 	return ret;
 }
+EXPORT_SYMBOL(cdns_mhdp_event_config);
 
 u32 cdns_mhdp_get_event(struct cdns_mhdp_device *mhdp)
 {
 	return cdns_mhdp_bus_read(mhdp, SW_EVENTS0);
 }
+EXPORT_SYMBOL(cdns_mhdp_get_event);
 
 int cdns_mhdp_read_hpd(struct cdns_mhdp_device *mhdp)
 {
@@ -429,6 +436,7 @@ int cdns_mhdp_read_hpd(struct cdns_mhdp_device *mhdp)
 	DRM_ERROR("read hpd  failed: %d\n", ret);
 	return ret;
 }
+EXPORT_SYMBOL(cdns_mhdp_read_hpd);
 
 int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 			  unsigned int block, size_t length)
@@ -471,100 +479,7 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 
 	return ret;
 }
-
-static int cdns_mhdp_training_start(struct cdns_mhdp_device *mhdp)
-{
-	unsigned long timeout;
-	u8 msg, event[2];
-	int ret;
-
-	msg = LINK_TRAINING_RUN;
-
-	/* start training */
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_TRAINING_CONTROL,
-								sizeof(msg), &msg);
-	if (ret)
-		goto err_training_start;
-
-	timeout = jiffies + msecs_to_jiffies(LINK_TRAINING_TIMEOUT_MS);
-	while (time_before(jiffies, timeout)) {
-		msleep(LINK_TRAINING_RETRY_MS);
-		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-					     DPTX_READ_EVENT, 0, NULL);
-		if (ret)
-			goto err_training_start;
-
-		ret = cdns_mhdp_mailbox_validate_receive(mhdp,
-							 MB_MODULE_ID_DP_TX,
-							 DPTX_READ_EVENT,
-							 sizeof(event));
-		if (ret)
-			goto err_training_start;
-
-		ret = cdns_mhdp_mailbox_read_receive(mhdp, event, sizeof(event));
-		if (ret)
-			goto err_training_start;
-
-		if (event[1] & EQ_PHASE_FINISHED)
-			return 0;
-	}
-
-	ret = -ETIMEDOUT;
-
-err_training_start:
-	DRM_DEV_ERROR(mhdp->dev, "training failed: %d\n", ret);
-	return ret;
-}
-
-static int cdns_mhdp_get_training_status(struct cdns_mhdp_device *mhdp)
-{
-	u8 status[10];
-	int ret;
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_READ_LINK_STAT,
-								0, NULL);
-	if (ret)
-		goto err_get_training_status;
-
-	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
-						 DPTX_READ_LINK_STAT,
-						 sizeof(status));
-	if (ret)
-		goto err_get_training_status;
-
-	ret = cdns_mhdp_mailbox_read_receive(mhdp, status, sizeof(status));
-	if (ret)
-		goto err_get_training_status;
-
-	mhdp->dp.rate = drm_dp_bw_code_to_link_rate(status[0]);
-	mhdp->dp.num_lanes = status[1];
-
-err_get_training_status:
-	if (ret)
-		DRM_DEV_ERROR(mhdp->dev, "get training status failed: %d\n", ret);
-	return ret;
-}
-
-int cdns_mhdp_train_link(struct cdns_mhdp_device *mhdp)
-{
-	int ret;
-
-	ret = cdns_mhdp_training_start(mhdp);
-	if (ret) {
-		DRM_DEV_ERROR(mhdp->dev, "Failed to start training %d\n", ret);
-		return ret;
-	}
-
-	ret = cdns_mhdp_get_training_status(mhdp);
-	if (ret) {
-		DRM_DEV_ERROR(mhdp->dev, "Failed to get training stat %d\n", ret);
-		return ret;
-	}
-
-	DRM_DEV_DEBUG_KMS(mhdp->dev, "rate:0x%x, lanes:%d\n", mhdp->dp.rate,
-			  mhdp->dp.num_lanes);
-	return ret;
-}
+EXPORT_SYMBOL(cdns_mhdp_get_edid_block);
 
 int cdns_mhdp_set_video_status(struct cdns_mhdp_device *mhdp, int active)
 {
@@ -580,6 +495,7 @@ int cdns_mhdp_set_video_status(struct cdns_mhdp_device *mhdp, int active)
 
 	return ret;
 }
+EXPORT_SYMBOL(cdns_mhdp_set_video_status);
 
 static int mhdp_get_msa_misc(struct video_info *video,
 				  struct drm_display_mode *mode)
@@ -781,182 +697,4 @@ int cdns_mhdp_config_video(struct cdns_mhdp_device *mhdp)
 		DRM_DEV_ERROR(mhdp->dev, "config video failed: %d\n", ret);
 	return ret;
 }
-
-int cdns_mhdp_audio_stop(struct cdns_mhdp_device *mhdp, struct audio_info *audio)
-{
-	int ret;
-
-	ret = cdns_mhdp_reg_write(mhdp, AUDIO_PACK_CONTROL, 0);
-	if (ret) {
-		DRM_DEV_ERROR(mhdp->dev, "audio stop failed: %d\n", ret);
-		return ret;
-	}
-
-	cdns_mhdp_bus_write(0, mhdp, SPDIF_CTRL_ADDR);
-
-	/* clearn the audio config and reset */
-	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNTL);
-	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNFG);
-	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, AUDIO_SRC_CNTL);
-	cdns_mhdp_bus_write(0, mhdp, AUDIO_SRC_CNTL);
-
-	/* reset smpl2pckt component  */
-	cdns_mhdp_bus_write(0, mhdp, SMPL2PKT_CNTL);
-	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, SMPL2PKT_CNTL);
-	cdns_mhdp_bus_write(0, mhdp, SMPL2PKT_CNTL);
-
-	/* reset FIFO */
-	cdns_mhdp_bus_write(AUDIO_SW_RST, mhdp, FIFO_CNTL);
-	cdns_mhdp_bus_write(0, mhdp, FIFO_CNTL);
-
-	if (audio->format == AFMT_SPDIF_INT)
-		clk_disable_unprepare(mhdp->spdif_clk);
-
-	return 0;
-}
-
-int cdns_mhdp_audio_mute(struct cdns_mhdp_device *mhdp, bool enable)
-{
-	int ret = true;
-
-	ret = cdns_mhdp_reg_write_bit(mhdp, DP_VB_ID, 4, 1, enable);
-	if (ret)
-		DRM_DEV_ERROR(mhdp->dev, "audio mute failed: %d\n", ret);
-
-	return ret;
-}
-
-static void cdns_mhdp_audio_config_i2s(struct cdns_mhdp_device *mhdp,
-				       struct audio_info *audio)
-{
-	int sub_pckt_num = 1, i2s_port_en_val = 0xf, i;
-	u32 val;
-
-	if (audio->channels == 2) {
-		if (mhdp->dp.num_lanes == 1)
-			sub_pckt_num = 2;
-		else
-			sub_pckt_num = 4;
-
-		i2s_port_en_val = 1;
-	} else if (audio->channels == 4) {
-		i2s_port_en_val = 3;
-	}
-
-	cdns_mhdp_bus_write(0x0, mhdp, SPDIF_CTRL_ADDR);
-
-	cdns_mhdp_bus_write(SYNC_WR_TO_CH_ZERO, mhdp, FIFO_CNTL);
-
-	val = MAX_NUM_CH(audio->channels);
-	val |= NUM_OF_I2S_PORTS(audio->channels);
-	val |= AUDIO_TYPE_LPCM;
-	val |= CFG_SUB_PCKT_NUM(sub_pckt_num);
-	cdns_mhdp_bus_write(val, mhdp, SMPL2PKT_CNFG);
-
-	if (audio->sample_width == 16)
-		val = 0;
-	else if (audio->sample_width == 24)
-		val = 1 << 9;
-	else
-		val = 2 << 9;
-
-	val |= AUDIO_CH_NUM(audio->channels);
-	val |= I2S_DEC_PORT_EN(i2s_port_en_val);
-	val |= TRANS_SMPL_WIDTH_32;
-	cdns_mhdp_bus_write(val, mhdp, AUDIO_SRC_CNFG);
-
-	for (i = 0; i < (audio->channels + 1) / 2; i++) {
-		if (audio->sample_width == 16)
-			val = (0x02 << 8) | (0x02 << 20);
-		else if (audio->sample_width == 24)
-			val = (0x0b << 8) | (0x0b << 20);
-
-		val |= ((2 * i) << 4) | ((2 * i + 1) << 16);
-		cdns_mhdp_bus_write(val, mhdp, STTS_BIT_CH(i));
-	}
-
-	switch (audio->sample_rate) {
-	case 32000:
-		val = SAMPLING_FREQ(3) |
-		      ORIGINAL_SAMP_FREQ(0xc);
-		break;
-	case 44100:
-		val = SAMPLING_FREQ(0) |
-		      ORIGINAL_SAMP_FREQ(0xf);
-		break;
-	case 48000:
-		val = SAMPLING_FREQ(2) |
-		      ORIGINAL_SAMP_FREQ(0xd);
-		break;
-	case 88200:
-		val = SAMPLING_FREQ(8) |
-		      ORIGINAL_SAMP_FREQ(0x7);
-		break;
-	case 96000:
-		val = SAMPLING_FREQ(0xa) |
-		      ORIGINAL_SAMP_FREQ(5);
-		break;
-	case 176400:
-		val = SAMPLING_FREQ(0xc) |
-		      ORIGINAL_SAMP_FREQ(3);
-		break;
-	case 192000:
-		val = SAMPLING_FREQ(0xe) |
-		      ORIGINAL_SAMP_FREQ(1);
-		break;
-	}
-	val |= 4;
-	cdns_mhdp_bus_write(val, mhdp, COM_CH_STTS_BITS);
-
-	cdns_mhdp_bus_write(SMPL2PKT_EN, mhdp, SMPL2PKT_CNTL);
-	cdns_mhdp_bus_write(I2S_DEC_START, mhdp, AUDIO_SRC_CNTL);
-}
-
-static void cdns_mhdp_audio_config_spdif(struct cdns_mhdp_device *mhdp)
-{
-	u32 val;
-
-	cdns_mhdp_bus_write(SYNC_WR_TO_CH_ZERO, mhdp, FIFO_CNTL);
-
-	val = MAX_NUM_CH(2) | AUDIO_TYPE_LPCM | CFG_SUB_PCKT_NUM(4);
-	cdns_mhdp_bus_write(val, mhdp, SMPL2PKT_CNFG);
-	cdns_mhdp_bus_write(SMPL2PKT_EN, mhdp, SMPL2PKT_CNTL);
-
-	val = SPDIF_ENABLE | SPDIF_AVG_SEL | SPDIF_JITTER_BYPASS;
-	cdns_mhdp_bus_write(val, mhdp, SPDIF_CTRL_ADDR);
-
-	clk_prepare_enable(mhdp->spdif_clk);
-	clk_set_rate(mhdp->spdif_clk, CDNS_DP_SPDIF_CLK);
-}
-
-int cdns_mhdp_audio_config(struct cdns_mhdp_device *mhdp,
-							struct audio_info *audio)
-{
-	int ret;
-
-	/* reset the spdif clk before config */
-	if (audio->format == AFMT_SPDIF_INT) {
-		reset_control_assert(mhdp->spdif_rst);
-		reset_control_deassert(mhdp->spdif_rst);
-	}
-
-	ret = cdns_mhdp_reg_write(mhdp, CM_LANE_CTRL, LANE_REF_CYC);
-	if (ret)
-		goto err_audio_config;
-
-	ret = cdns_mhdp_reg_write(mhdp, CM_CTRL, 0);
-	if (ret)
-		goto err_audio_config;
-
-	if (audio->format == AFMT_I2S)
-		cdns_mhdp_audio_config_i2s(mhdp, audio);
-	else if (audio->format == AFMT_SPDIF_INT)
-		cdns_mhdp_audio_config_spdif(mhdp);
-
-	ret = cdns_mhdp_reg_write(mhdp, AUDIO_PACK_CONTROL, AUDIO_PACK_EN);
-
-err_audio_config:
-	if (ret)
-		DRM_DEV_ERROR(mhdp->dev, "audio config failed: %d\n", ret);
-	return ret;
-}
+EXPORT_SYMBOL(cdns_mhdp_config_video);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
new file mode 100644
index 000000000000..1f093a2deaa7
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-common.h
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#ifndef _CDNS_MHDP_H_
+#define _CDNS_MHDP_H_
+
+#include <drm/bridge/cdns-mhdp.h>
+
+/* mhdp common */
+u32 cdns_mhdp_bus_read(struct cdns_mhdp_device *mhdp, u32 offset);
+void cdns_mhdp_bus_write(u32 val, struct cdns_mhdp_device *mhdp, u32 offset);
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
+				  u8 opcode, u16 size, u8 *message);
+int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr);
+int cdns_mhdp_mailbox_read_receive(struct cdns_mhdp_device *mhdp,
+					  u8 *buff, u16 buff_size);
+int cdns_mhdp_mailbox_validate_receive(struct cdns_mhdp_device *mhdp,
+					      u8 module_id, u8 opcode, u16 req_size);
+int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr);
+int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32 val);
+int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
+				   u8 start_bit, u8 bits_no, u32 val);
+
+#endif
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
new file mode 100644
index 000000000000..c8160f321aca
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-dp.c
@@ -0,0 +1,174 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+
+#include <asm/unaligned.h>
+#include <drm/bridge/cdns-mhdp.h>
+#include <drm/drm_print.h>
+#include <linux/io.h>
+
+#include "cdns-mhdp-common.h"
+
+#define LINK_TRAINING_TIMEOUT_MS	500
+#define LINK_TRAINING_RETRY_MS		20
+
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
+			u32 addr, u8 *data, u16 len)
+{
+	u8 msg[5], reg[5];
+	int ret;
+
+	put_unaligned_be16(len, msg);
+	put_unaligned_be24(addr, msg + 2);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto err_dpcd_read;
+
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_READ_DPCD,
+						 sizeof(reg) + len);
+	if (ret)
+		goto err_dpcd_read;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto err_dpcd_read;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, data, len);
+
+err_dpcd_read:
+	return ret;
+}
+EXPORT_SYMBOL(cdns_mhdp_dpcd_read);
+
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
+{
+	u8 msg[6], reg[5];
+	int ret;
+
+	put_unaligned_be16(1, msg);
+	put_unaligned_be24(addr, msg + 2);
+	msg[5] = value;
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto err_dpcd_write;
+
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_WRITE_DPCD, sizeof(reg));
+	if (ret)
+		goto err_dpcd_write;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto err_dpcd_write;
+
+	if (addr != get_unaligned_be24(reg + 2))
+		ret = -EINVAL;
+
+err_dpcd_write:
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "dpcd write failed: %d\n", ret);
+	return ret;
+}
+EXPORT_SYMBOL(cdns_mhdp_dpcd_write);
+
+static int cdns_mhdp_training_start(struct cdns_mhdp_device *mhdp)
+{
+	unsigned long timeout;
+	u8 msg, event[2];
+	int ret;
+
+	msg = LINK_TRAINING_RUN;
+
+	/* start training */
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_TRAINING_CONTROL, sizeof(msg), &msg);
+	if (ret)
+		goto err_training_start;
+
+	timeout = jiffies + msecs_to_jiffies(LINK_TRAINING_TIMEOUT_MS);
+	while (time_before(jiffies, timeout)) {
+		msleep(LINK_TRAINING_RETRY_MS);
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+					     DPTX_READ_EVENT, 0, NULL);
+		if (ret)
+			goto err_training_start;
+
+		ret = cdns_mhdp_mailbox_validate_receive(mhdp,
+							 MB_MODULE_ID_DP_TX,
+							 DPTX_READ_EVENT,
+							 sizeof(event));
+		if (ret)
+			goto err_training_start;
+
+		ret = cdns_mhdp_mailbox_read_receive(mhdp, event,
+						     sizeof(event));
+		if (ret)
+			goto err_training_start;
+
+		if (event[1] & EQ_PHASE_FINISHED)
+			return 0;
+	}
+
+	ret = -ETIMEDOUT;
+
+err_training_start:
+	DRM_DEV_ERROR(mhdp->dev, "training failed: %d\n", ret);
+	return ret;
+}
+
+static int cdns_mhdp_get_training_status(struct cdns_mhdp_device *mhdp)
+{
+	u8 status[10];
+	int ret;
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_LINK_STAT, 0, NULL);
+	if (ret)
+		goto err_get_training_status;
+
+	ret = cdns_mhdp_mailbox_validate_receive(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_READ_LINK_STAT,
+						 sizeof(status));
+	if (ret)
+		goto err_get_training_status;
+
+	ret = cdns_mhdp_mailbox_read_receive(mhdp, status, sizeof(status));
+	if (ret)
+		goto err_get_training_status;
+
+	mhdp->dp.rate = drm_dp_bw_code_to_link_rate(status[0]);
+	mhdp->dp.num_lanes = status[1];
+
+err_get_training_status:
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "get training status failed: %d\n",
+			      ret);
+	return ret;
+}
+
+int cdns_mhdp_train_link(struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	ret = cdns_mhdp_training_start(mhdp);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to start training %d\n",
+			      ret);
+		return ret;
+	}
+
+	ret = cdns_mhdp_get_training_status(mhdp);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to get training stat %d\n",
+			      ret);
+		return ret;
+	}
+
+	DRM_DEV_DEBUG_KMS(mhdp->dev, "rate:0x%x, lanes:%d\n", mhdp->dp.rate,
+			  mhdp->dp.num_lanes);
+	return ret;
+}
+EXPORT_SYMBOL(cdns_mhdp_train_link);
diff --git a/drivers/gpu/drm/rockchip/Kconfig b/drivers/gpu/drm/rockchip/Kconfig
index 310aa1546893..af1e9ac5c5ef 100644
--- a/drivers/gpu/drm/rockchip/Kconfig
+++ b/drivers/gpu/drm/rockchip/Kconfig
@@ -30,6 +30,7 @@ config ROCKCHIP_ANALOGIX_DP
 config ROCKCHIP_CDN_DP
 	bool "Rockchip cdn DP"
 	depends on EXTCON=y || (EXTCON=m && DRM_ROCKCHIP=m)
+	depends on DRM_CDNS_MHDP
 	help
 	  This selects support for Rockchip SoC specific extensions
 	  for the cdn DP driver. If you want to enable Dp on
diff --git a/drivers/gpu/drm/rockchip/Makefile b/drivers/gpu/drm/rockchip/Makefile
index 17a9e7eb2130..bd013659404f 100644
--- a/drivers/gpu/drm/rockchip/Makefile
+++ b/drivers/gpu/drm/rockchip/Makefile
@@ -8,7 +8,7 @@ rockchipdrm-y := rockchip_drm_drv.o rockchip_drm_fb.o \
 rockchipdrm-$(CONFIG_DRM_FBDEV_EMULATION) += rockchip_drm_fbdev.o
 
 rockchipdrm-$(CONFIG_ROCKCHIP_ANALOGIX_DP) += analogix_dp-rockchip.o
-rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o cdn-dp-reg.o
+rockchipdrm-$(CONFIG_ROCKCHIP_CDN_DP) += cdn-dp-core.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_HDMI) += dw_hdmi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_DW_MIPI_DSI) += dw-mipi-dsi-rockchip.o
 rockchipdrm-$(CONFIG_ROCKCHIP_INNO_HDMI) += inno_hdmi.o
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b6aa21779608..06fd82b217b6 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -15,6 +15,7 @@
 
 #include <sound/hdmi-codec.h>
 
+#include <drm/bridge/cdns-mhdp.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_edid.h>
@@ -22,7 +23,6 @@
 #include <drm/drm_probe_helper.h>
 
 #include "cdn-dp-core.h"
-#include "cdn-dp-reg.h"
 #include "rockchip_drm_vop.h"
 
 #define connector_to_dp(c) \
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index d5dcb75b2398..8b1b15b92503 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -7,11 +7,11 @@
 #ifndef _CDN_DP_CORE_H
 #define _CDN_DP_CORE_H
 
+#include <drm/bridge/cdns-mhdp.h>
 #include <drm/drm_dp_helper.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_probe_helper.h>
 
-#include "cdn-dp-reg.h"
 #include "rockchip_drm_drv.h"
 
 #define MAX_PHY		2
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-reg.h b/include/drm/bridge/cdns-mhdp.h
similarity index 98%
rename from drivers/gpu/drm/rockchip/cdn-dp-reg.h
rename to include/drm/bridge/cdns-mhdp.h
index 3c1235ff8e1c..c8170e6048f7 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-reg.h
+++ b/include/drm/bridge/cdns-mhdp.h
@@ -4,11 +4,12 @@
  * Author: Chris Zhong <zyw@rock-chips.com>
  */
 
-#ifndef _CDN_DP_REG_H
-#define _CDN_DP_REG_H
+#ifndef CDNS_MHDP_H_
+#define CDNS_MHDP_H_
 
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_dp_helper.h>
 #include <linux/bitops.h>
 
 #define ADDR_IMEM		0x10000
@@ -529,8 +530,6 @@ struct cdns_mhdp_device {
 	};
 };
 
-int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr);
-int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u32 addr, u32 val);
 void cdns_mhdp_clock_reset(struct cdns_mhdp_device *mhdp);
 void cdns_mhdp_set_fw_clk(struct cdns_mhdp_device *mhdp, unsigned long clk);
 int cdns_mhdp_load_firmware(struct cdns_mhdp_device *mhdp, const u32 *i_mem,
@@ -554,4 +553,4 @@ int cdns_mhdp_audio_mute(struct cdns_mhdp_device *mhdp, bool enable);
 int cdns_mhdp_audio_config(struct cdns_mhdp_device *mhdp,
 			   struct audio_info *audio);
 
-#endif /* _CDN_DP_REG_H */
+#endif /* CDNS_MHDP_H_ */
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
