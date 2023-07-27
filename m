Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCDF765E8E
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:58:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C9B110E616;
	Thu, 27 Jul 2023 21:58:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from qs51p00im-qukt01071901.me.com (qs51p00im-qukt01071901.me.com
 [17.57.155.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 999B410E608
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Jul 2023 21:58:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=me.com; s=1a1hai;
 t=1690494743; bh=VW6b43RiCPE3QnUespHmOiG7y2sCgca0aeMtTf9e+VA=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=jeNSAkBiazZ7ilht3HQ5YFI3j8xbybPri4Gwx93zjGM6gERB/RlG9D/BU2Sby0rar
 QkS3f0chejbRn0YoL3AbGH37tMzDmlVtnsyNXAjPMmdmfEhHciIqqVTm+PJk6rMYXw
 5P51tD2JQagfSjN3DDTTwF1uO/Bl8u6M7qV69nj5rxa5vW0dqkYBvP8dE4B2oAIMpn
 QGSwcIEFuubCPQI0i8KjChVkht68n/th/kGpsvipG9mpTtLDl/LcTySMATexgJaA+i
 m6rS80NBdk8yIDc1Y56Mcj0fsmmHF2QmhZzjGRFisswV8tlvlSJBHQZquvGbj/SUjt
 L5UG69zmA5FCA==
Received: from localhost (qs51p00im-dlb-asmtp-mailmevip.me.com [17.57.155.28])
 by qs51p00im-qukt01071901.me.com (Postfix) with ESMTPSA id
 8D7C46280983; Thu, 27 Jul 2023 21:52:22 +0000 (UTC)
From: Alain Volmat <avolmat@me.com>
To: Alain Volmat <alain.volmat@foss.st.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 01/14] drm/sti: add hdmi tx6g0c28 phy for STi platform
Date: Thu, 27 Jul 2023 21:51:25 +0000
Message-Id: <20230727215141.53910-2-avolmat@me.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230727215141.53910-1-avolmat@me.com>
References: <20230727215141.53910-1-avolmat@me.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: v5HQ8jZsSIpQLpsIVn4-AcK87utIRtUT
X-Proofpoint-GUID: v5HQ8jZsSIpQLpsIVn4-AcK87utIRtUT
X-Proofpoint-Virus-Version: =?UTF-8?Q?vendor=3Dfsecure_engine=3D1.1.170-22c6f66c430a71ce266a39bfe25bc?=
 =?UTF-8?Q?2903e8d5c8f:6.0.138,18.0.790,17.11.62.513.0000000_definitions?=
 =?UTF-8?Q?=3D2022-01-12=5F02:2020-02-14=5F02,2022-01-12=5F02,2021-12-02?=
 =?UTF-8?Q?=5F01_signatures=3D0?=
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 phishscore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2307270199
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alain Volmat <avolmat@me.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Addition of the HDMI TX PHY driver for use in the STiH418
SoC platform and more especially the 4KOpen (B2264) board.

Signed-off-by: Alain Volmat <avolmat@me.com>
---
 drivers/gpu/drm/sti/Makefile               |   1 +
 drivers/gpu/drm/sti/sti_hdmi.c             |   4 +
 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c | 292 +++++++++++++++++++++
 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h |  13 +
 4 files changed, 310 insertions(+)
 create mode 100644 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c
 create mode 100644 drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h

diff --git a/drivers/gpu/drm/sti/Makefile b/drivers/gpu/drm/sti/Makefile
index f203ac5514ae..bf52edb7dba5 100644
--- a/drivers/gpu/drm/sti/Makefile
+++ b/drivers/gpu/drm/sti/Makefile
@@ -11,6 +11,7 @@ sti-drm-y := \
 	sti_plane.o \
 	sti_hdmi.o \
 	sti_hdmi_tx3g4c28phy.o \
+	sti_hdmi_tx6g0c28phy.o \
 	sti_dvo.o \
 	sti_awg_utils.o \
 	sti_vtg.o \
diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 500936d5743c..988a5de0fcd2 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -27,6 +27,7 @@
 
 #include "sti_hdmi.h"
 #include "sti_hdmi_tx3g4c28phy.h"
+#include "sti_hdmi_tx6g0c28phy.h"
 #include "sti_vtg.h"
 
 #define HDMI_CFG                        0x0000
@@ -1363,6 +1364,9 @@ static const struct of_device_id hdmi_of_match[] = {
 	{
 		.compatible = "st,stih407-hdmi",
 		.data = &tx3g4c28phy_ops,
+	}, {
+		.compatible = "st,stih418-hdmi",
+		.data = &tx6g0c28phy_ops,
 	}, {
 		/* end node */
 	}
diff --git a/drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c b/drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c
new file mode 100644
index 000000000000..7bd260429044
--- /dev/null
+++ b/drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.c
@@ -0,0 +1,292 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Author: Alain Volmat <avolmat@me.com>
+ *
+ * This driver is highly inspired from sti_hdmi_tx3g4c28phy.c copyright by ST Microelectronics
+ * with IP behavior understood by looking at the display package from 4kopen.com
+ * https://bitbucket.org/4kopen/display/src/master/display/ip/hdmi/stmhdmitx6g0_c28_phy.cpp
+ */
+
+#include <drm/drm_device.h>
+#include <drm/drm_print.h>
+#include <linux/delay.h>
+#include <linux/reset.h>
+
+#include "sti_hdmi_tx6g0c28phy.h"
+
+#define HDMI_SRZ_CFG		0x504
+#define HDMI_SRZ_PWR_CFG	0x508
+#define HDMI_SRZ_PLL_CFG	0x510
+#define HDMI_SRZ_STR_1		0x518
+#define HDMI_SRZ_STR_2		0x51C
+#define HDMI_SRZ_CALCODE_EXT	0x530
+#define HDMI_SRZ_TX_RSVR_BITS	0x560
+
+/* ******************************* */
+/* register : HDMI_SRZ_CFG         */
+/* ******************************* */
+#define HDMI_SRZ_CFG_EN				BIT(0)
+#define HDMI_SRZ_CFG_EN_PE_C0_MASK		GENMASK(6, 4)
+#define HDMI_SRZ_CFG_EN_PE_C1_MASK		GENMASK(10, 8)
+#define HDMI_SRZ_CFG_EN_PE_C2_MASK		GENMASK(14, 12)
+
+#define HDMI_SRZ_CFG_EXTERNAL_DATA		BIT(16)
+#define HDMI_SRZ_CFG_RBIAS_EXT			BIT(17)
+#define HDMI_SRZ_CFG_EN_SINK_TERM_DETECTION	BIT(18)
+#define HDMI_SRZ_CFG_ISNKCTRL_MASK		GENMASK(21, 20)
+
+#define HDMI_SRZ_CFG_EN_SRC_TERM_SHIFT    (24)
+#define HDMI_SRZ_CFG_EN_SRC_TERM_VAL_0_165MHZ             (0x0)
+#define HDMI_SRZ_CFG_EN_SRC_TERM_VAL_165_340MHZ      (0x2)
+#define HDMI_SRZ_CFG_EN_SRC_TERM_VAL_ABV_340MHZ             (0x3)
+
+#define HDMI_SRZ_CFG_CKCH_LOWSW_EN_SHIFT          (29)
+#define HDMI_SRZ_CFG_CKCH_LOWSW_EN_VAL_500MV      (0x0) /* for below or equal 3.4 Gbps */
+#define HDMI_SRZ_CFG_CKCH_LOWSW_EN_VAL_300MV      (0x1) /* for above 3.4 Gbps */
+
+#define HDMI_SRZ_CFG_CKBY10_OR_40_SHIFT             (30)
+#define HDMI_SRZ_CFG_CKBY10_OR_40_VAL_DIV_BY_10     (0x0) /* for below or equal 3.4 Gbps */
+#define HDMI_SRZ_CFG_CKBY10_OR_40_VAL_DIV_BY_40     (0x1) /* for above 3.4 Gbps */
+
+#define HDMI_SRZ_CFG_DATA20BIT10BIT_SHIFT           (31)
+#define HDMI_SRZ_CFG_DATA20BIT10BIT_VAL_10_BPC      (0x0)
+#define HDMI_SRZ_CFG_DATA20BIT10BIT_VAL_20_BPC      (0x1)
+
+/* ******************************* */
+/* register : HDMI_SRZ_PLL_CFG     */
+/* ******************************* */
+#define HDMI_PLL_CFG_EN		BIT(0)
+#define HDMI_PLL_CFG_NDIV_SHIFT (8)
+#define HDMI_PLL_CFG_IDF_SHIFT  (16)
+#define HDMI_PLL_CFG_ODF_SHIFT  (24)
+
+#define ODF_DIV_1          (0)
+#define ODF_DIV_2          (1)
+#define ODF_DIV_4          (2)
+#define ODF_DIV_8          (3)
+#define ODF_DIV_16         (4)
+
+/* ******************************* */
+/* register : HDMI_SRZ_STR_1       */
+/* ******************************* */
+#define HDMI_SRZ_STR1_MSK_PEXC0   GENMASK(11, 0)
+#define HDMI_SRZ_STR1_MSK_PEXC1   GENMASK(27, 16)
+
+/* ******************************* */
+/* register : HDMI_SRZ_STR_2       */
+/* ******************************* */
+#define HDMI_SRZ_STR2_PEXC2       (0)
+#define HDMI_SRZ_STR2_MSK_PEXC2   (0xFFF << HDMI_SRZ_STR2_PEXC2)
+
+/* ******************************* */
+/* register : HDMI_SRZ_CALCODE_EXT */
+/* ******************************* */
+#define HDMI_SRZ_CALCODE_EXT_MASK        GENMASK(27, 0)
+
+/* ******************************** */
+/* register : HDMI_SRZ_TX_RSVR_BITS */
+/* ******************************** */
+#define HDMI_SRZ_TX_RSVR_BITS_BELOW_340MHZ       (0)
+#define HDMI_SRZ_TX_RSVR_BITS_ABOVE_340MHZ       (0x0800000)
+
+/* *********************************** */
+/* Configuration                       */
+/* *********************************** */
+/* Config 0 => HDMI_SRZ_CFG */
+#define HDMI_SRZ_CONFIG_0_MASK  (HDMI_SRZ_CFG_EN_PE_C0_MASK | \
+				 HDMI_SRZ_CFG_EN_PE_C1_MASK | \
+				 HDMI_SRZ_CFG_EN_PE_C2_MASK | \
+				 HDMI_SRZ_CFG_ISNKCTRL_MASK)
+/* Config 1 => HDMI_SRZ_STR_1 */
+#define HDMI_SRZ_CONFIG_1_MASK  (HDMI_SRZ_STR1_MSK_PEXC0 | HDMI_SRZ_STR1_MSK_PEXC1)
+
+/* Config 2 => HDMI_SRZ_STR_2 */
+#define HDMI_SRZ_CONFIG_2_MASK  (HDMI_SRZ_STR2_MSK_PEXC2)
+
+/* Config 3 => HDMI_SRZ_CALCODE_EXT */
+#define HDMI_SRZ_CONFIG_3_MASK  (HDMI_SRZ_CALCODE_EXT_MASK)
+
+#define STM_HDMI_THOLD_CLK_600MHZ  (600000000)
+#define STM_HDMI_THOLD_CLK_340MHZ  (340000000)
+#define STM_HDMI_THOLD_CLK_165MHZ  (165000000)
+
+#define HDMI_TIMEOUT_PLL_LOCK  50  /*milliseconds */
+
+struct plldividers_s {
+	u32 min;
+	u32 max;
+	u32 idf;
+	u32 odf;
+};
+
+/*
+ * Functional specification recommended values
+ */
+static struct plldividers_s plldividers[] = {
+	{0, 37500000, 1, ODF_DIV_16 },
+	{37500000, 75000000, 2, ODF_DIV_8 },
+	{75000000, 150000000, 4, ODF_DIV_4 },
+	{150000000, 300000000, 8, ODF_DIV_2 },
+	{300000000, 600000000, 16, ODF_DIV_1 }
+};
+
+static struct hdmi_phy_config hdmiphy_config[] = {
+	{0, 145000000, {0x0, 0x0, 0x0, 0x0} },
+	{145000000, 165000000, {0x1110, 0x0, 0x0, 0x0} },
+	{165000000, 340000000, {0x1110, 0x30003, 0x3, 0x0} },
+	{340000000, 600000000, {0x200000, 0x0, 0x0, 0x0} },
+};
+
+/**
+ * sti_hdmi_tx6g0c28phy_start - Start hdmi phy macro cell tx6g0c28
+ *
+ * @hdmi: pointer on the hdmi internal structure
+ *
+ * Return false if an error occur
+ */
+static bool sti_hdmi_tx6g0c28phy_start(struct sti_hdmi *hdmi)
+{
+	u32 ckpxpll = hdmi->mode.clock * 1000;
+	u32 cfg, val, tmdsck, idf, odf, pllctrl = 0;
+	bool foundplldivides = false;
+	u32 tx_rsvr_bits = HDMI_SRZ_TX_RSVR_BITS_BELOW_340MHZ;
+	int i;
+
+	drm_dbg_driver(hdmi->drm_dev, "%s: ckpxpll = %dHz\n", __func__, ckpxpll);
+
+	for (i = 0; i < ARRAY_SIZE(plldividers); i++) {
+		if (ckpxpll >= plldividers[i].min &&
+		    ckpxpll < plldividers[i].max) {
+			idf = plldividers[i].idf;
+			odf = plldividers[i].odf;
+			foundplldivides = true;
+			break;
+		}
+	}
+
+	if (!foundplldivides) {
+		dev_err(&hdmi->dev, "%s: input TMDS clock speed (%d) not supported\n",
+			__func__, ckpxpll);
+		return false;
+	}
+
+	/* Assuming no pixel repetition and 24bits color */
+	tmdsck = ckpxpll;
+	pllctrl |= 20 << HDMI_PLL_CFG_NDIV_SHIFT;
+
+	if (tmdsck > STM_HDMI_THOLD_CLK_600MHZ) {
+		dev_err(&hdmi->dev, "%s: output TMDS clock (%d) out of range\n", __func__, tmdsck);
+		return false;
+	}
+
+	pllctrl |= idf << HDMI_PLL_CFG_IDF_SHIFT;
+	pllctrl |= odf << HDMI_PLL_CFG_ODF_SHIFT;
+
+	cfg = (HDMI_SRZ_CFG_EN |
+	       HDMI_SRZ_CFG_EXTERNAL_DATA |
+	       HDMI_SRZ_CFG_RBIAS_EXT |
+	       HDMI_SRZ_CFG_EN_SINK_TERM_DETECTION |
+	       (HDMI_SRZ_CFG_DATA20BIT10BIT_VAL_10_BPC << HDMI_SRZ_CFG_DATA20BIT10BIT_SHIFT));
+
+	if (tmdsck > STM_HDMI_THOLD_CLK_340MHZ) {
+		cfg |= (HDMI_SRZ_CFG_EN_SRC_TERM_VAL_ABV_340MHZ << HDMI_SRZ_CFG_EN_SRC_TERM_SHIFT) |
+		       (HDMI_SRZ_CFG_CKCH_LOWSW_EN_VAL_300MV << HDMI_SRZ_CFG_CKCH_LOWSW_EN_SHIFT) |
+		       (HDMI_SRZ_CFG_CKBY10_OR_40_VAL_DIV_BY_40 << HDMI_SRZ_CFG_CKBY10_OR_40_SHIFT);
+		tx_rsvr_bits = HDMI_SRZ_TX_RSVR_BITS_ABOVE_340MHZ;
+	} else if (tmdsck > STM_HDMI_THOLD_CLK_165MHZ) {
+		cfg |= (HDMI_SRZ_CFG_EN_SRC_TERM_VAL_165_340MHZ << HDMI_SRZ_CFG_EN_SRC_TERM_SHIFT) |
+		       (HDMI_SRZ_CFG_CKCH_LOWSW_EN_VAL_500MV << HDMI_SRZ_CFG_CKCH_LOWSW_EN_SHIFT) |
+		       (HDMI_SRZ_CFG_CKBY10_OR_40_VAL_DIV_BY_10 << HDMI_SRZ_CFG_CKBY10_OR_40_SHIFT);
+	} else {
+		cfg |= (HDMI_SRZ_CFG_EN_SRC_TERM_VAL_0_165MHZ << HDMI_SRZ_CFG_EN_SRC_TERM_SHIFT) |
+		       (HDMI_SRZ_CFG_CKCH_LOWSW_EN_VAL_500MV << HDMI_SRZ_CFG_CKCH_LOWSW_EN_SHIFT) |
+		       (HDMI_SRZ_CFG_CKBY10_OR_40_VAL_DIV_BY_10 << HDMI_SRZ_CFG_CKBY10_OR_40_SHIFT);
+	}
+
+	/*
+	 * To configure the source termination and pre-emphasis appropriately
+	 * for different high speed TMDS clock frequencies a phy configuration
+	 * table must be provided, tailored to the SoC and board combination.
+	 */
+	for (i = 0; i < ARRAY_SIZE(hdmiphy_config); i++) {
+		if (hdmiphy_config[i].min_tmds_freq <= tmdsck &&
+		    hdmiphy_config[i].max_tmds_freq >= tmdsck) {
+			cfg |= (hdmiphy_config[i].config[0] & HDMI_SRZ_CONFIG_0_MASK);
+			hdmi_write(hdmi, cfg, HDMI_SRZ_CFG);
+			hdmi_write(hdmi, 0, HDMI_SRZ_PWR_CFG);
+
+			val = hdmiphy_config[i].config[1] & HDMI_SRZ_CONFIG_1_MASK;
+			hdmi_write(hdmi, val, HDMI_SRZ_STR_1);
+
+			val = hdmiphy_config[i].config[2] & HDMI_SRZ_CONFIG_2_MASK;
+			hdmi_write(hdmi, val, HDMI_SRZ_STR_2);
+
+			val = hdmiphy_config[i].config[3] & HDMI_SRZ_CONFIG_3_MASK;
+			hdmi_write(hdmi, val, HDMI_SRZ_CALCODE_EXT);
+
+			hdmi_write(hdmi, tx_rsvr_bits, HDMI_SRZ_TX_RSVR_BITS);
+
+			/*
+			 * Configure and power up the PHY PLL
+			 */
+			hdmi->event_received = false;
+			hdmi_write(hdmi, (pllctrl | HDMI_PLL_CFG_EN), HDMI_SRZ_PLL_CFG);
+
+			/* wait PLL interrupt */
+			wait_event_interruptible_timeout(hdmi->wait_event, hdmi->event_received,
+							 msecs_to_jiffies(HDMI_TIMEOUT_PLL_LOCK));
+
+			if ((hdmi_read(hdmi, HDMI_STA) & HDMI_STA_DLL_LCK) == 0) {
+				dev_err(&hdmi->dev, "%s: hdmi phy pll not locked\n", __func__);
+				return false;
+			}
+
+			/* Reset the HDMI_TX_PHY */
+			reset_control_assert(hdmi->reset);
+			usleep_range(15, 20);
+			reset_control_deassert(hdmi->reset);
+
+			return true;
+		}
+	}
+
+	/*
+	 * Default, power up the serializer with no pre-emphasis or
+	 * output swing correction
+	 */
+	hdmi_write(hdmi, cfg, HDMI_SRZ_CFG);
+	hdmi_write(hdmi, 0, HDMI_SRZ_PWR_CFG);
+	hdmi_write(hdmi, 0, HDMI_SRZ_STR_1);
+	hdmi_write(hdmi, 0, HDMI_SRZ_STR_2);
+	hdmi_write(hdmi, 0, HDMI_SRZ_CALCODE_EXT);
+	hdmi_write(hdmi, 0, HDMI_SRZ_TX_RSVR_BITS);
+
+	return true;
+}
+
+/**
+ * sti_hdmi_tx6g0c28phy_stop - Stop hdmi phy macro cell tx6g0c28
+ *
+ * @hdmi: pointer on the hdmi internal structure
+ */
+static void sti_hdmi_tx6g0c28phy_stop(struct sti_hdmi *hdmi)
+{
+	hdmi->event_received = false;
+
+	hdmi_write(hdmi, HDMI_SRZ_CFG_EN_SINK_TERM_DETECTION, HDMI_SRZ_CFG);
+	hdmi_write(hdmi, 0, HDMI_SRZ_PLL_CFG);
+
+	/* wait PLL interrupt */
+	wait_event_interruptible_timeout(hdmi->wait_event,
+					 hdmi->event_received,
+					 msecs_to_jiffies
+					 (HDMI_TIMEOUT_PLL_LOCK));
+
+	if (hdmi_read(hdmi, HDMI_STA) & HDMI_STA_DLL_LCK)
+		dev_err(&hdmi->dev, "%s: hdmi phy pll not well disabled\n", __func__);
+}
+
+struct hdmi_phy_ops tx6g0c28phy_ops = {
+	.start = sti_hdmi_tx6g0c28phy_start,
+	.stop = sti_hdmi_tx6g0c28phy_stop,
+};
diff --git a/drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h b/drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h
new file mode 100644
index 000000000000..bcb8b70d36ea
--- /dev/null
+++ b/drivers/gpu/drm/sti/sti_hdmi_tx6g0c28phy.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Author: Alain Volmat <avolmat@me.com>
+ */
+
+#ifndef _STI_HDMI_TX6G0C28PHY_H_
+#define _STI_HDMI_TX6G0C28PHY_H_
+
+#include "sti_hdmi.h"
+
+extern struct hdmi_phy_ops tx6g0c28phy_ops;
+
+#endif
-- 
2.34.1

