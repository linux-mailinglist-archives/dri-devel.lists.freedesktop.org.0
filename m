Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ABEA996BEA
	for <lists+dri-devel@lfdr.de>; Wed,  9 Oct 2024 15:31:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0283710E6FB;
	Wed,  9 Oct 2024 13:31:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=mediatek.com header.i=@mediatek.com header.b="AelIzUc/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailgw02.mediatek.com (unknown [210.61.82.184])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93DB610E6E1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Oct 2024 11:16:16 +0000 (UTC)
X-UUID: e243155a862f11ef8b96093e013ec31c-20241009
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From;
 bh=K8BNr280JSlR7cP0FVamfOuSAUagH9mHOhVDVP8fLWw=; 
 b=AelIzUc/2btIoMGWlFG2nflOil+dt4Hf6OXuIQTaXLScRkueAYesvWIhgTSXi/bvN6L2A5i6i//Vpj4bq8JpEErRbW8gXaXjyLevR+EVzqKxhg2m1KWOW3Oin1Japlr1DTyNBzv9vGgqz81grkp3AHOfDPJ53M06Oykju6srNqc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.41, REQID:0312fa28-ec99-4451-b344-9025bfc3da7e, IP:0,
 U
 RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
 release,TS:0
X-CID-META: VersionHash:6dc6a47, CLOUDID:248a0041-8751-41b2-98dd-475503d45150,
 B
 ulkID:nil,BulkQuantity:0,Recheck:0,SF:102,TC:nil,Content:0,EDM:-3,IP:nil,U
 RL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:1,OSI:0,OSA:0,AV:0,LES:1,
 SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,OSH|NGT
X-CID-BAS: 2,OSH|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: e243155a862f11ef8b96093e013ec31c-20241009
Received: from mtkmbs14n1.mediatek.inc [(172.21.101.75)] by
 mailgw02.mediatek.com (envelope-from <shu-hsiang.yang@mediatek.com>)
 (Generic MTA with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
 with ESMTP id 288086585; Wed, 09 Oct 2024 19:16:08 +0800
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.26; Wed, 9 Oct 2024 19:16:06 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1118.26 via Frontend Transport; Wed, 9 Oct 2024 19:16:06 +0800
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
Subject: [PATCH v1 02/10] media: platform: mediatek: add seninf controller
Date: Wed, 9 Oct 2024 19:15:43 +0800
Message-ID: <20241009111551.27052-3-Shu-hsiang.Yang@mediatek.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain
X-TM-AS-Product-Ver: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-AS-Result: No-10--17.556000-8.000000
X-TMASE-MatchedRID: EOzCvkUI2XJCC3JecVI9Vq+dYEguu4aVJq5DgTAZDtsnynQtBMZAAtnf
 JrUSEbFD0pQCgxG38xUIkFSbCXH0xc3AmdtMjGJV7spMO3HwKCDDHSNFHFxB8/EJBoK3pfxuUQ3
 NFKzJAeyMPepmK8xHyNVf+xUxOpYQN8PEWMb3wtiimtMQe97AAOJ6l5ocmTNK1JVSTP0E9d58rw
 AwWerBmIKuFcvdRxJ2OvJz+HZ1ghGQqMvYg6LYsJA6S0SjvcYUHQwQ9gfpMR5tw+n+iKWyyBXjz
 2Yr0Ugb9mO4udLA1/iVkysc+ADcMw+/n/431GMSJmbrB1j4XwphBfGxmdHCgh68dIEhVd3VjGyk
 vTEeLpFoBVJLx4KfEAlzTqJYFPTwVo9xxUteKSuyBjDX4sGuTSG4xLksx3hx3HqWhvh1onWPdZV
 YbQwPh6okLK+BXKXp0uU94EBIvxQUhfC/ipzRk6IBnfMCFBiCzV4D+5YmeSJX14Hy+eYp7yG6/1
 cZ3ZJy8DYhDIi7GCYVaq9ckOs5Fn86HKSa2b5kEPf7TDUOGop+iqFlMGARD9BkxehC6ozfXWjvA
 8TpWFjy2UZqCS3UtUjBgsju+zn2FO8S2NY+rmVQiFNNqFvt1eTWKSbLQnNIRrVBy6YVY3ieti5l
 U6HVXLbmsw77/ZAPc+bjHkTJKQR4tYfpnu6UT93FiZsHvaPcfS0Ip2eEHnwj/1Rbkzl1EzZJ+97
 rXjiZZvJ+4w4nZnXdB/CxWTRRu4BQLWahPl6cftwZ3X11IV0=
X-TM-AS-User-Approved-Sender: No
X-TM-AS-User-Blocked-Sender: No
X-TMASE-Result: 10--17.556000-8.000000
X-TMASE-Version: SMEX-14.0.0.3152-9.1.1006-23728.005
X-TM-SNTS-SMTP: D8B3024DF2B3BE7226B45E2FAF7B41A06BA7CE91B492EA68B86B8AC2FF89AC352000:8
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

Introduces support for the sensor interface in the MediaTek SoC,
with the focus on CSI and stream control. The key functionalities
include parameter control, metering and maintaining status information,
interrupt handling, and debugging. These features ensure effective
management and debugging of the camera sensor interface hardware.

Signed-off-by: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>
---
 .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 ++++++
 .../mtk_cam-seninf-csi0-cphy.h                |   69 +
 .../mtk_cam-seninf-csi0-dphy.h                |  139 +
 .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++++++++++
 .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 ++
 .../mtk_cam-seninf-seninf1-csi2.h             |  415 +++
 .../mtk_cam-seninf-seninf1-mux.h              |  147 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
 .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
 11 files changed, 5017 insertions(+)
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
 create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h

diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
new file mode 100644
index 000000000000..e00b8d3904a9
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/Makefile
@@ -0,0 +1,5 @@
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (C) 2022 MediaTek Inc.
+
+mtk-cam-isp-objs += \
+	mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.o
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
new file mode 100644
index 000000000000..ec3c621d742a
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h
@@ -0,0 +1,911 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF_CAM_MUX_H__
+#define __SENINF_CAM_MUX_H__
+
+#define SENINF_CAM_MUX_CTRL_0 0x0000
+#define RG_SENINF_CAM_MUX0_SRC_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX0_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_CAM_MUX1_SRC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX1_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_CAM_MUX2_SRC_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX2_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_CAM_MUX3_SRC_SEL_SHIFT 24
+#define RG_SENINF_CAM_MUX3_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_CTRL_1 0x0004
+#define RG_SENINF_CAM_MUX4_SRC_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX4_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_CAM_MUX5_SRC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX5_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_CAM_MUX6_SRC_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX6_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_CAM_MUX7_SRC_SEL_SHIFT 24
+#define RG_SENINF_CAM_MUX7_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_CTRL_2 0x0008
+#define RG_SENINF_CAM_MUX8_SRC_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX8_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_CAM_MUX9_SRC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX9_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_CAM_MUX10_SRC_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX10_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_CAM_MUX11_SRC_SEL_SHIFT 24
+#define RG_SENINF_CAM_MUX11_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_CTRL_3 0x000c
+#define RG_SENINF_CAM_MUX12_SRC_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX12_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_CAM_MUX13_SRC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX13_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_CAM_MUX14_SRC_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX14_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_CAM_MUX15_SRC_SEL_SHIFT 24
+#define RG_SENINF_CAM_MUX15_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_EN 0x0010
+#define SENINF_CAM_MUX0_EN_SHIFT 0
+#define SENINF_CAM_MUX0_EN_MASK (0x1 << 0)
+#define SENINF_CAM_MUX1_EN_SHIFT 1
+#define SENINF_CAM_MUX1_EN_MASK (0x1 << 1)
+#define SENINF_CAM_MUX2_EN_SHIFT 2
+#define SENINF_CAM_MUX2_EN_MASK (0x1 << 2)
+#define SENINF_CAM_MUX3_EN_SHIFT 3
+#define SENINF_CAM_MUX3_EN_MASK (0x1 << 3)
+#define SENINF_CAM_MUX4_EN_SHIFT 4
+#define SENINF_CAM_MUX4_EN_MASK (0x1 << 4)
+#define SENINF_CAM_MUX5_EN_SHIFT 5
+#define SENINF_CAM_MUX5_EN_MASK (0x1 << 5)
+#define SENINF_CAM_MUX6_EN_SHIFT 6
+#define SENINF_CAM_MUX6_EN_MASK (0x1 << 6)
+#define SENINF_CAM_MUX7_EN_SHIFT 7
+#define SENINF_CAM_MUX7_EN_MASK (0x1 << 7)
+#define SENINF_CAM_MUX8_EN_SHIFT 8
+#define SENINF_CAM_MUX8_EN_MASK (0x1 << 8)
+#define SENINF_CAM_MUX9_EN_SHIFT 9
+#define SENINF_CAM_MUX9_EN_MASK (0x1 << 9)
+#define SENINF_CAM_MUX10_EN_SHIFT 10
+#define SENINF_CAM_MUX10_EN_MASK (0x1 << 10)
+#define SENINF_CAM_MUX11_EN_SHIFT 11
+#define SENINF_CAM_MUX11_EN_MASK (0x1 << 11)
+#define SENINF_CAM_MUX12_EN_SHIFT 12
+#define SENINF_CAM_MUX12_EN_MASK (0x1 << 12)
+#define SENINF_CAM_MUX13_EN_SHIFT 13
+#define SENINF_CAM_MUX13_EN_MASK (0x1 << 13)
+#define SENINF_CAM_MUX14_EN_SHIFT 14
+#define SENINF_CAM_MUX14_EN_MASK (0x1 << 14)
+#define SENINF_CAM_MUX15_EN_SHIFT 15
+#define SENINF_CAM_MUX15_EN_MASK (0x1 << 15)
+
+#define SENINF_CAM_MUX_CHK_EN 0x0018
+#define SENINF_CAM_MUX0_CHK_EN_SHIFT 0
+#define SENINF_CAM_MUX0_CHK_EN_MASK (0x1 << 0)
+#define SENINF_CAM_MUX1_CHK_EN_SHIFT 1
+#define SENINF_CAM_MUX1_CHK_EN_MASK (0x1 << 1)
+#define SENINF_CAM_MUX2_CHK_EN_SHIFT 2
+#define SENINF_CAM_MUX2_CHK_EN_MASK (0x1 << 2)
+#define SENINF_CAM_MUX3_CHK_EN_SHIFT 3
+#define SENINF_CAM_MUX3_CHK_EN_MASK (0x1 << 3)
+#define SENINF_CAM_MUX4_CHK_EN_SHIFT 4
+#define SENINF_CAM_MUX4_CHK_EN_MASK (0x1 << 4)
+#define SENINF_CAM_MUX5_CHK_EN_SHIFT 5
+#define SENINF_CAM_MUX5_CHK_EN_MASK (0x1 << 5)
+#define SENINF_CAM_MUX6_CHK_EN_SHIFT 6
+#define SENINF_CAM_MUX6_CHK_EN_MASK (0x1 << 6)
+#define SENINF_CAM_MUX7_CHK_EN_SHIFT 7
+#define SENINF_CAM_MUX7_CHK_EN_MASK (0x1 << 7)
+#define SENINF_CAM_MUX8_CHK_EN_SHIFT 8
+#define SENINF_CAM_MUX8_CHK_EN_MASK (0x1 << 8)
+#define SENINF_CAM_MUX9_CHK_EN_SHIFT 9
+#define SENINF_CAM_MUX9_CHK_EN_MASK (0x1 << 9)
+#define SENINF_CAM_MUX10_CHK_EN_SHIFT 10
+#define SENINF_CAM_MUX10_CHK_EN_MASK (0x1 << 10)
+#define SENINF_CAM_MUX11_CHK_EN_SHIFT 11
+#define SENINF_CAM_MUX11_CHK_EN_MASK (0x1 << 11)
+#define SENINF_CAM_MUX12_CHK_EN_SHIFT 12
+#define SENINF_CAM_MUX12_CHK_EN_MASK (0x1 << 12)
+#define SENINF_CAM_MUX13_CHK_EN_SHIFT 13
+#define SENINF_CAM_MUX13_CHK_EN_MASK (0x1 << 13)
+#define SENINF_CAM_MUX14_CHK_EN_SHIFT 14
+#define SENINF_CAM_MUX14_CHK_EN_MASK (0x1 << 14)
+#define SENINF_CAM_MUX15_CHK_EN_SHIFT 15
+#define SENINF_CAM_MUX15_CHK_EN_MASK (0x1 << 15)
+
+#define SENINF_CAM_MUX0_OPT 0x0020
+#define RG_SENINF_CAM_MUX0_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX0_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX0_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX0_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX0_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX0_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX0_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX0_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX0_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX0_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX1_OPT 0x0024
+#define RG_SENINF_CAM_MUX1_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX1_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX1_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX1_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX1_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX1_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX1_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX1_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX1_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX1_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX2_OPT 0x0028
+#define RG_SENINF_CAM_MUX2_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX2_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX2_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX2_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX2_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX2_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX2_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX2_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX2_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX2_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX3_OPT 0x002c
+#define RG_SENINF_CAM_MUX3_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX3_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX3_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX3_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX3_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX3_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX3_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX3_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX3_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX3_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX4_OPT 0x0030
+#define RG_SENINF_CAM_MUX4_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX4_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX4_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX4_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX4_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX4_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX4_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX4_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX4_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX4_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX5_OPT 0x0034
+#define RG_SENINF_CAM_MUX5_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX5_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX5_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX5_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX5_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX5_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX5_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX5_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX5_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX5_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX6_OPT 0x0038
+#define RG_SENINF_CAM_MUX6_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX6_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX6_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX6_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX6_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX6_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX6_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX6_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX6_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX6_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX7_OPT 0x003c
+#define RG_SENINF_CAM_MUX7_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX7_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX7_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX7_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX7_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX7_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX7_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX7_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX7_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX7_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX8_OPT 0x0040
+#define RG_SENINF_CAM_MUX8_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX8_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX8_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX8_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX8_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX8_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX8_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX8_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX8_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX8_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX9_OPT 0x0044
+#define RG_SENINF_CAM_MUX9_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX9_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX9_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX9_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX9_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX9_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX9_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX9_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX9_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX9_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX10_OPT 0x0048
+#define RG_SENINF_CAM_MUX10_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX10_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX10_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX10_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX10_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX10_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX10_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX10_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX10_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX10_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX11_OPT 0x004c
+#define RG_SENINF_CAM_MUX11_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX11_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX11_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX11_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX11_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX11_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX11_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX11_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX11_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX11_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX12_OPT 0x0050
+#define RG_SENINF_CAM_MUX12_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX12_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX12_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX12_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX12_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX12_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX12_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX12_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX12_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX12_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX13_OPT 0x0054
+#define RG_SENINF_CAM_MUX13_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX13_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX13_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX13_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX13_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX13_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX13_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX13_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX13_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX13_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX14_OPT 0x0058
+#define RG_SENINF_CAM_MUX14_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX14_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX14_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX14_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX14_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX14_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX14_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX14_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX14_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX14_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX15_OPT 0x005c
+#define RG_SENINF_CAM_MUX15_VC_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX15_VC_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX15_DT_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX15_DT_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX15_VC_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX15_VC_SEL_MASK (0x1f << 8)
+#define RG_SENINF_CAM_MUX15_DT_SEL_SHIFT 16
+#define RG_SENINF_CAM_MUX15_DT_SEL_MASK (0x3f << 16)
+#define RG_SENINF_CAM_MUX15_VSYNC_BYPASS_SHIFT 24
+#define RG_SENINF_CAM_MUX15_VSYNC_BYPASS_MASK (0x1 << 24)
+
+#define SENINF_CAM_MUX_CTRL 0x0080
+#define SENINF_CAM_MUX_SW_RST_SHIFT 0
+#define SENINF_CAM_MUX_SW_RST_MASK (0x1 << 0)
+#define SENINF_CAM_MUX_IRQ_SW_RST_SHIFT 1
+#define SENINF_CAM_MUX_IRQ_SW_RST_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX_SLICE_FULL_OPT_SHIFT 7
+#define RG_SENINF_CAM_MUX_SLICE_FULL_OPT_MASK (0x1 << 7)
+#define RG_SENINF_CAM_MUX_IRQ_CLR_MODE_SHIFT 8
+#define RG_SENINF_CAM_MUX_IRQ_CLR_MODE_MASK (0x1 << 8)
+#define RG_SENINF_CAM_MUX_IRQ_VERIF_EN_SHIFT 9
+#define RG_SENINF_CAM_MUX_IRQ_VERIF_EN_MASK (0x1 << 9)
+
+#define SENINF_CAM_MUX_DYN_CTRL 0x0088
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0_SHIFT 0
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1_SHIFT 4
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1_MASK (0x1 << 4)
+#define CAM_MUX_DYN_PAGE_SEL_SHIFT 28
+#define CAM_MUX_DYN_PAGE_SEL_MASK (0x1 << 28)
+
+#define SENINF_CAM_MUX_DYN_EN 0x008c
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_EN0_SHIFT 0
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_EN0_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_EN1_SHIFT 16
+#define RG_SENINF_CAM_MUX_DYN_SWITCH_EN1_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX_NEXT_CTRL_0 0x0090
+#define CAM_MUX0_NEXT_SRC_SEL_SHIFT 0
+#define CAM_MUX0_NEXT_SRC_SEL_MASK (0xf << 0)
+#define CAM_MUX1_NEXT_SRC_SEL_SHIFT 8
+#define CAM_MUX1_NEXT_SRC_SEL_MASK (0xf << 8)
+#define CAM_MUX2_NEXT_SRC_SEL_SHIFT 16
+#define CAM_MUX2_NEXT_SRC_SEL_MASK (0xf << 16)
+#define CAM_MUX3_NEXT_SRC_SEL_SHIFT 24
+#define CAM_MUX3_NEXT_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_NEXT_CTRL_1 0x0094
+#define CAM_MUX4_NEXT_SRC_SEL_SHIFT 0
+#define CAM_MUX4_NEXT_SRC_SEL_MASK (0xf << 0)
+#define CAM_MUX5_NEXT_SRC_SEL_SHIFT 8
+#define CAM_MUX5_NEXT_SRC_SEL_MASK (0xf << 8)
+#define CAM_MUX6_NEXT_SRC_SEL_SHIFT 16
+#define CAM_MUX6_NEXT_SRC_SEL_MASK (0xf << 16)
+#define CAM_MUX7_NEXT_SRC_SEL_SHIFT 24
+#define CAM_MUX7_NEXT_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_NEXT_CTRL_2 0x0098
+#define CAM_MUX8_NEXT_SRC_SEL_SHIFT 0
+#define CAM_MUX8_NEXT_SRC_SEL_MASK (0xf << 0)
+#define CAM_MUX9_NEXT_SRC_SEL_SHIFT 8
+#define CAM_MUX9_NEXT_SRC_SEL_MASK (0xf << 8)
+#define CAM_MUX10_NEXT_SRC_SEL_SHIFT 16
+#define CAM_MUX10_NEXT_SRC_SEL_MASK (0xf << 16)
+#define CAM_MUX11_NEXT_SRC_SEL_SHIFT 24
+#define CAM_MUX11_NEXT_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_NEXT_CTRL_3 0x009c
+#define CAM_MUX12_NEXT_SRC_SEL_SHIFT 0
+#define CAM_MUX12_NEXT_SRC_SEL_MASK (0xf << 0)
+#define CAM_MUX13_NEXT_SRC_SEL_SHIFT 8
+#define CAM_MUX13_NEXT_SRC_SEL_MASK (0xf << 8)
+#define CAM_MUX14_NEXT_SRC_SEL_SHIFT 16
+#define CAM_MUX14_NEXT_SRC_SEL_MASK (0xf << 16)
+#define CAM_MUX15_NEXT_SRC_SEL_SHIFT 24
+#define CAM_MUX15_NEXT_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_CAM_MUX_IRQ_EN 0x00a0
+#define RG_SENINF_CAM_MUX0_HSIZE_ERR_IRQ_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX0_HSIZE_ERR_IRQ_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX0_VSIZE_ERR_IRQ_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX0_VSIZE_ERR_IRQ_EN_MASK (0x1 << 1)
+#define RG_SENINF_CAM_MUX1_HSIZE_ERR_IRQ_EN_SHIFT 2
+#define RG_SENINF_CAM_MUX1_HSIZE_ERR_IRQ_EN_MASK (0x1 << 2)
+#define RG_SENINF_CAM_MUX1_VSIZE_ERR_IRQ_EN_SHIFT 3
+#define RG_SENINF_CAM_MUX1_VSIZE_ERR_IRQ_EN_MASK (0x1 << 3)
+#define RG_SENINF_CAM_MUX2_HSIZE_ERR_IRQ_EN_SHIFT 4
+#define RG_SENINF_CAM_MUX2_HSIZE_ERR_IRQ_EN_MASK (0x1 << 4)
+#define RG_SENINF_CAM_MUX2_VSIZE_ERR_IRQ_EN_SHIFT 5
+#define RG_SENINF_CAM_MUX2_VSIZE_ERR_IRQ_EN_MASK (0x1 << 5)
+#define RG_SENINF_CAM_MUX3_HSIZE_ERR_IRQ_EN_SHIFT 6
+#define RG_SENINF_CAM_MUX3_HSIZE_ERR_IRQ_EN_MASK (0x1 << 6)
+#define RG_SENINF_CAM_MUX3_VSIZE_ERR_IRQ_EN_SHIFT 7
+#define RG_SENINF_CAM_MUX3_VSIZE_ERR_IRQ_EN_MASK (0x1 << 7)
+#define RG_SENINF_CAM_MUX4_HSIZE_ERR_IRQ_EN_SHIFT 8
+#define RG_SENINF_CAM_MUX4_HSIZE_ERR_IRQ_EN_MASK (0x1 << 8)
+#define RG_SENINF_CAM_MUX4_VSIZE_ERR_IRQ_EN_SHIFT 9
+#define RG_SENINF_CAM_MUX4_VSIZE_ERR_IRQ_EN_MASK (0x1 << 9)
+#define RG_SENINF_CAM_MUX5_HSIZE_ERR_IRQ_EN_SHIFT 10
+#define RG_SENINF_CAM_MUX5_HSIZE_ERR_IRQ_EN_MASK (0x1 << 10)
+#define RG_SENINF_CAM_MUX5_VSIZE_ERR_IRQ_EN_SHIFT 11
+#define RG_SENINF_CAM_MUX5_VSIZE_ERR_IRQ_EN_MASK (0x1 << 11)
+#define RG_SENINF_CAM_MUX6_HSIZE_ERR_IRQ_EN_SHIFT 12
+#define RG_SENINF_CAM_MUX6_HSIZE_ERR_IRQ_EN_MASK (0x1 << 12)
+#define RG_SENINF_CAM_MUX6_VSIZE_ERR_IRQ_EN_SHIFT 13
+#define RG_SENINF_CAM_MUX6_VSIZE_ERR_IRQ_EN_MASK (0x1 << 13)
+#define RG_SENINF_CAM_MUX7_HSIZE_ERR_IRQ_EN_SHIFT 14
+#define RG_SENINF_CAM_MUX7_HSIZE_ERR_IRQ_EN_MASK (0x1 << 14)
+#define RG_SENINF_CAM_MUX7_VSIZE_ERR_IRQ_EN_SHIFT 15
+#define RG_SENINF_CAM_MUX7_VSIZE_ERR_IRQ_EN_MASK (0x1 << 15)
+#define RG_SENINF_CAM_MUX8_HSIZE_ERR_IRQ_EN_SHIFT 16
+#define RG_SENINF_CAM_MUX8_HSIZE_ERR_IRQ_EN_MASK (0x1 << 16)
+#define RG_SENINF_CAM_MUX8_VSIZE_ERR_IRQ_EN_SHIFT 17
+#define RG_SENINF_CAM_MUX8_VSIZE_ERR_IRQ_EN_MASK (0x1 << 17)
+#define RG_SENINF_CAM_MUX9_HSIZE_ERR_IRQ_EN_SHIFT 18
+#define RG_SENINF_CAM_MUX9_HSIZE_ERR_IRQ_EN_MASK (0x1 << 18)
+#define RG_SENINF_CAM_MUX9_VSIZE_ERR_IRQ_EN_SHIFT 19
+#define RG_SENINF_CAM_MUX9_VSIZE_ERR_IRQ_EN_MASK (0x1 << 19)
+#define RG_SENINF_CAM_MUX10_HSIZE_ERR_IRQ_EN_SHIFT 20
+#define RG_SENINF_CAM_MUX10_HSIZE_ERR_IRQ_EN_MASK (0x1 << 20)
+#define RG_SENINF_CAM_MUX10_VSIZE_ERR_IRQ_EN_SHIFT 21
+#define RG_SENINF_CAM_MUX10_VSIZE_ERR_IRQ_EN_MASK (0x1 << 21)
+#define RG_SENINF_CAM_MUX11_HSIZE_ERR_IRQ_EN_SHIFT 22
+#define RG_SENINF_CAM_MUX11_HSIZE_ERR_IRQ_EN_MASK (0x1 << 22)
+#define RG_SENINF_CAM_MUX11_VSIZE_ERR_IRQ_EN_SHIFT 23
+#define RG_SENINF_CAM_MUX11_VSIZE_ERR_IRQ_EN_MASK (0x1 << 23)
+#define RG_SENINF_CAM_MUX12_HSIZE_ERR_IRQ_EN_SHIFT 24
+#define RG_SENINF_CAM_MUX12_HSIZE_ERR_IRQ_EN_MASK (0x1 << 24)
+#define RG_SENINF_CAM_MUX12_VSIZE_ERR_IRQ_EN_SHIFT 25
+#define RG_SENINF_CAM_MUX12_VSIZE_ERR_IRQ_EN_MASK (0x1 << 25)
+#define RG_SENINF_CAM_MUX13_HSIZE_ERR_IRQ_EN_SHIFT 26
+#define RG_SENINF_CAM_MUX13_HSIZE_ERR_IRQ_EN_MASK (0x1 << 26)
+#define RG_SENINF_CAM_MUX13_VSIZE_ERR_IRQ_EN_SHIFT 27
+#define RG_SENINF_CAM_MUX13_VSIZE_ERR_IRQ_EN_MASK (0x1 << 27)
+#define RG_SENINF_CAM_MUX14_HSIZE_ERR_IRQ_EN_SHIFT 28
+#define RG_SENINF_CAM_MUX14_HSIZE_ERR_IRQ_EN_MASK (0x1 << 28)
+#define RG_SENINF_CAM_MUX14_VSIZE_ERR_IRQ_EN_SHIFT 29
+#define RG_SENINF_CAM_MUX14_VSIZE_ERR_IRQ_EN_MASK (0x1 << 29)
+#define RG_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_EN_SHIFT 30
+#define RG_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_EN_MASK (0x1 << 30)
+#define RG_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_EN_SHIFT 31
+#define RG_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_EN_MASK (0x1 << 31)
+
+#define SENINF_CAM_MUX_IRQ_STATUS 0x00a8
+#define RO_SENINF_CAM_MUX0_HSIZE_ERR_IRQ_SHIFT 0
+#define RO_SENINF_CAM_MUX0_HSIZE_ERR_IRQ_MASK (0x1 << 0)
+#define RO_SENINF_CAM_MUX0_VSIZE_ERR_IRQ_SHIFT 1
+#define RO_SENINF_CAM_MUX0_VSIZE_ERR_IRQ_MASK (0x1 << 1)
+#define RO_SENINF_CAM_MUX1_HSIZE_ERR_IRQ_SHIFT 2
+#define RO_SENINF_CAM_MUX1_HSIZE_ERR_IRQ_MASK (0x1 << 2)
+#define RO_SENINF_CAM_MUX1_VSIZE_ERR_IRQ_SHIFT 3
+#define RO_SENINF_CAM_MUX1_VSIZE_ERR_IRQ_MASK (0x1 << 3)
+#define RO_SENINF_CAM_MUX2_HSIZE_ERR_IRQ_SHIFT 4
+#define RO_SENINF_CAM_MUX2_HSIZE_ERR_IRQ_MASK (0x1 << 4)
+#define RO_SENINF_CAM_MUX2_VSIZE_ERR_IRQ_SHIFT 5
+#define RO_SENINF_CAM_MUX2_VSIZE_ERR_IRQ_MASK (0x1 << 5)
+#define RO_SENINF_CAM_MUX3_HSIZE_ERR_IRQ_SHIFT 6
+#define RO_SENINF_CAM_MUX3_HSIZE_ERR_IRQ_MASK (0x1 << 6)
+#define RO_SENINF_CAM_MUX3_VSIZE_ERR_IRQ_SHIFT 7
+#define RO_SENINF_CAM_MUX3_VSIZE_ERR_IRQ_MASK (0x1 << 7)
+#define RO_SENINF_CAM_MUX4_HSIZE_ERR_IRQ_SHIFT 8
+#define RO_SENINF_CAM_MUX4_HSIZE_ERR_IRQ_MASK (0x1 << 8)
+#define RO_SENINF_CAM_MUX4_VSIZE_ERR_IRQ_SHIFT 9
+#define RO_SENINF_CAM_MUX4_VSIZE_ERR_IRQ_MASK (0x1 << 9)
+#define RO_SENINF_CAM_MUX5_HSIZE_ERR_IRQ_SHIFT 10
+#define RO_SENINF_CAM_MUX5_HSIZE_ERR_IRQ_MASK (0x1 << 10)
+#define RO_SENINF_CAM_MUX5_VSIZE_ERR_IRQ_SHIFT 11
+#define RO_SENINF_CAM_MUX5_VSIZE_ERR_IRQ_MASK (0x1 << 11)
+#define RO_SENINF_CAM_MUX6_HSIZE_ERR_IRQ_SHIFT 12
+#define RO_SENINF_CAM_MUX6_HSIZE_ERR_IRQ_MASK (0x1 << 12)
+#define RO_SENINF_CAM_MUX6_VSIZE_ERR_IRQ_SHIFT 13
+#define RO_SENINF_CAM_MUX6_VSIZE_ERR_IRQ_MASK (0x1 << 13)
+#define RO_SENINF_CAM_MUX7_HSIZE_ERR_IRQ_SHIFT 14
+#define RO_SENINF_CAM_MUX7_HSIZE_ERR_IRQ_MASK (0x1 << 14)
+#define RO_SENINF_CAM_MUX7_VSIZE_ERR_IRQ_SHIFT 15
+#define RO_SENINF_CAM_MUX7_VSIZE_ERR_IRQ_MASK (0x1 << 15)
+#define RO_SENINF_CAM_MUX8_HSIZE_ERR_IRQ_SHIFT 16
+#define RO_SENINF_CAM_MUX8_HSIZE_ERR_IRQ_MASK (0x1 << 16)
+#define RO_SENINF_CAM_MUX8_VSIZE_ERR_IRQ_SHIFT 17
+#define RO_SENINF_CAM_MUX8_VSIZE_ERR_IRQ_MASK (0x1 << 17)
+#define RO_SENINF_CAM_MUX9_HSIZE_ERR_IRQ_SHIFT 18
+#define RO_SENINF_CAM_MUX9_HSIZE_ERR_IRQ_MASK (0x1 << 18)
+#define RO_SENINF_CAM_MUX9_VSIZE_ERR_IRQ_SHIFT 19
+#define RO_SENINF_CAM_MUX9_VSIZE_ERR_IRQ_MASK (0x1 << 19)
+#define RO_SENINF_CAM_MUX10_HSIZE_ERR_IRQ_SHIFT 20
+#define RO_SENINF_CAM_MUX10_HSIZE_ERR_IRQ_MASK (0x1 << 20)
+#define RO_SENINF_CAM_MUX10_VSIZE_ERR_IRQ_SHIFT 21
+#define RO_SENINF_CAM_MUX10_VSIZE_ERR_IRQ_MASK (0x1 << 21)
+#define RO_SENINF_CAM_MUX11_HSIZE_ERR_IRQ_SHIFT 22
+#define RO_SENINF_CAM_MUX11_HSIZE_ERR_IRQ_MASK (0x1 << 22)
+#define RO_SENINF_CAM_MUX11_VSIZE_ERR_IRQ_SHIFT 23
+#define RO_SENINF_CAM_MUX11_VSIZE_ERR_IRQ_MASK (0x1 << 23)
+#define RO_SENINF_CAM_MUX12_HSIZE_ERR_IRQ_SHIFT 24
+#define RO_SENINF_CAM_MUX12_HSIZE_ERR_IRQ_MASK (0x1 << 24)
+#define RO_SENINF_CAM_MUX12_VSIZE_ERR_IRQ_SHIFT 25
+#define RO_SENINF_CAM_MUX12_VSIZE_ERR_IRQ_MASK (0x1 << 25)
+#define RO_SENINF_CAM_MUX13_HSIZE_ERR_IRQ_SHIFT 26
+#define RO_SENINF_CAM_MUX13_HSIZE_ERR_IRQ_MASK (0x1 << 26)
+#define RO_SENINF_CAM_MUX13_VSIZE_ERR_IRQ_SHIFT 27
+#define RO_SENINF_CAM_MUX13_VSIZE_ERR_IRQ_MASK (0x1 << 27)
+#define RO_SENINF_CAM_MUX14_HSIZE_ERR_IRQ_SHIFT 28
+#define RO_SENINF_CAM_MUX14_HSIZE_ERR_IRQ_MASK (0x1 << 28)
+#define RO_SENINF_CAM_MUX14_VSIZE_ERR_IRQ_SHIFT 29
+#define RO_SENINF_CAM_MUX14_VSIZE_ERR_IRQ_MASK (0x1 << 29)
+#define RO_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_SHIFT 30
+#define RO_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_MASK (0x1 << 30)
+#define RO_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_SHIFT 31
+#define RO_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_MASK (0x1 << 31)
+
+#define SENINF_CAM_MUX_VSYNC_IRQ_EN 0x00b0
+#define RG_SENINF_CAM_MUX_VSYNC_IRQ_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX_VSYNC_IRQ_EN_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_IRQ_EN_SHIFT 24
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_IRQ_EN_MASK (0x3 << 24)
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_NONE_IRQ_EN_SHIFT 28
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_NONE_IRQ_EN_MASK (0x3 << 28)
+
+#define SENINF_CAM_MUX_VSYNC_IRQ_STS 0x00b4
+#define RO_SENINF_CAM_MUX_VSYNC_IRQ_SHIFT 0
+#define RO_SENINF_CAM_MUX_VSYNC_IRQ_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX_VSYNC_ALL_IRQ_SHIFT 24
+#define RO_SENINF_CAM_MUX_VSYNC_ALL_IRQ_MASK (0x3 << 24)
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_NONE_IRQ_SHIFT 28
+#define RG_SENINF_CAM_MUX_VSYNC_ALL_NONE_IRQ_MASK (0x3 << 28)
+
+#define SENINF_CAM_MUX_DBG_CTRL 0x00c0
+#define RG_SENINF_CAM_MUX_DBG_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX_DBG_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX_DBG_SEL_SHIFT 8
+#define RG_SENINF_CAM_MUX_DBG_SEL_MASK (0xff << 8)
+
+#define SENINF_CAM_MUX_DBG_OUT 0x00c4
+#define RO_SENINF_CAM_MUX_DBG_OUT_SHIFT 0
+#define RO_SENINF_CAM_MUX_DBG_OUT_MASK (0xffffffff << 0)
+
+#define SENINF_CAM_MUX_VSYNC_T0_WINDOW_L 0x00d0
+#define RG_SENINF_CAM_MUX_VSYNC_TIMER0_WINDOW_L_SHIFT 0
+#define RG_SENINF_CAM_MUX_VSYNC_TIMER0_WINDOW_L_MASK (0xffffffff << 0)
+
+#define SENINF_CAM_MUX_VSYNC_T1_WINDOW_L 0x00d8
+#define RG_SENINF_CAM_MUX_VSYNC_TIMER1_WINDOW_L_SHIFT 0
+#define RG_SENINF_CAM_MUX_VSYNC_TIMER1_WINDOW_L_MASK (0xffffffff << 0)
+
+#define SENINF_CAM_MUX_SAT_IRQ_EN 0x00e0
+#define RG_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE0_IRQ_EN_SHIFT 0
+#define RG_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE0_IRQ_EN_MASK (0x1 << 0)
+#define RG_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE1_IRQ_EN_SHIFT 1
+#define RG_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE1_IRQ_EN_MASK (0x1 << 1)
+
+#define SENINF_CAM_MUX_SAT_IRQ_STATUS 0x00e8
+#define RO_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE0_IRQ_SHIFT 0
+#define RO_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE0_IRQ_MASK (0x1 << 0)
+#define RO_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE1_IRQ_SHIFT 1
+#define RO_SENINF_CAM_MUX_SKIP_NEXT_FRAME_EN_RISE1_IRQ_MASK (0x1 << 1)
+
+#define SENINF_CAM_SPARE 0x00f8
+#define RG_SENINF_TOP_SPARE_0_SHIFT 0
+#define RG_SENINF_TOP_SPARE_0_MASK (0xff << 0)
+#define RG_SENINF_TOP_SPARE_1_SHIFT 16
+#define RG_SENINF_TOP_SPARE_1_MASK (0xff << 16)
+
+#define SENINF_CAM_MUX0_CHK_CTL_0 0x0100
+#define RG_SENINF_CAM_MUX0_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX0_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX0_CHK_CTL_1 0x0104
+#define RG_SENINF_CAM_MUX0_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX0_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX0_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX0_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX0_CHK_RES 0x0108
+#define RO_SENINF_CAM_MUX0_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX0_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX0_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX0_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX0_CHK_ERR_RES 0x010c
+#define RO_SENINF_CAM_MUX0_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX0_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX0_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX0_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX1_CHK_CTL_0 0x0110
+#define RG_SENINF_CAM_MUX1_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX1_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX1_CHK_CTL_1 0x0114
+#define RG_SENINF_CAM_MUX1_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX1_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX1_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX1_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX1_CHK_RES 0x0118
+#define RO_SENINF_CAM_MUX1_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX1_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX1_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX1_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX1_CHK_ERR_RES 0x011c
+#define RO_SENINF_CAM_MUX1_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX1_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX1_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX1_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX2_CHK_CTL_0 0x0120
+#define RG_SENINF_CAM_MUX2_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX2_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX2_CHK_CTL_1 0x0124
+#define RG_SENINF_CAM_MUX2_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX2_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX2_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX2_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX2_CHK_RES 0x0128
+#define RO_SENINF_CAM_MUX2_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX2_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX2_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX2_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX2_CHK_ERR_RES 0x012c
+#define RO_SENINF_CAM_MUX2_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX2_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX2_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX2_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX3_CHK_CTL_0 0x0130
+#define RG_SENINF_CAM_MUX3_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX3_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX3_CHK_CTL_1 0x0134
+#define RG_SENINF_CAM_MUX3_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX3_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX3_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX3_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX3_CHK_RES 0x0138
+#define RO_SENINF_CAM_MUX3_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX3_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX3_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX3_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX3_CHK_ERR_RES 0x013c
+#define RO_SENINF_CAM_MUX3_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX3_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX3_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX3_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX4_CHK_CTL_0 0x0140
+#define RG_SENINF_CAM_MUX4_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX4_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX4_CHK_CTL_1 0x0144
+#define RG_SENINF_CAM_MUX4_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX4_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX4_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX4_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX4_CHK_RES 0x0148
+#define RO_SENINF_CAM_MUX4_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX4_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX4_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX4_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX4_CHK_ERR_RES 0x014c
+#define RO_SENINF_CAM_MUX4_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX4_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX4_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX4_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX5_CHK_CTL_0 0x0150
+#define RG_SENINF_CAM_MUX5_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX5_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX5_CHK_CTL_1 0x0154
+#define RG_SENINF_CAM_MUX5_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX5_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX5_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX5_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX5_CHK_RES 0x0158
+#define RO_SENINF_CAM_MUX5_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX5_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX5_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX5_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX5_CHK_ERR_RES 0x015c
+#define RO_SENINF_CAM_MUX5_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX5_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX5_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX5_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX6_CHK_CTL_0 0x0160
+#define RG_SENINF_CAM_MUX6_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX6_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX6_CHK_CTL_1 0x0164
+#define RG_SENINF_CAM_MUX6_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX6_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX6_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX6_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX6_CHK_RES 0x0168
+#define RO_SENINF_CAM_MUX6_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX6_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX6_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX6_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX6_CHK_ERR_RES 0x016c
+#define RO_SENINF_CAM_MUX6_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX6_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX6_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX6_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX7_CHK_CTL_0 0x0170
+#define RG_SENINF_CAM_MUX7_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX7_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX7_CHK_CTL_1 0x0174
+#define RG_SENINF_CAM_MUX7_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX7_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX7_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX7_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX7_CHK_RES 0x0178
+#define RO_SENINF_CAM_MUX7_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX7_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX7_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX7_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX7_CHK_ERR_RES 0x017c
+#define RO_SENINF_CAM_MUX7_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX7_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX7_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX7_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX8_CHK_CTL_0 0x0180
+#define RG_SENINF_CAM_MUX8_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX8_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX8_CHK_CTL_1 0x0184
+#define RG_SENINF_CAM_MUX8_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX8_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX8_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX8_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX8_CHK_RES 0x0188
+#define RO_SENINF_CAM_MUX8_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX8_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX8_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX8_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX8_CHK_ERR_RES 0x018c
+#define RO_SENINF_CAM_MUX8_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX8_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX8_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX8_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX9_CHK_CTL_0 0x0190
+#define RG_SENINF_CAM_MUX9_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX9_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX9_CHK_CTL_1 0x0194
+#define RG_SENINF_CAM_MUX9_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX9_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX9_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX9_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX9_CHK_RES 0x0198
+#define RO_SENINF_CAM_MUX9_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX9_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX9_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX9_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX9_CHK_ERR_RES 0x019c
+#define RO_SENINF_CAM_MUX9_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX9_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX9_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX9_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX10_CHK_CTL_0 0x01a0
+#define RG_SENINF_CAM_MUX10_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX10_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX10_CHK_CTL_1 0x01a4
+#define RG_SENINF_CAM_MUX10_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX10_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX10_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX10_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX10_CHK_RES 0x01a8
+#define RO_SENINF_CAM_MUX10_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX10_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX10_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX10_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX10_CHK_ERR_RES 0x01ac
+#define RO_SENINF_CAM_MUX10_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX10_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX10_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX10_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX11_CHK_CTL_0 0x01b0
+#define RG_SENINF_CAM_MUX11_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX11_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX11_CHK_CTL_1 0x01b4
+#define RG_SENINF_CAM_MUX11_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX11_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX11_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX11_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX11_CHK_RES 0x01b8
+#define RO_SENINF_CAM_MUX11_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX11_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX11_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX11_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX11_CHK_ERR_RES 0x01bc
+#define RO_SENINF_CAM_MUX11_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX11_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX11_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX11_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX12_CHK_CTL_0 0x01c0
+#define RG_SENINF_CAM_MUX12_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX12_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX12_CHK_CTL_1 0x01c4
+#define RG_SENINF_CAM_MUX12_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX12_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX12_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX12_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX12_CHK_RES 0x01c8
+#define RO_SENINF_CAM_MUX12_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX12_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX12_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX12_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX12_CHK_ERR_RES 0x01cc
+#define RO_SENINF_CAM_MUX12_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX12_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX12_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX12_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX13_CHK_CTL_0 0x01d0
+#define RG_SENINF_CAM_MUX13_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX13_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX13_CHK_CTL_1 0x01d4
+#define RG_SENINF_CAM_MUX13_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX13_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX13_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX13_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX13_CHK_RES 0x01d8
+#define RO_SENINF_CAM_MUX13_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX13_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX13_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX13_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX13_CHK_ERR_RES 0x01dc
+#define RO_SENINF_CAM_MUX13_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX13_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX13_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX13_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX14_CHK_CTL_0 0x01e0
+#define RG_SENINF_CAM_MUX14_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX14_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX14_CHK_CTL_1 0x01e4
+#define RG_SENINF_CAM_MUX14_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX14_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX14_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX14_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX14_CHK_RES 0x01e8
+#define RO_SENINF_CAM_MUX14_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX14_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX14_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX14_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX14_CHK_ERR_RES 0x01ec
+#define RO_SENINF_CAM_MUX14_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX14_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX14_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX14_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX15_CHK_CTL_0 0x01f0
+#define RG_SENINF_CAM_MUX15_PIX_MODE_SEL_SHIFT 0
+#define RG_SENINF_CAM_MUX15_PIX_MODE_SEL_MASK (0x3 << 0)
+
+#define SENINF_CAM_MUX15_CHK_CTL_1 0x01f4
+#define RG_SENINF_CAM_MUX15_EXP_HSIZE_SHIFT 0
+#define RG_SENINF_CAM_MUX15_EXP_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_CAM_MUX15_EXP_VSIZE_SHIFT 16
+#define RG_SENINF_CAM_MUX15_EXP_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX15_CHK_RES 0x01f8
+#define RO_SENINF_CAM_MUX15_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX15_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX15_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX15_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_CAM_MUX15_CHK_ERR_RES 0x01fc
+#define RO_SENINF_CAM_MUX15_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_CAM_MUX15_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_CAM_MUX15_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_CAM_MUX15_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
new file mode 100644
index 000000000000..84447bc76b40
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
@@ -0,0 +1,69 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __CSI0_CPHY_TOP_H__
+#define __CSI0_CPHY_TOP_H__
+
+#define CPHY_RX_CTRL 0x0000
+#define CPHY_RX_TR0_LPRX_EN_SHIFT 0
+#define CPHY_RX_TR0_LPRX_EN_MASK (0x1 << 0)
+#define CPHY_RX_TR1_LPRX_EN_SHIFT 1
+#define CPHY_RX_TR1_LPRX_EN_MASK (0x1 << 1)
+#define CPHY_RX_TR2_LPRX_EN_SHIFT 2
+#define CPHY_RX_TR2_LPRX_EN_MASK (0x1 << 2)
+#define CPHY_RX_TR3_LPRX_EN_SHIFT 3
+#define CPHY_RX_TR3_LPRX_EN_MASK (0x1 << 3)
+#define CPHY_RX_TR0_HSRX_EN_SHIFT 4
+#define CPHY_RX_TR0_HSRX_EN_MASK (0x1 << 4)
+#define CPHY_RX_TR1_HSRX_EN_SHIFT 5
+#define CPHY_RX_TR1_HSRX_EN_MASK (0x1 << 5)
+#define CPHY_RX_TR2_HSRX_EN_SHIFT 6
+#define CPHY_RX_TR2_HSRX_EN_MASK (0x1 << 6)
+#define CPHY_RX_TR3_HSRX_EN_SHIFT 7
+#define CPHY_RX_TR3_HSRX_EN_MASK (0x1 << 7)
+#define CPHY_RX_TR0_BIST_EN_SHIFT 16
+#define CPHY_RX_TR0_BIST_EN_MASK (0x1 << 16)
+#define CPHY_RX_TR1_BIST_EN_SHIFT 17
+#define CPHY_RX_TR1_BIST_EN_MASK (0x1 << 17)
+#define CPHY_RX_TR2_BIST_EN_SHIFT 18
+#define CPHY_RX_TR2_BIST_EN_MASK (0x1 << 18)
+#define CPHY_RX_TR3_BIST_EN_SHIFT 19
+#define CPHY_RX_TR3_BIST_EN_MASK (0x1 << 19)
+
+#define CPHY_RX_DETECT_CTRL_SYNC 0x0010
+#define RG_CPHY_RX_DETECT_7S_DIS_SYNC_SHIFT 0
+#define RG_CPHY_RX_DETECT_7S_DIS_SYNC_MASK (0x1 << 0)
+#define RG_CPHY_RX_DETECT_7S_MASK_SYNC_SHIFT 1
+#define RG_CPHY_RX_DETECT_7S_MASK_SYNC_MASK (0x7f << 1)
+#define RG_CPHY_RX_DETECT_7S_WORD_SYNC_SHIFT 8
+#define RG_CPHY_RX_DETECT_7S_WORD_SYNC_MASK (0x1fffff << 8)
+
+#define CPHY_RX_DETECT_CTRL_ESCAPE 0x0014
+#define RG_CPHY_RX_DETECT_7S_DIS_ESCAPE_SHIFT 0
+#define RG_CPHY_RX_DETECT_7S_DIS_ESCAPE_MASK (0x1 << 0)
+#define RG_CPHY_RX_DETECT_7S_MASK_ESCAPE_SHIFT 1
+#define RG_CPHY_RX_DETECT_7S_MASK_ESCAPE_MASK (0x7f << 1)
+#define RG_CPHY_RX_DETECT_7S_WORD_ESCAPE_SHIFT 8
+#define RG_CPHY_RX_DETECT_7S_WORD_ESCAPE_MASK (0x1fffff << 8)
+
+#define CPHY_RX_DETECT_CTRL_POST 0x0018
+#define RG_CPHY_RX_DETECT_7S_DIS_POST_SHIFT 0
+#define RG_CPHY_RX_DETECT_7S_DIS_POST_MASK (0x1 << 0)
+#define RG_CPHY_RX_DATA_VALID_POST_EN_SHIFT 4
+#define RG_CPHY_RX_DATA_VALID_POST_EN_MASK (0x1 << 4)
+#define RG_CPHY_RX_DETECT_7S_WORD_POST_SHIFT 8
+#define RG_CPHY_RX_DETECT_7S_WORD_POST_MASK (0x1fffff << 8)
+
+#define CPHY_RX_FSM_STATUS 0x00e4
+#define RO_CPHY_RX_TR0_FSM_SHIFT 0
+#define RO_CPHY_RX_TR0_FSM_MASK (0xff << 0)
+#define RO_CPHY_RX_TR1_FSM_SHIFT 8
+#define RO_CPHY_RX_TR1_FSM_MASK (0xff << 8)
+#define RO_CPHY_RX_TR2_FSM_SHIFT 16
+#define RO_CPHY_RX_TR2_FSM_MASK (0xff << 16)
+#define RO_CPHY_RX_TR3_FSM_SHIFT 24
+#define RO_CPHY_RX_TR3_FSM_MASK (0xff << 24)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
new file mode 100644
index 000000000000..7fc7dced8e7f
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
@@ -0,0 +1,139 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __CSI0_DPHY_TOP_H__
+#define __CSI0_DPHY_TOP_H__
+
+#define DPHY_RX_LANE_EN 0x0000
+#define DPHY_RX_LC0_EN_SHIFT 0
+#define DPHY_RX_LC0_EN_MASK (0x1 << 0)
+#define DPHY_RX_LC1_EN_SHIFT 1
+#define DPHY_RX_LC1_EN_MASK (0x1 << 1)
+#define DPHY_RX_LD0_EN_SHIFT 8
+#define DPHY_RX_LD0_EN_MASK (0x1 << 8)
+#define DPHY_RX_LD1_EN_SHIFT 9
+#define DPHY_RX_LD1_EN_MASK (0x1 << 9)
+#define DPHY_RX_LD2_EN_SHIFT 10
+#define DPHY_RX_LD2_EN_MASK (0x1 << 10)
+#define DPHY_RX_LD3_EN_SHIFT 11
+#define DPHY_RX_LD3_EN_MASK (0x1 << 11)
+#define DPHY_RX_SW_RST_SHIFT 31
+#define DPHY_RX_SW_RST_MASK (0x1 << 31)
+
+#define DPHY_RX_LANE_SELECT 0x0004
+#define RG_DPHY_RX_LC0_SEL_SHIFT 0
+#define RG_DPHY_RX_LC0_SEL_MASK (0x7 << 0)
+#define RG_DPHY_RX_LC1_SEL_SHIFT 4
+#define RG_DPHY_RX_LC1_SEL_MASK (0x7 << 4)
+#define RG_DPHY_RX_LD0_SEL_SHIFT 8
+#define RG_DPHY_RX_LD0_SEL_MASK (0x7 << 8)
+#define RG_DPHY_RX_LD1_SEL_SHIFT 12
+#define RG_DPHY_RX_LD1_SEL_MASK (0x7 << 12)
+#define RG_DPHY_RX_LD2_SEL_SHIFT 16
+#define RG_DPHY_RX_LD2_SEL_MASK (0x7 << 16)
+#define RG_DPHY_RX_LD3_SEL_SHIFT 20
+#define RG_DPHY_RX_LD3_SEL_MASK (0x7 << 20)
+#define DPHY_RX_CK_DATA_MUX_EN_SHIFT 31
+#define DPHY_RX_CK_DATA_MUX_EN_MASK (0x1 << 31)
+
+#define DPHY_RX_HS_RX_EN_SW 0x0008
+#define RG_DPHY_RX_LC0_HSRX_EN_SW_SHIFT 0
+#define RG_DPHY_RX_LC0_HSRX_EN_SW_MASK (0x1 << 0)
+#define RG_DPHY_RX_LC1_HSRX_EN_SW_SHIFT 1
+#define RG_DPHY_RX_LC1_HSRX_EN_SW_MASK (0x1 << 1)
+#define RG_CDPHY_RX_LD0_TRIO0_HSRX_EN_SW_SHIFT 8
+#define RG_CDPHY_RX_LD0_TRIO0_HSRX_EN_SW_MASK (0x1 << 8)
+#define RG_CDPHY_RX_LD1_TRIO1_HSRX_EN_SW_SHIFT 9
+#define RG_CDPHY_RX_LD1_TRIO1_HSRX_EN_SW_MASK (0x1 << 9)
+#define RG_CDPHY_RX_LD2_TRIO2_HSRX_EN_SW_SHIFT 10
+#define RG_CDPHY_RX_LD2_TRIO2_HSRX_EN_SW_MASK (0x1 << 10)
+#define RG_CDPHY_RX_LD2_TRIO3_HSRX_EN_SW_SHIFT 11
+#define RG_CDPHY_RX_LD2_TRIO3_HSRX_EN_SW_MASK (0x1 << 11)
+
+#define DPHY_RX_CLOCK_LANE0_HS_PARAMETER 0x0010
+#define RG_DPHY_RX_LC0_HS_PREPARE_PARAMETER_SHIFT 0
+#define RG_DPHY_RX_LC0_HS_PREPARE_PARAMETER_MASK (0xff << 0)
+#define RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER_SHIFT 16
+#define RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER_MASK (0xff << 16)
+#define RG_DPHY_RX_LC0_HS_PREPARE_EN_SHIFT 28
+#define RG_DPHY_RX_LC0_HS_PREPARE_EN_MASK (0x1 << 28)
+#define RG_DPHY_RX_LC0_HS_OPTION_SHIFT 30
+#define RG_DPHY_RX_LC0_HS_OPTION_MASK (0x1 << 30)
+
+#define DPHY_RX_CLOCK_LANE1_HS_PARAMETER 0x0014
+#define RG_DPHY_RX_LC1_HS_PREPARE_PARAMETER_SHIFT 0
+#define RG_DPHY_RX_LC1_HS_PREPARE_PARAMETER_MASK (0xff << 0)
+#define RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER_SHIFT 16
+#define RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER_MASK (0xff << 16)
+#define RG_DPHY_RX_LC1_HS_PREPARE_EN_SHIFT 28
+#define RG_DPHY_RX_LC1_HS_PREPARE_EN_MASK (0x1 << 28)
+#define RG_DPHY_RX_LC1_HS_OPTION_SHIFT 30
+#define RG_DPHY_RX_LC1_HS_OPTION_MASK (0x1 << 30)
+
+#define DPHY_RX_DATA_LANE0_HS_PARAMETER 0x0020
+#define RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_PARAMETER_SHIFT 0
+#define RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_PARAMETER_MASK (0xff << 0)
+#define RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER_SHIFT 8
+#define RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER_MASK (0xff << 8)
+#define RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER_SHIFT 16
+#define RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER_MASK (0xff << 16)
+#define RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_EN_SHIFT 28
+#define RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_EN_MASK (0x1 << 28)
+#define RG_DPHY_RX_LD0_HS_TRAIL_EN_SHIFT 29
+#define RG_DPHY_RX_LD0_HS_TRAIL_EN_MASK (0x1 << 29)
+
+#define DPHY_RX_DATA_LANE1_HS_PARAMETER 0x0024
+#define RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_PARAMETER_SHIFT 0
+#define RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_PARAMETER_MASK (0xff << 0)
+#define RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER_SHIFT 8
+#define RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER_MASK (0xff << 8)
+#define RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER_SHIFT 16
+#define RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER_MASK (0xff << 16)
+#define RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_EN_SHIFT 28
+#define RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_EN_MASK (0x1 << 28)
+#define RG_DPHY_RX_LD1_HS_TRAIL_EN_SHIFT 29
+#define RG_DPHY_RX_LD1_HS_TRAIL_EN_MASK (0x1 << 29)
+
+#define DPHY_RX_DATA_LANE2_HS_PARAMETER 0x0028
+#define RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_PARAMETER_SHIFT 0
+#define RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_PARAMETER_MASK (0xff << 0)
+#define RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER_SHIFT 8
+#define RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER_MASK (0xff << 8)
+#define RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER_SHIFT 16
+#define RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER_MASK (0xff << 16)
+#define RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_EN_SHIFT 28
+#define RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_EN_MASK (0x1 << 28)
+#define RG_DPHY_RX_LD2_HS_TRAIL_EN_SHIFT 29
+#define RG_DPHY_RX_LD2_HS_TRAIL_EN_MASK (0x1 << 29)
+
+#define DPHY_RX_DATA_LANE3_HS_PARAMETER 0x002c
+#define RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_PARAMETER_SHIFT 0
+#define RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_PARAMETER_MASK (0xff << 0)
+#define RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER_SHIFT 8
+#define RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER_MASK (0xff << 8)
+#define RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER_SHIFT 16
+#define RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER_MASK (0xff << 16)
+#define RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_EN_SHIFT 28
+#define RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_EN_MASK (0x1 << 28)
+#define RG_DPHY_RX_LD3_HS_TRAIL_EN_SHIFT 29
+#define RG_DPHY_RX_LD3_HS_TRAIL_EN_MASK (0x1 << 29)
+
+#define DPHY_RX_CLOCK_LANE_FSM 0x0030
+#define RO_DPHY_RX_CL0_FSM_SHIFT 0
+#define RO_DPHY_RX_CL0_FSM_MASK (0x3f << 0)
+#define RO_DPHY_RX_CL1_FSM_SHIFT 8
+#define RO_DPHY_RX_CL1_FSM_MASK (0x3f << 8)
+
+#define DPHY_RX_DATA_LANE_FSM 0x0034
+#define RO_DPHY_RX_DL0_FSM_SHIFT 0
+#define RO_DPHY_RX_DL0_FSM_MASK (0xff << 0)
+#define RO_DPHY_RX_DL1_FSM_SHIFT 8
+#define RO_DPHY_RX_DL1_FSM_MASK (0xff << 8)
+#define RO_DPHY_RX_DL2_FSM_SHIFT 16
+#define RO_DPHY_RX_DL2_FSM_MASK (0xff << 16)
+#define RO_DPHY_RX_DL3_FSM_SHIFT 24
+#define RO_DPHY_RX_DL3_FSM_MASK (0xff << 24)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
new file mode 100644
index 000000000000..f24d8a056d0e
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
@@ -0,0 +1,2879 @@
+// SPDX-License-Identifier: GPL-2.0
+// Copyright (c) 2022 MediaTek Inc.
+
+#include <linux/module.h>
+#include <linux/delay.h>
+
+#include "../mtk_cam-seninf.h"
+#include "../mtk_cam-seninf-hw.h"
+#include "../mtk_cam-seninf-regs.h"
+#include "mtk_cam-seninf-top-ctrl.h"
+#include "mtk_cam-seninf-seninf1-mux.h"
+#include "mtk_cam-seninf-seninf1.h"
+#include "mtk_cam-seninf-seninf1-csi2.h"
+#include "mtk_cam-seninf-tg1.h"
+#include "mtk_cam-seninf-cammux.h"
+#include "mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h"
+#include "mtk_cam-seninf-csi0-cphy.h"
+#include "mtk_cam-seninf-csi0-dphy.h"
+#include "../kd_imgsensor_define_v4l2.h"
+
+/* seninf cfg default, dts may override */
+static struct mtk_cam_seninf_cfg _seninf_cfg = {
+	.mux_num = 8,
+	.seninf_num = 4,
+	.cam_mux_num = 11,
+	.pref_mux_num = 11,
+};
+
+struct mtk_cam_seninf_cfg *g_seninf_cfg = &_seninf_cfg;
+
+static inline void mtk_cam_seninf_set_di_ch_ctrl(void __iomem *pseninf,
+						 unsigned int stream_id,
+						 struct seninf_vc *vc)
+{
+	if (stream_id > 7)
+		return;
+
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_DT_SEL, vc->dt);
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_VC_SEL, vc->vc);
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_DT_INTERLEAVE_MODE, 1);
+	SENINF_BITS(pseninf, SENINF_CSI2_S0_DI_CTRL + (stream_id << 0x2),
+		    RG_CSI2_VC_INTERLEAVE_EN, 1);
+
+	switch (stream_id) {
+	case 0:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S0_GRP_EN, 1);
+		break;
+	case 1:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S1_GRP_EN, 1);
+		break;
+	case 2:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S2_GRP_EN, 1);
+		break;
+	case 3:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S3_GRP_EN, 1);
+		break;
+	case 4:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S4_GRP_EN, 1);
+		break;
+	case 5:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S5_GRP_EN, 1);
+		break;
+	case 6:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S6_GRP_EN, 1);
+		break;
+	case 7:
+		SENINF_BITS(pseninf, SENINF_CSI2_CH0_CTRL + (vc->group << 0x2),
+			    RG_CSI2_S7_GRP_EN, 1);
+		break;
+	default:
+		return;
+	}
+}
+
+int mtk_cam_seninf_init_iomem(struct seninf_ctx *ctx, void __iomem *if_base,
+			      void __iomem *ana_base)
+{
+	u32 i;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_0] =
+	ctx->reg_ana_csi_rx[CSI_PORT_0A] = ana_base + 0;
+	ctx->reg_ana_csi_rx[CSI_PORT_0B] = ana_base + 0x1000;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_1] =
+	ctx->reg_ana_csi_rx[CSI_PORT_1A] = ana_base + 0x4000;
+	ctx->reg_ana_csi_rx[CSI_PORT_1B] = ana_base + 0x5000;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_2] =
+	ctx->reg_ana_csi_rx[CSI_PORT_2A] = ana_base + 0x8000;
+	ctx->reg_ana_csi_rx[CSI_PORT_2B] = ana_base + 0x9000;
+
+	ctx->reg_ana_csi_rx[CSI_PORT_3] =
+	ctx->reg_ana_csi_rx[CSI_PORT_3A] = ana_base + 0xc000;
+	ctx->reg_ana_csi_rx[CSI_PORT_3B] = ana_base + 0xd000;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_0A] =
+	ctx->reg_ana_dphy_top[CSI_PORT_0B] =
+	ctx->reg_ana_dphy_top[CSI_PORT_0] = ana_base + 0x2000;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_1A] =
+	ctx->reg_ana_dphy_top[CSI_PORT_1B] =
+	ctx->reg_ana_dphy_top[CSI_PORT_1] = ana_base + 0x6000;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_2A] =
+	ctx->reg_ana_dphy_top[CSI_PORT_2B] =
+	ctx->reg_ana_dphy_top[CSI_PORT_2] = ana_base + 0xa000;
+
+	ctx->reg_ana_dphy_top[CSI_PORT_3A] =
+	ctx->reg_ana_dphy_top[CSI_PORT_3B] =
+	ctx->reg_ana_dphy_top[CSI_PORT_3] = ana_base + 0xe000;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_0A] =
+	ctx->reg_ana_cphy_top[CSI_PORT_0B] =
+	ctx->reg_ana_cphy_top[CSI_PORT_0] = ana_base + 0x3000;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_1A] =
+	ctx->reg_ana_cphy_top[CSI_PORT_1B] =
+	ctx->reg_ana_cphy_top[CSI_PORT_1] = ana_base + 0x7000;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_2A] =
+	ctx->reg_ana_cphy_top[CSI_PORT_2B] =
+	ctx->reg_ana_cphy_top[CSI_PORT_2] = ana_base + 0xb000;
+
+	ctx->reg_ana_cphy_top[CSI_PORT_3A] =
+	ctx->reg_ana_cphy_top[CSI_PORT_3B] =
+	ctx->reg_ana_cphy_top[CSI_PORT_3] = ana_base + 0xf000;
+
+	ctx->reg_if_top = if_base;
+
+	for (i = SENINF_1; i < _seninf_cfg.seninf_num; i++) {
+		ctx->reg_if_ctrl[i] = if_base + 0x0200 + (0x1000 * i);
+		ctx->reg_if_tg[i] = if_base + 0x0F00 + (0x1000 * i);
+		ctx->reg_if_csi2[i] = if_base + 0x0a00 + (0x1000 * i);
+	}
+
+	for (i = SENINF_MUX1; i < _seninf_cfg.mux_num; i++)
+		ctx->reg_if_mux[i] = if_base + 0x0d00 + (0x1000 * i);
+
+	ctx->reg_if_cam_mux = if_base + 0x0400;
+
+	return 0;
+}
+
+int mtk_cam_seninf_init_port(struct seninf_ctx *ctx, int port)
+{
+	u32 port_num;
+
+	if (port >= CSI_PORT_0A)
+		port_num = (port - CSI_PORT_0) >> 1;
+	else
+		port_num = port;
+
+	ctx->port = port;
+	ctx->port_num = port_num;
+	ctx->port_a = CSI_PORT_0A + (port_num << 1);
+	ctx->port_b = ctx->port_a + 1;
+	ctx->is_4d1c = (port == port_num);
+
+	switch (port) {
+	case CSI_PORT_0:
+		ctx->seninf_idx = SENINF_1;
+		break;
+	case CSI_PORT_0A:
+		ctx->seninf_idx = SENINF_1;
+		break;
+	case CSI_PORT_0B:
+		ctx->seninf_idx = SENINF_2;
+		break;
+	case CSI_PORT_1:
+		ctx->seninf_idx = SENINF_3;
+		break;
+	case CSI_PORT_1A:
+		ctx->seninf_idx = SENINF_3;
+		break;
+	case CSI_PORT_1B:
+		ctx->seninf_idx = SENINF_4;
+		break;
+	case CSI_PORT_2:
+		ctx->seninf_idx = SENINF_5;
+		break;
+	case CSI_PORT_2A:
+		ctx->seninf_idx = SENINF_5;
+		break;
+	case CSI_PORT_2B:
+		ctx->seninf_idx = SENINF_6;
+		break;
+	case CSI_PORT_3:
+		ctx->seninf_idx = SENINF_7;
+		break;
+	case CSI_PORT_3A:
+		ctx->seninf_idx = SENINF_7;
+		break;
+	case CSI_PORT_3B:
+		ctx->seninf_idx = SENINF_8;
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid port %d\n", port);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_is_cammux_used(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 temp = SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN);
+
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	return !!(temp & (1 << cam_mux));
+}
+
+int mtk_cam_seninf_cammux(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 temp;
+
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	temp = SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN);
+	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_EN,
+			 temp | (1 << cam_mux));
+
+	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_STATUS,
+			 3 << (cam_mux * 2)); /* clr irq */
+
+	dev_dbg(ctx->dev, "cam_mux %d EN 0x%x IRQ_EN 0x%x IRQ_STATUS 0x%x\n",
+		cam_mux, SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN),
+		SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_EN),
+		SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_IRQ_STATUS));
+
+	return 0;
+}
+
+int mtk_cam_seninf_disable_cammux(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *base = ctx->reg_if_cam_mux;
+	u32 temp;
+
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	temp = SENINF_READ_REG(base, SENINF_CAM_MUX_EN);
+
+	if ((1 << cam_mux) & temp) {
+		SENINF_WRITE_REG(base, SENINF_CAM_MUX_EN,
+				 temp & (~(1 << cam_mux)));
+
+		dev_dbg(ctx->dev, "cammux %d EN %x IRQ_EN %x IRQ_STATUS %x",
+			cam_mux, SENINF_READ_REG(base, SENINF_CAM_MUX_EN),
+			SENINF_READ_REG(base, SENINF_CAM_MUX_IRQ_EN),
+			SENINF_READ_REG(base, SENINF_CAM_MUX_IRQ_STATUS));
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_disable_all_cammux(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	SENINF_WRITE_REG(seninf_cam_mux, SENINF_CAM_MUX_EN, 0);
+
+	dev_dbg(ctx->dev, "%s all cam_mux EN 0x%x\n", __func__,
+		SENINF_READ_REG(seninf_cam_mux, SENINF_CAM_MUX_EN));
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx,
+				    int seninf_src)
+{
+	void __iomem *seninf = ctx->reg_if_top;
+
+	switch (mux_idx) {
+	case SENINF_MUX1:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX1_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX2:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX2_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX3:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX3_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX4:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+			    RG_SENINF_MUX4_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX5:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX5_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX6:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX6_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX7:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX7_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX8:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+			    RG_SENINF_MUX8_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX9:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX9_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX10:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX10_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX11:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX11_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX12:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+			    RG_SENINF_MUX12_SRC_SEL, seninf_src);
+		break;
+	case SENINF_MUX13:
+		SENINF_BITS(seninf, SENINF_TOP_MUX_CTRL_3,
+			    RG_SENINF_MUX13_SRC_SEL, seninf_src);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid mux_idx %d\n", mux_idx);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_get_top_mux_ctrl(struct seninf_ctx *ctx, int mux_idx)
+{
+	void __iomem *seninf = ctx->reg_if_top;
+	u32 seninf_src = 0;
+
+	switch (mux_idx) {
+	case SENINF_MUX1:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX1_SRC_SEL);
+		break;
+	case SENINF_MUX2:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX2_SRC_SEL);
+		break;
+	case SENINF_MUX3:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX3_SRC_SEL);
+		break;
+	case SENINF_MUX4:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_0,
+					      RG_SENINF_MUX4_SRC_SEL);
+		break;
+	case SENINF_MUX5:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX5_SRC_SEL);
+		break;
+	case SENINF_MUX6:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX6_SRC_SEL);
+		break;
+	case SENINF_MUX7:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX7_SRC_SEL);
+		break;
+	case SENINF_MUX8:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_1,
+					      RG_SENINF_MUX8_SRC_SEL);
+		break;
+	case SENINF_MUX9:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX9_SRC_SEL);
+		break;
+	case SENINF_MUX10:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX10_SRC_SEL);
+		break;
+	case SENINF_MUX11:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX11_SRC_SEL);
+		break;
+	case SENINF_MUX12:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_2,
+					      RG_SENINF_MUX12_SRC_SEL);
+		break;
+	case SENINF_MUX13:
+		seninf_src = SENINF_READ_BITS(seninf, SENINF_TOP_MUX_CTRL_3,
+					      RG_SENINF_MUX13_SRC_SEL);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid mux_idx %d", mux_idx);
+		return -EINVAL;
+	}
+
+	return seninf_src;
+}
+
+int mtk_cam_seninf_get_cammux_ctrl(struct seninf_ctx *ctx, int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 seninf_mux_src = 0;
+
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	switch (cam_mux) {
+	case SENINF_CAM_MUX0:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX0_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX1:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX1_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX2:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX2_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX3:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_0,
+						  RG_SENINF_CAM_MUX3_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX4:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX4_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX5:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX5_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX6:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX6_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX7:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_1,
+						  RG_SENINF_CAM_MUX7_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX8:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX8_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX9:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX9_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX10:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX10_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX11:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_2,
+						  RG_SENINF_CAM_MUX11_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX12:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX12_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX13:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX13_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX14:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX14_SRC_SEL);
+		break;
+	case SENINF_CAM_MUX15:
+		seninf_mux_src = SENINF_READ_BITS(seninf_cam_mux,
+						  SENINF_CAM_MUX_CTRL_3,
+						  RG_SENINF_CAM_MUX15_SRC_SEL);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid cam_mux %d", cam_mux);
+		return -EINVAL;
+	}
+
+	return seninf_mux_src;
+}
+
+u32 mtk_cam_seninf_get_cammux_res(struct seninf_ctx *ctx, int cam_mux)
+{
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	return SENINF_READ_REG(ctx->reg_if_cam_mux,
+			       SENINF_CAM_MUX0_CHK_RES + (0x10 * cam_mux));
+}
+
+static u32 mtk_cam_seninf_get_cammux_exp(struct seninf_ctx *ctx, int cam_mux)
+{
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	return SENINF_READ_REG(ctx->reg_if_cam_mux,
+			       SENINF_CAM_MUX0_CHK_CTL_1 + (0x10 * cam_mux));
+}
+
+int mtk_cam_seninf_set_cammux_vc(struct seninf_ctx *ctx, int cam_mux,
+				 int vc_sel, int dt_sel, int vc_en,
+				 int dt_en)
+{
+	void __iomem *seninf_cam_mux_vc_addr =
+		ctx->reg_if_cam_mux + (cam_mux << 0x2);
+
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_VC_SEL, vc_sel);
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_DT_SEL, dt_sel);
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_VC_EN, vc_en);
+	SENINF_BITS(seninf_cam_mux_vc_addr, SENINF_CAM_MUX0_OPT,
+		    RG_SENINF_CAM_MUX0_DT_EN, dt_en);
+
+	return 0;
+}
+
+int mtk_cam_seninf_switch_to_cammux_inner_page(struct seninf_ctx *ctx,
+					       bool inner)
+{
+	void __iomem *seninf_cam_mux_addr = ctx->reg_if_cam_mux;
+
+	SENINF_BITS(seninf_cam_mux_addr, SENINF_CAM_MUX_DYN_CTRL,
+		    CAM_MUX_DYN_PAGE_SEL, inner ? 0 : 1);
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_cammux_next_ctrl(struct seninf_ctx *ctx, int src,
+					int target)
+{
+	void __iomem *seninf_cam_mux_base = ctx->reg_if_cam_mux;
+
+	if (target >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, target, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	switch (target) {
+	case SENINF_CAM_MUX0:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX0_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX1:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX1_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX2:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX2_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX3:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_0,
+			    CAM_MUX3_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX4:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX4_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX5:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX5_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX6:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX6_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX7:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_1,
+			    CAM_MUX7_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX8:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX8_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX9:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX9_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX10:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX10_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX11:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_2,
+			    CAM_MUX11_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX12:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX12_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX13:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX13_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX14:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX14_NEXT_SRC_SEL, src);
+		break;
+	case SENINF_CAM_MUX15:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_NEXT_CTRL_3,
+			    CAM_MUX15_NEXT_SRC_SEL, src);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid src %d target %d", src, target);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_cammux_src(struct seninf_ctx *ctx, int src,
+				  int target, int exp_hsize, int exp_vsize)
+{
+	void __iomem *seninf_cam_mux_base = ctx->reg_if_cam_mux;
+
+	if (target >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, target, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	switch (target) {
+	case SENINF_CAM_MUX0:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_0,
+			    RG_SENINF_CAM_MUX0_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX0_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX0_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX0_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX0_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX1:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_0,
+			    RG_SENINF_CAM_MUX1_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX1_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX1_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX1_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX1_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX2:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_0,
+			    RG_SENINF_CAM_MUX2_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX2_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX2_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX2_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX2_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX3:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_0,
+			    RG_SENINF_CAM_MUX3_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX3_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX3_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX3_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX3_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX4:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_1,
+			    RG_SENINF_CAM_MUX4_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX4_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX4_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX4_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX4_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX5:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_1,
+			    RG_SENINF_CAM_MUX5_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX5_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX5_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX5_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX5_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX6:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_1,
+			    RG_SENINF_CAM_MUX6_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX6_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX6_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX6_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX6_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX7:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_1,
+			    RG_SENINF_CAM_MUX7_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX7_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX7_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX7_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX7_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX8:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_2,
+			    RG_SENINF_CAM_MUX8_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX8_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX8_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX8_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX8_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX9:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_2,
+			    RG_SENINF_CAM_MUX9_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX9_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX9_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX9_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX9_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX10:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_2,
+			    RG_SENINF_CAM_MUX10_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX10_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX10_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX10_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX10_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX11:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_2,
+			    RG_SENINF_CAM_MUX11_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX11_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX11_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX11_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX11_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX12:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_3,
+			    RG_SENINF_CAM_MUX12_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX12_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX12_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX12_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX12_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX13:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_3,
+			    RG_SENINF_CAM_MUX13_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX13_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX13_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX13_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX13_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX14:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_3,
+			    RG_SENINF_CAM_MUX14_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX14_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX14_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX14_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX14_EXP_VSIZE, exp_vsize);
+		break;
+	case SENINF_CAM_MUX15:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX_CTRL_3,
+			    RG_SENINF_CAM_MUX15_SRC_SEL, src);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX15_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX15_EXP_HSIZE, exp_hsize);
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX15_CHK_CTL_1,
+			    RG_SENINF_CAM_MUX15_EXP_VSIZE, exp_vsize);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid src %d target %d", src, target);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_vc(struct seninf_ctx *ctx, u32 seninf_idx,
+			  struct seninf_vcinfo *vcinfo)
+{
+	void __iomem *seninf_csi2 = ctx->reg_if_csi2[seninf_idx];
+	int i;
+	struct seninf_vc *vc;
+
+	if (!vcinfo || !vcinfo->cnt)
+		return 0;
+
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S0_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S1_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S2_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S3_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S4_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S5_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S6_DI_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_S7_DI_CTRL, 0);
+
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH0_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH1_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH2_CTRL, 0);
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_CH3_CTRL, 0);
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		vc = &vcinfo->vc[i];
+
+		/* General Long Packet Data Types: 0x10-0x17 */
+		if (vc->dt >= 0x10 && vc->dt <= 0x17) {
+			SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT,
+				    RG_CSI2_GENERIC_LONG_PACKET_EN, 1);
+		}
+
+		mtk_cam_seninf_set_di_ch_ctrl(seninf_csi2, i, vc);
+	}
+
+	dev_dbg(ctx->dev, "DI_CTRL 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x 0x%x\n",
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S0_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S1_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S2_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S3_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S4_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S5_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S6_DI_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_S7_DI_CTRL));
+
+	dev_dbg(ctx->dev, "CH_CTRL 0x%x 0x%x 0x%x 0x%x\n",
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH0_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH1_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH2_CTRL),
+		SENINF_READ_REG(seninf_csi2, SENINF_CSI2_CH3_CTRL));
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_mux_ctrl(struct seninf_ctx *ctx, u32 mux, int hs_pol,
+				int vs_pol, int src_sel, int pixel_mode)
+{
+	u32 temp = 0;
+	void __iomem *seninf_mux;
+
+	seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_SRC_SEL, src_sel);
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_PIX_MODE_SEL, pixel_mode);
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_OPT,
+		    RG_SENINF_MUX_HSYNC_POL, hs_pol);
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_OPT,
+		    RG_SENINF_MUX_VSYNC_POL, vs_pol);
+
+	temp = SENINF_READ_REG(seninf_mux, SENINF_MUX_CTRL_0);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp |
+			 SENINF_MUX_IRQ_SW_RST_MASK | SENINF_MUX_SW_RST_MASK);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp & 0xFFFFFFF9);
+
+	return 0;
+}
+
+int mtk_cam_seninf_update_mux_pixel_mode(struct seninf_ctx *ctx, u32 mux,
+					 int pixel_mode)
+{
+	u32 temp = 0;
+	void __iomem *seninf_mux;
+
+	seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_PIX_MODE_SEL, pixel_mode);
+
+	temp = SENINF_READ_REG(seninf_mux, SENINF_MUX_CTRL_0);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp |
+			 SENINF_MUX_IRQ_SW_RST_MASK | SENINF_MUX_SW_RST_MASK);
+	SENINF_WRITE_REG(seninf_mux, SENINF_MUX_CTRL_0, temp & 0xFFFFFFF9);
+
+	dev_dbg(ctx->dev,
+		"%s mux %d SENINF_MUX_CTRL_1(0x%x), SENINF_MUX_OPT(0x%x)",
+		__func__, mux, SENINF_READ_REG(seninf_mux, SENINF_MUX_CTRL_1),
+		SENINF_READ_REG(seninf_mux, SENINF_MUX_OPT));
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_mux_crop(struct seninf_ctx *ctx, u32 mux, int start_x,
+				int end_x, int enable)
+{
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CROP_PIX_CTRL,
+		    RG_SENINF_MUX_CROP_START_8PIX_CNT, start_x / 8);
+	SENINF_BITS(seninf_mux, SENINF_MUX_CROP_PIX_CTRL,
+		    RG_SENINF_MUX_CROP_END_8PIX_CNT,
+		    start_x / 8 + (end_x - start_x + 1) / 8 - 1 +
+			    (((end_x - start_x + 1) % 8) > 0 ? 1 : 0));
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_1,
+		    RG_SENINF_MUX_CROP_EN, enable);
+
+	dev_dbg(ctx->dev, "MUX_CROP_PIX_CTRL 0x%x MUX_CTRL_1 0x%x\n",
+		SENINF_READ_REG(seninf_mux, SENINF_MUX_CROP_PIX_CTRL),
+		SENINF_READ_REG(seninf_mux, SENINF_MUX_CTRL_1));
+
+	dev_dbg(ctx->dev, "mux %d, start %d, end %d, enable %d\n",
+		mux, start_x, end_x, enable);
+
+	return 0;
+}
+
+int mtk_cam_seninf_is_mux_used(struct seninf_ctx *ctx, u32 mux)
+{
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	return SENINF_READ_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN);
+}
+
+int mtk_cam_seninf_mux(struct seninf_ctx *ctx, u32 mux)
+{
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN, 1);
+	return 0;
+}
+
+int mtk_cam_seninf_disable_mux(struct seninf_ctx *ctx, u32 mux)
+{
+	int i;
+	void __iomem *seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN, 0);
+
+	/* also disable CAM_MUX with input from mux */
+	for (i = SENINF_CAM_MUX0; i < _seninf_cfg.cam_mux_num; i++) {
+		if (mux == mtk_cam_seninf_get_cammux_ctrl(ctx, i))
+			mtk_cam_seninf_disable_cammux(ctx, i);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_disable_all_mux(struct seninf_ctx *ctx)
+{
+	int i;
+	void __iomem *seninf_mux;
+
+	for (i = 0; i < _seninf_cfg.mux_num; i++) {
+		seninf_mux = ctx->reg_if_mux[i];
+		SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0, SENINF_MUX_EN, 0);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_cammux_chk_pixel_mode(struct seninf_ctx *ctx,
+					     int cam_mux, int pixel_mode)
+{
+	void __iomem *seninf_cam_mux_base = ctx->reg_if_cam_mux;
+
+	if (cam_mux >= _seninf_cfg.cam_mux_num) {
+		dev_dbg(ctx->dev,
+			"%s err cam_mux %d >= SENINF_CAM_MUX_NUM %d\n",
+			__func__, cam_mux, _seninf_cfg.cam_mux_num);
+
+		return 0;
+	}
+
+	switch (cam_mux) {
+	case SENINF_CAM_MUX0:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX0_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX0_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX1:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX1_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX1_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX2:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX2_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX2_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX3:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX3_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX3_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX4:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX4_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX4_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX5:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX5_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX5_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX6:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX6_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX6_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX7:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX7_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX7_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX8:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX8_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX8_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX9:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX9_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX9_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX10:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX10_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX10_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX11:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX11_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX11_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX12:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX12_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX12_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX13:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX13_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX13_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX14:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX14_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX14_PIX_MODE_SEL, pixel_mode);
+		break;
+	case SENINF_CAM_MUX15:
+		SENINF_BITS(seninf_cam_mux_base, SENINF_CAM_MUX15_CHK_CTL_0,
+			    RG_SENINF_CAM_MUX15_PIX_MODE_SEL, pixel_mode);
+		break;
+	default:
+		dev_dbg(ctx->dev, "invalid cam_mux %d pixel_mode %d\n",
+			cam_mux, pixel_mode);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_test_model(struct seninf_ctx *ctx, int mux, int cam_mux,
+				  int pixel_mode)
+{
+	int intf;
+	void __iomem *seninf;
+	void __iomem *seninf_tg;
+
+	intf = mux % 5; /* testmdl by platform seninf */
+
+	seninf = ctx->reg_if_ctrl[intf];
+	seninf_tg = ctx->reg_if_tg[intf];
+
+	mtk_cam_seninf_reset(ctx, intf);
+	mtk_cam_seninf_mux(ctx, mux);
+	mtk_cam_seninf_set_mux_ctrl(ctx, mux, 0, 0, TEST_MODEL, pixel_mode);
+	mtk_cam_seninf_set_top_mux_ctrl(ctx, mux, intf);
+
+	mtk_cam_seninf_set_cammux_vc(ctx, cam_mux, 0, 0, 0, 0);
+	mtk_cam_seninf_set_cammux_src(ctx, mux, cam_mux, 0, 0);
+	mtk_cam_seninf_set_cammux_chk_pixel_mode(ctx, cam_mux, pixel_mode);
+	mtk_cam_seninf_cammux(ctx, cam_mux);
+
+	SENINF_BITS(seninf, SENINF_TESTMDL_CTRL, RG_SENINF_TESTMDL_EN, 1);
+	SENINF_BITS(seninf, SENINF_CTRL, SENINF_EN, 1);
+
+	SENINF_BITS(seninf_tg, TM_SIZE, TM_LINE, 4224);
+	SENINF_BITS(seninf_tg, TM_SIZE, TM_PXL, 5632);
+	SENINF_BITS(seninf_tg, TM_CLK, TM_CLK_CNT, 7);
+
+	SENINF_BITS(seninf_tg, TM_DUM, TM_VSYNC, 100);
+	SENINF_BITS(seninf_tg, TM_DUM, TM_DUMMYPXL, 100);
+
+	SENINF_BITS(seninf_tg, TM_CTL, TM_PAT, 0xC);
+	SENINF_BITS(seninf_tg, TM_CTL, TM_EN, 1);
+
+	return 0;
+}
+
+static int csirx_phyA_power_on(struct seninf_ctx *ctx, u32 port_idx, int en)
+{
+	void __iomem *base = ctx->reg_ana_csi_rx[port_idx];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L0_T0AB_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L1_T1AB_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_L2_T1BC_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0BC_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T0CA_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_8, RG_CSI0_XX_T1CA_EQ_OS_CAL_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_LPF_EN, 0);
+	SENINF_BITS(base, CDPHY_RX_ANA_0, RG_CSI0_BG_CORE_EN, 0);
+	usleep_range(200, 300);
+
+	if (en) {
+		SENINF_BITS(base, CDPHY_RX_ANA_0,
+			    RG_CSI0_BG_CORE_EN, 1);
+		usleep_range(30, 40);
+		SENINF_BITS(base, CDPHY_RX_ANA_0,
+			    RG_CSI0_BG_LPF_EN, 1);
+		udelay(1);
+		SENINF_BITS(base, CDPHY_RX_ANA_8,
+			    RG_CSI0_L0_T0AB_EQ_OS_CAL_EN, 1);
+		SENINF_BITS(base, CDPHY_RX_ANA_8,
+			    RG_CSI0_L1_T1AB_EQ_OS_CAL_EN, 1);
+		SENINF_BITS(base, CDPHY_RX_ANA_8,
+			    RG_CSI0_L2_T1BC_EQ_OS_CAL_EN, 1);
+		SENINF_BITS(base, CDPHY_RX_ANA_8,
+			    RG_CSI0_XX_T0BC_EQ_OS_CAL_EN, 1);
+		SENINF_BITS(base, CDPHY_RX_ANA_8,
+			    RG_CSI0_XX_T0CA_EQ_OS_CAL_EN, 1);
+		SENINF_BITS(base, CDPHY_RX_ANA_8,
+			    RG_CSI0_XX_T1CA_EQ_OS_CAL_EN, 1);
+		udelay(1);
+	}
+
+	return 0;
+}
+
+static int apply_efuse_data(struct seninf_ctx *ctx)
+{
+	int ret = 0;
+	void __iomem *base;
+	u32 port;
+	u32 m_csi_efuse = ctx->m_csi_efuse;
+
+	if (m_csi_efuse == 0) {
+		dev_dbg(ctx->dev, "No efuse data. Returned.\n");
+		return -1;
+	}
+
+	port = ctx->port;
+	base = ctx->reg_ana_csi_rx[port];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0P_T0A_HSRT_CODE,
+		    (m_csi_efuse >> 27) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0N_T0B_HSRT_CODE,
+		    (m_csi_efuse >> 27) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1P_T0C_HSRT_CODE,
+		    (m_csi_efuse >> 22) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1N_T1A_HSRT_CODE,
+		    (m_csi_efuse >> 22) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2P_T1B_HSRT_CODE,
+		    (m_csi_efuse >> 17) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2N_T1C_HSRT_CODE,
+		    (m_csi_efuse >> 17) & 0x1f);
+
+	dev_dbg(ctx->dev,
+		"CSI%dA CDPHY_RX_ANA_2(0x%x) CDPHY_RX_ANA_3(0x%x) CDPHY_RX_ANA_4(0x%x)",
+		ctx->port,
+		SENINF_READ_REG(base, CDPHY_RX_ANA_2),
+		SENINF_READ_REG(base, CDPHY_RX_ANA_3),
+		SENINF_READ_REG(base, CDPHY_RX_ANA_4));
+
+	if (ctx->is_4d1c == 0)
+		return ret;
+
+	port = ctx->port_b;
+	base = ctx->reg_ana_csi_rx[port];
+
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0P_T0A_HSRT_CODE,
+		    (m_csi_efuse >> 12) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_2, RG_CSI0_L0N_T0B_HSRT_CODE,
+		    (m_csi_efuse >> 12) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1P_T0C_HSRT_CODE,
+		    (m_csi_efuse >> 7) & 0x1f);
+	SENINF_BITS(base, CDPHY_RX_ANA_3, RG_CSI0_L1N_T1A_HSRT_CODE,
+		    (m_csi_efuse >> 7) & 0x1f);
+
+	if (port < CSI_PORT_2A) {
+		SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2P_T1B_HSRT_CODE,
+			    (m_csi_efuse >> 2) & 0x1f);
+		SENINF_BITS(base, CDPHY_RX_ANA_4, RG_CSI0_L2N_T1C_HSRT_CODE,
+			    (m_csi_efuse >> 2) & 0x1f);
+		dev_dbg(ctx->dev,
+			"CSI%dB CDPHY_RX_ANA_2(0x%x) CDPHY_RX_ANA_3(0x%x) CDPHY_RX_ANA_4(0x%x)",
+			ctx->port,
+			SENINF_READ_REG(base, CDPHY_RX_ANA_2),
+			SENINF_READ_REG(base, CDPHY_RX_ANA_3),
+			SENINF_READ_REG(base, CDPHY_RX_ANA_4));
+	} else {
+		dev_dbg(ctx->dev,
+			"CSI%dB CDPHY_RX_ANA_2(0x%x) CDPHY_RX_ANA_3(0x%x)",
+			ctx->port,
+			SENINF_READ_REG(base, CDPHY_RX_ANA_2),
+			SENINF_READ_REG(base, CDPHY_RX_ANA_3));
+	}
+
+	return ret;
+}
+
+static int csirx_phyA_init(struct seninf_ctx *ctx)
+{
+	u32 i, port;
+	void __iomem *base;
+
+	port = ctx->port;
+	for (i = 0; i <= ctx->is_4d1c; i++) {
+		port = i ? ctx->port_b : ctx->port;
+		base = ctx->reg_ana_csi_rx[port];
+		SENINF_BITS(base, CDPHY_RX_ANA_1,
+			    RG_CSI0_BG_LPRX_VTL_SEL, 0x4);
+		SENINF_BITS(base, CDPHY_RX_ANA_1,
+			    RG_CSI0_BG_LPRX_VTH_SEL, 0x4);
+		SENINF_BITS(base, CDPHY_RX_ANA_2,
+			    RG_CSI0_BG_ALP_RX_VTL_SEL, 0x4);
+		SENINF_BITS(base, CDPHY_RX_ANA_2,
+			    RG_CSI0_BG_ALP_RX_VTH_SEL, 0x4);
+		SENINF_BITS(base, CDPHY_RX_ANA_1,
+			    RG_CSI0_BG_VREF_SEL, 0x8);
+		SENINF_BITS(base, CDPHY_RX_ANA_1,
+			    RG_CSI0_CDPHY_EQ_DES_VREF_SEL, 0x2);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_BW, 0x3);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_IS, 0x1);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_SR0, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_5,
+			    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_9,
+			    RG_CSI0_RESERVE, 0x3003);
+		SENINF_BITS(base, CDPHY_RX_ANA_SETTING_0,
+			    CSR_CSI_RST_MODE, 0x2);
+
+		SENINF_BITS(base, CDPHY_RX_ANA_2,
+			    RG_CSI0_L0P_T0A_HSRT_CODE, 0x10);
+		SENINF_BITS(base, CDPHY_RX_ANA_2,
+			    RG_CSI0_L0N_T0B_HSRT_CODE, 0x10);
+		SENINF_BITS(base, CDPHY_RX_ANA_3,
+			    RG_CSI0_L1P_T0C_HSRT_CODE, 0x10);
+		SENINF_BITS(base, CDPHY_RX_ANA_3,
+			    RG_CSI0_L1N_T1A_HSRT_CODE, 0x10);
+		SENINF_BITS(base, CDPHY_RX_ANA_4,
+			    RG_CSI0_L2P_T1B_HSRT_CODE, 0x10);
+		SENINF_BITS(base, CDPHY_RX_ANA_4,
+			    RG_CSI0_L2N_T1C_HSRT_CODE, 0x10);
+		SENINF_BITS(base, CDPHY_RX_ANA_0,
+			    RG_CSI0_CPHY_T0_CDR_FIRST_EDGE_EN, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_0,
+			    RG_CSI0_CPHY_T1_CDR_FIRST_EDGE_EN, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_2,
+			    RG_CSI0_CPHY_T0_CDR_SELF_CAL_EN, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_2,
+			    RG_CSI0_CPHY_T1_CDR_SELF_CAL_EN, 0x0);
+
+		SENINF_BITS(base, CDPHY_RX_ANA_6,
+			    RG_CSI0_CPHY_T0_CDR_CK_DELAY, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_7,
+			    RG_CSI0_CPHY_T1_CDR_CK_DELAY, 0x0);
+		SENINF_BITS(base, CDPHY_RX_ANA_6,
+			    RG_CSI0_CPHY_T0_CDR_AB_WIDTH, 0x9);
+		SENINF_BITS(base, CDPHY_RX_ANA_6,
+			    RG_CSI0_CPHY_T0_CDR_BC_WIDTH, 0x9);
+		SENINF_BITS(base, CDPHY_RX_ANA_6,
+			    RG_CSI0_CPHY_T0_CDR_CA_WIDTH, 0x9);
+		SENINF_BITS(base, CDPHY_RX_ANA_7,
+			    RG_CSI0_CPHY_T1_CDR_AB_WIDTH, 0x9);
+		SENINF_BITS(base, CDPHY_RX_ANA_7,
+			    RG_CSI0_CPHY_T1_CDR_BC_WIDTH, 0x9);
+		SENINF_BITS(base, CDPHY_RX_ANA_7,
+			    RG_CSI0_CPHY_T1_CDR_CA_WIDTH, 0x9);
+
+		dev_dbg(ctx->dev, "port:%d CDPHY_RX_ANA_0(0x%x)\n",
+			port, SENINF_READ_REG(base, CDPHY_RX_ANA_0));
+	}
+
+	apply_efuse_data(ctx);
+
+	return 0;
+}
+
+static int csirx_dphy_init(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
+	int settle_delay_dt, settle_delay_ck, hs_trail, hs_trail_en;
+	int bit_per_pixel;
+	u64 data_rate;
+
+	settle_delay_dt = ctx->is_cphy ? ctx->core->cphy_settle_delay_dt :
+					 ctx->core->dphy_settle_delay_dt;
+
+	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+		    RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+		    RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+		    RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+		    RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER,
+		    settle_delay_dt);
+
+	settle_delay_ck = ctx->core->settle_delay_ck;
+
+	SENINF_BITS(base, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
+		    RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER,
+		    settle_delay_ck);
+	SENINF_BITS(base, DPHY_RX_CLOCK_LANE1_HS_PARAMETER,
+		    RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER,
+		    settle_delay_ck);
+
+	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+		    RG_CDPHY_RX_LD0_TRIO0_HS_PREPARE_PARAMETER, 2);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+		    RG_CDPHY_RX_LD1_TRIO1_HS_PREPARE_PARAMETER, 2);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+		    RG_CDPHY_RX_LD2_TRIO2_HS_PREPARE_PARAMETER, 2);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+		    RG_CDPHY_RX_LD3_TRIO3_HS_PREPARE_PARAMETER, 2);
+
+	hs_trail = ctx->hs_trail_parameter;
+
+	SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+		    RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER, hs_trail);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+		    RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER, hs_trail);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+		    RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER, hs_trail);
+	SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+		    RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER, hs_trail);
+
+	if (!ctx->is_cphy) {
+		bit_per_pixel = 10;
+		if (ctx->customized_pixel_rate != 0)
+			data_rate = ctx->customized_pixel_rate * bit_per_pixel;
+		else
+			data_rate = ctx->mipi_pixel_rate * bit_per_pixel;
+
+		do_div(data_rate, ctx->num_data_lanes);
+		hs_trail_en = data_rate < 1400000000;
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LD0_HS_TRAIL_EN, hs_trail_en);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LD1_HS_TRAIL_EN, hs_trail_en);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_DPHY_RX_LD2_HS_TRAIL_EN, hs_trail_en);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_DPHY_RX_LD3_HS_TRAIL_EN, hs_trail_en);
+	}
+
+	return 0;
+}
+
+static int csirx_cphy_init(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_cphy_top[ctx->port];
+
+	SENINF_BITS(base, CPHY_RX_DETECT_CTRL_POST,
+		    RG_CPHY_RX_DATA_VALID_POST_EN, 1);
+
+	return 0;
+}
+
+static int csirx_phy_init(struct seninf_ctx *ctx)
+{
+	csirx_phyA_init(ctx);
+
+	csirx_dphy_init(ctx);
+	csirx_cphy_init(ctx);
+
+	return 0;
+}
+
+static int csirx_seninf_csi2_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+	int csi_en;
+
+	SENINF_BITS(seninf_csi2, SENINF_CSI2_DBG_CTRL,
+		    RG_CSI2_DBG_PACKET_CNT_EN, 1);
+
+	/* lane/trio count */
+	SENINF_BITS(seninf_csi2, SENINF_CSI2_RESYNC_MERGE_CTRL,
+		    RG_CSI2_RESYNC_CYCLE_CNT_OPT, 1);
+
+	csi_en = (1 << ctx->num_data_lanes) - 1;
+
+	if (!ctx->is_cphy) {
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT, RG_CSI2_CPHY_SEL, 0);
+		SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, csi_en);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+			    RG_CSI2_HEADER_MODE, 0);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+			    RG_CSI2_HEADER_LEN, 0);
+	} else {
+		u8 map_hdr_len[] = {0, 1, 2, 4, 5};
+
+		SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, csi_en);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_OPT,
+			    RG_CSI2_CPHY_SEL, 1);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+			    RG_CSI2_HEADER_MODE, 2);
+		SENINF_BITS(seninf_csi2, SENINF_CSI2_HDR_MODE_0,
+			    RG_CSI2_HEADER_LEN,
+			    map_hdr_len[ctx->num_data_lanes]);
+	}
+
+	return 0;
+}
+
+static int csirx_seninf_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf = ctx->reg_if_ctrl[ctx->seninf_idx];
+
+	/* enable/disable seninf csi2 */
+	SENINF_BITS(seninf, SENINF_CSI2_CTRL, RG_SENINF_CSI2_EN, 1);
+
+	/* enable/disable seninf, enable after csi2, testmdl is done */
+	SENINF_BITS(seninf, SENINF_CTRL, SENINF_EN, 1);
+
+	return 0;
+}
+
+static int csirx_seninf_top_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_top = ctx->reg_if_top;
+
+	switch (ctx->port) {
+	case CSI_PORT_0:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+			    RG_PHY_SENINF_MUX0_CPHY_MODE, 0);
+		break;
+	case CSI_PORT_0A:
+	case CSI_PORT_0B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+			    RG_PHY_SENINF_MUX0_CPHY_MODE, 2);
+		break;
+	case CSI_PORT_1:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+			    RG_PHY_SENINF_MUX1_CPHY_MODE, 0);
+		break;
+	case CSI_PORT_1A:
+	case CSI_PORT_1B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+			    RG_PHY_SENINF_MUX1_CPHY_MODE, 2);
+		break;
+	case CSI_PORT_2:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+			    RG_PHY_SENINF_MUX2_CPHY_MODE, 0);
+		break;
+	case CSI_PORT_2A:
+	case CSI_PORT_2B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+			    RG_PHY_SENINF_MUX2_CPHY_MODE, 2);
+		break;
+	case CSI_PORT_3:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+			    RG_PHY_SENINF_MUX3_CPHY_MODE, 0);
+		break;
+	case CSI_PORT_3A:
+	case CSI_PORT_3B:
+		SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+			    RG_PHY_SENINF_MUX3_CPHY_MODE, 2);
+		break;
+	default:
+		break;
+	}
+
+	/* port operation mode */
+	switch (ctx->port) {
+	case CSI_PORT_0:
+	case CSI_PORT_0A:
+	case CSI_PORT_0B:
+		if (!ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+				    PHY_SENINF_MUX0_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+				    PHY_SENINF_MUX0_DPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+				    PHY_SENINF_MUX0_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI0,
+				    PHY_SENINF_MUX0_CPHY_EN, 1);
+		}
+		break;
+	case CSI_PORT_1:
+	case CSI_PORT_1A:
+	case CSI_PORT_1B:
+		if (!ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+				    PHY_SENINF_MUX1_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+				    PHY_SENINF_MUX1_DPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+				    PHY_SENINF_MUX1_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI1,
+				    PHY_SENINF_MUX1_CPHY_EN, 1);
+		}
+		break;
+	case CSI_PORT_2:
+	case CSI_PORT_2A:
+	case CSI_PORT_2B:
+		if (!ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+				    PHY_SENINF_MUX2_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+				    PHY_SENINF_MUX2_DPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+				    PHY_SENINF_MUX2_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI2,
+				    PHY_SENINF_MUX2_CPHY_EN, 1);
+		}
+		break;
+	case CSI_PORT_3:
+	case CSI_PORT_3A:
+	case CSI_PORT_3B:
+		if (!ctx->is_cphy) {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+				    PHY_SENINF_MUX3_CPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+				    PHY_SENINF_MUX3_DPHY_EN, 1);
+		} else {
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+				    PHY_SENINF_MUX3_DPHY_EN, 0);
+			SENINF_BITS(seninf_top, SENINF_TOP_PHY_CTRL_CSI3,
+				    PHY_SENINF_MUX3_CPHY_EN, 1);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int csirx_phyA_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *base, *baseA, *baseB;
+
+	base = ctx->reg_ana_csi_rx[ctx->port];
+	baseA = ctx->reg_ana_csi_rx[ctx->port_a];
+	baseB = ctx->reg_ana_csi_rx[ctx->port_b];
+
+	if (!ctx->is_cphy) { /* dphy */
+		if (ctx->is_4d1c) {
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_CPHY_EN, 0);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_CPHY_EN, 0);
+			/* clear clk sel first */
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKSEL, 1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKSEL, 1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKSEL, 1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKSEL, 1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKSEL, 1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKSEL, 1);
+
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKMODE_EN, 1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_BW, 0x3);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_IS, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR0, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_BW, 0x3);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_IS, 0x1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR0, 0x1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+		} else {
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_CPHY_EN, 0);
+			/* clear clk sel first */
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKMODE_EN, 0);
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKSEL, 0);
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKSEL, 0);
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKSEL, 0);
+
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L0_CKMODE_EN, 0);
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L1_CKMODE_EN, 1);
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_DPHY_L2_CKMODE_EN, 0);
+
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_BW, 0x3);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_IS, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR0, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+		}
+	} else { /* cphy */
+		if (ctx->is_4d1c) {
+			SENINF_BITS(baseA, CDPHY_RX_ANA_0,
+				    RG_CSI0_CPHY_EN, 1);
+			SENINF_BITS(baseB, CDPHY_RX_ANA_0,
+				    RG_CSI0_CPHY_EN, 1);
+
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_BW, 0x3);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_IS, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR0, 0x3);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_BW, 0x3);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_IS, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR0, 0x3);
+			SENINF_BITS(baseA, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+		} else {
+			SENINF_BITS(base, CDPHY_RX_ANA_0,
+				    RG_CSI0_CPHY_EN, 1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_BW, 0x3);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_IS, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_LATCH_EN, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG0_EN, 0x1);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_DG1_EN, 0x0);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR0, 0x3);
+			SENINF_BITS(base, CDPHY_RX_ANA_5,
+				    RG_CSI0_CDPHY_EQ_SR1, 0x0);
+		}
+	}
+
+	/* phyA power on */
+	if (ctx->is_4d1c) {
+		csirx_phyA_power_on(ctx, ctx->port_a, 1);
+		csirx_phyA_power_on(ctx, ctx->port_b, 1);
+	} else {
+		csirx_phyA_power_on(ctx, ctx->port, 1);
+	}
+
+	return 0;
+}
+
+static int csirx_dphy_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
+
+	if (ctx->is_4d1c) {
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD3_SEL, 4);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD2_SEL, 0);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD1_SEL, 3);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD0_SEL, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC0_SEL, 2);
+
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD1_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD2_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD3_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC1_EN, 0);
+	} else {
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD3_SEL, 5);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD2_SEL, 3);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD1_SEL, 2);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LD0_SEL, 0);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC1_SEL, 4);
+		SENINF_BITS(base, DPHY_RX_LANE_SELECT, RG_DPHY_RX_LC0_SEL, 1);
+
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD1_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD2_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LD3_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC0_EN, 1);
+		SENINF_BITS(base, DPHY_RX_LANE_EN, DPHY_RX_LC1_EN, 1);
+	}
+
+	SENINF_BITS(base, DPHY_RX_LANE_SELECT, DPHY_RX_CK_DATA_MUX_EN, 1);
+
+	return 0;
+}
+
+static int csirx_cphy_setting(struct seninf_ctx *ctx)
+{
+	void __iomem *base = ctx->reg_ana_cphy_top[ctx->port];
+
+	switch (ctx->port) {
+	case CSI_PORT_0:
+	case CSI_PORT_1:
+	case CSI_PORT_2:
+	case CSI_PORT_3:
+	case CSI_PORT_0A:
+	case CSI_PORT_1A:
+	case CSI_PORT_2A:
+	case CSI_PORT_3A:
+		if (ctx->num_data_lanes == 3) {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR1_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR3_LPRX_EN, 0);
+		} else if (ctx->num_data_lanes == 2) {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR1_LPRX_EN, 1);
+		} else {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR0_LPRX_EN, 1);
+		}
+		break;
+	case CSI_PORT_0B:
+	case CSI_PORT_1B:
+	case CSI_PORT_2B:
+	case CSI_PORT_3B:
+		if (ctx->num_data_lanes == 2) {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR3_LPRX_EN, 1);
+		} else {
+			SENINF_BITS(base, CPHY_RX_CTRL, CPHY_RX_TR2_LPRX_EN, 1);
+		}
+		break;
+	default:
+		break;
+	}
+
+	return 0;
+}
+
+static int csirx_phy_setting(struct seninf_ctx *ctx)
+{
+	csirx_phyA_setting(ctx);
+
+	if (!ctx->is_cphy)
+		csirx_dphy_setting(ctx);
+	else
+		csirx_cphy_setting(ctx);
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_csi_mipi(struct seninf_ctx *ctx)
+{
+	csirx_phy_init(ctx);
+
+	/* seninf csi2 */
+	csirx_seninf_csi2_setting(ctx);
+
+	/* seninf */
+	csirx_seninf_setting(ctx);
+
+	/* seninf top */
+	csirx_seninf_top_setting(ctx);
+
+	/* phy */
+	csirx_phy_setting(ctx);
+
+	return 0;
+}
+
+int mtk_cam_seninf_poweroff(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_csi2;
+
+	seninf_csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+
+	SENINF_WRITE_REG(seninf_csi2, SENINF_CSI2_EN, 0x0);
+
+	if (ctx->is_4d1c) {
+		csirx_phyA_power_on(ctx, ctx->port_a, 0);
+		csirx_phyA_power_on(ctx, ctx->port_b, 0);
+	} else {
+		csirx_phyA_power_on(ctx, ctx->port, 0);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_reset(struct seninf_ctx *ctx, u32 seninf_idx)
+{
+	int i;
+	void __iomem *seninf_mux;
+	void __iomem *seninf = ctx->reg_if_ctrl[seninf_idx];
+
+	SENINF_BITS(seninf, SENINF_CSI2_CTRL, SENINF_CSI2_SW_RST, 1);
+	udelay(1);
+	SENINF_BITS(seninf, SENINF_CSI2_CTRL, SENINF_CSI2_SW_RST, 0);
+
+	dev_dbg(ctx->dev, "reset seninf %d\n", seninf_idx);
+
+	for (i = SENINF_MUX1; i < _seninf_cfg.mux_num; i++)
+		if (mtk_cam_seninf_get_top_mux_ctrl(ctx, i) == seninf_idx &&
+		    mtk_cam_seninf_is_mux_used(ctx, i)) {
+			seninf_mux = ctx->reg_if_mux[i];
+			SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0,
+				    SENINF_MUX_SW_RST, 1);
+			udelay(1);
+			SENINF_BITS(seninf_mux, SENINF_MUX_CTRL_0,
+				    SENINF_MUX_SW_RST, 0);
+			dev_dbg(ctx->dev, "reset mux %d\n", i);
+		}
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_idle(struct seninf_ctx *ctx)
+{
+	int i;
+	struct seninf_vcinfo *vcinfo = &ctx->vcinfo;
+	struct seninf_vc *vc;
+
+	for (i = 0; i < vcinfo->cnt; i++) {
+		vc = &vcinfo->vc[i];
+		if (vc->enable) {
+			mtk_cam_seninf_disable_mux(ctx, vc->mux);
+			mtk_cam_seninf_disable_cammux(ctx, vc->cam);
+			ctx->pad2cam[vc->out_pad] = 0xff;
+		}
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_get_mux_meter(struct seninf_ctx *ctx, u32 mux,
+				 struct mtk_cam_seninf_mux_meter *meter)
+{
+	void __iomem *seninf_mux;
+	s64 hv, hb, vv, vb, w, h;
+	u64 mipi_pixel_rate, vb_in_us, hb_in_us, line_time_in_us;
+	u32 res;
+
+	seninf_mux = ctx->reg_if_mux[mux];
+
+	SENINF_BITS(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_CTRL,
+		    RG_SENINF_MUX_FRAME_SIZE_MON_EN, 1);
+
+	hv = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_H_VALID);
+	hb = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_H_BLANK);
+	vv = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_V_VALID);
+	vb = SENINF_READ_REG(seninf_mux, SENINF_MUX_FRAME_SIZE_MON_V_BLANK);
+	res = SENINF_READ_REG(seninf_mux, SENINF_MUX_SIZE);
+
+	w = res & 0xffff;
+	h = res >> 16;
+
+	if (ctx->fps_n && ctx->fps_d) {
+		mipi_pixel_rate = w * ctx->fps_n * (vv + vb);
+		do_div(mipi_pixel_rate, ctx->fps_d);
+		do_div(mipi_pixel_rate, hv);
+
+		vb_in_us = vb * ctx->fps_d * 1000000;
+		do_div(vb_in_us, vv + vb);
+		do_div(vb_in_us, ctx->fps_n);
+
+		hb_in_us = hb * ctx->fps_d * 1000000;
+		do_div(hb_in_us, vv + vb);
+		do_div(hb_in_us, ctx->fps_n);
+
+		line_time_in_us = (hv + hb) * ctx->fps_d * 1000000;
+		do_div(line_time_in_us, vv + vb);
+		do_div(line_time_in_us, ctx->fps_n);
+
+		meter->mipi_pixel_rate = mipi_pixel_rate;
+		meter->vb_in_us = vb_in_us;
+		meter->hb_in_us = hb_in_us;
+		meter->line_time_in_us = line_time_in_us;
+	} else {
+		meter->mipi_pixel_rate = -1;
+		meter->vb_in_us = -1;
+		meter->hb_in_us = -1;
+		meter->line_time_in_us = -1;
+	}
+
+	meter->width = w;
+	meter->height = h;
+
+	meter->h_valid = hv;
+	meter->h_blank = hb;
+	meter->v_valid = vv;
+	meter->v_blank = vb;
+
+	return 0;
+}
+
+ssize_t mtk_cam_seninf_show_status(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	int i, len;
+	struct seninf_core *core;
+	struct seninf_ctx *ctx;
+	struct seninf_vc *vc;
+	struct media_link *link;
+	struct media_pad *pad;
+	struct mtk_cam_seninf_mux_meter meter;
+	void __iomem *csi2, *pmux;
+	void __iomem *rx, *pcammux;
+
+	core = dev_get_drvdata(dev);
+	len = 0;
+
+	mutex_lock(&core->mutex);
+
+	list_for_each_entry(ctx, &core->list, list) {
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\n[%s] port %d intf %d test %d cphy %d lanes %d\n",
+				ctx->subdev.name, ctx->port, ctx->seninf_idx,
+				ctx->is_test_model, ctx->is_cphy,
+				ctx->num_data_lanes);
+
+		pad = &ctx->pads[PAD_SINK];
+		list_for_each_entry(link, &pad->entity->links, list) {
+			if (link->sink == pad) {
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"source %s flags 0x%lx\n",
+						link->source->entity->name,
+						link->flags);
+			}
+		}
+
+		if (!ctx->streaming)
+			continue;
+
+		csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+		rx = ctx->reg_ana_dphy_top[ctx->port];
+
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"csi2 irq_stat 0x%08x\n",
+				SENINF_READ_REG(csi2, SENINF_CSI2_IRQ_STATUS));
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"csi2 line_frame_num 0x%08x\n",
+				SENINF_READ_REG(csi2, SENINF_CSI2_LINE_FRAME_NUM));
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"csi2 packet_status 0x%08x\n",
+				SENINF_READ_REG(csi2, SENINF_CSI2_PACKET_STATUS));
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"csi2 packet_cnt_status 0x%08x\n",
+				SENINF_READ_REG(csi2, SENINF_CSI2_PACKET_CNT_STATUS));
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"rx-ana settle ck 0x%02x dt 0x%02x\n",
+				SENINF_READ_BITS(rx, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
+						 RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER),
+				SENINF_READ_BITS(rx,
+						 DPHY_RX_DATA_LANE0_HS_PARAMETER,
+						 RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER));
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"rx-ana trail en %u param 0x%02x\n",
+				SENINF_READ_BITS(rx, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+						 RG_DPHY_RX_LD0_HS_TRAIL_EN),
+				SENINF_READ_BITS(rx, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+						 RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER));
+
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"data_not_enough_cnt : <%d>",
+				ctx->data_not_enough_cnt);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"err_lane_resync_cnt : <%d>",
+				ctx->err_lane_resync_cnt);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"crc_err_cnt : <%d>", ctx->crc_err_flag);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"ecc_err_double_cnt : <%d>",
+				ctx->ecc_err_double_cnt);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"ecc_err_corrected_cnt : <%d>\n",
+				ctx->ecc_err_corrected_cnt);
+
+		for (i = 0; i < ctx->vcinfo.cnt; i++) {
+			vc = &ctx->vcinfo.vc[i];
+			pmux = ctx->reg_if_mux[vc->mux];
+			pcammux = ctx->reg_if_cam_mux;
+
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"[%d] vc 0x%x dt 0x%x mux %d cam %d\n",
+					i, vc->vc, vc->dt, vc->mux, vc->cam);
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"\tmux[%d] en %d src %d irq_stat 0x%x\n",
+					vc->mux,
+					mtk_cam_seninf_is_mux_used(ctx, vc->mux),
+					mtk_cam_seninf_get_top_mux_ctrl(ctx, vc->mux),
+					SENINF_READ_REG(pmux, SENINF_MUX_IRQ_STATUS));
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"\t\tfifo_overrun_cnt : <%d>\n",
+					ctx->fifo_overrun_cnt);
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"\tcam[%d] en %d src %d exp 0x%x res 0x%x irq_stat 0x%x\n",
+					vc->cam,
+					mtk_cam_seninf_is_cammux_used(ctx, vc->cam),
+					mtk_cam_seninf_get_cammux_ctrl(ctx, vc->cam),
+					mtk_cam_seninf_get_cammux_exp(ctx, vc->cam),
+					mtk_cam_seninf_get_cammux_res(ctx, vc->cam),
+					SENINF_READ_REG(pcammux,
+							SENINF_CAM_MUX_IRQ_STATUS));
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"\t\tsize_err_cnt : <%d>\n",
+					ctx->size_err_cnt);
+
+			if (vc->feature == VC_RAW_DATA ||
+			    vc->feature == VC_STAGGER_NE ||
+			    vc->feature == VC_STAGGER_ME ||
+			    vc->feature == VC_STAGGER_SE) {
+				mtk_cam_seninf_get_mux_meter(ctx, vc->mux,
+							     &meter);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\t--- mux meter ---\n");
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\twidth %d height %d\n",
+						meter.width, meter.height);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\th_valid %d, h_blank %d\n",
+						meter.h_valid, meter.h_blank);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\tv_valid %d, v_blank %d\n",
+						meter.v_valid, meter.v_blank);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\tmipi_pixel_rate %lld\n",
+						meter.mipi_pixel_rate);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\tv_blank %lld us\n",
+						meter.vb_in_us);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\th_blank %lld us\n",
+						meter.hb_in_us);
+				len += snprintf(buf + len, PAGE_SIZE - len,
+						"\tline_time %lld us\n",
+						meter.line_time_in_us);
+			}
+		}
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return len;
+}
+
+#define SENINF_DRV_DEBUG_MAX_DELAY 400
+
+static inline void
+mtk_cam_seninf_clear_matched_cam_mux_irq(struct seninf_ctx *ctx,
+					 u32 cam_mux_idx,
+					 u32 vc_idx,
+					 s32 enabled)
+{
+	u8 used_cammux;
+
+	if (cam_mux_idx >= SENINF_CAM_MUX_NUM) {
+		dev_info(ctx->dev, "unsupport cam_mux(%u)", cam_mux_idx);
+		return;
+	}
+	if (vc_idx >= SENINF_VC_MAXCNT) {
+		dev_info(ctx->dev, "unsupport vc_idx(%u)", vc_idx);
+		return;
+	}
+
+	used_cammux = ctx->vcinfo.vc[vc_idx].cam;
+	if (used_cammux == cam_mux_idx &&
+	    enabled & (1 << cam_mux_idx)) {
+		dev_dbg(ctx->dev,
+			"before clear cam mux%u recSize = 0x%x, irq = 0x%x",
+			cam_mux_idx,
+			SENINF_READ_REG(ctx->reg_if_cam_mux,
+					SENINF_CAM_MUX0_CHK_RES + (0x10 * cam_mux_idx)),
+			SENINF_READ_REG(ctx->reg_if_cam_mux,
+					SENINF_CAM_MUX_IRQ_STATUS));
+
+		SENINF_WRITE_REG(ctx->reg_if_cam_mux,
+				 SENINF_CAM_MUX_IRQ_STATUS,
+				 3 << (cam_mux_idx * 2));
+	}
+}
+
+static inline void mtk_cam_seninf_check_matched_cam_mux(struct seninf_ctx *ctx,
+							u32 cam_mux_idx,
+							u32 vc_idx,
+							s32 enabled,
+							s32 irq_status)
+{
+	u8 used_cammux;
+
+	if (cam_mux_idx >= SENINF_CAM_MUX_NUM) {
+		dev_info(ctx->dev, "unsupport cam_mux(%u)", cam_mux_idx);
+		return;
+	}
+	if (vc_idx >= SENINF_VC_MAXCNT) {
+		dev_info(ctx->dev, "unsupport vc_idx(%u)", vc_idx);
+		return;
+	}
+
+	used_cammux = ctx->vcinfo.vc[vc_idx].cam;
+
+	if (used_cammux == cam_mux_idx && enabled & (1 << cam_mux_idx)) {
+		int rec_size = SENINF_READ_REG(ctx->reg_if_cam_mux,
+			SENINF_CAM_MUX0_CHK_RES + (0x10 * cam_mux_idx));
+		int exp_size = SENINF_READ_REG(ctx->reg_if_cam_mux,
+			SENINF_CAM_MUX0_CHK_CTL_1 + (0x10 * cam_mux_idx));
+		if (rec_size != exp_size) {
+			dev_dbg(ctx->dev,
+				"cam mux%u size mismatch, (rec, exp) = (0x%x, 0x%x)",
+				cam_mux_idx, rec_size, exp_size);
+		}
+		if ((irq_status &
+		     (3 << (cam_mux_idx * 2))) != 0) {
+			dev_dbg(ctx->dev,
+				"cam mux%u size mismatch!, irq = 0x%x",
+				cam_mux_idx, irq_status);
+		}
+	}
+}
+
+int mtk_cam_seninf_debug(struct seninf_ctx *ctx)
+{
+	void __iomem *base_ana, *base_cphy, *base_dphy, *base_csi, *base_mux;
+	unsigned int temp = 0;
+	int pkg_cnt_changed = 0;
+	unsigned int mipi_packet_cnt = 0;
+	unsigned int tmp_mipi_packet_cnt = 0;
+	unsigned long total_delay = 0;
+	int irq_status = 0;
+	int enabled = 0;
+	int ret = 0;
+	int j, k;
+	unsigned long debug_ft = 33;
+	unsigned long debug_vb = 1;
+
+	for (j = CSI_PORT_0A; j < CSI_PORT_3A; j++) {
+		base_ana = ctx->reg_ana_csi_rx[j];
+		dev_dbg(ctx->dev,
+			"MipiRx_ANA%d: CDPHY_RX_ANA_0(0x%x) ANA_2(0x%x) ANA_4(0x%x) ANA_5(0x%x) ANA_8(0x%x)\n",
+			j - 3,
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_0),
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_2),
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_4),
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_5),
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_8));
+		dev_dbg(ctx->dev,
+			"MipiRx_ANA%d: CDPHY_RX_ANA_AD_0(0x%x) AD_HS_0(0x%x) AD_HS_1(0x%x)\n",
+			j - 3,
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_AD_0),
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_AD_HS_0),
+			SENINF_READ_REG(base_ana, CDPHY_RX_ANA_AD_HS_1));
+	}
+
+	for (j = CSI_PORT_0; j < CSI_PORT_3; j++) {
+		base_cphy = ctx->reg_ana_cphy_top[j];
+		base_dphy = ctx->reg_ana_dphy_top[j];
+
+		dev_dbg(ctx->dev,
+			"Csi%d_Dphy_Top: LANE_EN(0x%x) LANE_SELECT(0x%x) DATA_LANE0_HS(0x%x) DATA_LANE1_HS(0x%x) DATA_LANE2_HS(0x%x) DATA_LANE3_HS(0x%x)\n",
+			j, SENINF_READ_REG(base_dphy, DPHY_RX_LANE_EN),
+			SENINF_READ_REG(base_dphy, DPHY_RX_LANE_SELECT),
+			SENINF_READ_REG(base_dphy,
+					DPHY_RX_DATA_LANE0_HS_PARAMETER),
+			SENINF_READ_REG(base_dphy,
+					DPHY_RX_DATA_LANE1_HS_PARAMETER),
+			SENINF_READ_REG(base_dphy,
+					DPHY_RX_DATA_LANE2_HS_PARAMETER),
+			SENINF_READ_REG(base_dphy,
+					DPHY_RX_DATA_LANE3_HS_PARAMETER));
+
+		dev_dbg(ctx->dev,
+			"Csi%d_Cphy_Top: CPHY_RX_CTRL(0x%x) CPHY_RX_DETECT_CTRL_POST(0x%x)\n",
+			j, SENINF_READ_REG(base_cphy, CPHY_RX_CTRL),
+			SENINF_READ_REG(base_cphy, CPHY_RX_DETECT_CTRL_POST));
+	}
+
+	dev_dbg(ctx->dev,
+		"SENINF_TOP_MUX_CTRL_0(0x%x) SENINF_TOP_MUX_CTRL_1(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_top, SENINF_TOP_MUX_CTRL_0),
+		SENINF_READ_REG(ctx->reg_if_top, SENINF_TOP_MUX_CTRL_1));
+
+	dev_dbg(ctx->dev,
+		"SENINF_CAM_MUX_CTRL_0(0x%x) SENINF_CAM_MUX_CTRL_1(0x%x) SENINF_CAM_MUX_CTRL_2(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX_CTRL_0),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX_CTRL_1),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX_CTRL_2));
+
+	enabled = SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX_EN);
+	/* clear cam mux irq */
+	for (j = 0; j < ctx->vcinfo.cnt; j++) {
+		if (ctx->vcinfo.vc[j].enable)
+			for (k = SENINF_CAM_MUX0; k < SENINF_CAM_MUX_NUM; k++)
+				mtk_cam_seninf_clear_matched_cam_mux_irq(ctx, k, j, enabled);
+	}
+
+	/* Seninf_csi status IRQ */
+	for (j = SENINF_1; j < _seninf_cfg.seninf_num; j++) {
+		base_csi = ctx->reg_if_csi2[j];
+		temp = SENINF_READ_REG(base_csi, SENINF_CSI2_IRQ_STATUS);
+		if (temp & ~(0x324)) {
+			SENINF_WRITE_REG(base_csi, SENINF_CSI2_IRQ_STATUS,
+					 0xffffffff);
+		}
+		dev_dbg(ctx->dev,
+			"SENINF%d_CSI2_EN(0x%x) SENINF_CSI2_OPT(0x%x) SENINF_CSI2_IRQ_STATUS(0x%x)\n",
+			j, SENINF_READ_REG(base_csi, SENINF_CSI2_EN),
+			SENINF_READ_REG(base_csi, SENINF_CSI2_OPT), temp);
+	}
+
+	/* Seninf_csi packet count */
+	pkg_cnt_changed = 0;
+	base_csi = ctx->reg_if_csi2[(uint32_t)ctx->seninf_idx];
+	if (SENINF_READ_REG(base_csi, SENINF_CSI2_EN) & 0x1) {
+		SENINF_BITS(base_csi, SENINF_CSI2_DBG_CTRL,
+			    RG_CSI2_DBG_PACKET_CNT_EN, 1);
+		mipi_packet_cnt = SENINF_READ_REG(base_csi,
+						  SENINF_CSI2_PACKET_CNT_STATUS);
+
+		dev_dbg(ctx->dev, "total_delay %ld SENINF%d_PkCnt(0x%x)\n",
+			total_delay, ctx->seninf_idx, mipi_packet_cnt);
+
+		while (total_delay <= debug_ft) {
+			tmp_mipi_packet_cnt = mipi_packet_cnt & 0xFFFF;
+			mdelay(debug_vb);
+			total_delay += debug_vb;
+			mipi_packet_cnt = SENINF_READ_REG(base_csi,
+							  SENINF_CSI2_PACKET_CNT_STATUS);
+			dev_dbg(ctx->dev,
+				"total_delay %ld SENINF%d_PkCnt(0x%x)\n",
+				total_delay, ctx->seninf_idx, mipi_packet_cnt);
+			if (tmp_mipi_packet_cnt != (mipi_packet_cnt & 0xFFFF)) {
+				pkg_cnt_changed = 1;
+				break;
+			}
+		}
+	}
+	if (!pkg_cnt_changed)
+		ret = -1;
+
+	/* Check csi status again */
+	if (debug_ft > total_delay) {
+		mdelay(debug_ft - total_delay);
+		total_delay = debug_ft;
+	}
+	temp = SENINF_READ_REG(base_csi, SENINF_CSI2_IRQ_STATUS);
+	dev_dbg(ctx->dev, "SENINF%d_CSI2_IRQ_STATUS(0x%x)\n",
+		ctx->seninf_idx, temp);
+	if (total_delay < SENINF_DRV_DEBUG_MAX_DELAY) {
+		if (total_delay + debug_ft < SENINF_DRV_DEBUG_MAX_DELAY)
+			mdelay(debug_ft);
+		else
+			mdelay(SENINF_DRV_DEBUG_MAX_DELAY - total_delay);
+	}
+	temp = SENINF_READ_REG(base_csi, SENINF_CSI2_IRQ_STATUS);
+	dev_dbg(ctx->dev, "SENINF%d_CSI2_IRQ_STATUS(0x%x)\n",
+		ctx->seninf_idx, temp);
+	if ((temp & 0xD0) != 0)
+		ret = -2; /* multi lanes sync error, crc error, ecc error */
+
+	/* SENINF_MUX */
+	for (j = SENINF_MUX1; j < _seninf_cfg.mux_num; j++) {
+		base_mux = ctx->reg_if_mux[j];
+		dev_dbg(ctx->dev,
+			"SENINF%d_MUX_CTRL0(0x%x) SENINF%d_MUX_CTRL1(0x%x) SENINF_MUX_IRQ_STATUS(0x%x) SENINF%d_MUX_SIZE(0x%x) SENINF_MUX_ERR_SIZE(0x%x) SENINF_MUX_EXP_SIZE(0x%x)\n",
+			j,
+			SENINF_READ_REG(base_mux, SENINF_MUX_CTRL_0),
+			j,
+			SENINF_READ_REG(base_mux, SENINF_MUX_CTRL_1),
+			SENINF_READ_REG(base_mux, SENINF_MUX_IRQ_STATUS),
+			j,
+			SENINF_READ_REG(base_mux, SENINF_MUX_SIZE),
+			SENINF_READ_REG(base_mux, SENINF_MUX_ERR_SIZE),
+			SENINF_READ_REG(base_mux, SENINF_MUX_IMG_SIZE));
+
+		if (SENINF_READ_REG(base_mux, SENINF_MUX_IRQ_STATUS) & 0x1) {
+			SENINF_WRITE_REG(base_mux, SENINF_MUX_IRQ_STATUS,
+					 0xffffffff);
+			mdelay(debug_ft);
+			dev_dbg(ctx->dev,
+				"after reset overrun, SENINF_MUX_IRQ_STATUS(0x%x) SENINF%d_MUX_SIZE(0x%x)\n",
+				SENINF_READ_REG(base_mux, SENINF_MUX_IRQ_STATUS),
+				j, SENINF_READ_REG(base_mux, SENINF_MUX_SIZE));
+		}
+	}
+
+	irq_status =
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX_IRQ_STATUS);
+
+	dev_dbg(ctx->dev,
+		"SENINF_CAM_MUX_EN 0x%x SENINF_CAM_MUX_IRQ_EN 0x%x SENINF_CAM_MUX_IRQ_STATUS 0x%x",
+		enabled,
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX_IRQ_EN),
+		irq_status);
+
+	/* check SENINF_CAM_MUX size */
+	for (j = 0; j < ctx->vcinfo.cnt; j++) {
+		if (ctx->vcinfo.vc[j].enable)
+			for (k = SENINF_CAM_MUX0; k < SENINF_CAM_MUX_NUM; k++)
+				mtk_cam_seninf_check_matched_cam_mux(ctx, k, j,
+								     enabled,
+								     irq_status);
+	}
+
+	dev_dbg(ctx->dev,
+		"SENINF_CAM_MUX size: MUX0(0x%x) MUX1(0x%x) MUX2(0x%x) MUX3(0x%x) MUX4(0x%x) MUX5(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX0_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX1_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX2_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX3_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX4_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX5_CHK_RES));
+	dev_dbg(ctx->dev,
+		"SENINF_CAM_MUX size: MUX6(0x%x) MUX7(0x%x) MUX8(0x%x) MUX9(0x%x) MUX10(0x%x) MUX1(0x%x) MUX12(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX6_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX7_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX8_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX9_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX10_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX11_CHK_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX12_CHK_RES));
+	dev_dbg(ctx->dev,
+		"SENINF_CAM_MUX err size: MUX0(0x%x) MUX1(0x%x) MUX2(0x%x) MUX3(0x%x) MUX4(0x%x) MUX5(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX0_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX1_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX2_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX3_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX4_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX5_CHK_ERR_RES));
+	dev_dbg(ctx->dev,
+		"SENINF_CAM_MUX err size: MUX6(0x%x) MUX7(0x%x) MUX8(0x%x) MUX9(0x%x) MUX10(0x%x) MUX11(0x%x) MUX12(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX6_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX7_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX8_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX9_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX10_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX11_CHK_ERR_RES),
+		SENINF_READ_REG(ctx->reg_if_cam_mux,
+				SENINF_CAM_MUX12_CHK_ERR_RES));
+
+	/* check VC/DT split */
+	dev_dbg(ctx->dev,
+		"VC/DT split:SENINF_CAM_MUX0_OPT(0x%x) MUX1(0x%x) MUX2(0x%x) MUX3(0x%x) MUX4(0x%x) MUX5(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX0_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX1_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX2_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX3_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX4_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX5_OPT));
+	dev_dbg(ctx->dev,
+		"VC/DT split:SENINF_CAM_MUX6_OPT(0x%x) MUX7(0x%x) MUX8(0x%x) MUX9(0x%x) MUX10(0x%x) MUX11(0x%x) MUX12(0x%x)\n",
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX6_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX7_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX8_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX9_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX10_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX11_OPT),
+		SENINF_READ_REG(ctx->reg_if_cam_mux, SENINF_CAM_MUX12_OPT));
+
+	dev_dbg(ctx->dev, "ret = %d", ret);
+
+	return ret;
+}
+
+ssize_t mtk_cam_seninf_show_err_status(struct device *dev,
+				       struct device_attribute *attr, char *buf)
+{
+	int i, len;
+	struct seninf_core *core;
+	struct seninf_ctx *ctx;
+	struct seninf_vc *vc;
+
+	core = dev_get_drvdata(dev);
+	len = 0;
+
+	mutex_lock(&core->mutex);
+
+	list_for_each_entry(ctx, &core->list, list) {
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\n[%s] port %d intf %d test %d cphy %d lanes %d\n",
+				ctx->subdev.name, ctx->port, ctx->seninf_idx,
+				ctx->is_test_model, ctx->is_cphy,
+				ctx->num_data_lanes);
+
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"---flag = errs exceed theshhold ? 1 : 0---\n");
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\tdata_not_enough error flag : <%d>",
+				ctx->data_not_enough_flag);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\terr_lane_resync error flag : <%d>",
+				ctx->err_lane_resync_flag);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\tcrc_err error flag : <%d>",
+				ctx->crc_err_flag);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\tecc_err_double error flag : <%d>",
+				ctx->ecc_err_double_flag);
+		len += snprintf(buf + len, PAGE_SIZE - len,
+				"\tecc_err_corrected error flag : <%d>\n",
+				ctx->ecc_err_corrected_flag);
+
+		for (i = 0; i < ctx->vcinfo.cnt; i++) {
+			vc = &ctx->vcinfo.vc[i];
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"[%d] vc 0x%x dt 0x%x mux %d cam %d\n",
+					i, vc->vc, vc->dt, vc->mux, vc->cam);
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"\tfifo_overrun error flag : <%d>",
+					ctx->fifo_overrun_flag);
+			len += snprintf(buf + len, PAGE_SIZE - len,
+					"\tsize_err error flag : <%d>\n",
+					ctx->size_err_flag);
+		}
+	}
+
+	mutex_unlock(&core->mutex);
+
+	return len;
+}
+
+#define SBUF 256
+int mtk_cam_seninf_irq_handler(int irq, void *data)
+{
+	struct seninf_core *core = (struct seninf_core *)data;
+	unsigned long flags; /* for mipi err detection */
+	struct seninf_ctx *ctx;
+	struct seninf_vc *vc;
+	void __iomem *csi2, *pmux, *seninf_cam_mux;
+	int i;
+	unsigned int csi_irq_ro;
+	unsigned int mux_irq_ro;
+	unsigned int cam_irq_exp_ro;
+	unsigned int cam_irq_res_ro;
+	char seninf_log[SBUF];
+	unsigned int wcnt = 0;
+
+	spin_lock_irqsave(&core->spinlock_irq, flags);
+
+	/* debug for set_reg case: REG_KEY_CSI_IRQ_EN */
+	if (core->csi_irq_en_flag) {
+		list_for_each_entry(ctx, &core->list, list) {
+			csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+			csi_irq_ro =
+				SENINF_READ_REG(csi2, SENINF_CSI2_IRQ_STATUS);
+
+			if (csi_irq_ro) {
+				SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_STATUS,
+						 0xFFFFFFFF);
+			}
+
+			if (csi_irq_ro & (0x1 << RO_CSI2_ECC_ERR_CORRECTED_IRQ_SHIFT))
+				ctx->ecc_err_corrected_cnt++;
+			if (csi_irq_ro & (0x1 << RO_CSI2_ECC_ERR_DOUBLE_IRQ_SHIFT))
+				ctx->ecc_err_double_cnt++;
+			if (csi_irq_ro & (0x1 << RO_CSI2_CRC_ERR_IRQ_SHIFT))
+				ctx->crc_err_cnt++;
+			if (csi_irq_ro & (0x1 << RO_CSI2_ERR_LANE_RESYNC_IRQ_SHIFT))
+				ctx->err_lane_resync_cnt++;
+			if (csi_irq_ro & (0x1 << RO_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_SHIFT))
+				ctx->data_not_enough_cnt++;
+
+			for (i = 0; i < ctx->vcinfo.cnt; i++) {
+				vc = &ctx->vcinfo.vc[i];
+				pmux = ctx->reg_if_mux[vc->mux];
+				seninf_cam_mux = ctx->reg_if_cam_mux;
+
+				mux_irq_ro = SENINF_READ_REG(pmux,
+							     SENINF_MUX_IRQ_STATUS);
+
+				cam_irq_exp_ro = SENINF_READ_REG(seninf_cam_mux,
+								 SENINF_CAM_MUX0_CHK_CTL_1 +
+								 (0x10 * (vc->cam)));
+
+				cam_irq_res_ro = SENINF_READ_REG(seninf_cam_mux,
+								 SENINF_CAM_MUX0_CHK_RES +
+								 (0x10 * (vc->cam)));
+
+				if (mux_irq_ro)
+					SENINF_WRITE_REG(pmux,
+							 SENINF_MUX_IRQ_STATUS,
+							 0xFFFFFFFF);
+
+				if (cam_irq_res_ro != cam_irq_exp_ro)
+					SENINF_WRITE_REG(seninf_cam_mux,
+							 SENINF_CAM_MUX0_CHK_RES +
+							 (0x10 * (vc->cam)),
+							 0xFFFFFFFF);
+
+				if (mux_irq_ro & (0x1 << 0))
+					ctx->fifo_overrun_cnt++;
+
+				if (cam_irq_res_ro != cam_irq_exp_ro)
+					ctx->size_err_cnt++;
+			}
+
+			/* dump status counter: debug for electrical signal */
+			if (ctx->data_not_enough_cnt >= core->detection_cnt ||
+			    ctx->err_lane_resync_cnt >= core->detection_cnt ||
+			    ctx->crc_err_cnt >= core->detection_cnt ||
+			    ctx->ecc_err_double_cnt >= core->detection_cnt ||
+			    ctx->ecc_err_corrected_cnt >= core->detection_cnt ||
+			    ctx->fifo_overrun_cnt >= core->detection_cnt ||
+			    ctx->size_err_cnt >= core->detection_cnt) {
+				/* disable all interrupts */
+				SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_EN, 0x80000000);
+
+				if (ctx->data_not_enough_cnt >= core->detection_cnt)
+					ctx->data_not_enough_flag = 1;
+				if (ctx->err_lane_resync_cnt >= core->detection_cnt)
+					ctx->err_lane_resync_flag = 1;
+				if (ctx->crc_err_cnt >= core->detection_cnt)
+					ctx->crc_err_flag = 1;
+				if (ctx->ecc_err_double_cnt >= core->detection_cnt)
+					ctx->ecc_err_double_flag = 1;
+				if (ctx->ecc_err_corrected_cnt >= core->detection_cnt)
+					ctx->ecc_err_corrected_flag = 1;
+				if (ctx->fifo_overrun_cnt >= core->detection_cnt)
+					ctx->fifo_overrun_flag = 1;
+				if (ctx->size_err_cnt >= core->detection_cnt)
+					ctx->size_err_flag = 1;
+
+				wcnt = snprintf(seninf_log, SBUF, "info: %s", __func__);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   data_not_enough_count: %d",
+					ctx->data_not_enough_cnt);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   err_lane_resync_count: %d",
+					ctx->err_lane_resync_cnt);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   crc_err_count: %d",
+					ctx->crc_err_cnt);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   ecc_err_double_count: %d",
+					ctx->ecc_err_double_cnt);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   ecc_err_corrected_count: %d",
+					ctx->ecc_err_corrected_cnt);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   fifo_overrun_count: %d",
+					ctx->fifo_overrun_cnt);
+				wcnt += snprintf(seninf_log + wcnt, SBUF - wcnt,
+					"   size_err_count: %d",
+					ctx->size_err_cnt);
+			}
+		}
+	}
+
+	spin_unlock_irqrestore(&core->spinlock_irq, flags);
+
+	return 0;
+}
+
+int mtk_cam_seninf_set_sw_cfg_busy(struct seninf_ctx *ctx, bool enable,
+				   int index)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	if (index == 0)
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_CTRL,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_BSY0, enable);
+	else
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_CTRL,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_BSY1, enable);
+	return 0;
+}
+
+int mtk_cam_seninf_set_cam_mux_dyn_en(struct seninf_ctx *ctx, bool enable,
+				      int cam_mux, int index)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	u32 tmp = 0;
+
+	if (index == 0) {
+		tmp = SENINF_READ_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+				       RG_SENINF_CAM_MUX_DYN_SWITCH_EN0);
+		if (enable)
+			tmp = tmp | (1 << cam_mux);
+		else
+			tmp = tmp & ~(1 << cam_mux);
+
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN0, tmp);
+	} else {
+		tmp = SENINF_READ_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+				       RG_SENINF_CAM_MUX_DYN_SWITCH_EN1);
+		if (enable)
+			tmp = tmp | (1 << cam_mux);
+		else
+			tmp = tmp & ~(1 << cam_mux);
+
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN1, tmp);
+	}
+
+	return 0;
+}
+
+int mtk_cam_seninf_reset_cam_mux_dyn_en(struct seninf_ctx *ctx, int index)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	if (index == 0)
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN0, 0);
+	else
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_DYN_EN,
+			    RG_SENINF_CAM_MUX_DYN_SWITCH_EN1, 0);
+
+	return 0;
+}
+
+int mtk_cam_seninf_enable_global_drop_irq(struct seninf_ctx *ctx, bool enable,
+					  int index)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	if (index == 0)
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_IRQ_EN,
+			    RG_SENINF_CAM_MUX15_HSIZE_ERR_IRQ_EN, enable);
+	else
+		SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_IRQ_EN,
+			    RG_SENINF_CAM_MUX15_VSIZE_ERR_IRQ_EN, enable);
+
+	return 0;
+}
+
+int mtk_cam_seninf_enable_cam_mux_vsync_irq(struct seninf_ctx *ctx, bool enable,
+					    int cam_mux)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+	int tmp = 0;
+
+	tmp = SENINF_READ_BITS(seninf_cam_mux, SENINF_CAM_MUX_VSYNC_IRQ_EN,
+			       RG_SENINF_CAM_MUX_VSYNC_IRQ_EN);
+	if (enable)
+		tmp |= (enable << cam_mux);
+	else
+		tmp &= ~(enable << cam_mux);
+
+	SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_VSYNC_IRQ_EN,
+		    RG_SENINF_CAM_MUX_VSYNC_IRQ_EN, tmp);
+	return 0;
+}
+
+int mtk_cam_seninf_disable_all_cam_mux_vsync_irq(struct seninf_ctx *ctx)
+{
+	void __iomem *seninf_cam_mux = ctx->reg_if_cam_mux;
+
+	SENINF_BITS(seninf_cam_mux, SENINF_CAM_MUX_VSYNC_IRQ_EN,
+		    RG_SENINF_CAM_MUX_VSYNC_IRQ_EN, 0);
+	return 0;
+}
+
+int mtk_cam_seninf_set_reg(struct seninf_ctx *ctx, u32 key, u32 val)
+{
+	int i;
+	void __iomem *base = ctx->reg_ana_dphy_top[ctx->port];
+	void __iomem *csi2 = ctx->reg_if_csi2[ctx->seninf_idx];
+	void __iomem *pmux, *pcammux;
+	struct seninf_vc *vc;
+	struct seninf_core *core;
+	struct seninf_ctx *ctx_;
+	void __iomem *csi2_;
+
+	core = dev_get_drvdata(ctx->dev->parent);
+
+	if (!ctx->streaming)
+		return 0;
+
+	dev_dbg(ctx->dev, "%s key = 0x%x, val = 0x%x\n", __func__, key, val);
+
+	switch (key) {
+	case REG_KEY_SETTLE_CK:
+		SENINF_BITS(base, DPHY_RX_CLOCK_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LC0_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_CLOCK_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LC1_HS_SETTLE_PARAMETER, val);
+		break;
+	case REG_KEY_SETTLE_DT:
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_CDPHY_RX_LD0_TRIO0_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_CDPHY_RX_LD1_TRIO1_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_CDPHY_RX_LD2_TRIO2_HS_SETTLE_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_CDPHY_RX_LD3_TRIO3_HS_SETTLE_PARAMETER, val);
+		break;
+	case REG_KEY_HS_TRAIL_EN:
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LD0_HS_TRAIL_EN, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LD1_HS_TRAIL_EN, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_DPHY_RX_LD2_HS_TRAIL_EN, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_DPHY_RX_LD3_HS_TRAIL_EN, val);
+		break;
+	case REG_KEY_HS_TRAIL_PARAM:
+		SENINF_BITS(base, DPHY_RX_DATA_LANE0_HS_PARAMETER,
+			    RG_DPHY_RX_LD0_HS_TRAIL_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE1_HS_PARAMETER,
+			    RG_DPHY_RX_LD1_HS_TRAIL_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE2_HS_PARAMETER,
+			    RG_DPHY_RX_LD2_HS_TRAIL_PARAMETER, val);
+		SENINF_BITS(base, DPHY_RX_DATA_LANE3_HS_PARAMETER,
+			    RG_DPHY_RX_LD3_HS_TRAIL_PARAMETER, val);
+		break;
+	case REG_KEY_CSI_IRQ_STAT:
+		SENINF_WRITE_REG(csi2, SENINF_CSI2_IRQ_STATUS,
+				 val & 0xFFFFFFFF);
+		break;
+	case REG_KEY_MUX_IRQ_STAT:
+		for (i = 0; i < ctx->vcinfo.cnt; i++) {
+			vc = &ctx->vcinfo.vc[i];
+			pmux = ctx->reg_if_mux[vc->mux];
+			SENINF_WRITE_REG(pmux, SENINF_MUX_IRQ_STATUS,
+					 val & 0xFFFFFFFF);
+		}
+		break;
+	case REG_KEY_CAMMUX_IRQ_STAT:
+		for (i = 0; i < ctx->vcinfo.cnt; i++) {
+			vc = &ctx->vcinfo.vc[i];
+			pcammux = ctx->reg_if_cam_mux;
+			SENINF_WRITE_REG(pcammux, SENINF_CAM_MUX_IRQ_STATUS,
+					 val & 0xFFFFFFFF);
+		}
+		break;
+	case REG_KEY_CSI_IRQ_EN:
+		{
+			if (!val) {
+				core->csi_irq_en_flag = 0;
+				return 0;
+			}
+
+			core->csi_irq_en_flag = 1;
+			core->detection_cnt = val;
+			list_for_each_entry(ctx_, &core->list, list) {
+				csi2_ = ctx_->reg_if_csi2[ctx_->seninf_idx];
+				SENINF_WRITE_REG(csi2_, SENINF_CSI2_IRQ_EN,
+						 0xA0002058);
+			}
+		}
+		break;
+	}
+
+	return 0;
+}
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
new file mode 100644
index 000000000000..7c95b4fb840d
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
@@ -0,0 +1,257 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __MIPI_RX_ANA_CDPHY_CSI0A_H__
+#define __MIPI_RX_ANA_CDPHY_CSI0A_H__
+
+#define CDPHY_RX_ANA_0 0x0000
+#define RG_CSI0_BG_CORE_EN_SHIFT 0
+#define RG_CSI0_BG_CORE_EN_MASK (0x1 << 0)
+#define RG_CSI0_BG_LPF_EN_SHIFT 1
+#define RG_CSI0_BG_LPF_EN_MASK (0x1 << 1)
+#define RG_CSI0_EQ_PROTECT_EN_SHIFT 4
+#define RG_CSI0_EQ_PROTECT_EN_MASK (0x1 << 4)
+#define RG_CSI0_BYTE_CK_RSTB_SEL_SHIFT 5
+#define RG_CSI0_BYTE_CK_RSTB_SEL_MASK (0x1 << 5)
+#define RG_CSI0_DPHY_L0_CKSEL_SHIFT 8
+#define RG_CSI0_DPHY_L0_CKSEL_MASK (0x1 << 8)
+#define RG_CSI0_DPHY_L1_CKSEL_SHIFT 9
+#define RG_CSI0_DPHY_L1_CKSEL_MASK (0x1 << 9)
+#define RG_CSI0_DPHY_L2_CKSEL_SHIFT 10
+#define RG_CSI0_DPHY_L2_CKSEL_MASK (0x1 << 10)
+#define RG_CSI0_DPHY_L0_CKMODE_EN_SHIFT 12
+#define RG_CSI0_DPHY_L0_CKMODE_EN_MASK (0x1 << 12)
+#define RG_CSI0_DPHY_L1_CKMODE_EN_SHIFT 13
+#define RG_CSI0_DPHY_L1_CKMODE_EN_MASK (0x1 << 13)
+#define RG_CSI0_DPHY_L2_CKMODE_EN_SHIFT 14
+#define RG_CSI0_DPHY_L2_CKMODE_EN_MASK (0x1 << 14)
+#define RG_CSI0_CDPHY_L0_T0_BYTECK_INVERT_SHIFT 16
+#define RG_CSI0_CDPHY_L0_T0_BYTECK_INVERT_MASK (0x1 << 16)
+#define RG_CSI0_DPHY_L1_BYTECK_INVERT_SHIFT 17
+#define RG_CSI0_DPHY_L1_BYTECK_INVERT_MASK (0x1 << 17)
+#define RG_CSI0_CDPHY_L2_T1_BYTECK_INVERT_SHIFT 18
+#define RG_CSI0_CDPHY_L2_T1_BYTECK_INVERT_MASK (0x1 << 18)
+#define RG_CSI0_CPHY_EN_SHIFT 20
+#define RG_CSI0_CPHY_EN_MASK (0x1 << 20)
+#define RG_CSI0_CPHY_T0_CDR_FIRST_EDGE_EN_SHIFT 21
+#define RG_CSI0_CPHY_T0_CDR_FIRST_EDGE_EN_MASK (0x1 << 21)
+#define RG_CSI0_CPHY_T1_CDR_FIRST_EDGE_EN_SHIFT 22
+#define RG_CSI0_CPHY_T1_CDR_FIRST_EDGE_EN_MASK (0x1 << 22)
+#define RG_CSI0_CDPHY_L0_T0_FORCE_INIT_SHIFT 24
+#define RG_CSI0_CDPHY_L0_T0_FORCE_INIT_MASK (0x1 << 24)
+#define RG_CSI0_DPHY_L1_FORCE_INIT_SHIFT 25
+#define RG_CSI0_DPHY_L1_FORCE_INIT_MASK (0x1 << 25)
+#define RG_CSI0_CDPHY_L2_T1_FORCE_INIT_SHIFT 26
+#define RG_CSI0_CDPHY_L2_T1_FORCE_INIT_MASK (0x1 << 26)
+#define RG_CSI0_CDPHY_L0_T0_SYNC_INIT_CTRL_SHIFT 28
+#define RG_CSI0_CDPHY_L0_T0_SYNC_INIT_CTRL_MASK (0x1 << 28)
+#define RG_CSI0_DPHY_L1_SYNC_INIT_CTRL_SHIFT 29
+#define RG_CSI0_DPHY_L1_SYNC_INIT_CTRL_MASK (0x1 << 29)
+#define RG_CSI0_CDPHY_L2_T1_SYNC_INIT_CTRL_SHIFT 30
+#define RG_CSI0_CDPHY_L2_T1_SYNC_INIT_CTRL_MASK (0x1 << 30)
+#define RG_CSI0_FORCE_HSRT_EN_SHIFT 31
+#define RG_CSI0_FORCE_HSRT_EN_MASK (0x1 << 31)
+
+#define CDPHY_RX_ANA_1 0x0004
+#define RG_CSI0_BG_LPRX_VTL_SEL_SHIFT 0
+#define RG_CSI0_BG_LPRX_VTL_SEL_MASK (0x7 << 0)
+#define RG_CSI0_BG_LPRX_VTH_SEL_SHIFT 4
+#define RG_CSI0_BG_LPRX_VTH_SEL_MASK (0x7 << 4)
+#define RG_CSI0_BG_VREF_SEL_SHIFT 8
+#define RG_CSI0_BG_VREF_SEL_MASK (0xf << 8)
+#define RG_CSI0_CDPHY_DELAYCAL_CK_SEL_SHIFT 12
+#define RG_CSI0_CDPHY_DELAYCAL_CK_SEL_MASK (0x7 << 12)
+#define RG_CSI0_CDPHY_EQ_DES_VREF_SEL_SHIFT 16
+#define RG_CSI0_CDPHY_EQ_DES_VREF_SEL_MASK (0x7 << 16)
+#define RG_CSI0_CDPHY_DELAY_VREF_SEL_SHIFT 20
+#define RG_CSI0_CDPHY_DELAY_VREF_SEL_MASK (0x7 << 20)
+#define RG_CSI0_DPHY_L0_DELAYCAL_EN_SHIFT 24
+#define RG_CSI0_DPHY_L0_DELAYCAL_EN_MASK (0x1 << 24)
+#define RG_CSI0_DPHY_L1_DELAYCAL_EN_SHIFT 25
+#define RG_CSI0_DPHY_L1_DELAYCAL_EN_MASK (0x1 << 25)
+#define RG_CSI0_DPHY_L2_DELAYCAL_EN_SHIFT 26
+#define RG_CSI0_DPHY_L2_DELAYCAL_EN_MASK (0x1 << 26)
+#define RG_CSI0_DPHY_L0_DELAYCAL_RSTB_SHIFT 28
+#define RG_CSI0_DPHY_L0_DELAYCAL_RSTB_MASK (0x1 << 28)
+#define RG_CSI0_DPHY_L1_DELAYCAL_RSTB_SHIFT 29
+#define RG_CSI0_DPHY_L1_DELAYCAL_RSTB_MASK (0x1 << 29)
+#define RG_CSI0_DPHY_L2_DELAYCAL_RSTB_SHIFT 30
+#define RG_CSI0_DPHY_L2_DELAYCAL_RSTB_MASK (0x1 << 30)
+
+#define CDPHY_RX_ANA_2 0x0008
+#define RG_CSI0_L0P_T0A_HSRT_CODE_SHIFT 0
+#define RG_CSI0_L0P_T0A_HSRT_CODE_MASK (0x1f << 0)
+#define RG_CSI0_L0N_T0B_HSRT_CODE_SHIFT 8
+#define RG_CSI0_L0N_T0B_HSRT_CODE_MASK (0x1f << 8)
+#define RG_CSI0_CPHY_T0_CDR_SELF_CAL_EN_SHIFT 16
+#define RG_CSI0_CPHY_T0_CDR_SELF_CAL_EN_MASK (0x1 << 16)
+#define RG_CSI0_CPHY_T1_CDR_SELF_CAL_EN_SHIFT 17
+#define RG_CSI0_CPHY_T1_CDR_SELF_CAL_EN_MASK (0x1 << 17)
+#define RG_CSI0_BG_ALP_RX_VTH_SEL_SHIFT 24
+#define RG_CSI0_BG_ALP_RX_VTH_SEL_MASK (0x7 << 24)
+#define RG_CSI0_BG_ALP_RX_VTL_SEL_SHIFT 28
+#define RG_CSI0_BG_ALP_RX_VTL_SEL_MASK (0x7 << 28)
+
+#define CDPHY_RX_ANA_3 0x000c
+#define RG_CSI0_L1P_T0C_HSRT_CODE_SHIFT 0
+#define RG_CSI0_L1P_T0C_HSRT_CODE_MASK (0x1f << 0)
+#define RG_CSI0_L1N_T1A_HSRT_CODE_SHIFT 8
+#define RG_CSI0_L1N_T1A_HSRT_CODE_MASK (0x1f << 8)
+#define RG_CSI0_OS_CAL_CNT_SEL_SHIFT 16
+#define RG_CSI0_OS_CAL_CNT_SEL_MASK (0x3 << 16)
+#define RG_CSI0_EQ_DES_VREF_SEL_SHIFT 20
+#define RG_CSI0_EQ_DES_VREF_SEL_MASK (0x3f << 20)
+
+#define CDPHY_RX_ANA_4 0x0010
+#define RG_CSI0_L2P_T1B_HSRT_CODE_SHIFT 0
+#define RG_CSI0_L2P_T1B_HSRT_CODE_MASK (0x1f << 0)
+#define RG_CSI0_L2N_T1C_HSRT_CODE_SHIFT 8
+#define RG_CSI0_L2N_T1C_HSRT_CODE_MASK (0x1f << 8)
+
+#define CDPHY_RX_ANA_5 0x0014
+#define RG_CSI0_CDPHY_EQ_BW_SHIFT 0
+#define RG_CSI0_CDPHY_EQ_BW_MASK (0x3 << 0)
+#define RG_CSI0_CDPHY_EQ_IS_SHIFT 2
+#define RG_CSI0_CDPHY_EQ_IS_MASK (0x3 << 2)
+#define RG_CSI0_CDPHY_EQ_DG0_EN_SHIFT 4
+#define RG_CSI0_CDPHY_EQ_DG0_EN_MASK (0x1 << 4)
+#define RG_CSI0_CDPHY_EQ_DG1_EN_SHIFT 5
+#define RG_CSI0_CDPHY_EQ_DG1_EN_MASK (0x1 << 5)
+#define RG_CSI0_CDPHY_EQ_LATCH_EN_SHIFT 6
+#define RG_CSI0_CDPHY_EQ_LATCH_EN_MASK (0x1 << 6)
+#define RG_CSI0_CDPHY_EQ_SR0_SHIFT 8
+#define RG_CSI0_CDPHY_EQ_SR0_MASK (0xf << 8)
+#define RG_CSI0_CDPHY_EQ_SR1_SHIFT 12
+#define RG_CSI0_CDPHY_EQ_SR1_MASK (0xf << 12)
+#define RG_CSI0_L0_T0AB_EQ_MON_EN_SHIFT 16
+#define RG_CSI0_L0_T0AB_EQ_MON_EN_MASK (0x1 << 16)
+#define RG_CSI0_L1_T1AB_EQ_MON_EN_SHIFT 17
+#define RG_CSI0_L1_T1AB_EQ_MON_EN_MASK (0x1 << 17)
+#define RG_CSI0_L2_T1BC_EQ_MON_EN_SHIFT 18
+#define RG_CSI0_L2_T1BC_EQ_MON_EN_MASK (0x1 << 18)
+#define RG_CSI0_XX_T0BC_EQ_MON_EN_SHIFT 24
+#define RG_CSI0_XX_T0BC_EQ_MON_EN_MASK (0x1 << 24)
+#define RG_CSI0_XX_T0CA_EQ_MON_EN_SHIFT 25
+#define RG_CSI0_XX_T0CA_EQ_MON_EN_MASK (0x1 << 25)
+#define RG_CSI0_XX_T1CA_EQ_MON_EN_SHIFT 26
+#define RG_CSI0_XX_T1CA_EQ_MON_EN_MASK (0x1 << 26)
+
+#define CDPHY_RX_ANA_6 0x0018
+#define RG_CSI0_CPHY_T0_CDR_AB_WIDTH_SHIFT 0
+#define RG_CSI0_CPHY_T0_CDR_AB_WIDTH_MASK (0x3f << 0)
+#define RG_CSI0_CPHY_T0_CDR_BC_WIDTH_SHIFT 8
+#define RG_CSI0_CPHY_T0_CDR_BC_WIDTH_MASK (0x3f << 8)
+#define RG_CSI0_CPHY_T0_CDR_CA_WIDTH_SHIFT 16
+#define RG_CSI0_CPHY_T0_CDR_CA_WIDTH_MASK (0x3f << 16)
+#define RG_CSI0_CPHY_T0_CDR_CK_DELAY_SHIFT 24
+#define RG_CSI0_CPHY_T0_CDR_CK_DELAY_MASK (0x3f << 24)
+
+#define CDPHY_RX_ANA_7 0x001c
+#define RG_CSI0_CPHY_T1_CDR_AB_WIDTH_SHIFT 0
+#define RG_CSI0_CPHY_T1_CDR_AB_WIDTH_MASK (0x3f << 0)
+#define RG_CSI0_CPHY_T1_CDR_BC_WIDTH_SHIFT 8
+#define RG_CSI0_CPHY_T1_CDR_BC_WIDTH_MASK (0x3f << 8)
+#define RG_CSI0_CPHY_T1_CDR_CA_WIDTH_SHIFT 16
+#define RG_CSI0_CPHY_T1_CDR_CA_WIDTH_MASK (0x3f << 16)
+#define RG_CSI0_CPHY_T1_CDR_CK_DELAY_SHIFT 24
+#define RG_CSI0_CPHY_T1_CDR_CK_DELAY_MASK (0x3f << 24)
+
+#define CDPHY_RX_ANA_8 0x0020
+#define RGS_CSI0_CDPHY_L0_T0AB_OS_CAL_CPLT_SHIFT 0
+#define RGS_CSI0_CDPHY_L0_T0AB_OS_CAL_CPLT_MASK (0x1 << 0)
+#define RGS_CSI0_CDPHY_L1_T1AB_OS_CAL_CPLT_SHIFT 1
+#define RGS_CSI0_CDPHY_L1_T1AB_OS_CAL_CPLT_MASK (0x1 << 1)
+#define RGS_CSI0_CDPHY_L2_T1BC_OS_CAL_CPLT_SHIFT 2
+#define RGS_CSI0_CDPHY_L2_T1BC_OS_CAL_CPLT_MASK (0x1 << 2)
+#define RGS_CSI0_CPHY_T0BC_OS_CAL_CPLT_SHIFT 3
+#define RGS_CSI0_CPHY_T0BC_OS_CAL_CPLT_MASK (0x1 << 3)
+#define RGS_CSI0_CPHY_T0CA_OS_CAL_CPLT_SHIFT 4
+#define RGS_CSI0_CPHY_T0CA_OS_CAL_CPLT_MASK (0x1 << 4)
+#define RGS_CSI0_CPHY_T1CA_OS_CAL_CPLT_SHIFT 5
+#define RGS_CSI0_CPHY_T1CA_OS_CAL_CPLT_MASK (0x1 << 5)
+#define RGS_CSI0_OS_CAL_CODE_SHIFT 8
+#define RGS_CSI0_OS_CAL_CODE_MASK (0xff << 8)
+#define RG_CSI0_L0_T0AB_EQ_OS_CAL_EN_SHIFT 16
+#define RG_CSI0_L0_T0AB_EQ_OS_CAL_EN_MASK (0x1 << 16)
+#define RG_CSI0_L1_T1AB_EQ_OS_CAL_EN_SHIFT 17
+#define RG_CSI0_L1_T1AB_EQ_OS_CAL_EN_MASK (0x1 << 17)
+#define RG_CSI0_L2_T1BC_EQ_OS_CAL_EN_SHIFT 18
+#define RG_CSI0_L2_T1BC_EQ_OS_CAL_EN_MASK (0x1 << 18)
+#define RG_CSI0_XX_T0BC_EQ_OS_CAL_EN_SHIFT 19
+#define RG_CSI0_XX_T0BC_EQ_OS_CAL_EN_MASK (0x1 << 19)
+#define RG_CSI0_XX_T0CA_EQ_OS_CAL_EN_SHIFT 20
+#define RG_CSI0_XX_T0CA_EQ_OS_CAL_EN_MASK (0x1 << 20)
+#define RG_CSI0_XX_T1CA_EQ_OS_CAL_EN_SHIFT 21
+#define RG_CSI0_XX_T1CA_EQ_OS_CAL_EN_MASK (0x1 << 21)
+#define RG_CSI0_OS_CAL_SEL_SHIFT 24
+#define RG_CSI0_OS_CAL_SEL_MASK (0x7 << 24)
+#define RG_CSI0_OS_CAL_DIV_SHIFT 28
+#define RG_CSI0_OS_CAL_DIV_MASK (0x7 << 28)
+
+#define CDPHY_RX_ANA_9 0x0024
+#define RGS_CSI0_CPHY_T0_DLL_CODE_SHIFT 0
+#define RGS_CSI0_CPHY_T0_DLL_CODE_MASK (0xf << 0)
+#define RGS_CSI0_CPHY_T0_MASK_CAL_CPLT_SHIFT 4
+#define RGS_CSI0_CPHY_T0_MASK_CAL_CPLT_MASK (0x1 << 4)
+#define RGS_CSI0_CPHY_T0_MASK_CAL_OF_SHIFT 5
+#define RGS_CSI0_CPHY_T0_MASK_CAL_OF_MASK (0x1 << 5)
+#define RGS_CSI0_CPHY_T1_DLL_CODE_SHIFT 8
+#define RGS_CSI0_CPHY_T1_DLL_CODE_MASK (0xf << 8)
+#define RGS_CSI0_CPHY_T1_MASK_CAL_CPLT_SHIFT 12
+#define RGS_CSI0_CPHY_T1_MASK_CAL_CPLT_MASK (0x1 << 12)
+#define RGS_CSI0_CPHY_T1_MASK_CAL_OF_SHIFT 13
+#define RGS_CSI0_CPHY_T1_MASK_CAL_OF_MASK (0x1 << 13)
+#define RG_CSI0_RESERVE_SHIFT 16
+#define RG_CSI0_RESERVE_MASK (0xffff << 16)
+
+#define CDPHY_RX_ANA_AD_0 0x0048
+#define RO_AD_CSI0_CDPHY_L0P_T0A_LPRX_OUT_SHIFT 0
+#define RO_AD_CSI0_CDPHY_L0P_T0A_LPRX_OUT_MASK (0x1 << 0)
+#define RO_AD_CSI0_CDPHY_L0N_T0B_LPRX_OUT_SHIFT 1
+#define RO_AD_CSI0_CDPHY_L0N_T0B_LPRX_OUT_MASK (0x1 << 1)
+#define RO_AD_CSI0_CDPHY_L1P_T0C_LPRX_OUT_SHIFT 4
+#define RO_AD_CSI0_CDPHY_L1P_T0C_LPRX_OUT_MASK (0x1 << 4)
+#define RO_AD_CSI0_CDPHY_L1N_T1A_LPRX_OUT_SHIFT 5
+#define RO_AD_CSI0_CDPHY_L1N_T1A_LPRX_OUT_MASK (0x1 << 5)
+#define RO_AD_CSI0_CDPHY_L2P_T1B_LPRX_OUT_SHIFT 8
+#define RO_AD_CSI0_CDPHY_L2P_T1B_LPRX_OUT_MASK (0x1 << 8)
+#define RO_AD_CSI0_CDPHY_L2N_T1C_LPRX_OUT_SHIFT 9
+#define RO_AD_CSI0_CDPHY_L2N_T1C_LPRX_OUT_MASK (0x1 << 9)
+
+#define CDPHY_RX_ANA_AD_HS_0 0x00a0
+#define RO_AD_CSI0_CPHY_T0CA_SHIFT 0
+#define RO_AD_CSI0_CPHY_T0CA_MASK (0xff << 0)
+#define RO_AD_CSI0_CPHY_T0BC_SHIFT 8
+#define RO_AD_CSI0_CPHY_T0BC_MASK (0xff << 8)
+#define RO_AD_CSI0_CDPHY_L0_T0AB_SHIFT 16
+#define RO_AD_CSI0_CDPHY_L0_T0AB_MASK (0xff << 16)
+
+#define CDPHY_RX_ANA_AD_HS_1 0x00a4
+#define RO_AD_CSI0_DPHY_L1_SHIFT 16
+#define RO_AD_CSI0_DPHY_L1_MASK (0xff << 16)
+
+#define CDPHY_RX_ANA_AD_HS_2 0x00a8
+#define RO_AD_CSI0_CPHY_T1CA_SHIFT 8
+#define RO_AD_CSI0_CPHY_T1CA_MASK (0xff << 8)
+#define RO_AD_CSI0_CDPHY_L2_T1BC_SHIFT 16
+#define RO_AD_CSI0_CDPHY_L2_T1BC_MASK (0xff << 16)
+#define RO_AD_CSI0_CPHY_T1AB_SHIFT 24
+#define RO_AD_CSI0_CPHY_T1AB_MASK (0xff << 24)
+
+#define CDPHY_RX_ANA_SETTING_0 0x00f0
+#define CSR_CSI_CLK_MON_SHIFT 0
+#define CSR_CSI_CLK_MON_MASK (0x1 << 0)
+#define CSR_CSI_CLK_EN_SHIFT 1
+#define CSR_CSI_CLK_EN_MASK (0x1 << 1)
+#define CSR_ASYNC_FIFO_GATING_SEL_SHIFT 4
+#define CSR_ASYNC_FIFO_GATING_SEL_MASK (0xf << 4)
+#define CSR_CSI_MON_MUX_SHIFT 8
+#define CSR_CSI_MON_MUX_MASK (0xff << 8)
+#define CSR_CSI_RST_MODE_SHIFT 16
+#define CSR_CSI_RST_MODE_MASK (0x3 << 16)
+#define CSR_SW_RST_SHIFT 24
+#define CSR_SW_RST_MASK (0xf << 24)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
new file mode 100644
index 000000000000..1421f0baa419
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
@@ -0,0 +1,415 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF1_CSI2_H__
+#define __SENINF1_CSI2_H__
+
+#define SENINF_CSI2_EN 0x0000
+#define CSI2_LANE0_EN_SHIFT 0
+#define CSI2_LANE0_EN_MASK (0x1 << 0)
+#define CSI2_LANE1_EN_SHIFT 1
+#define CSI2_LANE1_EN_MASK (0x1 << 1)
+#define CSI2_LANE2_EN_SHIFT 2
+#define CSI2_LANE2_EN_MASK (0x1 << 2)
+#define CSI2_LANE3_EN_SHIFT 3
+#define CSI2_LANE3_EN_MASK (0x1 << 3)
+
+#define SENINF_CSI2_OPT 0x0004
+#define RG_CSI2_CPHY_SEL_SHIFT 0
+#define RG_CSI2_CPHY_SEL_MASK (0x1 << 0)
+#define RG_CSI2_ECC_EN_SHIFT 1
+#define RG_CSI2_ECC_EN_MASK (0x1 << 1)
+#define RG_CSI2_B2P_EN_SHIFT 2
+#define RG_CSI2_B2P_EN_MASK (0x1 << 2)
+#define RG_CSI2_GENERIC_LONG_PACKET_EN_SHIFT 3
+#define RG_CSI2_GENERIC_LONG_PACKET_EN_MASK (0x1 << 3)
+#define RG_CSI2_IMG_PACKET_EN_SHIFT 4
+#define RG_CSI2_IMG_PACKET_EN_MASK (0x1 << 4)
+#define RG_CSI2_SPEC_V2P0_SEL_SHIFT 5
+#define RG_CSI2_SPEC_V2P0_SEL_MASK (0x1 << 5)
+#define RG_CSI2_DESCRAMBLE_EN_SHIFT 6
+#define RG_CSI2_DESCRAMBLE_EN_MASK (0x1 << 6)
+#define RG_CSI2_VS_OUTPUT_MODE_SHIFT 8
+#define RG_CSI2_VS_OUTPUT_MODE_MASK (0x1 << 8)
+#define RG_CSI2_VS_OUTPUT_LEN_SEL_SHIFT 9
+#define RG_CSI2_VS_OUTPUT_LEN_SEL_MASK (0x1 << 9)
+#define RG_CSI2_HSYNC_POL_SHIFT 12
+#define RG_CSI2_HSYNC_POL_MASK (0x1 << 12)
+#define RG_CSI2_VSYNC_POL_SHIFT 13
+#define RG_CSI2_VSYNC_POL_MASK (0x1 << 13)
+#define RG_CSI2_FIFO_PUSH_EN_SHIFT 16
+#define RG_CSI2_FIFO_PUSH_EN_MASK (0x3f << 16)
+
+#define SENINF_CSI2_HDR_MODE_0 0x0008
+#define RG_CSI2_HEADER_MODE_SHIFT 0
+#define RG_CSI2_HEADER_MODE_MASK (0xff << 0)
+#define RG_CSI2_HEADER_LEN_SHIFT 8
+#define RG_CSI2_HEADER_LEN_MASK (0x7 << 8)
+
+#define SENINF_CSI2_RESYNC_MERGE_CTRL 0x0010
+#define RG_CSI2_RESYNC_CYCLE_CNT_SHIFT 0
+#define RG_CSI2_RESYNC_CYCLE_CNT_MASK (0x1f << 0)
+#define RG_CSI2_RESYNC_CYCLE_CNT_OPT_SHIFT 8
+#define RG_CSI2_RESYNC_CYCLE_CNT_OPT_MASK (0x1 << 8)
+#define RG_CSI2_RESYNC_DATAOUT_OPT_SHIFT 9
+#define RG_CSI2_RESYNC_DATAOUT_OPT_MASK (0x1 << 9)
+#define RG_CSI2_RESYNC_BYPASS_SHIFT 10
+#define RG_CSI2_RESYNC_BYPASS_MASK (0x1 << 10)
+
+#define RG_CSI2_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_VC_SEL_SHIFT 8
+#define RG_CSI2_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_DT_SEL_SHIFT 16
+#define RG_CSI2_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S0_DI_CTRL 0x0020
+#define RG_CSI2_S0_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S0_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S0_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S0_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S0_VC_SEL_SHIFT 8
+#define RG_CSI2_S0_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S0_DT_SEL_SHIFT 16
+#define RG_CSI2_S0_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S1_DI_CTRL 0x0024
+#define RG_CSI2_S1_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S1_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S1_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S1_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S1_VC_SEL_SHIFT 8
+#define RG_CSI2_S1_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S1_DT_SEL_SHIFT 16
+#define RG_CSI2_S1_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S2_DI_CTRL 0x0028
+#define RG_CSI2_S2_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S2_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S2_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S2_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S2_VC_SEL_SHIFT 8
+#define RG_CSI2_S2_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S2_DT_SEL_SHIFT 16
+#define RG_CSI2_S2_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S3_DI_CTRL 0x002c
+#define RG_CSI2_S3_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S3_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S3_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S3_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S3_VC_SEL_SHIFT 8
+#define RG_CSI2_S3_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S3_DT_SEL_SHIFT 16
+#define RG_CSI2_S3_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S4_DI_CTRL 0x0030
+#define RG_CSI2_S4_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S4_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S4_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S4_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S4_VC_SEL_SHIFT 8
+#define RG_CSI2_S4_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S4_DT_SEL_SHIFT 16
+#define RG_CSI2_S4_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S5_DI_CTRL 0x0034
+#define RG_CSI2_S5_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S5_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S5_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S5_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S5_VC_SEL_SHIFT 8
+#define RG_CSI2_S5_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S5_DT_SEL_SHIFT 16
+#define RG_CSI2_S5_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S6_DI_CTRL 0x0038
+#define RG_CSI2_S6_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S6_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S6_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S6_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S6_VC_SEL_SHIFT 8
+#define RG_CSI2_S6_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S6_DT_SEL_SHIFT 16
+#define RG_CSI2_S6_DT_SEL_MASK (0x3f << 16)
+
+#define SENINF_CSI2_S7_DI_CTRL 0x003c
+#define RG_CSI2_S7_VC_INTERLEAVE_EN_SHIFT 0
+#define RG_CSI2_S7_VC_INTERLEAVE_EN_MASK (0x1 << 0)
+#define RG_CSI2_S7_DT_INTERLEAVE_MODE_SHIFT 4
+#define RG_CSI2_S7_DT_INTERLEAVE_MODE_MASK (0x3 << 4)
+#define RG_CSI2_S7_VC_SEL_SHIFT 8
+#define RG_CSI2_S7_VC_SEL_MASK (0x1f << 8)
+#define RG_CSI2_S7_DT_SEL_SHIFT 16
+#define RG_CSI2_S7_DT_SEL_MASK (0x3f << 16)
+
+#define RG_CSI2_GRP_MODE_SHIFT 0
+#define RG_CSI2_GRP_MODE_MASK (0x1 << 0)
+#define RG_CSI2_VSYNC_BYPASS_SHIFT 1
+#define RG_CSI2_VSYNC_BYPASS_MASK (0x1 << 1)
+#define RG_CSI2_S0_GRP_EN_SHIFT 8
+#define RG_CSI2_S0_GRP_EN_MASK (0x1 << 8)
+#define RG_CSI2_S1_GRP_EN_SHIFT 9
+#define RG_CSI2_S1_GRP_EN_MASK (0x1 << 9)
+#define RG_CSI2_S2_GRP_EN_SHIFT 10
+#define RG_CSI2_S2_GRP_EN_MASK (0x1 << 10)
+#define RG_CSI2_S3_GRP_EN_SHIFT 11
+#define RG_CSI2_S3_GRP_EN_MASK (0x1 << 11)
+#define RG_CSI2_S4_GRP_EN_SHIFT 12
+#define RG_CSI2_S4_GRP_EN_MASK (0x1 << 12)
+#define RG_CSI2_S5_GRP_EN_SHIFT 13
+#define RG_CSI2_S5_GRP_EN_MASK (0x1 << 13)
+#define RG_CSI2_S6_GRP_EN_SHIFT 14
+#define RG_CSI2_S6_GRP_EN_MASK (0x1 << 14)
+#define RG_CSI2_S7_GRP_EN_SHIFT 15
+#define RG_CSI2_S7_GRP_EN_MASK (0x1 << 15)
+
+#define SENINF_CSI2_CH0_CTRL 0x0060
+#define RG_CSI2_CH0_GRP_MODE_SHIFT 0
+#define RG_CSI2_CH0_GRP_MODE_MASK (0x1 << 0)
+#define RG_CSI2_CH0_VSYNC_BYPASS_SHIFT 1
+#define RG_CSI2_CH0_VSYNC_BYPASS_MASK (0x1 << 1)
+#define RG_CSI2_CH0_S0_GRP_EN_SHIFT 8
+#define RG_CSI2_CH0_S0_GRP_EN_MASK (0x1 << 8)
+#define RG_CSI2_CH0_S1_GRP_EN_SHIFT 9
+#define RG_CSI2_CH0_S1_GRP_EN_MASK (0x1 << 9)
+#define RG_CSI2_CH0_S2_GRP_EN_SHIFT 10
+#define RG_CSI2_CH0_S2_GRP_EN_MASK (0x1 << 10)
+#define RG_CSI2_CH0_S3_GRP_EN_SHIFT 11
+#define RG_CSI2_CH0_S3_GRP_EN_MASK (0x1 << 11)
+#define RG_CSI2_CH0_S4_GRP_EN_SHIFT 12
+#define RG_CSI2_CH0_S4_GRP_EN_MASK (0x1 << 12)
+#define RG_CSI2_CH0_S5_GRP_EN_SHIFT 13
+#define RG_CSI2_CH0_S5_GRP_EN_MASK (0x1 << 13)
+#define RG_CSI2_CH0_S6_GRP_EN_SHIFT 14
+#define RG_CSI2_CH0_S6_GRP_EN_MASK (0x1 << 14)
+#define RG_CSI2_CH0_S7_GRP_EN_SHIFT 15
+#define RG_CSI2_CH0_S7_GRP_EN_MASK (0x1 << 15)
+
+#define SENINF_CSI2_CH1_CTRL 0x0064
+#define RG_CSI2_CH1_GRP_MODE_SHIFT 0
+#define RG_CSI2_CH1_GRP_MODE_MASK (0x1 << 0)
+#define RG_CSI2_CH1_VSYNC_BYPASS_SHIFT 1
+#define RG_CSI2_CH1_VSYNC_BYPASS_MASK (0x1 << 1)
+#define RG_CSI2_CH1_S0_GRP_EN_SHIFT 8
+#define RG_CSI2_CH1_S0_GRP_EN_MASK (0x1 << 8)
+#define RG_CSI2_CH1_S1_GRP_EN_SHIFT 9
+#define RG_CSI2_CH1_S1_GRP_EN_MASK (0x1 << 9)
+#define RG_CSI2_CH1_S2_GRP_EN_SHIFT 10
+#define RG_CSI2_CH1_S2_GRP_EN_MASK (0x1 << 10)
+#define RG_CSI2_CH1_S3_GRP_EN_SHIFT 11
+#define RG_CSI2_CH1_S3_GRP_EN_MASK (0x1 << 11)
+#define RG_CSI2_CH1_S4_GRP_EN_SHIFT 12
+#define RG_CSI2_CH1_S4_GRP_EN_MASK (0x1 << 12)
+#define RG_CSI2_CH1_S5_GRP_EN_SHIFT 13
+#define RG_CSI2_CH1_S5_GRP_EN_MASK (0x1 << 13)
+#define RG_CSI2_CH1_S6_GRP_EN_SHIFT 14
+#define RG_CSI2_CH1_S6_GRP_EN_MASK (0x1 << 14)
+#define RG_CSI2_CH1_S7_GRP_EN_SHIFT 15
+#define RG_CSI2_CH1_S7_GRP_EN_MASK (0x1 << 15)
+
+#define SENINF_CSI2_CH2_CTRL 0x0068
+#define RG_CSI2_CH2_GRP_MODE_SHIFT 0
+#define RG_CSI2_CH2_GRP_MODE_MASK (0x1 << 0)
+#define RG_CSI2_CH2_VSYNC_BYPASS_SHIFT 1
+#define RG_CSI2_CH2_VSYNC_BYPASS_MASK (0x1 << 1)
+#define RG_CSI2_CH2_S0_GRP_EN_SHIFT 8
+#define RG_CSI2_CH2_S0_GRP_EN_MASK (0x1 << 8)
+#define RG_CSI2_CH2_S1_GRP_EN_SHIFT 9
+#define RG_CSI2_CH2_S1_GRP_EN_MASK (0x1 << 9)
+#define RG_CSI2_CH2_S2_GRP_EN_SHIFT 10
+#define RG_CSI2_CH2_S2_GRP_EN_MASK (0x1 << 10)
+#define RG_CSI2_CH2_S3_GRP_EN_SHIFT 11
+#define RG_CSI2_CH2_S3_GRP_EN_MASK (0x1 << 11)
+#define RG_CSI2_CH2_S4_GRP_EN_SHIFT 12
+#define RG_CSI2_CH2_S4_GRP_EN_MASK (0x1 << 12)
+#define RG_CSI2_CH2_S5_GRP_EN_SHIFT 13
+#define RG_CSI2_CH2_S5_GRP_EN_MASK (0x1 << 13)
+#define RG_CSI2_CH2_S6_GRP_EN_SHIFT 14
+#define RG_CSI2_CH2_S6_GRP_EN_MASK (0x1 << 14)
+#define RG_CSI2_CH2_S7_GRP_EN_SHIFT 15
+#define RG_CSI2_CH2_S7_GRP_EN_MASK (0x1 << 15)
+
+#define SENINF_CSI2_CH3_CTRL 0x006c
+#define RG_CSI2_CH3_GRP_MODE_SHIFT 0
+#define RG_CSI2_CH3_GRP_MODE_MASK (0x1 << 0)
+#define RG_CSI2_CH3_VSYNC_BYPASS_SHIFT 1
+#define RG_CSI2_CH3_VSYNC_BYPASS_MASK (0x1 << 1)
+#define RG_CSI2_CH3_S0_GRP_EN_SHIFT 8
+#define RG_CSI2_CH3_S0_GRP_EN_MASK (0x1 << 8)
+#define RG_CSI2_CH3_S1_GRP_EN_SHIFT 9
+#define RG_CSI2_CH3_S1_GRP_EN_MASK (0x1 << 9)
+#define RG_CSI2_CH3_S2_GRP_EN_SHIFT 10
+#define RG_CSI2_CH3_S2_GRP_EN_MASK (0x1 << 10)
+#define RG_CSI2_CH3_S3_GRP_EN_SHIFT 11
+#define RG_CSI2_CH3_S3_GRP_EN_MASK (0x1 << 11)
+#define RG_CSI2_CH3_S4_GRP_EN_SHIFT 12
+#define RG_CSI2_CH3_S4_GRP_EN_MASK (0x1 << 12)
+#define RG_CSI2_CH3_S5_GRP_EN_SHIFT 13
+#define RG_CSI2_CH3_S5_GRP_EN_MASK (0x1 << 13)
+#define RG_CSI2_CH3_S6_GRP_EN_SHIFT 14
+#define RG_CSI2_CH3_S6_GRP_EN_MASK (0x1 << 14)
+#define RG_CSI2_CH3_S7_GRP_EN_SHIFT 15
+#define RG_CSI2_CH3_S7_GRP_EN_MASK (0x1 << 15)
+
+#define SENINF_CSI2_IRQ_EN 0x00c0
+#define RG_CSI2_ERR_FRAME_SYNC_IRQ_EN_SHIFT 0
+#define RG_CSI2_ERR_FRAME_SYNC_IRQ_EN_MASK (0x1 << 0)
+#define RG_CSI2_ERR_ID_IRQ_EN_SHIFT 1
+#define RG_CSI2_ERR_ID_IRQ_EN_MASK (0x1 << 1)
+#define RG_CSI2_ECC_ERR_UNDETECTED_IRQ_EN_SHIFT 2
+#define RG_CSI2_ECC_ERR_UNDETECTED_IRQ_EN_MASK (0x1 << 2)
+#define RG_CSI2_ECC_ERR_CORRECTED_IRQ_EN_SHIFT 3
+#define RG_CSI2_ECC_ERR_CORRECTED_IRQ_EN_MASK (0x1 << 3)
+#define RG_CSI2_ECC_ERR_DOUBLE_IRQ_EN_SHIFT 4
+#define RG_CSI2_ECC_ERR_DOUBLE_IRQ_EN_MASK (0x1 << 4)
+#define RG_CSI2_CRC_CORRECT_IRQ_EN_SHIFT 5
+#define RG_CSI2_CRC_CORRECT_IRQ_EN_MASK (0x1 << 5)
+#define RG_CSI2_CRC_ERR_IRQ_EN_SHIFT 6
+#define RG_CSI2_CRC_ERR_IRQ_EN_MASK (0x1 << 6)
+#define RG_CSI2_ERR_MULTI_LANE_SYNC_IRQ_EN_SHIFT 7
+#define RG_CSI2_ERR_MULTI_LANE_SYNC_IRQ_EN_MASK (0x1 << 7)
+#define RG_CSI2_FS_RECEIVE_IRQ_EN_SHIFT 8
+#define RG_CSI2_FS_RECEIVE_IRQ_EN_MASK (0x1 << 8)
+#define RG_CSI2_FE_RECEIVE_IRQ_EN_SHIFT 9
+#define RG_CSI2_FE_RECEIVE_IRQ_EN_MASK (0x1 << 9)
+#define RG_CSI2_LS_RECEIVE_IRQ_EN_SHIFT 10
+#define RG_CSI2_LS_RECEIVE_IRQ_EN_MASK (0x1 << 10)
+#define RG_CSI2_LE_RECEIVE_IRQ_EN_SHIFT 11
+#define RG_CSI2_LE_RECEIVE_IRQ_EN_MASK (0x1 << 11)
+#define RG_CSI2_GS_RECEIVE_IRQ_EN_SHIFT 12
+#define RG_CSI2_GS_RECEIVE_IRQ_EN_MASK (0x1 << 12)
+#define RG_CSI2_ERR_LANE_RESYNC_IRQ_EN_SHIFT 13
+#define RG_CSI2_ERR_LANE_RESYNC_IRQ_EN_MASK (0x1 << 13)
+#define RG_CSI2_LANE_MERGE_FIFO_AF_IRQ_EN_SHIFT 14
+#define RG_CSI2_LANE_MERGE_FIFO_AF_IRQ_EN_MASK (0x1 << 14)
+#define RG_CSI2_ERR_FRAME_SYNC_S0_IRQ_EN_SHIFT 16
+#define RG_CSI2_ERR_FRAME_SYNC_S0_IRQ_EN_MASK (0x1 << 16)
+#define RG_CSI2_ERR_FRAME_SYNC_S1_IRQ_EN_SHIFT 17
+#define RG_CSI2_ERR_FRAME_SYNC_S1_IRQ_EN_MASK (0x1 << 17)
+#define RG_CSI2_ERR_FRAME_SYNC_S2_IRQ_EN_SHIFT 18
+#define RG_CSI2_ERR_FRAME_SYNC_S2_IRQ_EN_MASK (0x1 << 18)
+#define RG_CSI2_ERR_FRAME_SYNC_S3_IRQ_EN_SHIFT 19
+#define RG_CSI2_ERR_FRAME_SYNC_S3_IRQ_EN_MASK (0x1 << 19)
+#define RG_CSI2_ERR_FRAME_SYNC_S4_IRQ_EN_SHIFT 20
+#define RG_CSI2_ERR_FRAME_SYNC_S4_IRQ_EN_MASK (0x1 << 20)
+#define RG_CSI2_ERR_FRAME_SYNC_S5_IRQ_EN_SHIFT 21
+#define RG_CSI2_ERR_FRAME_SYNC_S5_IRQ_EN_MASK (0x1 << 21)
+#define RG_CSI2_ERR_FRAME_SYNC_S6_IRQ_EN_SHIFT 22
+#define RG_CSI2_ERR_FRAME_SYNC_S6_IRQ_EN_MASK (0x1 << 22)
+#define RG_CSI2_ERR_FRAME_SYNC_S7_IRQ_EN_SHIFT 23
+#define RG_CSI2_ERR_FRAME_SYNC_S7_IRQ_EN_MASK (0x1 << 23)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L0_IRQ_EN_SHIFT 24
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L0_IRQ_EN_MASK (0x1 << 24)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L1_IRQ_EN_SHIFT 25
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L1_IRQ_EN_MASK (0x1 << 25)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L2_IRQ_EN_SHIFT 26
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L2_IRQ_EN_MASK (0x1 << 26)
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L3_IRQ_EN_SHIFT 27
+#define RG_CSI2_RESYNC_FIFO_OVERFLOW_L3_IRQ_EN_MASK (0x1 << 27)
+#define RG_CSI2_ASYNC_FIFO_OVERRUN_IRQ_EN_SHIFT 28
+#define RG_CSI2_ASYNC_FIFO_OVERRUN_IRQ_EN_MASK (0x1 << 28)
+#define RG_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_EN_SHIFT 29
+#define RG_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_EN_MASK (0x1 << 29)
+#define RG_CSI2_IRQ_CLR_MODE_SHIFT 31
+#define RG_CSI2_IRQ_CLR_MODE_MASK (0x1 << 31)
+
+#define SENINF_CSI2_IRQ_STATUS 0x00c8
+#define RO_CSI2_ERR_FRAME_SYNC_IRQ_SHIFT 0
+#define RO_CSI2_ERR_FRAME_SYNC_IRQ_MASK (0x1 << 0)
+#define RO_CSI2_ERR_ID_IRQ_SHIFT 1
+#define RO_CSI2_ERR_ID_IRQ_MASK (0x1 << 1)
+#define RO_CSI2_ECC_ERR_UNDETECTED_IRQ_SHIFT 2
+#define RO_CSI2_ECC_ERR_UNDETECTED_IRQ_MASK (0x1 << 2)
+#define RO_CSI2_ECC_ERR_CORRECTED_IRQ_SHIFT 3
+#define RO_CSI2_ECC_ERR_CORRECTED_IRQ_MASK (0x1 << 3)
+#define RO_CSI2_ECC_ERR_DOUBLE_IRQ_SHIFT 4
+#define RO_CSI2_ECC_ERR_DOUBLE_IRQ_MASK (0x1 << 4)
+#define RO_CSI2_CRC_CORRECT_IRQ_SHIFT 5
+#define RO_CSI2_CRC_CORRECT_IRQ_MASK (0x1 << 5)
+#define RO_CSI2_CRC_ERR_IRQ_SHIFT 6
+#define RO_CSI2_CRC_ERR_IRQ_MASK (0x1 << 6)
+#define RO_CSI2_ERR_MULTI_LANE_SYNC_IRQ_SHIFT 7
+#define RO_CSI2_ERR_MULTI_LANE_SYNC_IRQ_MASK (0x1 << 7)
+#define RO_CSI2_FS_RECEIVE_IRQ_SHIFT 8
+#define RO_CSI2_FS_RECEIVE_IRQ_MASK (0x1 << 8)
+#define RO_CSI2_FE_RECEIVE_IRQ_SHIFT 9
+#define RO_CSI2_FE_RECEIVE_IRQ_MASK (0x1 << 9)
+#define RO_CSI2_LS_RECEIVE_IRQ_SHIFT 10
+#define RO_CSI2_LS_RECEIVE_IRQ_MASK (0x1 << 10)
+#define RO_CSI2_LE_RECEIVE_IRQ_SHIFT 11
+#define RO_CSI2_LE_RECEIVE_IRQ_MASK (0x1 << 11)
+#define RO_CSI2_GS_RECEIVE_IRQ_SHIFT 12
+#define RO_CSI2_GS_RECEIVE_IRQ_MASK (0x1 << 12)
+#define RO_CSI2_ERR_LANE_RESYNC_IRQ_SHIFT 13
+#define RO_CSI2_ERR_LANE_RESYNC_IRQ_MASK (0x1 << 13)
+#define RO_CSI2_LANE_MERGE_FIFO_AF_IRQ_SHIFT 14
+#define RO_CSI2_LANE_MERGE_FIFO_AF_IRQ_MASK (0x1 << 14)
+#define RO_CSI2_ERR_FRAME_SYNC_S0_IRQ_SHIFT 16
+#define RO_CSI2_ERR_FRAME_SYNC_S0_IRQ_MASK (0x1 << 16)
+#define RO_CSI2_ERR_FRAME_SYNC_S1_IRQ_SHIFT 17
+#define RO_CSI2_ERR_FRAME_SYNC_S1_IRQ_MASK (0x1 << 17)
+#define RO_CSI2_ERR_FRAME_SYNC_S2_IRQ_SHIFT 18
+#define RO_CSI2_ERR_FRAME_SYNC_S2_IRQ_MASK (0x1 << 18)
+#define RO_CSI2_ERR_FRAME_SYNC_S3_IRQ_SHIFT 19
+#define RO_CSI2_ERR_FRAME_SYNC_S3_IRQ_MASK (0x1 << 19)
+#define RO_CSI2_ERR_FRAME_SYNC_S4_IRQ_SHIFT 20
+#define RO_CSI2_ERR_FRAME_SYNC_S4_IRQ_MASK (0x1 << 20)
+#define RO_CSI2_ERR_FRAME_SYNC_S5_IRQ_SHIFT 21
+#define RO_CSI2_ERR_FRAME_SYNC_S5_IRQ_MASK (0x1 << 21)
+#define RO_CSI2_ERR_FRAME_SYNC_S6_IRQ_SHIFT 22
+#define RO_CSI2_ERR_FRAME_SYNC_S6_IRQ_MASK (0x1 << 22)
+#define RO_CSI2_ERR_FRAME_SYNC_S7_IRQ_SHIFT 23
+#define RO_CSI2_ERR_FRAME_SYNC_S7_IRQ_MASK (0x1 << 23)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L0_IRQ_SHIFT 24
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L0_IRQ_MASK (0x1 << 24)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L1_IRQ_SHIFT 25
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L1_IRQ_MASK (0x1 << 25)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L2_IRQ_SHIFT 26
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L2_IRQ_MASK (0x1 << 26)
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L3_IRQ_SHIFT 27
+#define RO_CSI2_RESYNC_FIFO_OVERFLOW_L3_IRQ_MASK (0x1 << 27)
+#define RO_CSI2_ASYNC_FIFO_OVERRUN_IRQ_SHIFT 28
+#define RO_CSI2_ASYNC_FIFO_OVERRUN_IRQ_MASK (0x1 << 28)
+#define RO_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_SHIFT 29
+#define RO_CSI2_RECEIVE_DATA_NOT_ENOUGH_IRQ_MASK (0x1 << 29)
+
+#define SENINF_CSI2_LINE_FRAME_NUM 0x00d0
+#define RO_CSI2_LINE_NUM_SHIFT 0
+#define RO_CSI2_LINE_NUM_MASK (0xffff << 0)
+#define RO_CSI2_FRAME_NUM_SHIFT 16
+#define RO_CSI2_FRAME_NUM_MASK (0xffff << 16)
+
+#define SENINF_CSI2_PACKET_STATUS 0x00d4
+#define RO_CSI2_PACKET_DT_SHIFT 0
+#define RO_CSI2_PACKET_DT_MASK (0x3f << 0)
+#define RO_CSI2_PACKET_VC_SHIFT 8
+#define RO_CSI2_PACKET_VC_MASK (0x1f << 8)
+#define RO_CSI2_PACKET_WC_SHIFT 16
+#define RO_CSI2_PACKET_WC_MASK (0xffff << 16)
+
+#define SENINF_CSI2_GEN_SHORT_PACKET_STATUS 0x00d8
+#define RO_CSI2_GENERIC_SHORT_PACKET_DT_SHIFT 0
+#define RO_CSI2_GENERIC_SHORT_PACKET_DT_MASK (0x3f << 0)
+#define RO_CSI2_GENERIC_SHORT_PACKET_WC_SHIFT 16
+#define RO_CSI2_GENERIC_SHORT_PACKET_WC_MASK (0xffff << 16)
+
+#define SENINF_CSI2_PACKET_CNT_STATUS 0x00dc
+#define RO_CSI2_PACKET_CNT_SHIFT 0
+#define RO_CSI2_PACKET_CNT_MASK (0xffff << 0)
+#define RO_CSI2_PACKET_CNT_BUF_SHIFT 16
+#define RO_CSI2_PACKET_CNT_BUF_MASK (0xffff << 16)
+
+#define SENINF_CSI2_DBG_CTRL 0x00e0
+#define RG_CSI2_DBG_SEL_SHIFT 0
+#define RG_CSI2_DBG_SEL_MASK (0xff << 0)
+#define RG_CSI2_DBG_EN_SHIFT 16
+#define RG_CSI2_DBG_EN_MASK (0x1 << 16)
+#define RG_CSI2_DBG_PACKET_CNT_EN_SHIFT 17
+#define RG_CSI2_DBG_PACKET_CNT_EN_MASK (0x1 << 17)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
new file mode 100644
index 000000000000..696b39dc6c9a
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
@@ -0,0 +1,147 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF1_MUX_H__
+#define __SENINF1_MUX_H__
+
+#define SENINF_MUX_CTRL_0 0x0000
+#define SENINF_MUX_EN_SHIFT 0
+#define SENINF_MUX_EN_MASK (0x1 << 0)
+#define SENINF_MUX_IRQ_SW_RST_SHIFT 1
+#define SENINF_MUX_IRQ_SW_RST_MASK (0x1 << 1)
+#define SENINF_MUX_SW_RST_SHIFT 2
+#define SENINF_MUX_SW_RST_MASK (0x1 << 2)
+
+#define SENINF_MUX_CTRL_1 0x0004
+#define RG_SENINF_MUX_SRC_SEL_SHIFT 0
+#define RG_SENINF_MUX_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_MUX_PIX_MODE_SEL_SHIFT 8
+#define RG_SENINF_MUX_PIX_MODE_SEL_MASK (0x3 << 8)
+#define RG_SENINF_MUX_FIFO_PUSH_EN_SHIFT 16
+#define RG_SENINF_MUX_FIFO_PUSH_EN_MASK (0x3f << 16)
+#define RG_SENINF_MUX_RDY_FORCE_MODE_EN_SHIFT 24
+#define RG_SENINF_MUX_RDY_FORCE_MODE_EN_MASK (0x1 << 24)
+#define RG_SENINF_MUX_RDY_FORCE_MODE_VAL_SHIFT 25
+#define RG_SENINF_MUX_RDY_FORCE_MODE_VAL_MASK (0x1 << 25)
+#define RG_SENINF_MUX_CROP_EN_SHIFT 28
+#define RG_SENINF_MUX_CROP_EN_MASK (0x1 << 28)
+
+#define SENINF_MUX_OPT 0x0008
+#define RG_SENINF_MUX_CNT_INIT_OPT_SHIFT 0
+#define RG_SENINF_MUX_CNT_INIT_OPT_MASK (0x3 << 0)
+#define RG_SENINF_MUX_FIFO_FULL_OUTPUT_OPT_SHIFT 8
+#define RG_SENINF_MUX_FIFO_FULL_OUTPUT_OPT_MASK (0x3 << 8)
+#define RG_SENINF_MUX_FIFO_FULL_WR_MODE_SHIFT 10
+#define RG_SENINF_MUX_FIFO_FULL_WR_MODE_MASK (0x3 << 10)
+#define RG_SENINF_MUX_FIFO_OVERRUN_RST_EN_SHIFT 12
+#define RG_SENINF_MUX_FIFO_OVERRUN_RST_EN_MASK (0x1 << 12)
+#define RG_SENINF_MUX_HSYNC_POL_SHIFT 16
+#define RG_SENINF_MUX_HSYNC_POL_MASK (0x1 << 16)
+#define RG_SENINF_MUX_VSYNC_POL_SHIFT 17
+#define RG_SENINF_MUX_VSYNC_POL_MASK (0x1 << 17)
+
+#define SENINF_MUX_IRQ_EN 0x0010
+#define RG_SENINF_MUX_FIFO_OVERRUN_IRQ_EN_SHIFT 0
+#define RG_SENINF_MUX_FIFO_OVERRUN_IRQ_EN_MASK (0x1 << 0)
+#define RG_SENINF_MUX_FSM_ERR_IRQ_EN_SHIFT 1
+#define RG_SENINF_MUX_FSM_ERR_IRQ_EN_MASK (0x1 << 1)
+#define RG_SENINF_MUX_HSIZE_ERR_IRQ_EN_SHIFT 2
+#define RG_SENINF_MUX_HSIZE_ERR_IRQ_EN_MASK (0x1 << 2)
+#define RG_SENINF_MUX_VSIZE_ERR_IRQ_EN_SHIFT 3
+#define RG_SENINF_MUX_VSIZE_ERR_IRQ_EN_MASK (0x1 << 3)
+#define RG_SENINF_MUX_IRQ_CLR_MODE_SHIFT 31
+#define RG_SENINF_MUX_IRQ_CLR_MODE_MASK (0x1 << 31)
+
+#define SENINF_MUX_IRQ_STATUS 0x0018
+#define RO_SENINF_MUX_FIFO_OVERRUN_IRQ_SHIFT 0
+#define RO_SENINF_MUX_FIFO_OVERRUN_IRQ_MASK (0x1 << 0)
+#define RO_SENINF_MUX_FSM_ERR_IRQ_SHIFT 1
+#define RO_SENINF_MUX_FSM_ERR_IRQ_MASK (0x1 << 1)
+#define RO_SENINF_MUX_HSIZE_ERR_IRQ_SHIFT 2
+#define RO_SENINF_MUX_HSIZE_ERR_IRQ_MASK (0x1 << 2)
+#define RO_SENINF_MUX_VSIZE_ERR_IRQ_SHIFT 3
+#define RO_SENINF_MUX_VSIZE_ERR_IRQ_MASK (0x1 << 3)
+
+#define SENINF_MUX_IMG_SIZE 0x0020
+#define RG_SENINF_MUX_EXPECT_HSIZE_SHIFT 0
+#define RG_SENINF_MUX_EXPECT_HSIZE_MASK (0xffff << 0)
+#define RG_SENINF_MUX_EXPECT_VSIZE_SHIFT 16
+#define RG_SENINF_MUX_EXPECT_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_MUX_CROP_PIX_CTRL 0x0028
+#define RG_SENINF_MUX_CROP_START_8PIX_CNT_SHIFT 0
+#define RG_SENINF_MUX_CROP_START_8PIX_CNT_MASK (0xfff << 0)
+#define RG_SENINF_MUX_CROP_END_8PIX_CNT_SHIFT 16
+#define RG_SENINF_MUX_CROP_END_8PIX_CNT_MASK (0xfff << 16)
+
+#define SENINF_MUX_SIZE 0x0030
+#define RO_SENINF_MUX_RCV_HSIZE_SHIFT 0
+#define RO_SENINF_MUX_RCV_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_MUX_RCV_VSIZE_SHIFT 16
+#define RO_SENINF_MUX_RCV_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_MUX_ERR_SIZE 0x0034
+#define RO_SENINF_MUX_RCV_ERR_HSIZE_SHIFT 0
+#define RO_SENINF_MUX_RCV_ERR_HSIZE_MASK (0xffff << 0)
+#define RO_SENINF_MUX_RCV_ERR_VSIZE_SHIFT 16
+#define RO_SENINF_MUX_RCV_ERR_VSIZE_MASK (0xffff << 16)
+
+#define SENINF_MUX_FIFO_STATUS 0x0040
+#define RO_SENINF_MUX_FIFO_WA_SHIFT 0
+#define RO_SENINF_MUX_FIFO_WA_MASK (0x1ff << 0)
+#define RO_SENINF_MUX_FIFO_WCS_SHIFT 12
+#define RO_SENINF_MUX_FIFO_WCS_MASK (0x1 << 12)
+#define RO_SENINF_MUX_FIFO_RA_SHIFT 16
+#define RO_SENINF_MUX_FIFO_RA_MASK (0x1ff << 16)
+#define RO_SENINF_MUX_FIFO_RCS_SHIFT 28
+#define RO_SENINF_MUX_FIFO_RCS_MASK (0x1 << 28)
+
+#define SENINF_MUX_DBG_CTRL 0x0080
+#define RG_SENINF_MUX_DBG_EN_SHIFT 0
+#define RG_SENINF_MUX_DBG_EN_MASK (0x1 << 0)
+#define RG_SENINF_MUX_DBG_SEL_SHIFT 8
+#define RG_SENINF_MUX_DBG_SEL_MASK (0xff << 8)
+
+#define SENINF_MUX_DBG_OUT 0x0088
+#define RO_SENINF_MUX_DBG_OUT_SHIFT 0
+#define RO_SENINF_MUX_DBG_OUT_MASK (0xffffffff << 0)
+
+#define SENINF_MUX_CAM_MON 0x00a0
+#define RO_SENINF_MUX_CAM_MON_0_SHIFT 0
+#define RO_SENINF_MUX_CAM_MON_0_MASK (0xffff << 0)
+#define RO_SENINF_MUX_CAM_MON_1_SHIFT 16
+#define RO_SENINF_MUX_CAM_MON_1_MASK (0xffff << 16)
+
+#define SENINF_MUX_PIX_CNT 0x00a4
+#define RO_SENINF_MUX_PIX_CNT_SHIFT 0
+#define RO_SENINF_MUX_PIX_CNT_MASK (0xffffffff << 0)
+
+#define SENINF_MUX_FRAME_SIZE_MON_CTRL 0x00a8
+#define RG_SENINF_MUX_FRAME_SIZE_MON_EN_SHIFT 0
+#define RG_SENINF_MUX_FRAME_SIZE_MON_EN_MASK (0x1 << 0)
+
+#define SENINF_MUX_FRAME_SIZE_MON_H_VALID 0x00b0
+#define RO_SENINF_MUX_FRAME_H_VALID_SHIFT 0
+#define RO_SENINF_MUX_FRAME_H_VALID_MASK (0xffffffff << 0)
+
+#define SENINF_MUX_FRAME_SIZE_MON_H_BLANK 0x00b4
+#define RO_SENINF_MUX_FRAME_H_BLANK_SHIFT 0
+#define RO_SENINF_MUX_FRAME_H_BLANK_MASK (0xffffffff << 0)
+
+#define SENINF_MUX_FRAME_SIZE_MON_V_VALID 0x00b8
+#define RO_SENINF_MUX_FRAME_V_VALID_SHIFT 0
+#define RO_SENINF_MUX_FRAME_V_VALID_MASK (0xffffffff << 0)
+
+#define SENINF_MUX_FRAME_SIZE_MON_V_BLANK 0x00bc
+#define RO_SENINF_MUX_FRAME_V_BLANK_SHIFT 0
+#define RO_SENINF_MUX_FRAME_V_BLANK_MASK (0xffffffff << 0)
+
+#define SENINF_MUX_SPARE 0x00f0
+#define RG_SENINF_MUX_SPARE_0_SHIFT 0
+#define RG_SENINF_MUX_SPARE_0_MASK (0xff << 0)
+#define RG_SENINF_MUX_SPARE_1_SHIFT 16
+#define RG_SENINF_MUX_SPARE_1_MASK (0xff << 16)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
new file mode 100644
index 000000000000..4d021906ba07
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h
@@ -0,0 +1,47 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF1_H__
+#define __SENINF1_H__
+
+#define SENINF_CTRL 0x0000
+#define SENINF_EN_SHIFT 0
+#define SENINF_EN_MASK (0x1 << 0)
+
+#define SENINF_DBG 0x0004
+#define RG_SENINF_DBG_SEL_SHIFT 0
+#define RG_SENINF_DBG_SEL_MASK (0xf << 0)
+
+#define SENINF_CSI2_CTRL 0x0010
+#define RG_SENINF_CSI2_EN_SHIFT 0
+#define RG_SENINF_CSI2_EN_MASK (0x1 << 0)
+#define SENINF_CSI2_SW_RST_SHIFT 4
+#define SENINF_CSI2_SW_RST_MASK (0x1 << 4)
+
+#define SENINF_TESTMDL_CTRL 0x0020
+#define RG_SENINF_TESTMDL_EN_SHIFT 0
+#define RG_SENINF_TESTMDL_EN_MASK (0x1 << 0)
+#define SENINF_TESTMDL_SW_RST_SHIFT 4
+#define SENINF_TESTMDL_SW_RST_MASK (0x1 << 4)
+
+#define SENINF_TG_CTRL 0x0030
+#define SENINF_TG_SW_RST_SHIFT 4
+#define SENINF_TG_SW_RST_MASK (0x1 << 4)
+
+#define SENINF_SCAM_CTRL 0x0040
+#define RG_SENINF_SCAM_EN_SHIFT 0
+#define RG_SENINF_SCAM_EN_MASK (0x1 << 0)
+#define SENINF_SCAM_SW_RST_SHIFT 4
+#define SENINF_SCAM_SW_RST_MASK (0x1 << 4)
+
+#define SENINF_PCAM_CTRL 0x0050
+#define RG_SENINF_PCAM_DATA_SEL_SHIFT 0
+#define RG_SENINF_PCAM_DATA_SEL_MASK (0x7 << 0)
+
+#define SENINF_CCIR_CTRL 0x0060
+#define SENINF_CCIR_SW_RST_SHIFT 4
+#define SENINF_CCIR_SW_RST_MASK (0x1 << 4)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
new file mode 100644
index 000000000000..3bd0d4a5b42e
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h
@@ -0,0 +1,49 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF_TG1_H__
+#define __SENINF_TG1_H__
+
+#define TM_CTL 0x0008
+#define TM_EN_SHIFT 0
+#define TM_EN_MASK (0x1 << 0)
+#define TM_RST_SHIFT 1
+#define TM_RST_MASK (0x1 << 1)
+#define TM_FMT_SHIFT 2
+#define TM_FMT_MASK (0x1 << 2)
+#define TM_BIN_IMG_SWITCH_EN_SHIFT 3
+#define TM_BIN_IMG_SWITCH_EN_MASK (0x1 << 3)
+#define TM_PAT_SHIFT 4
+#define TM_PAT_MASK (0x1f << 4)
+
+#define TM_SIZE 0x000c
+#define TM_PXL_SHIFT 0
+#define TM_PXL_MASK (0xffff << 0)
+#define TM_LINE_SHIFT 16
+#define TM_LINE_MASK (0xffff << 16)
+
+#define TM_CLK 0x0010
+#define TM_CLK_CNT_SHIFT 0
+#define TM_CLK_CNT_MASK (0xff << 0)
+#define TM_CLRBAR_OFT_SHIFT 8
+#define TM_CLRBAR_OFT_MASK (0x1fff << 8)
+#define TM_CLRBAR_IDX_SHIFT 28
+#define TM_CLRBAR_IDX_MASK (0x7 << 28)
+
+#define TM_DUM 0x0018
+#define TM_DUMMYPXL_SHIFT 0
+#define TM_DUMMYPXL_MASK (0xffff << 0)
+#define TM_VSYNC_SHIFT 16
+#define TM_VSYNC_MASK (0xffff << 16)
+
+#define TM_RAND_SEED 0x001c
+#define TM_SEED_SHIFT 0
+#define TM_SEED_MASK (0xffffffff << 0)
+
+#define TM_RAND_CTL 0x0020
+#define TM_DIFF_FRM_SHIFT 0
+#define TM_DIFF_FRM_MASK (0x1 << 0)
+
+#endif
diff --git a/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
new file mode 100644
index 000000000000..eeb7e06a20e3
--- /dev/null
+++ b/drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
@@ -0,0 +1,99 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (c) 2022 MediaTek Inc.
+ */
+
+#ifndef __SENINF_TOP_H__
+#define __SENINF_TOP_H__
+
+#define SENINF_TOP_CTRL 0x0000
+#define SENINF_TOP_SW_RST_SHIFT 0
+#define SENINF_TOP_SW_RST_MASK (0x1 << 0)
+#define SENINF_TOP_N3D_SW_RST_SHIFT 4
+#define SENINF_TOP_N3D_SW_RST_MASK (0x1 << 4)
+#define RG_SENINF1_PCAM_PCLK_SEL_SHIFT 8
+#define RG_SENINF1_PCAM_PCLK_SEL_MASK (0x1 << 8)
+#define RG_SENINF2_PCAM_PCLK_SEL_SHIFT 9
+#define RG_SENINF2_PCAM_PCLK_SEL_MASK (0x1 << 9)
+#define RG_SENINF1_PCAM_PCLK_EN_SHIFT 12
+#define RG_SENINF1_PCAM_PCLK_EN_MASK (0x1 << 12)
+#define RG_SENINF2_PCAM_PCLK_EN_SHIFT 13
+#define RG_SENINF2_PCAM_PCLK_EN_MASK (0x1 << 13)
+#define RG_SLICE_FIFO_FULL_OPT_SHIFT 16
+#define RG_SLICE_FIFO_FULL_OPT_MASK (0x1 << 16)
+
+#define SENINF_TOP_MUX_CTRL_0 0x0010
+#define RG_SENINF_MUX1_SRC_SEL_SHIFT 0
+#define RG_SENINF_MUX1_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_MUX2_SRC_SEL_SHIFT 8
+#define RG_SENINF_MUX2_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_MUX3_SRC_SEL_SHIFT 16
+#define RG_SENINF_MUX3_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_MUX4_SRC_SEL_SHIFT 24
+#define RG_SENINF_MUX4_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_TOP_MUX_CTRL_1 0x0014
+#define RG_SENINF_MUX5_SRC_SEL_SHIFT 0
+#define RG_SENINF_MUX5_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_MUX6_SRC_SEL_SHIFT 8
+#define RG_SENINF_MUX6_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_MUX7_SRC_SEL_SHIFT 16
+#define RG_SENINF_MUX7_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_MUX8_SRC_SEL_SHIFT 24
+#define RG_SENINF_MUX8_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_TOP_MUX_CTRL_2 0x0018
+#define RG_SENINF_MUX9_SRC_SEL_SHIFT 0
+#define RG_SENINF_MUX9_SRC_SEL_MASK (0xf << 0)
+#define RG_SENINF_MUX10_SRC_SEL_SHIFT 8
+#define RG_SENINF_MUX10_SRC_SEL_MASK (0xf << 8)
+#define RG_SENINF_MUX11_SRC_SEL_SHIFT 16
+#define RG_SENINF_MUX11_SRC_SEL_MASK (0xf << 16)
+#define RG_SENINF_MUX12_SRC_SEL_SHIFT 24
+#define RG_SENINF_MUX12_SRC_SEL_MASK (0xf << 24)
+
+#define SENINF_TOP_MUX_CTRL_3 0x001c
+#define RG_SENINF_MUX13_SRC_SEL_SHIFT 0
+#define RG_SENINF_MUX13_SRC_SEL_MASK (0xf << 0)
+
+#define SENINF_TOP_PHY_CTRL_CSI0 0x0060
+#define PHY_SENINF_MUX0_DPHY_EN_SHIFT 0
+#define PHY_SENINF_MUX0_DPHY_EN_MASK (0x1 << 0)
+#define PHY_SENINF_MUX0_CPHY_EN_SHIFT 1
+#define PHY_SENINF_MUX0_CPHY_EN_MASK (0x1 << 1)
+#define RG_PHY_SENINF_MUX0_CPHY_MODE_SHIFT 8
+#define RG_PHY_SENINF_MUX0_CPHY_MODE_MASK (0x3 << 8)
+
+#define SENINF_TOP_PHY_CTRL_CSI1 0x0064
+#define PHY_SENINF_MUX1_DPHY_EN_SHIFT 0
+#define PHY_SENINF_MUX1_DPHY_EN_MASK (0x1 << 0)
+#define PHY_SENINF_MUX1_CPHY_EN_SHIFT 1
+#define PHY_SENINF_MUX1_CPHY_EN_MASK (0x1 << 1)
+#define RG_PHY_SENINF_MUX1_CPHY_MODE_SHIFT 8
+#define RG_PHY_SENINF_MUX1_CPHY_MODE_MASK (0x3 << 8)
+
+#define SENINF_TOP_PHY_CTRL_CSI2 0x0068
+#define PHY_SENINF_MUX2_DPHY_EN_SHIFT 0
+#define PHY_SENINF_MUX2_DPHY_EN_MASK (0x1 << 0)
+#define PHY_SENINF_MUX2_CPHY_EN_SHIFT 1
+#define PHY_SENINF_MUX2_CPHY_EN_MASK (0x1 << 1)
+#define RG_PHY_SENINF_MUX2_CPHY_MODE_SHIFT 8
+#define RG_PHY_SENINF_MUX2_CPHY_MODE_MASK (0x3 << 8)
+
+#define SENINF_TOP_PHY_CTRL_CSI3 0x006c
+#define PHY_SENINF_MUX3_DPHY_EN_SHIFT 0
+#define PHY_SENINF_MUX3_DPHY_EN_MASK (0x1 << 0)
+#define PHY_SENINF_MUX3_CPHY_EN_SHIFT 1
+#define PHY_SENINF_MUX3_CPHY_EN_MASK (0x1 << 1)
+#define RG_PHY_SENINF_MUX3_CPHY_MODE_SHIFT 8
+#define RG_PHY_SENINF_MUX3_CPHY_MODE_MASK (0x3 << 8)
+
+#define SENINF_TOP_PHY_CTRL_CSI4 0x0070
+#define PHY_SENINF_MUX4_DPHY_EN_SHIFT 0
+#define PHY_SENINF_MUX4_DPHY_EN_MASK (0x1 << 0)
+#define PHY_SENINF_MUX4_CPHY_EN_SHIFT 1
+#define PHY_SENINF_MUX4_CPHY_EN_MASK (0x1 << 1)
+#define RG_PHY_SENINF_MUX4_CPHY_MODE_SHIFT 8
+#define RG_PHY_SENINF_MUX4_CPHY_MODE_MASK (0x3 << 8)
+
+#endif
-- 
2.18.0

