Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 63EF87CBBED
	for <lists+dri-devel@lfdr.de>; Tue, 17 Oct 2023 09:06:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 832CE10E26E;
	Tue, 17 Oct 2023 07:06:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-AM7-obe.outbound.protection.outlook.com
 (mail-am7eur03on2042.outbound.protection.outlook.com [40.107.105.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE69C10E26E
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Oct 2023 07:06:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CmPhvji1Zmp1qurSVPd3qs0rQL+VWuWaz+A0krVPCM2+U4U1wObuYHyA/0AshHqgqEZP0zOYT7dC3AS9nDRniR/XqdLmqd1X1H6MROYHwOUhbB5jlZlbioc3C1q7eD8uxgk4ervaHNZr1aYxxLQhTyNFxjoj3RffZ9ageaimv5AP6IzFCqmL+Nl2q+pAAG2KB3AQ4cXfjBR2uWyF4LzLKHdUQRnJFDflS8Wvo22Fy8jmCL0Oo0Su0UI1Kr0sLrueVZQ7CUrfw1986Bi7SyM1/tYdb0lyn6kEfu5jTPm/h+cGXk4YRpCCW4eBjcs0762CPSk13a41oDTQ8KXC1g9Kag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hOnzlcqvZoH+m8hSw1V1lytR9vlO9jPINwyWVtfi6YY=;
 b=I2Pan6h+3zbX00Ui0AHtcCLwLILferoS7l6Qvd0I3A4dHSLq93o9kRoL2Wfk+WPuVM3Y3zYkh/zZRCOF6pt6zOxYpY9U/6cRwDU0ouEnG/BsLIFiOMR/Me4bd2urprBBqajuPluiRd2mhB3Mk9Xz+bBk3osw9UzwJKZk4FhvrcUXHEugsLqQuxAyIFn//6Lw8+/rnK8wlhxetutFTyIgkzQ9X1Za2Vz0ntRsg4Ux8Hl4GcqbVYmC5zLJGk5mDt3g6Z4iIIV8LDck/fKIYgtxD5N36Rez18Jjd91TOLhxOCi9fNAVq1vH/rfuIFJzr38qxj6waUmtsbAg/LlXh6AqYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hOnzlcqvZoH+m8hSw1V1lytR9vlO9jPINwyWVtfi6YY=;
 b=CDl8O6sTvcf0If4J35plWnK7QztOl+GvWp+lpKRZGbMV8cVxvly90mqohaz2EKu5jXc7lF73vd66eX6JXqc7mW44Y0pkI+OJZm0Mt+4hGxwUWBf1UMoDvrCPu5u30xBDwDiYtNeteFCqf/xeGV5NBGXfho0qv/iGSurPAubIy04=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by PAXPR04MB8622.eurprd04.prod.outlook.com (2603:10a6:102:219::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 07:05:56 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::3b23:7c3d:fd28:c3f2%7]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 07:05:56 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Subject: [PATCH v11 1/7] drm: bridge: Cadence: Creat mhdp helper driver
Date: Tue, 17 Oct 2023 15:03:57 +0800
Message-Id: <c4b4b7a56fe79c62f5138593f8048ab5385eac09.1697524277.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1697524277.git.Sandor.yu@nxp.com>
References: <cover.1697524277.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR03CA0122.apcprd03.prod.outlook.com
 (2603:1096:4:91::26) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|PAXPR04MB8622:EE_
X-MS-Office365-Filtering-Correlation-Id: 663c85a9-06fb-4b74-30c2-08dbcedf8235
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KJKXr5nj838jojeD+AgfgbhJZbe8mOYj5VsJxSDEhSoz9xnj9QWAoWMhzUAWYKYokM1TV/0ZocdFxQv+wu7ETExdCmOFXllSkMH/fWdmkzAh/ysxwhgB2jzHB0uJiAIRoZEFj0d13xoTzzoVCQXJGbahSY1+8A/6r51gxlwqLd2pqioyamewI8SjY9pXyMkECZX/UeAWzieHlOuMFZX+GaduCCxM6DxxBHDOp27y3qonIm3PE4MpuCCsB2Vs1/d3B1KOYxxqt9DoZYyzSgwd7bPIHDTIGFF7ANydAQdvHLIK8Cu4I12CGhiDoTxWgKT5LjKlCM/4xfDWe2P4G04k5ykYSrwYx1lLyERKAAZadNJ+ZfHOsRCEpvTvFP3FbsNnswIv1gYcYNAF3Egik9c8VGWtBbHGZAHtGjBqZFHDR3T2HRSvLjTxwVVzkeTJB4iagUy8Y1zor/pPvJ9vixROAGci7dhfn4vg22MxbcG6LWjdSQZsQaod6RfA5YGNVxKCqHVPUT6fYB9yV3e6vNFxTkIYBhjELGUE2kRxBwDoK/DlCZYdvLz4IW5ka36c+WlFTcJ1bM11oY3H7eO0yYnIPqtFIRQxBlVBGqK/IV/dIaJlXR3pbIf6fjNjXT1EQPbr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(346002)(39860400002)(396003)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799009)(478600001)(2616005)(6486002)(52116002)(6506007)(41300700001)(6512007)(316002)(5660300002)(26005)(66946007)(66476007)(66556008)(38350700005)(921005)(36756003)(38100700002)(86362001)(83380400001)(30864003)(4326008)(8676002)(8936002)(2906002)(7416002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Wo4ANIfsFIXeukxIu+YwDbCMseXLnCiWZcXcrbjfUMMZO/Fz5HwDUIRaI39K?=
 =?us-ascii?Q?+xpuchT7TVjy+2NrF9fncFZ0VbN2vjhR4ZLaEXsvMN6OnFYrvodAWZhw+aVj?=
 =?us-ascii?Q?HtrmHjCAey5rnkKzMjY0cPnNdC2NjeYmWwxMuo9hgSq7gy3Y6YzKu+oLAiot?=
 =?us-ascii?Q?qC60X6uCbsFWgvuMuy9aY4+kypBxVAVTAjtcbYqos4hHOzk99RxvD57WxNua?=
 =?us-ascii?Q?48iUP0fOmXweulTXn+FJX8jZteRtSV5E8j9iiy9ddgrPoAC4RVn5waCsdH/B?=
 =?us-ascii?Q?CCZ0GIvfsh5kp4sbGs9P+NoJVVLf4CHM3Q2BL0JNkIJDUZCyqHHp1QY1nuC2?=
 =?us-ascii?Q?dzv8dnS8z6yBnRnAgbi2PmikM4rn6LQJktI6Np9m6h88PsfZ621DRbplKopF?=
 =?us-ascii?Q?7qJlwOHg+D5gn0reB7xeevLhSiE2hoyz3YQ0EDK8Gro9AEhHYwNPp67s7MO6?=
 =?us-ascii?Q?OdE9eYst9Fc1Kypl6yse0zGjKyZXAQCj8XSEa3jCPbMsmk9WAvhabXnNb8OD?=
 =?us-ascii?Q?S1mNmIPb+dNpSPVTc98dI4HoDwoRMMtuF7SBpNrD6WE+/J8cWgTu1AF+97U4?=
 =?us-ascii?Q?iT0TTJO8uaG9x90bayZ5dhQcAzKuKI0d1ps2DngxnpvPg+gVCJ5eumvHEbeV?=
 =?us-ascii?Q?ZFP2MMjtSrUi51lsnp9Zlwz+QzbsPtTRJEicxPhnf1yKq/dEc8nSCsDlyxDb?=
 =?us-ascii?Q?hgLh5T9NAqKj7Rs9leLPGm/aG0svJ9w4IN9dMxC+g/9avMpHySIewH8M/Jm5?=
 =?us-ascii?Q?0M/VXe/b7G0DjOHgPxdPRJ9znN5IrSjApEUn3mnCPdHPB64/PqM0Y1bRlyE2?=
 =?us-ascii?Q?ssK18O0eMQRz76n8KlwlbkPBj0qSYNMBrs+LCf3fuZ2i4ZUQxR5bH6PakKdV?=
 =?us-ascii?Q?27ZTIM3JYmAvcPnaoQ6Sw0/58BXgT/tJKDZl/GX2MQ5YFRJptVOooObIjcxT?=
 =?us-ascii?Q?XKOPgwvPT5b9ilhVknQOfWI4BEeWUlWdR5cYyDj+7DUCR4ZiyVxPX0B8F86q?=
 =?us-ascii?Q?+SJccO47ASe2tr5ovUJ74VahsezRUpLI9+mw/C2p8alh9NyLJ8lHqODDGjqC?=
 =?us-ascii?Q?+KCO14EQFyMIqO9Lrkcn4rzAqRuSX2D2uybaXe+0ted3BB/ev7+xB/4CYy4Y?=
 =?us-ascii?Q?I/51qszYUtTbscAH7luqDIlzMl/fcgYyAyDd2VL0LCC5hEef4zrMwSlH75/p?=
 =?us-ascii?Q?m6vJHL06bIxlNrwfqjHwTRbkLOcDUhU/IX6XnrDYsP0mEFtOHgeehuKeGq0/?=
 =?us-ascii?Q?niJviQKtBPxIuM/yrWb7tu8vXQCD8a26L6H9GNeCs+SEqg8DJFPWhiYyuu4A?=
 =?us-ascii?Q?tvuiLolEkA7IlhU92nVd0I5uxL9Lbngu/XKZ4lXcBFtODrWBYCTM8M1A42sG?=
 =?us-ascii?Q?vjR5/1HqODohcrCcGdfMzeQneNSPVPteTDxuxj6OKH36VE7ViusGTilrGeO1?=
 =?us-ascii?Q?e4ZjlZz3NJPgDRij9r++Lruti/BV/ZqFfm2PDcrBxTCma0sgXprRHcer4Pew?=
 =?us-ascii?Q?etfpLG0gKTDAzRbvLtSdYSZwytBEy4Q75TokSaIHN18zzhd9hhgNHkj2V54d?=
 =?us-ascii?Q?h1Z8d4beWzoilsrLp9ABihTnuVRWfT4TxUqgD0j5?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 663c85a9-06fb-4b74-30c2-08dbcedf8235
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 07:05:56.5032 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k56EPny89rKyKJOZ3MdHLAzEyYcRphGDI8uFomXmwC0UWVhrchBnHXzj5Tb6sXLjgIXrmmVR7rj9nz115W1gwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8622
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
Cc: oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, Sandor.yu@nxp.com,
 linux-imx@nxp.com, kernel@pengutronix.de, sam@ravnborg.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

MHDP8546 mailbox access functions will be share to other mhdp driver
and Cadence HDP-TX HDMI/DP PHY drivers.
Create a new mhdp helper driver and move all those functions into.

cdns_mhdp_reg_write() is renamed to cdns_mhdp_dp_reg_write(),
because it use the DPTX command ID DPTX_WRITE_REGISTER.

New cdns_mhdp_reg_write() is created with the general command ID
GENERAL_REGISTER_WRITE.

rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
same as the other mailbox access functions.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v10->v11:
- rewrite cdns_mhdp_set_firmware_active() in mhdp8546 core driver,
use cdns_mhdp_mailbox_send() to replace cdns_mhdp_mailbox_write()
same as the other mailbox access functions.
- use static for cdns_mhdp_mailbox_write() and cdns_mhdp_mailbox_read()
and remove them from EXPORT_SYMBOL_GPL().

v9->v10:
 *use mhdp helper driver to replace macro functions,
 move maibox access function and mhdp hdmi/dp common API
 functions into the driver.

 drivers/gpu/drm/bridge/cadence/Kconfig        |   4 +
 drivers/gpu/drm/bridge/cadence/Makefile       |   1 +
 .../gpu/drm/bridge/cadence/cdns-mhdp-helper.c | 304 +++++++++++++
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 403 +++---------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  44 +-
 include/drm/bridge/cdns-mhdp-helper.h         |  94 ++++
 6 files changed, 476 insertions(+), 374 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
 create mode 100644 include/drm/bridge/cdns-mhdp-helper.h

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index ec35215a20034..0b7b4626a7af0 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -20,6 +20,9 @@ config DRM_CDNS_DSI_J721E
 	  the routing of the DSS DPI signal to the Cadence DSI.
 endif
 
+config CDNS_MHDP_HELPER
+	tristate
+
 config DRM_CDNS_MHDP8546
 	tristate "Cadence DPI/DP bridge"
 	select DRM_DISPLAY_DP_HELPER
@@ -27,6 +30,7 @@ config DRM_CDNS_MHDP8546
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
+	select CDNS_MHDP_HELPER
 	depends on OF
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
diff --git a/drivers/gpu/drm/bridge/cadence/Makefile b/drivers/gpu/drm/bridge/cadence/Makefile
index c95fd5b81d137..087dc074820d7 100644
--- a/drivers/gpu/drm/bridge/cadence/Makefile
+++ b/drivers/gpu/drm/bridge/cadence/Makefile
@@ -2,6 +2,7 @@
 obj-$(CONFIG_DRM_CDNS_DSI) += cdns-dsi.o
 cdns-dsi-y := cdns-dsi-core.o
 cdns-dsi-$(CONFIG_DRM_CDNS_DSI_J721E) += cdns-dsi-j721e.o
+obj-$(CONFIG_CDNS_MHDP_HELPER) += cdns-mhdp-helper.o
 obj-$(CONFIG_DRM_CDNS_MHDP8546) += cdns-mhdp8546.o
 cdns-mhdp8546-y := cdns-mhdp8546-core.o cdns-mhdp8546-hdcp.o
 cdns-mhdp8546-$(CONFIG_DRM_CDNS_MHDP8546_J721E) += cdns-mhdp8546-j721e.o
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
new file mode 100644
index 0000000000000..8cabd79ad9663
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp-helper.c
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 NXP Semiconductor, Inc.
+ *
+ */
+#include <drm/bridge/cdns-mhdp-helper.h>
+#include <linux/dev_printk.h>
+#include <linux/module.h>
+
+/* Mailbox helper functions */
+static int cdns_mhdp_mailbox_read(struct cdns_mhdp_base *base)
+{
+	int ret, empty;
+
+	WARN_ON(!mutex_is_locked(base->mbox_mutex));
+
+	ret = readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_EMPTY,
+				 empty, !empty, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	return readl(base->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
+}
+
+static int cdns_mhdp_mailbox_write(struct cdns_mhdp_base *base, u8 val)
+{
+	int ret, full;
+
+	WARN_ON(!mutex_is_locked(base->mbox_mutex));
+
+	ret = readx_poll_timeout(readl, base->regs + CDNS_MAILBOX_FULL,
+				 full, !full, MAILBOX_RETRY_US,
+				 MAILBOX_TIMEOUT_US);
+	if (ret < 0)
+		return ret;
+
+	writel(val, base->regs + CDNS_MAILBOX_TX_DATA);
+
+	return 0;
+}
+
+int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
+				  u8 module_id, u8 opcode,
+				  u16 req_size)
+{
+	u32 mbox_size, i;
+	u8 header[4];
+	int ret;
+
+	/* read the header of the message */
+	for (i = 0; i < sizeof(header); i++) {
+		ret = cdns_mhdp_mailbox_read(base);
+		if (ret < 0)
+			return ret;
+
+		header[i] = ret;
+	}
+
+	mbox_size = get_unaligned_be16(header + 2);
+
+	if (opcode != header[0] || module_id != header[1] ||
+	    req_size != mbox_size) {
+		/*
+		 * If the message in mailbox is not what we want, we need to
+		 * clear the mailbox by reading its contents.
+		 */
+		for (i = 0; i < mbox_size; i++)
+			if (cdns_mhdp_mailbox_read(base) < 0)
+				break;
+
+		return -EINVAL;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_header);
+
+int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
+				u8 *buff, u16 buff_size)
+{
+	u32 i;
+	int ret;
+
+	for (i = 0; i < buff_size; i++) {
+		ret = cdns_mhdp_mailbox_read(base);
+		if (ret < 0)
+			return ret;
+
+		buff[i] = ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_recv_data);
+
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+			   u8 opcode, u16 size, u8 *message)
+{
+	u8 header[4];
+	int ret, i;
+
+	header[0] = opcode;
+	header[1] = module_id;
+	put_unaligned_be16(size, header + 2);
+
+	for (i = 0; i < sizeof(header); i++) {
+		ret = cdns_mhdp_mailbox_write(base, header[i]);
+		if (ret)
+			return ret;
+	}
+
+	for (i = 0; i < size; i++) {
+		ret = cdns_mhdp_mailbox_write(base, message[i]);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_mailbox_send);
+
+/* General helper functions */
+int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value)
+{
+	u8 msg[4], resp[8];
+	int ret;
+
+	put_unaligned_be32(addr, msg);
+
+	mutex_lock(base->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
+				     GENERAL_REGISTER_READ,
+				     sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_GENERAL,
+					    GENERAL_REGISTER_READ,
+					    sizeof(resp));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, resp, sizeof(resp));
+	if (ret)
+		goto out;
+
+	/* Returned address value should be the same as requested */
+	if (memcmp(msg, resp, sizeof(msg))) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	*value = get_unaligned_be32(resp + 4);
+
+out:
+	mutex_unlock(base->mbox_mutex);
+	if (ret) {
+		dev_err(base->dev, "Failed to read register\n");
+		*value = 0;
+	}
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_reg_read);
+
+int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val)
+{
+	u8 msg[8];
+	int ret;
+
+	put_unaligned_be32(addr, msg);
+	put_unaligned_be32(val, msg + 4);
+
+	mutex_lock(base->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_GENERAL,
+				     GENERAL_REGISTER_WRITE,
+				     sizeof(msg), msg);
+
+	mutex_unlock(base->mbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_reg_write);
+
+/* DPTX helper functions */
+int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 val)
+{
+	u8 msg[6];
+	int ret;
+
+	put_unaligned_be16(addr, msg);
+	put_unaligned_be32(val, msg + 2);
+
+	mutex_lock(base->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
+
+	mutex_unlock(base->mbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write);
+
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val)
+{
+	u8 field[8];
+	int ret;
+
+	put_unaligned_be16(addr, field);
+	field[2] = start_bit;
+	field[3] = bits_no;
+	put_unaligned_be32(val, field + 4);
+
+	mutex_lock(base->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_FIELD, sizeof(field), field);
+
+	mutex_unlock(base->mbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dp_reg_write_bit);
+
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len)
+{
+	u8 msg[5], reg[5];
+	int ret;
+
+	put_unaligned_be16(len, msg);
+	put_unaligned_be24(addr, msg + 2);
+
+	mutex_lock(base->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_READ_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_DP_TX,
+					    DPTX_READ_DPCD,
+					    sizeof(reg) + len);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, data, len);
+
+out:
+	mutex_unlock(base->mbox_mutex);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_read);
+
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value)
+{
+	u8 msg[6], reg[5];
+	int ret;
+
+	put_unaligned_be16(1, msg);
+	put_unaligned_be24(addr, msg + 2);
+	msg[5] = value;
+
+	mutex_lock(base->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(base, MB_MODULE_ID_DP_TX,
+				     DPTX_WRITE_DPCD, sizeof(msg), msg);
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_header(base, MB_MODULE_ID_DP_TX,
+					    DPTX_WRITE_DPCD, sizeof(reg));
+	if (ret)
+		goto out;
+
+	ret = cdns_mhdp_mailbox_recv_data(base, reg, sizeof(reg));
+	if (ret)
+		goto out;
+
+	if (addr != get_unaligned_be24(reg + 2))
+		ret = -EINVAL;
+
+out:
+	mutex_unlock(base->mbox_mutex);
+
+	if (ret)
+		dev_err(base->dev, "dpcd write failed: %d\n", ret);
+	return ret;
+}
+EXPORT_SYMBOL_GPL(cdns_mhdp_dpcd_write);
+
+MODULE_DESCRIPTION("Cadence MHDP Helper driver");
+MODULE_AUTHOR("Sandor Yu <Sandor.yu@nxp.com>");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index 6af565ac307ae..9d9dbb976868c 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -73,298 +73,28 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
 	       mhdp->regs + CDNS_APB_INT_MASK);
 }
 
-static int cdns_mhdp_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_mailbox_write(struct cdns_mhdp_device *mhdp, u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-					 u8 module_id, u8 opcode,
-					 u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    req_size != mbox_size) {
-		/*
-		 * If the message in mailbox is not what we want, we need to
-		 * clear the mailbox by reading its contents.
-		 */
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_mailbox_read(mhdp) < 0)
-				break;
-
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-				       u8 *buff, u16 buff_size)
-{
-	u32 i;
-	int ret;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_mailbox_send(struct cdns_mhdp_device *mhdp, u8 module_id,
-				  u8 opcode, u16 size, u8 *message)
-{
-	u8 header[4];
-	int ret, i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-static
-int cdns_mhdp_reg_read(struct cdns_mhdp_device *mhdp, u32 addr, u32 *value)
-{
-	u8 msg[4], resp[8];
-	int ret;
-
-	put_unaligned_be32(addr, msg);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_GENERAL,
-				     GENERAL_REGISTER_READ,
-				     sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_GENERAL,
-					    GENERAL_REGISTER_READ,
-					    sizeof(resp));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, resp, sizeof(resp));
-	if (ret)
-		goto out;
-
-	/* Returned address value should be the same as requested */
-	if (memcmp(msg, resp, sizeof(msg))) {
-		ret = -EINVAL;
-		goto out;
-	}
-
-	*value = get_unaligned_be32(resp + 4);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-	if (ret) {
-		dev_err(mhdp->dev, "Failed to read register\n");
-		*value = 0;
-	}
-
-	return ret;
-}
-
-static
-int cdns_mhdp_reg_write(struct cdns_mhdp_device *mhdp, u16 addr, u32 val)
-{
-	u8 msg[6];
-	int ret;
-
-	put_unaligned_be16(addr, msg);
-	put_unaligned_be32(val, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_REGISTER, sizeof(msg), msg);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
 static
-int cdns_mhdp_reg_write_bit(struct cdns_mhdp_device *mhdp, u16 addr,
-			    u8 start_bit, u8 bits_no, u32 val)
-{
-	u8 field[8];
-	int ret;
-
-	put_unaligned_be16(addr, field);
-	field[2] = start_bit;
-	field[3] = bits_no;
-	put_unaligned_be32(val, field + 4);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_FIELD, sizeof(field), field);
-
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_dpcd_read(struct cdns_mhdp_device *mhdp,
-			u32 addr, u8 *data, u16 len)
-{
-	u8 msg[5], reg[5];
-	int ret;
-
-	put_unaligned_be16(len, msg);
-	put_unaligned_be24(addr, msg + 2);
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_READ_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_DPCD,
-					    sizeof(reg) + len);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, data, len);
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
-}
-
-static
-int cdns_mhdp_dpcd_write(struct cdns_mhdp_device *mhdp, u32 addr, u8 value)
+int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 {
-	u8 msg[6], reg[5];
+	u8 status;
 	int ret;
 
-	put_unaligned_be16(1, msg);
-	put_unaligned_be24(addr, msg + 2);
-	msg[5] = value;
-
 	mutex_lock(&mhdp->mbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_WRITE_DPCD, sizeof(reg));
-	if (ret)
-		goto out;
+	status = enable ? FW_ACTIVE : FW_STANDBY;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_GENERAL,
+				     GENERAL_MAIN_CONTROL, sizeof(status), &status);
 	if (ret)
 		goto out;
 
-	if (addr != get_unaligned_be24(reg + 2))
-		ret = -EINVAL;
-
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	if (ret)
-		dev_err(mhdp->dev, "dpcd write failed: %d\n", ret);
-	return ret;
-}
-
-static
-int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
-{
-	u8 msg[5];
-	int ret, i;
-
-	msg[0] = GENERAL_MAIN_CONTROL;
-	msg[1] = MB_MODULE_ID_GENERAL;
-	msg[2] = 0;
-	msg[3] = 1;
-	msg[4] = enable ? FW_ACTIVE : FW_STANDBY;
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	for (i = 0; i < sizeof(msg); i++) {
-		ret = cdns_mhdp_mailbox_write(mhdp, msg[i]);
-		if (ret)
-			goto out;
-	}
-
-	/* read the firmware state */
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, msg, sizeof(msg));
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_GENERAL,
+					    GENERAL_MAIN_CONTROL,
+					    sizeof(status));
 	if (ret)
 		goto out;
 
-	ret = 0;
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
 
 out:
 	mutex_unlock(&mhdp->mbox_mutex);
@@ -382,18 +112,18 @@ int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device *mhdp)
 
 	mutex_lock(&mhdp->mbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 				     DPTX_HPD_STATE, 0, NULL);
 	if (ret)
 		goto err_get_hpd;
 
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 					    DPTX_HPD_STATE,
 					    sizeof(status));
 	if (ret)
 		goto err_get_hpd;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status));
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &status, sizeof(status));
 	if (ret)
 		goto err_get_hpd;
 
@@ -424,22 +154,22 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 		msg[0] = block / 2;
 		msg[1] = block % 2;
 
-		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+		ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 					     DPTX_GET_EDID, sizeof(msg), msg);
 		if (ret)
 			continue;
 
-		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+		ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 						    DPTX_GET_EDID,
 						    sizeof(reg) + length);
 		if (ret)
 			continue;
 
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, reg, sizeof(reg));
 		if (ret)
 			continue;
 
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
+		ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, edid, length);
 		if (ret)
 			continue;
 
@@ -464,17 +194,17 @@ int cdns_mhdp_read_hpd_event(struct cdns_mhdp_device *mhdp)
 
 	mutex_lock(&mhdp->mbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 				     DPTX_READ_EVENT, 0, NULL);
 	if (ret)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 					    DPTX_READ_EVENT, sizeof(event));
 	if (ret < 0)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &event, sizeof(event));
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, &event, sizeof(event));
 out:
 	mutex_unlock(&mhdp->mbox_mutex);
 
@@ -512,20 +242,20 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 
 	mutex_lock(&mhdp->mbox_mutex);
 
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_send(&mhdp->base, MB_MODULE_ID_DP_TX,
 				     DPTX_ADJUST_LT,
 				     sizeof(payload), payload);
 	if (ret)
 		goto out;
 
 	/* Yes, read the DPCD read command response */
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
+	ret = cdns_mhdp_mailbox_recv_header(&mhdp->base, MB_MODULE_ID_DP_TX,
 					    DPTX_READ_DPCD,
 					    sizeof(hdr) + DP_LINK_STATUS_SIZE);
 	if (ret)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, hdr, sizeof(hdr));
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, hdr, sizeof(hdr));
 	if (ret)
 		goto out;
 
@@ -533,7 +263,7 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	if (addr != DP_LANE0_1_STATUS)
 		goto out;
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, link_status,
+	ret = cdns_mhdp_mailbox_recv_data(&mhdp->base, link_status,
 					  DP_LINK_STATUS_SIZE);
 
 out:
@@ -847,7 +577,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		unsigned int i;
 
 		for (i = 0; i < msg->size; ++i) {
-			ret = cdns_mhdp_dpcd_write(mhdp,
+			ret = cdns_mhdp_dpcd_write(&mhdp->base,
 						   msg->address + i, buf[i]);
 			if (!ret)
 				continue;
@@ -859,7 +589,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			return ret;
 		}
 	} else {
-		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
+		ret = cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
 			dev_err(mhdp->dev,
@@ -887,12 +617,12 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_ENHNCD,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_ENHNCD,
 			    mhdp->sink.enhanced & mhdp->host.enhanced);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_LANE_EN,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LANE_EN,
 			    CDNS_DP_LANE_EN_LANES(mhdp->link.num_lanes));
 
 	cdns_mhdp_link_configure(&mhdp->aux, &mhdp->link);
@@ -913,7 +643,7 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
 			    CDNS_PHY_COMMON_CONFIG |
 			    CDNS_PHY_TRAINING_EN |
 			    CDNS_PHY_TRAINING_TYPE(1) |
@@ -1058,7 +788,7 @@ static bool cdns_mhdp_link_training_channel_eq(struct cdns_mhdp_device *mhdp,
 		CDNS_PHY_TRAINING_TYPE(eq_tps);
 	if (eq_tps != 4)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   (eq_tps != 4) ? eq_tps | DP_LINK_SCRAMBLING_DISABLE :
@@ -1322,7 +1052,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 			   mhdp->host.scrambler ? 0 :
 			   DP_LINK_SCRAMBLING_DISABLE);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1333,13 +1063,13 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 |= CDNS_DP_NUM_LANES(mhdp->link.num_lanes);
 	reg32 |= CDNS_DP_WR_FAILING_EDGE_VSYNC;
 	reg32 |= CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, reg32);
 
 	/* Reset PHY config */
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	return 0;
 err:
@@ -1347,7 +1077,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   DP_TRAINING_PATTERN_DISABLE);
@@ -1461,7 +1191,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.num_lanes = cdns_mhdp_max_num_lanes(mhdp);
 
 	/* Disable framer for link training */
-	err = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	err = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	if (err < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1470,7 +1200,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	}
 
 	resp &= ~CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	/* Spread AMP if required, enable 8b/10b coding */
 	amp[0] = cdns_mhdp_get_ssc_supported(mhdp) ? DP_SPREAD_AMP_0_5 : 0;
@@ -1837,7 +1567,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_BND_HSYNC2VSYNC(stream_id),
 			    bnd_hsync2vsync);
 
 	hsync2vsync_pol_ctrl = 0;
@@ -1845,10 +1575,10 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		hsync2vsync_pol_ctrl |= CDNS_H2V_HSYNC_POL_ACTIVE_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		hsync2vsync_pol_ctrl |= CDNS_H2V_VSYNC_POL_ACTIVE_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_HSYNC2VSYNC_POL_CTRL(stream_id),
 			    hsync2vsync_pol_ctrl);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_PXL_REPR(stream_id), pxl_repr);
 
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		dp_framer_sp |= CDNS_DP_FRAMER_INTERLACE;
@@ -1856,19 +1586,19 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 		dp_framer_sp |= CDNS_DP_FRAMER_HSYNC_POL_LOW;
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		dp_framer_sp |= CDNS_DP_FRAMER_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_SP(stream_id), dp_framer_sp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_SP(stream_id), dp_framer_sp);
 
 	front_porch = mode->crtc_hsync_start - mode->crtc_hdisplay;
 	back_porch = mode->crtc_htotal - mode->crtc_hsync_end;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRONT_BACK_PORCH(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRONT_BACK_PORCH(stream_id),
 			    CDNS_DP_FRONT_PORCH(front_porch) |
 			    CDNS_DP_BACK_PORCH(back_porch));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_BYTE_COUNT(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_BYTE_COUNT(stream_id),
 			    mode->crtc_hdisplay * bpp / 8);
 
 	msa_h0 = mode->crtc_htotal - mode->crtc_hsync_start;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_HORIZONTAL_0(stream_id),
 			    CDNS_DP_MSAH0_H_TOTAL(mode->crtc_htotal) |
 			    CDNS_DP_MSAH0_HSYNC_START(msa_h0));
 
@@ -1877,11 +1607,11 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			   CDNS_DP_MSAH1_HDISP_WIDTH(mode->crtc_hdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NHSYNC)
 		msa_horizontal_1 |= CDNS_DP_MSAH1_HSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_HORIZONTAL_1(stream_id),
 			    msa_horizontal_1);
 
 	msa_v0 = mode->crtc_vtotal - mode->crtc_vsync_start;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_0(stream_id),
 			    CDNS_DP_MSAV0_V_TOTAL(mode->crtc_vtotal) |
 			    CDNS_DP_MSAV0_VSYNC_START(msa_v0));
 
@@ -1890,7 +1620,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			 CDNS_DP_MSAV1_VDISP_WIDTH(mode->crtc_vdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		msa_vertical_1 |= CDNS_DP_MSAV1_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_1(stream_id),
 			    msa_vertical_1);
 
 	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
@@ -1902,14 +1632,14 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (pxlfmt == DRM_COLOR_FORMAT_YCBCR420)
 		misc1 = CDNS_DP_TEST_VSC_SDP;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_MISC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_MISC(stream_id),
 			    misc0 | (misc1 << 8));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_HORIZONTAL(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_HORIZONTAL(stream_id),
 			    CDNS_DP_H_HSYNC_WIDTH(hsync) |
 			    CDNS_DP_H_H_TOTAL(mode->crtc_hdisplay));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_0(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_0(stream_id),
 			    CDNS_DP_V0_VHEIGHT(mode->crtc_vdisplay) |
 			    CDNS_DP_V0_VSTART(msa_v0));
 
@@ -1918,13 +1648,13 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	    mode->crtc_vtotal % 2 == 0)
 		dp_vertical_1 |= CDNS_DP_V1_VTOTAL_EVEN;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_VERTICAL_1(stream_id), dp_vertical_1);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_VERTICAL_1(stream_id), dp_vertical_1);
 
-	cdns_mhdp_reg_write_bit(mhdp, CDNS_DP_VB_ID(stream_id), 2, 1,
-				(mode->flags & DRM_MODE_FLAG_INTERLACE) ?
-				CDNS_DP_VB_ID_INTERLACED : 0);
+	cdns_mhdp_dp_reg_write_bit(&mhdp->base, CDNS_DP_VB_ID(stream_id), 2, 1,
+				   (mode->flags & DRM_MODE_FLAG_INTERLACE) ?
+				   CDNS_DP_VB_ID_INTERLACED : 0);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &framer);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1933,7 +1663,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	}
 	framer |= CDNS_DP_FRAMER_EN;
 	framer &= ~CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
 }
 
 static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
@@ -1966,15 +1696,15 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 
 	mhdp->stream_id = 0;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_TU,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_TU,
 			    CDNS_DP_FRAMER_TU_VS(vs) |
 			    CDNS_DP_FRAMER_TU_SIZE(tu_size) |
 			    CDNS_DP_FRAMER_TU_CNT_RST_EN);
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_LINE_THRESH(0),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_LINE_THRESH(0),
 			    line_thresh & GENMASK(5, 0));
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_STREAM_CONFIG_2(0),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_STREAM_CONFIG_2(0),
 			    CDNS_DP_SC2_TU_VS_DIFF((tu_size - vs > 3) ?
 						   0 : tu_size - vs));
 
@@ -2009,13 +1739,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
 		mhdp->info->ops->enable(mhdp);
 
 	/* Enable VIF clock for stream 0 */
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
 	if (ret < 0) {
 		dev_err(mhdp->dev, "Failed to read CDNS_DPTX_CAR %d\n", ret);
 		goto out;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
 			    resp | CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN);
 
 	connector = drm_atomic_get_new_connector_for_encoder(state,
@@ -2083,16 +1813,16 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
 		cdns_mhdp_hdcp_disable(mhdp);
 
 	mhdp->bridge_enabled = false;
-	cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	resp &= ~CDNS_DP_FRAMER_EN;
 	resp |= CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	cdns_mhdp_link_down(mhdp);
 
 	/* Disable VIF clock for stream 0 */
-	cdns_mhdp_reg_read(mhdp, CDNS_DPTX_CAR, &resp);
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_CAR,
+	cdns_mhdp_reg_read(&mhdp->base, CDNS_DPTX_CAR, &resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_CAR,
 			    resp & ~(CDNS_VIF_CLK_EN | CDNS_VIF_CLK_RSTN));
 
 	if (mhdp->info && mhdp->info->ops && mhdp->info->ops->disable)
@@ -2502,6 +2232,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mhdp);
 
+	/* init base struct for access mailbox  */
+	mhdp->base.dev = mhdp->dev;
+	mhdp->base.regs = mhdp->regs;
+	mhdp->base.mbox_mutex = &mhdp->mbox_mutex;
+
 	mhdp->info = of_device_get_match_data(dev);
 
 	clk_prepare_enable(clk);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..f08db38c82bbd 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -15,6 +15,7 @@
 #include <linux/mutex.h>
 #include <linux/spinlock.h>
 
+#include <drm/bridge/cdns-mhdp-helper.h>
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
@@ -27,10 +28,6 @@ struct phy;
 #define CDNS_APB_CTRL				0x00000
 #define CDNS_CPU_STALL				BIT(3)
 
-#define CDNS_MAILBOX_FULL			0x00008
-#define CDNS_MAILBOX_EMPTY			0x0000c
-#define CDNS_MAILBOX_TX_DATA			0x00010
-#define CDNS_MAILBOX_RX_DATA			0x00014
 #define CDNS_KEEP_ALIVE				0x00018
 #define CDNS_KEEP_ALIVE_MASK			GENMASK(7, 0)
 
@@ -198,45 +195,10 @@ struct phy;
 #define CDNS_DP_BYTE_COUNT(s)			(CDNS_DPTX_STREAM(s) + 0x7c)
 #define CDNS_DP_BYTE_COUNT_BYTES_IN_CHUNK_SHIFT	16
 
-/* mailbox */
-#define MAILBOX_RETRY_US			1000
-#define MAILBOX_TIMEOUT_US			2000000
-
-#define MB_OPCODE_ID				0
-#define MB_MODULE_ID				1
-#define MB_SIZE_MSB_ID				2
-#define MB_SIZE_LSB_ID				3
-#define MB_DATA_ID				4
-
-#define MB_MODULE_ID_DP_TX			0x01
-#define MB_MODULE_ID_HDCP_TX			0x07
-#define MB_MODULE_ID_HDCP_RX			0x08
-#define MB_MODULE_ID_HDCP_GENERAL		0x09
-#define MB_MODULE_ID_GENERAL			0x0a
-
-/* firmware and opcodes */
+/* firmware */
 #define FW_NAME					"cadence/mhdp8546.bin"
 #define CDNS_MHDP_IMEM				0x10000
 
-#define GENERAL_MAIN_CONTROL			0x01
-#define GENERAL_TEST_ECHO			0x02
-#define GENERAL_BUS_SETTINGS			0x03
-#define GENERAL_TEST_ACCESS			0x04
-#define GENERAL_REGISTER_READ			0x07
-
-#define DPTX_SET_POWER_MNG			0x00
-#define DPTX_GET_EDID				0x02
-#define DPTX_READ_DPCD				0x03
-#define DPTX_WRITE_DPCD				0x04
-#define DPTX_ENABLE_EVENT			0x05
-#define DPTX_WRITE_REGISTER			0x06
-#define DPTX_READ_REGISTER			0x07
-#define DPTX_WRITE_FIELD			0x08
-#define DPTX_READ_EVENT				0x0a
-#define DPTX_GET_LAST_AUX_STAUS			0x0e
-#define DPTX_HPD_STATE				0x11
-#define DPTX_ADJUST_LT				0x12
-
 #define FW_STANDBY				0
 #define FW_ACTIVE				1
 
@@ -352,6 +314,8 @@ struct cdns_mhdp_hdcp {
 };
 
 struct cdns_mhdp_device {
+	struct cdns_mhdp_base base;
+
 	void __iomem *regs;
 	void __iomem *sapb_regs;
 	void __iomem *j721e_regs;
diff --git a/include/drm/bridge/cdns-mhdp-helper.h b/include/drm/bridge/cdns-mhdp-helper.h
new file mode 100644
index 0000000000000..477e67601ee5f
--- /dev/null
+++ b/include/drm/bridge/cdns-mhdp-helper.h
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2023 NXP Semiconductor, Inc.
+ */
+#ifndef __CDNS_MHDP_HELPER_H__
+#define __CDNS_MHDP_HELPER_H__
+
+#include <asm/unaligned.h>
+#include <linux/iopoll.h>
+
+/* mailbox regs offset */
+#define CDNS_MAILBOX_FULL			0x00008
+#define CDNS_MAILBOX_EMPTY			0x0000c
+#define CDNS_MAILBOX_TX_DATA			0x00010
+#define CDNS_MAILBOX_RX_DATA			0x00014
+
+#define MAILBOX_RETRY_US			1000
+#define MAILBOX_TIMEOUT_US			2000000
+
+/* Module ID Code */
+#define MB_MODULE_ID_DP_TX			0x01
+#define MB_MODULE_ID_HDMI_TX			0x03
+#define MB_MODULE_ID_HDCP_TX			0x07
+#define MB_MODULE_ID_HDCP_RX			0x08
+#define MB_MODULE_ID_HDCP_GENERAL		0x09
+#define MB_MODULE_ID_GENERAL			0x0A
+
+/* General Commands */
+#define GENERAL_MAIN_CONTROL			0x01
+#define GENERAL_TEST_ECHO			0x02
+#define GENERAL_BUS_SETTINGS			0x03
+#define GENERAL_TEST_ACCESS			0x04
+#define GENERAL_REGISTER_WRITE			0x05
+#define GENERAL_WRITE_FIELD			0x06
+#define GENERAL_REGISTER_READ			0x07
+#define GENERAL_GET_HPD_STATE			0x11
+
+/* DPTX Commands */
+#define DPTX_SET_POWER_MNG			0x00
+#define DPTX_SET_HOST_CAPABILITIES		0x01
+#define DPTX_GET_EDID				0x02
+#define DPTX_READ_DPCD				0x03
+#define DPTX_WRITE_DPCD				0x04
+#define DPTX_ENABLE_EVENT			0x05
+#define DPTX_WRITE_REGISTER			0x06
+#define DPTX_READ_REGISTER			0x07
+#define DPTX_WRITE_FIELD			0x08
+#define DPTX_TRAINING_CONTROL			0x09
+#define DPTX_READ_EVENT				0x0a
+#define DPTX_READ_LINK_STAT			0x0b
+#define DPTX_SET_VIDEO				0x0c
+#define DPTX_SET_AUDIO				0x0d
+#define DPTX_GET_LAST_AUX_STAUS			0x0e
+#define DPTX_SET_LINK_BREAK_POINT		0x0f
+#define DPTX_FORCE_LANES			0x10
+#define DPTX_HPD_STATE				0x11
+#define DPTX_ADJUST_LT				0x12
+
+/* HDMI TX Commands */
+#define HDMI_TX_READ				0x00
+#define HDMI_TX_WRITE				0x01
+#define HDMI_TX_UPDATE_READ			0x02
+#define HDMI_TX_EDID				0x03
+#define HDMI_TX_EVENTS				0x04
+#define HDMI_TX_HPD_STATUS			0x05
+
+struct cdns_mhdp_base {
+	struct device *dev;
+	void __iomem *regs;
+	/* protect mailbox communications with the firmware */
+	struct mutex *mbox_mutex;
+};
+
+/* Mailbox helper functions */
+int cdns_mhdp_mailbox_send(struct cdns_mhdp_base *base, u8 module_id,
+			   u8 opcode, u16 size, u8 *message);
+int cdns_mhdp_mailbox_recv_header(struct cdns_mhdp_base *base,
+				  u8 module_id, u8 opcode, u16 req_size);
+int cdns_mhdp_mailbox_recv_data(struct cdns_mhdp_base *base,
+				u8 *buff, u16 buff_size);
+
+/* General commands helper functions */
+int cdns_mhdp_reg_read(struct cdns_mhdp_base *base, u32 addr, u32 *value);
+int cdns_mhdp_reg_write(struct cdns_mhdp_base *base, u32 addr, u32 val);
+
+/* DPTX commands helper functions */
+int cdns_mhdp_dp_reg_write(struct cdns_mhdp_base *base, u16 addr, u32 val);
+int cdns_mhdp_dp_reg_write_bit(struct cdns_mhdp_base *base, u16 addr,
+			       u8 start_bit, u8 bits_no, u32 val);
+int cdns_mhdp_dpcd_read(struct cdns_mhdp_base *base,
+			u32 addr, u8 *data, u16 len);
+int cdns_mhdp_dpcd_write(struct cdns_mhdp_base *base, u32 addr, u8 value);
+
+#endif /* __CDNS_MHDP_HELPER_H__ */
-- 
2.34.1

