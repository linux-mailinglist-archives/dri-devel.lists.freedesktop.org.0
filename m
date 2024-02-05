Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9F0C849388
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 06:51:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E622D1123A2;
	Mon,  5 Feb 2024 05:51:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="qPfXc4XO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F26F1123A2
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 05:51:38 +0000 (UTC)
X-UUID: 9afbb8c6c3ea11ee9e680517dc993faa-20240205
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Zj4kF6Nfh/PvZmHs+5yXsdA7oEfEbh/7MGvnWp+xHbU=; 
 b=qPfXc4XOSXvOQkCx18AzvTQkpZUBnA8l0Db4gTjqtmp2dyyt6UI6miqsiA5R/0LT8ddjtrDmKZ0iZ90oSvsQMGzBvOfdh5HNpPqb9qmkA87toieSpr742GpEQDJzm/sc0/WLTYFGgfKSkCZ8pjuTf3YckPIYxtWZygQkdEBuEUs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.37, REQID:c1d94499-2061-457c-9b04-acb7ced05c6e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6f543d0, CLOUDID:c892068f-e2c0-40b0-a8fe-7c7e47299109,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: 9afbb8c6c3ea11ee9e680517dc993faa-20240205
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <mac.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 249598753; Mon, 05 Feb 2024 13:51:28 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Mon, 5 Feb 2024 13:51:27 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Mon, 5 Feb 2024 13:51:27 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x feature
 for DisplayPort
Date: Mon, 5 Feb 2024 13:50:38 +0800
Message-ID: <20240205055055.25340-4-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240205055055.25340-1-mac.shen@mediatek.com>
References: <20240205055055.25340-1-mac.shen@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
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

Add HDCP1.x feature for DisplayPort.
If the sink support HDCP1.X only, the feature will do HDCP1.x
authentication when userspace request the kernel protect with
HDCP_Content_Type property as DRM_MODE_HDCP_CONTENT_TYPE0.

Changes in v2:
- remove useless code
- remove the prefix 'mdrv'
- do HDCP1.x authentication when userspace request the
  kernel protect future content communicated
per suggestion from the previous thread:
https://lore.kernel.org/all/8fff59b5567449d8201dd1138c8
fa9218a545c46.camel@mediatek.com/

Signed-off-by: mac.shen <mac.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile        |   1 +
 drivers/gpu/drm/mediatek/mtk_dp.c        |  33 +-
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c | 589 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h |  46 ++
 drivers/gpu/drm/mediatek/mtk_dp_reg.h    |   3 +
 5 files changed, 669 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 50ea069b047e..9738235f76b8 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -27,6 +27,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
 mtk-dp-objs := tlc_dp_hdcp.o \
+		  mtk_dp_hdcp1x.o \
 		  mtk_dp_hdcp2.o \
 		  mtk_dp.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 7ff72f15528b..8cd7562dab7a 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -33,6 +33,7 @@
 
 #include "mtk_dp.h"
 #include "mtk_dp_reg.h"
+#include "mtk_dp_hdcp1x.h"
 #include "mtk_dp_hdcp2.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
@@ -1811,6 +1812,9 @@ void mtk_dp_check_hdcp_version(struct mtk_dp *mtk_dp, bool only_hdcp1x)
 	if (!only_hdcp1x && dp_tx_hdcp2_support(&mtk_dp->hdcp_info))
 		return;
 
+	if (dp_tx_hdcp1x_support(&mtk_dp->hdcp_info))
+		return;
+
 	if (tee_add_device(&mtk_dp->hdcp_info, HDCP_NONE) != RET_SUCCESS)
 		mtk_dp->hdcp_info.auth_status = AUTH_FAIL;
 }
@@ -1860,15 +1864,34 @@ static void mtk_dp_hdcp_handle(struct work_struct *data)
 		mtk_dp_check_hdcp_version(mtk_dp, false);
 		if (mtk_dp->hdcp_info.hdcp2_info.enable)
 			dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, true);
+		else if (mtk_dp->hdcp_info.hdcp1x_info.enable &&
+			 mtk_dp->hdcp_info.hdcp_content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
+			dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, true);
 		else
 			mtk_dp->hdcp_info.auth_status = AUTH_ZERO;
 	}
 
-	while (mtk_dp->hdcp_info.hdcp2_info.enable &&
-	       mtk_dp->hdcp_info.auth_status != AUTH_FAIL &&
+	while ((mtk_dp->hdcp_info.hdcp1x_info.enable ||
+		mtk_dp->hdcp_info.hdcp2_info.enable) &&
+			mtk_dp->hdcp_info.auth_status != AUTH_FAIL &&
 			mtk_dp->hdcp_info.auth_status != AUTH_PASS) {
-		if (mtk_dp->hdcp_info.hdcp2_info.enable)
+		if (mtk_dp->hdcp_info.hdcp2_info.enable) {
 			dp_tx_hdcp2_fsm(&mtk_dp->hdcp_info);
+			if (mtk_dp->hdcp_info.auth_status == AUTH_FAIL) {
+				tee_remove_device(&mtk_dp->hdcp_info);
+				mtk_dp_check_hdcp_version(mtk_dp, true);
+				if (mtk_dp->hdcp_info.hdcp1x_info.enable &&
+				    mtk_dp->hdcp_info.hdcp_content_type !=
+					DRM_MODE_HDCP_CONTENT_TYPE1) {
+					mtk_dp->hdcp_info.hdcp2_info.enable = false;
+					dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, true);
+				}
+			}
+		}
+
+		if (mtk_dp->hdcp_info.hdcp1x_info.enable &&
+		    mtk_dp->hdcp_info.hdcp_content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
+			dp_tx_hdcp1x_fsm(&mtk_dp->hdcp_info);
 	}
 }
 
@@ -1924,6 +1947,8 @@ static void mtk_dp_hdcp_atomic_check(struct mtk_dp *mtk_dp, struct drm_connector
 		dev_dbg(mtk_dp->dev, "disable HDCP\n");
 		if (mtk_dp->hdcp_info.hdcp2_info.enable)
 			dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, false);
+		else if (mtk_dp->hdcp_info.hdcp1x_info.enable)
+			dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, false);
 
 		drm_hdcp_update_content_protection(mtk_dp->conn,
 						   mtk_dp->hdcp_info.content_protection);
@@ -2394,6 +2419,8 @@ static void mtk_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 
 	if (mtk_dp->hdcp_info.hdcp2_info.enable)
 		dp_tx_hdcp2_set_start_auth(&mtk_dp->hdcp_info, false);
+	else if (mtk_dp->hdcp_info.hdcp1x_info.enable)
+		dp_tx_hdcp1x_set_start_auth(&mtk_dp->hdcp_info, false);
 
 	if (mtk_dp->hdcp_info.content_protection != DRM_MODE_CONTENT_PROTECTION_UNDESIRED) {
 		mtk_dp->hdcp_info.content_protection = DRM_MODE_CONTENT_PROTECTION_DESIRED;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
new file mode 100644
index 000000000000..33b6cad39714
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
@@ -0,0 +1,589 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#include "mtk_dp_hdcp1x.h"
+#include "mtk_dp_reg.h"
+#include "mtk_dp.h"
+
+static void dp_tx_hdcp1x_start_cipher(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+
+	if (enable) {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3480, REQ_BLOCK_CIPHER_AUTH,
+				   REQ_BLOCK_CIPHER_AUTH);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3480, KM_GENERATED, KM_GENERATED);
+	} else {
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3480, 0, KM_GENERATED);
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3480, 0, REQ_BLOCK_CIPHER_AUTH);
+	}
+}
+
+static bool dp_tx_hdcp1x_get_r0_available(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	bool R0_available;
+	u32 ret;
+
+	ret = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_34A4);
+	if (ret & BIT(12))
+		R0_available = true;
+	else
+		R0_available = false;
+
+	return R0_available;
+}
+
+static void dp_tx_hdcp1x_set_repeater(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+
+	if (enable)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4, BIT(15), BIT(15));
+	else
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4, 0,  BIT(15));
+}
+
+void dp_tx_hdcp1x_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable)
+{
+	hdcp_info->hdcp1x_info.enable = enable;
+
+	if (enable) {
+		hdcp_info->auth_status = AUTH_INIT;
+		hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A0;
+		hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+	} else {
+		hdcp_info->auth_status = AUTH_ZERO;
+		hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_H2;
+		hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+		tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+		dp_tx_hdcp1x_start_cipher(hdcp_info, false);
+		tee_hdcp1x_soft_rst(hdcp_info);
+	}
+
+	hdcp_info->hdcp1x_info.retry_count = 0;
+}
+
+bool dp_tx_hdcp1x_support(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 tmp[2];
+	int ret;
+
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BCAPS, tmp, 0x1);
+
+	hdcp_info->hdcp1x_info.enable = tmp[0x0] & BIT(0);
+	hdcp_info->hdcp1x_info.repeater = (tmp[0x0] & BIT(1)) >> 1;
+
+	DPTXHDCPMSG("1.x: CAPABLE: %d, Reapeater: %d\n",
+		    hdcp_info->hdcp1x_info.enable,
+		hdcp_info->hdcp1x_info.repeater);
+
+	if (!hdcp_info->hdcp1x_info.enable)
+		return false;
+
+	ret = tee_add_device(hdcp_info, HDCP_VERSION_1X);
+	if (ret != RET_SUCCESS) {
+		DPTXHDCPERR("1.x: HDCP TA has some error\n");
+		hdcp_info->hdcp1x_info.enable = false;
+	}
+
+	return hdcp_info->hdcp1x_info.enable;
+}
+
+static bool dp_tx_hdcp1x_init(struct mtk_hdcp_info *hdcp_info)
+{
+	u8 i;
+
+	hdcp_info->hdcp1x_info.ksv_ready = false;
+	hdcp_info->hdcp1x_info.r0_read = false;
+	hdcp_info->hdcp1x_info.b_status = 0x00;
+	for (i = 0; i < 5; i++) {
+		hdcp_info->hdcp1x_info.b_ksv[i] = 0x00;
+		hdcp_info->hdcp1x_info.a_ksv[i] = 0x00;
+	}
+
+	for (i = 0; i < 5; i++)
+		hdcp_info->hdcp1x_info.v[i] = 0x00;
+
+	hdcp_info->hdcp1x_info.b_info[0] = 0x00;
+	hdcp_info->hdcp1x_info.b_info[1] = 0x00;
+	hdcp_info->hdcp1x_info.max_cascade = false;
+	hdcp_info->hdcp1x_info.max_devs = false;
+	hdcp_info->hdcp1x_info.device_count = 0x00;
+
+	tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+	dp_tx_hdcp1x_start_cipher(hdcp_info, false);
+	tee_hdcp1x_soft_rst(hdcp_info);
+
+	return true;
+}
+
+static bool dp_tx_hdcp1x_read_sink_b_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer[DRM_HDCP_KSV_LEN], i;
+
+	if (hdcp_info->hdcp1x_info.enable) {
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BKSV, read_buffer, DRM_HDCP_KSV_LEN);
+
+		for (i = 0; i < DRM_HDCP_KSV_LEN; i++) {
+			hdcp_info->hdcp1x_info.b_ksv[i] = read_buffer[i];
+			DPTXHDCPMSG("1.x: Bksv = 0x%x\n", read_buffer[i]);
+		}
+	}
+
+	return true;
+}
+
+static bool dp_tx_hdcp1x_check_sink_ksv_ready(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer;
+
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BSTATUS, &read_buffer, 1);
+
+	hdcp_info->hdcp1x_info.ksv_ready = (read_buffer & BIT(0))  ? true : false;
+
+	return hdcp_info->hdcp1x_info.ksv_ready;
+}
+
+static bool dp_tx_hdcp1x_check_sink_cap(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8  read_buffer[0x2];
+
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BCAPS, read_buffer, 1);
+
+	hdcp_info->hdcp1x_info.repeater = (read_buffer[0] & BIT(1)) ? true : false;
+
+	return true;
+}
+
+static bool dp_tx_hdcp1x_read_sink_b_info(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer[DRM_HDCP_BSTATUS_LEN];
+
+	drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BINFO, read_buffer, DRM_HDCP_BSTATUS_LEN);
+
+	hdcp_info->hdcp1x_info.b_info[0] = read_buffer[0];
+	hdcp_info->hdcp1x_info.b_info[1] = read_buffer[1];
+	hdcp_info->hdcp1x_info.max_cascade = (read_buffer[1] & BIT(3)) ? true : false;
+	hdcp_info->hdcp1x_info.max_devs = (read_buffer[0] & BIT(7)) ? true : false;
+	hdcp_info->hdcp1x_info.device_count = read_buffer[0] & 0x7F;
+
+	DPTXHDCPMSG("1.x: Binfo max_cascade_EXCEEDED = %d\n", hdcp_info->hdcp1x_info.max_cascade);
+	DPTXHDCPMSG("1.x: Binfo DEPTH = %d\n", read_buffer[1] & 0x07);
+	DPTXHDCPMSG("1.x: Binfo max_devs_EXCEEDED = %d\n", hdcp_info->hdcp1x_info.max_devs);
+	DPTXHDCPMSG("1.x: Binfo device_count = %d\n", hdcp_info->hdcp1x_info.device_count);
+	return true;
+}
+
+static bool dp_tx_hdcp1x_read_sink_ksv(struct mtk_hdcp_info *hdcp_info, u8 dev_count)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 i;
+	u8 times = dev_count / 3;
+	u8 remain = dev_count % 3;
+
+	if (times > 0) {
+		for (i = 0; i < times; i++)
+			drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_KSV_FIFO,
+					 hdcp_info->hdcp1x_info.ksvfifo + i * 15, 15);
+	}
+
+	if (remain > 0)
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_KSV_FIFO,
+				 hdcp_info->hdcp1x_info.ksvfifo + times * 15, remain * 5);
+
+	DPTXHDCPMSG("1.x: Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[0]);
+	DPTXHDCPMSG("1.x: Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[1]);
+	DPTXHDCPMSG("1.x: Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[2]);
+	DPTXHDCPMSG("1.x: Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[3]);
+	DPTXHDCPMSG("1.x: Read ksvfifo = %x\n",	hdcp_info->hdcp1x_info.ksvfifo[4]);
+
+	return true;
+}
+
+static bool dp_tx_hdcp1x_read_sink_sha_v(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer[4], i, j;
+
+	for (i = 0; i < 5; i++) {
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_V_PRIME(i), read_buffer, 4);
+		for (j = 0; j < 4; j++) {
+			hdcp_info->hdcp1x_info.v[(i * 4) + j] = read_buffer[3 - j];
+			DPTXHDCPMSG("1.x: Read sink V = %x\n",
+				    hdcp_info->hdcp1x_info.v[(i * 4) + j]);
+		}
+	}
+
+	return true;
+}
+
+static bool dp_tx_hdcp1x_auth_with_repeater(struct mtk_hdcp_info *hdcp_info)
+{
+	bool ret = false;
+	u8 *buffer = NULL;
+	u32 len = 0;
+	int tmp = 0;
+
+	if (hdcp_info->hdcp1x_info.device_count > HDCP1X_REP_MAXDEVS) {
+		DPTXHDCPERR("1.x: Repeater: %d DEVs!\n", hdcp_info->hdcp1x_info.device_count);
+		return false;
+	}
+
+	dp_tx_hdcp1x_read_sink_ksv(hdcp_info, hdcp_info->hdcp1x_info.device_count);
+	dp_tx_hdcp1x_read_sink_sha_v(hdcp_info);
+
+	len = hdcp_info->hdcp1x_info.device_count * DRM_HDCP_KSV_LEN + HDCP1X_B_INFO_LEN;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		DPTXHDCPERR("1.x: Out of Memory\n");
+		return false;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp1x_info.ksvfifo, len - HDCP1X_B_INFO_LEN);
+	memcpy(buffer + (len - HDCP1X_B_INFO_LEN), hdcp_info->hdcp1x_info.b_info,
+	       HDCP1X_B_INFO_LEN);
+	tmp = tee_hdcp1x_compute_compare_v(hdcp_info, buffer, len, hdcp_info->hdcp1x_info.v);
+	if (tmp == RET_COMPARE_PASS) {
+		DPTXHDCPMSG("1.x: Check V' PASS\n");
+		ret = true;
+	} else {
+		DPTXHDCPMSG("1.x: Check V' Fail\n");
+	}
+
+	kfree(buffer);
+	return ret;
+}
+
+static bool dp_tx_hdcp1x_verify_b_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	int i, j, k = 0;
+	u8 ksv;
+
+	for (i = 0; i < DRM_HDCP_KSV_LEN; i++) {
+		ksv = hdcp_info->hdcp1x_info.b_ksv[i];
+		for (j = 0; j < 8; j++)
+			k += (ksv >> j) & 0x01;
+	}
+
+	if (k != 20) {
+		DPTXHDCPERR("1.x: Check BKSV 20'1' 20'0' Fail\n");
+		return false;
+	}
+
+	return true;
+}
+
+static bool dp_tx_hdcp1x_write_a_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 tmp;
+	int i, k, j;
+
+	tee_get_aksv(hdcp_info, hdcp_info->hdcp1x_info.a_ksv);
+	drm_dp_dpcd_write(&mtk_dp->aux, DP_AUX_HDCP_AKSV, hdcp_info->hdcp1x_info.a_ksv,
+			  DRM_HDCP_KSV_LEN);
+
+	for (i = 0, k = 0; i < DRM_HDCP_KSV_LEN; i++) {
+		tmp = hdcp_info->hdcp1x_info.a_ksv[i];
+
+		for (j = 0; j < 8; j++)
+			k += (tmp >> j) & 0x01;
+		DPTXHDCPMSG("1.x: Aksv 0x%x\n", tmp);
+	}
+
+	if (k != 20) {
+		DPTXHDCPERR("1.x: Check AKSV 20'1' 20'0' Fail\n");
+		return false;
+	}
+
+	return true;
+}
+
+static void dp_tx_hdcp1x_write_an(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 an_value[DRM_HDCP_AN_LEN] = { /* on DP Spec p99 */
+		0x03, 0x04, 0x07, 0x0C, 0x13, 0x1C, 0x27, 0x34};
+
+	tee_hdcp1x_set_tx_an(hdcp_info, an_value);
+	drm_dp_dpcd_write(&mtk_dp->aux, DP_AUX_HDCP_AN, an_value, DRM_HDCP_AN_LEN);
+	mdelay(5);
+}
+
+static bool dp_tx_hdcp1x_check_r0(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 value[DRM_HDCP_BSTATUS_LEN];
+	u8 retry_count = 0;
+	bool sink_R0_available = false;
+	bool ret;
+	int tmp;
+
+	ret = dp_tx_hdcp1x_get_r0_available(hdcp_info);
+	if (!ret) {
+		DPTXHDCPERR("1.x: ERR: R0 No Available\n");
+		return false;
+	}
+
+	if (!hdcp_info->hdcp1x_info.r0_read) {
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BSTATUS, value, 1);
+		sink_R0_available = ((value[0x0] & BIT(1)) == BIT(1)) ? true : false;
+
+		if (!sink_R0_available) {
+			drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BSTATUS, value, 1);
+			sink_R0_available = ((value[0x0] & BIT(1)) == BIT(1)) ? true : false;
+
+			if (!sink_R0_available)
+				return false;
+		}
+	}
+
+	while (retry_count < 3) {
+		drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_RI_PRIME, value, DRM_HDCP_RI_LEN);
+
+		tmp = tee_compare_r0(hdcp_info, value, DRM_HDCP_RI_LEN);
+		if (tmp == RET_COMPARE_PASS)
+			return true;
+
+		DPTXHDCPMSG("1.x: R0 check FAIL:Rx_R0=0x%x%x\n", value[0x1], value[0x0]);
+		mdelay(5);
+
+		retry_count++;
+	}
+	return false;
+}
+
+static void dp_tx_hdcp1x_state_rst(struct mtk_hdcp_info *hdcp_info)
+{
+	DPTXHDCPMSG("1.x: Before State Reset:(M : S)= (%d, %d)",
+		    hdcp_info->hdcp1x_info.main_states,
+		hdcp_info->hdcp1x_info.sub_states);
+	hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A0;
+	hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+}
+
+void dp_tx_hdcp1x_fsm(struct mtk_hdcp_info *hdcp_info)
+{
+	static int pre_main, pre_sub;
+	static u32 pre_time;
+	u32 time;
+	bool ret;
+
+	if (pre_main != hdcp_info->hdcp1x_info.main_states ||
+	    hdcp_info->hdcp1x_info.sub_states != pre_sub) {
+		DPTXHDCPMSG("1.x: State(M : S)= (%d, %d)",
+			    hdcp_info->hdcp1x_info.main_states,
+			hdcp_info->hdcp1x_info.sub_states);
+		pre_main = hdcp_info->hdcp1x_info.main_states;
+		pre_sub = hdcp_info->hdcp1x_info.sub_states;
+	}
+
+	switch (hdcp_info->hdcp1x_info.main_states) {
+	case HDCP1X_main_state_H2:
+		/* HDCP1X_main_state_H2 */
+		/* HDCP1X_sub_FSM_auth_fail */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_auth_fail) {
+			tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+			DPTXHDCPMSG("1.x: Authentication Fail\n");
+			hdcp_info->auth_status = AUTH_FAIL;
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_H2;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+		}
+		break;
+
+	case HDCP1X_main_state_A0:
+		/* HDCP1X_main_state_A0 */
+		/* HDCP1X_sub_FSM_IDLE */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_IDLE) {
+			if (hdcp_info->hdcp1x_info.retry_count > HDCP1X_REAUNTH_COUNT) {
+				DPTXHDCPMSG("1.x: Too much retry!\n");
+				hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_H2;
+				hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_auth_fail;
+				break;
+			}
+
+			dp_tx_hdcp1x_init(hdcp_info);
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A0;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_CHECKHDCPCAPABLE;
+		}
+
+		/* HDCP1X_main_state_A0 */
+		/* HDCP1X_sub_FSM_CHECKHDCPCAPABLE */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_CHECKHDCPCAPABLE) {
+			if (!hdcp_info->hdcp1x_info.enable) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			hdcp_info->hdcp1x_info.retry_count++;
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A1;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_exchange_KSV;
+		}
+		break;
+
+	case HDCP1X_main_state_A1:
+		/* HDCP1X_main_state_A1 */
+		/* HDCP1X_sub_FSM_exchange_KSV */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_exchange_KSV) {
+			dp_tx_hdcp1x_write_an(hdcp_info);
+			ret = dp_tx_hdcp1x_write_a_ksv(hdcp_info);
+			if (!ret) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			pre_time = mtk_dp_get_system_time();
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A1;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_verify_bksv;
+		}
+
+		/* HDCP1X_main_state_A1 */
+		/* HDCP1X_sub_FSM_verify_bksv */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_verify_bksv) {
+			dp_tx_hdcp1x_read_sink_b_ksv(hdcp_info);
+			dp_tx_hdcp1x_set_repeater(hdcp_info, hdcp_info->hdcp1x_info.repeater);
+
+			time = mtk_dp_get_time_diff(pre_time);
+			if (time >= HDCP1X_BSTATUS_TIMEOUT_CNT) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			pre_time = mtk_dp_get_system_time();
+			ret = dp_tx_hdcp1x_verify_b_ksv(hdcp_info);
+			if (!ret) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				DPTXHDCPMSG("1.x: Invalid BKSV!!\n");
+				break;
+			}
+
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A2;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_computation;
+		}
+		break;
+
+	case HDCP1X_main_state_A2:
+		/* HDCP1X_main_state_A2 */
+		/* HDCP1X_sub_FSM_computation */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_computation) {
+			tee_calculate_lm(hdcp_info, hdcp_info->hdcp1x_info.b_ksv);
+			dp_tx_hdcp1x_start_cipher(hdcp_info, true);
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A3;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_check_R0;
+			pre_time = mtk_dp_get_system_time();
+		}
+		break;
+
+	case HDCP1X_main_state_A3:
+		/* HDCP1X_main_state_A3 */
+		/* HDCP1X_sub_FSM_check_R0 */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_check_R0) {
+			/* Wait 100ms(at least) before check R0 */
+			time = mtk_dp_get_time_diff(pre_time);
+			if (time < HDCP1X_R0_WDT && !hdcp_info->hdcp1x_info.r0_read) {
+				mdelay(10);
+				break;
+			}
+
+			ret = dp_tx_hdcp1x_check_r0(hdcp_info);
+			if (!ret) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			tee_hdcp_enable_encrypt(hdcp_info, true, HDCP_V1);
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A5;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+		}
+		break;
+
+	case HDCP1X_main_state_A4:
+		/* HDCP1X_main_state_A4 */
+		/* HDCP1X_sub_FSM_auth_done */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_auth_done) {
+			DPTXHDCPMSG("1.x: Authentication done!\n");
+			hdcp_info->hdcp1x_info.retry_count = 0;
+			hdcp_info->auth_status = AUTH_PASS;
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A4;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_IDLE;
+
+			/* unmute */
+		}
+		break;
+
+	case HDCP1X_main_state_A5:
+		/* HDCP1X_main_state_A5 */
+		/* HDCP1X_sub_FSM_IDLE */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_IDLE) {
+			dp_tx_hdcp1x_check_sink_cap(hdcp_info);
+			if (!hdcp_info->hdcp1x_info.repeater) {
+				DPTXHDCPMSG("1.x: No Repeater!\n");
+				hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A4;
+				hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_auth_done;
+				break;
+			}
+
+			DPTXHDCPMSG("1.x: Repeater!\n");
+			pre_time = mtk_dp_get_system_time();
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A6;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_polling_rdy_bit;
+		}
+		break;
+
+	case HDCP1X_main_state_A6:
+		/* HDCP1X_main_state_A6 */
+		/* HDCP1X_sub_FSM_polling_rdy_bit */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_polling_rdy_bit) {
+			time = mtk_dp_get_time_diff(pre_time);
+			if (time > HDCP1X_REP_RDY_WDT) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			time = mtk_dp_get_time_diff(pre_time);
+			if (!hdcp_info->hdcp1x_info.ksv_ready && time > HDCP1X_REP_RDY_WDT / 2)
+				dp_tx_hdcp1x_check_sink_ksv_ready(hdcp_info);
+
+			if (hdcp_info->hdcp1x_info.ksv_ready) {
+				dp_tx_hdcp1x_read_sink_b_info(hdcp_info);
+				hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A7;
+				hdcp_info->hdcp1x_info.sub_states =
+					HDCP1X_sub_FSM_auth_with_repeater;
+				hdcp_info->hdcp1x_info.ksv_ready = false;
+			}
+		}
+		break;
+
+	case HDCP1X_main_state_A7:
+		/* HDCP1X_main_state_A7 */
+		/* HDCP1X_sub_FSM_auth_with_repeater */
+		if (hdcp_info->hdcp1x_info.sub_states == HDCP1X_sub_FSM_auth_with_repeater) {
+			if (hdcp_info->hdcp1x_info.max_cascade || hdcp_info->hdcp1x_info.max_devs) {
+				DPTXHDCPERR("1.x: MAX CASCADE or MAX DEVS!\n");
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			ret = dp_tx_hdcp1x_auth_with_repeater(hdcp_info);
+			if (!ret) {
+				dp_tx_hdcp1x_state_rst(hdcp_info);
+				break;
+			}
+
+			hdcp_info->hdcp1x_info.main_states = HDCP1X_main_state_A4;
+			hdcp_info->hdcp1x_info.sub_states = HDCP1X_sub_FSM_auth_done;
+		}
+		break;
+
+	default:
+		break;
+	}
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
new file mode 100644
index 000000000000..4787c5bd876a
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
@@ -0,0 +1,46 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#ifndef _MTK_DP_HDCP1X_H_
+#define _MTK_DP_HDCP1X_H_
+
+#include "tlc_dp_hdcp.h"
+
+#define HDCP1X_BSTATUS_TIMEOUT_CNT              600
+#define HDCP1X_R0_WDT                           100
+#define HDCP1X_REP_RDY_WDT                      5000
+
+#define HDCP1X_REAUNTH_COUNT          3
+
+enum DPTX_DRV_HDCP1X_main_states {
+	HDCP1X_main_state_H2 = 0,
+	HDCP1X_main_state_A0 = 1,
+	HDCP1X_main_state_A1 = 2,
+	HDCP1X_main_state_A2 = 3,
+	HDCP1X_main_state_A3 = 4,
+	HDCP1X_main_state_A4 = 5,
+	HDCP1X_main_state_A5 = 6,
+	HDCP1X_main_state_A6 = 7,
+	HDCP1X_main_state_A7 = 8,
+};
+
+enum DPTX_DRV_HDCP1X_sub_states {
+	HDCP1X_sub_FSM_IDLE              = 0,
+	HDCP1X_sub_FSM_CHECKHDCPCAPABLE	= 1,
+	HDCP1X_sub_FSM_exchange_KSV       = 2,
+	HDCP1X_sub_FSM_verify_bksv        = 3,
+	HDCP1X_sub_FSM_computation       = 4,
+	HDCP1X_sub_FSM_check_R0           = 5,
+	HDCP1X_sub_FSM_auth_done          = 6,
+	HDCP1X_sub_FSM_polling_rdy_bit     = 7,
+	HDCP1X_sub_FSM_auth_with_repeater  = 8,
+	HDCP1X_sub_FSM_auth_fail          = 9,
+};
+
+bool dp_tx_hdcp1x_support(struct mtk_hdcp_info *hdcp_info);
+void dp_tx_hdcp1x_fsm(struct mtk_hdcp_info *hdcp_info);
+void dp_tx_hdcp1x_set_start_auth(struct mtk_hdcp_info *hdcp_info, bool enable);
+
+#endif /* _MTK_DP_HDCP1X_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 5cf5059762ed..4481c853c375 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -276,6 +276,9 @@
 #define MTK_DP_TRANS_P0_3430				0x3430
 #define HPD_INT_THD_ECO_DP_TRANS_P0_MASK			GENMASK(1, 0)
 #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
+#define MTK_DP_TRANS_P0_3480                0x3480
+#define REQ_BLOCK_CIPHER_AUTH                           BIT(12)
+#define KM_GENERATED                                    BIT(4)
 #define MTK_DP_TRANS_P0_34A4				0x34a4
 #define LANE_NUM_DP_TRANS_P0_MASK				GENMASK(3, 2)
 #define MTK_DP_TRANS_P0_34D0                0x34D0
-- 
2.43.0

