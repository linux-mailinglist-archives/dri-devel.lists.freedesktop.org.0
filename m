Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C86B901162
	for <lists+dri-devel@lfdr.de>; Sat,  8 Jun 2024 14:02:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63C3410E123;
	Sat,  8 Jun 2024 12:02:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="Y1VTRn4E";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw01.mediatek.com (unknown [60.244.123.138])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4039710E0C2
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Jun 2024 12:02:31 +0000 (UTC)
X-UUID: f8af7bdc258e11efa54bbfbb386b949c-20240608
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Fha0wMvCu4yV3fQ8EuLJs0uXnWh36Q6XM6sfU6rGTKo=; 
 b=Y1VTRn4EgQrV3xny3cpeACZie2WL1xmSOxiz6knTGEXXldxCtv0RmRdTDVmbC0BxVsgG6v9eIBtSa8VE4NG7BtdjPNWX/9liqdDJ3m8GdrbkF39atK1wgUQ9VOQZovrabXTxZs2FCRl+hZP3yACuCVOMRTgjMIx5gbjhPg+wwD8=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.39, REQID:ed226e83-af3f-4629-8e99-2d8cdb0c6fcf, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:393d96e, CLOUDID:dc24dd84-4f93-4875-95e7-8c66ea833d57,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 0,NGT
X-CID-BAS: 0,NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-UUID: f8af7bdc258e11efa54bbfbb386b949c-20240608
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw01.mediatek.com (envelope-from <mac.shen@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 1054684970; Sat, 08 Jun 2024 20:02:25 +0800
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Sat, 8 Jun 2024 20:02:24 +0800
Received: from mszsdhlt06.gcn.mediatek.inc (10.16.6.206) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Sat, 8 Jun 2024 20:02:24 +0800
From: mac.shen <mac.shen@mediatek.com>
To: <chunkuang.hu@kernel.org>, <p.zabel@pengutronix.de>, <airlied@gmail.com>, 
 <daniel@ffwll.ch>, <matthias.bgg@gmail.com>,
 <angelogioacchino.delregno@collabora.com>, <jitao.shi@mediatek.com>
CC: <mac.shen@mediatek.com>, <shuijing.li@mediatek.com>,
 <linux-kernel@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-mediatek@lists.infradead.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v3 3/3] Subject: [PATCH] drm/mediatek/dp: Add HDCP1.x feature
 for DisplayPort
Date: Sat, 8 Jun 2024 20:01:06 +0800
Message-ID: <20240608120219.21817-4-mac.shen@mediatek.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240608120219.21817-1-mac.shen@mediatek.com>
References: <20240608120219.21817-1-mac.shen@mediatek.com>
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

Changes in v3:
- remove useless code
- remove magic number
- refine the flow to do HDCP1.x authentication
per suggestion from the previous thread:
https://patchwork.kernel.org/project/linux-mediatek
/patch/20240205055055.25340-4-mac.shen@mediatek.com/

Signed-off-by: mac.shen <mac.shen@mediatek.com>
---
 drivers/gpu/drm/mediatek/Makefile        |   1 +
 drivers/gpu/drm/mediatek/mtk_dp.c        |  11 +
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c | 577 +++++++++++++++++++++++
 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h |  17 +
 drivers/gpu/drm/mediatek/mtk_dp_reg.h    |   3 +
 5 files changed, 609 insertions(+)
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
 create mode 100644 drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index 19b7625ae573..a90c3294bfbe 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -28,6 +28,7 @@ mediatek-drm-hdmi-objs := mtk_cec.o \
 obj-$(CONFIG_DRM_MEDIATEK_HDMI) += mediatek-drm-hdmi.o
 
 mtk-dp-objs := tlc_dp_hdcp.o \
+		  mtk_dp_hdcp1x.o \
 		  mtk_dp_hdcp2.o \
 		  mtk_dp.o
 
diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 12854a04622f..3925eb2be064 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -33,6 +33,7 @@
 
 #include "mtk_dp.h"
 #include "mtk_dp_reg.h"
+#include "mtk_dp_hdcp1x.h"
 #include "mtk_dp_hdcp2.h"
 
 #define MTK_DP_SIP_CONTROL_AARCH32	MTK_SIP_SMC_CMD(0x523)
@@ -1841,6 +1842,7 @@ static int mtk_dp_hpd_sink_event(struct mtk_dp *mtk_dp)
 static void mtk_dp_hdcp_get_info(struct mtk_dp *mtk_dp)
 {
 	dp_tx_hdcp2x_get_info(&mtk_dp->hdcp_info);
+	dp_tx_hdcp1x_get_info(&mtk_dp->hdcp_info);
 }
 
 static void mtk_dp_hdcp_disable(struct mtk_dp *mtk_dp)
@@ -1852,6 +1854,8 @@ static void mtk_dp_hdcp_disable(struct mtk_dp *mtk_dp)
 
 	if (mtk_dp->hdcp_info.auth_version == HDCP_VERSION_2X)
 		dp_tx_hdcp2x_disabel(&mtk_dp->hdcp_info);
+	else if (mtk_dp->hdcp_info.auth_version == HDCP_VERSION_1X)
+		dp_tx_hdcp1x_disabel(&mtk_dp->hdcp_info);
 
 end:
 	cancel_delayed_work_sync(&mtk_dp->check_work);
@@ -1868,6 +1872,9 @@ static void mtk_dp_hdcp_check_work(struct work_struct *work)
 	if (mtk_dp->hdcp_info.auth_version == HDCP_VERSION_2X &&
 	    (!dp_tx_hdcp2x_check_link(&mtk_dp->hdcp_info))) {
 		schedule_delayed_work(&mtk_dp->check_work, DRM_HDCP2_CHECK_PERIOD_MS);
+	} else if (mtk_dp->hdcp_info.auth_version == HDCP_VERSION_1X &&
+		(!dp_tx_hdcp1x_check_link(&mtk_dp->hdcp_info))) {
+		schedule_delayed_work(&mtk_dp->check_work, DRM_HDCP_CHECK_PERIOD_MS);
 	}
 }
 
@@ -1890,6 +1897,10 @@ static void mtk_dp_hdcp_handle(struct work_struct *data)
 			check_link_interval = DRM_HDCP2_CHECK_PERIOD_MS;
 	}
 
+	if (ret && mtk_dp->hdcp_info.hdcp1x_info.capable &&
+	    mtk_dp->hdcp_info.hdcp_content_type != DRM_MODE_HDCP_CONTENT_TYPE1)
+		ret = dp_tx_hdcp1x_enable(&mtk_dp->hdcp_info);
+
 	if (!ret) {
 		schedule_delayed_work(&mtk_dp->check_work, check_link_interval);
 		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_ENABLED);
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
new file mode 100644
index 000000000000..0fcf23c378df
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.c
@@ -0,0 +1,577 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2019-2024 MediaTek Inc.
+ */
+
+#include <drm/display/drm_hdcp_helper.h>
+
+#include "mtk_dp_hdcp1x.h"
+#include "mtk_dp_reg.h"
+#include "mtk_dp.h"
+
+#define HDCP1X_R0_WDT			100
+#define HDCP1X_REP_RDY_WDT		5000
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
+	if (ret & R0_AVAILABLE_DP_TRANS_P0)
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
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4,
+				   REPEATER_I_DP_TRANS_P0_MASK, REPEATER_I_DP_TRANS_P0_MASK);
+	else
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_34A4, 0,  REPEATER_I_DP_TRANS_P0_MASK);
+}
+
+static int dp_tx_hdcp1x_init(struct mtk_hdcp_info *hdcp_info)
+{
+	int ret;
+	u8 i;
+
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
+	hdcp_info->hdcp1x_info.device_count = 0x00;
+
+	ret = tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+	if (ret)
+		return ret;
+
+	dp_tx_hdcp1x_start_cipher(hdcp_info, false);
+
+	ret = tee_hdcp1x_soft_rst(hdcp_info);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_read_sink_b_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer[DRM_HDCP_KSV_LEN], i;
+	ssize_t ret;
+
+	if (hdcp_info->hdcp1x_info.capable) {
+		ret = drm_dp_dpcd_read(&mtk_dp->aux,
+				       DP_AUX_HDCP_BKSV, read_buffer, DRM_HDCP_KSV_LEN);
+		if (ret < 0)
+			return ret;
+
+		for (i = 0; i < DRM_HDCP_KSV_LEN; i++) {
+			hdcp_info->hdcp1x_info.b_ksv[i] = read_buffer[i];
+			dev_dbg(mtk_dp->dev, "[HDCP1.X] Bksv:0x%x\n", read_buffer[i]);
+		}
+	}
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_check_sink_ksv_ready(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer;
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BSTATUS, &read_buffer, 1);
+	if (ret < 0)
+		return ret;
+
+	return (read_buffer & DP_BSTATUS_READY)  ? 0 : -EAGAIN;
+}
+
+static int dp_tx_hdcp1x_read_sink_b_info(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer[DRM_HDCP_BSTATUS_LEN];
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BINFO, read_buffer, DRM_HDCP_BSTATUS_LEN);
+	if (ret < 0)
+		return ret;
+
+	hdcp_info->hdcp1x_info.b_info[0] = read_buffer[0];
+	hdcp_info->hdcp1x_info.b_info[1] = read_buffer[1];
+	hdcp_info->hdcp1x_info.device_count = DRM_HDCP_NUM_DOWNSTREAM(read_buffer[0]);
+
+	dev_dbg(mtk_dp->dev, "[HDCP1.X] Binfo max_cascade_EXCEEDED:%lu\n",
+		DRM_HDCP_MAX_CASCADE_EXCEEDED(read_buffer[1]));
+	dev_dbg(mtk_dp->dev, "[HDCP1.X] Binfo DEPTH:%d\n", read_buffer[1] & 0x07);
+	dev_dbg(mtk_dp->dev, "[HDCP1.X] Binfo max_devs_EXCEEDED:%lu\n",
+		DRM_HDCP_MAX_DEVICE_EXCEEDED(read_buffer[0]));
+	dev_dbg(mtk_dp->dev, "[HDCP1.X] Binfo device_count:%d\n",
+		hdcp_info->hdcp1x_info.device_count);
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_read_sink_ksv(struct mtk_hdcp_info *hdcp_info, u8 dev_count)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 times = dev_count / 3;
+	u8 remain = dev_count % 3;
+	ssize_t ret;
+	u8 i;
+
+	if (times > 0) {
+		for (i = 0; i < times; i++) {
+			ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_KSV_FIFO,
+					       hdcp_info->hdcp1x_info.ksvfifo + i * 15, 15);
+			if (ret < 0)
+				return ret;
+		}
+	}
+
+	if (remain > 0) {
+		ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_KSV_FIFO,
+				       hdcp_info->hdcp1x_info.ksvfifo + times * 15, remain * 5);
+		if (ret < 0)
+			return ret;
+	}
+
+	dev_dbg(mtk_dp->dev, "[HDCP1.X] Read ksvfifo:0x%x, 0x%x, 0x%x, 0x%x, 0x%x\n",
+		hdcp_info->hdcp1x_info.ksvfifo[0],
+		hdcp_info->hdcp1x_info.ksvfifo[1],
+		hdcp_info->hdcp1x_info.ksvfifo[2],
+		hdcp_info->hdcp1x_info.ksvfifo[3],
+		hdcp_info->hdcp1x_info.ksvfifo[4]);
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_read_sink_sha_v(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 read_buffer[4], i, j;
+	ssize_t ret;
+
+	for (i = 0; i < 5; i++) {
+		ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_V_PRIME(i), read_buffer, 4);
+		if (ret < 0)
+			return ret;
+
+		for (j = 0; j < 4; j++) {
+			hdcp_info->hdcp1x_info.v[(i * 4) + j] = read_buffer[3 - j];
+			dev_dbg(mtk_dp->dev, "[HDCP1.X] Read sink V:0x%x\n",
+				hdcp_info->hdcp1x_info.v[(i * 4) + j]);
+		}
+	}
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_auth_with_repeater(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 *buffer;
+	u32 len;
+	int ret;
+
+	if (hdcp_info->hdcp1x_info.device_count > HDCP1X_REP_MAXDEVS) {
+		dev_err(mtk_dp->dev, "[HDCP1.X] Repeater:%d exceed max devs\n",
+			hdcp_info->hdcp1x_info.device_count);
+		return -EINVAL;
+	}
+
+	ret = dp_tx_hdcp1x_read_sink_ksv(hdcp_info, hdcp_info->hdcp1x_info.device_count);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp1x_read_sink_sha_v(hdcp_info);
+	if (ret)
+		return ret;
+
+	len = hdcp_info->hdcp1x_info.device_count * DRM_HDCP_KSV_LEN + HDCP1X_B_INFO_LEN;
+	buffer = kmalloc(len, GFP_KERNEL);
+	if (!buffer) {
+		dev_err(mtk_dp->dev, "[HDCP1.X] Out of Memory\n");
+		return -ENOMEM;
+	}
+
+	memcpy(buffer, hdcp_info->hdcp1x_info.ksvfifo, len - HDCP1X_B_INFO_LEN);
+	memcpy(buffer + (len - HDCP1X_B_INFO_LEN), hdcp_info->hdcp1x_info.b_info,
+	       HDCP1X_B_INFO_LEN);
+	ret = tee_hdcp1x_compute_compare_v(hdcp_info, buffer, len, hdcp_info->hdcp1x_info.v);
+	if (!ret)
+		dev_dbg(mtk_dp->dev, "[HDCP1.X] Check V' pass\n");
+	else
+		dev_err(mtk_dp->dev, "[HDCP1.X] Check V' fail\n");
+
+	kfree(buffer);
+
+	return ret;
+}
+
+static int dp_tx_hdcp1x_verify_b_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
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
+		dev_err(mtk_dp->dev, "[HDCP1.X] Check BKSV 20'1' 20'0' fail\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_write_a_ksv(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int i, k, j;
+	ssize_t ret;
+	u8 tmp;
+
+	ret = tee_get_aksv(hdcp_info, hdcp_info->hdcp1x_info.a_ksv);
+	if (ret)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_AUX_HDCP_AKSV, hdcp_info->hdcp1x_info.a_ksv,
+				DRM_HDCP_KSV_LEN);
+	if (ret < 0)
+		return ret;
+
+	for (i = 0, k = 0; i < DRM_HDCP_KSV_LEN; i++) {
+		tmp = hdcp_info->hdcp1x_info.a_ksv[i];
+
+		for (j = 0; j < 8; j++)
+			k += (tmp >> j) & 0x01;
+		dev_dbg(mtk_dp->dev, "[HDCP1.X] Aksv:0x%x\n", tmp);
+	}
+
+	if (k != 20) {
+		dev_err(mtk_dp->dev, "[HDCP1.X] Check AKSV 20'1' 20'0' fail\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_write_an(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 an_value[DRM_HDCP_AN_LEN] = { /* on DP Spec p99 */
+		0x03, 0x04, 0x07, 0x0C, 0x13, 0x1C, 0x27, 0x34};
+	int ret;
+
+	ret = tee_hdcp1x_set_tx_an(hdcp_info, an_value);
+	if (ret)
+		return ret;
+
+	ret = drm_dp_dpcd_write(&mtk_dp->aux, DP_AUX_HDCP_AN, an_value, DRM_HDCP_AN_LEN);
+	if (ret < 0)
+		return ret;
+
+	mdelay(5);
+
+	return 0;
+}
+
+static int dp_tx_hdcp1x_check_r0(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 value[DRM_HDCP_BSTATUS_LEN];
+	bool sink_R0_available = false;
+	int i, tries;
+	ssize_t ret;
+	bool tmp;
+
+	tmp = dp_tx_hdcp1x_get_r0_available(hdcp_info);
+	if (!tmp) {
+		dev_err(mtk_dp->dev, "[HDCP1.X] Fail to get R0 available\n");
+		return -EINVAL;
+	}
+
+	tries = 2;
+	for (i = 0; i < tries; i++) {
+		ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BSTATUS, value, 1);
+		if (ret < 0)
+			continue;
+
+		sink_R0_available = (value[0x0] & DP_BSTATUS_R0_PRIME_READY) ? true : false;
+		if (sink_R0_available)
+			break;
+	}
+
+	if (i == tries) {
+		dev_err(mtk_dp->dev, "[HDCP1.X] R0 no available\n");
+		return -EINVAL;
+	}
+
+	tries = 3;
+	while (i < tries) {
+		ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_RI_PRIME, value, DRM_HDCP_RI_LEN);
+		if (ret < 0)
+			return ret;
+
+		ret = tee_compare_r0(hdcp_info, value, DRM_HDCP_RI_LEN);
+		if (!ret)
+			return ret;
+
+		dev_dbg(mtk_dp->dev, "[HDCP1.X] R0 check FAIL, Rx_R0:0x%x, 0x%x, retry\n",
+			value[0x1], value[0x0]);
+		mdelay(5);
+
+		i++;
+	}
+
+	dev_err(mtk_dp->dev, "[HDCP1.X] R0 check fail\n");
+	return -EINVAL;
+}
+
+/* Implements Part 1 of the HDCP authorization procedure */
+static int dp_tx_hdcp1x_auth(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int ret, i, tries = 2;
+	bool expired;
+	ktime_t end;
+
+	if (!hdcp_info->hdcp1x_info.capable)
+		return -EAGAIN;
+
+	ret = dp_tx_hdcp1x_init(hdcp_info);
+	if (ret)
+		return ret;
+
+	ret = dp_tx_hdcp1x_write_an(hdcp_info);
+	if (ret)
+		return ret;
+	ret = dp_tx_hdcp1x_write_a_ksv(hdcp_info);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < tries; i++) {
+		ret = dp_tx_hdcp1x_read_sink_b_ksv(hdcp_info);
+		if (ret)
+			continue;
+
+		ret = dp_tx_hdcp1x_verify_b_ksv(hdcp_info);
+		if (!ret)
+			break;
+	}
+	if (i == tries)
+		return -ENODEV;
+	if (drm_hdcp_check_ksvs_revoked(mtk_dp->drm_dev, hdcp_info->hdcp1x_info.b_ksv, 1) > 0) {
+		dev_err(mtk_dp->dev, "[HDCP1.X] BKSV is revoked\n");
+		return -EPERM;
+	}
+
+	dp_tx_hdcp1x_set_repeater(hdcp_info, hdcp_info->hdcp1x_info.repeater);
+
+	ret = tee_calculate_lm(hdcp_info, hdcp_info->hdcp1x_info.b_ksv);
+	if (ret)
+		return ret;
+	dp_tx_hdcp1x_start_cipher(hdcp_info, true);
+
+	/* Wait 100ms(at least) before check R0 */
+	msleep(HDCP1X_R0_WDT);
+	ret = dp_tx_hdcp1x_check_r0(hdcp_info);
+	if (ret)
+		return ret;
+	ret = tee_hdcp_enable_encrypt(hdcp_info, true, HDCP_V1);
+	if (ret)
+		return ret;
+
+	if (!hdcp_info->hdcp1x_info.repeater)
+		return 0;
+
+	/* Check ksv ready (defined max time as 5s in spec) */
+	end = ktime_add_ms(ktime_get_raw(), HDCP1X_REP_RDY_WDT);
+	for (;;) {
+		ret = dp_tx_hdcp1x_check_sink_ksv_ready(hdcp_info);
+		if (!ret)
+			break;
+
+		expired = ktime_after(ktime_get_raw(), end);
+		if (expired) {
+			ret = -ETIMEDOUT;
+			dev_err(mtk_dp->dev, "[HDCP1.X] Check sink ksv ready timeout\n");
+			goto fail;
+		}
+
+		msleep(100);
+	}
+
+	ret = dp_tx_hdcp1x_check_sink_ksv_ready(hdcp_info);
+	if (ret)
+		goto fail;
+
+	ret = dp_tx_hdcp1x_read_sink_b_info(hdcp_info);
+	if (ret)
+		goto fail;
+
+	ret = dp_tx_hdcp1x_auth_with_repeater(hdcp_info);
+	if (ret)
+		goto fail;
+
+	return 0;
+
+fail:
+	tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+
+	return ret;
+}
+
+void dp_tx_hdcp1x_get_info(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	u8 tmp[2];
+	ssize_t ret;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BCAPS, tmp, 0x1);
+	if (ret < 0)
+		return;
+
+	hdcp_info->hdcp1x_info.capable = tmp[0x0] & DP_BCAPS_HDCP_CAPABLE;
+	hdcp_info->hdcp1x_info.repeater = tmp[0x0] & DP_BCAPS_REPEATER_PRESENT;
+
+	dev_info(mtk_dp->dev, "[HDCP1.X] Capable:%d, Reapeater:%d\n",
+		 hdcp_info->hdcp1x_info.capable,
+		hdcp_info->hdcp1x_info.repeater);
+}
+
+int dp_tx_hdcp1x_enable(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int ret = 0, i, tries = 3;
+
+	hdcp_info->auth_status = AUTH_INIT;
+
+	ret = tee_add_device(hdcp_info, HDCP_VERSION_1X);
+	if (ret)
+		goto fail;
+
+	for (i = 0; i < tries; i++) {
+		ret = dp_tx_hdcp1x_auth(hdcp_info);
+		if (!ret) {
+			hdcp_info->auth_version = HDCP_VERSION_1X;
+			hdcp_info->auth_status = AUTH_PASS;
+			dev_info(mtk_dp->dev, "[HDCP1.X] Authentication done\n");
+
+			return 0;
+		}
+	}
+
+	tee_remove_device(hdcp_info);
+
+fail:
+	hdcp_info->auth_status = AUTH_FAIL;
+	dev_err(mtk_dp->dev, "[HDCP1.X] Authentication fail\n");
+
+	return ret;
+}
+
+int dp_tx_hdcp1x_disabel(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int ret;
+
+	if (hdcp_info->auth_status == AUTH_PASS) {
+		ret = tee_hdcp_enable_encrypt(hdcp_info, false, HDCP_NONE);
+		if (ret)
+			return ret;
+
+		dp_tx_hdcp1x_start_cipher(hdcp_info, false);
+
+		ret = tee_hdcp1x_soft_rst(hdcp_info);
+		if (ret)
+			return ret;
+	}
+
+	tee_remove_device(hdcp_info);
+
+	hdcp_info->auth_version = HDCP_NONE;
+	hdcp_info->auth_status = AUTH_ZERO;
+	dev_info(mtk_dp->dev, "[HDCP1.X] Disable Authentication\n");
+
+	return 0;
+}
+
+int dp_tx_hdcp1x_check_link(struct mtk_hdcp_info *hdcp_info)
+{
+	struct mtk_dp *mtk_dp = container_of(hdcp_info, struct mtk_dp, hdcp_info);
+	int ret = -EINVAL;
+	u8 bstatus;
+
+	mutex_lock(&mtk_dp->hdcp_mutex);
+
+	if (mtk_dp->hdcp_info.auth_status != AUTH_PASS)
+		goto end;
+
+	if (!mtk_dp->train_info.cable_plugged_in || !mtk_dp->enabled)
+		goto disable;
+
+	ret = drm_dp_dpcd_read(&mtk_dp->aux, DP_AUX_HDCP_BSTATUS, &bstatus, 1);
+	if (ret != 1) {
+		dev_dbg(mtk_dp->dev, "[HDCP1.X] Read bstatus failed, reauth\n");
+		goto disable;
+	}
+
+	ret = bstatus & (DP_BSTATUS_LINK_FAILURE | DP_BSTATUS_REAUTH_REQ);
+
+	if (!ret) {
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_ENABLED);
+		goto end;
+	}
+
+disable:
+	ret = dp_tx_hdcp1x_disabel(hdcp_info);
+	if (ret || !mtk_dp->train_info.cable_plugged_in || !mtk_dp->enabled) {
+		ret = -EAGAIN;
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_DESIRED);
+		goto end;
+	}
+
+	ret = dp_tx_hdcp1x_enable(hdcp_info);
+	if (ret)
+		mtk_dp_hdcp_update_value(mtk_dp, DRM_MODE_CONTENT_PROTECTION_DESIRED);
+
+end:
+	mutex_unlock(&mtk_dp->hdcp_mutex);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
new file mode 100644
index 000000000000..f0a19c491791
--- /dev/null
+++ b/drivers/gpu/drm/mediatek/mtk_dp_hdcp1x.h
@@ -0,0 +1,17 @@
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
+#define HDCP_VERSION_1X 1
+
+void dp_tx_hdcp1x_get_info(struct mtk_hdcp_info *hdcp_info);
+int dp_tx_hdcp1x_enable(struct mtk_hdcp_info *hdcp_info);
+int dp_tx_hdcp1x_disabel(struct mtk_hdcp_info *hdcp_info);
+int dp_tx_hdcp1x_check_link(struct mtk_hdcp_info *hdcp_info);
+#endif /* _MTK_DP_HDCP1X_H_ */
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8c60983a26ed..c04ea5dda6bd 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -277,6 +277,9 @@
 #define MTK_DP_TRANS_P0_3430				0x3430
 #define HPD_INT_THD_ECO_DP_TRANS_P0_MASK			GENMASK(1, 0)
 #define HPD_INT_THD_ECO_DP_TRANS_P0_HIGH_BOUND_EXT		BIT(1)
+#define MTK_DP_TRANS_P0_3480                0x3480
+#define REQ_BLOCK_CIPHER_AUTH                           BIT(12)
+#define KM_GENERATED                                    BIT(4)
 #define MTK_DP_TRANS_P0_34A4				0x34a4
 #define HDCP22_AUTH_DONE_DP_TRANS_P0_MASK		BIT(4)
 #define R0_AVAILABLE_DP_TRANS_P0		BIT(12)
-- 
2.43.0

