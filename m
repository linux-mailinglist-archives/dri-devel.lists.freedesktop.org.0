Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2777996BEE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:31:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A93310E6F4;
	Wed,  9 Oct 2024 13:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="f6s8XeHh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A998110E6E1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 11:16:13 +0000 (UTC)
X-UUID: e1de9562862f11ef8b96093e013ec31c-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=Q2xOGc+RtjzNrItvs3HvwzWSO0frevMjWR7p4Vj7aUk=; 
 b=f6s8XeHhAhkVAwKKRwTwTSzf+hv9cnXbuxDYCfRKQKCECatBmp2RxT/1LOs+Muu/wKRGBvMSJRuVeDJLwD9IFPwhyZS78WZgmyi/9LgTlWk5SGS8xzwTwgGQ4+64NkmgrVzxunnmkyMbyMN/IRh2cB3wjppemvINvNZyivBJtlY=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:f2fddd18-925c-4705-86a9-3fe3ff8c6fea, IP:0,
 U
 RL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
 N:release,TS:-25
X-CID-META: VersionHash:6dc6a47, CLOUDID:f6a48926-5902-4533-af4f-d0904aa89b3c,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e1de9562862f11ef8b96093e013ec31c-20241009
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by
 mailgw02.mediatek.com (envelope-from <shu-hsiang.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 417893463; Wed, 09 Oct 2024 19:16:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS09N2.mediatek.inc (172.21.101.94) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 04:16:07 -0700
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:07 +0800
From: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Sumit Semwal
 <sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
CC: <linux-media@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <dri-devel@lists.freedesktop.org>,
 <linaro-mm-sig@lists.linaro.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 <yaya.chang@mediatek.com>, <teddy.chen@mediatek.com>,
 <hidenorik@chromium.org>, <yunkec@chromium.org>, <shun-yi.wang@mediatek.com>, 
 Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
Subject: [PATCH v1 03/10] media: platform: mediatek: add isp_7x seninf unit
Date: Wed, 9 Oct 2024 19:15:44 +0800
Message-ID: <20241009111551.27052-4-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Mailman-Approved-At: Wed, 09 Oct 2024 13:31:32 +0000
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

Introduces the driver of the MediaTek Sensor Interface,
focusing on integration with the MediaTek ISP CAMSYS. The
seninf device bridges camera sensors and the ISP system,
providing management for sensor data routing and processing.
Key features include V4L2 framework control, and dynamic
handling of stream configurations and virtual channels.

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   87 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  193 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1741 +++++++++++++++++
 .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  120 ++
 .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   28 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   40 +
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  356 ++++
 .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   23 +
 .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  170 ++
 10 files changed, 2774 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
new file mode 100644
index 000000000000..1684a79bbb84
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_imgsensor_define_v4l2.h
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2019 MediaTek Inc.
+ */
+
+#ifndef _KD_IMGSENSOR_DATA_V4L2_H
+#define _KD_IMGSENSOR_DATA_V4L2_H
+
+enum VC_FEATURE {
+	VC_NONE = 0,
+	VC_MIN_NUM,
+	VC_RAW_DATA = VC_MIN_NUM,
+	VC_RAW_DATA_MAX,
+
+	VC_PDAF_MIN_NUM = VC_RAW_DATA_MAX,
+	VC_PDAF_STATS = VC_PDAF_MIN_NUM,
+	VC_PDAF_STATS_NE,
+	VC_PDAF_STATS_ME,
+	VC_PDAF_STATS_SE,
+	VC_PDAF_STATS_PIX_1,
+	VC_PDAF_STATS_PIX_2,
+	VC_PDAF_STATS_NE_PIX_1 = VC_PDAF_STATS_PIX_1,
+	VC_PDAF_STATS_NE_PIX_2 = VC_PDAF_STATS_PIX_2,
+	VC_PDAF_STATS_ME_PIX_1,
+	VC_PDAF_STATS_ME_PIX_2,
+	VC_PDAF_STATS_SE_PIX_1,
+	VC_PDAF_STATS_SE_PIX_2,
+	VC_PDAF_MAX_NUM,
+
+	VC_HDR_MIN_NUM = VC_PDAF_MAX_NUM,
+	VC_HDR_MVHDR = VC_HDR_MIN_NUM,
+	VC_HDR_MAX_NUM,
+
+	VC_3HDR_MIN_NUM = VC_HDR_MAX_NUM,
+	VC_3HDR_EMBEDDED = VC_3HDR_MIN_NUM,
+	VC_3HDR_FLICKER,
+	VC_3HDR_Y,
+	VC_3HDR_AE,
+	VC_3HDR_MAX_NUM,
+
+	VC_STAGGER_MIN_NUM = VC_3HDR_MAX_NUM,
+	VC_STAGGER_EMBEDDED = VC_STAGGER_MIN_NUM,
+	VC_STAGGER_NE,
+	VC_STAGGER_ME,
+	VC_STAGGER_SE,
+	VC_STAGGER_MAX_NUM,
+
+	VC_YUV_MIN_NUM = VC_STAGGER_MAX_NUM,
+	VC_YUV_Y = VC_YUV_MIN_NUM,
+	VC_YUV_UV,
+	VC_YUV_MAX_NUM,
+
+	VC_RAW_EXT_MIN_NUM = VC_YUV_MAX_NUM,
+	VC_RAW_W_DATA = VC_RAW_EXT_MIN_NUM,
+	VC_RAW_PROCESSED_DATA,
+	VC_RAW_EXT_MAX_NUM,
+
+	VC_GENERAL_DATA_MIN_NUM = VC_RAW_EXT_MAX_NUM,
+	VC_GENERAL_EMBEDDED = VC_GENERAL_DATA_MIN_NUM,
+	VC_GENERAL_DATA_MAX_NUM,
+
+	VC_MAX_NUM = VC_GENERAL_DATA_MAX_NUM,
+};
+
+enum {
+	PAD_SINK = 0,
+	PAD_SRC_RAW0,
+	PAD_SRC_RAW1,
+	PAD_SRC_RAW2,
+	PAD_SRC_RAW_W0,
+	PAD_SRC_RAW_EXT0,
+	PAD_SRC_PDAF0,
+	PAD_SRC_PDAF1,
+	PAD_SRC_PDAF2,
+	PAD_SRC_PDAF3,
+	PAD_SRC_PDAF4,
+	PAD_SRC_PDAF5,
+	PAD_SRC_PDAF6,
+	PAD_SRC_HDR0,
+	PAD_SRC_HDR1,
+	PAD_SRC_HDR2,
+	PAD_SRC_GENERAL0,
+	PAD_MAXCNT,
+	PAD_ERR = 0xffff,
+};
+
+#endif /* _KD_IMGSENSOR_DATA_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
new file mode 100644
index 000000000000..0bad8f307c10
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-def.h
@@ -0,0 +1,193 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_DEF_H__
+#define __MTK_CAM_SENINF_DEF_H__
+
+#define SENINF_VC_MAXCNT 8
+#define SENINF_DEF_PIXEL_MODE 2
+
+#define SENINF_CLK_MARGIN_IN_PERCENT 0
+#define HW_BUF_EFFECT 10
+
+#define SENINF_HS_TRAIL_EN_CONDITION 1450000000
+#define SENINF_TIMESTAMP_CLK 1000
+#define ISP_CLK_LOW 273000000
+
+#define SENINF_CPHY_SETTLE_DELAY_DT 0x10
+#define SENINF_DPHY_SETTLE_DELAY_DT 0x10
+#define SENINF_SETTLE_DELAY_CK 0x11
+#define SENINF_HS_TRAIL_PARAMETER 0x34
+
+#define SENSOR_CLOCK_POLARITY_HIGH	0
+#define SENSOR_CLOCK_POLARITY_LOW	1
+#define NUM_PORTS			2
+#define DEFAULT_WIDTH			1600
+#define DEFAULT_HEIGHT			1200
+
+enum CSI_PORT {
+	CSI_PORT_0 = 0,
+	CSI_PORT_1,
+	CSI_PORT_2,
+	CSI_PORT_3,
+	CSI_PORT_4,
+	CSI_PORT_5,
+	CSI_PORT_0A,
+	CSI_PORT_0B,
+	CSI_PORT_1A,
+	CSI_PORT_1B,
+	CSI_PORT_2A,
+	CSI_PORT_2B,
+	CSI_PORT_3A,
+	CSI_PORT_3B,
+	CSI_PORT_4A,
+	CSI_PORT_4B,
+	CSI_PORT_5A,
+	CSI_PORT_5B,
+	CSI_PORT_MAX_NUM,
+};
+
+#define SENINF_CSI_PORT_NAMES \
+	"0", \
+	"1", \
+	"2", \
+	"3", \
+	"4", \
+	"5", \
+	"0A", \
+	"0B", \
+	"1A", \
+	"1B", \
+	"2A", \
+	"2B", \
+	"3A", \
+	"3B", \
+	"4A", \
+	"4B", \
+	"5A", \
+	"5B", \
+
+enum SENINF_PHY_VER_ENUM {
+	SENINF_PHY_2_0,
+	SENINF_PHY_VER_NUM,
+};
+
+#define MTK_CSI_PHY_VERSIONS "mtk_csi_phy_2_0"
+
+enum SENINF_ENUM {
+	SENINF_1,
+	SENINF_2,
+	SENINF_3,
+	SENINF_4,
+	SENINF_5,
+	SENINF_6,
+	SENINF_7,
+	SENINF_8,
+	SENINF_9,
+	SENINF_10,
+	SENINF_11,
+	SENINF_12,
+	SENINF_NUM,
+};
+
+enum SENINF_MUX_ENUM {
+	SENINF_MUX1,
+	SENINF_MUX2,
+	SENINF_MUX3,
+	SENINF_MUX4,
+	SENINF_MUX5,
+	SENINF_MUX6,
+	SENINF_MUX7,
+	SENINF_MUX8,
+	SENINF_MUX9,
+	SENINF_MUX10,
+	SENINF_MUX11,
+	SENINF_MUX12,
+	SENINF_MUX13,
+	SENINF_MUX_NUM,
+	SENINF_MUX_ERROR = -1,
+};
+
+enum SENINF_CAM_MUX_ENUM {
+	SENINF_CAM_MUX0,
+	SENINF_CAM_MUX1,
+	SENINF_CAM_MUX2,
+	SENINF_CAM_MUX3,
+	SENINF_CAM_MUX4,
+	SENINF_CAM_MUX5,
+	SENINF_CAM_MUX6,
+	SENINF_CAM_MUX7,
+	SENINF_CAM_MUX8,
+	SENINF_CAM_MUX9,
+	SENINF_CAM_MUX10,
+	SENINF_CAM_MUX11,
+	SENINF_CAM_MUX12,
+	SENINF_CAM_MUX13,
+	SENINF_CAM_MUX14,
+	SENINF_CAM_MUX15,
+	SENINF_CAM_MUX_NUM,
+	SENINF_CAM_MUX_ERR = 0xff
+};
+
+/* 0:CSI2(2.5G), 3: parallel, 8:NCSI2(1.5G) */
+enum SENINF_SOURCE_ENUM {
+	CSI2 = 0x0,
+	TEST_MODEL = 0x1,
+	CCIR656	= 0x2,
+	PARALLEL_SENSOR = 0x3,
+	SERIAL_SENSOR = 0x4,
+	HD_TV = 0x5,
+	EXT_CSI2_OUT1 = 0x6,
+	EXT_CSI2_OUT2 = 0x7,
+	MIPI_SENSOR = 0x8,
+	VIRTUAL_CHANNEL_1 = 0x9,
+	VIRTUAL_CHANNEL_2 = 0xA,
+	VIRTUAL_CHANNEL_3 = 0xB,
+	VIRTUAL_CHANNEL_4 = 0xC,
+	VIRTUAL_CHANNEL_5 = 0xD,
+	VIRTUAL_CHANNEL_6 = 0xE,
+};
+
+enum SENINF_CSI2_ENUM {
+	CSI2_1_5G = 0x0,
+	CSI2_2_5G = 0x1,
+	CSI2_2_5G_CPHY = 0x2,
+};
+
+enum TG_FORMAT_ENUM {
+	FMT_RAW_8BIT = 0x0,
+	FMT_RAW_10BIT = 0x1,
+	FMT_RAW_12BIT = 0x2,
+	FMT_YUV422 = 0x3,
+	FMT_RAW_14BIT = 0x4,
+	FMT_RGB565_MIPI	= 0x5,
+	FMT_RGB888_MIPI	= 0x6,
+	FMT_JPEG = 0x7
+};
+
+enum {
+	CLK_CAM_SENINF = 0,
+	CLK_TOP_SENINF,
+	CLK_TOP_SENINF1,
+	CLK_TOP_SENINF2,
+	CLK_TOP_SENINF3,
+	CLK_TOP_SENINF4,
+	CLK_TOP_SENINF5,
+	CLK_TOP_SENINF_END,
+	CLK_TOP_CAMTM = CLK_TOP_SENINF_END,
+	CLK_MAXCNT,
+};
+
+#define SENINF_CLK_NAMES \
+	"clk_cam_seninf", \
+	"clk_top_seninf", \
+	"clk_top_seninf1", \
+	"clk_top_seninf2", \
+	"clk_top_seninf3", \
+	"clk_top_seninf4", \
+	"clk_top_seninf5", \
+	"clk_top_camtm", \
+
+#endif /* __MTK_CAM_SENINF_DEF_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
new file mode 100644
index 000000000000..a8fb48070304
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.c
@@ -0,0 +1,1741 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/interrupt.h>
+#include <linux/slab.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+#include <linux/clk.h>
+#include <linux/of_graph.h>
+#include <linux/of_irq.h>
+#include <linux/of_device.h>
+#include <linux/of_platform.h>
+#include <linux/pm_opp.h>
+#include <linux/regulator/consumer.h>
+#include <linux/nvmem-consumer.h>
+
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+
+#include "mtk_cam.h"
+#include "mtk_cam-seninf-def.h"
+#include "mtk_cam-seninf.h"
+#include "mtk_cam-seninf-hw.h"
+#include "mtk_cam-seninf-route.h"
+#include "kd_imgsensor_define_v4l2.h"
+
+#define sd_to_ctx(__sd) container_of(__sd, struct seninf_ctx, subdev)
+#define notifier_to_ctx(__n) container_of(__n, struct seninf_ctx, notifier)
+#define ctrl_hdl_to_ctx(__h) container_of(__h, struct seninf_ctx, ctrl_handler)
+
+static const char * const csi_port_names[] = {
+	SENINF_CSI_PORT_NAMES
+};
+
+static const char * const clk_names[] = {
+	SENINF_CLK_NAMES
+};
+
+static const char * const set_reg_names[] = {
+	SET_REG_KEYS_NAMES
+};
+
+static ssize_t status_show(struct device *dev,
+			   struct device_attribute *attr, char *buf)
+{
+	return mtk_cam_seninf_show_status(dev, attr, buf);
+}
+
+static DEVICE_ATTR_RO(status);
+
+static ssize_t err_status_show(struct device *dev,
+			       struct device_attribute *attr, char *buf)
+{
+	return mtk_cam_seninf_show_err_status(dev, attr, buf);
+}
+
+static DEVICE_ATTR_RO(err_status);
+
+static ssize_t debug_ops_show(struct device *dev,
+			      struct device_attribute *attr, char *buf)
+{
+	int len = 0;
+
+	len += snprintf(buf + len, PAGE_SIZE - len, "This is debug ops message\n");
+
+	return len;
+}
+
+enum REG_OPS_CMD {
+	REG_OPS_CMD_ID,
+	REG_OPS_CMD_CSI,
+	REG_OPS_CMD_RG,
+	REG_OPS_CMD_VAL,
+	REG_OPS_CMD_MAX_NUM,
+};
+
+static ssize_t debug_ops_store(struct device *dev,
+			       struct device_attribute *attr,
+			       const char *buf, size_t count)
+{
+	char delim[] = " ";
+	char csi_names[20];
+	char *token = NULL;
+	char *sbuf = kcalloc(count + 1, sizeof(char), GFP_KERNEL);
+	char *s = sbuf;
+	int ret;
+	char *arg[REG_OPS_CMD_MAX_NUM];
+	struct seninf_core *core = dev_get_drvdata(dev);
+	struct seninf_ctx *ctx;
+	int csi_port = -1;
+	int rg_idx = -1;
+	u32 val, i, num_para = 0;
+
+	if (!sbuf)
+		goto ERR_DEBUG_OPS_STORE;
+
+	memcpy(sbuf, buf, count);
+
+	token = strsep(&s, delim);
+	while (token && num_para < REG_OPS_CMD_MAX_NUM) {
+		if (strlen(token)) {
+			arg[num_para] = token;
+			num_para++;
+		}
+
+		token = strsep(&s, delim);
+	}
+
+	if (num_para != REG_OPS_CMD_MAX_NUM) {
+		dev_info(dev, "Wrong command parameter number\n");
+		goto ERR_DEBUG_OPS_STORE;
+	}
+
+	if (strncmp("SET_REG", arg[REG_OPS_CMD_ID], sizeof("SET_REG")) == 0) {
+		for (i = 0; i < REG_KEY_MAX_NUM; i++) {
+			if (!strcasecmp(arg[REG_OPS_CMD_RG], set_reg_names[i]))
+				rg_idx = i;
+		}
+		if (rg_idx < 0)
+			goto ERR_DEBUG_OPS_STORE;
+
+		ret = kstrtouint(arg[REG_OPS_CMD_VAL], 0, &val);
+		if (ret)
+			goto ERR_DEBUG_OPS_STORE;
+
+		for (i = 0; i < CSI_PORT_MAX_NUM; i++) {
+			memset(csi_names, 0, ARRAY_SIZE(csi_names));
+			snprintf(csi_names, 10, "csi-%s", csi_port_names[i]);
+			if (!strcasecmp(arg[REG_OPS_CMD_CSI], csi_names))
+				csi_port = i;
+		}
+
+		if (csi_port < 0)
+			goto ERR_DEBUG_OPS_STORE;
+
+		/* reg call */
+		mutex_lock(&core->mutex);
+
+		list_for_each_entry(ctx, &core->list, list) {
+			if (csi_port == ctx->port)
+				mtk_cam_seninf_set_reg(ctx, rg_idx, val);
+		}
+
+		mutex_unlock(&core->mutex);
+	}
+
+ERR_DEBUG_OPS_STORE:
+
+	kfree(sbuf);
+
+	return count;
+}
+
+static DEVICE_ATTR_RW(debug_ops);
+
+static int seninf_core_pm_runtime_enable(struct seninf_core *core)
+{
+	int i, ret;
+
+	core->pm_domain_cnt = of_count_phandle_with_args(core->dev->of_node,
+							 "power-domains",
+							 "#power-domain-cells");
+	if (core->pm_domain_cnt == 1) {
+		pm_runtime_enable(core->dev);
+	} else if (core->pm_domain_cnt > 1) {
+		core->pm_domain_devs =
+			devm_kcalloc(core->dev, core->pm_domain_cnt,
+				     sizeof(*core->pm_domain_devs), GFP_KERNEL);
+
+		if (!core->pm_domain_devs)
+			return -ENOMEM;
+
+		for (i = 0; i < core->pm_domain_cnt; i++) {
+			core->pm_domain_devs[i] =
+				dev_pm_domain_attach_by_id(core->dev, i);
+
+			if (IS_ERR(core->pm_domain_devs[i])) {
+				ret = PTR_ERR(core->pm_domain_devs[i]);
+
+				dev_info(core->dev,
+					 "%s: fail to probe pm id: %d (%d)\n",
+					 __func__, i, ret);
+
+				goto detach_pm;
+			}
+		}
+	}
+
+	return 0;
+
+detach_pm:
+	for (--i; i >= 0; i--)
+		dev_pm_domain_detach(core->pm_domain_devs[i], true);
+
+	return ret;
+}
+
+static int seninf_core_pm_runtime_disable(struct seninf_core *core)
+{
+	int i;
+
+	if (core->pm_domain_cnt == 1) {
+		pm_runtime_disable(core->dev);
+	} else {
+		if (!core->pm_domain_devs)
+			return -EINVAL;
+
+		for (i = 0; i < core->pm_domain_cnt; i++) {
+			if (core->pm_domain_devs[i])
+				dev_pm_domain_detach(core->pm_domain_devs[i], 1);
+		}
+	}
+
+	return 0;
+}
+
+static int seninf_core_pm_runtime_get_sync(struct seninf_core *core)
+{
+	int ret, i;
+
+	/* for one pm_domain */
+	if (core->pm_domain_cnt == 1) {
+		ret = pm_runtime_resume_and_get(core->dev);
+		if (ret < 0) {
+			dev_info(core->dev, "fail to resume seninf_core\n");
+			return ret;
+		}
+
+		return 0;
+	}
+
+	if (!core->pm_domain_devs)
+		return -EINVAL;
+
+	/* more than one pm_domain */
+	for (i = 0; i < core->pm_domain_cnt; i++) {
+		if (core->pm_domain_devs[i]) {
+			ret = pm_runtime_resume_and_get(core->pm_domain_devs[i]);
+			if (ret < 0) {
+				dev_info(core->dev,
+					 "fail to resume pm_domain_devs(%d)\n", i);
+				return ret;
+			}
+		}
+	}
+
+	return 0;
+}
+
+static int seninf_core_pm_runtime_put(struct seninf_core *core)
+{
+	int i;
+
+	if (core->pm_domain_cnt == 1) {
+		pm_runtime_put_sync(core->dev);
+	} else {
+		if (!core->pm_domain_devs || core->pm_domain_cnt < 1)
+			return -EINVAL;
+
+		for (i = core->pm_domain_cnt - 1; i >= 0; i--) {
+			if (core->pm_domain_devs[i])
+				pm_runtime_put_sync(core->pm_domain_devs[i]);
+		}
+	}
+
+	return 0;
+}
+
+static irqreturn_t mtk_irq_seninf(int irq, void *data)
+{
+	mtk_cam_seninf_irq_handler(irq, data);
+	return IRQ_HANDLED;
+}
+
+static int get_seninf_cfg(struct device *dev, struct seninf_core *core)
+{
+	int ret;
+	const char *ver;
+
+	ret = of_property_read_string(dev->of_node, "mtk_csi_phy_ver", &ver);
+	if (ret) {
+		dev_err(dev,
+			"Fail to get mtk_csi_phy_ver property (err=%d)\n", ret);
+
+		return ret;
+	}
+
+	if (!strcasecmp(ver, MTK_CSI_PHY_VERSIONS)) {
+		dev_info(dev, "%s: mtk_csi_phy_ver = %s\n", __func__, ver);
+
+		of_property_read_u32(dev->of_node, "seninf_num",
+				     &g_seninf_cfg->seninf_num);
+		of_property_read_u32(dev->of_node, "mux_num",
+				     &g_seninf_cfg->mux_num);
+		of_property_read_u32(dev->of_node, "cam_mux_num",
+				     &g_seninf_cfg->cam_mux_num);
+		of_property_read_u32(dev->of_node, "pref_mux_num",
+				     &g_seninf_cfg->pref_mux_num);
+
+		dev_info(dev,
+			 "%s: seninf_num = %d, mux_num = %d, cam_mux_num = %d, pref_mux_num =%d\n",
+			 __func__,
+			 g_seninf_cfg->seninf_num,
+			 g_seninf_cfg->mux_num,
+			 g_seninf_cfg->cam_mux_num,
+			 g_seninf_cfg->pref_mux_num);
+
+		return 0;
+	}
+
+	dev_err(dev, "DTS seninf config not correct.\n");
+
+	return -1;
+}
+
+static int seninf_core_probe(struct platform_device *pdev)
+{
+	int i, ret, irq;
+	struct resource *res;
+	struct seninf_core *core;
+	struct device *dev = &pdev->dev;
+
+	core = devm_kzalloc(&pdev->dev, sizeof(*core), GFP_KERNEL);
+	if (!core)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, core);
+	core->dev = dev;
+	mutex_init(&core->mutex);
+	INIT_LIST_HEAD(&core->list);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "base");
+	core->reg_if = devm_ioremap_resource(dev, res);
+	if (IS_ERR(core->reg_if))
+		return PTR_ERR(core->reg_if);
+
+	res = platform_get_resource_byname(pdev, IORESOURCE_MEM, "ana-rx");
+	core->reg_ana = devm_ioremap_resource(dev, res);
+	if (IS_ERR(core->reg_ana))
+		return PTR_ERR(core->reg_ana);
+
+	ret = get_seninf_cfg(dev, core);
+	if (ret) {
+		dev_err(dev, "failed to get seninf ops\n");
+		return ret;
+	}
+	mtk_cam_seninf_init_res(core);
+
+	spin_lock_init(&core->spinlock_irq);
+	irq = platform_get_irq(pdev, 0);
+	if (!irq) {
+		dev_err(dev, "failed to get irq\n");
+		return -ENODEV;
+	}
+
+	ret = devm_request_irq(dev, irq, mtk_irq_seninf, 0,
+			       dev_name(dev), core);
+	if (ret) {
+		dev_err(dev, "failed to request irq=%d\n", irq);
+		return ret;
+	}
+	dev_dbg(dev, "registered irq=%d\n", irq);
+
+	/* default platform properties */
+	core->cphy_settle_delay_dt = SENINF_CPHY_SETTLE_DELAY_DT;
+	core->dphy_settle_delay_dt = SENINF_DPHY_SETTLE_DELAY_DT;
+	core->settle_delay_ck = SENINF_SETTLE_DELAY_CK;
+	core->hs_trail_parameter = SENINF_HS_TRAIL_PARAMETER;
+
+	/* read platform properties from device tree */
+	of_property_read_u32(dev->of_node, "cphy_settle_delay_dt",
+			     &core->cphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "dphy_settle_delay_dt",
+			     &core->dphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "settle_delay_ck",
+			     &core->settle_delay_ck);
+	of_property_read_u32(dev->of_node, "hs_trail_parameter",
+			     &core->hs_trail_parameter);
+
+	core->dfs.cnt = 0;
+	core->dfs.reg = NULL;
+
+	ret = seninf_core_pm_runtime_enable(core);
+	if (ret) {
+		dev_info(dev, "failed to enable seninf_core_pm_runtime\n");
+		return ret;
+	}
+
+	for (i = 0; i < CLK_MAXCNT; i++) {
+		core->clk[i] = devm_clk_get(dev, clk_names[i]);
+		if (IS_ERR(core->clk[i])) {
+			dev_info(dev, "failed to get %s\n", clk_names[i]);
+			core->clk[i] = NULL;
+			/* ignore not define seninf */
+		}
+	}
+
+	ret = of_platform_populate(dev->of_node, NULL, NULL, dev);
+	if (ret) {
+		dev_info(dev, "%s: failed to create sub devices\n", __func__);
+		return ret;
+	}
+
+	ret = device_create_file(dev, &dev_attr_status);
+	if (ret)
+		dev_info(dev, "failed to create sysfs status\n");
+
+	ret = device_create_file(dev, &dev_attr_debug_ops);
+	if (ret)
+		dev_info(dev, "failed to create sysfs debug ops\n");
+
+	ret = device_create_file(dev, &dev_attr_err_status);
+	if (ret)
+		dev_info(dev, "failed to create sysfs status\n");
+
+	dev_dbg(dev, "camsys | start %s\n", __func__);
+
+	return 0;
+}
+
+static void seninf_core_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct seninf_core *core = dev_get_drvdata(dev);
+
+	device_remove_file(dev, &dev_attr_status);
+	device_remove_file(dev, &dev_attr_debug_ops);
+	device_remove_file(dev, &dev_attr_err_status);
+	of_platform_depopulate(dev);
+	seninf_core_pm_runtime_disable(core);
+
+	dev_dbg(dev, "camsys | start %s\n", __func__);
+}
+
+static const struct of_device_id seninf_core_of_match[] = {
+	{ .compatible = "mediatek,seninf-core" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, seninf_core_of_match);
+
+struct platform_driver seninf_core_pdrv = {
+	.probe	= seninf_core_probe,
+	.remove	= seninf_core_remove,
+	.driver	= {
+		.name = "seninf-core",
+		.of_match_table = seninf_core_of_match,
+	},
+};
+
+static int get_csi_port(struct device *dev, int *port)
+{
+	int i, ret;
+	const char *name;
+
+	ret = of_property_read_string(dev->of_node, "csi-port", &name);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < CSI_PORT_MAX_NUM; i++) {
+		if (!strcasecmp(name, csi_port_names[i])) {
+			*port = i;
+			return 0;
+		}
+	}
+
+	return -1;
+}
+
+static int seninf_subscribe_event(struct v4l2_subdev *sd,
+				  struct v4l2_fh *fh,
+				  struct v4l2_event_subscription *sub)
+{
+	switch (sub->type) {
+	case V4L2_EVENT_CTRL:
+		return v4l2_ctrl_subdev_subscribe_event(sd, fh, sub);
+	default:
+		return -EINVAL;
+	}
+}
+
+static void init_fmt(struct seninf_ctx *ctx)
+{
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(ctx->fmt); i++) {
+		ctx->fmt[i].format.code = MEDIA_BUS_FMT_SBGGR10_1X10;
+		ctx->fmt[i].format.width = DEFAULT_WIDTH;
+		ctx->fmt[i].format.height = DEFAULT_HEIGHT;
+		ctx->fmt[i].format.field = V4L2_FIELD_NONE;
+		ctx->fmt[i].format.colorspace = V4L2_COLORSPACE_SRGB;
+		ctx->fmt[i].format.xfer_func = V4L2_XFER_FUNC_DEFAULT;
+		ctx->fmt[i].format.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT;
+		ctx->fmt[i].format.quantization = V4L2_QUANTIZATION_DEFAULT;
+	}
+
+	for (i = 0; i < ARRAY_SIZE(ctx->vcinfo.vc); i++)
+		ctx->vcinfo.vc[i].pixel_mode = SENINF_DEF_PIXEL_MODE;
+}
+
+static int dev_read_csi_efuse(struct seninf_ctx *ctx)
+{
+	struct nvmem_cell *cell;
+	size_t len = 0;
+	u32 *buf;
+
+	ctx->m_csi_efuse = 0x00000000;
+
+	cell = nvmem_cell_get(ctx->dev, "rg_csi");
+	dev_info(ctx->dev, "ctx->port = %d\n", ctx->port);
+	if (IS_ERR(cell)) {
+		if (PTR_ERR(cell) == -EPROBE_DEFER) {
+			dev_info(ctx->dev,
+				 "read csi efuse returned with error cell %d\n",
+				 -EPROBE_DEFER - EPROBE_DEFER);
+			return PTR_ERR(cell);
+		}
+		dev_info(ctx->dev,
+			 "read csi efuse returned with error cell %d\n", -1);
+		return -1;
+	}
+	buf = (u32 *)nvmem_cell_read(cell, &len);
+	nvmem_cell_put(cell);
+	if (IS_ERR(buf)) {
+		dev_info(ctx->dev, "read csi efuse returned with error buf\n");
+		return PTR_ERR(buf);
+	}
+	ctx->m_csi_efuse = *buf;
+	kfree(buf);
+	dev_info(ctx->dev, "Efuse Data: 0x%08x\n", ctx->m_csi_efuse);
+
+	return 0;
+}
+
+static const struct v4l2_mbus_framefmt fmt_default = {
+	.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+	.width = DEFAULT_WIDTH,
+	.height = DEFAULT_HEIGHT,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_SRGB,
+	.xfer_func = V4L2_XFER_FUNC_DEFAULT,
+	.ycbcr_enc = V4L2_YCBCR_ENC_DEFAULT,
+	.quantization = V4L2_QUANTIZATION_DEFAULT,
+};
+
+static int mtk_cam_seninf_init_state(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *sd_state)
+{
+	struct v4l2_mbus_framefmt *mf;
+	unsigned int i;
+
+	for (i = 0; i < sd->entity.num_pads; i++) {
+		mf = v4l2_subdev_state_get_format(sd_state, i);
+		*mf = fmt_default;
+	}
+
+	return 0;
+}
+
+static int mtk_cam_seninf_set_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+	struct v4l2_mbus_framefmt *format;
+	char sink_format_changed = 0;
+
+	if (fmt->pad < PAD_SINK || fmt->pad >= PAD_MAXCNT)
+		return -EINVAL;
+
+	format = &ctx->fmt[fmt->pad].format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		*v4l2_subdev_state_get_format(sd_state, fmt->pad) = fmt->format;
+
+		dev_dbg(ctx->dev,
+			"s_fmt pad %d code/res 0x%x/%dx%d which %d=> 0x%x/%dx%d\n",
+			fmt->pad,
+			fmt->format.code,
+			fmt->format.width,
+			fmt->format.height,
+			fmt->which,
+			format->code,
+			format->width,
+			format->height);
+	} else {
+		/* Update vcinfo once the SINK format changed */
+		if (fmt->pad == PAD_SINK)
+			sink_format_changed = 1;
+
+		format->code = fmt->format.code;
+		format->width = fmt->format.width;
+		format->height = fmt->format.height;
+
+		if (sink_format_changed && !ctx->is_test_model)
+			mtk_cam_seninf_get_vcinfo(ctx);
+
+		dev_info(ctx->dev,
+			 "s_fmt pad %d code/res 0x%x/%dx%d which %d=> 0x%x/%dx%d\n",
+			 fmt->pad,
+			 fmt->format.code,
+			 fmt->format.width,
+			 fmt->format.height,
+			 fmt->which,
+			 format->code,
+			 format->width,
+			 format->height);
+	}
+
+	return 0;
+}
+
+static int mtk_cam_seninf_get_fmt(struct v4l2_subdev *sd,
+				  struct v4l2_subdev_state *sd_state,
+				  struct v4l2_subdev_format *fmt)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+	struct v4l2_mbus_framefmt *format;
+
+	if (fmt->pad < PAD_SINK || fmt->pad >= PAD_MAXCNT)
+		return -EINVAL;
+
+	format = &ctx->fmt[fmt->pad].format;
+
+	if (fmt->which == V4L2_SUBDEV_FORMAT_TRY) {
+		fmt->format = *v4l2_subdev_state_get_format(sd_state, fmt->pad);
+	} else {
+		fmt->format.code = format->code;
+		fmt->format.width = format->width;
+		fmt->format.height = format->height;
+		fmt->format.field = format->field;
+		fmt->format.colorspace = format->colorspace;
+		fmt->format.xfer_func = format->xfer_func;
+		fmt->format.ycbcr_enc = format->ycbcr_enc;
+		fmt->format.quantization = format->quantization;
+	}
+
+	return 0;
+}
+
+static int set_test_model(struct seninf_ctx *ctx, char enable)
+{
+	struct seninf_vc *vc[] = { NULL, NULL, NULL, NULL, NULL };
+	int i = 0, ret = 0, vc_used = 0;
+	struct seninf_mux *mux;
+	int pref_idx[] = { 0, 1, 2, 3, 4 };
+
+	if (ctx->is_test_model == 1) {
+		vc[vc_used++] = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW0);
+	} else if (ctx->is_test_model == 2) {
+		vc[vc_used++] = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW0);
+		vc[vc_used++] = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW1);
+		vc[vc_used++] = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW2);
+	} else if (ctx->is_test_model == 3) {
+		vc[vc_used++] = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW0);
+		vc[vc_used++] = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_PDAF0);
+	} else {
+		dev_info(ctx->dev, "testmodel%d invalid\n", ctx->is_test_model);
+		return -1;
+	}
+
+	for (; i < vc_used; ++i) {
+		if (!vc[i]) {
+			dev_info(ctx->dev, "vc not found\n");
+			return -1;
+		}
+	}
+
+	if (enable) {
+		ret = pm_runtime_resume_and_get(ctx->dev);
+		if (ret < 0) {
+			dev_info(ctx->dev, "failed at pm_runtime_resume_and_get\n");
+			return ret;
+		}
+
+		if (ctx->core->clk[CLK_TOP_CAMTM])
+			ret = clk_prepare_enable(ctx->core->clk[CLK_TOP_CAMTM]);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < vc_used; ++i) {
+			mux = mtk_cam_seninf_mux_get_pref(ctx,
+							  pref_idx,
+							  ARRAY_SIZE(pref_idx));
+			if (!mux)
+				return -EBUSY;
+			vc[i]->mux = mux->idx;
+			vc[i]->cam = ctx->pad2cam[vc[i]->out_pad];
+			vc[i]->enable = 1;
+
+			dev_info(ctx->dev,
+				 "test mode mux %d, cam %d, pixel mode %d\n",
+				 vc[i]->mux, vc[i]->cam, vc[i]->pixel_mode);
+
+			mtk_cam_seninf_set_test_model(ctx, vc[i]->mux,
+						      vc[i]->cam,
+						      vc[i]->pixel_mode);
+
+			if (vc[i]->out_pad == PAD_SRC_PDAF0)
+				mdelay(40);
+			else
+				usleep_range(40, 60);
+		}
+	} else {
+		mtk_cam_seninf_set_idle(ctx);
+		mtk_cam_seninf_release_mux(ctx);
+
+		if (ctx->core->clk[CLK_TOP_CAMTM])
+			clk_disable_unprepare(ctx->core->clk[CLK_TOP_CAMTM]);
+
+		pm_runtime_put_sync(ctx->dev);
+	}
+
+	ctx->streaming = enable;
+
+	return 0;
+}
+
+static int config_hw(struct seninf_ctx *ctx)
+{
+	int i, intf, skip_mux_ctrl;
+	int hs_pol, vs_pol, vc_sel, dt_sel, dt_en;
+	struct seninf_vcinfo *vcinfo;
+	struct seninf_vc *vc;
+	struct seninf_mux *mux, *mux_by_grp[SENINF_VC_MAXCNT] = { 0 };
+
+	intf = ctx->seninf_idx;
+	vcinfo = &ctx->vcinfo;
+
+	mtk_cam_seninf_reset(ctx, intf);
+
+	mtk_cam_seninf_set_vc(ctx, intf, vcinfo);
+
+	mtk_cam_seninf_set_csi_mipi(ctx);
+
+	/* should set false */
+	hs_pol = 0;
+	vs_pol = 0;
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		vc = &vcinfo->vc[i];
+
+		/* alloc mux by group */
+		if (mux_by_grp[vc->group]) {
+			mux = mux_by_grp[vc->group];
+			skip_mux_ctrl = 1;
+		} else {
+			int pref_idx[] = {0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
+					10, 11, 12, 13, 14, 15,	16, 17, 18, 19, 20, 21 };
+			mux_by_grp[vc->group] =
+				mtk_cam_seninf_mux_get_pref(ctx,
+							    pref_idx,
+							    g_seninf_cfg->pref_mux_num);
+			mux = mux_by_grp[vc->group];
+			skip_mux_ctrl = 0;
+		}
+
+		if (!mux) {
+			mtk_cam_seninf_release_mux(ctx);
+			return -EBUSY;
+		}
+
+		vc->mux = mux->idx;
+		vc->cam = ctx->pad2cam[vc->out_pad];
+
+		if (!skip_mux_ctrl) {
+			mtk_cam_seninf_mux(ctx, vc->mux);
+			mtk_cam_seninf_set_mux_ctrl(ctx, vc->mux,
+						    hs_pol, vs_pol,
+				MIPI_SENSOR + vc->group,
+				vc->pixel_mode);
+
+			mtk_cam_seninf_set_top_mux_ctrl(ctx, vc->mux, intf);
+
+			/* disable mtk_cam_seninf_set_mux_crop length limit */
+		}
+		dev_info(ctx->dev, "ctx->pad2cam[%d] %d vc->out_pad %d vc->cam %d, i %d",
+			 vc->out_pad, ctx->pad2cam[vc->out_pad], vc->out_pad, vc->cam, i);
+
+		if (vc->cam != 0xff) {
+			vc_sel = vc->vc;
+			dt_sel = vc->dt;
+			dt_en = !!dt_sel;
+
+			/* CMD_SENINF_FINALIZE_CAM_MUX */
+			mtk_cam_seninf_set_cammux_vc(ctx, vc->cam,
+						     vc_sel, dt_sel,
+						     dt_en, dt_en);
+			mtk_cam_seninf_set_cammux_src(ctx, vc->mux, vc->cam,
+						      vc->exp_hsize,
+						      vc->exp_vsize);
+			mtk_cam_seninf_set_cammux_chk_pixel_mode(ctx,
+								 vc->cam,
+								 vc->pixel_mode);
+			mtk_cam_seninf_cammux(ctx, vc->cam);
+
+			dev_info(ctx->dev, "vc[%d] pad %d intf %d mux %d cam %d\n",
+				 i, vc->out_pad, intf, vc->mux, vc->cam);
+		} else {
+			dev_info(ctx->dev,
+				 "not set camtg yet, vc[%d] pad %d intf %d mux %d cam %d\n",
+				 i, vc->out_pad, intf, vc->mux, vc->cam);
+		}
+	}
+	return 0;
+}
+
+static int calc_buffered_pixel_rate(struct device *dev,
+				    s64 width, s64 height,
+				    s64 hblank, s64 vblank,
+				    int fps_n, int fps_d, s64 *result)
+{
+	s64 orig_pixel_rate = *result;
+	u64 buffered_pixel_rate, pclk, k;
+
+	if (fps_d == 0 || width == 0 || hblank == 0 || ISP_CLK_LOW == 0) {
+		dev_info(dev,
+			 "Prevent divided by 0, fps_d= %d, w= %llu, h= %llu, ISP_CLK= %d\n",
+			 fps_d, width, hblank, ISP_CLK_LOW);
+		return 0;
+	}
+
+	/* calculate pclk */
+	pclk = (width + hblank) * (height + vblank) * fps_n;
+	do_div(pclk, fps_d);
+
+	/* calculate buffered pixel_rate */
+	buffered_pixel_rate = orig_pixel_rate * width;
+	k = HW_BUF_EFFECT * orig_pixel_rate;
+	do_div(k, ISP_CLK_LOW);
+	do_div(buffered_pixel_rate, (width + hblank - k));
+	*result = buffered_pixel_rate;
+
+	dev_info(dev,
+		 "%s: w %lld h %lld hb %lld vb %lld fps %d/%d pclk %lld->%lld orig %lld k %lld hbe %d\n",
+		 __func__, width, height, hblank, vblank,
+		 fps_n, fps_d, pclk, buffered_pixel_rate, orig_pixel_rate, k, HW_BUF_EFFECT);
+
+	return 0;
+}
+
+static int get_buffered_pixel_rate(struct seninf_ctx *ctx,
+				   struct v4l2_subdev *sd, int sd_pad_idx,
+				   s64 *result)
+{
+	int ret;
+	struct v4l2_ctrl *ctrl;
+	struct v4l2_subdev_format fmt;
+	struct v4l2_subdev_frame_interval fi;
+	s64 width, height, hblank, vblank;
+
+	fmt.pad = sd_pad_idx;
+	fmt.which = V4L2_SUBDEV_FORMAT_ACTIVE;
+	ret = v4l2_subdev_call(sd, pad, get_fmt, NULL, &fmt);
+	if (ret) {
+		dev_info(ctx->dev, "no get_fmt in %s\n", sd->name);
+		return ret;
+	}
+
+	width = fmt.format.width;
+	height = fmt.format.height;
+
+	memset(&fi, 0, sizeof(fi));
+	fi.pad = sd_pad_idx;
+	ret = v4l2_subdev_call_state_active(sd, pad, get_frame_interval, &fi);
+	if (ret) {
+		dev_info(ctx->dev, "no get_frame_interval in %s\n", sd->name);
+		return ret;
+	}
+
+	ctrl = v4l2_ctrl_find(sd->ctrl_handler, V4L2_CID_HBLANK);
+	if (!ctrl) {
+		dev_info(ctx->dev, "no hblank in %s\n", sd->name);
+		return -EINVAL;
+	}
+
+	hblank = v4l2_ctrl_g_ctrl(ctrl);
+
+	ctrl = v4l2_ctrl_find(sd->ctrl_handler, V4L2_CID_VBLANK);
+	if (!ctrl) {
+		dev_info(ctx->dev, "no vblank in %s\n", sd->name);
+		return -EINVAL;
+	}
+
+	vblank = v4l2_ctrl_g_ctrl(ctrl);
+
+	/* update fps */
+	ctx->fps_n = fi.interval.denominator;
+	ctx->fps_d = fi.interval.numerator;
+
+	return calc_buffered_pixel_rate(ctx->dev, width, height, hblank, vblank,
+					ctx->fps_n, ctx->fps_d, result);
+}
+
+static int get_pixel_rate(struct seninf_ctx *ctx, struct v4l2_subdev *sd,
+			  s64 *result)
+{
+	struct v4l2_ctrl *ctrl;
+
+	ctrl = v4l2_ctrl_find(sd->ctrl_handler, V4L2_CID_PIXEL_RATE);
+	if (!ctrl) {
+		dev_info(ctx->dev, "no pixel rate in subdev %s\n", sd->name);
+		return -EINVAL;
+	}
+
+	*result = v4l2_ctrl_g_ctrl_int64(ctrl);
+
+	return 0;
+}
+
+int update_isp_clk(struct seninf_ctx *ctx)
+{
+	int i, pixelmode;
+	struct seninf_dfs *dfs = &ctx->core->dfs;
+	s64 pixel_rate = -1;
+	u64 dfs_freq;
+	struct seninf_vc *vc;
+	int ret = 0;
+
+	if (!dfs->cnt) {
+		dev_info(ctx->dev, "dfs not ready.\n");
+		return ret;
+	}
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, PAD_SRC_RAW0);
+	if (!vc) {
+		dev_info(ctx->dev, "failed to get vc\n");
+		return -1;
+	}
+	dev_info(ctx->dev,
+		 "%s dfs->cnt %d pixel mode %d customized_pixel_rate %lld, buffered_pixel_rate %lld mipi_pixel_rate %lld\n",
+		 __func__, dfs->cnt, vc->pixel_mode, ctx->customized_pixel_rate,
+		 ctx->buffered_pixel_rate, ctx->mipi_pixel_rate);
+
+	/* Use SensorPixelrate */
+	if (ctx->customized_pixel_rate) {
+		pixel_rate = ctx->customized_pixel_rate;
+	} else if (ctx->buffered_pixel_rate) {
+		pixel_rate = ctx->buffered_pixel_rate;
+	} else if (ctx->mipi_pixel_rate) {
+		pixel_rate = ctx->mipi_pixel_rate;
+	} else {
+		dev_info(ctx->dev, "failed to get pixel_rate\n");
+		return -EINVAL;
+	}
+
+	pixelmode = vc->pixel_mode;
+	for (i = 0; i < dfs->cnt; i++) {
+		dfs_freq = dfs->freqs[i];
+		dfs_freq = dfs_freq * (100 - SENINF_CLK_MARGIN_IN_PERCENT);
+		do_div(dfs_freq, 100);
+		if ((dfs_freq << pixelmode) >= pixel_rate)
+			break;
+	}
+
+	if (i == dfs->cnt) {
+		dev_info(ctx->dev, "mux is overrun. please adjust pixelmode\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int debug_err_detect_initialize(struct seninf_ctx *ctx)
+{
+	struct seninf_core *core;
+	struct seninf_ctx *ctx_;
+
+	core = dev_get_drvdata(ctx->dev->parent);
+
+	core->csi_irq_en_flag = 0;
+
+	list_for_each_entry(ctx_, &core->list, list) {
+		ctx_->data_not_enough_flag = 0;
+		ctx_->err_lane_resync_flag = 0;
+		ctx_->crc_err_flag = 0;
+		ctx_->ecc_err_double_flag = 0;
+		ctx_->ecc_err_corrected_flag = 0;
+		ctx_->fifo_overrun_flag = 0;
+		ctx_->size_err_flag = 0;
+		ctx_->data_not_enough_cnt = 0;
+		ctx_->err_lane_resync_cnt = 0;
+		ctx_->crc_err_cnt = 0;
+		ctx_->ecc_err_double_cnt = 0;
+		ctx_->ecc_err_corrected_cnt = 0;
+		ctx_->fifo_overrun_cnt = 0;
+		ctx_->size_err_cnt = 0;
+	}
+
+	return 0;
+}
+
+static int seninf_s_stream(struct v4l2_subdev *sd, int enable)
+{
+	int ret;
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	if (ctx->streaming == enable)
+		return 0;
+
+	if (ctx->is_test_model)
+		return set_test_model(ctx, enable);
+
+	if (!ctx->sensor_sd) {
+		dev_info(ctx->dev, "no sensor\n");
+		return -EFAULT;
+	}
+
+	if (enable) {
+		debug_err_detect_initialize(ctx);
+
+		get_pixel_rate(ctx, ctx->sensor_sd, &ctx->mipi_pixel_rate);
+
+		ctx->buffered_pixel_rate = ctx->mipi_pixel_rate;
+		get_buffered_pixel_rate(ctx, ctx->sensor_sd,
+					ctx->sensor_pad_idx,
+					&ctx->buffered_pixel_rate);
+
+		ret = pm_runtime_resume_and_get(ctx->dev);
+		if (ret < 0) {
+			dev_info(ctx->dev,
+				 "%s pm_runtime_resume_and_get ret %d\n",
+				 __func__, ret);
+			return ret;
+		}
+
+		update_isp_clk(ctx);
+
+		ret = config_hw(ctx);
+		if (ret) {
+			dev_info(ctx->dev, "config_seninf_hw ret %d\n", ret);
+			return ret;
+		}
+
+		/* middleware control sensor fsync after set cam-mux */
+
+		ret = v4l2_subdev_call(ctx->sensor_sd, video, s_stream, 1);
+		if (ret) {
+			dev_info(ctx->dev, "sensor stream-on ret %d\n", ret);
+			return ret;
+		}
+
+	} else {
+		ret = v4l2_subdev_call(ctx->sensor_sd, video, s_stream, 0);
+		if (ret) {
+			dev_info(ctx->dev, "sensor stream-off ret %d\n", ret);
+			return ret;
+		}
+
+		mtk_cam_seninf_set_idle(ctx);
+		mtk_cam_seninf_release_mux(ctx);
+
+		mtk_cam_seninf_poweroff(ctx);
+		pm_runtime_put_sync(ctx->dev);
+	}
+
+	ctx->streaming = enable;
+	return 0;
+}
+
+static const struct v4l2_subdev_pad_ops seninf_subdev_pad_ops = {
+	.link_validate = mtk_cam_link_validate,
+	.set_fmt = mtk_cam_seninf_set_fmt,
+	.get_fmt = mtk_cam_seninf_get_fmt,
+};
+
+static const struct v4l2_subdev_video_ops seninf_subdev_video_ops = {
+	.s_stream = seninf_s_stream,
+};
+
+static const struct v4l2_subdev_core_ops seninf_subdev_core_ops = {
+	.subscribe_event	= seninf_subscribe_event,
+	.unsubscribe_event	= v4l2_event_subdev_unsubscribe,
+};
+
+static const struct v4l2_subdev_internal_ops seninf_subdev_internal_ops = {
+	.init_state = mtk_cam_seninf_init_state,
+};
+
+static const struct v4l2_subdev_ops seninf_subdev_ops = {
+	.core	= &seninf_subdev_core_ops,
+	.video	= &seninf_subdev_video_ops,
+	.pad	= &seninf_subdev_pad_ops,
+};
+
+static int seninf_link_setup(struct media_entity *entity,
+			     const struct media_pad *local,
+			     const struct media_pad *remote, u32 flags)
+{
+	struct v4l2_subdev *sd;
+	struct seninf_ctx *ctx;
+
+	sd = media_entity_to_v4l2_subdev(entity);
+	if (!sd)
+		return -EINVAL;
+	ctx = v4l2_get_subdevdata(sd);
+	if (!ctx)
+		return -EINVAL;
+
+	if (local->flags & MEDIA_PAD_FL_SOURCE) {
+		if (flags & MEDIA_LNK_FL_ENABLED) {
+			if (!mtk_cam_seninf_get_vc_by_pad(ctx, local->index)) {
+				dev_info(ctx->dev,
+					 "%s enable link w/o vc_info pad idex %d\n",
+					 __func__, local->index);
+			}
+		}
+	} else {
+		/* Update vcinfo once the link becomes enabled */
+		if (flags & MEDIA_LNK_FL_ENABLED) {
+			ctx->sensor_sd =
+				media_entity_to_v4l2_subdev(remote->entity);
+			ctx->sensor_pad_idx = remote->index;
+			mtk_cam_seninf_get_vcinfo(ctx);
+		}
+	}
+
+	return 0;
+}
+
+static const struct media_entity_operations seninf_media_ops = {
+	.link_setup = seninf_link_setup,
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+struct sensor_async_subdev {
+	struct v4l2_async_connection asc;
+	u32 port;
+	u32 bus_type;
+	u32 lanes;
+};
+
+static int seninf_notifier_bound(struct v4l2_async_notifier *notifier,
+				 struct v4l2_subdev *sd,
+				 struct v4l2_async_connection *asc)
+{
+	struct seninf_ctx *ctx = notifier_to_ctx(notifier);
+	struct sensor_async_subdev *s_asd =
+		container_of(asc, struct sensor_async_subdev, asc);
+	int ret;
+
+	dev_info(ctx->dev, "[%s] %s bounded, bus_type:%d, lanes:%d\n",
+		 __func__, sd->entity.name, s_asd->bus_type, s_asd->lanes);
+
+	ctx->is_cphy = (s_asd->bus_type == V4L2_MBUS_CSI2_CPHY);
+	ctx->num_data_lanes = s_asd->lanes;
+
+	ret = media_create_pad_link(&sd->entity, 0, &ctx->subdev.entity, 0, 0);
+	if (ret) {
+		dev_info(ctx->dev, "failed to create link for %s\n",
+			 sd->entity.name);
+		return ret;
+	}
+
+	ret = v4l2_device_register_subdev_nodes(ctx->subdev.v4l2_dev);
+	if (ret) {
+		dev_info(ctx->dev, "failed to create subdev nodes\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void seninf_notifier_unbind(struct v4l2_async_notifier *notifier,
+				   struct v4l2_subdev *sd,
+				   struct v4l2_async_connection *asc)
+{
+	struct seninf_ctx *ctx = notifier_to_ctx(notifier);
+
+	dev_info(ctx->dev, "%s is unbounded\n", sd->entity.name);
+}
+
+static const struct v4l2_async_notifier_operations seninf_async_ops = {
+	.bound = seninf_notifier_bound,
+	.unbind = seninf_notifier_unbind,
+};
+
+/* Update vcinfo once test_model switches */
+static int seninf_test_pattern(struct seninf_ctx *ctx, u32 pattern)
+{
+	switch (pattern) {
+	case 0:
+		if (ctx->streaming)
+			return -EBUSY;
+		ctx->is_test_model = 0;
+		mtk_cam_seninf_get_vcinfo(ctx);
+		dev_info(ctx->dev, "test pattern off\n");
+		break;
+	case 1: /* 1 RAW only */
+	case 2: /* 3 Stagger expo */
+	case 3: /* 1 RAW and 1 PD */
+		if (ctx->streaming)
+			return -EBUSY;
+		ctx->is_test_model = pattern;
+		mtk_cam_seninf_get_vcinfo_test(ctx);
+		dev_info(ctx->dev, "test pattern on\n");
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int mtk_cam_seninf_set_ctrl(struct v4l2_ctrl *ctrl)
+{
+	struct seninf_ctx *ctx = ctrl_hdl_to_ctx(ctrl->handler);
+	int ret = -EINVAL;
+
+	switch (ctrl->id) {
+	case V4L2_CID_TEST_PATTERN:
+		ret = seninf_test_pattern(ctx, ctrl->val);
+		break;
+	default:
+		ret = 0;
+		dev_info(ctx->dev, "%s Unhandled id:0x%x, val:0x%x\n",
+			 __func__, ctrl->id, ctrl->val);
+		break;
+	}
+
+	return ret;
+}
+
+static const struct v4l2_ctrl_ops seninf_ctrl_ops = {
+	.s_ctrl = mtk_cam_seninf_set_ctrl,
+};
+
+static int seninf_open(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	mutex_lock(&ctx->mutex);
+	ctx->open_refcnt++;
+
+	if (ctx->open_refcnt == 1)
+		dev_info(ctx->dev, "%s open_refcnt %d\n",
+			 __func__, ctx->open_refcnt);
+
+	mutex_unlock(&ctx->mutex);
+
+	return 0;
+}
+
+static int seninf_close(struct v4l2_subdev *sd, struct v4l2_subdev_fh *fh)
+{
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	mutex_lock(&ctx->mutex);
+	ctx->open_refcnt--;
+
+	if (!ctx->open_refcnt) {
+		dev_info(ctx->dev, "%s open_refcnt %d\n",
+			 __func__, ctx->open_refcnt);
+		if (ctx->streaming)
+			seninf_s_stream(&ctx->subdev, 0);
+	}
+
+	mutex_unlock(&ctx->mutex);
+
+	return 0;
+}
+
+static const struct v4l2_subdev_internal_ops seninf_internal_ops = {
+	.open = seninf_open,
+	.close = seninf_close,
+};
+
+static const char *const seninf_test_pattern_menu[] = {
+	"Disabled",
+	"generate_test_pattern",
+	"generate_test_pattern_stagger",
+	"generate_test_pattern_pd",
+};
+
+static int seninf_initialize_controls(struct seninf_ctx *ctx)
+{
+	struct v4l2_ctrl_handler *handler;
+	int ret;
+
+	handler = &ctx->ctrl_handler;
+	ret = v4l2_ctrl_handler_init(handler, 2);
+	if (ret)
+		return ret;
+	v4l2_ctrl_new_std_menu_items(handler, &seninf_ctrl_ops,
+				     V4L2_CID_TEST_PATTERN,
+				     ARRAY_SIZE(seninf_test_pattern_menu) - 1,
+				     0, 0, seninf_test_pattern_menu);
+
+	if (handler->error) {
+		ret = handler->error;
+		dev_info(ctx->dev, "Failed to init controls(%d)\n", ret);
+		goto err_free_handler;
+	}
+
+	ctx->subdev.ctrl_handler = handler;
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(handler);
+
+	return ret;
+}
+
+static int seninf_parse_endpoint(struct device *dev,
+				 struct v4l2_fwnode_endpoint *vep,
+				 struct sensor_async_subdev *s_asd)
+{
+	struct fwnode_handle *remote_hnd;
+
+	s_asd->port = vep->base.port;
+	s_asd->bus_type = vep->bus_type;
+	s_asd->lanes = vep->bus.mipi_csi2.num_data_lanes;
+
+	dev_dbg(dev, "Got local node port:%d type:%d lanes:%d\n",
+		vep->base.port, vep->bus_type,
+		vep->bus.mipi_csi2.num_data_lanes);
+
+	/* check if sensor endpoint assign mipi lane nums */
+	remote_hnd = fwnode_graph_get_remote_endpoint(vep->base.local_fwnode);
+	if (remote_hnd) {
+		u32 remote_bus = 0, remote_lanes = 0;
+
+		fwnode_property_read_u32(remote_hnd, "bus-type", &remote_bus);
+		if (remote_bus == V4L2_FWNODE_BUS_TYPE_CSI2_DPHY)
+			s_asd->bus_type = V4L2_MBUS_CSI2_DPHY;
+		else if (remote_bus == V4L2_FWNODE_BUS_TYPE_CSI2_CPHY)
+			s_asd->bus_type = V4L2_MBUS_CSI2_CPHY;
+
+		remote_lanes =
+			fwnode_property_count_u32(remote_hnd, "data-lanes");
+		if (remote_lanes > 0 &&
+		    remote_lanes <= vep->bus.mipi_csi2.num_data_lanes)
+			s_asd->lanes = remote_lanes;
+
+		fwnode_handle_put(remote_hnd);
+		dev_dbg(dev, "Got remote node lanes:%d\n", remote_lanes);
+	}
+
+	return 0;
+}
+
+static int seninf_parse_fwnode(struct device *dev,
+			       struct v4l2_async_notifier *notifier)
+{
+	struct fwnode_handle *fwnode = NULL;
+	struct v4l2_fwnode_endpoint vep = {
+		.bus_type = V4L2_MBUS_CSI2_DPHY, /* CDPHY only */
+	};
+	int ret = 0;
+
+	fwnode_graph_for_each_endpoint(dev_fwnode(dev), fwnode) {
+		struct sensor_async_subdev *s_asd;
+
+		ret = v4l2_fwnode_endpoint_parse(fwnode, &vep);
+		if (ret) {
+			dev_err(dev, "failed to parse v4l2 fwnode endpoint\n");
+			break;
+		}
+
+		if (vep.bus_type != V4L2_MBUS_CSI2_DPHY &&
+		    vep.bus_type != V4L2_MBUS_CSI2_CPHY) {
+			dev_err(dev, "Got unsupported endpoint:%d, bus:%d\n",
+				vep.base.port, vep.bus_type);
+			continue;
+		}
+
+		s_asd = v4l2_async_nf_add_fwnode_remote(notifier, fwnode,
+							struct sensor_async_subdev);
+		if (IS_ERR(s_asd)) {
+			ret = PTR_ERR(s_asd);
+			break;
+		}
+
+		ret = seninf_parse_endpoint(dev, &vep, s_asd);
+		if (ret < 0)
+			break;
+	}
+
+	if (fwnode)
+		fwnode_handle_put(fwnode);
+
+	return ret;
+}
+
+static int register_subdev(struct seninf_ctx *ctx)
+{
+	int i, ret;
+	struct v4l2_subdev *sd = &ctx->subdev;
+	struct device *dev = ctx->dev;
+	struct media_pad *pads = ctx->pads;
+	struct v4l2_async_notifier *notifier = &ctx->notifier;
+
+	v4l2_subdev_init(sd, &seninf_subdev_ops);
+	sd->internal_ops = &seninf_subdev_internal_ops;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_EVENTS;
+	sd->dev = dev;
+
+	if (strlen(dev->of_node->name) > 16)
+		snprintf(sd->name, sizeof(sd->name), "%s-%s",
+			 dev_driver_string(dev), &dev->of_node->name[16]);
+	else
+		snprintf(sd->name, sizeof(sd->name), "%s-%s",
+			 dev_driver_string(dev), csi_port_names[ctx->port]);
+
+	v4l2_set_subdevdata(sd, ctx);
+
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->entity.ops = &seninf_media_ops;
+	sd->internal_ops = &seninf_internal_ops;
+
+	pads[PAD_SINK].flags = MEDIA_PAD_FL_SINK;
+	for (i = PAD_SRC_RAW0; i < PAD_MAXCNT; i++)
+		pads[i].flags = MEDIA_PAD_FL_SOURCE;
+
+	for (i = 0; i < PAD_MAXCNT; i++)
+		ctx->pad2cam[i] = 0xff;
+
+	ret = media_entity_pads_init(&sd->entity, PAD_MAXCNT, pads);
+	if (ret < 0) {
+		dev_info(dev, "failed to init pads\n");
+		return ret;
+	}
+
+	/* register seninf as mtk_cam async child */
+	ret = v4l2_async_register_subdev(sd);
+	if (ret < 0) {
+		dev_info(dev, "failed to register subdev\n");
+		return ret;
+	}
+
+	/* register seninf as sensor async parent */
+	v4l2_async_subdev_nf_init(notifier, sd);
+	ret = seninf_parse_fwnode(dev, notifier);
+	if (ret < 0)
+		dev_info(dev, "no endpoint\n");
+
+	notifier->ops = &seninf_async_ops;
+	ret = v4l2_async_nf_register(notifier);
+	if (ret < 0) {
+		dev_info(dev, "failed to register notifier\n");
+		goto err_unregister_subdev;
+	}
+
+	return 0;
+
+err_unregister_subdev:
+	v4l2_device_unregister_subdev(sd);
+	v4l2_async_nf_cleanup(notifier);
+
+	return ret;
+}
+
+static void unregister_subdev(struct seninf_ctx *ctx)
+{
+	struct v4l2_subdev *sd = &ctx->subdev;
+
+	v4l2_async_nf_unregister(&ctx->notifier);
+	v4l2_async_nf_cleanup(&ctx->notifier);
+	v4l2_async_unregister_subdev(sd);
+	media_entity_cleanup(&sd->entity);
+}
+
+static int seninf_probe(struct platform_device *pdev)
+{
+	int ret, port;
+	struct seninf_ctx *ctx;
+	struct device *dev = &pdev->dev;
+	struct seninf_core *core;
+
+	if (!dev->parent)
+		return -EPROBE_DEFER;
+
+	/* get mtk seninf_core */
+	core = dev_get_drvdata(dev->parent);
+	if (!core)
+		return -EPROBE_DEFER;
+
+	/* init seninf_csi ctx */
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	dev_set_drvdata(dev, ctx);
+	ctx->dev = dev;
+	ctx->core = core;
+	list_add(&ctx->list, &core->list);
+	INIT_LIST_HEAD(&ctx->list_mux);
+	INIT_LIST_HEAD(&ctx->list_cam_mux);
+
+	ctx->open_refcnt = 0;
+	mutex_init(&ctx->mutex);
+
+	ret = get_csi_port(dev, &port);
+	if (ret) {
+		dev_info(dev, "get_csi_port ret %d\n", ret);
+		return ret;
+	}
+
+	mtk_cam_seninf_init_iomem(ctx, core->reg_if, core->reg_ana);
+	mtk_cam_seninf_init_port(ctx, port);
+	init_fmt(ctx);
+
+	/* platform properties */
+	ctx->cphy_settle_delay_dt = ctx->core->cphy_settle_delay_dt;
+	ctx->dphy_settle_delay_dt = ctx->core->dphy_settle_delay_dt;
+	ctx->settle_delay_ck = ctx->core->settle_delay_ck;
+	ctx->hs_trail_parameter = ctx->core->hs_trail_parameter;
+
+	of_property_read_u32(dev->of_node, "cphy_settle_delay_dt",
+			     &ctx->cphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "dphy_settle_delay_dt",
+			     &ctx->dphy_settle_delay_dt);
+	of_property_read_u32(dev->of_node, "settle_delay_ck",
+			     &ctx->settle_delay_ck);
+	of_property_read_u32(dev->of_node, "hs_trail_parameter",
+			     &ctx->hs_trail_parameter);
+
+	dev_info(dev,
+		 "seninf d_settlte/d_settle_ck/d_trail/c_settle= 0x%x/0x%x/0x%x/0x%x\n",
+		 ctx->dphy_settle_delay_dt,
+		 ctx->settle_delay_ck,
+		 ctx->hs_trail_parameter,
+		 ctx->cphy_settle_delay_dt);
+
+	ret = dev_read_csi_efuse(ctx);
+	if (ret < 0)
+		dev_info(dev, "Failed to read efuse data\n");
+
+	ret = seninf_initialize_controls(ctx);
+	if (ret) {
+		dev_info(dev, "Failed to initialize controls\n");
+		return ret;
+	}
+
+	/* bind seninf_csi to mtkcam */
+	ret = register_subdev(ctx);
+	if (ret < 0) {
+		dev_err(dev, "register_subdev failed\n");
+		goto err_free_handler;
+	}
+
+	pm_runtime_enable(dev);
+
+	dev_info(dev, "%s: port=%d\n", __func__, ctx->port);
+
+	dev_info(dev, "camsys | [%s] success\n", __func__);
+
+	return 0;
+
+err_free_handler:
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+	return ret;
+}
+
+static int runtime_suspend(struct device *dev)
+{
+	int i;
+	struct seninf_ctx *ctx = dev_get_drvdata(dev);
+	struct seninf_core *core = ctx->core;
+
+	mutex_lock(&core->mutex);
+
+	core->refcnt--;
+	if (core->refcnt == 0) {
+		i = CLK_TOP_SENINF_END;
+		do {
+			i--;
+			if (ctx->core->clk[i])
+				clk_disable_unprepare(ctx->core->clk[i]);
+		} while (i);
+		seninf_core_pm_runtime_put(core);
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return 0;
+}
+
+static int runtime_resume(struct device *dev)
+{
+	u32 i;
+	int ret;
+
+	struct seninf_ctx *ctx = dev_get_drvdata(dev);
+	struct seninf_core *core = ctx->core;
+
+	mutex_lock(&core->mutex);
+
+	core->refcnt++;
+
+	if (core->refcnt == 1) {
+		ret = seninf_core_pm_runtime_get_sync(core);
+		if (ret < 0) {
+			dev_info(dev, "seninf_core_pm_runtime_get_sync failed\n");
+			return ret;
+		}
+
+		for (i = 0; i < CLK_TOP_SENINF_END; i++) {
+			if (core->clk[i])
+				ret = clk_prepare_enable(core->clk[i]);
+			if (ret)
+				dev_dbg(dev, "%s: clk seninf%d is empty\n",
+					__func__, i);
+		}
+		mtk_cam_seninf_disable_all_mux(ctx);
+		mtk_cam_seninf_disable_all_cammux(ctx);
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return 0;
+}
+
+static const struct dev_pm_ops pm_ops = {
+	SET_RUNTIME_PM_OPS(runtime_suspend, runtime_resume, NULL)
+};
+
+static void seninf_remove(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct seninf_ctx *ctx = dev_get_drvdata(dev);
+
+	if (ctx->streaming) {
+		mtk_cam_seninf_set_idle(ctx);
+		mtk_cam_seninf_release_mux(ctx);
+	}
+
+	pm_runtime_disable(ctx->dev);
+
+	unregister_subdev(ctx);
+
+	v4l2_ctrl_handler_free(&ctx->ctrl_handler);
+
+	mutex_destroy(&ctx->mutex);
+
+	dev_dbg(dev, "camsys | start %s\n", __func__);
+}
+
+static const struct of_device_id seninf_of_match[] = {
+	{ .compatible = "mediatek,seninf" },
+	{},
+};
+MODULE_DEVICE_TABLE(of, seninf_of_match);
+
+static int seninf_suspend(struct platform_device *pdev, pm_message_t mesg)
+{
+	return 0;
+}
+
+static int seninf_resume(struct platform_device *pdev)
+{
+	return 0;
+}
+
+struct platform_driver seninf_pdrv = {
+	.probe	= seninf_probe,
+	.remove	= seninf_remove,
+	.suspend = seninf_suspend,
+	.resume = seninf_resume,
+	.driver	= {
+		.name = "seninf",
+		.of_match_table = seninf_of_match,
+		.pm  = &pm_ops,
+	},
+};
+
+int mtk_cam_seninf_calc_pixelrate(struct device *dev, s64 width, s64 height,
+				  s64 hblank, s64 vblank,
+				  int fps_n, int fps_d,
+				  s64 sensor_pixel_rate)
+{
+	int ret;
+	s64 p_pixel_rate = sensor_pixel_rate;
+
+	ret = calc_buffered_pixel_rate(dev, width, height, hblank, vblank,
+				       fps_n, fps_d, &p_pixel_rate);
+	if (ret)
+		return sensor_pixel_rate;
+
+	return p_pixel_rate;
+}
+
+int mtk_cam_seninf_get_pixelrate(struct v4l2_subdev *sd, s64 *p_pixel_rate)
+{
+	int ret;
+	s64 pixel_rate = -1;
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	if (!ctx->sensor_sd) {
+		dev_info(ctx->dev, "no sensor\n");
+		return -EFAULT;
+	}
+
+	ret = get_buffered_pixel_rate(ctx,
+				      ctx->sensor_sd, ctx->sensor_pad_idx,
+				      &pixel_rate);
+	if (ret)
+		get_pixel_rate(ctx, ctx->sensor_sd, &pixel_rate);
+
+	if (pixel_rate <= 0) {
+		dev_info(ctx->dev, "failed to get pixel_rate\n");
+		return -EINVAL;
+	}
+
+	*p_pixel_rate = pixel_rate;
+
+	return 0;
+}
+
+int mtk_cam_seninf_dump(struct v4l2_subdev *sd)
+{
+	int ret = 0;
+	struct seninf_ctx *ctx = sd_to_ctx(sd);
+
+	ret = pm_runtime_resume_and_get(ctx->dev);
+	if (ret < 0) {
+		dev_info(ctx->dev, "%s pm_runtime_resume_and_get ret %d\n",
+			 __func__, ret);
+		return ret;
+	}
+
+	if (ctx->streaming) {
+		ret = mtk_cam_seninf_debug(sd_to_ctx(sd));
+		/* user may call sensor ESD_RESET_SUPPORT */
+	} else {
+		dev_info(ctx->dev, "%s should not dump during stream off\n",
+			 __func__);
+	}
+
+	pm_runtime_put_sync(ctx->dev);
+	return ret;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
new file mode 100644
index 000000000000..117ae208cf4b
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-drv.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_DRV_H
+#define __MTK_CAM_SENINF_DRV_H
+
+#include "mtk_cam-seninf.h"
+
+extern struct platform_driver seninf_core_pdrv;
+extern struct platform_driver seninf_pdrv;
+
+int update_isp_clk(struct seninf_ctx *ctx);
+
+#endif /*__MTK_CAM_SENINF_DRV_H */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
new file mode 100644
index 000000000000..535112f318b7
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-hw.h
@@ -0,0 +1,120 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_HW_H__
+#define __MTK_CAM_SENINF_HW_H__
+
+enum SET_REG_KEYS {
+	REG_KEY_MIN = 0,
+	REG_KEY_SETTLE_CK = REG_KEY_MIN,
+	REG_KEY_SETTLE_DT,
+	REG_KEY_HS_TRAIL_EN,
+	REG_KEY_HS_TRAIL_PARAM,
+	REG_KEY_CSI_IRQ_STAT,
+	REG_KEY_CSI_RESYNC_CYCLE,
+	REG_KEY_MUX_IRQ_STAT,
+	REG_KEY_CAMMUX_IRQ_STAT,
+	REG_KEY_CAMMUX_VSYNC_IRQ_EN,
+	REG_KEY_CSI_IRQ_EN,
+	REG_KEY_MAX_NUM
+};
+
+#define SET_REG_KEYS_NAMES \
+	"RG_SETTLE_CK", \
+	"RG_SETTLE_DT", \
+	"RG_HS_TRAIL_EN", \
+	"RG_HS_TRAIL_PARAM", \
+	"RG_CSI_IRQ_STAT", \
+	"RG_CSI_RESYNC_CYCLE", \
+	"RG_MUX_IRQ_STAT", \
+	"RG_CAMMUX_IRQ_STAT", \
+	"REG_VSYNC_IRQ_EN", \
+	"RG_CSI_IRQ_EN", \
+
+struct mtk_cam_seninf_mux_meter {
+	u32 width;
+	u32 height;
+	u32 h_valid;
+	u32 h_blank;
+	u32 v_valid;
+	u32 v_blank;
+	s64 mipi_pixel_rate;
+	s64 vb_in_us;
+	s64 hb_in_us;
+	s64 line_time_in_us;
+};
+
+struct mtk_cam_seninf_cfg {
+	unsigned int seninf_num;
+	unsigned int mux_num;
+	unsigned int cam_mux_num;
+	unsigned int pref_mux_num;
+};
+
+extern struct mtk_cam_seninf_cfg *g_seninf_cfg;
+
+int mtk_cam_seninf_init_iomem(struct seninf_ctx *ctx, void __iomem *if_base,
+			      void __iomem *ana_base);
+int mtk_cam_seninf_init_port(struct seninf_ctx *ctx, int port);
+int mtk_cam_seninf_is_cammux_used(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_cammux(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_disable_cammux(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_disable_all_cammux(struct seninf_ctx *ctx);
+int mtk_cam_seninf_set_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx,
+				    int seninf_src);
+int mtk_cam_seninf_get_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx);
+int mtk_cam_seninf_get_cammux_ctrl(struct seninf_ctx *ctx, int cam_mux);
+u32 mtk_cam_seninf_get_cammux_res(struct seninf_ctx *ctx, int cam_mux);
+int mtk_cam_seninf_set_cammux_vc(struct seninf_ctx *ctx, int cam_mux,
+				 int vc_sel, int dt_sel, int vc_en,
+				 int dt_en);
+int mtk_cam_seninf_set_cammux_src(struct seninf_ctx *ctx, int src,
+				  int target, int exp_hsize, int exp_vsize);
+int mtk_cam_seninf_set_vc(struct seninf_ctx *ctx, u32 seninf_idx,
+			  struct seninf_vcinfo *vcinfo);
+int mtk_cam_seninf_set_mux_ctrl(struct seninf_ctx *ctx, u32 mux, int hs_pol,
+				int vs_pol, int src_sel, int pixel_mode);
+int mtk_cam_seninf_set_mux_crop(struct seninf_ctx *ctx, u32 mux, int start_x,
+				int end_x, int enable);
+int mtk_cam_seninf_is_mux_used(struct seninf_ctx *ctx, u32 mux);
+int mtk_cam_seninf_mux(struct seninf_ctx *ctx, u32 mux);
+int mtk_cam_seninf_disable_mux(struct seninf_ctx *ctx, u32 mux);
+int mtk_cam_seninf_disable_all_mux(struct seninf_ctx *ctx);
+int mtk_cam_seninf_set_cammux_chk_pixel_mode(struct seninf_ctx *ctx,
+					     int cam_mux, int pixel_mode);
+int mtk_cam_seninf_set_test_model(struct seninf_ctx *ctx, int mux, int cam_mux,
+				  int pixel_mode);
+int mtk_cam_seninf_set_csi_mipi(struct seninf_ctx *ctx);
+int mtk_cam_seninf_poweroff(struct seninf_ctx *ctx);
+int mtk_cam_seninf_reset(struct seninf_ctx *ctx, u32 seninf_idx);
+int mtk_cam_seninf_set_idle(struct seninf_ctx *ctx);
+int mtk_cam_seninf_get_mux_meter(struct seninf_ctx *ctx, u32 mux,
+				 struct mtk_cam_seninf_mux_meter *meter);
+ssize_t mtk_cam_seninf_show_status(struct device *dev,
+				   struct device_attribute *attr, char *buf);
+int mtk_cam_seninf_switch_to_cammux_inner_page(struct seninf_ctx *ctx,
+					       bool inner);
+int mtk_cam_seninf_set_cammux_next_ctrl(struct seninf_ctx *ctx, int src,
+					int target);
+int mtk_cam_seninf_update_mux_pixel_mode(struct seninf_ctx *ctx, u32 mux,
+					 int pixel_mode);
+int mtk_cam_seninf_irq_handler(int irq, void *data);
+int mtk_cam_seninf_set_sw_cfg_busy(struct seninf_ctx *ctx, bool enable,
+				   int index);
+int mtk_cam_seninf_set_cam_mux_dyn_en(struct seninf_ctx *ctx, bool enable,
+				      int cam_mux, int index);
+int mtk_cam_seninf_reset_cam_mux_dyn_en(struct seninf_ctx *ctx, int index);
+int mtk_cam_seninf_enable_global_drop_irq(struct seninf_ctx *ctx, bool enable,
+					  int index);
+int mtk_cam_seninf_enable_cam_mux_vsync_irq(struct seninf_ctx *ctx, bool enable,
+					    int cam_mux);
+int mtk_cam_seninf_disable_all_cam_mux_vsync_irq(struct seninf_ctx *ctx);
+int mtk_cam_seninf_debug(struct seninf_ctx *ctx);
+int mtk_cam_seninf_set_reg(struct seninf_ctx *ctx, u32 key, u32 val);
+ssize_t mtk_cam_seninf_show_err_status(struct device *dev,
+				       struct device_attribute *attr,
+				       char *buf);
+
+#endif /* __MTK_CAM_SENINF_HW_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
new file mode 100644
index 000000000000..2960ea0afd8d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-if.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_IF_H__
+#define __MTK_CAM_SENINF_IF_H__
+
+int mtk_cam_seninf_get_pixelmode(struct v4l2_subdev *sd, int pad_id,
+				 int *pixelmode);
+
+int mtk_cam_seninf_set_pixelmode(struct v4l2_subdev *sd, int pad_id,
+				 int pixelmode);
+
+int mtk_cam_seninf_set_camtg(struct v4l2_subdev *sd, int pad_id, int camtg);
+
+int mtk_cam_seninf_get_pixelrate(struct v4l2_subdev *sd, s64 *pixelrate);
+
+int mtk_cam_seninf_calc_pixelrate(struct device *dev, s64 width, s64 height,
+				  s64 hblank, s64 vblank, int fps_n, int fps_d,
+				  s64 sensor_pixel_rate);
+
+int mtk_cam_seninf_dump(struct v4l2_subdev *sd);
+
+unsigned int mtk_cam_seninf_get_vc_feature(struct v4l2_subdev *sd,
+					   unsigned int pad);
+
+#endif /* __MTK_CAM_SENINF_IF_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
new file mode 100644
index 000000000000..65f3ec058fba
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-regs.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_REGS_H__
+#define __MTK_CAM_SENINF_REGS_H__
+
+#define SENINF_BITS(base, reg, field, val)				\
+	do {								\
+		u32 __iomem *__p = (base) + (reg);			\
+		u32 __v = readl(__p);					\
+		__v &= ~field##_MASK;					\
+		__v |= (((val) << field##_SHIFT) & field##_MASK);	\
+		writel(__v, __p);					\
+	} while (0)
+
+#define SENINF_READ_BITS(base, reg, field)				\
+	({								\
+		u32 __iomem *__p = (base) + (reg);			\
+		u32 __v = readl(__p);					\
+		__v &= field##_MASK;					\
+		__v >>= field##_SHIFT;					\
+		__v;							\
+	})
+
+#define SENINF_READ_REG(base, reg)					\
+	({								\
+		u32 __iomem *__p = (base) + (reg);			\
+		u32 __v = readl(__p);					\
+		__v;							\
+	})
+
+#define SENINF_WRITE_REG(base, reg, val)				\
+	do {								\
+		u32 __iomem *__p = (base) + (reg);			\
+		writel(val, __p);					\
+	} while (0)
+
+#endif /* __MTK_CAM_SENINF_REGS_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
new file mode 100644
index 000000000000..cda62fb7fb84
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.c
@@ -0,0 +1,356 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/delay.h>
+#include <linux/platform_device.h>
+#include <linux/slab.h>
+#include <linux/of_graph.h>
+#include <linux/of_device.h>
+
+#include <linux/videodev2.h>
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-event.h>
+#include <media/v4l2-async.h>
+#include <media/v4l2-device.h>
+
+#include "mtk_cam-seninf.h"
+#include "mtk_cam-seninf-route.h"
+#include "mtk_cam-seninf-if.h"
+#include "mtk_cam-seninf-hw.h"
+#include "mtk_cam-seninf-drv.h"
+#include "kd_imgsensor_define_v4l2.h"
+
+#define to_std_fmt_code(code) \
+	((code) & 0xFFFF)
+
+void mtk_cam_seninf_init_res(struct seninf_core *core)
+{
+	int i;
+
+	INIT_LIST_HEAD(&core->list_mux);
+	for (i = 0; i < g_seninf_cfg->mux_num; i++) {
+		core->mux[i].idx = i;
+		list_add_tail(&core->mux[i].list, &core->list_mux);
+	}
+}
+
+struct seninf_mux *mtk_cam_seninf_mux_get(struct seninf_ctx *ctx)
+{
+	struct seninf_core *core = ctx->core;
+	struct seninf_mux *ent = NULL;
+
+	mutex_lock(&core->mutex);
+
+	if (!list_empty(&core->list_mux)) {
+		ent = list_first_entry(&core->list_mux,
+				       struct seninf_mux, list);
+		list_move_tail(&ent->list, &ctx->list_mux);
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return ent;
+}
+
+struct seninf_mux *mtk_cam_seninf_mux_get_pref(struct seninf_ctx *ctx,
+					       int *pref_idx, int pref_cnt)
+{
+	int i;
+	struct seninf_core *core = ctx->core;
+	struct seninf_mux *ent = NULL;
+
+	mutex_lock(&core->mutex);
+
+	list_for_each_entry(ent, &core->list_mux, list) {
+		for (i = 0; i < pref_cnt; i++) {
+			if (ent->idx == pref_idx[i]) {
+				list_move_tail(&ent->list, &ctx->list_mux);
+				mutex_unlock(&core->mutex);
+				return ent;
+			}
+		}
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return mtk_cam_seninf_mux_get(ctx);
+}
+
+void mtk_cam_seninf_mux_put(struct seninf_ctx *ctx, struct seninf_mux *mux)
+{
+	struct seninf_core *core = ctx->core;
+
+	mutex_lock(&core->mutex);
+	list_move_tail(&mux->list, &core->list_mux);
+	mutex_unlock(&core->mutex);
+}
+
+void mtk_cam_seninf_get_vcinfo_test(struct seninf_ctx *ctx)
+{
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+	struct seninf_vc *vc;
+
+	vcinfo->cnt = 0;
+
+	if (ctx->is_test_model == 1) {
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2b;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		vc->group = 0;
+	} else if (ctx->is_test_model == 2) {
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2b;
+		vc->feature = VC_STAGGER_NE;
+		vc->out_pad = PAD_SRC_RAW0;
+		vc->group = 0;
+
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2b;
+		vc->feature = VC_STAGGER_ME;
+		vc->out_pad = PAD_SRC_RAW1;
+		vc->group = 0;
+
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2b;
+		vc->feature = VC_STAGGER_SE;
+		vc->out_pad = PAD_SRC_RAW2;
+		vc->group = 0;
+	} else if (ctx->is_test_model == 3) {
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2b;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		vc->group = 0;
+
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x30;
+		vc->feature = VC_PDAF_STATS;
+		vc->out_pad = PAD_SRC_PDAF0;
+		vc->group = 0;
+	}
+}
+
+struct seninf_vc *mtk_cam_seninf_get_vc_by_pad(struct seninf_ctx *ctx, int idx)
+{
+	int i;
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		if (vcinfo->vc[i].out_pad == idx)
+			return &vcinfo->vc[i];
+	}
+
+	return NULL;
+}
+
+unsigned int mtk_cam_seninf_get_vc_feature(struct v4l2_subdev *sd,
+					   unsigned int pad)
+{
+	struct seninf_vc *pvc = NULL;
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+
+	pvc = mtk_cam_seninf_get_vc_by_pad(ctx, pad);
+	if (pvc)
+		return pvc->feature;
+
+	return VC_NONE;
+}
+
+int mtk_cam_seninf_get_vcinfo(struct seninf_ctx *ctx)
+{
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+	struct seninf_vc *vc;
+
+	if (!ctx->sensor_sd)
+		return -EINVAL;
+
+	vcinfo->cnt = 0;
+
+	switch (to_std_fmt_code(ctx->fmt[PAD_SINK].format.code)) {
+	case MEDIA_BUS_FMT_SBGGR8_1X8:
+	case MEDIA_BUS_FMT_SGBRG8_1X8:
+	case MEDIA_BUS_FMT_SGRBG8_1X8:
+	case MEDIA_BUS_FMT_SRGGB8_1X8:
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2a;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		vc->group = 0;
+		break;
+	case MEDIA_BUS_FMT_SBGGR10_1X10:
+	case MEDIA_BUS_FMT_SGBRG10_1X10:
+	case MEDIA_BUS_FMT_SGRBG10_1X10:
+	case MEDIA_BUS_FMT_SRGGB10_1X10:
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2b;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		vc->group = 0;
+		break;
+	case MEDIA_BUS_FMT_SBGGR12_1X12:
+	case MEDIA_BUS_FMT_SGBRG12_1X12:
+	case MEDIA_BUS_FMT_SGRBG12_1X12:
+	case MEDIA_BUS_FMT_SRGGB12_1X12:
+		vc = &vcinfo->vc[vcinfo->cnt++];
+		vc->vc = 0;
+		vc->dt = 0x2c;
+		vc->feature = VC_RAW_DATA;
+		vc->out_pad = PAD_SRC_RAW0;
+		vc->group = 0;
+		break;
+	default:
+		return -1;
+	}
+
+	return 0;
+}
+
+void mtk_cam_seninf_release_mux(struct seninf_ctx *ctx)
+{
+	struct seninf_mux *ent, *tmp;
+
+	list_for_each_entry_safe(ent, tmp, &ctx->list_mux, list) {
+		mtk_cam_seninf_mux_put(ctx, ent);
+	}
+}
+
+int mtk_cam_seninf_is_di_enabled(struct seninf_ctx *ctx, u8 ch, u8 dt)
+{
+	int i;
+	struct seninf_vc *vc;
+
+	for (i = 0; i < ctx->vcinfo.cnt; i++) {
+		vc = &ctx->vcinfo.vc[i];
+		if (vc->vc == ch && vc->dt == dt) {
+			if (media_pad_remote_pad_first(&ctx->pads[vc->out_pad]))
+				return 1;
+
+			return 0;
+		}
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_get_pixelmode(struct v4l2_subdev *sd,
+				 int pad_id, int *pixel_mode)
+{
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+	struct seninf_vc *vc;
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, pad_id);
+	if (!vc) {
+		pr_info("%s: invalid pad=%d\n", __func__, pad_id);
+		return -1;
+	}
+
+	*pixel_mode = vc->pixel_mode;
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_pixelmode(struct v4l2_subdev *sd,
+				 int pad_id, int pixel_mode)
+{
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+	struct seninf_vc *vc;
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, pad_id);
+	if (!vc) {
+		pr_info("%s: invalid pad=%d\n", __func__, pad_id);
+		return -1;
+	}
+
+	vc->pixel_mode = pixel_mode;
+	if (ctx->streaming) {
+		update_isp_clk(ctx);
+		mtk_cam_seninf_update_mux_pixel_mode(ctx, vc->mux, pixel_mode);
+	}
+
+	return 0;
+}
+
+static int _mtk_cam_seninf_set_camtg(struct v4l2_subdev *sd,
+				     int pad_id, int camtg, bool disable_last)
+{
+	int old_camtg;
+	struct seninf_ctx *ctx = container_of(sd, struct seninf_ctx, subdev);
+	struct seninf_vc *vc;
+
+	if (pad_id < PAD_SRC_RAW0 || pad_id >= PAD_MAXCNT)
+		return -EINVAL;
+
+	vc = mtk_cam_seninf_get_vc_by_pad(ctx, pad_id);
+	if (!vc)
+		return -EINVAL;
+
+	ctx->pad2cam[pad_id] = camtg;
+
+	/* change cam-mux while streaming */
+	if (ctx->streaming && vc->cam != camtg) {
+		if (camtg == 0xff) {
+			old_camtg = vc->cam;
+			vc->cam = 0xff;
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, true);
+			mtk_cam_seninf_set_cammux_next_ctrl(ctx, 0x1f, old_camtg);
+			mtk_cam_seninf_disable_cammux(ctx, old_camtg);
+		} else {
+			/* disable old */
+			old_camtg = vc->cam;
+			/* enable new */
+			vc->cam = camtg;
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, true);
+			mtk_cam_seninf_set_cammux_next_ctrl(ctx, 0x1f, vc->cam);
+
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, false);
+
+			mtk_cam_seninf_set_cammux_vc(ctx, vc->cam,
+						     vc->vc, vc->dt,
+						     !!vc->dt, !!vc->dt);
+			mtk_cam_seninf_set_cammux_src(ctx, vc->mux, vc->cam,
+						      vc->exp_hsize,
+						      vc->exp_vsize);
+			mtk_cam_seninf_set_cammux_chk_pixel_mode(ctx,
+								 vc->cam,
+								 vc->pixel_mode);
+			if (old_camtg != 0xff && disable_last) {
+				/* disable old in next sof */
+				mtk_cam_seninf_disable_cammux(ctx, old_camtg);
+			}
+			mtk_cam_seninf_cammux(ctx, vc->cam); /* enable in next sof */
+			mtk_cam_seninf_switch_to_cammux_inner_page(ctx, true);
+			mtk_cam_seninf_set_cammux_next_ctrl(ctx, vc->mux, vc->cam);
+			if (old_camtg != 0xff && disable_last)
+				mtk_cam_seninf_set_cammux_next_ctrl(ctx,
+								    vc->mux,
+								    old_camtg);
+
+			/* user control sensor fsync after change cam-mux */
+		}
+
+		dev_info(ctx->dev, "%s: pad %d mux %d cam %d -> %d\n",
+			 __func__, vc->out_pad, vc->mux, old_camtg, vc->cam);
+	} else {
+		dev_info(ctx->dev, "%s: pad_id %d, camtg %d, ctx->streaming %d, vc->cam %d\n",
+			 __func__, pad_id, camtg, ctx->streaming, vc->cam);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_camtg(struct v4l2_subdev *sd, int pad_id, int camtg)
+{
+	return _mtk_cam_seninf_set_camtg(sd, pad_id, camtg, true);
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
new file mode 100644
index 000000000000..99f6c6e7818d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf-route.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_ROUTE_H__
+#define __MTK_CAM_SENINF_ROUTE_H__
+
+#define MAX_MUX_CHANNEL 4
+
+void mtk_cam_seninf_init_res(struct seninf_core *core);
+
+struct seninf_mux *mtk_cam_seninf_mux_get(struct seninf_ctx *ctx);
+struct seninf_mux *mtk_cam_seninf_mux_get_pref(struct seninf_ctx *ctx,
+					       int *pref_idx, int pref_cnt);
+void mtk_cam_seninf_mux_put(struct seninf_ctx *ctx, struct seninf_mux *mux);
+void mtk_cam_seninf_release_mux(struct seninf_ctx *ctx);
+void mtk_cam_seninf_get_vcinfo_test(struct seninf_ctx *ctx);
+struct seninf_vc *mtk_cam_seninf_get_vc_by_pad(struct seninf_ctx *ctx, int idx);
+int mtk_cam_seninf_get_vcinfo(struct seninf_ctx *ctx);
+int mtk_cam_seninf_is_di_enabled(struct seninf_ctx *ctx, u8 ch, u8 dt);
+
+#endif /* __MTK_CAM_SENINF_ROUTE_H__ */
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
new file mode 100644
index 000000000000..6984e6d1b3ff
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_cam-seninf.h
@@ -0,0 +1,170 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MTK_CAM_SENINF_H__
+#define __MTK_CAM_SENINF_H__
+
+#include <media/v4l2-subdev.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+
+#include "mtk_cam-seninf-def.h"
+#include "kd_imgsensor_define_v4l2.h"
+#include "mtk_cam-seninf-regs.h"
+
+struct seninf_mux {
+	struct list_head list;
+	int idx;
+};
+
+struct seninf_cam_mux {
+	struct list_head list;
+	int idx;
+};
+
+struct seninf_vc {
+	u8 vc;
+	u8 dt;
+	u8 feature;
+	u8 out_pad;
+	u8 pixel_mode;
+	u8 group;
+	u8 mux; /* allocated per group */
+	u8 cam; /* assigned by cam driver */
+	u8 enable;
+	u16 exp_hsize;
+	u16 exp_vsize;
+};
+
+struct seninf_vcinfo {
+	struct seninf_vc vc[SENINF_VC_MAXCNT];
+	int cnt;
+};
+
+struct seninf_dfs {
+	struct device *dev;
+	struct regulator *reg;
+	unsigned long *freqs;
+	unsigned long *volts;
+	int cnt;
+};
+
+struct seninf_core {
+	struct device *dev;
+	int pm_domain_cnt;
+	struct device **pm_domain_devs;
+	struct clk *clk[CLK_MAXCNT];
+	struct seninf_dfs dfs;
+	struct list_head list;
+	struct list_head list_mux; /* available mux */
+	struct seninf_mux mux[SENINF_MUX_NUM];
+	struct mutex mutex;  /* protect seninf core operations */
+	void __iomem *reg_if;
+	void __iomem *reg_ana;
+	int refcnt;
+
+	/* platform properties */
+	int cphy_settle_delay_dt;
+	int dphy_settle_delay_dt;
+	int settle_delay_ck;
+	int hs_trail_parameter;
+
+	/* protect variables in irq handler */
+	spinlock_t spinlock_irq;
+
+	/* mipi error detection count */
+	unsigned int detection_cnt;
+	/* enable csi irq flag */
+	unsigned int csi_irq_en_flag;
+};
+
+struct seninf_ctx {
+	struct v4l2_subdev subdev;
+	struct v4l2_async_notifier notifier;
+	struct device *dev;
+	struct v4l2_ctrl_handler ctrl_handler;
+	struct media_pad pads[PAD_MAXCNT];
+	struct v4l2_subdev_format fmt[PAD_MAXCNT];
+	struct seninf_core *core;
+	struct list_head list;
+
+	u32 port;
+	u32 port_a;
+	u32 port_b;
+	u32 port_num;
+	u32 num_data_lanes;
+	s64 mipi_pixel_rate;
+	s64 buffered_pixel_rate;
+	s64 customized_pixel_rate;
+	unsigned int m_csi_efuse;
+
+	unsigned int is_4d1c:1;
+	unsigned int is_cphy:1;
+	unsigned int is_test_model:4;
+	unsigned int is_secure:1;
+	unsigned int sec_info_addr;
+	u32 seninf_idx;
+	int pad2cam[PAD_MAXCNT];
+
+	/* remote sensor */
+	struct v4l2_subdev *sensor_sd;
+	u32 sensor_pad_idx;
+
+	/* provided by sensor */
+	struct seninf_vcinfo vcinfo;
+	int fps_n;
+	int fps_d;
+
+	/* dfs */
+	int isp_freq;
+
+	void __iomem *reg_ana_csi_rx[CSI_PORT_MAX_NUM];
+	void __iomem *reg_ana_dphy_top[CSI_PORT_MAX_NUM];
+	void __iomem *reg_ana_cphy_top[CSI_PORT_MAX_NUM];
+	void __iomem *reg_if_top;
+	void __iomem *reg_if_ctrl[SENINF_NUM];
+	void __iomem *reg_if_cam_mux;
+	void __iomem *reg_if_cam_mux_gcsr;
+	void __iomem *reg_if_cam_mux_pcsr[SENINF_CAM_MUX_NUM];
+	void __iomem *reg_if_tg[SENINF_NUM];
+	void __iomem *reg_if_csi2[SENINF_NUM];
+	void __iomem *reg_if_mux[SENINF_MUX_NUM];
+
+	/* resources */
+	struct list_head list_mux; /* work mux */
+	struct list_head list_cam_mux;
+
+	/* flags */
+	unsigned int streaming:1;
+
+	int cphy_settle_delay_dt;
+	int dphy_settle_delay_dt;
+	int settle_delay_ck;
+	int hs_trail_parameter;
+
+	int open_refcnt;
+	struct mutex mutex;  /* protect seninf context */
+
+	/* csi irq */
+	unsigned int data_not_enough_cnt;
+	unsigned int err_lane_resync_cnt;
+	unsigned int crc_err_cnt;
+	unsigned int ecc_err_double_cnt;
+	unsigned int ecc_err_corrected_cnt;
+	/* seninf_mux fifo overrun irq */
+	unsigned int fifo_overrun_cnt;
+	/* cam_mux h/v size irq */
+	unsigned int size_err_cnt;
+	/* error flag */
+	unsigned int data_not_enough_flag;
+	unsigned int err_lane_resync_flag;
+	unsigned int crc_err_flag;
+	unsigned int ecc_err_double_flag;
+	unsigned int ecc_err_corrected_flag;
+	unsigned int fifo_overrun_flag;
+	unsigned int size_err_flag;
+};
+
+#endif /* __MTK_CAM_SENINF_H__ */
-- 
2.18.0

