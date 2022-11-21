Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C08A4631A3A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Nov 2022 08:28:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D652B10E154;
	Mon, 21 Nov 2022 07:28:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-eopbgr70055.outbound.protection.outlook.com [40.107.7.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 507D210E14D
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Nov 2022 07:27:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l/QXVAJ9ZsR/llhZe2ni4mFR1qtnFgGQI70N9Eblt3Zv1hLB/Hq5s/2QXo+W2OqQ4riTSivwlRHYohl+8sAnwusu0UtOZDhPncrXCllOXpD8lTTv+RTmFVJqOpB4T7R7faz7dRJz0yK8lnSunp3z01MBPRKRXtosRfMNxgzh3cjckQaQHW9yTX2rxXZo29rZm/kSsmGGrUTnxBPFkc4TG6jbn+KPWi7e6jCWwc3RichkSDMGRKzwv/E/m1PUyvQQymtnPezETarAR7jM9cQUD8b+O7KUbmR/tM3MznbyprpImkGBMy4d1tN2QkNWbcm5NvCUqNeXHOoXNGyneVsxsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FSzx4PV66MAvqNXoDZJnoeXuKoNG9JTI2VfsioUy1GE=;
 b=Tz0zgqrBQFNa/QPNWlLEisGXpzjsJKf0gxj3TyKWHXcQkpV3N3obHyPU12sZBT0KZHSJBPl0jpWm1utJZ+mWHgpvl8hHkAcZoXjELYlSh6UtUZxfav22W3vx3tT8yuL5ulvOP8O8n6LWspyranMy1vQm4NJLG1XX60bFN2ByJyI+JCsEW4miwzJMEO2NgzjyHXZen2iN7/R/RJqvoqmEH0JyYheuinR5wytflSBxscJNle4llh3CKzC0uf8w5F+I04AOEwlpgD354rbW5m/fTqowBbgEHPjG+akkzZPk1vhe9f3kyXJ8xcXEfOcDNMxdXDpW9CsZVs+oDP+P0/c54A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FSzx4PV66MAvqNXoDZJnoeXuKoNG9JTI2VfsioUy1GE=;
 b=RY/ENdq4BLl5wsxEJosngbls4vB/FoJK19tvhT7lXwiXhczvuQvJ6eJ1oLeukivMaTn8XHw1jn8Xq1FuII1+wWFVCF6Fc/W3bFaDwq9MKZKli9aAdT16UzskSwNhYn6M/AaCPAGvSSOAQSs8NHVnrr4nSZ4KA0jZhaZuCRoGEuA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by AS8PR04MB7638.eurprd04.prod.outlook.com (2603:10a6:20b:291::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5834.9; Mon, 21 Nov
 2022 07:27:35 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::60b2:4bec:7707:e196%5]) with mapi id 15.20.5834.015; Mon, 21 Nov 2022
 07:27:35 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: andrzej.hajda@intel.com, neil.armstrong@linaro.org, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, shawnguo@kernel.org,
 s.hauer@pengutronix.de, festevam@gmail.com, kishon@ti.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 alexander.stein@ew.tq-group.com
Subject: [PATCH v4 06/10] drm: bridge: cadence: Add MHDP HDMI driver for
 i.MX8MQ
Date: Mon, 21 Nov 2022 15:23:56 +0800
Message-Id: <13aa914f163b7a58b0aadf806e89ae7a04c28f3f.1669013346.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1669013346.git.Sandor.yu@nxp.com>
References: <cover.1669013346.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR06CA0246.apcprd06.prod.outlook.com
 (2603:1096:4:ac::30) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|AS8PR04MB7638:EE_
X-MS-Office365-Filtering-Correlation-Id: f76de348-f5f6-49f2-4097-08dacb91dc21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Xu9MjQI+ZtXog/lBDWnChS9PBx6PsMZWyVnTYEASHrlBwERt8yNw6xBtZfMZkjrgH6eylIEzkEPRjc3mfxe+8op/reJ1EDtWBYJh3WIk5KhmfeZR8YnTnVW34bqCrb9j0mD6DnjbAAUz8xTQITwu8bDN0+4AUDb/ujXrhDQMwIns4LIwIs5S011ddlZWcLPMqChnIV27ZMLwJo+dkwsV82iuJRXGL9vxGmiYzZhOyHZqiLzt31EwYFnmNTv0MXaf99HlV3xqKx4yRfsv/NyxyoOCkcuG7ixDRHcDKYPvotC0S6+3G5V32JrYztUKG+bDN0Hh9655fcEruacVtr+bLo6XMym7NxccswFy/oP9ZH1Y1o1LXR22loEiC968F6M52z5lqOUb1EClt/PLWNOdUacuNmML+Udtdhm/bmy79JzmpkhU+ypOsD0bmIcxBJ75q3kkOxwOVDUraK6IYo9RTDkJgtzHFQinwP5RXzRJ1VnFgqpF/IzCrZuBZb5pnT0X3v+UQVUeScUOvk+zgBbjqyA32aRvAAEU4kzpmOOWboRZlSr4WbdYJWDFqU8LJniBC+LYWFdt85hj7adxTc7xCsiqM2erW3vORl0zF0R3Pmdrf2TkrqHHwuWHfbo3FS4cI0aAtguysFiXCeAajKSEfnW0sl2rQs3Y/d/+1dTE3CJnqSzr7HNWcVXMO9a4FRCYyo5pTS3iihGL7Q14wHbhVA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199015)(7416002)(8936002)(8676002)(5660300002)(4326008)(30864003)(66556008)(66476007)(66946007)(41300700001)(86362001)(921005)(6486002)(478600001)(2906002)(6666004)(6506007)(26005)(52116002)(316002)(6512007)(186003)(83380400001)(2616005)(38100700002)(38350700002)(36756003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?enaVv9lVYJxGHO6TtoLnnGD+ttNye9FiYOXGdXq0rwKt1lA6el0GYKA+GD8N?=
 =?us-ascii?Q?UR0X92p1/bKkJW7zeKOuf1XDllRkvyjWlem2QCQJ6AXq3T6p02Wzqw7ArtfU?=
 =?us-ascii?Q?zC08/Xyxc57Rx+qT6LKSZRI+rSvuQl7CcE2NnYlCDrIjvRZ2jIXz10r8ZZDn?=
 =?us-ascii?Q?tnWdyu1xfcPoAc3lIonWrIvVf7hwtvWn1iX9MSHqW+0TUI97OqoglhU1VQoL?=
 =?us-ascii?Q?Qse93fGrKZNfceYCspWHZtyritdwH5dl7eBq2WJFpDmS5WJhkiLnx7WmAZ5z?=
 =?us-ascii?Q?+5tukH2fQ0H70DeAXck3nCypXwlVGRGZs+s9BpjRZ8y3i4Zx3GoHpWtjSXoG?=
 =?us-ascii?Q?6U0YNRXDckpqF9mnnfwhQ7UoLVESr/B2vzHDqI5FiLiYlhMfxlXwFXho2JmJ?=
 =?us-ascii?Q?Slr+DT9SwqOMVDZS0p9db3Ob+hkwmbdwmBYBKWt1+CviCaUhRqrc9UDsmJS8?=
 =?us-ascii?Q?F9A2PewyzWiLHuh7/WL0pPbHNpoYUlD1cnrcHZ3wqtmPNG1javStHZkKuLyP?=
 =?us-ascii?Q?eZIbztqgoqRkbz4igtgJKVqGY0j2wj5v+GaOcc30gZnGkeuwlprm46hjUvlf?=
 =?us-ascii?Q?KvyRHIfF92wl/6RRHYb8kDwiqa8ZajRjV722wzD+gtfgHRUaihC4n+5qdkUE?=
 =?us-ascii?Q?uzkOfuFHxFhvmKm0ABtviTfWUjk/e9xR0TAZbwBYQbocA/BVmAk/vJ6heid6?=
 =?us-ascii?Q?aqYnPN0t6b7Qr9fLpG77CYoBGzgdGl2EBQKfSNlnIm2dmfSjE85XcO7zqvxx?=
 =?us-ascii?Q?L2fW7z6X91hD3CZ+cLfUZVIwh6ArYh32qs4GGSmiMx1cfLdijzsvPc8pPTWs?=
 =?us-ascii?Q?C4U82f3Cvg0nwf6TlNEeSAYA/cX0FMexcEytq8WYjh8MjS09yv35CwBCwVCI?=
 =?us-ascii?Q?cbSNaGeh9FyyvIVvVgNR678TycobpFulQiow+jAek2I1RjHcdSthda/sltUm?=
 =?us-ascii?Q?XHfS/6qgnyKC1yaCLpDReDO2RoV3PggaHzmSSk+9nVpRnR13OWrRQ++abo8j?=
 =?us-ascii?Q?IkxXFcHYUREB4ZHHurNQFPJdb7BRBFH7CLqQ2gbrMzugGbbAAU8e0CfOyEiO?=
 =?us-ascii?Q?29THzXnxLE0389Qv/QdNY8G8sjYn9WpGdTiSdbrVK8TSIZItAyz3R14iPjNm?=
 =?us-ascii?Q?J3Zs/BDANsVtWsj1+AcWGFdJ8ZGwz6XM12Qr2UIrG5S57y1mmaxT4XQ4BZdX?=
 =?us-ascii?Q?J0y693IHa4R5a6RoWqkEtL1CwlhSym31nDexD7lIBhlEuNhEqQNr7GOU3K3b?=
 =?us-ascii?Q?ZtmzqNr74rPy240mAGEJZ5BIjuXtmCmIK2iGNh5XRl+uChC3fr9dJl9keO/F?=
 =?us-ascii?Q?AQqJ6kPbYp7L0j20IsiFIUjtlw+xgzsFWIB5n4FBENE/tbgXRTgRnuuROFT8?=
 =?us-ascii?Q?6YeRey1L91BzOXezVFu8dy1pJVE5P1ywkYlNR8IUg3xxqsG5xkGm+bqINBZj?=
 =?us-ascii?Q?p5RMrrjBnVemaVPyABufg9vGSic3dqvqu68L+VXQh0ccH69+wya0obfPtQXR?=
 =?us-ascii?Q?YyBxGDzdWWGHTYtj3zRjlOuKsoC7ruTbJ1dQC82bN0qtx+x620ukgQ+UrJtB?=
 =?us-ascii?Q?OO/ItK4rTsmwIzWxSzmFp02pe2Wq3OlkAA5SeJh1?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f76de348-f5f6-49f2-4097-08dacb91dc21
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2022 07:27:35.3021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0w4IqrCJh4/K0kNXfYWVs2rXuSSWD9u/GDp+2sZ7VawTAEbdwxFkRod4P/ltRe+8Pjucxm9Bsieu99lF4DWCqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7638
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

Add a new DRM HDMI bridge driver for Candence MHDP used in i.MX8MQ
SOC. MHDP IP could support HDMI or DisplayPort standards according
embedded Firmware running in the uCPU.

For iMX8MQ SOC, the HDMI FW was loaded and activated by SOC ROM code.
Bootload binary included HDMI FW was required for the driver.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/cadence/Kconfig        |   12 +
 .../gpu/drm/bridge/cadence/cdns-hdmi-core.c   | 1018 +++++++++++++++++
 2 files changed, 1030 insertions(+)
 create mode 100644 drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index e79ae1af3765..377452d09992 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -26,6 +26,18 @@ config DRM_CDNS_MHDP8546_J721E
 	  clock and data muxes.
 endif
 
+config DRM_CDNS_HDMI
+	tristate "Cadence HDMI DRM driver"
+	select DRM_KMS_HELPER
+	select DRM_PANEL_BRIDGE
+	select DRM_DISPLAY_HELPER
+	select DRM_CDNS_AUDIO
+	depends on OF
+	help
+	  Support Cadence MHDP HDMI driver.
+	  Cadence MHDP Controller support one or more protocols,
+	  HDMI firmware is required for this driver.
+
 config DRM_CDNS_DP
 	tristate "Cadence DP DRM driver"
 	select DRM_KMS_HELPER
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c b/drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
new file mode 100644
index 000000000000..10cb30a66947
--- /dev/null
+++ b/drivers/gpu/drm/bridge/cadence/cdns-hdmi-core.c
@@ -0,0 +1,1018 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Cadence High-Definition Multimedia Interface (HDMI) driver
+ *
+ * Copyright (C) 2019-2022 NXP Semiconductor, Inc.
+ *
+ */
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/err.h>
+#include <linux/hdmi.h>
+#include <linux/irq.h>
+#include <linux/module.h>
+#include <linux/mfd/syscon.h>
+#include <linux/mutex.h>
+#include <linux/of_device.h>
+#include <linux/phy/phy.h>
+#include <linux/phy/phy-hdmi.h>
+
+#include <drm/bridge/cdns-mhdp-mailbox.h>
+#include <drm/display/drm_hdmi_helper.h>
+#include <drm/display/drm_scdc_helper.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_encoder_slave.h>
+#include <drm/drm_of.h>
+#include <drm/drm_probe_helper.h>
+#include <drm/drm_print.h>
+#include <drm/drm_vblank.h>
+
+#include "cdns-mhdp-common.h"
+
+/**
+ * cdns_hdmi_infoframe_set() - fill the HDMI AVI infoframe
+ * @mhdp: phandle to mhdp device.
+ * @entry_id: The packet memory address in which the data is written.
+ * @packet_len: 32, only 32 bytes now.
+ * @packet: point to InfoFrame Packet.
+ *          packet[0] = 0
+ *          packet[1-3] = HB[0-2]  InfoFrame Packet Header
+ *          packet[4-31 = PB[0-27] InfoFrame Packet Contents
+ * @packet_type: Packet Type of InfoFrame in HDMI Specification.
+ *
+ */
+static void cdns_hdmi_infoframe_set(struct cdns_mhdp_device *mhdp,
+					u8 entry_id, u8 packet_len, u8 *packet, u8 packet_type)
+{
+	u32 packet32, len32;
+	u32 val, i;
+
+	/* only support 32 bytes now */
+	if (packet_len != 32)
+		return;
+
+	/* invalidate entry */
+	val = F_ACTIVE_IDLE_TYPE(1) | F_PKT_ALLOC_ADDRESS(entry_id);
+	writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
+	writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs + SOURCE_PIF_PKT_ALLOC_WR_EN);
+
+	/* flush fifo 1 */
+	writel(F_FIFO1_FLUSH(1), mhdp->regs + SOURCE_PIF_FIFO1_FLUSH);
+
+	/* write packet into memory */
+	len32 = packet_len / 4;
+	for (i = 0; i < len32; i++) {
+		packet32 = get_unaligned_le32(packet + 4 * i);
+		writel(F_DATA_WR(packet32), mhdp->regs + SOURCE_PIF_DATA_WR);
+	}
+
+	/* write entry id */
+	writel(F_WR_ADDR(entry_id), mhdp->regs + SOURCE_PIF_WR_ADDR);
+
+	/* write request */
+	writel(F_HOST_WR(1), mhdp->regs + SOURCE_PIF_WR_REQ);
+
+	/* update entry */
+	val =  F_ACTIVE_IDLE_TYPE(1) | F_TYPE_VALID(1) |
+			F_PACKET_TYPE(packet_type) | F_PKT_ALLOC_ADDRESS(entry_id);
+	writel(val, mhdp->regs + SOURCE_PIF_PKT_ALLOC_REG);
+
+	writel(F_PKT_ALLOC_WR_EN(1), mhdp->regs + SOURCE_PIF_PKT_ALLOC_WR_EN);
+}
+
+static int cdns_hdmi_get_edid_block(void *data, u8 *edid,
+			  u32 block, size_t length)
+{
+	struct cdns_mhdp_device *mhdp = data;
+	u8 msg[2], reg[5], i;
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	for (i = 0; i < 4; i++) {
+		msg[0] = block / 2;
+		msg[1] = block % 2;
+
+		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_HDMI_TX, HDMI_TX_EDID,
+					  sizeof(msg), msg);
+		if (ret)
+			continue;
+
+		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_HDMI_TX,
+						      HDMI_TX_EDID, sizeof(reg) + length);
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
+		if ((reg[3] << 8 | reg[4]) == length)
+			break;
+	}
+
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	if (ret)
+		DRM_ERROR("get block[%d] edid failed: %d\n", block, ret);
+	return ret;
+}
+
+static int cdns_hdmi_scdc_write(struct cdns_mhdp_device *mhdp, u8 addr, u8 value)
+{
+	u8 msg[5], reg[5];
+	int ret;
+
+	msg[0] = 0x54;
+	msg[1] = addr;
+	msg[2] = 0;
+	msg[3] = 1;
+	msg[4] = value;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_HDMI_TX, HDMI_TX_WRITE,
+				  sizeof(msg), msg);
+	if (ret)
+		goto err_scdc_write;
+
+	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_HDMI_TX,
+					      HDMI_TX_WRITE, sizeof(reg));
+	if (ret)
+		goto err_scdc_write;
+
+	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
+	if (ret)
+		goto err_scdc_write;
+
+	if (reg[0] != 0)
+		ret = -EINVAL;
+
+err_scdc_write:
+
+	mutex_unlock(&mhdp->mbox_mutex);
+
+	if (ret)
+		DRM_ERROR("scdc write failed: %d\n", ret);
+	return ret;
+}
+
+static int cdns_hdmi_ctrl_init(struct cdns_mhdp_device *mhdp,
+				 int protocol, u32 char_rate)
+{
+	u32 reg0;
+	u32 reg1;
+	u32 val;
+	int ret;
+
+	/* Set PHY to HDMI data */
+	ret = cdns_mhdp_reg_write(mhdp, PHY_DATA_SEL, F_SOURCE_PHY_MHDP_SEL(1));
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_HPD,
+					F_HPD_VALID_WIDTH(4) | F_HPD_GLITCH_WIDTH(0));
+	if (ret < 0)
+		return ret;
+
+	/* open CARS */
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_PHY_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_HDTX_CAR, 0xFF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_PKT_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_AIF_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_CIPHER_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_CRYPTO_CAR, 0xF);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, SOURCE_CEC_CAR, 3);
+	if (ret < 0)
+		return ret;
+
+	reg0 = reg1 = 0x7c1f;
+	if (protocol == MODE_HDMI_2_0 && char_rate >= 340000) {
+		reg0 = 0;
+		reg1 = 0xFFFFF;
+	}
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CLOCK_REG_0, reg0);
+	if (ret < 0)
+		return ret;
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CLOCK_REG_1, reg1);
+	if (ret < 0)
+		return ret;
+
+	/* set hdmi mode and preemble mode data enable */
+	val = F_HDMI_MODE(protocol) | F_HDMI2_PREAMBLE_EN(1) |  F_DATA_EN(1) |
+			F_HDMI2_CTRL_IL_MODE(1) | F_BCH_EN(1) | F_PIC_3D(0XF);
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+
+	return ret;
+}
+
+static int cdns_hdmi_mode_config(struct cdns_mhdp_device *mhdp,
+					      struct drm_display_mode *mode,
+						  struct video_info *video_info)
+{
+	int ret;
+	u32 val;
+	u32 vsync_lines = mode->vsync_end - mode->vsync_start;
+	u32 eof_lines = mode->vsync_start - mode->vdisplay;
+	u32 sof_lines = mode->vtotal - mode->vsync_end;
+	u32 hblank = mode->htotal - mode->hdisplay;
+	u32 hactive = mode->hdisplay;
+	u32 vblank = mode->vtotal - mode->vdisplay;
+	u32 vactive = mode->vdisplay;
+	u32 hfront = mode->hsync_start - mode->hdisplay;
+	u32 hback = mode->htotal - mode->hsync_end;
+	u32 vfront = eof_lines;
+	u32 hsync = hblank - hfront - hback;
+	u32 vsync = vsync_lines;
+	u32 vback = sof_lines;
+	u32 v_h_polarity = ((mode->flags & DRM_MODE_FLAG_NHSYNC) ? 0 : 1) +
+			((mode->flags & DRM_MODE_FLAG_NVSYNC) ? 0 : 2);
+
+	ret = cdns_mhdp_reg_write(mhdp, SCHEDULER_H_SIZE, (hactive << 16) + hblank);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, SCHEDULER_V_SIZE, (vactive << 16) + vblank);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_SIGNAL_FRONT_WIDTH, (vfront << 16) + hfront);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_SIGNAL_SYNC_WIDTH, (vsync << 16) + hsync);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_SIGNAL_BACK_WIDTH, (vback << 16) + hback);
+	if (ret < 0)
+		return ret;
+
+	ret = cdns_mhdp_reg_write(mhdp, HSYNC2VSYNC_POL_CTRL, v_h_polarity);
+	if (ret < 0)
+		return ret;
+
+	/* Reset Data Enable */
+	cdns_mhdp_reg_read(mhdp, HDTX_CONTROLLER, &val);
+	val &= ~F_DATA_EN(1);
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+	if (ret < 0)
+		return ret;
+
+	/* Set bpc */
+	val &= ~F_VIF_DATA_WIDTH(3);
+	switch (video_info->bpc) {
+	case 10:
+		val |= F_VIF_DATA_WIDTH(1);
+		break;
+	case 12:
+		val |= F_VIF_DATA_WIDTH(2);
+		break;
+	case 16:
+		val |= F_VIF_DATA_WIDTH(3);
+		break;
+	case 8:
+	default:
+		val |= F_VIF_DATA_WIDTH(0);
+		break;
+	}
+
+	/* select color encoding */
+	val &= ~F_HDMI_ENCODING(3);
+	switch (video_info->color_fmt) {
+	case DRM_COLOR_FORMAT_YCBCR444:
+		val |= F_HDMI_ENCODING(2);
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		val |= F_HDMI_ENCODING(1);
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		val |= F_HDMI_ENCODING(3);
+		break;
+	case DRM_COLOR_FORMAT_RGB444:
+	default:
+		val |= F_HDMI_ENCODING(0);
+		break;
+	}
+
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+	if (ret < 0)
+		return ret;
+
+	/* set data enable */
+	val |= F_DATA_EN(1);
+	ret = cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+
+	return ret;
+}
+
+static int cdns_hdmi_disable_gcp(struct cdns_mhdp_device *mhdp)
+{
+	u32 val;
+
+	cdns_mhdp_reg_read(mhdp, HDTX_CONTROLLER, &val);
+	val &= ~F_GCP_EN(1);
+
+	return cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+}
+
+static int cdns_hdmi_enable_gcp(struct cdns_mhdp_device *mhdp)
+{
+	u32 val;
+
+	cdns_mhdp_reg_read(mhdp, HDTX_CONTROLLER, &val);
+	val |= F_GCP_EN(1);
+
+	return cdns_mhdp_reg_write(mhdp, HDTX_CONTROLLER, val);
+}
+
+static void cdns_hdmi_sink_config(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_scdc *scdc = &mhdp->curr_conn->display_info.hdmi.scdc;
+	u8 buff = 0;
+
+	/* Default work in HDMI1.4 */
+	mhdp->hdmi.hdmi_type = MODE_HDMI_1_4;
+
+	/* check sink support SCDC or not */
+	if (scdc->supported != true) {
+		DRM_INFO("Sink Not Support SCDC\n");
+		return;
+	}
+
+	if (mhdp->hdmi.char_rate > 340000) {
+		/*
+		 * TMDS Character Rate above 340MHz should working in HDMI2.0
+		 * Enable scrambling and TMDS_Bit_Clock_Ratio
+		 */
+		buff = SCDC_TMDS_BIT_CLOCK_RATIO_BY_40 | SCDC_SCRAMBLING_ENABLE;
+		mhdp->hdmi.hdmi_type = MODE_HDMI_2_0;
+	} else  if (scdc->scrambling.low_rates) {
+		/*
+		 * Enable scrambling and HDMI2.0 when scrambling capability of sink
+		 * be indicated in the HF-VSDB LTE_340Mcsc_scramble bit
+		 */
+		buff = SCDC_SCRAMBLING_ENABLE;
+		mhdp->hdmi.hdmi_type = MODE_HDMI_2_0;
+	}
+
+	/* TMDS config */
+	cdns_hdmi_scdc_write(mhdp, SCDC_TMDS_CONFIG, buff);
+}
+
+static void cdns_hdmi_lanes_config(struct cdns_mhdp_device *mhdp)
+{
+	u32 lane_mapping = mhdp->plat_data->lane_mapping;
+	/* Line swapping */
+	cdns_mhdp_reg_write(mhdp, LANES_CONFIG, 0x00400000 | lane_mapping);
+}
+
+static int cdns_hdmi_read_hpd(struct cdns_mhdp_device *mhdp)
+{
+	u8 status;
+	int ret;
+
+	mutex_lock(&mhdp->mbox_mutex);
+
+	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_HDMI_TX, HDMI_TX_HPD_STATUS,
+				  0, NULL);
+	if (ret)
+		goto err_get_hpd;
+
+	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_HDMI_TX,
+							HDMI_TX_HPD_STATUS, sizeof(status));
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
+static int cdns_hdmi_avi_info_set(struct cdns_mhdp_device *mhdp,
+			     struct drm_display_mode *mode)
+{
+	struct hdmi_avi_infoframe frame;
+	int format = mhdp->video_info.color_fmt;
+	struct drm_connector_state *conn_state = mhdp->curr_conn->state;
+	struct drm_display_mode *adj_mode;
+	enum hdmi_quantization_range qr;
+	u8 buf[32];
+	int ret;
+
+	/* Initialise info frame from DRM mode */
+	drm_hdmi_avi_infoframe_from_display_mode(&frame,
+						mhdp->curr_conn, mode);
+
+	switch (format) {
+	case DRM_COLOR_FORMAT_YCBCR444:
+		frame.colorspace = HDMI_COLORSPACE_YUV444;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		frame.colorspace = HDMI_COLORSPACE_YUV422;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		frame.colorspace = HDMI_COLORSPACE_YUV420;
+		break;
+	default:
+		frame.colorspace = HDMI_COLORSPACE_RGB;
+		break;
+	}
+
+	drm_hdmi_avi_infoframe_colorimetry(&frame, conn_state);
+
+	adj_mode = &mhdp->bridge.encoder->crtc->state->adjusted_mode;
+
+	qr = drm_default_rgb_quant_range(adj_mode);
+
+	drm_hdmi_avi_infoframe_quant_range(&frame, mhdp->curr_conn,
+					   adj_mode, qr);
+
+	ret = hdmi_avi_infoframe_check(&frame);
+	if (WARN_ON(ret))
+		return -EINVAL;
+
+	ret = hdmi_avi_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
+	if (ret < 0) {
+		DRM_ERROR("failed to pack AVI infoframe: %d\n", ret);
+		return -1;
+	}
+
+	buf[0] = 0;
+	cdns_hdmi_infoframe_set(mhdp, 0, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_AVI);
+
+	return 0;
+}
+
+static void cdns_hdmi_vendor_info_set(struct cdns_mhdp_device *mhdp,
+				struct drm_display_mode *mode)
+{
+	struct hdmi_vendor_infoframe frame;
+	u8 buf[32];
+	int ret;
+
+	/* Initialise vendor frame from DRM mode */
+	ret = drm_hdmi_vendor_infoframe_from_display_mode(&frame, mhdp->curr_conn, mode);
+	if (ret < 0) {
+		DRM_INFO("No vendor infoframe\n");
+		return;
+	}
+
+	ret = hdmi_vendor_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
+	if (ret < 0) {
+		DRM_WARN("Unable to pack vendor infoframe: %d\n", ret);
+		return;
+	}
+
+	buf[0] = 0;
+	cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_VENDOR);
+}
+
+static void cdns_hdmi_drm_info_set(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_connector_state *conn_state;
+	struct hdmi_drm_infoframe frame;
+	u8 buf[32];
+	int ret;
+
+	conn_state = mhdp->curr_conn->state;
+
+	if (!conn_state->hdr_output_metadata)
+		return;
+
+	ret = drm_hdmi_infoframe_set_hdr_metadata(&frame, conn_state);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("couldn't set HDR metadata in infoframe\n");
+		return;
+	}
+
+	ret = hdmi_drm_infoframe_pack(&frame, buf + 1, sizeof(buf) - 1);
+	if (ret < 0) {
+		DRM_DEBUG_KMS("couldn't pack HDR infoframe\n");
+		return;
+	}
+
+	buf[0] = 0;
+	cdns_hdmi_infoframe_set(mhdp, 3, sizeof(buf), buf, HDMI_INFOFRAME_TYPE_DRM);
+}
+
+static int cdns_hdmi_phy_colorspace(int color_fmt)
+{
+	int color_space;
+
+	switch (color_fmt) {
+	case DRM_COLOR_FORMAT_YCBCR444:
+		color_space = HDMI_PHY_COLORSPACE_YUV444;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR422:
+		color_space = HDMI_PHY_COLORSPACE_YUV422;
+		break;
+	case DRM_COLOR_FORMAT_YCBCR420:
+		color_space = HDMI_PHY_COLORSPACE_YUV420;
+		break;
+	case DRM_COLOR_FORMAT_RGB444:
+	default:
+		color_space = HDMI_PHY_COLORSPACE_RGB;
+		break;
+	}
+
+	return color_space;
+}
+
+static void cdns_hdmi_mode_set(struct cdns_mhdp_device *mhdp)
+{
+	struct drm_display_mode *mode = &mhdp->mode;
+	union phy_configure_opts phy_cfg;
+	int ret;
+
+	/* video mode check */
+	if (mode->clock == 0 || mode->hdisplay == 0 ||  mode->vdisplay == 0)
+		return;
+
+	cdns_hdmi_lanes_config(mhdp);
+
+	phy_cfg.hdmi.pixel_clk_rate = mode->clock;
+	phy_cfg.hdmi.bpc = mhdp->video_info.bpc;
+	phy_cfg.hdmi.color_space = cdns_hdmi_phy_colorspace(mhdp->video_info.color_fmt);
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = phy_configure(mhdp->phy,  &phy_cfg);
+	mutex_unlock(&mhdp->mbox_mutex);
+	if (ret) {
+		dev_err(mhdp->dev, "%s: phy_configure() failed: %d\n",
+			__func__, ret);
+		return;
+	}
+
+	cdns_hdmi_sink_config(mhdp);
+
+	ret = cdns_hdmi_ctrl_init(mhdp, mhdp->hdmi.hdmi_type, mhdp->hdmi.char_rate);
+	if (ret < 0) {
+		DRM_ERROR("%s, ret = %d\n", __func__, ret);
+		return;
+	}
+
+	/* Config GCP */
+	if (mhdp->video_info.bpc == 8)
+		cdns_hdmi_disable_gcp(mhdp);
+	else
+		cdns_hdmi_enable_gcp(mhdp);
+
+	ret = cdns_hdmi_avi_info_set(mhdp, mode);
+	if (ret < 0) {
+		DRM_ERROR("%s ret = %d\n", __func__, ret);
+		return;
+	}
+
+	/* vendor info frame is enabled only for HDMI1.4 4K mode */
+	cdns_hdmi_vendor_info_set(mhdp, mode);
+
+	cdns_hdmi_drm_info_set(mhdp);
+
+	ret = cdns_hdmi_mode_config(mhdp, mode, &mhdp->video_info);
+	if (ret < 0) {
+		DRM_ERROR("CDN_API_HDMITX_SetVic_blocking ret = %d\n", ret);
+		return;
+	}
+}
+
+static int cdns_hdmi_connector_get_modes(struct drm_connector *connector)
+{
+	struct cdns_mhdp_device *mhdp =
+				container_of(connector, struct cdns_mhdp_device, connector);
+	int num_modes = 0;
+	struct edid *edid;
+
+	edid = drm_do_get_edid(connector,
+				   cdns_hdmi_get_edid_block, mhdp);
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
+static bool blob_equal(const struct drm_property_blob *a,
+		       const struct drm_property_blob *b)
+{
+	if (a && b)
+		return a->length == b->length &&
+			!memcmp(a->data, b->data, a->length);
+
+	return !a == !b;
+}
+
+static int cdns_hdmi_connector_atomic_check(struct drm_connector *connector,
+					    struct drm_atomic_state *state)
+{
+	struct drm_connector_state *new_con_state =
+		drm_atomic_get_new_connector_state(state, connector);
+	struct drm_connector_state *old_con_state =
+		drm_atomic_get_old_connector_state(state, connector);
+	struct drm_crtc *crtc = new_con_state->crtc;
+	struct drm_crtc_state *new_crtc_state;
+
+	if (!blob_equal(new_con_state->hdr_output_metadata,
+			old_con_state->hdr_output_metadata) ||
+	    new_con_state->colorspace != old_con_state->colorspace) {
+		new_crtc_state = drm_atomic_get_crtc_state(state, crtc);
+		if (IS_ERR(new_crtc_state))
+			return PTR_ERR(new_crtc_state);
+
+		new_crtc_state->mode_changed =
+			!new_con_state->hdr_output_metadata ||
+			!old_con_state->hdr_output_metadata ||
+			new_con_state->colorspace != old_con_state->colorspace;
+	}
+
+	return 0;
+}
+
+static const struct drm_connector_funcs cdns_hdmi_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.destroy = drm_connector_cleanup,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+};
+
+static const struct drm_connector_helper_funcs cdns_hdmi_connector_helper_funcs = {
+	.get_modes = cdns_hdmi_connector_get_modes,
+	.atomic_check = cdns_hdmi_connector_atomic_check,
+};
+
+static int cdns_hdmi_bridge_attach(struct drm_bridge *bridge,
+				 enum drm_bridge_attach_flags flags)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct drm_mode_config *config = &bridge->dev->mode_config;
+	struct drm_encoder *encoder = bridge->encoder;
+	struct drm_connector *connector = &mhdp->connector;
+
+	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR)) {
+		connector->interlace_allowed = 0;
+		connector->polled = DRM_CONNECTOR_POLL_HPD;
+
+		drm_connector_helper_add(connector, &cdns_hdmi_connector_helper_funcs);
+
+		drm_connector_init(bridge->dev, connector, &cdns_hdmi_connector_funcs,
+				   DRM_MODE_CONNECTOR_HDMIA);
+
+		drm_object_attach_property(&connector->base,
+					   config->hdr_output_metadata_property, 0);
+
+		if (!drm_mode_create_hdmi_colorspace_property(connector))
+			drm_object_attach_property(&connector->base,
+						connector->colorspace_property, 0);
+
+		drm_connector_attach_encoder(connector, encoder);
+	}
+
+	return 0;
+}
+
+static enum drm_mode_status
+cdns_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
+				const struct drm_display_info *info,
+				const struct drm_display_mode *mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	enum drm_mode_status mode_status = MODE_OK;
+	union phy_configure_opts phy_cfg;
+	int ret;
+
+	/* We don't support double-clocked and Interlaced modes */
+	if (mode->flags & DRM_MODE_FLAG_DBLCLK ||
+			mode->flags & DRM_MODE_FLAG_INTERLACE)
+		return MODE_BAD;
+
+	/* MAX support pixel clock rate 594MHz */
+	if (mode->clock > 594000)
+		return MODE_CLOCK_HIGH;
+
+	/* 4096x2160 is not supported */
+	if (mode->hdisplay > 3840 || mode->vdisplay > 2160)
+		return MODE_BAD_HVALUE;
+
+	/* Check modes supported by PHY */
+	phy_cfg.hdmi.pixel_clk_rate = mode->clock;
+	ret = phy_validate(mhdp->phy, PHY_MODE_HDMI, 0, &phy_cfg);
+	if (ret < 0)
+		return MODE_CLOCK_RANGE;
+
+	return mode_status;
+}
+
+bool cdns_hdmi_bridge_mode_fixup(struct drm_bridge *bridge,
+				 const struct drm_display_mode *mode,
+				 struct drm_display_mode *adjusted_mode)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct video_info *video = &mhdp->video_info;
+
+	/* The only currently supported format */
+	video->bpc = 8;
+	video->color_fmt = DRM_COLOR_FORMAT_RGB444;
+
+	return true;
+}
+
+static enum drm_connector_status
+cdns_hdmi_detect(struct cdns_mhdp_device *mhdp)
+{
+	u8 hpd = 0xf;
+
+	hpd = cdns_hdmi_read_hpd(mhdp);
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
+cdns_hdmi_bridge_detect(struct drm_bridge *bridge)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+
+	return cdns_hdmi_detect(mhdp);
+}
+
+static struct edid *cdns_hdmi_bridge_get_edid(struct drm_bridge *bridge,
+					      struct drm_connector *connector)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+
+	return drm_do_get_edid(connector, cdns_hdmi_get_edid_block, mhdp);
+}
+
+static void cdns_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
+					  struct drm_bridge_state *old_state)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+
+	mhdp->curr_conn = NULL;
+
+	mutex_lock(&mhdp->mbox_mutex);
+	phy_power_off(mhdp->phy);
+	mutex_unlock(&mhdp->mbox_mutex);
+}
+
+static void cdns_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
+					 struct drm_bridge_state *old_state)
+{
+	struct cdns_mhdp_device *mhdp = bridge->driver_private;
+	struct drm_atomic_state *state = old_state->base.state;
+	struct drm_connector *connector;
+	struct drm_crtc_state *crtc_state;
+	struct drm_connector_state *conn_state;
+	const struct drm_display_mode *mode;
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
+	DRM_INFO("Mode: %dx%dp%d\n", mode->hdisplay, mode->vdisplay, mode->clock);
+	memcpy(&mhdp->mode, mode, sizeof(struct drm_display_mode));
+
+	cdns_hdmi_mode_set(mhdp);
+}
+
+static const struct drm_bridge_funcs cdns_hdmi_bridge_funcs = {
+	.attach = cdns_hdmi_bridge_attach,
+	.detect = cdns_hdmi_bridge_detect,
+	.get_edid = cdns_hdmi_bridge_get_edid,
+	.mode_valid = cdns_hdmi_bridge_mode_valid,
+	.mode_fixup = cdns_hdmi_bridge_mode_fixup,
+	.atomic_enable = cdns_hdmi_bridge_atomic_enable,
+	.atomic_disable = cdns_hdmi_bridge_atomic_disable,
+	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
+	.atomic_reset = drm_atomic_helper_bridge_reset,
+};
+
+static void hotplug_work_func(struct work_struct *work)
+{
+	struct cdns_mhdp_device *mhdp = container_of(work,
+					   struct cdns_mhdp_device, hotplug_work.work);
+	enum drm_connector_status status = cdns_hdmi_detect(mhdp);
+
+	drm_bridge_hpd_notify(&mhdp->bridge, status);
+
+	if (status == connector_status_connected) {
+		DRM_INFO("HDMI Cable Plug In\n");
+		enable_irq(mhdp->irq[IRQ_OUT]);
+	} else if (status == connector_status_disconnected) {
+		/* Cable Disconnedted  */
+		DRM_INFO("HDMI Cable Plug Out\n");
+		enable_irq(mhdp->irq[IRQ_IN]);
+	}
+}
+
+static irqreturn_t cdns_hdmi_irq_thread(int irq, void *data)
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
+static int cdns_mhdp_imx_probe(struct platform_device *pdev)
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
+					NULL, cdns_hdmi_irq_thread,
+					IRQF_ONESHOT, dev_name(dev),
+					mhdp);
+	if (ret < 0) {
+		dev_err(dev, "can't claim irq %d\n", mhdp->irq[IRQ_IN]);
+		return -EINVAL;
+	}
+
+	irq_set_status_flags(mhdp->irq[IRQ_OUT], IRQ_NOAUTOEN);
+	ret = devm_request_threaded_irq(dev, mhdp->irq[IRQ_OUT],
+					NULL, cdns_hdmi_irq_thread,
+					IRQF_ONESHOT, dev_name(dev),
+					mhdp);
+	if (ret < 0) {
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
+	/* Mailbox access protect for HDMI PHY */
+	mutex_lock(&mhdp->mbox_mutex);
+	ret = phy_init(mhdp->phy);
+	mutex_unlock(&mhdp->mbox_mutex);
+	if (ret) {
+		dev_err(dev, "Failed to initialize PHY: %d\n", ret);
+		goto clk_disable;
+	}
+
+	/* Enable Hotplug Detect */
+	if (cdns_hdmi_read_hpd(mhdp))
+		enable_irq(mhdp->irq[IRQ_OUT]);
+	else
+		enable_irq(mhdp->irq[IRQ_IN]);
+
+	mhdp->bridge.driver_private = mhdp;
+	mhdp->bridge.funcs = &cdns_hdmi_bridge_funcs;
+	mhdp->bridge.of_node = dev->of_node;
+	mhdp->bridge.ops = DRM_BRIDGE_OP_DETECT | DRM_BRIDGE_OP_EDID |
+			   DRM_BRIDGE_OP_HPD;
+	mhdp->bridge.type = DRM_MODE_CONNECTOR_HDMIA;
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
+static int cdns_mhdp_imx_remove(struct platform_device *pdev)
+{
+	struct cdns_mhdp_device *mhdp = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	drm_bridge_remove(&mhdp->bridge);
+	clk_disable_unprepare(mhdp->apb_clk);
+
+	return ret;
+}
+
+static struct cdns_plat_data imx8mq_hdmi_drv_data = {
+	.lane_mapping = 0xe4,
+};
+
+static const struct of_device_id cdns_mhdp_imx_dt_ids[] = {
+	{ .compatible = "cdns,mhdp-imx8mq-hdmi",
+	  .data = &imx8mq_hdmi_drv_data
+	},
+	{},
+};
+MODULE_DEVICE_TABLE(of, cdns_mhdp_imx_dt_ids);
+
+static struct platform_driver cdns_mhdp_imx_platform_driver = {
+	.probe  = cdns_mhdp_imx_probe,
+	.remove = cdns_mhdp_imx_remove,
+	.driver = {
+		.name = "cdns-mhdp-imx8mq-hdmi",
+		.of_match_table = cdns_mhdp_imx_dt_ids,
+	},
+};
+
+module_platform_driver(cdns_mhdp_imx_platform_driver);
+
+MODULE_AUTHOR("Sandor Yu <sandor.yu@nxp.com>");
+MODULE_DESCRIPTION("Cadence HDMI transmitter driver");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:cdns-hdmi");
-- 
2.34.1

