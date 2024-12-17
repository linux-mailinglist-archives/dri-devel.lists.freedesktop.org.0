Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF9929F4462
	for <lists+dri-devel@lfdr.de>; Tue, 17 Dec 2024 07:53:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1468910E467;
	Tue, 17 Dec 2024 06:53:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=nxp.com header.i=@nxp.com header.b="Ey3Y3vuH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR03-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur03on20630.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:260c::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 569A189241
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Dec 2024 06:53:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WU6G/BGUuuievQAJZcnfr1rl5vcWfMJOY3wHPeuymCu1pdcAjeo++cwRAbVjqcIk/YgInRsIDbBHN3bE4saLhXqZ8HEWA7Jfqiak/MMYnetekHlLjGkpsVtLs/kk5OOrhBwAp4KibDJ0Du32YrqFoclYGzv4icIdXJdKofrRBkTQ8Qx4gHyRtycPvZgBNQLodt3LKthUDwsnPDEyS77Oh4DdfrSlsqeu6ZC2MwXooqq5ZX1HdhCSwsiBLJJpAhgUfT7aYJMo0HLlQs1mb3OI2WCKbLdDkeg5PCrF1+1FQTHEn/NPiSyGARDUAIo2wpiZzwnujE5K6amBynIgwuwfgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H3wg4GRF0wljaTasowYjh9DveEC/XALLXj2Fv5lrRT0=;
 b=iLrqC/9KDUKD0gVvaYCjTf1AaWexZodvptGgRGKSaMo52FiQRH4OC3bQTcMRmjI/iVc/wEL3I/mYFombcvwmO9nuQUmNILO27ltKAFy1EJ3Q4KfjkynskbbSwZlG/eS73EgxVnTm/iGY9TIgoyq6xySRWCtDlzM6J5pl698kUal26hb4zRyEoqLadH7XdzELDkVMvmWX9wK4H6mX5FQiOURBg3oLHf3x2cKttiWetlGe77nwTl6XQdl6W77k40zLRkdXphTyoaGT2xg2vIBapiVaXsnwPZC2i6PYMRWs1JNt79q4OlkXst02klfjmzRCWnvfiiIx39Ad3HcN7LvuWg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H3wg4GRF0wljaTasowYjh9DveEC/XALLXj2Fv5lrRT0=;
 b=Ey3Y3vuHQp/EzQ0bqfZ+v5lLh/GHbZpIe5Lkd+ZuNvcg3VJ+ZeugEPvqm/m5fSpGwlTZWKIpe8OGmfS7VCfDVtCAEk862sypHNJVXTIEjLil19DhDuiTWqHERsxZloZaJhKCwlMiwbxzeVTWgxz7T6pVfjZ8kLDVQ98nyH3l6Wwc9pSl71AEiokIk9HLcDzDhAeXuhwDbiPlCfL1Cpc3X1reb+8m5XIqZRFyex830i7CliJSqZuZZ2DHBhvIMbuOPErxsjultSI0qZYWoJcWjpdPJM5RdYHhZVKPvScrqIrkesuOgxL3PMlFRELN6armjvydk9Mpg6XuAjggj1yChg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21)
 by DU2PR04MB9196.eurprd04.prod.outlook.com (2603:10a6:10:2fb::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Tue, 17 Dec
 2024 06:53:29 +0000
Received: from PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc]) by PAXPR04MB9448.eurprd04.prod.outlook.com
 ([fe80::51ae:5f12:9744:1abc%2]) with mapi id 15.20.8251.015; Tue, 17 Dec 2024
 06:53:29 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dmitry.baryshkov@linaro.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, Laurent.pinchart@ideasonboard.com,
 jonas@kwiboo.se, jernej.skrabec@gmail.com, airlied@gmail.com,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, festevam@gmail.com,
 vkoul@kernel.org, dri-devel@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 mripard@kernel.org
Cc: kernel@pengutronix.de, linux-imx@nxp.com, Sandor.yu@nxp.com,
 oliver.brown@nxp.com, alexander.stein@ew.tq-group.com, sam@ravnborg.org
Subject: [PATCH v20 2/9] drm: bridge: cadence: Update mhdp8546 mailbox access
 functions
Date: Tue, 17 Dec 2024 14:51:44 +0800
Message-Id: <74bc3f2ff56348afd9d773589236ddf06dc3d45c.1734340233.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734340233.git.Sandor.yu@nxp.com>
References: <cover.1734340233.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR04CA0214.apcprd04.prod.outlook.com
 (2603:1096:4:187::17) To PAXPR04MB9448.eurprd04.prod.outlook.com
 (2603:10a6:102:2b1::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB9448:EE_|DU2PR04MB9196:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c075320-35ff-44ff-9b7b-08dd1e678335
X-LD-Processed: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|52116014|366016|1800799024|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?bGoqMZWacP82aWhMQrAU0ZbY0QsXrvrZHDW5K0DOJOeluS4pHsaOWaeM5HTy?=
 =?us-ascii?Q?ZptLJRQKkUAxqUJQZsl2x2xTHpX8keMatH4TmzJ1A3HosfBR6KXqR5Ql0PeM?=
 =?us-ascii?Q?BoFK6VgMHCd3z2uLwZYUrMje5meTRLRqymWWN/m8AoybBt7ahINs9BwyD/I7?=
 =?us-ascii?Q?cBmqgmRD3TOJVdNp7EFDHog5rF5FKVQd883JOVRPZOv67PRZHnDLdJyJlWts?=
 =?us-ascii?Q?rZ4VrC0c7g0LWIA3e/I5kRXt/+xsW21pBt8ohw7shXxmvBoItnKfHermLkCb?=
 =?us-ascii?Q?t5hj/qWTf4y7oWob4WiYwDnR89U3aO4y+HrRQsTRizjFadY7H2qE5WoS/FfG?=
 =?us-ascii?Q?anQY8tPJd0o+h/I8FJcnzj1cJUXvBBftwBGGRL3N6iFSpbkzGNGCLM3Uzc9c?=
 =?us-ascii?Q?SOvWBKEGR+1TBOOLfQ8lrXYceeUuNtDwI3mvPmgwiYQW7EyPL19krVepjCug?=
 =?us-ascii?Q?unkYcxlCbXOiBOC9vKSVKAECDDYDnajelcm+4Z96y6RNpgJUHXdkoiALkEbO?=
 =?us-ascii?Q?y9QZae8aD0FVNs9oKKOrVta3iue8QcgqQclWWEmUrPeamuClo7TG80XlBs23?=
 =?us-ascii?Q?lHzYSBZJHqcLkdz/SW7Gd/i8HsbGZRaMqRMZ5r1S/K8x0g7CdSbmXYbYJdwB?=
 =?us-ascii?Q?4aqw2+fcFOMAd/cgfA/qi6vPVxQmREMGyPIwa32IZ9WFpHQqNhx6r/3kojHH?=
 =?us-ascii?Q?7pQBJNBEFMvL5ospMpLkLFOTj732A+4jELTvxayBc1dTwyaG71mImz3HlKiU?=
 =?us-ascii?Q?urLxI2v7S4BE3bGhLaLE8MBB8gsf35YoplApa3HGjbcgPmkD/uoutaaRIGXY?=
 =?us-ascii?Q?Bhh4gYIowXoefd+2LKJc+qsb9uasa5FEHmyCdPTHuffWsH4b/EVUNnyL65qv?=
 =?us-ascii?Q?ve05vSPrlupxSsDEtuSk4e/3NLH5hI4z+lsHWOB7hEJrmzrIpUfhVKIerwoM?=
 =?us-ascii?Q?Vz0uBwkCx2oRQ7lbBwhDPqmSUb070fZ/D7Xmc3rKEOHCk3ipB3lqlxuhnVzh?=
 =?us-ascii?Q?w15W3zGL5bU/ib8N3CSE7Gvu+w2mh5OBBahuryemH6RbimGgifWP4+QsnsJI?=
 =?us-ascii?Q?c02QKQgTgvCar+8wJZa94ytu+YNi/x/DDzZgIg3QTnvzTQm1kWVH35bQVaVY?=
 =?us-ascii?Q?vaGy5Qzyr1JnsVMlb8CtU2uR3/i+xynes8U/eGhHXKwLUax6r+17JYuI80bO?=
 =?us-ascii?Q?wDNlspaINPxgK6Tyu0y8QXKixUKgmpN1iLGKuRqsdK9nuMc/vWAiuBUH7XYF?=
 =?us-ascii?Q?I1IILozzRLeYqiNfrGK/Rhf62tfOHA6CWXFZzl5X3dbzy2FEcesC0JUI/mU9?=
 =?us-ascii?Q?d7t0iH9yIijyQ4WQ78JayK8l8+QlCFEAm364kGHzbDeocjwLu/JlqDfA4CPR?=
 =?us-ascii?Q?5zjT5vldK5ZCEpHV8od3/3Fx5LAURVcWkhuz78AAiaOsCvM92xACvdfNIoD2?=
 =?us-ascii?Q?cRmJ27hJWiz6LhnC5PwIFuo5HneZE1bg?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PAXPR04MB9448.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(52116014)(366016)(1800799024)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bO1Qx6UJXRxyWG+hGESWNlFEM5KSfWWOtxubvVi5yQYsWWMq0TluBCns8A43?=
 =?us-ascii?Q?FYekeShHFgaYZWjpc9HsDwF4Tfw9Eeh3YXyh0/5FfjiNwnRRP6wn9WheDN75?=
 =?us-ascii?Q?0dUzysr4oIrMB6hMeS+i6CCz+Hmgod2pR3qGofNdCHraQxyKgXIh/5Httqi1?=
 =?us-ascii?Q?vJv4UXMdkAWJgdVUr0+11FG/fmg+bVePwDkW11L6FKPj6e8DDZo6gEB9iRuv?=
 =?us-ascii?Q?mz8xSp3RxQ7UM1Pes/QNb2lLrLggHiU+dVrZ+zvQ9h/7kc1YOHtVYD6XsWmG?=
 =?us-ascii?Q?Z3o/zlM+WqO2X/EAOeQgr3hI9aRK7re0hqLuHL8WdvgJ7Inap75TlfsygrX+?=
 =?us-ascii?Q?ytMExNyC7EvrCYEZo1avz4JXV5AVl/iGhpOogmS2KFV09OjP/IfyI0ZX2yIU?=
 =?us-ascii?Q?hXaDr72ITWu7UD16Qmm1TCsoo5s0xWE4gMGOFdHXLsZ90qEc1TPr6fXDMlz4?=
 =?us-ascii?Q?c5mFAGPiEm6joc7hanSqppp5nk815qTaK5wwH1rzQa1KYpu7UlL0Zezryl9e?=
 =?us-ascii?Q?snSD3VbUcYuzj5zbPjma1Nl3mHCZY+plKE4e1tnYcinaV9pT8ddwNCX6m6ir?=
 =?us-ascii?Q?u5JF4VolcU9QZyo7ggMSHD+nYVnVwa1P23PrM3oYDKrZJ+7K66jnh0yVcCmG?=
 =?us-ascii?Q?k8rWuEqj37uR1DCdMY/nj6alW4WCBpwD/c3TJ1OY6feK2ESJnh5GNekkP1kU?=
 =?us-ascii?Q?QDJUWs12U8aaR22jdwx1a750N8RQVeQ83CAssWrgjX0n2tLP6Gi2xKsSY/ac?=
 =?us-ascii?Q?mpJlMxFHld2V3sTKsysY+6UVu8rCzw9CWMRpslYA5x7hc2Elu49EFdCKeGIm?=
 =?us-ascii?Q?ETy9lohFyyRcqaimbXi0ldEs9ADZjGfxhvqh3p+TVho2IDqdC3nM4Rvxs+Ke?=
 =?us-ascii?Q?I5eUhcTWUs/vmbeop4XQTSE5KTXTfpGfXoduBPkcSW1Z4+4/qCyQKnk4tD0m?=
 =?us-ascii?Q?Ehw/CFDFyNW0n7Pg/iTVASusJLJxrkvas+4Su0/+4Rs2lubDJAQg36WeXbn6?=
 =?us-ascii?Q?m40HCIJAMWrSSFa5OVUgjWQNwZmrLTBUWH2MQ642zOoOsf7COcOyuyeVxzQF?=
 =?us-ascii?Q?lzJOwTPtnriYsqnrgWJTDgVmH6yOeWBNOj/X3h/PV6xZzVeLgi28cMmFEIIO?=
 =?us-ascii?Q?r/vfAik0h8qFI3BRCJf/XuNTfVOkS6L0vE+oXkpa5W1lT1PSKie5zN6quHBg?=
 =?us-ascii?Q?zU2GZH01bhX4MqLgPVQ3XQxK5xQzxmS7GTfbvPURWgs4nGQ5wCN/xqqY7Zfl?=
 =?us-ascii?Q?OqqTWFucUym3dy6NwkudGfdoBjuSLSVXX8IkMBYGO4AEolsQltTCMUGB1haY?=
 =?us-ascii?Q?n0qQ5PQVBz1ian1FFdPQPiu/SLU3Vi8Gju2EVRyWZ6NOMZ36TVVvY+kTvNAX?=
 =?us-ascii?Q?rYMUxNSleOw0azfertBAuNvC9JjIdKqJ3lXaJbMK4ex4yaa7dRptF1w48fm6?=
 =?us-ascii?Q?WYNPpr9gEw+YVdeMtxrdjEOQEB+ID7CvQ3jYnhhEVF1Nhn41miJHq7qyJs9G?=
 =?us-ascii?Q?PKiQfKlZtw7YNqcQbXV83zGKjZlMM4kFaqYSjbRGa8o+K3ut7Z7YKk/cik+v?=
 =?us-ascii?Q?qTdIAuKMNVALCls76B/kgiradHJ2CaEF34gOdpmj?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c075320-35ff-44ff-9b7b-08dd1e678335
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB9448.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2024 06:53:29.2201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMww/omhvBwxRRNqjRtKgA/NaScsmpyqFtPCiaWZZEGyL9fResORDb2FGJ1RQUtCZKUFt552C8N94NkFW+89Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB9196
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

Basic mailbox access functions are removed, they are replaced by
mailbox helper functions:
- cdns_mhdp_mailbox_send()
- cdns_mhdp_mailbox_send_recv()
- cdns_mhdp_mailbox_send_recv_multi()
- cdns_mhdp_secure_mailbox_send()
- cdns_mhdp_secure_mailbox_send_recv()
- cdns_mhdp_secure_mailbox_send_recv_multi()

All MHDP commands that need to be passed through the mailbox
have been rewritten using these new helper functions.

Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
v19->v20:
- remove mhdp helper functions from the patch.

v18->v19:
- Use guard(mutex)
- Add kerneldocs for all new APIs.
- Detail comments for mailbox access specific case.
- Remove cdns_mhdp_dp_reg_write() because it is not needed by driver now.

v17->v18:
- Create three ordinary mailbox access APIs
    cdns_mhdp_mailbox_send
    cdns_mhdp_mailbox_send_recv
    cdns_mhdp_mailbox_send_recv_multi
- Create three secure mailbox access APIs
    cdns_mhdp_secure_mailbox_send
    cdns_mhdp_secure_mailbox_send_recv
    cdns_mhdp_secure_mailbox_send_recv_multi
- MHDP8546 DP and HDCP commands that need access mailbox are rewrited
  with above 6 API functions.

v16->v17:
- Replaces the local mutex mbox_mutex with a global mutex mhdp_mailbox_mutex

v12->v16:
 *No change.

 drivers/gpu/drm/bridge/cadence/Kconfig        |   1 +
 .../drm/bridge/cadence/cdns-mhdp8546-core.c   | 487 +++---------------
 .../drm/bridge/cadence/cdns-mhdp8546-core.h   |  47 +-
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.c   | 212 +-------
 .../drm/bridge/cadence/cdns-mhdp8546-hdcp.h   |  18 +-
 5 files changed, 104 insertions(+), 661 deletions(-)

diff --git a/drivers/gpu/drm/bridge/cadence/Kconfig b/drivers/gpu/drm/bridge/cadence/Kconfig
index cced81633ddcd..dbb06533ccab2 100644
--- a/drivers/gpu/drm/bridge/cadence/Kconfig
+++ b/drivers/gpu/drm/bridge/cadence/Kconfig
@@ -28,6 +28,7 @@ config DRM_CDNS_MHDP8546
 	select DRM_DISPLAY_HELPER
 	select DRM_KMS_HELPER
 	select DRM_PANEL_BRIDGE
+	select CDNS_MHDP_HELPER
 	depends on OF
 	help
 	  Support Cadence DPI to DP bridge. This is an internal
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
index d081850e3c03e..bd897c3ae7642 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c
@@ -73,302 +73,18 @@ static void cdns_mhdp_bridge_hpd_disable(struct drm_bridge *bridge)
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
-static
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
-{
-	u8 msg[6], reg[5];
-	int ret;
-
-	put_unaligned_be16(1, msg);
-	put_unaligned_be24(addr, msg + 2);
-	msg[5] = value;
-
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_WRITE_DPCD, sizeof(msg), msg);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_WRITE_DPCD, sizeof(reg));
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-	if (ret)
-		goto out;
-
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
 static
 int cdns_mhdp_set_firmware_active(struct cdns_mhdp_device *mhdp, bool enable)
 {
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
-	if (ret)
-		goto out;
-
-	ret = 0;
+	u8 status;
+	int ret;
 
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	status = enable ? FW_ACTIVE : FW_STANDBY;
 
+	ret = cdns_mhdp_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_GENERAL,
+					  GENERAL_MAIN_CONTROL,
+					  sizeof(status), &status,
+					  sizeof(status), &status);
 	if (ret < 0)
 		dev_err(mhdp->dev, "set firmware active failed\n");
 	return ret;
@@ -380,34 +96,18 @@ int cdns_mhdp_get_hpd_status(struct cdns_mhdp_device *mhdp)
 	u8 status;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_HPD_STATE, 0, NULL);
-	if (ret)
-		goto err_get_hpd;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_HPD_STATE,
-					    sizeof(status));
-	if (ret)
-		goto err_get_hpd;
+	ret = cdns_mhdp_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_DP_TX,
+					  DPTX_HPD_STATE,
+					  0, NULL,
+					  sizeof(status), &status);
 
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &status, sizeof(status));
 	if (ret)
-		goto err_get_hpd;
-
-	mutex_unlock(&mhdp->mbox_mutex);
+		return ret;
 
 	dev_dbg(mhdp->dev, "%s: HPD %splugged\n", __func__,
 		status ? "" : "un");
 
 	return status;
-
-err_get_hpd:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
 }
 
 static
@@ -418,28 +118,17 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 	u8 msg[2], reg[2], i;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-
 	for (i = 0; i < 4; i++) {
 		msg[0] = block / 2;
 		msg[1] = block % 2;
 
-		ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-					     DPTX_GET_EDID, sizeof(msg), msg);
-		if (ret)
-			continue;
-
-		ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-						    DPTX_GET_EDID,
-						    sizeof(reg) + length);
-		if (ret)
-			continue;
-
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, reg, sizeof(reg));
-		if (ret)
-			continue;
-
-		ret = cdns_mhdp_mailbox_recv_data(mhdp, edid, length);
+		ret = cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
+							MB_MODULE_ID_DP_TX,
+							DPTX_GET_EDID,
+							sizeof(msg), msg,
+							DPTX_GET_EDID,
+							sizeof(reg), reg,
+							length, edid);
 		if (ret)
 			continue;
 
@@ -447,8 +136,6 @@ int cdns_mhdp_get_edid_block(void *data, u8 *edid,
 			break;
 	}
 
-	mutex_unlock(&mhdp->mbox_mutex);
-
 	if (ret)
 		dev_err(mhdp->dev, "get block[%d] edid failed: %d\n",
 			block, ret);
@@ -462,21 +149,9 @@ int cdns_mhdp_read_hpd_event(struct cdns_mhdp_device *mhdp)
 	u8 event = 0;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_READ_EVENT, 0, NULL);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_EVENT, sizeof(event));
-	if (ret < 0)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, &event, sizeof(event));
-out:
-	mutex_unlock(&mhdp->mbox_mutex);
+	ret = cdns_mhdp_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_DP_TX,
+					  DPTX_READ_EVENT,
+					  0, NULL, sizeof(event), &event);
 
 	if (ret < 0)
 		return ret;
@@ -510,35 +185,23 @@ int cdns_mhdp_adjust_lt(struct cdns_mhdp_device *mhdp, unsigned int nlanes,
 	put_unaligned_be16(udelay, payload + 1);
 	memcpy(payload + 3, lanes_data, nlanes);
 
-	mutex_lock(&mhdp->mbox_mutex);
-
-	ret = cdns_mhdp_mailbox_send(mhdp, MB_MODULE_ID_DP_TX,
-				     DPTX_ADJUST_LT,
-				     sizeof(payload), payload);
-	if (ret)
-		goto out;
-
 	/* Yes, read the DPCD read command response */
-	ret = cdns_mhdp_mailbox_recv_header(mhdp, MB_MODULE_ID_DP_TX,
-					    DPTX_READ_DPCD,
-					    sizeof(hdr) + DP_LINK_STATUS_SIZE);
-	if (ret)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, hdr, sizeof(hdr));
+	ret = cdns_mhdp_mailbox_send_recv_multi(&mhdp->base,
+						MB_MODULE_ID_DP_TX,
+						DPTX_ADJUST_LT,
+						sizeof(payload), payload,
+						DPTX_READ_DPCD,
+						sizeof(hdr), hdr,
+						DP_LINK_STATUS_SIZE,
+						link_status);
 	if (ret)
 		goto out;
 
 	addr = get_unaligned_be24(hdr + 2);
 	if (addr != DP_LANE0_1_STATUS)
-		goto out;
-
-	ret = cdns_mhdp_mailbox_recv_data(mhdp, link_status,
-					  DP_LINK_STATUS_SIZE);
+		ret = -EINVAL;
 
 out:
-	mutex_unlock(&mhdp->mbox_mutex);
-
 	if (ret)
 		dev_err(mhdp->dev, "Failed to adjust Link Training.\n");
 
@@ -847,7 +510,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 		unsigned int i;
 
 		for (i = 0; i < msg->size; ++i) {
-			ret = cdns_mhdp_dpcd_write(mhdp,
+			ret = cdns_mhdp_dpcd_write(&mhdp->base,
 						   msg->address + i, buf[i]);
 			if (!ret)
 				continue;
@@ -859,7 +522,7 @@ static ssize_t cdns_mhdp_transfer(struct drm_dp_aux *aux,
 			return ret;
 		}
 	} else {
-		ret = cdns_mhdp_dpcd_read(mhdp, msg->address,
+		ret = cdns_mhdp_dpcd_read(&mhdp->base, msg->address,
 					  msg->buffer, msg->size);
 		if (ret) {
 			dev_err(mhdp->dev,
@@ -887,12 +550,12 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
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
@@ -913,7 +576,7 @@ static int cdns_mhdp_link_training_init(struct cdns_mhdp_device *mhdp)
 		return ret;
 	}
 
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG,
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG,
 			    CDNS_PHY_COMMON_CONFIG |
 			    CDNS_PHY_TRAINING_EN |
 			    CDNS_PHY_TRAINING_TYPE(1) |
@@ -1058,7 +721,7 @@ static bool cdns_mhdp_link_training_channel_eq(struct cdns_mhdp_device *mhdp,
 		CDNS_PHY_TRAINING_TYPE(eq_tps);
 	if (eq_tps != 4)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   (eq_tps != 4) ? eq_tps | DP_LINK_SCRAMBLING_DISABLE :
@@ -1322,7 +985,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 			   mhdp->host.scrambler ? 0 :
 			   DP_LINK_SCRAMBLING_DISABLE);
 
-	ret = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
+	ret = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &reg32);
 	if (ret < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1333,13 +996,13 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
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
@@ -1347,7 +1010,7 @@ static int cdns_mhdp_link_training(struct cdns_mhdp_device *mhdp,
 	reg32 = CDNS_PHY_COMMON_CONFIG | CDNS_PHY_TRAINING_TYPE(1);
 	if (!mhdp->host.scrambler)
 		reg32 |= CDNS_PHY_SCRAMBLER_BYPASS;
-	cdns_mhdp_reg_write(mhdp, CDNS_DPTX_PHY_CONFIG, reg32);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DPTX_PHY_CONFIG, reg32);
 
 	drm_dp_dpcd_writeb(&mhdp->aux, DP_TRAINING_PATTERN_SET,
 			   DP_TRAINING_PATTERN_DISABLE);
@@ -1461,7 +1124,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	mhdp->link.num_lanes = cdns_mhdp_max_num_lanes(mhdp);
 
 	/* Disable framer for link training */
-	err = cdns_mhdp_reg_read(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
+	err = cdns_mhdp_reg_read(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, &resp);
 	if (err < 0) {
 		dev_err(mhdp->dev,
 			"Failed to read CDNS_DP_FRAMER_GLOBAL_CONFIG %d\n",
@@ -1470,7 +1133,7 @@ static int cdns_mhdp_link_up(struct cdns_mhdp_device *mhdp)
 	}
 
 	resp &= ~CDNS_DP_FRAMER_EN;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, resp);
 
 	/* Spread AMP if required, enable 8b/10b coding */
 	amp[0] = cdns_mhdp_get_ssc_supported(mhdp) ? DP_SPREAD_AMP_0_5 : 0;
@@ -1834,7 +1497,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	if (mode->flags & DRM_MODE_FLAG_INTERLACE)
 		bnd_hsync2vsync |= CDNS_IP_DET_INTERLACE_FORMAT;
 
-	cdns_mhdp_reg_write(mhdp, CDNS_BND_HSYNC2VSYNC(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_BND_HSYNC2VSYNC(stream_id),
 			    bnd_hsync2vsync);
 
 	hsync2vsync_pol_ctrl = 0;
@@ -1842,10 +1505,10 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
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
@@ -1853,19 +1516,19 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
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
 
@@ -1874,11 +1537,11 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
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
 
@@ -1887,7 +1550,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 			 CDNS_DP_MSAV1_VDISP_WIDTH(mode->crtc_vdisplay);
 	if (mode->flags & DRM_MODE_FLAG_NVSYNC)
 		msa_vertical_1 |= CDNS_DP_MSAV1_VSYNC_POL_LOW;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_MSA_VERTICAL_1(stream_id),
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_MSA_VERTICAL_1(stream_id),
 			    msa_vertical_1);
 
 	if ((mode->flags & DRM_MODE_FLAG_INTERLACE) &&
@@ -1899,14 +1562,14 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
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
 
@@ -1915,13 +1578,13 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
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
@@ -1930,7 +1593,7 @@ static void cdns_mhdp_configure_video(struct cdns_mhdp_device *mhdp,
 	}
 	framer |= CDNS_DP_FRAMER_EN;
 	framer &= ~CDNS_DP_NO_VIDEO_MODE;
-	cdns_mhdp_reg_write(mhdp, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
+	cdns_mhdp_reg_write(&mhdp->base, CDNS_DP_FRAMER_GLOBAL_CONFIG, framer);
 }
 
 static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
@@ -1963,15 +1626,15 @@ static void cdns_mhdp_sst_enable(struct cdns_mhdp_device *mhdp,
 
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
 
@@ -2006,13 +1669,13 @@ static void cdns_mhdp_atomic_enable(struct drm_bridge *bridge,
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
@@ -2083,16 +1746,16 @@ static void cdns_mhdp_atomic_disable(struct drm_bridge *bridge,
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
@@ -2471,7 +2134,6 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	mhdp->clk = clk;
 	mhdp->dev = dev;
-	mutex_init(&mhdp->mbox_mutex);
 	mutex_init(&mhdp->link_mutex);
 	spin_lock_init(&mhdp->start_lock);
 
@@ -2502,6 +2164,11 @@ static int cdns_mhdp_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, mhdp);
 
+	/* init base struct for access mailbox  */
+	mhdp->base.dev = mhdp->dev;
+	mhdp->base.regs = mhdp->regs;
+	mhdp->base.sapb_regs = mhdp->sapb_regs;
+
 	mhdp->info = of_device_get_match_data(dev);
 
 	clk_prepare_enable(clk);
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
index bad2fc0c73066..535300d040dea 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.h
@@ -18,6 +18,7 @@
 #include <drm/display/drm_dp_helper.h>
 #include <drm/drm_bridge.h>
 #include <drm/drm_connector.h>
+#include <soc/cadence/cdns-mhdp-helper.h>
 
 struct clk;
 struct device;
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
@@ -362,9 +326,6 @@ struct cdns_mhdp_device {
 
 	const struct cdns_mhdp_platform_info *info;
 
-	/* This is to protect mailbox communications with the firmware */
-	struct mutex mbox_mutex;
-
 	/*
 	 * "link_mutex" protects the access to all the link parameters
 	 * including the link training process. Link training will be
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
index 42248f179b69d..3944642f2ebbc 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.c
@@ -15,144 +15,20 @@
 
 #include "cdns-mhdp8546-hdcp.h"
 
-static int cdns_mhdp_secure_mailbox_read(struct cdns_mhdp_device *mhdp)
-{
-	int ret, empty;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_EMPTY,
-				 empty, !empty, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	return readl(mhdp->sapb_regs + CDNS_MAILBOX_RX_DATA) & 0xff;
-}
-
-static int cdns_mhdp_secure_mailbox_write(struct cdns_mhdp_device *mhdp,
-					  u8 val)
-{
-	int ret, full;
-
-	WARN_ON(!mutex_is_locked(&mhdp->mbox_mutex));
-
-	ret = readx_poll_timeout(readl, mhdp->sapb_regs + CDNS_MAILBOX_FULL,
-				 full, !full, MAILBOX_RETRY_US,
-				 MAILBOX_TIMEOUT_US);
-	if (ret < 0)
-		return ret;
-
-	writel(val, mhdp->sapb_regs + CDNS_MAILBOX_TX_DATA);
-
-	return 0;
-}
-
-static int cdns_mhdp_secure_mailbox_recv_header(struct cdns_mhdp_device *mhdp,
-						u8 module_id,
-						u8 opcode,
-						u16 req_size)
-{
-	u32 mbox_size, i;
-	u8 header[4];
-	int ret;
-
-	/* read the header of the message */
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_secure_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		header[i] = ret;
-	}
-
-	mbox_size = get_unaligned_be16(header + 2);
-
-	if (opcode != header[0] || module_id != header[1] ||
-	    (opcode != HDCP_TRAN_IS_REC_ID_VALID && req_size != mbox_size)) {
-		for (i = 0; i < mbox_size; i++)
-			if (cdns_mhdp_secure_mailbox_read(mhdp) < 0)
-				break;
-		return -EINVAL;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_secure_mailbox_recv_data(struct cdns_mhdp_device *mhdp,
-					      u8 *buff, u16 buff_size)
-{
-	int ret;
-	u32 i;
-
-	for (i = 0; i < buff_size; i++) {
-		ret = cdns_mhdp_secure_mailbox_read(mhdp);
-		if (ret < 0)
-			return ret;
-
-		buff[i] = ret;
-	}
-
-	return 0;
-}
-
-static int cdns_mhdp_secure_mailbox_send(struct cdns_mhdp_device *mhdp,
-					 u8 module_id,
-					 u8 opcode,
-					 u16 size,
-					 u8 *message)
-{
-	u8 header[4];
-	int ret;
-	u32 i;
-
-	header[0] = opcode;
-	header[1] = module_id;
-	put_unaligned_be16(size, header + 2);
-
-	for (i = 0; i < sizeof(header); i++) {
-		ret = cdns_mhdp_secure_mailbox_write(mhdp, header[i]);
-		if (ret)
-			return ret;
-	}
-
-	for (i = 0; i < size; i++) {
-		ret = cdns_mhdp_secure_mailbox_write(mhdp, message[i]);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
 static int cdns_mhdp_hdcp_get_status(struct cdns_mhdp_device *mhdp,
 				     u16 *hdcp_port_status)
 {
 	u8 hdcp_status[HDCP_STATUS_SIZE];
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP_TRAN_STATUS_CHANGE, 0, NULL);
-	if (ret)
-		goto err_get_hdcp_status;
-
-	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
-						   HDCP_TRAN_STATUS_CHANGE,
-						   sizeof(hdcp_status));
-	if (ret)
-		goto err_get_hdcp_status;
-
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_status,
-						 sizeof(hdcp_status));
+	ret = cdns_mhdp_secure_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+						 HDCP_TRAN_STATUS_CHANGE, 0, NULL,
+						 sizeof(hdcp_status), hdcp_status);
 	if (ret)
-		goto err_get_hdcp_status;
+		return ret;
 
 	*hdcp_port_status = ((u16)(hdcp_status[0] << 8) | hdcp_status[1]);
 
-err_get_hdcp_status:
-	mutex_unlock(&mhdp->mbox_mutex);
-
 	return ret;
 }
 
@@ -170,98 +46,52 @@ static u8 cdns_mhdp_hdcp_handle_status(struct cdns_mhdp_device *mhdp,
 static int cdns_mhdp_hdcp_rx_id_valid_response(struct cdns_mhdp_device *mhdp,
 					       u8 valid)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
 					    HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
 					    1, &valid);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
 }
 
 static int cdns_mhdp_hdcp_rx_id_valid(struct cdns_mhdp_device *mhdp,
 				      u8 *recv_num, u8 *hdcp_rx_id)
 {
 	u8 rec_id_hdr[2];
-	u8 status;
 	int ret;
 
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP_TRAN_IS_REC_ID_VALID, 0, NULL);
-	if (ret)
-		goto err_rx_id_valid;
-
-	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
-						   HDCP_TRAN_IS_REC_ID_VALID,
-						   sizeof(status));
-	if (ret)
-		goto err_rx_id_valid;
-
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, rec_id_hdr, 2);
+	ret = cdns_mhdp_secure_mailbox_send_recv_multi(&mhdp->base,
+						       MB_MODULE_ID_HDCP_TX,
+						       HDCP_TRAN_IS_REC_ID_VALID,
+						       0, NULL,
+						       HDCP_TRAN_IS_REC_ID_VALID,
+						       sizeof(rec_id_hdr), rec_id_hdr,
+						       0, hdcp_rx_id);
 	if (ret)
-		goto err_rx_id_valid;
+		return ret;
 
 	*recv_num = rec_id_hdr[0];
 
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, hdcp_rx_id, 5 * *recv_num);
-
-err_rx_id_valid:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return 0;
 }
 
 static int cdns_mhdp_hdcp_km_stored_resp(struct cdns_mhdp_device *mhdp,
 					 u32 size, u8 *km)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP2X_TX_RESPOND_KM, size, km);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+					     HDCP2X_TX_RESPOND_KM, size, km);
 }
 
 static int cdns_mhdp_hdcp_tx_is_km_stored(struct cdns_mhdp_device *mhdp,
 					  u8 *resp, u32 size)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP2X_TX_IS_KM_STORED, 0, NULL);
-	if (ret)
-		goto err_is_km_stored;
-
-	ret = cdns_mhdp_secure_mailbox_recv_header(mhdp, MB_MODULE_ID_HDCP_TX,
-						   HDCP2X_TX_IS_KM_STORED,
-						   size);
-	if (ret)
-		goto err_is_km_stored;
-
-	ret = cdns_mhdp_secure_mailbox_recv_data(mhdp, resp, size);
-err_is_km_stored:
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send_recv(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+						 HDCP2X_TX_IS_KM_STORED,
+						 0, NULL, size, resp);
 }
 
 static int cdns_mhdp_hdcp_tx_config(struct cdns_mhdp_device *mhdp,
 				    u8 hdcp_cfg)
 {
-	int ret;
-
-	mutex_lock(&mhdp->mbox_mutex);
-	ret = cdns_mhdp_secure_mailbox_send(mhdp, MB_MODULE_ID_HDCP_TX,
-					    HDCP_TRAN_CONFIGURATION, 1, &hdcp_cfg);
-	mutex_unlock(&mhdp->mbox_mutex);
-
-	return ret;
+	return cdns_mhdp_secure_mailbox_send(&mhdp->base, MB_MODULE_ID_HDCP_TX,
+					     HDCP_TRAN_CONFIGURATION, 1, &hdcp_cfg);
 }
 
 static int cdns_mhdp_hdcp_set_config(struct cdns_mhdp_device *mhdp,
diff --git a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
index 3b6ec9c3a8d8b..1e68530e72229 100644
--- a/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
+++ b/drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-hdcp.h
@@ -9,6 +9,7 @@
 #ifndef CDNS_MHDP8546_HDCP_H
 #define CDNS_MHDP8546_HDCP_H
 
+#include <soc/cadence/cdns-mhdp-helper.h>
 #include "cdns-mhdp8546-core.h"
 
 #define HDCP_MAX_RECEIVERS 32
@@ -32,23 +33,6 @@ enum {
 	HDCP_SET_SEED,
 };
 
-enum {
-	HDCP_TRAN_CONFIGURATION,
-	HDCP2X_TX_SET_PUBLIC_KEY_PARAMS,
-	HDCP2X_TX_SET_DEBUG_RANDOM_NUMBERS,
-	HDCP2X_TX_RESPOND_KM,
-	HDCP1_TX_SEND_KEYS,
-	HDCP1_TX_SEND_RANDOM_AN,
-	HDCP_TRAN_STATUS_CHANGE,
-	HDCP2X_TX_IS_KM_STORED,
-	HDCP2X_TX_STORE_KM,
-	HDCP_TRAN_IS_REC_ID_VALID,
-	HDCP_TRAN_RESPOND_RECEIVER_ID_VALID,
-	HDCP_TRAN_TEST_KEYS,
-	HDCP2X_TX_SET_KM_KEY_PARAMS,
-	HDCP_NUM_OF_SUPPORTED_MESSAGES
-};
-
 enum {
 	HDCP_CONTENT_TYPE_0,
 	HDCP_CONTENT_TYPE_1,
-- 
2.34.1

