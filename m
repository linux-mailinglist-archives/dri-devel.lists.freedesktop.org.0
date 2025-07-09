Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF424AFE8CE
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 14:24:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CA0B10E7C6;
	Wed,  9 Jul 2025 12:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="F8A3XFy5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013048.outbound.protection.outlook.com [40.107.159.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAECA10E7C1
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jul 2025 12:24:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yk132dtqvOaumyhn8KfpV11wPsvx9zB+nIPJ+jJoK84WseNYzF+CB3Qp33YVcDjlYjWmlOMvB5VW+t5dlnWhw4SIxLgoLoANxwwWj67RLoUlQFLLtC1cdkrOkrMVSMw4J3mdU7nhiqqr6YvsLBseLhcGBHOQs8iDJHHe9tvCzyUEbMikdHexsxPEF90WfiC6OlAbmTp4iqYpdUolzyPCLSnqnzmLG4SZTBaj1sJharlW3APhbWeHLUJp/8FmRcPq3VE7lBelB+E1DGbZHM6HoBN/9tVeY6GSYRRjhlhob4zw+5naRHP+09zTEPPSMWKaifgnj2hofv/sW83ov9SkDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6co9DhcCDDmVtN/UvSjP2n2R3iCNf+hoJyC9QvpGC0g=;
 b=wHmCt7DQKgaHbARuS74GR9SzGRPdFncrJNtlnwjohtaCq+l192yABQl0jW1beC3FoKx1MsGyX/5f1vmEEKJp3LYFNeMRaJ/YwG4j7g1mxFqJI4Xefp97CjE3n3uvEwZVXhmySxMjR+3pOlESXYl2oF7Pr7Uu3vKLzBWSoIDYBQSF6rfT6WEy1d3sO9yVyFvBf7aFeyKfeQpQh2uVwl5bguHJNun4Kdc5RzgyT8TcPN30r44oYMQwVRsLej1FqhdSLg2H3nHOMDPB9GgVMqgqQg9ctp12Cj4Xq9rzt4QSa4KOT3pPPT2IuKn9+EZE6kxde8+qZxkpynxh//qJ99vEgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6co9DhcCDDmVtN/UvSjP2n2R3iCNf+hoJyC9QvpGC0g=;
 b=F8A3XFy5jdrKgWRuB1xI3tUGmYXxA6jhDavIr6hRh0Gp3JV88O+a7lGSWcSEzK0u7rg2QGTfCuDd0mrvCG+aZg1DJFX8jUh7nfaX1PrhN8sd0iOVXH32GSNaI+HvKfvWZ6xgIJpHEVSfFgKHgA3XK0YFFZNunuH3rnH+EUGI8iRG8rPAbnuGg1mNdOBwpIkpq7bkcT2T2J0t0VREnkm+lglQl6TqfCpHpjCKa4VbFbv7E6PgcB4l6VMqKk3Gu4fulAEmx/r+n/2QLd6TdC33ifm9VOmCRNGv2wK3MObWH83elq7lNEomoDfN0IqAqFtYPdFFasXw3ZQz1PcsfDOnbA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by VI0PR04MB10712.eurprd04.prod.outlook.com (2603:10a6:800:261::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.26; Wed, 9 Jul
 2025 12:24:27 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 9 Jul 2025
 12:24:27 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Abel Vesa <abel.vesa@linaro.org>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/8] clk: imx95-blk-ctl: Cache registers when RPM routines are
 called
Date: Wed,  9 Jul 2025 15:23:20 +0300
Message-Id: <20250709122332.2874632-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
References: <20250709122332.2874632-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0219.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e4::9) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|VI0PR04MB10712:EE_
X-MS-Office365-Filtering-Correlation-Id: d5336721-0210-47ea-d3b1-08ddbee38bb6
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|19092799006|366016|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vUTZO+bIOv4+p289O1jSLqfbXDRnCHIn6vcAWqwytw8ggYBipQC+jBcc9DHT?=
 =?us-ascii?Q?bLaywv1lJcK9tondS4R1hYuCNsadnqkglbFNwYW2hN0xqoNsJgl1YnuQEh1E?=
 =?us-ascii?Q?L6SzuQ2fGuS2m0BvURgXS6SMDompRi+Ffn0GiylhAQY2hroAyebgDSeBzmLG?=
 =?us-ascii?Q?wgxIVzdqyqWlNyEk1HUGXvzAkE1AdLMNw/CJolomxlh+9WTFGO0dg6wa6qjr?=
 =?us-ascii?Q?WVU26V24Q5Wey3BYd98n1q4WTIOS09a4Pj6phASRCcfA1zecuUNalZXjulAG?=
 =?us-ascii?Q?MsXwfeFvS2btWdV01XLCcx2HdjOPIbayNbULt5aKm5f38Sv02E++4EjwpIb3?=
 =?us-ascii?Q?hD7FH5Vsg2O29Huz4qPgO61TebtYcx64vM5WJ4sNY3FZB4lFwq4x/cLOKMNM?=
 =?us-ascii?Q?08SSFFWabL6Vb6mSzojhIsTOApXFv8azRAnReMevB1PMBSs3ya1lBLRSfIIK?=
 =?us-ascii?Q?R4TgPjz15o29m+qMCr7l4tasRD/xSmzY74QyzXRCZ7zu5lt+CSjodZO2Xvg3?=
 =?us-ascii?Q?FSfitpT6NpRLvfQaExZcbyKUv8FCmznfMBXUgNez2LsLoCQ2IVOLovPd1+fW?=
 =?us-ascii?Q?VG9PYRAPCnXwHaYGUbPpAXvrmitdtSP2czKekk5PZEP+KudnzOc/TzfYTUIn?=
 =?us-ascii?Q?uAZ3ENEDA+hmFfPJz3hnz95cElShWtH7p0sHzzF8F/4Wsi20eW1FtlzdGagz?=
 =?us-ascii?Q?N//A64bEtmmJzwt0LBL5aYtL+9SPWEd9NWpdb/HPF22cWbAGtwxHIWSsFYLe?=
 =?us-ascii?Q?5BL+Von+/tkecfX1pLtt6+p+ic6HDmfEnq+A4sVecOdGi/yoRwEk6dvz9n8K?=
 =?us-ascii?Q?poYl3C8GULnRAFElt4zRI1h5tUDicjh5VH5DUzHCKgbSSaKV1pEmcJf9mK3h?=
 =?us-ascii?Q?uz5nZuipfeTE7+X9ljB47i0/RgKMu4lCaFqe3kqwpopkotLnajv5bhrmik5g?=
 =?us-ascii?Q?xqZ0zgHL0MIniE1wWaq5UD6f+PAPW5+9SSCc9uI7AAZyhrRSVxcN95oEGZb1?=
 =?us-ascii?Q?zVW7mgjco5gN4+Z34/OUmXSv23iRREMoutgVt6sntKxFi0oM10T/70Wpz8Ez?=
 =?us-ascii?Q?aE76Gmc9d3UJvWAMtL3ktl+VDAADm78jTPPaB8pj5e4Mew8oQcf4OkzGTVlM?=
 =?us-ascii?Q?Yrj7lepDHkT39Fw6MXcDE/+QbD4RikUx1Dt4GMe5OC8OeFEAVOsaNDgXAhSH?=
 =?us-ascii?Q?Hir15wIT58YW4X7PDbVI9UC10ua1aOLfEAGA40lVTkHgOyXoMXpLO73HO7ed?=
 =?us-ascii?Q?PidQWMv0Y0LrMt4g7AlNTwyrVWzNtDxJGuWCQQTrJxJyvmACTPKEvNt6DfF+?=
 =?us-ascii?Q?rl4W6aUrr+n4dNu016Pa0ftKbmzgkQPDcc37Ia2qnJBF7cvj/GX8kJbFfpee?=
 =?us-ascii?Q?lqr0gMhoUQDfLzAcgV796qarMuMuDF7x0GxUB3qemMEQ/arHAXBJqWsBoaKK?=
 =?us-ascii?Q?Nd35xMD0BZw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(19092799006)(366016)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gjCR5Y6pcW3sP87413EsWjhVM3588LlBX7v5JRI12A6SHCuARiEFJISf6OTV?=
 =?us-ascii?Q?RDs6Sf6SHIwQMoTESmdMSrrNTZbPJaZ+BpdDRM+nUWlX4/hmJvWpF9BIQFxK?=
 =?us-ascii?Q?O7X3sOX/rJBlv+Oj16tAYpZgoid5gOfUzS1LUOPV2xY5Xui+QN28fEv0eMry?=
 =?us-ascii?Q?6WuargKzZaBNCE7IfXg9q6JzgqpJyrPIAuzpjZMbfYyKz+b0gend0aDGIMeh?=
 =?us-ascii?Q?f9mNgvv2PPAiqXkMw9Xu+YPnwisYvEuTayDqCV+AwLeyHREACYzDffNSeGVq?=
 =?us-ascii?Q?tuWUXs/FNQ8hWhzmKc3Cx1S0npCHqNXwZ/DT1pAOSdy1/XOu4FXL5fEbzMIj?=
 =?us-ascii?Q?oIyAwCNHiEitGq8086Uce2O4tOetF+at11OBbq9MV9rBHck/HpdoLOiG7QRu?=
 =?us-ascii?Q?GwxxeDuFc58elMBMCxsIo6KBD8aDeMCAZqwHUiA0ZdvtXlkBvXmPii5SENFG?=
 =?us-ascii?Q?pVoexAfRJBT8JSpww6xsH7iYbtO4X2NcMTwtht/lWef6jwuK56lQlCqSWk1s?=
 =?us-ascii?Q?YMDTmezfT1F6pcbt3Zo8WJ1dlZWRUNi4tu4qXW4VAzXFnYKwKjTqIdqw53Yy?=
 =?us-ascii?Q?uKDk8HB2964NvvWQXOO2bjdqpGb2jvihrAksdM5j3em3mIPSXX9QhHZRQ01S?=
 =?us-ascii?Q?c0fIsMaHgWE4lbOsX/KyVew5XvhsKw0fSG+FfGycV+54O6ihaCf4VdpbOC3Z?=
 =?us-ascii?Q?XbV+kAgsPoPT7O8VrOkOzYIuOA4gRr24fVhBuPSSDYM8+xhXV+nxLnv0cre0?=
 =?us-ascii?Q?6NADL3tqIQ0bzOk9uNhjXnZ+dYeBOx2JGl1mbQq2kIoQg6phyLhpZ1puSFbQ?=
 =?us-ascii?Q?Jo7kMD9UMz8kPiq3OuwwwNt4pOZa/UAUUbIQeJC7dvflm5kYqPg0nlv39lhW?=
 =?us-ascii?Q?VafFwA4PD+xX1TpyLGvs4zw/twNjs7ozkB7wJDxUnvwJ82VkZUx5pBT79ADb?=
 =?us-ascii?Q?JYyghHQtZhTnaXnEkpBH+IwskXFN40Cj0j94raFOTtBcAshVRJIJKetJhZkp?=
 =?us-ascii?Q?Ei4TkOtexbwg3G1HuWFgP8Sl2Fy6vsdC4kmRFYpGfu1TUnGw1GPNIacwm1PZ?=
 =?us-ascii?Q?6/QB+hd8jBx8k4QvdtQnlhl6MQaffg6Y9DXZNF9SNV06HGaLyFSjc2aH+i1h?=
 =?us-ascii?Q?fTey0CZmjqA+TAbaAS/RcmBsNu1weAV/Rsn0RSLNr3iQnNnDqTm6kaIX3c3z?=
 =?us-ascii?Q?ClftGqhrNMLBG4xvUDamihoQoXJr2SYfuzH7GhAzURuJHJcJOgRAHEug3r/u?=
 =?us-ascii?Q?E4lwSvlQdGHazRU9iJxASS31F+sn38k7spmCQvEan04a0ijTAty/iGnIGfzn?=
 =?us-ascii?Q?qUfMH9ijzJ7BWMktvC65Y3e/2OMtXuLvNQjuYDsVB7oMiCpbmGulsMN0opZf?=
 =?us-ascii?Q?azkiyPJWIYtsFaHy6MLCif/Ptb6jfqffkziTL7CcPqEHVOJODEO+qrUwreKl?=
 =?us-ascii?Q?daDzAqD7hym9834DvrlqbQI3wfNgY414bfvvl8wjMSXVxlovCCyh3RCUBrM6?=
 =?us-ascii?Q?7As+pVpJkVzWZd5/jj5S7cJwl+4+qS42tnPpT69LUte4r5ygCzljPcbJ2zS6?=
 =?us-ascii?Q?fJNulxjZUFLjkWiwS9ghEJVO/8/efzTXh6W7tp02Yx5zsf3IDIheMVKlZIc/?=
 =?us-ascii?Q?xw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d5336721-0210-47ea-d3b1-08ddbee38bb6
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 12:24:27.0692 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsj6f9ae2r8bIa3ijHJx25J9asXuNaNnqoEUXMUrU++xTfBLsf4P9Brv/a7cgk3pAMH63aaSU4YNIgY1U3LgqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10712
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

If runtime PM is used for the clock providers and they're part of a
power domain, then the power domain supply will be cut off when runtime
suspended. That means all BLK CTL registers belonging to that power
domain will be reset. Hence, the clock settings will revert to default
values messing up the consumer clock settings.

Also, fix the suspend/resume routines as well, as the clock was left ON
when going to suspend.

Fixes: 5224b189462f ("clk: imx: add i.MX95 BLK CTL clk driver")
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 55 ++++++++++++++++++-----------
 1 file changed, 34 insertions(+), 21 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 7e88877a62451..7f9bbca517284 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -448,12 +448,36 @@ static int imx95_bc_probe(struct platform_device *pdev)
 	return ret;
 }
 
+static void __maybe_unused imx95_bc_save_reg(struct imx95_blk_ctl *bc)
+{
+	const struct imx95_blk_ctl_dev_data *bc_data;
+
+	bc_data = of_device_get_match_data(bc->dev);
+	if (!bc_data)
+		return;
+
+	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
+}
+
+static void __maybe_unused imx95_bc_restore_reg(struct imx95_blk_ctl *bc)
+{
+	const struct imx95_blk_ctl_dev_data *bc_data;
+
+	bc_data = of_device_get_match_data(bc->dev);
+	if (!bc_data)
+		return;
+
+	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
+}
+
 #ifdef CONFIG_PM
 static int imx95_bc_runtime_suspend(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
 
+	imx95_bc_save_reg(bc);
 	clk_disable_unprepare(bc->clk_apb);
+
 	return 0;
 }
 
@@ -461,7 +485,10 @@ static int imx95_bc_runtime_resume(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
 
-	return clk_prepare_enable(bc->clk_apb);
+	clk_prepare_enable(bc->clk_apb);
+	imx95_bc_restore_reg(bc);
+
+	return 0;
 }
 #endif
 
@@ -469,22 +496,12 @@ static int imx95_bc_runtime_resume(struct device *dev)
 static int imx95_bc_suspend(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	const struct imx95_blk_ctl_dev_data *bc_data;
-	int ret;
 
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
+	if (pm_runtime_suspended(dev))
 		return 0;
 
-	if (bc_data->rpm_enabled) {
-		ret = pm_runtime_get_sync(bc->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(bc->dev);
-			return ret;
-		}
-	}
-
-	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
+	imx95_bc_save_reg(bc);
+	clk_disable_unprepare(bc->clk_apb);
 
 	return 0;
 }
@@ -492,16 +509,12 @@ static int imx95_bc_suspend(struct device *dev)
 static int imx95_bc_resume(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	const struct imx95_blk_ctl_dev_data *bc_data;
 
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
+	if (pm_runtime_suspended(dev))
 		return 0;
 
-	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
-
-	if (bc_data->rpm_enabled)
-		pm_runtime_put(bc->dev);
+	clk_prepare_enable(bc->clk_apb);
+	imx95_bc_restore_reg(bc);
 
 	return 0;
 }
-- 
2.46.1

