Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D331901163
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 14:02:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A36F10E0AC;
	Sat,  8 Jun 2024 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="SUMdcLVQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32AF910E0BB
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 12:02:31 +0000 (UTC)
X-UUID: f8d8311c258e11efa22eafcdcd04c131-20240608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=gHxUY7w7XjpGw8WfXBlzEPf1bIqs8byUdA4MFVjjOKw=; 
 b=SUMdcLVQqFY/t0T2Ia3W8EDKyoKgl1qg2aT35aXSlJlPGipjcRIEuLoYMYwm1ZZRejPt3115h2DgAxssMKO2DwNjtDb+TDMiwiURlJtsfKjjFYUYr5RdtIpuSSC/w+4wzEk2QJJU2r5fD7AO91a9EeGLoxGydNpUL8EnKzcGpwc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:10b53ba5-5461-4ab8-8f34-2731c6dd4478, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:1c7a5a44-4544-4d06-b2b2-d7e12813c598,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0
X-CID-BAS: 0,_,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f8d8311c258e11efa22eafcdcd04c131-20240608
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by
 mailgw02.mediatek.com (envelope-from <mac.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1704320246; Sat, 08 Jun 2024 20:02:26 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Jun 2024 20:02:24 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Jun 2024 20:02:23 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 2/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP2.x feature
 for DisplayPort
Date: Sat, 8 Jun 2024 20:01:05 +0800
Message-ID: <20240608120219.21817-3-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240608120219.21817-1-mac.shen@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--10.106600-8.000000
X-TMASE-MatchedRID: 7R7QocYGEysWk4/JZEVmwKOuVibdZNTvYQXxsZnRwoLO4ab65oVF2gBK
 GkW9znn56wjmyLa4MnSuVX99ICt6jpGPu1bK5ReTQ4srjeRbxTYraL2mh8ZVK+9Jtzyqge7Rvqn
 FtM6Nq/LwceN4v+p3z1WP8q4Dl63brbh5lywtukPXjUxnR1jUv6I0K26z6c86QUH1IMnQjZ9t4N
 HjBkiJIjfu8tBJWIkoPY+YkUBT2QzyTBeqcpWTVktzk37SzX4NSoCG4sefl8QUtdRZTmEaIRGP1
 j/yNFUfghg6xqCjCHp07/QbLesPz6h+3Rlbev+JutvHF25zoU8Ruzt37P1zyx8weqfEhZ8RF2Hv
 56robVTSdb0s+X82A9dpu+Np5N2N+qv/OX+8yfGsMW2Z7ncq+3nUZqRb3abmYdpcZH3BrBQRYxU
 cMJg2/HV+7QlJxn96Rt2+11CFEFIIcnJSFQlGhZ7tR0mnRAg15Y0kb0hqatxzeKCaw73ZgSc/xZ
 Yu98DIsF6NUfzrSAHYr7YV5QS6foBoGyFs+F1MogGd8wIUGIKpPPWKXS4CO3aMP8m6qk6S0O+nJ
 S4tIxV7p4L8DqSI9YNp9Vx47nIMWU/fB/XFmJyXIjSc2qlF9S7te75+XjKBzUFc4X2GObIzHkxH
 pTxbSmDNz9L0bHNAsPAy0Qg+1LmlTHNxJDwdpMpQKjU7fBXVMVx/3ZYby7/IvQIyugvKdU2pDx/
 jTtOx6vSMekXwnnIrhiHB4yo8IjcpdZ3fQiLdFEUknJ/kEl6tIWznhjjBtfoLR4+zsDTtEU1sg5
 GpXeU=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--10.106600-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: 4091508EF741208265B666373FB4909ACDB3CB0AED341AD535569B33382A0E1C2000:8
X-MTK: N
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

Changes in v3:
- refine the function to get system time
- refine the flow to do HDCP with content type and
  protection value which set by user space
- refine the flow to update content protection
- refine the flow to do HDCP2.x authentication
per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek
/patch/20240205055055.25340-3-mac.shen@mediatek.com/

Signed-off-by: mac.shen <mac.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile       |   1 +
 drivers/gpu/drm/mediatek/mtk_dp.c       | 321 +++++---
 drivers/gpu/drm/mediatek/mtk_dp.h       | 103 +++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c | 944 ++++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h |  25 +
 drivers/gpu/drm/mediatek/mtk_dp_reg.h   |   8 +-
 drivers/gpu/drm/mediatek/mtk_dpi.c      |   3 +
 7 files changed, 1321 insertions(+), 84 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp.h
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index f27ddfbd2e12..19b7625ae573 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -28,6 +28,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
 mtk-dp-objs := tlc_dp_hdcp.o \
+		  mtk_dp_hdcp2.o \
 		  mtk_dp.o
 
 obj-$(CONFIG_DRM_MEDIATEK_DP) += mtk-dp.o
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 536366956447..12854a04622f 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * Copyright (c) 2019-2022 MediaTek Inc.
+ * Copyright (c) 2019-2024 MediaTek Inc.
  * Copyright (c) 2022 BayLibre
  */
 
@@ -8,13 +8,13 @@
 #include <drm/display/drm_dp.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_atomic_helper.h>
-#include <drm/drm_bridge.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_panel.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 #include <linux/arm-smccc.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
@@ -30,10 +30,10 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 #include <linux/soc/mediatek/mtk_sip_svc.h>
-#include <sound/hdmi-codec.h>
-#include <video/videomode.h>
 
+#include "mtk_dp.h"
 #include "mtk_dp_reg.h"
+#include "mtk_dp_hdcp2.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
 #define MTK_DP_SIP_ATF_EDP_VIDEO_UNMUTE	(BIT(0) | BIT(5))
@@ -52,43 +52,6 @@
 #define MTK_DP_VERSION 0x11
 #define MTK_DP_SDP_AUI 0x4
 
-enum {
-	MTK_DP_CAL_GLB_BIAS_TRIM = 0,
-	MTK_DP_CAL_CLKTX_IMPSE,
-	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0,
-	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1,
-	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2,
-	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3,
-	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0,
-	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1,
-	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2,
-	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3,
-	MTK_DP_CAL_MAX,
-};
-
-struct mtk_dp_train_info {
-	bool sink_ssc;
-	bool cable_plugged_in;
-	/* link_rate is in multiple of 0.27Gbps */
-	int link_rate;
-	int lane_count;
-	unsigned int channel_eq_pattern;
-};
-
-struct mtk_dp_audio_cfg {
-	bool detect_monitor;
-	int sad_count;
-	int sample_rate;
-	int word_length_bits;
-	int channels;
-};
-
-struct mtk_dp_info {
-	enum dp_pixelformat format;
-	struct videomode vm;
-	struct mtk_dp_audio_cfg audio_cur_cfg;
-};
-
 struct mtk_dp_efuse_fmt {
 	unsigned short idx;
 	unsigned short shift;
@@ -98,44 +61,6 @@ struct mtk_dp_efuse_fmt {
 	unsigned short default_val;
 };
 
-struct mtk_dp {
-	bool enabled;
-	bool need_debounce;
-	int irq;
-	u8 max_lanes;
-	u8 max_linkrate;
-	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
-	u32 cal_data[MTK_DP_CAL_MAX];
-	u32 irq_thread_handle;
-	/* irq_thread_lock is used to protect irq_thread_handle */
-	spinlock_t irq_thread_lock;
-
-	struct device *dev;
-	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
-	struct drm_connector *conn;
-	struct drm_device *drm_dev;
-	struct drm_dp_aux aux;
-
-	const struct mtk_dp_data *data;
-	struct mtk_dp_info info;
-	struct mtk_dp_train_info train_info;
-
-	struct platform_device *phy_dev;
-	struct phy *phy;
-	struct regmap *regs;
-	struct timer_list debounce_timer;
-
-	/* For audio */
-	bool audio_enable;
-	hdmi_codec_plugged_cb plugged_cb;
-	struct platform_device *audio_pdev;
-
-	struct device *codec_dev;
-	/* protect the plugged_cb as it's used in both bridge ops and audio */
-	struct mutex update_plugged_status_lock;
-};
-
 struct mtk_dp_data {
 	int bridge_type;
 	unsigned int smc_cmd;
@@ -319,12 +244,24 @@ static struct regmap_config mtk_dp_regmap_config = {
 	.name = "mtk-dp-registers",
 };
 
+u64 mtk_dp_get_system_time(void)
+{
+	return ktime_get_mono_fast_ns();
+}
+
+u64 mtk_dp_get_time_diff(u64 pre_time)
+{
+	u64 post_time = mtk_dp_get_system_time();
+
+	return (post_time - pre_time);
+}
+
 static struct mtk_dp *mtk_dp_from_bridge(struct drm_bridge *b)
 {
 	return container_of(b, struct mtk_dp, bridge);
 }
 
-static u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
+u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset)
 {
 	u32 read_val;
 	int ret;
@@ -350,8 +287,8 @@ static int mtk_dp_write(struct mtk_dp *mtk_dp, u32 offset, u32 val)
 	return ret;
 }
 
-static int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
-			      u32 val, u32 mask)
+int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset,
+		       u32 val, u32 mask)
 {
 	int ret = regmap_update_bits(mtk_dp->regs, offset, mask, val);
 
@@ -1865,11 +1802,200 @@ static void mtk_dp_init_port(struct mtk_dp *mtk_dp)
 	mtk_dp_digital_sw_reset(mtk_dp);
 }
 
+static void mtk_dp_check_sink_esi(struct mtk_dp *mtk_dp)
+{
+	u8 clear_cp_irq = BIT(2);
+
+	/* hdcp 1.x do not need irq */
+	if (mtk_dp->hdcp_info.hdcp2_info.capable) {
+		dp_tx_hdcp2x_irq(&mtk_dp->hdcp_info);
+		drm_dp_dpcd_write(&mtk_dp->aux,
+				  DP_DEVICE_SERVICE_IRQ_VECTOR, &clear_cp_irq, 0x1);
+	}
+}
+
+static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
+{
+	ssize_t ret;
+	u8 sink_count;
+	u8 sink_count_200;
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT_ESI, &sink_count);
+	if (ret < 0) {
+		drm_info(mtk_dp->drm_dev, "Read sink count failed: %zd\n", ret);
+		return ret;
+	}
+
+	ret = drm_dp_dpcd_readb(&mtk_dp->aux, DP_SINK_COUNT, &sink_count_200);
+	if (ret < 0) {
+		drm_info(mtk_dp->drm_dev,
+			 "Read DP_SINK_COUNT_ESI failed: %zd\n", ret);
+		return ret;
+	}
+
+	mtk_dp_check_sink_esi(mtk_dp);
+
+	return 0;
+}
+
+static void mtk_dp_hdcp_get_info(struct mtk_dp *mtk_dp)
+{
+	dp_tx_hdcp2x_get_info(&mtk_dp->hdcp_info);
+}
+
+static void mtk_dp_hdcp_disable(struct mtk_dp *mtk_dp)
+{
+	mutex_lock(&mtk_dp->hdcp_mutex);
+
+	if (mtk_dp->hdcp_info.auth_status == AUTH_ZERO)
+		goto end;
+
+	if (mtk_dp->hdcp_info.auth_version == HDCP_VERSION_2X)
+		dp_tx_hdcp2x_disabel(&mtk_dp->hdcp_info);
+
+end:
+	cancel_delayed_work_sync(&mtk_dp->check_work);
+	mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_DESIRED);
+
+	mutex_unlock(&mtk_dp->hdcp_mutex);
+}
+
+static void mtk_dp_hdcp_check_work(struct work_struct *work)
+{
+	struct mtk_dp *mtk_dp = container_of(to_delayed_work(work),
+		struct mtk_dp, check_work);
+
+	if (mtk_dp->hdcp_info.auth_version == HDCP_VERSION_2X &&
+	    (!dp_tx_hdcp2x_check_link(&mtk_dp->hdcp_info))) {
+		schedule_delayed_work(&mtk_dp->check_work, DRM_HDCP2_CHECK_PERIOD_MS);
+	}
+}
+
+static void mtk_dp_hdcp_handle(struct work_struct *data)
+{
+	struct mtk_dp *mtk_dp = container_of(data, struct mtk_dp, hdcp_work);
+	unsigned long check_link_interval = DRM_HDCP_CHECK_PERIOD_MS;
+	int ret = -EINVAL;
+
+	mutex_lock(&mtk_dp->hdcp_mutex);
+
+	if (mtk_dp->hdcp_info.auth_status == AUTH_PASS)
+		goto end;
+
+	mtk_dp_hdcp_get_info(mtk_dp);
+
+	if (mtk_dp->hdcp_info.hdcp2_info.capable) {
+		ret = dp_tx_hdcp2x_enable(&mtk_dp->hdcp_info);
+		if (!ret)
+			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
+	}
+
+	if (!ret) {
+		schedule_delayed_work(&mtk_dp->check_work, check_link_interval);
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_ENABLED);
+	}
+
+end:
+	mutex_unlock(&mtk_dp->hdcp_mutex);
+}
+
+static void mtk_dp_hdcp_enable(struct mtk_dp *mtk_dp)
+{
+	if (!mtk_dp->train_info.cable_plugged_in || !mtk_dp->enabled)
+		return;
+
+	dev_info(mtk_dp->dev, "[HDCP] dp start HDCP work\n");
+	queue_work(mtk_dp->hdcp_workqueue, &mtk_dp->hdcp_work);
+}
+
+static void mtk_dp_hdcp_prop_work(struct work_struct *work)
+{
+	struct mtk_dp *mtk_dp;
+	struct drm_device *drm_dev;
+
+	mtk_dp = container_of(work, struct mtk_dp, prop_work);
+
+	if (!mtk_dp->conn) {
+		dev_err(mtk_dp->dev, "[HDCP] Connector is null\n");
+		return;
+	}
+
+	drm_dev = mtk_dp->conn->dev;
+
+	drm_modeset_lock(&drm_dev->mode_config.connection_mutex, NULL);
+
+	if (mtk_dp->hdcp_info.content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
+		dev_info(mtk_dp->dev, "[HDCP] Update CP, content protection: %d, auth status:%d\n",
+			 mtk_dp->hdcp_info.content_protection, mtk_dp->hdcp_info.auth_status);
+
+		/* only update between ENABLED/DESIRED */
+		drm_hdcp_update_content_protection(mtk_dp->conn,
+						   mtk_dp->hdcp_info.content_protection);
+	}
+
+	drm_modeset_unlock(&drm_dev->mode_config.connection_mutex);
+}
+
+void mtk_dp_hdcp_update_value(struct mtk_dp *mtk_dp, u32 value)
+{
+	if (mtk_dp->hdcp_info.content_protection == value)
+		return;
+
+	mtk_dp->hdcp_info.content_protection = value;
+	if (mtk_dp->hdcp_info.content_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+		return;
+
+	schedule_work(&mtk_dp->prop_work);
+}
+
+static void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, struct drm_connector_state *state)
+{
+	unsigned int current_protection = mtk_dp->hdcp_info.content_protection;
+	unsigned int new_protection = state->content_protection;
+	bool type_changed = state->hdcp_content_type != mtk_dp->hdcp_info.hdcp_content_type;
+	bool protection_changed = current_protection != new_protection;
+	bool disable = false;
+	bool enable = false;
+
+	dev_dbg(mtk_dp->dev, "[HDCP] atomic check, old[%d, %d], new[%d, %d]\n",
+		mtk_dp->hdcp_info.content_protection, mtk_dp->hdcp_info.hdcp_content_type,
+		state->content_protection, state->hdcp_content_type);
+
+	if (type_changed) {
+		/*
+		 * With the current protection as ENABLED/DESIRED,
+		 * re-authenticate with new content type if the content type changed.
+		 */
+		mtk_dp->hdcp_info.hdcp_content_type = state->hdcp_content_type;
+		mtk_dp->hdcp_info.hdcp2_info.stream_id_type = state->hdcp_content_type;
+
+		if (current_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+			disable = true;
+
+		if (new_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+			enable = true;
+	} else if (protection_changed) {
+		if (new_protection == DRM_MODE_CONTENT_PROTECTION_UNDESIRED)
+			disable = true;
+		else
+			enable = true;
+	}
+
+	if (disable)
+		mtk_dp_hdcp_disable(mtk_dp);
+
+	if (enable) {
+		mtk_dp->hdcp_info.content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
+		mtk_dp_hdcp_enable(mtk_dp);
+	}
+}
+
 static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 {
 	struct mtk_dp *mtk_dp = dev;
 	unsigned long flags;
 	u32 status;
+	int ret;
 
 	if (mtk_dp->need_debounce && mtk_dp->train_info.cable_plugged_in)
 		msleep(100);
@@ -1894,8 +2020,13 @@ static irqreturn_t mtk_dp_hpd_event_thread(int hpd, void *dev)
 		}
 	}
 
-	if (status & MTK_DP_THREAD_HPD_EVENT)
+	if (status & MTK_DP_THREAD_HPD_EVENT) {
 		dev_dbg(mtk_dp->dev, "Receive IRQ from sink devices\n");
+		/* check if need clear hpd irq */
+		ret = mtk_dp_hpd_sink_event(mtk_dp);
+		if (ret)
+			dev_err(mtk_dp->dev, "Fail to process hpd sink event\n");
+	}
 
 	return IRQ_HANDLED;
 }
@@ -2242,6 +2373,7 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 					struct drm_bridge_state *old_state)
 {
 	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	struct drm_connector_state *connector_state;
 	int ret;
 
 	mtk_dp->conn = drm_atomic_get_new_connector_for_encoder(old_state->base.state,
@@ -2252,6 +2384,8 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 		return;
 	}
 
+	connector_state = drm_atomic_get_connector_state(old_state->base.state, mtk_dp->conn);
+
 	mtk_dp_aux_panel_poweron(mtk_dp, true);
 
 	/* Training */
@@ -2281,6 +2415,14 @@ static void mtk_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	mtk_dp->enabled = true;
 	mtk_dp_update_plugged_status(mtk_dp);
 
+	/* Enable hdcp if it's desired */
+	dev_dbg(mtk_dp->dev, "hdcp_content_type:%d, content protection: %d",
+		connector_state->hdcp_content_type, connector_state->content_protection);
+	if (connector_state->content_protection == DRM_MODE_CONTENT_PROTECTION_DESIRED) {
+		mtk_dp->hdcp_info.hdcp_content_type = connector_state->hdcp_content_type;
+		mtk_dp_hdcp_enable(mtk_dp);
+	}
+
 	return;
 power_off_aux:
 	mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
@@ -2427,6 +2569,8 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	drm_display_mode_to_videomode(&crtc_state->adjusted_mode, &mtk_dp->info.vm);
 
+	mtk_dp_hdcp_atomic_check(mtk_dp, conn_state);
+
 	return 0;
 }
 
@@ -2666,6 +2810,17 @@ static int mtk_dp_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	mutex_init(&mtk_dp->hdcp_mutex);
+	init_waitqueue_head(&mtk_dp->hdcp_info.hdcp2_info.cp_irq_queue);
+	INIT_WORK(&mtk_dp->hdcp_work, mtk_dp_hdcp_handle);
+	INIT_WORK(&mtk_dp->prop_work, mtk_dp_hdcp_prop_work);
+	INIT_DELAYED_WORK(&mtk_dp->check_work, mtk_dp_hdcp_check_work);
+	mtk_dp->hdcp_workqueue = create_workqueue("mtk_dp_hdcp_work");
+	if (!mtk_dp->hdcp_workqueue) {
+		dev_err(mtk_dp->dev, "failed to create hdcp work queue");
+		return -ENOMEM;
+	}
+
 	mtk_dp->bridge.funcs = &mtk_dp_bridge_funcs;
 	mtk_dp->bridge.of_node = dev->of_node;
 	mtk_dp->bridge.type = mtk_dp->data->bridge_type;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.h b/drivers/gpu/drm/mediatek/mtk_dp.h
new file mode 100644
index 000000000000..dfeaf12c7d58
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp.h
@@ -0,0 +1,103 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#ifndef _MTK_DP_H_
+#define _MTK_DP_H_
+
+#include "tlc_dp_hdcp.h"
+#include <drm/drm_bridge.h>
+#include <sound/hdmi-codec.h>
+#include <video/videomode.h>
+
+#define MS_TO_NS(x)        ((x) * NSEC_PER_MSEC)
+
+enum {
+	MTK_DP_CAL_GLB_BIAS_TRIM = 0,
+	MTK_DP_CAL_CLKTX_IMPSE,
+	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_0,
+	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_1,
+	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_2,
+	MTK_DP_CAL_LN_TX_IMPSEL_PMOS_3,
+	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_0,
+	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_1,
+	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_2,
+	MTK_DP_CAL_LN_TX_IMPSEL_NMOS_3,
+	MTK_DP_CAL_MAX,
+};
+
+struct mtk_dp_audio_cfg {
+	bool detect_monitor;
+	int sad_count;
+	int sample_rate;
+	int word_length_bits;
+	int channels;
+};
+
+struct mtk_dp_info {
+	enum dp_pixelformat format;
+	struct videomode vm;
+	struct mtk_dp_audio_cfg audio_cur_cfg;
+};
+
+struct mtk_dp_train_info {
+	bool sink_ssc;
+	bool cable_plugged_in;
+	/* link_rate is in multiple of 0.27Gbps */
+	int link_rate;
+	int lane_count;
+	unsigned int channel_eq_pattern;
+};
+
+struct mtk_dp {
+	bool enabled;
+	bool need_debounce;
+	int irq;
+	u8 max_lanes;
+	u8 max_linkrate;
+	u8 rx_cap[DP_RECEIVER_CAP_SIZE];
+	u32 cal_data[MTK_DP_CAL_MAX];
+	u32 irq_thread_handle;
+	/* irq_thread_lock is used to protect irq_thread_handle */
+	spinlock_t irq_thread_lock;
+
+	struct device *dev;
+	struct drm_bridge bridge;
+	struct drm_bridge *next_bridge;
+	struct drm_connector *conn;
+	struct drm_device *drm_dev;
+	struct drm_dp_aux aux;
+
+	const struct mtk_dp_data *data;
+	struct mtk_dp_info info;
+	struct mtk_dp_train_info train_info;
+	struct mtk_hdcp_info hdcp_info;
+	struct work_struct hdcp_work;
+	struct work_struct prop_work;
+	struct delayed_work check_work;
+	struct workqueue_struct *hdcp_workqueue;
+	/* This mutex is used to synchronize HDCP operations in the driver */
+	struct mutex hdcp_mutex;
+
+	struct platform_device *phy_dev;
+	struct phy *phy;
+	struct regmap *regs;
+	struct timer_list debounce_timer;
+
+	/* For audio */
+	bool audio_enable;
+	hdmi_codec_plugged_cb plugged_cb;
+	struct platform_device *audio_pdev;
+
+	struct device *codec_dev;
+	/* protect the plugged_cb as it's used in both bridge ops and audio */
+	struct mutex update_plugged_status_lock;
+};
+
+u64 mtk_dp_get_system_time(void);
+u64 mtk_dp_get_time_diff(u64 pre_time);
+u32 mtk_dp_read(struct mtk_dp *mtk_dp, u32 offset);
+int mtk_dp_update_bits(struct mtk_dp *mtk_dp, u32 offset, u32 val, u32 mask);
+void mtk_dp_hdcp_update_value(struct mtk_dp *mtk_dp, u32 value);
+#endif /* _MTK_DP_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
new file mode 100644
index 000000000000..e8affa4343c1
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.c
@@ -0,0 +1,944 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#include <drm/display/drm_hdcp_helper.h>
+
+#include "mtk_dp_hdcp2.h"
+#include "mtk_dp_reg.h"
+#include "mtk_dp.h"
+
+#define HDCP2_LC_RETRY_CNT			3
+
+static u8 t_rtx[HDCP_2_2_RTX_LEN] = {
+	0x18, 0xfa, 0xe4, 0x20, 0x6a, 0xfb, 0x51, 0x49
+};
+
+static u8 t_tx_caps[HDCP_2_2_TXCAPS_LEN] = {
+	0x02, 0x00, 0x00
+};
+
+static u8 t_rn[HDCP_2_2_RN_LEN] = {
+	0x32, 0x75, 0x3e, 0xa8, 0x78, 0xa6, 0x38, 0x1c
+};
+
+static u8 t_riv[HDCP_2_2_RIV_LEN] = {
+	0x40, 0x2b, 0x6b, 0x43, 0xc5, 0xe8, 0x86, 0xd8
+};
+
+static void dp_tx_hdcp2x_fill_stream_type(struct mtk_hdcp_info *hdcp_info, u8 uc_type)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34D0, uc_type, 0xff);
+}
+
+static void dp_tx_hdcp2x_set_auth_pass(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+
+	if (enable) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3400,
+				   HDCP_SEL_DP_TRANS_P0_MASK, HDCP_SEL_DP_TRANS_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4,
+				   HDCP22_AUTH_DONE_DP_TRANS_P0_MASK,
+				   HDCP22_AUTH_DONE_DP_TRANS_P0_MASK);
+	} else {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3400, 0, HDCP_SEL_DP_TRANS_P0_MASK);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4, 0,
+				   HDCP22_AUTH_DONE_DP_TRANS_P0_MASK);
+	}
+}
+
+static int dp_tx_hdcp2x_enable_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u32 version;
+	int ret;
+
+	dp_tx_hdcp2x_set_auth_pass(hdcp_info, enable);
+	if (!enable) {
+		ret = tee_hdcp_enable_encrypt(hdcp_info, enable, HDCP_NONE);
+		if (ret)
+			return ret;
+		mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000, 0, HDCP_FRAME_EN_DP_ENC0_P0);
+
+		return 0;
+	}
+
+	if (HDCP_2_2_HDCP1_DEVICE_CONNECTED(hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info[1]))
+		version = HDCP_V1;
+	else if (HDCP_2_2_HDCP_2_0_REP_CONNECTED
+		(hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info[1]))
+		version = HDCP_V2;
+	else
+		version = HDCP_V2_3;
+
+	ret = tee_hdcp_enable_encrypt(hdcp_info, enable, version);
+	if (ret)
+		return ret;
+	mtk_dp_update_bits(mtk_dp, MTK_DP_ENC0_P0_3000,
+			   HDCP_FRAME_EN_DP_ENC0_P0, HDCP_FRAME_EN_DP_ENC0_P0);
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_init(struct mtk_hdcp_info *hdcp_info)
+{
+	int ret;
+
+	memset(&hdcp_info->hdcp2_info.hdcp_tx, 0, sizeof(struct hdcp2_info_tx));
+	memset(&hdcp_info->hdcp2_info.hdcp_rx, 0, sizeof(struct hdcp2_info_rx));
+	memset(&hdcp_info->hdcp2_info.ake_stored_km, 0, sizeof(struct hdcp2_ake_stored_km));
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.ake_init.r_tx, t_rtx, HDCP_2_2_RTX_LEN);
+	memcpy(&hdcp_info->hdcp2_info.hdcp_tx.tx_caps, t_tx_caps, HDCP_2_2_TXCAPS_LEN);
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.lc_init.r_n, t_rn, HDCP_2_2_RN_LEN);
+	memcpy(hdcp_info->hdcp2_info.hdcp_tx.send_eks.riv, t_riv, HDCP_2_2_RIV_LEN);
+
+	ret = dp_tx_hdcp2x_enable_auth(hdcp_info, false);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_inc_seq_num_m(struct mtk_hdcp_info *hdcp_info)
+{
+	u32 tmp = drm_hdcp_be24_to_cpu(hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m);
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+
+	if (tmp == HDCP_2_2_SEQ_NUM_MAX) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] With seq num max\n");
+		return -EINVAL;
+	}
+
+	tmp++;
+
+	drm_hdcp_cpu_to_be24(hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m, tmp);
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_process_rep_auth_stream_manage(struct mtk_hdcp_info *hdcp_info)
+{
+	hdcp_info->hdcp2_info.hdcp_tx.k[0] = 0x00;
+	hdcp_info->hdcp2_info.hdcp_tx.k[1] = 0x01;
+
+	hdcp_info->hdcp2_info.hdcp_tx.stream_id_type[0] = 0x00; /* Payload ID */
+	hdcp_info->hdcp2_info.hdcp_tx.stream_id_type[1] = hdcp_info->hdcp2_info.stream_id_type;
+
+	return dp_tx_hdcp2x_inc_seq_num_m(hdcp_info);
+}
+
+static int dp_tx_hdcp2x_recv_rep_auth_send_recv_id_list(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u32 len = 0, len_recv_id_list = 0;
+	u8 *buffer = NULL;
+	int ret = 0;
+
+	len_recv_id_list = hdcp_info->hdcp2_info.device_count * HDCP_2_2_RECEIVER_ID_LEN;
+	len = len_recv_id_list + HDCP_2_2_RXINFO_LEN + HDCP_2_2_SEQ_NUM_LEN;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] Out of memory\n");
+		return -ENOMEM;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp2_info.hdcp_rx.recvid_list.receiver_ids,
+	       len_recv_id_list);
+	memcpy(buffer + len_recv_id_list,
+	       hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info, HDCP_2_2_RXINFO_LEN);
+	memcpy(buffer + len_recv_id_list + HDCP_2_2_RXINFO_LEN,
+	       hdcp_info->hdcp2_info.hdcp_rx.recvid_list.seq_num_v, HDCP_2_2_SEQ_NUM_LEN);
+
+	ret = tee_hdcp2_compute_compare_v(hdcp_info, buffer, len,
+					  hdcp_info->hdcp2_info.hdcp_rx.recvid_list.v_prime,
+		hdcp_info->hdcp2_info.hdcp_tx.send_ack.v);
+
+	kfree(buffer);
+
+	return ret;
+}
+
+static int dp_tx_hdcp2x_recv_rep_auth_stream_ready(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 *buffer = NULL;
+	u32 len = 0;
+	int ret = 0;
+
+	len = HDCP2_STREAMID_TYPE_LEN + HDCP_2_2_SEQ_NUM_LEN;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] Out of memory\n");
+		return -ENOMEM;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp2_info.hdcp_tx.stream_id_type, HDCP2_STREAMID_TYPE_LEN);
+	memcpy(buffer + HDCP2_STREAMID_TYPE_LEN,
+	       hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m,
+	       HDCP_2_2_SEQ_NUM_LEN);
+	ret = tee_hdcp2_compute_compare_m(hdcp_info, buffer, len,
+					  hdcp_info->hdcp2_info.hdcp_rx.stream_ready.m_prime);
+
+	kfree(buffer);
+
+	return ret;
+}
+
+static void dp_tx_hdcp2x_wait_for_cp_irq(struct mtk_hdcp_info *hdcp_info, int timeout)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	long ret;
+
+#define C (hdcp_info->hdcp2_info.cp_irq_cached != atomic_read(&hdcp_info->hdcp2_info.cp_irq))
+	ret = wait_event_interruptible_timeout(hdcp_info->hdcp2_info.cp_irq_queue, C,
+					       msecs_to_jiffies(timeout));
+	if (!ret)
+		dev_dbg(mtk_dp->dev, "[HDCP2.X] Timedout at waiting for CP_IRQ\n");
+}
+
+static int dp_tx_hdcp2x_read_ake_send_cert(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ktime_t msg_end;
+	bool msg_expired;
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_AKE_SEND_CERT\n");
+
+	mdelay(HDCP_2_2_CERT_TIMEOUT_MS);
+
+	msg_end = ktime_add_ms(ktime_get_raw(), HDCP_2_2_DP_CERT_READ_TIMEOUT_MS);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_AKE_SEND_CERT_OFFSET,
+			       (void *)&hdcp_info->hdcp2_info.hdcp_rx.cert_rx, HDCP2_CERTRX_LEN);
+	if (ret < 0)
+		return ret;
+
+	msg_expired = ktime_after(ktime_get_raw(), msg_end);
+	if (msg_expired)
+		dev_dbg(mtk_dp->dev, "[HDCP2.X] Timeout to read Ake send cert\n");
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RRX_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.send_cert.r_rx, HDCP_2_2_RRX_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RX_CAPS_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.send_cert.rx_caps,
+		HDCP_2_2_RXCAPS_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_read_ake_send_hprime(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ktime_t msg_end;
+	bool msg_expired;
+	u8 rx_status = 0;
+	int timeout;
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_AKE_SEND_HPRIME\n");
+
+	timeout = hdcp_info->hdcp2_info.stored_km ?
+		HDCP_2_2_HPRIME_PAIRED_TIMEOUT_MS : HDCP_2_2_HPRIME_NO_PAIRED_TIMEOUT_MS;
+
+	dp_tx_hdcp2x_wait_for_cp_irq(hdcp_info, timeout);
+	hdcp_info->hdcp2_info.cp_irq_cached = atomic_read(&hdcp_info->hdcp2_info.cp_irq);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, &rx_status,
+			       HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret != HDCP_2_2_DP_RXSTATUS_LEN)
+		return ret >= 0 ? -EIO : ret;
+
+	if (!HDCP_2_2_DP_RXSTATUS_H_PRIME(rx_status))
+		return -EAGAIN;
+
+	msg_end = ktime_add_ms(ktime_get_raw(), HDCP_2_2_DP_HPRIME_READ_TIMEOUT_MS);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_AKE_SEND_HPRIME_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.send_hprime.h_prime,
+		HDCP_2_2_H_PRIME_LEN);
+	if (ret < 0)
+		return ret;
+
+	msg_expired = ktime_after(ktime_get_raw(), msg_end);
+	if (msg_expired)
+		dev_dbg(mtk_dp->dev, "[HDCP2.X] Timeout to read AKE hprime\n");
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_read_ake_send_pairing_info(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ktime_t msg_end;
+	bool msg_expired;
+	u8 rx_status = 0;
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_AKE_SEND_PAIRING_INFO\n");
+
+	dp_tx_hdcp2x_wait_for_cp_irq(hdcp_info, HDCP_2_2_PAIRING_TIMEOUT_MS);
+	hdcp_info->hdcp2_info.cp_irq_cached = atomic_read(&hdcp_info->hdcp2_info.cp_irq);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, &rx_status,
+			       HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret != HDCP_2_2_DP_RXSTATUS_LEN)
+		return ret >= 0 ? -EIO : ret;
+
+	if (!HDCP_2_2_DP_RXSTATUS_PAIRING(rx_status))
+		return -EAGAIN;
+
+	msg_end = ktime_add_ms(ktime_get_raw(), HDCP_2_2_DP_PAIRING_READ_TIMEOUT_MS);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_AKE_SEND_PAIRING_INFO_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.pairing_info.e_kh_km,
+		HDCP_2_2_E_KH_KM_LEN);
+	if (ret < 0)
+		return ret;
+
+	msg_expired = ktime_after(ktime_get_raw(), msg_end);
+	if (msg_expired)
+		dev_err(mtk_dp->dev, "[HDCP2.X] Timeout to read pairing info\n");
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_read_lc_send_lprime(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_LC_SEND_LPRIME\n");
+
+	mdelay(HDCP_2_2_DP_LPRIME_TIMEOUT_MS);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_LC_SEND_LPRIME_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.send_lprime.l_prime,
+		HDCP_2_2_L_PRIME_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_read_rep_send_recvid_list(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 rx_status = 0;
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_REP_SEND_RECVID_LIST\n");
+
+	dp_tx_hdcp2x_wait_for_cp_irq(hdcp_info, HDCP_2_2_RECVID_LIST_TIMEOUT_MS);
+	hdcp_info->hdcp2_info.cp_irq_cached = atomic_read(&hdcp_info->hdcp2_info.cp_irq);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, &rx_status,
+			       HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret != HDCP_2_2_DP_RXSTATUS_LEN)
+		return ret >= 0 ? -EIO : ret;
+
+	if (!HDCP_2_2_DP_RXSTATUS_READY(rx_status)) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] RX status no ready\n");
+		return -EAGAIN;
+	}
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REP_SEND_RECVID_LIST_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info,
+		HDCP_2_2_RXINFO_LEN);
+	if (ret < 0)
+		return ret;
+
+	hdcp_info->hdcp2_info.device_count =
+	(HDCP_2_2_DEV_COUNT_HI(hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info[0]) << 4 |
+	HDCP_2_2_DEV_COUNT_LO(hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info[1]));
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_SEQ_NUM_V_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.recvid_list.seq_num_v,
+		HDCP_2_2_SEQ_NUM_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_VPRIME_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.recvid_list.v_prime,
+		HDCP_2_2_V_PRIME_HALF_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RECV_ID_LIST_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.recvid_list.receiver_ids,
+		hdcp_info->hdcp2_info.device_count * HDCP_2_2_RECEIVER_ID_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_read_rep_stream_ready(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_REP_STREAM_READY\n");
+
+	mdelay(HDCP_2_2_STREAM_READY_TIMEOUT_MS);
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REP_STREAM_READY_OFFSET,
+			       hdcp_info->hdcp2_info.hdcp_rx.stream_ready.m_prime,
+		HDCP_2_2_MPRIME_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_ake_init(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_AKE_Init\n");
+
+	ret = tee_hdcp2_soft_rst(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_AKE_INIT_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.ake_init.r_tx, HDCP_2_2_RTX_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_TXCAPS_OFFSET,
+				(void *)&hdcp_info->hdcp2_info.hdcp_tx.tx_caps,
+			  HDCP_2_2_TXCAPS_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_ake_no_stored_km(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_AKE_NO_STORED_KM\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_AKE_NO_STORED_KM_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.no_stored_km.e_kpub_km,
+		HDCP_2_2_E_KPUB_KM_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_ake_stored_km(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_AKE_STORED_KM\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_AKE_STORED_KM_OFFSET,
+				hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m,
+		HDCP_2_2_E_KH_KM_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_M_OFFSET,
+				hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m +
+		HDCP_2_2_E_KH_KM_LEN,
+		HDCP_2_2_E_KH_KM_M_LEN - HDCP_2_2_E_KH_KM_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_lc_init(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_LC_INIT\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_LC_INIT_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.lc_init.r_n, HDCP_2_2_RN_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_ske_send_eks(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_SKE_SEND_EKS\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_SKE_SEND_EKS_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.send_eks.e_dkey_ks,
+		HDCP_2_2_E_DKEY_KS_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_RIV_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.send_eks.riv, HDCP_2_2_RIV_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_stream_type(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] Write stream type\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_STREAM_TYPE_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.stream_id_type, 1);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_send_ack(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_SEND_ACK\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REP_SEND_ACK_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.send_ack.v,
+		HDCP_2_2_V_PRIME_HALF_LEN);
+	if (ret < 0)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_write_stream_manage(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	ssize_t ret;
+
+	dev_dbg(mtk_dp->dev, "[HDCP2.X] HDCP_2_2_STREAM_MANAGE\n");
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REP_STREAM_MANAGE_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.stream_manage.seq_num_m,
+		HDCP_2_2_SEQ_NUM_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_K_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.k, HDCP2_K_LEN);
+	if (ret < 0)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_HDCP_2_2_REG_STREAM_ID_TYPE_OFFSET,
+				hdcp_info->hdcp2_info.hdcp_tx.stream_id_type,
+		HDCP2_STREAMID_TYPE_LEN);
+	if (ret < 0)
+		return ret;
+
+	dp_tx_hdcp2x_fill_stream_type(hdcp_info, hdcp_info->hdcp2_info.stream_id_type);
+
+	return 0;
+}
+
+/* Authentication flow starts from here */
+static int dp_tx_hdcp2x_key_exchange(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	bool stored;
+	int ret;
+
+	if (!hdcp_info->hdcp2_info.capable)
+		return -EAGAIN;
+
+	ret = dp_tx_hdcp2x_init(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp2x_write_ake_init(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp2x_read_ake_send_cert(hdcp_info);
+	if (ret)
+		return ret;
+
+	hdcp_info->hdcp2_info.repeater =
+		HDCP_2_2_RX_REPEATER(hdcp_info->hdcp2_info.hdcp_rx.send_cert.rx_caps[2]);
+
+	if (drm_hdcp_check_ksvs_revoked(mtk_dp->drm_dev,
+					hdcp_info->hdcp2_info.hdcp_rx.send_cert.cert_rx.receiver_id,
+					1) > 0) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] Receiver ID is revoked\n");
+		return -EPERM;
+	}
+
+	ret = tee_ake_certificate(hdcp_info,
+				  (u8 *)&hdcp_info->hdcp2_info.hdcp_rx.cert_rx, &stored,
+		hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m +
+		HDCP_2_2_E_KH_KM_LEN,
+		hdcp_info->hdcp2_info.ake_stored_km.e_kh_km_m);
+	if (ret)
+		return ret;
+
+	hdcp_info->hdcp2_info.stored_km = stored;
+
+	if (!hdcp_info->hdcp2_info.stored_km) {
+		ret = tee_enc_rsaes_oaep(hdcp_info,
+					 hdcp_info->hdcp2_info.hdcp_tx.no_stored_km.e_kpub_km);
+		if (ret)
+			return ret;
+
+		ret = dp_tx_hdcp2x_write_ake_no_stored_km(hdcp_info);
+		if (ret)
+			return ret;
+
+	} else {
+		ret = dp_tx_hdcp2x_write_ake_stored_km(hdcp_info);
+		if (ret)
+			return ret;
+	}
+
+	ret = dp_tx_hdcp2x_read_ake_send_hprime(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = tee_ake_h_prime(hdcp_info,
+			      hdcp_info->hdcp2_info.hdcp_tx.ake_init.r_tx,
+		hdcp_info->hdcp2_info.hdcp_rx.send_cert.r_rx,
+		hdcp_info->hdcp2_info.hdcp_rx.send_cert.rx_caps,
+		(u8 *)&hdcp_info->hdcp2_info.hdcp_tx.tx_caps,
+		hdcp_info->hdcp2_info.hdcp_rx.send_hprime.h_prime,
+		HDCP_2_2_H_PRIME_LEN);
+	if (ret) {
+		if (hdcp_info->hdcp2_info.stored_km)
+			tee_clear_paring(hdcp_info);
+		return ret;
+	}
+
+	if (!hdcp_info->hdcp2_info.stored_km) {
+		ret = dp_tx_hdcp2x_read_ake_send_pairing_info(hdcp_info);
+		if (ret)
+			return ret;
+
+		/* Store m, km, Ekh(km) */
+		ret = tee_ake_paring(hdcp_info,
+				     hdcp_info->hdcp2_info.hdcp_rx.pairing_info.e_kh_km);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_locality_check(struct mtk_hdcp_info *hdcp_info)
+{
+	int ret, i, tries = HDCP2_LC_RETRY_CNT;
+
+	for (i = 0; i < tries; i++) {
+		ret = dp_tx_hdcp2x_write_lc_init(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = dp_tx_hdcp2x_read_lc_send_lprime(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = tee_lc_l_prime(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.lc_init.r_n,
+				     hdcp_info->hdcp2_info.hdcp_rx.send_lprime.l_prime,
+				     HDCP_2_2_L_PRIME_LEN);
+		if (!ret)
+			return 0;
+	}
+
+	return ret;
+}
+
+static int dp_tx_hdcp2x_session_key_exchange(struct mtk_hdcp_info *hdcp_info)
+{
+	int ret;
+
+	ret = tee_ske_enc_ks(hdcp_info, hdcp_info->hdcp2_info.hdcp_tx.send_eks.riv,
+			     hdcp_info->hdcp2_info.hdcp_tx.send_eks.e_dkey_ks);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp2x_write_ske_send_eks(hdcp_info);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static
+int dp_tx_hdcp2x_authenticate_repeater(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 *rx_info;
+	int ret;
+
+	ret = dp_tx_hdcp2x_read_rep_send_recvid_list(hdcp_info);
+	if (ret)
+		return ret;
+
+	rx_info = hdcp_info->hdcp2_info.hdcp_rx.recvid_list.rx_info;
+
+	if (HDCP_2_2_MAX_CASCADE_EXCEEDED(rx_info[1]) ||
+	    HDCP_2_2_MAX_DEVS_EXCEEDED(rx_info[1])) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] Topology max size exceeded\n");
+		return -EINVAL;
+	}
+
+	if (drm_hdcp_check_ksvs_revoked(mtk_dp->drm_dev,
+					hdcp_info->hdcp2_info.hdcp_rx.recvid_list.receiver_ids,
+					hdcp_info->hdcp2_info.device_count) > 0) {
+		dev_err(mtk_dp->dev, "[HDCP2.X] Revoked receiver ID(s) is in list\n");
+		return -EPERM;
+	}
+
+	ret = dp_tx_hdcp2x_recv_rep_auth_send_recv_id_list(hdcp_info);
+	if (ret)
+		return -EINVAL;
+
+	ret = dp_tx_hdcp2x_write_send_ack(hdcp_info);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp2x_authenticate(struct mtk_hdcp_info *hdcp_info)
+{
+	int ret;
+
+	ret = dp_tx_hdcp2x_key_exchange(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp2x_locality_check(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp2x_session_key_exchange(hdcp_info);
+	if (ret)
+		return ret;
+
+	if (!hdcp_info->hdcp2_info.repeater) {
+		ret = dp_tx_hdcp2x_write_stream_type(hdcp_info);
+		if (ret)
+			return ret;
+	}
+
+	if (hdcp_info->hdcp2_info.repeater) {
+		ret = dp_tx_hdcp2x_authenticate_repeater(hdcp_info);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+static
+int dp_tx_hdcp2x_propagate_stream_management_info(struct mtk_hdcp_info *hdcp_info)
+{
+	int i, ret, tries = 3;
+
+	if (!hdcp_info->hdcp2_info.repeater)
+		return 0;
+
+	for (i = 0; i < tries; i++) {
+		ret = dp_tx_hdcp2x_process_rep_auth_stream_manage(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = dp_tx_hdcp2x_write_stream_manage(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = dp_tx_hdcp2x_read_rep_stream_ready(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = dp_tx_hdcp2x_recv_rep_auth_stream_ready(hdcp_info);
+		if (!ret)
+			return 0;
+	}
+
+	return ret;
+}
+
+void dp_tx_hdcp2x_get_info(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 tmp[3];
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux,
+			       DP_HDCP_2_2_REG_RX_CAPS_OFFSET, tmp, HDCP_2_2_RXCAPS_LEN);
+	if (ret < 0)
+		return;
+
+	if (!HDCP_2_2_DP_HDCP_CAPABLE(tmp[2]) || tmp[0] != HDCP_2_2_RX_CAPS_VERSION_VAL) {
+		hdcp_info->hdcp2_info.capable = false;
+	} else {
+		hdcp_info->hdcp2_info.capable = true;
+		hdcp_info->hdcp2_info.repeater = HDCP_2_2_RX_REPEATER(tmp[2]);
+	}
+
+	dev_info(mtk_dp->dev, "[HDCP2.X] Capable: %d, Reapeater: %d\n",
+		 hdcp_info->hdcp2_info.capable,
+		 hdcp_info->hdcp2_info.repeater);
+}
+
+int dp_tx_hdcp2x_enable(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int ret, i, tries = 3;
+
+	hdcp_info->auth_status = AUTH_INIT;
+
+	ret = tee_add_device(hdcp_info, HDCP_VERSION_2X);
+	if (ret)
+		goto fail2;
+
+	for (i = 0; i < tries; i++) {
+		ret = dp_tx_hdcp2x_authenticate(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = dp_tx_hdcp2x_propagate_stream_management_info(hdcp_info);
+		if (!ret) {
+			dev_dbg(mtk_dp->dev, "[HDCP2.X] Stream management done\n");
+			break;
+		}
+	}
+	if (i == tries)
+		goto fail1;
+
+	msleep(HDCP_2_2_DELAY_BEFORE_ENCRYPTION_EN);
+	ret = dp_tx_hdcp2x_enable_auth(hdcp_info, true);
+	if (!ret) {
+		hdcp_info->auth_version = HDCP_VERSION_2X;
+		hdcp_info->auth_status = AUTH_PASS;
+		dev_info(mtk_dp->dev, "[HDCP2.X] Authentication done\n");
+
+		return 0;
+	}
+
+fail1:
+	tee_remove_device(hdcp_info);
+
+fail2:
+	hdcp_info->auth_status = AUTH_FAIL;
+	dev_err(mtk_dp->dev, "[HDCP2.X] Authentication fail\n");
+
+	return ret;
+}
+
+int dp_tx_hdcp2x_disabel(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int ret;
+
+	if (hdcp_info->auth_status == AUTH_PASS) {
+		ret = dp_tx_hdcp2x_enable_auth(hdcp_info, false);
+		if (ret)
+			return ret;
+	}
+
+	tee_remove_device(hdcp_info);
+
+	hdcp_info->auth_version = HDCP_NONE;
+	hdcp_info->auth_status = AUTH_ZERO;
+	dev_info(mtk_dp->dev, "[HDCP2.X] Disable Authentication\n");
+
+	return 0;
+}
+
+int dp_tx_hdcp2x_check_link(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 rx_status;
+	int ret = -EINVAL;
+	int tmp = 0;
+
+	mutex_lock(&mtk_dp->hdcp_mutex);
+
+	if (mtk_dp->hdcp_info.auth_status != AUTH_PASS)
+		goto end;
+
+	if (!mtk_dp->train_info.cable_plugged_in || !mtk_dp->enabled)
+		goto disable;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_HDCP_2_2_REG_RXSTATUS_OFFSET, &rx_status,
+			       HDCP_2_2_DP_RXSTATUS_LEN);
+	if (ret != HDCP_2_2_DP_RXSTATUS_LEN) {
+		dev_dbg(mtk_dp->dev, "[HDCP2.X] Read bstatus failed, reauth\n");
+		goto disable;
+	}
+
+	if (HDCP_2_2_DP_RXSTATUS_REAUTH_REQ(rx_status))
+		tmp = REAUTH_REQUEST;
+	else if (HDCP_2_2_DP_RXSTATUS_LINK_FAILED(rx_status))
+		tmp = LINK_INTEGRITY_FAILURE;
+	else if (HDCP_2_2_DP_RXSTATUS_READY(rx_status))
+		tmp = TOPOLOGY_CHANGE;
+
+	if (tmp == LINK_PROTECTED) {
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_ENABLED);
+		ret = 0;
+		goto end;
+	}
+
+	if (tmp == TOPOLOGY_CHANGE) {
+		ret = dp_tx_hdcp2x_authenticate_repeater(hdcp_info);
+		if (!ret) {
+			mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_ENABLED);
+			goto end;
+		}
+	} else {
+		dev_info(mtk_dp->dev, "[HDCP2.X] link failed with:0x%x, retrying auth\n", tmp);
+	}
+
+disable:
+	ret = dp_tx_hdcp2x_disabel(hdcp_info);
+	if (ret || !mtk_dp->train_info.cable_plugged_in || !mtk_dp->enabled) {
+		ret = -EAGAIN;
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_DESIRED);
+		goto end;
+	}
+
+	ret = dp_tx_hdcp2x_enable(hdcp_info);
+	if (ret)
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_DESIRED);
+
+end:
+	mutex_unlock(&mtk_dp->hdcp_mutex);
+
+	return ret;
+}
+
+void dp_tx_hdcp2x_irq(struct mtk_hdcp_info *hdcp_info)
+{
+	atomic_inc(&hdcp_info->hdcp2_info.cp_irq);
+	wake_up_all(&hdcp_info->hdcp2_info.cp_irq_queue);
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
new file mode 100644
index 000000000000..0532bcb9958b
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp2.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#ifndef _MTK_dp_HDCP2_H_
+#define _MTK_dp_HDCP2_H_
+
+#include "tlc_dp_hdcp.h"
+
+#define HDCP_VERSION_2X 2
+
+enum check_link {
+	LINK_PROTECTED	= 0,
+	TOPOLOGY_CHANGE,
+	LINK_INTEGRITY_FAILURE,
+	REAUTH_REQUEST
+};
+
+void dp_tx_hdcp2x_get_info(struct mtk_hdcp_info *hdcp_info);
+int dp_tx_hdcp2x_enable(struct mtk_hdcp_info *hdcp_info);
+int dp_tx_hdcp2x_disabel(struct mtk_hdcp_info *hdcp_info);
+int dp_tx_hdcp2x_check_link(struct mtk_hdcp_info *hdcp_info);
+void dp_tx_hdcp2x_irq(struct mtk_hdcp_info *hdcp_info);
+#endif /* _MTK_dp_HDCP2_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 709b79480693..8c60983a26ed 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /*
- * Copyright (c) 2019-2022 MediaTek Inc.
+ * Copyright (c) 2019-2024 MediaTek Inc.
  * Copyright (c) 2022 BayLibre
  */
 #ifndef _MTK_DP_REG_H_
@@ -83,6 +83,7 @@
 #define VIDEO_MUTE_SW_DP_ENC0_P0			BIT(2)
 #define VIDEO_MUTE_SEL_DP_ENC0_P0			BIT(3)
 #define ENHANCED_FRAME_EN_DP_ENC0_P0			BIT(4)
+#define HDCP_FRAME_EN_DP_ENC0_P0			BIT(5)
 #define MTK_DP_ENC0_P0_3004			0x3004
 #define VIDEO_M_CODE_SEL_DP_ENC0_P0_MASK		BIT(8)
 #define DP_TX_ENCODER_4P_RESET_SW_DP_ENC0_P0		BIT(9)
@@ -245,6 +246,7 @@
 
 /* offset: TRANS_OFFSET (0x3400) */
 #define MTK_DP_TRANS_P0_3400				0x3400
+#define HDCP_SEL_DP_TRANS_P0_MASK				BIT(11)
 #define PATTERN1_EN_DP_TRANS_P0_MASK				BIT(12)
 #define PATTERN2_EN_DP_TRANS_P0_MASK				BIT(13)
 #define PATTERN3_EN_DP_TRANS_P0_MASK				BIT(14)
@@ -276,7 +278,11 @@
 #define HPD_INT_THD_ECO_DP_TRANS_P0_MASK			GENMASK(1, 0)
 #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
 #define MTK_DP_TRANS_P0_34A4				0x34a4
+#define HDCP22_AUTH_DONE_DP_TRANS_P0_MASK		BIT(4)
+#define R0_AVAILABLE_DP_TRANS_P0		BIT(12)
+#define REPEATER_I_DP_TRANS_P0_MASK		BIT(15)
 #define LANE_NUM_DP_TRANS_P0_MASK				GENMASK(3, 2)
+#define MTK_DP_TRANS_P0_34D0                0x34D0
 #define MTK_DP_TRANS_P0_3540				0x3540
 #define FEC_EN_DP_TRANS_P0_MASK					BIT(0)
 #define FEC_CLOCK_EN_MODE_DP_TRANS_P0				BIT(3)
diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index bfe8653005db..6f85753c0c82 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -25,6 +25,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_of.h>
 #include <drm/drm_simple_kms_helper.h>
+#include <drm/display/drm_hdcp_helper.h>
 
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
@@ -820,6 +821,8 @@ static int mtk_dpi_bind(struct device *dev, struct device *master, void *data)
 	}
 	drm_connector_attach_encoder(dpi->connector, &dpi->encoder);
 
+	drm_connector_attach_content_protection_property(dpi->connector, true);
+
 	return 0;
 
 err_cleanup:
-- 
2.43.0

