Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37385730CB4
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jun 2023 03:41:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C92610E117;
	Thu, 15 Jun 2023 01:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-db5eur01on2044.outbound.protection.outlook.com [40.107.15.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6B310E0FE
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Jun 2023 01:41:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PAau50X1KS/NePDL4AWMyM3lhmzx0IdkTsaFqLNi3mOnnWPQQaaViAm7yGQYub2G5SNQz17mmeMIMrAHCcQ1mo2Z/0Kn/xd0ac+QFMPLqGBkPj+0oYlTxA+tsEwE+jydyWZ5NlmFL2/g8JHf+/i3PUdKGrIdJUvOv0Ngccz7Y/INt42aRySZ0ycxmZm/sFTYgi1xdAiTeuG9/LtqsQtAEA101zkil3F5PGZqFFUKEyHTSTLVQh0LYg9+vgsWSCiDe0Zv9gWD9hZLyTQ2gjYXYeuO6Y2CQaP+g3r0I0+JxkHIEaTPW6+O3kc8yj+ybUvglwTOkURPuGA2tVvS2HrK+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F1FDZ//cHxvVag2hAhM0C+1XV7Sj9Xt+MUpw/fT/1rY=;
 b=KZ/E8qWQ/Qy+KBEe3m6SsJtYHjj2RA4DRatZ7YhSr9fzrmug+meaNtn2LQDLU5KdHbTIWl0QMKV2+PMjavIsVrMCUEFibfiJAmgMXX7Z0V2hmaGVY3NPSbPdKZhcK+B3KcbEkKPG0WNrcE1ajhIgqGRAQl+J+PzzC6DCMi0Nu4k6jeUZ+JE4MaqEay1iFHpsvpvnRFrfuHh9Iyi7YmKsSnB+C3fBJoYJ/G+sOXVgY10wMTiosETJrtJzzWE2qBvLDOCCEKB1Axk7E5v0RRo6I3C5kTs28yKE+p2OnIeFeBpuItlYZ8Xm9r13GBvuOwG+ZgSbg/ciGNeHLVIoaBxUXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F1FDZ//cHxvVag2hAhM0C+1XV7Sj9Xt+MUpw/fT/1rY=;
 b=FhJu5Dx3GlgG8meGuJ4ILXYJopFa8jIB42scyZnJgmZAbQDvGrQ+srvn3N12fDf+NNIzAS5w3Ljq4LWQyaeLoR9OY+n0O5urvJsutr9I61dwGNThIGiK9GvUSuKthysfrJpBqGzxz0a+ZKDCFHIsEsSXVJZ6Pv3nUz8N1JrkVOU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AM8PR04MB8034.eurprd04.prod.outlook.com (2603:10a6:20b:249::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.25; Thu, 15 Jun
 2023 01:41:31 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::8af8:59df:c8ab:ff51%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 01:41:31 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, vkoul@kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v6 3/8] drm: bridge: Cadence: Add MHDP8501 DP driver
Date: Thu, 15 Jun 2023 09:38:13 +0800
Message-Id: <67f54be91e91f6291c4ad3f5155598d699b8bc09.1686729444.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1686729444.git.Sandor.yu@nxp.com>
References: <cover.1686729444.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0176.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::32) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AM8PR04MB8034:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea876c0-91c5-4de1-3416-08db6d41a4e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A5Wxi6XL64el+mRNapZj7NqeGb2J5Uv8q20CtuB6MoxgbGz/bo9g7BRNxfx0NeMe3oiQTA2+1Gt/fmhVBCD48QdvS2eilAEmNuYbZavTx/FBfXRRBYmj/KGVBniKe4yKiPWPR32ItQ4sYAuiRXog8ILXM0b/djac6z4ERcI85iM6Go6WFaK3I/u8lX2C67etvBv5QmP2ncW6iYa8qlmSVtNxKLG8u4jj22piEkqWlMMVAArEXlhe+ICShWzLUJkr3Tpr1YVuLPvf+bQm8phLlTzvqbw3okfJBbPRDdXiN1ea160GcAlUviiTDG4lPqdao8tZyS1FYe0EGwMA2i7I6EObtLupfcpTJGCJLa4z8EOMMVe297VypYv6+tWpIr9dzDPBBMssXzhLWMXoO8pbhDeTJJ0QsXpvHxwGEhOAzyTvVbSe2jkD57gZxXud/4aFW4niGE9uJ1Ea/UMNDxAl4sFBsseRq7Z7u4N/8enjmLJLjYGRGBoFPQFjPgMLXf2B8EzkLpRVbtUXoJhKTkqaBEUht2PBF3BRb+rAm+ozOsYWvhoFJwFnzfJu1AFUAtv87y7W0x2B+mSYD7l1kBA9fykZgX+jYEqLiHPc0o8KAjxiwXmUO1V99WZ+pLQp4X5hGXzU7IyAMGLFm1hLU9onAmyFQFU4EQZN3cEKhfjRWDs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(39860400002)(376002)(136003)(396003)(366004)(451199021)(2616005)(186003)(2906002)(83380400001)(6666004)(66476007)(66946007)(66556008)(52116002)(316002)(36756003)(8936002)(41300700001)(8676002)(6486002)(86362001)(4326008)(478600001)(26005)(30864003)(6512007)(6506007)(7416002)(38100700002)(38350700002)(5660300002)(921005)(579004)(309714004);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YIkDFIyTEFcDSS+8/cOvvqNdttv4TbXhTNoXYd1QNB5sV8KXIiteYKn+W8Yo?=
 =?us-ascii?Q?DG1QGPHhDLiDsY9KU8Rh29e8TRzOsy3YmA/kC8YYw4RrUYXbezScbBOKimYx?=
 =?us-ascii?Q?NpXKcBGigf6JIuQExw3HcNdMk6CHFNgJZKL6b2kRiK9MLpkvPYRz8j6Unv5/?=
 =?us-ascii?Q?XcidXoxza/n+y3UoKVZ9bI3AFmMspQJsJOdT80VZrxtTXi6cRhrPKT+8ZOzm?=
 =?us-ascii?Q?QmunZYtoBOUKdocVDZf+OBrmqiEW/DMNaq+1PftY8GA4vdYboSH56Nmu3UUg?=
 =?us-ascii?Q?O7Y9GdeAND0gsCx45pmLAAtDgaaCyGbwM7HnnQHedoM2qMwicd0Jqd4XF/Jj?=
 =?us-ascii?Q?923oDfxedqE14D0yGEeoKPR2+FNAgDIsfcOheo9AbI//RHbIB7MueuN5zJ+s?=
 =?us-ascii?Q?PErMEH6Vh6bx2TZ8JfxgCFo7wleXmD4P6cNWh61yQPxTBKi2ALKb93XhltZB?=
 =?us-ascii?Q?Re85rfal5nutWE91NRQMQux2vH7fSN0ooJIHwq1oTm9aVqXpRTanAcjUvSTN?=
 =?us-ascii?Q?PzsAlj5R79VyE/+7A7Ok7bg+oO6ONXukoTY3nbil9zdRvhg40zaMLgyXya4g?=
 =?us-ascii?Q?BAdlww+7SoRoD3degNuwnChGjoLIrk3NIhUaY7d71malgzErYsy705WnwA2F?=
 =?us-ascii?Q?9fDCLRQwl3Y1o0i1hhjfFL8iugyk3DsjaP7KYtyurqBqlE9C6B0HUU1ybupz?=
 =?us-ascii?Q?AOmrT9MeBJEYYfjXtFuXMIn7eP5WD4ZeIOvAbBCB7UkXAct75WYUWN8Gy34k?=
 =?us-ascii?Q?Z7TZsQ1qDzoT/94DU9Sho/8aonuiI9MhkBvef/ys2S9huY8Fc7TiX/ir2fBp?=
 =?us-ascii?Q?IJNXD1CppD2VUJmM6oZkfI5Ygx5eHaz+KwL293FeUxl/NFDGh+EAmLrQP1nC?=
 =?us-ascii?Q?vxUakxyM6Wfn6D80ul/INrpVab8xuBQDm7szq20hA0qSnD5cE0qO1sYL1Kwy?=
 =?us-ascii?Q?Bq0iJycW07uQ/+TVCSKGW+CAv962boKHlzPukfQYRgCr4PkBOLKr8qoSyAfU?=
 =?us-ascii?Q?fghBsXJhbeMJ9Ck87U8RWWrfpzF5TcUlzDbkZ0QcnTZlWTmWN56WW/oE/Pfs?=
 =?us-ascii?Q?pH0iUrSqnA74mIpKpSGZc2bOqGFcw4FDBavDcvOPyy5mCN5eKymb1Bv0xjLN?=
 =?us-ascii?Q?9uhMOfgrMFjvDoUrNHr3mDO8nFJDtQkbaLjgpbSK6gT4MRG/aacgzXgxS9pV?=
 =?us-ascii?Q?EkEVDPMaAyBmJEmEJ2lqyZzh6+KYDzY4uo3UvOxGrUQDvjlwYjJEvzVOzToj?=
 =?us-ascii?Q?2D5A/FD51sfQ+YYornKu/rAU/w05MSaVVCHDuywMYtPbZaqZ19Aod9/1D9J1?=
 =?us-ascii?Q?DaNYI0LMW5R50tsFOx02sqYIQJv69K8Wz+YI0c3FxCCDIeZaQd9l1/yr5ro/?=
 =?us-ascii?Q?QudQFzCxyHQJVhgI37QuxM1gJZq5CIlISY9eZypSt6fEXWiZoGbXX0Ycggsk?=
 =?us-ascii?Q?PXqgIkxykBqOj4A/5CW4XB4K/Kq7fXGxLvstywrH7soXplwNYgneXkQMt5ui?=
 =?us-ascii?Q?PKeVIztAv7h0J3sznwbPlmrFUvx3hF+6+HLMZ4Gn5x89OAa5xgSePtWwbLVG?=
 =?us-ascii?Q?lwxp1Lh8s2djvGJ1jtXyYmNqC3za6Otb+nKLmLby?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea876c0-91c5-4de1-3416-08db6d41a4e3
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2023 01:41:31.4460 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zO5RiqNAuLfqtaV1yZilPaV86UU8rei8qXPgKURE/XhHdB7xcXwtxBZi6UYz/NEmct0cYyrrJAQDb/EZZAjXrA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8034
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
Cc: oliver.brown@nxp.com, Sandor.yu@nxp.com, linux-imx@nxp.com,
 kernel@pengutronix.de
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new DRM DisplayPort bridge driver for Candence MHDP8501
used in i.MX8MQ SOC. MHDP8501 could support HDMI or DisplayPort
standards according embedded Firmware running in the uCPU.

For iMX8MQ SOC, the DisplayPort FW was loaded and activated by SOC
ROM code. Bootload binary included HDMI FW was required for the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        |   13 +
 drivers/gpu/drm/bridge/cadence/Makefile       |    2 +
 .../gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c | 1078 +++++++++++++++++
 .../gpu/drm/bridge/cadence/cdns-mhdp8501.h    |  399 ++++++
 4 files changed, 1492 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index ec35215a2003..5b7ec4e49aa1 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -46,3 +46,16 @@ config DRM_CDNS_MHDP8546_J721E
 	  initializes the J721E Display Port and sets up the
 	  clock and data muxes.
 endif
+
+config DRM_CDNS_MHDP8501_DP
+	tristate "Cadence MHDP8501 DP DRM driver"
+	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
+	select DRM_DISPLAY_DP_HELPER
+	select DRM_DISPLAY_HELPER
+	select DRM_CDNS_AUDIO
+	depends on OF
+	help
+	  Support Cadence MHDP8501 DisplayPort driver.
+	  Cadence MHDP8501 Controller support one or more protocols,
+	  DisplayPort firmware is required for this driver.
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d13..5842e4540c62 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -5,3 +5,5 @@ cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
+
+obj-$(CONFIG_DRM_CDNS_MHDP8501_DP) += cdns-mhdp8501-dp.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
new file mode 100644
index 000000000000..6a17e99060cb
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501-dp.c
@@ -0,0 +1,1078 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence Display Port Interface (DP) driver
+ *
+ * Copyright (C) 2019-2022 NXP Semiconductor, Inc.
+ *
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-dp.h>
+
+#include <drm/bridge/cdns-mhdp-mailbox.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_crtc_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_vblank.h>
+#include <drm/drm_print.h>
+#include <drm/display/drm_dp_helper.h>
+
+#include "cdns-mhdp8501.h"
+
+#define LINK_TRAINING_TIMEOUT_MS	500
+#define LINK_TRAINING_RETRY_MS		20
+
+/*
+ * This function only implements native DPDC reads and writes
+ */
+static int cdns_dp_dpcd_read(struct cdns_mhdp_device *mhdp,
+			u32 addr, u8 *data, u16 len)
+{
+	u8 msg[5], reg[5];
+	int ret;
+
+	put_unaligned_be16(len, msg);
+	put_unaligned_be24(addr, msg + 2);
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+					    DPTX_READ_DPCD,
+					    sizeof(reg) + len);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(mhdp, data, len);
+
+out:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_dp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
+{
+	u8 msg[6], reg[5];
+	int ret;
+
+	put_unaligned_be16(1, msg);
+	put_unaligned_be24(addr, msg + 2);
+	msg[5] = value;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+					    DPTX_WRITE_DPCD, sizeof(reg));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto out;
+
+	if (addr != get_unaligned_be24(reg + 2))
+		ret = -EINVAL;
+
+out:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	if (ret)
+		dev_err(mhdp->dev, "dpcd write failed: %d\n", ret);
+	return ret;
+}
+
+static ssize_t cdns_dp_aux_transfer(struct drm_dp_aux *aux,
+		struct drm_dp_aux_msg *msg)
+{
+	struct cdns_mhdp_device *mhdp = dev_get_drvdata(aux->dev);
+	bool native = msg->request & (DP_AUX_NATIVE_WRITE & DP_AUX_NATIVE_READ);
+	int ret;
+
+	/* Ignore address only message */
+	if ((msg->size == 0) || (msg->buffer == NULL)) {
+		msg->reply = native ?
+			DP_AUX_NATIVE_REPLY_ACK : DP_AUX_I2C_REPLY_ACK;
+		return msg->size;
+	}
+
+	if (!native) {
+		dev_err(mhdp->dev, "%s: only native messages supported\n", __func__);
+		return -EINVAL;
+	}
+
+	/* msg sanity check */
+	if (msg->size > DP_AUX_MAX_PAYLOAD_BYTES) {
+		dev_err(mhdp->dev, "%s: invalid msg: size(%zu), request(%x)\n",
+						__func__, msg->size, (unsigned int)msg->request);
+		return -EINVAL;
+	}
+
+	if (msg->request == DP_AUX_NATIVE_WRITE) {
+		const u8 *buf = msg->buffer;
+		int i;
+
+		for (i = 0; i < msg->size; ++i) {
+			ret = cdns_dp_dpcd_write(mhdp,
+						   msg->address + i, buf[i]);
+			if (!ret)
+				continue;
+
+			DRM_DEV_ERROR(mhdp->dev, "Failed to write DPCD\n");
+
+			return ret;
+		}
+		msg->reply = DP_AUX_NATIVE_REPLY_ACK;
+		return msg->size;
+	}
+
+	if (msg->request == DP_AUX_NATIVE_READ) {
+		ret = cdns_dp_dpcd_read(mhdp, msg->address, msg->buffer, msg->size);
+		if (ret < 0)
+			return -EIO;
+		msg->reply = DP_AUX_NATIVE_REPLY_ACK;
+		return msg->size;
+	}
+	return 0;
+}
+
+static int cdns_dp_aux_destroy(struct cdns_mhdp_device *mhdp)
+{
+	drm_dp_aux_unregister(&mhdp->dp.aux);
+
+	return 0;
+}
+
+static int cdns_dp_get_msa_misc(struct video_info *video,
+				  struct drm_display_mode *mode)
+{
+	u32 msa_misc;
+	u8 val[2] = {0};
+
+	switch (video->color_fmt) {
+	/* set YUV default color space conversion to BT601 */
+	case DRM_COLOR_FORMAT_YCBCR444:
+		val[0] = 6 + BT_601 * 8;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		val[0] = 5 + BT_601 * 8;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		val[0] = 5;
+		break;
+	case DRM_COLOR_FORMAT_RGB444:
+	default:
+		val[0] = 0;
+		break;
+	};
+
+	switch (video->bpc) {
+	case 6:
+		val[1] = 0;
+		break;
+	case 10:
+		val[1] = 2;
+		break;
+	case 12:
+		val[1] = 3;
+		break;
+	case 16:
+		val[1] = 4;
+		break;
+	case 8:
+	default:
+		val[1] = 1;
+		break;
+	};
+
+	msa_misc = 2 * val[0] + 32 * val[1];
+
+	return msa_misc;
+}
+
+static int cdns_dp_config_video(struct cdns_mhdp_device *mhdp)
+{
+	struct video_info *video = &mhdp->video_info;
+	struct drm_display_mode *mode = &mhdp->mode;
+	bool h_sync_polarity, v_sync_polarity;
+	u64 symbol;
+	u32 val, link_rate, rem;
+	u8 bit_per_pix, tu_size_reg = TU_SIZE;
+	int ret;
+
+	bit_per_pix = (video->color_fmt == DRM_COLOR_FORMAT_YCBCR422) ?
+		      (video->bpc * 2) : (video->bpc * 3);
+
+	link_rate = mhdp->dp.rate / 1000;
+
+	ret = cdns_mhdp_reg_write(mhdp, BND_HSYNC2VSYNC, VIF_BYPASS_INTERLACE);
+	if (ret)
+		goto err_config_video;
+
+	ret = cdns_mhdp_reg_write(mhdp, HSYNC2VSYNC_POL_CTRL, 0);
+	if (ret)
+		goto err_config_video;
+
+	/*
+	 * get a best tu_size and valid symbol:
+	 * 1. chose Lclk freq(162Mhz, 270Mhz, 540Mhz), set TU to 32
+	 * 2. calculate VS(valid symbol) = TU * Pclk * Bpp / (Lclk * Lanes)
+	 * 3. if VS > *.85 or VS < *.1 or VS < 2 or TU < VS + 4, then set
+	 *    TU += 2 and repeat 2nd step.
+	 */
+	do {
+		tu_size_reg += 2;
+		symbol = tu_size_reg * mode->clock * bit_per_pix;
+		do_div(symbol, mhdp->dp.num_lanes * link_rate * 8);
+		rem = do_div(symbol, 1000);
+		if (tu_size_reg > 64) {
+			ret = -EINVAL;
+			DRM_DEV_ERROR(mhdp->dev,
+				      "tu error, clk:%d, lanes:%d, rate:%d\n",
+				      mode->clock, mhdp->dp.num_lanes, link_rate);
+			goto err_config_video;
+		}
+	} while ((symbol <= 1) || (tu_size_reg - symbol < 4) ||
+		 (rem > 850) || (rem < 100));
+
+	val = symbol + (tu_size_reg << 8);
+	val |= TU_CNT_RST_EN;
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRAMER_TU, val);
+	if (ret)
+		goto err_config_video;
+
+	/* set the FIFO Buffer size */
+	val = div_u64(mode->clock * (symbol + 1), 1000) + link_rate;
+	val /= (mhdp->dp.num_lanes * link_rate);
+	val = div_u64(8 * (symbol + 1), bit_per_pix) - val;
+	val += 2;
+	ret = cdns_mhdp_reg_write(mhdp, DP_VC_TABLE(15), val);
+
+	switch (video->bpc) {
+	case 6:
+		val = BCS_6;
+		break;
+	case 10:
+		val = BCS_10;
+		break;
+	case 12:
+		val = BCS_12;
+		break;
+	case 16:
+		val = BCS_16;
+		break;
+	case 8:
+	default:
+		val = BCS_8;
+		break;
+	};
+
+	val += video->color_fmt << 8;
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRAMER_PXL_REPR, val);
+	if (ret)
+		goto err_config_video;
+
+	v_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NVSYNC);
+	h_sync_polarity = !!(mode->flags & DRM_MODE_FLAG_NHSYNC);
+
+	val = h_sync_polarity ? DP_FRAMER_SP_HSP : 0;
+	val |= v_sync_polarity ? DP_FRAMER_SP_VSP : 0;
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRAMER_SP, val);
+	if (ret)
+		goto err_config_video;
+
+	val = (mode->hsync_start - mode->hdisplay) << 16;
+	val |= mode->htotal - mode->hsync_end;
+	ret = cdns_mhdp_reg_write(mhdp, DP_FRONT_BACK_PORCH, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->hdisplay * bit_per_pix / 8;
+	ret = cdns_mhdp_reg_write(mhdp, DP_BYTE_COUNT, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->htotal | ((mode->htotal - mode->hsync_start) << 16);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_HORIZONTAL_0, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->hsync_end - mode->hsync_start;
+	val |= (mode->hdisplay << 16) | (h_sync_polarity << 15);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_HORIZONTAL_1, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->vtotal;
+	val |= (mode->vtotal - mode->vsync_start) << 16;
+	ret = cdns_mhdp_reg_write(mhdp, MSA_VERTICAL_0, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->vsync_end - mode->vsync_start;
+	val |= (mode->vdisplay << 16) | (v_sync_polarity << 15);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_VERTICAL_1, val);
+	if (ret)
+		goto err_config_video;
+
+	val = cdns_dp_get_msa_misc(video, mode);
+	ret = cdns_mhdp_reg_write(mhdp, MSA_MISC, val);
+	if (ret)
+		goto err_config_video;
+
+	ret = cdns_mhdp_reg_write(mhdp, STREAM_CONFIG, 1);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->hsync_end - mode->hsync_start;
+	val |= mode->hdisplay << 16;
+	ret = cdns_mhdp_reg_write(mhdp, DP_HORIZONTAL, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->vdisplay;
+	val |= (mode->vtotal - mode->vsync_start) << 16;
+	ret = cdns_mhdp_reg_write(mhdp, DP_VERTICAL_0, val);
+	if (ret)
+		goto err_config_video;
+
+	val = mode->vtotal;
+	ret = cdns_mhdp_reg_write(mhdp, DP_VERTICAL_1, val);
+	if (ret)
+		goto err_config_video;
+
+	ret = cdns_mhdp_reg_write_bit(mhdp, DP_VB_ID, 2, 1, 0);
+
+err_config_video:
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "config video failed: %d\n", ret);
+	return ret;
+}
+
+static void cdns_dp_pixel_clk_reset(struct cdns_mhdp_device *mhdp)
+{
+	u32 val;
+
+	/* reset pixel clk */
+	cdns_mhdp_reg_read(mhdp, SOURCE_HDTX_CAR, &val);
+	cdns_mhdp_reg_write(mhdp, SOURCE_HDTX_CAR, val & 0xFD);
+	cdns_mhdp_reg_write(mhdp, SOURCE_HDTX_CAR, val);
+}
+
+static int cdns_dp_set_video_status(struct cdns_mhdp_device *mhdp, int active)
+{
+	u8 msg;
+	int ret;
+
+	msg = !!active;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_SET_VIDEO,
+								sizeof(msg), &msg);
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "set video status failed: %d\n", ret);
+
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	return ret;
+}
+
+static int cdns_dp_training_start(struct cdns_mhdp_device *mhdp)
+{
+	unsigned long timeout;
+	u8 msg, event[2];
+	int ret;
+
+	msg = LINK_TRAINING_RUN;
+
+	mutex_lock(&mhdp->mbox_mutex);
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
+		ret = cdns_mhdp_mailbox_recv_header(mhdp,
+							 MB_MODULE_ID_DP_TX,
+							 DPTX_READ_EVENT,
+							 sizeof(event));
+		if (ret)
+			goto err_training_start;
+
+		ret = cdns_mhdp_mailbox_recv_data(mhdp, event,
+						     sizeof(event));
+		if (ret)
+			goto err_training_start;
+
+		if (event[1] & CLK_RECOVERY_FAILED)
+			DRM_DEV_ERROR(mhdp->dev, "clock recovery failed\n");
+		else if (event[1] & EQ_PHASE_FINISHED) {
+			mutex_unlock(&mhdp->mbox_mutex);
+			return 0;
+		}
+	}
+
+	ret = -ETIMEDOUT;
+
+err_training_start:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	DRM_DEV_ERROR(mhdp->dev, "training failed: %d\n", ret);
+	return ret;
+}
+
+static int cdns_dp_get_training_status(struct cdns_mhdp_device *mhdp)
+{
+	u8 status[13];
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_LINK_STAT, 0, NULL);
+	if (ret)
+		goto err_get_training_status;
+
+	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+						 DPTX_READ_LINK_STAT,
+						 sizeof(status));
+	if (ret)
+		goto err_get_training_status;
+
+	ret = cdns_mhdp_mailbox_recv_data(mhdp, status, sizeof(status));
+	if (ret)
+		goto err_get_training_status;
+
+	mhdp->dp.rate = drm_dp_bw_code_to_link_rate(status[0]);
+	mhdp->dp.num_lanes = status[1];
+
+err_get_training_status:
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "get training status failed: %d\n",
+			      ret);
+	return ret;
+}
+
+static int cdns_dp_train_link(struct cdns_mhdp_device *mhdp)
+{
+	int ret;
+
+	ret = cdns_dp_training_start(mhdp);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to start training %d\n",
+			      ret);
+		return ret;
+	}
+
+	ret = cdns_dp_get_training_status(mhdp);
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
+
+int cdns_dp_set_host_cap(struct cdns_mhdp_device *mhdp)
+{
+	u8 msg[8];
+	int ret;
+
+	msg[0] = drm_dp_link_rate_to_bw_code(mhdp->dp.rate);
+	msg[1] = mhdp->dp.num_lanes | SCRAMBLER_EN;
+	msg[2] = VOLTAGE_LEVEL_2;
+	msg[3] = PRE_EMPHASIS_LEVEL_3;
+	msg[4] = PTS1 | PTS2 | PTS3 | PTS4;
+	msg[5] = FAST_LT_NOT_SUPPORT;
+	msg[6] = mhdp->lane_mapping;
+	msg[7] = ENHANCED;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+				     DPTX_SET_HOST_CAPABILITIES,
+				     sizeof(msg), msg);
+
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "set host cap failed: %d\n", ret);
+
+	return ret;
+}
+
+static int cdns_dp_get_edid_block(void *data, u8 *edid,
+			  unsigned int block, size_t length)
+{
+	struct cdns_mhdp_device *mhdp = data;
+	u8 msg[2], reg[2], i;
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	for (i = 0; i < 4; i++) {
+		msg[0] = block / 2;
+		msg[1] = block % 2;
+
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+					     DPTX_GET_EDID, sizeof(msg), msg);
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_recv_header(mhdp,
+							 MB_MODULE_ID_DP_TX,
+							 DPTX_GET_EDID,
+							 sizeof(reg) + length);
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
+		if (ret)
+			continue;
+
+		if (reg[0] == length && reg[1] == block / 2)
+			break;
+	}
+
+	if (ret)
+		DRM_DEV_ERROR(mhdp->dev, "get block[%d] edid failed: %d\n",
+			      block, ret);
+
+	mutex_unlock(&mhdp->mbox_mutex);
+	return ret;
+}
+
+static int cdns_dp_read_hpd(struct cdns_mhdp_device *mhdp)
+{
+	u8 status;
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX, DPTX_HPD_STATE,
+				  0, NULL);
+	if (ret)
+		goto err_get_hpd;
+
+	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+							DPTX_HPD_STATE, sizeof(status));
+	if (ret)
+		goto err_get_hpd;
+
+	ret = cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status));
+	if (ret)
+		goto err_get_hpd;
+
+	mutex_unlock(&mhdp->mbox_mutex);
+	return status;
+
+err_get_hpd:
+	mutex_unlock(&mhdp->mbox_mutex);
+	DRM_ERROR("read hpd  failed: %d\n", ret);
+	return ret;
+}
+
+static void cdns_dp_mode_set(struct cdns_mhdp_device *mhdp)
+{
+	union phy_configure_opts phy_cfg;
+	int ret;
+
+	cdns_dp_pixel_clk_reset(mhdp);
+
+	/* Get DP Caps  */
+	ret = drm_dp_dpcd_read(&mhdp->dp.aux, DP_DPCD_REV, mhdp->dp.dpcd,
+			       DP_RECEIVER_CAP_SIZE);
+	if (ret < 0) {
+		DRM_ERROR("Failed to get caps %d\n", ret);
+		return;
+	}
+
+	mhdp->dp.rate = drm_dp_max_link_rate(mhdp->dp.dpcd);
+	mhdp->dp.num_lanes = drm_dp_max_lane_count(mhdp->dp.dpcd);
+
+	/* check the max link rate */
+	if (mhdp->dp.rate > CDNS_DP_MAX_LINK_RATE)
+		mhdp->dp.rate = CDNS_DP_MAX_LINK_RATE;
+
+	phy_cfg.dp.lanes = mhdp->dp.num_lanes;
+	phy_cfg.dp.link_rate = mhdp->dp.rate;
+	phy_cfg.dp.set_lanes = false;
+	phy_cfg.dp.set_rate = false;
+	phy_cfg.dp.set_voltages = true;
+
+	/* Mailbox protect for DP PHY access */
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = phy_configure(mhdp->phy,  &phy_cfg);
+	mutex_unlock(&mhdp->mbox_mutex);
+	if (ret) {
+		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
+			__func__, ret);
+		return;
+	}
+
+	/* Video off */
+	ret = cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to valid video %d\n", ret);
+		return;
+	}
+
+	/* Line swapping */
+	mhdp->lane_mapping = mhdp->plat_data->lane_mapping;
+	cdns_mhdp_reg_write(mhdp, LANES_CONFIG, 0x00400000 | mhdp->lane_mapping);
+
+	/* Set DP host capability */
+	ret = cdns_dp_set_host_cap(mhdp);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to set host cap %d\n", ret);
+		return;
+	}
+
+	ret = cdns_mhdp_reg_write(mhdp, DP_AUX_SWAP_INVERSION_CONTROL,
+					AUX_HOST_INVERT);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to set host invert %d\n", ret);
+		return;
+	}
+
+	ret = cdns_dp_config_video(mhdp);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to config video %d\n", ret);
+		return;
+	}
+}
+
+static int cdns_dp_connector_get_modes(struct drm_connector *connector)
+{
+	struct cdns_mhdp_device *mhdp = container_of(connector,
+					struct cdns_mhdp_device, connector);
+	int num_modes = 0;
+	struct edid *edid;
+
+	edid = drm_do_get_edid(&mhdp->connector,
+				   cdns_dp_get_edid_block, mhdp);
+	if (edid) {
+		dev_info(mhdp->dev, "%x,%x,%x,%x,%x,%x,%x,%x\n",
+			 edid->header[0], edid->header[1],
+			 edid->header[2], edid->header[3],
+			 edid->header[4], edid->header[5],
+			 edid->header[6], edid->header[7]);
+		drm_connector_update_edid_property(connector, edid);
+		num_modes = drm_add_edid_modes(connector, edid);
+		kfree(edid);
+	}
+
+	if (num_modes == 0)
+		DRM_ERROR("Invalid edid\n");
+	return num_modes;
+}
+
+static const struct drm_connector_funcs cdns_dp_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs cdns_dp_connector_helper_funcs = {
+	.get_modes = cdns_dp_connector_get_modes,
+};
+
+static int cdns_dp_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector = &mhdp->connector;
+	int ret;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		connector->interlace_allowed = 0;
+
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+		drm_connector_helper_add(connector, &cdns_dp_connector_helper_funcs);
+
+		drm_connector_init(bridge->dev, connector, &cdns_dp_connector_funcs,
+				   DRM_MODE_CONNECTOR_DisplayPort);
+
+		drm_connector_attach_encoder(connector, encoder);
+	}
+
+	mhdp->dp.aux.drm_dev = bridge->dev;
+	ret = drm_dp_aux_register(&mhdp->dp.aux);
+
+	return ret;
+}
+
+static enum drm_mode_status
+cdns_dp_bridge_mode_valid(struct drm_bridge *bridge,
+				const struct drm_display_info *info,
+				const struct drm_display_mode *mode)
+{
+	enum drm_mode_status mode_status = MODE_OK;
+
+	/* We don't support double-clocked modes */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
+			mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_BAD;
+
+	/* MAX support pixel clock rate 594MHz */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	/* 4096x2160 is not supported */
+	if (mode->hdisplay > 3840)
+		return MODE_BAD_HVALUE;
+
+	if (mode->vdisplay > 2160)
+		return MODE_BAD_VVALUE;
+
+	return mode_status;
+}
+
+static enum drm_connector_status cdns_dp_detect(struct cdns_mhdp_device *mhdp)
+{
+	u8 hpd = 0xf;
+
+	hpd = cdns_dp_read_hpd(mhdp);
+	if (hpd == 1)
+		return connector_status_connected;
+	else if (hpd == 0)
+		return connector_status_disconnected;
+
+	DRM_INFO("Unknown cable status, hdp=%u\n", hpd);
+	return connector_status_unknown;
+}
+
+static enum drm_connector_status
+cdns_dp_bridge_detect(struct drm_bridge *bridge)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+
+	return cdns_dp_detect(mhdp);
+}
+
+static struct edid *cdns_dp_bridge_get_edid(struct drm_bridge *bridge,
+					      struct drm_connector *connector)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+
+	return drm_do_get_edid(connector, cdns_dp_get_edid_block, mhdp);
+}
+
+static void cdns_dp_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_state)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+
+	cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_IDLE);
+	mhdp->curr_conn = NULL;
+
+	/* Mailbox protect for DP PHY access */
+	mutex_lock(&mhdp->mbox_mutex);
+	phy_power_off(mhdp->phy);
+	mutex_unlock(&mhdp->mbox_mutex);
+}
+
+static void cdns_dp_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_state)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct drm_atomic_state *state = old_state->base.state;
+	struct drm_connector *connector;
+	struct video_info *video = &mhdp->video_info;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
+	int ret;
+
+	connector = drm_atomic_get_new_connector_for_encoder(state,
+							     bridge->encoder);
+	if (WARN_ON(!connector))
+		return;
+
+	mhdp->curr_conn = connector;
+
+	conn_state = drm_atomic_get_new_connector_state(state, connector);
+	if (WARN_ON(!conn_state))
+		return;
+
+	crtc_state = drm_atomic_get_new_crtc_state(state, conn_state->crtc);
+	if (WARN_ON(!crtc_state))
+		return;
+
+	mode = &crtc_state->adjusted_mode;
+
+	switch (connector->display_info.bpc) {
+	case 10:
+		video->bpc = 10;
+		break;
+	case 6:
+		video->bpc = 6;
+		break;
+	default:
+		video->bpc = 8;
+		break;
+	}
+
+	/* The only currently supported format */
+	video->color_fmt = DRM_COLOR_FORMAT_RGB444;
+
+	DRM_INFO("Mode: %dx%dp%d\n", mode->hdisplay, mode->vdisplay, mode->clock);
+	memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
+
+	cdns_dp_mode_set(mhdp);
+
+	/* Link trainning */
+	ret = cdns_dp_train_link(mhdp);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed link train %d\n", ret);
+		return;
+	}
+
+	ret = cdns_dp_set_video_status(mhdp, CONTROL_VIDEO_VALID);
+	if (ret) {
+		DRM_DEV_ERROR(mhdp->dev, "Failed to valid video %d\n", ret);
+		return;
+	}
+}
+
+static const struct drm_bridge_funcs cdns_dp_bridge_funcs = {
+	.attach = cdns_dp_bridge_attach,
+	.mode_valid = cdns_dp_bridge_mode_valid,
+	.detect = cdns_dp_bridge_detect,
+	.get_edid = cdns_dp_bridge_get_edid,
+	.atomic_enable = cdns_dp_bridge_atomic_enable,
+	.atomic_disable = cdns_dp_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+static void hotplug_work_func(struct work_struct *work)
+{
+	struct cdns_mhdp_device *mhdp = container_of(work,
+					   struct cdns_mhdp_device, hotplug_work.work);
+	enum drm_connector_status status = cdns_dp_detect(mhdp);
+
+	drm_bridge_hpd_notify(&mhdp->bridge, status);
+
+	if (status == connector_status_connected) {
+		/* Cable connedted  */
+		DRM_INFO("HDMI/DP Cable Plug In\n");
+		enable_irq(mhdp->irq[IRQ_OUT]);
+	} else if (status == connector_status_disconnected) {
+		/* Cable Disconnedted  */
+		DRM_INFO("HDMI/DP Cable Plug Out\n");
+		enable_irq(mhdp->irq[IRQ_IN]);
+	}
+}
+
+static irqreturn_t cdns_dp_irq_thread(int irq, void *data)
+{
+	struct cdns_mhdp_device *mhdp = data;
+
+	disable_irq_nosync(irq);
+
+	mod_delayed_work(system_wq, &mhdp->hotplug_work,
+			msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
+
+	return IRQ_HANDLED;
+}
+
+static int cdns_mhdp_dp_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cdns_mhdp_device *mhdp;
+	struct resource *res;
+	u32 reg;
+	int ret;
+
+	mhdp = devm_kzalloc(dev, sizeof(*mhdp), GFP_KERNEL);
+	if (!mhdp)
+		return -ENOMEM;
+
+	mutex_init(&mhdp->mbox_mutex);
+	mhdp->dev = dev;
+
+	INIT_DELAYED_WORK(&mhdp->hotplug_work, hotplug_work_func);
+
+	drm_dp_aux_init(&mhdp->dp.aux);
+	mhdp->dp.aux.name = "imx_dp_aux";
+	mhdp->dp.aux.dev = dev;
+	mhdp->dp.aux.transfer = cdns_dp_aux_transfer;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -ENODEV;
+	mhdp->regs = devm_ioremap(dev, res->start, resource_size(res));
+	if (IS_ERR(mhdp->regs))
+		return PTR_ERR(mhdp->regs);
+
+	mhdp->phy = devm_of_phy_get_by_index(dev, pdev->dev.of_node, 0);
+	if (IS_ERR(mhdp->phy))
+		return dev_err_probe(dev, PTR_ERR(mhdp->phy), "no PHY configured\n");
+
+	mhdp->irq[IRQ_IN] = platform_get_irq_byname(pdev, "plug_in");
+	if (mhdp->irq[IRQ_IN] < 0)
+		return dev_err_probe(dev, mhdp->irq[IRQ_IN], "No plug_in irq number\n");
+
+	mhdp->irq[IRQ_OUT] = platform_get_irq_byname(pdev, "plug_out");
+	if (mhdp->irq[IRQ_OUT] < 0)
+		return dev_err_probe(dev, mhdp->irq[IRQ_OUT], "No plug_out irq number\n");
+
+	irq_set_status_flags(mhdp->irq[IRQ_IN], IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_IN],
+					NULL, cdns_dp_irq_thread,
+					IRQF_ONESHOT, dev_name(dev),
+					mhdp);
+	if (ret) {
+		dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_IN]);
+		return -EINVAL;
+	}
+
+	irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
+					NULL, cdns_dp_irq_thread,
+					IRQF_ONESHOT, dev_name(dev),
+					mhdp);
+	if (ret) {
+		dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_OUT]);
+		return -EINVAL;
+	}
+
+	mhdp->plat_data = of_device_get_match_data(dev);
+	dev_set_drvdata(dev, mhdp);
+
+	/* Enable APB clock */
+	mhdp->apb_clk = devm_clk_get(dev, NULL);
+	if (IS_ERR(mhdp->apb_clk))
+		return dev_err_probe(dev, PTR_ERR(mhdp->apb_clk), "couldn't get clk\n");
+
+	clk_prepare_enable(mhdp->apb_clk);
+
+	/*
+	 * Wait for the KEEP_ALIVE "message" on the first 8 bits.
+	 * Updated each sched "tick" (~2ms)
+	 */
+	ret = readl_poll_timeout(mhdp->regs + KEEP_ALIVE, reg,
+				 reg & CDNS_KEEP_ALIVE_MASK, 500,
+				 CDNS_KEEP_ALIVE_TIMEOUT);
+	if (ret) {
+		dev_err(dev,
+			"device didn't give any life sign: reg %d\n", reg);
+		goto clk_disable;
+	}
+
+	/* Mailbox protect for DP PHY access */
+	mutex_lock(&mhdp->mbox_mutex);
+	/* DP PHY init before AUX init */
+	ret = phy_init(mhdp->phy);
+	mutex_unlock(&mhdp->mbox_mutex);
+	if (ret) {
+		dev_err(dev, "Failed to initialize PHY: %d\n", ret);
+		goto clk_disable;
+	}
+
+	/* Enable Hotplug Detect IRQ */
+	if (cdns_dp_read_hpd(mhdp))
+		enable_irq(mhdp->irq[IRQ_OUT]);
+	else
+		enable_irq(mhdp->irq[IRQ_IN]);
+
+	mhdp->bridge.driver_private = mhdp;
+	mhdp->bridge.funcs = &cdns_dp_bridge_funcs;
+	mhdp->bridge.of_node = dev->of_node;
+	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HPD;
+	mhdp->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	drm_bridge_add(&mhdp->bridge);
+
+	return 0;
+
+clk_disable:
+	clk_disable_unprepare(mhdp->apb_clk);
+
+	return -EINVAL;
+}
+
+static int cdns_mhdp_dp_remove(struct platform_device *pdev)
+{
+	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
+
+	cdns_dp_aux_destroy(mhdp);
+
+	return 0;
+}
+
+static struct cdns_plat_data imx8mq_dp_drv_data = {
+	.lane_mapping = 0xc6,
+};
+
+static const struct of_device_id cdns_mhdp_dp_dt_ids[] = {
+	{ .compatible = "cdns,mhdp8501-dp", },
+	{ .compatible = "fsl,imx8mq-mhdp8501-dp",
+	  .data = &imx8mq_dp_drv_data
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, cdns_mhdp_dp_dt_ids);
+
+static struct platform_driver cdns_mhdp_dp_platform_driver = {
+	.probe  = cdns_mhdp_dp_probe,
+	.remove = cdns_mhdp_dp_remove,
+	.driver = {
+		.name = "cdns-mhdp8501-dp",
+		.of_match_table = cdns_mhdp_dp_dt_ids,
+	},
+};
+
+module_platform_driver(cdns_mhdp_dp_platform_driver);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence MHDP8501 Display Port transmitter driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cdns-mhdp8501-dp");
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.h
new file mode 100644
index 000000000000..62466ba7f813
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8501.h
@@ -0,0 +1,399 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Cadence MHDP 8501 Common head file
+ *
+ * Copyright (C) 2019-2022 NXP Semiconductor, Inc.
+ *
+ */
+
+#ifndef _CDNS_MHDP_COMMON_H_
+#define _CDNS_MHDP_COMMON_H_
+
+#include <drm/drm_bridge.h>
+#include <drm/drm_connector.h>
+#include <drm/display/drm_dp_helper.h>
+#include <linux/bitops.h>
+
+#define ADDR_IMEM		0x10000
+#define ADDR_DMEM		0x20000
+
+/* APB CFG addr */
+#define APB_CTRL					0
+#define XT_INT_CTRL					0x04
+#define MAILBOX_FULL_ADDR			0x08
+#define MAILBOX_EMPTY_ADDR			0x0c
+#define MAILBOX0_WR_DATA			0x10
+#define MAILBOX0_RD_DATA			0x14
+#define KEEP_ALIVE					0x18
+#define VER_L						0x1c
+#define VER_H						0x20
+#define VER_LIB_L_ADDR				0x24
+#define VER_LIB_H_ADDR				0x28
+#define SW_DEBUG_L					0x2c
+#define SW_DEBUG_H					0x30
+#define MAILBOX_INT_MASK			0x34
+#define MAILBOX_INT_STATUS			0x38
+#define SW_CLK_L					0x3c
+#define SW_CLK_H					0x40
+#define SW_EVENTS0					0x44
+#define SW_EVENTS1					0x48
+#define SW_EVENTS2					0x4c
+#define SW_EVENTS3					0x50
+#define XT_OCD_CTRL					0x60
+#define APB_INT_MASK				0x6c
+#define APB_STATUS_MASK				0x70
+
+/* source phy comp */
+#define PHY_DATA_SEL			0x0818
+#define LANES_CONFIG			0x0814
+
+/* source car addr */
+#define SOURCE_HDTX_CAR			0x0900
+#define SOURCE_DPTX_CAR			0x0904
+#define SOURCE_PHY_CAR			0x0908
+#define SOURCE_CEC_CAR			0x090c
+#define SOURCE_CBUS_CAR			0x0910
+#define SOURCE_PKT_CAR			0x0918
+#define SOURCE_AIF_CAR			0x091c
+#define SOURCE_CIPHER_CAR		0x0920
+#define SOURCE_CRYPTO_CAR		0x0924
+
+/* clock meters addr */
+#define CM_CTRL					0x0a00
+#define CM_I2S_CTRL				0x0a04
+#define CM_SPDIF_CTRL			0x0a08
+#define CM_VID_CTRL				0x0a0c
+#define CM_LANE_CTRL			0x0a10
+#define I2S_NM_STABLE			0x0a14
+#define I2S_NCTS_STABLE			0x0a18
+#define SPDIF_NM_STABLE			0x0a1c
+#define SPDIF_NCTS_STABLE		0x0a20
+#define NMVID_MEAS_STABLE		0x0a24
+#define I2S_MEAS				0x0a40
+#define SPDIF_MEAS				0x0a80
+#define NMVID_MEAS				0x0ac0
+
+/* source vif addr */
+#define BND_HSYNC2VSYNC			0x0b00
+#define HSYNC2VSYNC_F1_L1		0x0b04
+#define HSYNC2VSYNC_STATUS		0x0b0c
+#define HSYNC2VSYNC_POL_CTRL	0x0b10
+
+/* mhdp tx_top_comp */
+#define SCHEDULER_H_SIZE		0x1000
+#define SCHEDULER_V_SIZE		0x1004
+#define HDTX_SIGNAL_FRONT_WIDTH	0x100c
+#define HDTX_SIGNAL_SYNC_WIDTH	0x1010
+#define HDTX_SIGNAL_BACK_WIDTH	0x1014
+#define HDTX_CONTROLLER			0x1018
+#define HDTX_HPD				0x1020
+#define HDTX_CLOCK_REG_0		0x1024
+#define HDTX_CLOCK_REG_1		0x1028
+
+/* DPTX hpd addr */
+#define HPD_IRQ_DET_MIN_TIMER		0x2100
+#define HPD_IRQ_DET_MAX_TIMER		0x2104
+#define HPD_UNPLGED_DET_MIN_TIMER	0x2108
+#define HPD_STABLE_TIMER			0x210c
+#define HPD_FILTER_TIMER			0x2110
+#define HPD_EVENT_MASK				0x211c
+#define HPD_EVENT_DET				0x2120
+
+/* DPTX framer addr */
+#define DP_FRAMER_GLOBAL_CONFIG		0x2200
+#define DP_SW_RESET					0x2204
+#define DP_FRAMER_TU				0x2208
+#define DP_FRAMER_PXL_REPR			0x220c
+#define DP_FRAMER_SP				0x2210
+#define AUDIO_PACK_CONTROL			0x2214
+#define DP_VC_TABLE(x)				(0x2218 + ((x) << 2))
+#define DP_VB_ID					0x2258
+#define DP_MTPH_LVP_CONTROL			0x225c
+#define DP_MTPH_SYMBOL_VALUES		0x2260
+#define DP_MTPH_ECF_CONTROL			0x2264
+#define DP_MTPH_ACT_CONTROL			0x2268
+#define DP_MTPH_STATUS				0x226c
+#define DP_INTERRUPT_SOURCE			0x2270
+#define DP_INTERRUPT_MASK			0x2274
+#define DP_FRONT_BACK_PORCH			0x2278
+#define DP_BYTE_COUNT				0x227c
+
+/* dptx stream addr */
+#define MSA_HORIZONTAL_0			0x2280
+#define MSA_HORIZONTAL_1			0x2284
+#define MSA_VERTICAL_0				0x2288
+#define MSA_VERTICAL_1				0x228c
+#define MSA_MISC					0x2290
+#define STREAM_CONFIG				0x2294
+#define AUDIO_PACK_STATUS			0x2298
+#define VIF_STATUS					0x229c
+#define PCK_STUFF_STATUS_0			0x22a0
+#define PCK_STUFF_STATUS_1			0x22a4
+#define INFO_PACK_STATUS			0x22a8
+#define RATE_GOVERNOR_STATUS		0x22ac
+#define DP_HORIZONTAL				0x22b0
+#define DP_VERTICAL_0				0x22b4
+#define DP_VERTICAL_1				0x22b8
+#define DP_BLOCK_SDP				0x22bc
+
+/* dptx glbl addr */
+#define DPTX_LANE_EN				0x2300
+#define DPTX_ENHNCD					0x2304
+#define DPTX_INT_MASK				0x2308
+#define DPTX_INT_STATUS				0x230c
+
+/* dp aux addr */
+#define DP_AUX_HOST_CONTROL			0x2800
+#define DP_AUX_INTERRUPT_SOURCE		0x2804
+#define DP_AUX_INTERRUPT_MASK		0x2808
+#define DP_AUX_SWAP_INVERSION_CONTROL	0x280c
+#define DP_AUX_SEND_NACK_TRANSACTION	0x2810
+#define DP_AUX_CLEAR_RX				0x2814
+#define DP_AUX_CLEAR_TX				0x2818
+#define DP_AUX_TIMER_STOP			0x281c
+#define DP_AUX_TIMER_CLEAR			0x2820
+#define DP_AUX_RESET_SW				0x2824
+#define DP_AUX_DIVIDE_2M			0x2828
+#define DP_AUX_TX_PREACHARGE_LENGTH	0x282c
+#define DP_AUX_FREQUENCY_1M_MAX		0x2830
+#define DP_AUX_FREQUENCY_1M_MIN		0x2834
+#define DP_AUX_RX_PRE_MIN			0x2838
+#define DP_AUX_RX_PRE_MAX			0x283c
+#define DP_AUX_TIMER_PRESET			0x2840
+#define DP_AUX_NACK_FORMAT			0x2844
+#define DP_AUX_TX_DATA				0x2848
+#define DP_AUX_RX_DATA				0x284c
+#define DP_AUX_TX_STATUS			0x2850
+#define DP_AUX_RX_STATUS			0x2854
+#define DP_AUX_RX_CYCLE_COUNTER		0x2858
+#define DP_AUX_MAIN_STATES			0x285c
+#define DP_AUX_MAIN_TIMER			0x2860
+#define DP_AUX_AFE_OUT				0x2864
+
+/* source pif addr */
+#define SOURCE_PIF_WR_ADDR			0x30800
+#define SOURCE_PIF_WR_REQ			0x30804
+#define SOURCE_PIF_RD_ADDR			0x30808
+#define SOURCE_PIF_RD_REQ			0x3080c
+#define SOURCE_PIF_DATA_WR			0x30810
+#define SOURCE_PIF_DATA_RD			0x30814
+#define SOURCE_PIF_FIFO1_FLUSH		0x30818
+#define SOURCE_PIF_FIFO2_FLUSH		0x3081c
+#define SOURCE_PIF_STATUS			0x30820
+#define SOURCE_PIF_INTERRUPT_SOURCE	0x30824
+#define SOURCE_PIF_INTERRUPT_MASK	0x30828
+#define SOURCE_PIF_PKT_ALLOC_REG	0x3082c
+#define SOURCE_PIF_PKT_ALLOC_WR_EN	0x30830
+#define SOURCE_PIF_SW_RESET			0x30834
+
+/* mailbox */
+#define MB_MODULE_ID_DP_TX			0x01
+#define MB_MODULE_ID_HDMI_TX		0x03
+#define MB_MODULE_ID_HDCP_TX		0x07
+#define MB_MODULE_ID_HDCP_RX		0x08
+#define MB_MODULE_ID_HDCP_GENERAL	0x09
+#define MB_MODULE_ID_GENERAL		0x0A
+
+/* General opcode */
+#define GENERAL_MAIN_CONTROL		0x01
+#define GENERAL_TEST_ECHO			0x02
+#define GENERAL_BUS_SETTINGS		0x03
+#define GENERAL_TEST_ACCESS			0x04
+#define GENERAL_WRITE_FIELD			0x06
+#define GENERAL_READ_REGISTER		0x07
+#define GENERAL_GET_HPD_STATE		0x11
+
+/* DPTX opcode */
+#define DPTX_SET_POWER_MNG			0x00
+#define DPTX_SET_HOST_CAPABILITIES	0x01
+#define DPTX_GET_EDID				0x02
+#define DPTX_READ_DPCD				0x03
+#define DPTX_WRITE_DPCD				0x04
+#define DPTX_ENABLE_EVENT			0x05
+#define DPTX_WRITE_REGISTER			0x06
+#define DPTX_READ_REGISTER			0x07
+#define DPTX_WRITE_FIELD			0x08
+#define DPTX_TRAINING_CONTROL		0x09
+#define DPTX_READ_EVENT				0x0a
+#define DPTX_READ_LINK_STAT			0x0b
+#define DPTX_SET_VIDEO				0x0c
+#define DPTX_SET_AUDIO				0x0d
+#define DPTX_GET_LAST_AUX_STAUS		0x0e
+#define DPTX_SET_LINK_BREAK_POINT	0x0f
+#define DPTX_FORCE_LANES			0x10
+#define DPTX_HPD_STATE				0x11
+
+/* HDMI TX opcode */
+#define HDMI_TX_READ				0x00
+#define HDMI_TX_WRITE				0x01
+#define HDMI_TX_UPDATE_READ			0x02
+#define HDMI_TX_EDID				0x03
+#define HDMI_TX_EVENTS				0x04
+#define HDMI_TX_HPD_STATUS			0x05
+
+#define MHDP_EVENT_ENABLE_HPD			BIT(0)
+#define MHDP_EVENT_ENABLE_TRAINING		BIT(1)
+
+#define LINK_TRAINING_NOT_ACTIVE		0
+#define LINK_TRAINING_RUN				1
+#define LINK_TRAINING_RESTART			2
+
+#define CONTROL_VIDEO_IDLE				0
+#define CONTROL_VIDEO_VALID				1
+
+#define INTERLACE_FMT_DET				BIT(12)
+#define VIF_BYPASS_INTERLACE			BIT(13)
+#define TU_CNT_RST_EN					BIT(15)
+#define INTERLACE_DTCT_WIN				0x20
+
+#define DP_FRAMER_SP_INTERLACE_EN		BIT(2)
+#define DP_FRAMER_SP_HSP				BIT(1)
+#define DP_FRAMER_SP_VSP				BIT(0)
+
+/* capability */
+#define AUX_HOST_INVERT					3
+#define	FAST_LT_SUPPORT					1
+#define FAST_LT_NOT_SUPPORT				0
+#define LANE_MAPPING_NORMAL				0x1b
+#define LANE_MAPPING_FLIPPED			0xe4
+#define ENHANCED						1
+#define SCRAMBLER_EN					BIT(4)
+
+#define	FULL_LT_STARTED					BIT(0)
+#define FASE_LT_STARTED					BIT(1)
+#define CLK_RECOVERY_FINISHED			BIT(2)
+#define EQ_PHASE_FINISHED				BIT(3)
+#define FASE_LT_START_FINISHED			BIT(4)
+#define CLK_RECOVERY_FAILED				BIT(5)
+#define EQ_PHASE_FAILED					BIT(6)
+#define FASE_LT_FAILED					BIT(7)
+
+#define TU_SIZE					30
+#define CDNS_DP_MAX_LINK_RATE	540000
+
+#define F_HDMI_ENCODING(x) (((x) & ((1 << 2) - 1)) << 16)
+#define F_VIF_DATA_WIDTH(x) (((x) & ((1 << 2) - 1)) << 2)
+#define F_HDMI_MODE(x) (((x) & ((1 << 2) - 1)) << 0)
+#define F_GCP_EN(x) (((x) & ((1 << 1) - 1)) << 12)
+#define F_DATA_EN(x) (((x) & ((1 << 1) - 1)) << 15)
+#define F_HDMI2_PREAMBLE_EN(x) (((x) & ((1 << 1) - 1)) << 18)
+#define F_PIC_3D(x) (((x) & ((1 << 4) - 1)) << 7)
+#define F_BCH_EN(x) (((x) & ((1 << 1) - 1)) << 11)
+#define F_SOURCE_PHY_MHDP_SEL(x) (((x) & ((1 << 2) - 1)) << 3)
+#define F_HPD_VALID_WIDTH(x) (((x) & ((1 << 12) - 1)) << 0)
+#define F_HPD_GLITCH_WIDTH(x) (((x) & ((1 << 8) - 1)) << 12)
+#define F_HDMI2_CTRL_IL_MODE(x) (((x) & ((1 << 1) - 1)) << 19)
+#define F_SOURCE_PHY_LANE0_SWAP(x) (((x) & ((1 << 2) - 1)) << 0)
+#define F_SOURCE_PHY_LANE1_SWAP(x) (((x) & ((1 << 2) - 1)) << 2)
+#define F_SOURCE_PHY_LANE2_SWAP(x) (((x) & ((1 << 2) - 1)) << 4)
+#define F_SOURCE_PHY_LANE3_SWAP(x) (((x) & ((1 << 2) - 1)) << 6)
+#define F_SOURCE_PHY_COMB_BYPASS(x) (((x) & ((1 << 1) - 1)) << 21)
+#define F_SOURCE_PHY_20_10(x) (((x) & ((1 << 1) - 1)) << 22)
+#define F_PKT_ALLOC_ADDRESS(x) (((x) & ((1 << 4) - 1)) << 0)
+#define F_ACTIVE_IDLE_TYPE(x) (((x) & ((1 << 1) - 1)) << 17)
+#define F_FIFO1_FLUSH(x) (((x) & ((1 << 1) - 1)) << 0)
+#define F_PKT_ALLOC_WR_EN(x) (((x) & ((1 << 1) - 1)) << 0)
+#define F_DATA_WR(x) (x)
+#define F_WR_ADDR(x) (((x) & ((1 << 4) - 1)) << 0)
+#define F_HOST_WR(x) (((x) & ((1 << 1) - 1)) << 0)
+#define F_TYPE_VALID(x) (((x) & ((1 << 1) - 1)) << 16)
+#define F_PACKET_TYPE(x) (((x) & ((1 << 8) - 1)) << 8)
+
+/* Reference cycles when using lane clock as reference */
+#define LANE_REF_CYC				0x8000
+
+/* HPD Debounce */
+#define HOTPLUG_DEBOUNCE_MS			200
+
+/* HPD IRQ Index */
+#define IRQ_IN    0
+#define IRQ_OUT   1
+#define IRQ_NUM   2
+
+/* FW check alive timeout */
+#define CDNS_KEEP_ALIVE_TIMEOUT		2000
+#define CDNS_KEEP_ALIVE_MASK		GENMASK(7, 0)
+
+enum voltage_swing_level {
+	VOLTAGE_LEVEL_0,
+	VOLTAGE_LEVEL_1,
+	VOLTAGE_LEVEL_2,
+	VOLTAGE_LEVEL_3,
+};
+
+enum pre_emphasis_level {
+	PRE_EMPHASIS_LEVEL_0,
+	PRE_EMPHASIS_LEVEL_1,
+	PRE_EMPHASIS_LEVEL_2,
+	PRE_EMPHASIS_LEVEL_3,
+};
+
+enum pattern_set {
+	PTS1		= BIT(0),
+	PTS2		= BIT(1),
+	PTS3		= BIT(2),
+	PTS4		= BIT(3),
+	DP_NONE		= BIT(4)
+};
+
+enum vic_color_depth {
+	BCS_6 = 0x1,
+	BCS_8 = 0x2,
+	BCS_10 = 0x4,
+	BCS_12 = 0x8,
+	BCS_16 = 0x10,
+};
+
+enum vic_bt_type {
+	BT_601 = 0x0,
+	BT_709 = 0x1,
+};
+
+enum {
+	MODE_DVI,
+	MODE_HDMI_1_4,
+	MODE_HDMI_2_0,
+};
+
+struct video_info {
+	int bpc;
+	int color_fmt;
+};
+
+struct cdns_mhdp_device {
+	struct device *dev;
+	void __iomem *regs;
+	struct drm_connector connector;
+	struct drm_connector *curr_conn;
+	struct drm_bridge	bridge;
+	struct clk *apb_clk;
+	struct phy *phy;
+
+	struct video_info video_info;
+	struct drm_display_mode mode;
+
+	int irq[IRQ_NUM];
+	struct delayed_work hotplug_work;
+	u32 lane_mapping;
+	/* protect mailbox communications with the firmware */
+	struct mutex mbox_mutex;
+
+	const struct cdns_plat_data *plat_data;
+
+	union {
+		struct _dp_data {
+			u32 rate;
+			u8 num_lanes;
+			struct drm_dp_aux aux;
+			u8 dpcd[DP_RECEIVER_CAP_SIZE];
+		} dp;
+		struct _hdmi_data {
+			u32 hdmi_type;
+		} hdmi;
+	};
+};
+
+struct cdns_plat_data {
+	int lane_mapping;
+};
+#endif
-- 
2.34.1

