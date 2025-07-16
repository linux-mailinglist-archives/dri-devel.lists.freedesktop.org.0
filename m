Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C91B0700F
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A79810E71F;
	Wed, 16 Jul 2025 08:15:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="rU+pg0N3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from OSPPR02CU001.outbound.protection.outlook.com
 (mail-norwayeastazon11013059.outbound.protection.outlook.com [40.107.159.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCBCB10E709
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vX/HSf8BUuxhsnsX2MXVj65pDhwmmri4qPCquRbl6lxnYtY0Dx+aQs2Vouaxa3pDE62op97zLMAytf8Ht8s6ie5fCAjszwgfFtAB6rz1nKzn/vCrtCy84zm9qpn6Pdn845SDcD9VlKxW/EUbFwcrRq1tybKWy+OgbD+Yvf3CQZaVLiOrGag6+sDT7LPemF9rtp4SiEG8433gtYs3QKroKRfIB8JvYsXbRLZsH2CmPy51ewpiGZKBsCbzybQwoY/vujxoHOdrzOyXzxgGDEgmH4EKmQBskryRpIFYzY8asi+eoeyKeIjMh/TYTk1njLUOEfdJ/9p1EMmej5bZOYhFsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+wBZhqnrt5TRjAXpAyxZaQxr0u50WKaFTpKOihEWUJA=;
 b=fg4kinKk0hN2sQHw/2tRgdwptun65sgtJ6hRxuxYL0oMHNEPcfoeT9IUGUsW11BiHMPBZGJBlxvvvMR8kO/6D1ZBWnlX92xcO5tu6IcgX2f8Yc/5JSb2In3MYgdr5ug90TjmzzwDpF5SD7mHGXRiHvJyC/a1RQ8LBxB7Jrep4V/NBUt20HnDM/KPxTy2CPtHYf1+NE+F4N1CH+Rd9UdTRwARWCeohUoaBsReCs3GRHLRaO+r+y9w3nrTetjNd1vx70CAVhkWCk7eGaWcV9cDiuFGreuZvg02vAxsdoxGEHZLU64MO0SjjtB3SFhFDyZuK7Lp09vknmesGaKaOnPcJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+wBZhqnrt5TRjAXpAyxZaQxr0u50WKaFTpKOihEWUJA=;
 b=rU+pg0N3+gE9EUtxe2inP2SthtmPIEfvp10/c3OEnMAkR8fGzwSjZrhyL6o3hIbeqlwIS4silwMYwIxvlu4zCPR+a0aZtzrKwgcjFvMN1y62cYO4Znhpfcrhm8iPSWQrCBjZGjnAC/JZQ+RJtjf2Y6XFKzB7joWK3alF7uMYC+5bCvO3PWNnj96EWYSTXvDD6X3zlpazsPYq50KKcx5Fr2XCtHp2wljuYwKaKb5gDfVzs9Jry4k6o6XBkaLAOH8wgGbefVaEX6b9qnpFxloyXWRSOe+uQ0C6icMLD0EAdf7xyQXjiQLkngayw61QHf0ByANxCyAauqqGFzPR0Ymmug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:47 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:47 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: imx@lists.linux.dev, Abel Vesa <abelvesa@kernel.org>,
 Peng Fan <peng.fan@nxp.com>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org, Frank Li <frank.li@nxp.com>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 02/10] clk: imx95-blk-ctl: Save/restore registers when RPM
 routines are called
Date: Wed, 16 Jul 2025 11:15:06 +0300
Message-Id: <20250716081519.3400158-3-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR4P281CA0209.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e5::8) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b13ae42-5470-4821-9689-08ddc440f7a5
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d3mHX8z4dYQP+O2buW8nf8aEAlkymvhabx5gwKKXgDwlTrAVLWtWWns5WwfR?=
 =?us-ascii?Q?CGkioVc0Qma01qf8PY1oIGWCaCleSWtU0VP5W2qwl47MeKpdN2PWvRd2dBpO?=
 =?us-ascii?Q?/ynCxW+tbap3P+YjEHVq+YNI+fRS3/AQ+hiW4PMLonBhRT7G+0ipcRGoO2VZ?=
 =?us-ascii?Q?0u4De0NaGfMEaUCMV+G39o2AyLyn3SIU/6O2TsCBxtifoFOzhBimJN+0lzgQ?=
 =?us-ascii?Q?j7GzUhgeDaUn0t22dHSIxgLTY3Y0CzUcnlTS/fWRTXvHFTuVi6mw9K6L38TU?=
 =?us-ascii?Q?ag8PE+SanR9ACm4RD2xvhv+XQI8ZLQ4sFPdZMZOBdlzUqJMTXRJ5dcnjY/AB?=
 =?us-ascii?Q?Uo2bfrtJ90F3pRbdZhpgY+vP8R8HPjUbYtr4WAIPxCepkP2pBlnwCfE3e+sZ?=
 =?us-ascii?Q?yjoJn7u1uDCbgwXxQ1hd+is1bqkaEKS2M8u/ECy3KqK1f/UUEzePcVYMyZe/?=
 =?us-ascii?Q?+Pq0+7LPnGK6Z6s0wNFFF/PUUxp+EOIO7XxOEJA8IahkO/0NQARrpcJ9uenL?=
 =?us-ascii?Q?UmjxtF/PfSQdgE+eQ6X5X47m9C/1S9m0gLEZoesY6gfZLQ6ueyn16DZLQwKE?=
 =?us-ascii?Q?KE1yOlFY8PtTb37G1xAiZPZ0owkYlVktoLafmNhBmOPGax51bqqYdIx0qkLU?=
 =?us-ascii?Q?UhVqPEsPV2V3Rppp9lL1cdJXFdl05s2w4CZtTJRlbgNQ9DbpWxg0vm/28h35?=
 =?us-ascii?Q?NIRHnwBdNy39fR8oQHl0H5sXbEbf+jXNxKiGg1lW7w2WP85oi9+IrbV3QgJn?=
 =?us-ascii?Q?y/j3B9GJOQY/y6hCE7GazxbNqZI9q3B/gwXJ0CHgIU5NUHivZ+Stldabmhc5?=
 =?us-ascii?Q?+wPsBJfsrIrSX/yZexWcmT4+QX11yR1nWPs14ogdBILL3o/cE6+3Ty5RAIFY?=
 =?us-ascii?Q?5+9WEh3VC8xXvEj48xBHxGvPs2TjoeHAZB8ZILCOmyatXn5P2jPHXTS8pdpY?=
 =?us-ascii?Q?xSxFHFhPn3z+4M503TjE6zI5lV2bHi5OKawCpbLFJhL2f1Pq3Hr2+bBzH5tJ?=
 =?us-ascii?Q?GIWIDNXVokaDamrVLdMltpNu+jlHHRA1KAp92qY671s7o296DebUz+piZkTY?=
 =?us-ascii?Q?suUDlMBGpusGiGfWNPUMoQGNm0STNsiyMY06JQlCh9/T54i/vlyslVsmsKhL?=
 =?us-ascii?Q?EFguKfgWOC709q6GRhOgijlf445IPoyCoOtTwMm3IAhzcyZnf3sO+4QuOYWy?=
 =?us-ascii?Q?UAcadHnZJL2l4wU7O5IDx8TFdWx4efX5vEClGldstswCnZPJg9B9iA2/tvJS?=
 =?us-ascii?Q?yGBuec+8Gx+aEWIY4//LFOHYRcF2Mr/3n89QXz+T3I+eIJSzYOORsytQy1DO?=
 =?us-ascii?Q?KuebrMbkX/vClTy9cnKu9X1XKozC27hBMWD+soWnPEJ8D7wAhmdXTuM3jwBk?=
 =?us-ascii?Q?cNBxdtiPo4th6UvRRsAB3/q9RU92Qx/Q9R5ZHHuf1sOITERox5JNXA7e0YuD?=
 =?us-ascii?Q?uOK8MpGcl5c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DI4D7dqaLFn5OK2Jid0AL4+za/LK9sgjrgRPFGp7Ef/8eRANfKO3/eZR5pYt?=
 =?us-ascii?Q?N7iy5H0KOg7Cjl6Ynv8pyWqB8J0Ncl8321AMzS6cQkTsCkAxYT/NeCyUgmyT?=
 =?us-ascii?Q?FMEvhH8WCo5y7aEoQT2/HpKb2+Bs/O8jjR6lUu2fPk+Xd9ywXx1dwTG9snPd?=
 =?us-ascii?Q?bdV1hw9dOCjp7dFjF5Lg9sm5cfNDi1N9JRbS/P6pWNc+J4+t/T80Y04bWoKg?=
 =?us-ascii?Q?2nHM8F4F3prgW8w0yCzJW7tOFtxltaqhsK8neGqGvHbbW8RCAY89eSOj9Ewc?=
 =?us-ascii?Q?vgXLgnh+uUxo5zBPVLd/zPALiI0v96rwedvCZhbdNsyEh0NnL56toGWagcdL?=
 =?us-ascii?Q?S94WzZfdcdPPoui6H01+wSQiRwtOJmmaNLLtaGk2U0HEagvT1niQVuq6z9hk?=
 =?us-ascii?Q?+5sIvMRO+MYc8h/HTJqOpKdWQ69gWndFrhtJIEli0fNXk9DpiMmvoUdY7fUk?=
 =?us-ascii?Q?UpgeVlbmKAH+xi/WdCC0Jg6u57omiAiSQB1O2tABWh73h3rullQEPh8gqFhP?=
 =?us-ascii?Q?QLtIvSbSE7gOgjcuuYi8d+bSapY5hAiZ/yA25+4KFygIogSXv4I1Dd2rP8R6?=
 =?us-ascii?Q?exnIf41Xdy60ix6saRCr4IF9BEEV4XEl+NJe7giK6vgPE1RnqnikAHJPtEih?=
 =?us-ascii?Q?bLiyx5YtYhkCt3opvezfkGFe/mbm2OLORWUaOgzt/1t8e0nC2s/bC7Xfpn8f?=
 =?us-ascii?Q?1rp5sQmmXUyIjRxP00UUkVxf/SOR4wMvfm35h6BIogvrTQUZtjuxDF3J9Vis?=
 =?us-ascii?Q?k4XlHvBzT0weWu+cDFeHuRFUhSTdyrG9VV+9hqEKipKL2H8COeiAzHgkWzkt?=
 =?us-ascii?Q?fdZpnjZD1gp9Rgct9RBm+AZXjpudOvUNE+1yfa/Hq44oPJQ5P2L6p2b+z9Ry?=
 =?us-ascii?Q?20eAHeCf/n51eo8kOmNTxSgsEf522efXbIDsFMdUUtcwTDqRw8v+U3YsXbmx?=
 =?us-ascii?Q?5zm6VbPpdJHG9MF28SY2yYeSzuOtUeRoAOlXJGu+PYU9KFHmM+/Qy3OFDJsv?=
 =?us-ascii?Q?gw9bZjc3CH8NlfdWL9NiMh8GIWbrZLfpCzwa9rQTtig9qoeWH+cz/0ppneZ1?=
 =?us-ascii?Q?h38EIMzGOdKb9oTAvRea9QIX1XxtDe3y7NBtHCCMhB2pV3OOjBcInfdgDjD3?=
 =?us-ascii?Q?No5h5pC3yn7xAwZupqwcu/tng4HAg2rN59WD1DOoV2z0JDiVK9vp5G8VCc5o?=
 =?us-ascii?Q?hJGqVdDCVcfDLXheNmCmDctpHP0138uXDClTYsMWe6r73dPl9jJFQ+xxGRSf?=
 =?us-ascii?Q?Wnn85q9GzglfaNkGJbGN0DOmPEruV+h3qFmkCOzFMtcrnM1hTnhh6UGKOEte?=
 =?us-ascii?Q?o1UM/IoohAKzxXxn5McFXzCO760dXuiZ2F4NOBpUSuRQOk3zEZoeO5wyp5i3?=
 =?us-ascii?Q?cL/mJ1EYvYNVQOBKy9+sy8AWsY09dwIx1L0qN4yWhcr7tV7voRsV83E9pNGI?=
 =?us-ascii?Q?m6NC6nGPWH16/JT6D1feGZJN+r3xq8mPUbDT7GmTBZgBi5lk6aT240nxdmU7?=
 =?us-ascii?Q?cnprQ/aU0ppyukqUnBit/nIOhO1+jrNIVGb7S0rND9fHkFPPl314gIjhuQfF?=
 =?us-ascii?Q?Z6dPQcFIA4O3upAmbeNy3WWqC7OzR/Fkn+gD+LmncWzosxQZovK87t6rmRwA?=
 =?us-ascii?Q?zw=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b13ae42-5470-4821-9689-08ddc440f7a5
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:47.0613 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7zBaosJnGxRvPujRLlv9/qbyu8V8S3N2m7Nao6VxcRlV1frIUn3+vYJ1G8iIuRSH6ox//QrFVfF9MtaafWGpYg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7820
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
domain will be reset. Save the registers, then, before entering suspend
and restore them in resume.

Also, fix the suspend/resume routines and make sure we disable/enable
the clock correctly.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index c72debaf3a60b..3f6bcc33bbe99 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -453,7 +453,9 @@ static int imx95_bc_runtime_suspend(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
 
+	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
 	clk_disable_unprepare(bc->clk_apb);
+
 	return 0;
 }
 
@@ -461,7 +463,10 @@ static int imx95_bc_runtime_resume(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
 
-	return clk_prepare_enable(bc->clk_apb);
+	clk_prepare_enable(bc->clk_apb);
+	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
+
+	return 0;
 }
 #endif
 
@@ -469,17 +474,12 @@ static int imx95_bc_runtime_resume(struct device *dev)
 static int imx95_bc_suspend(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	int ret;
 
-	if (bc->pdata->rpm_enabled) {
-		ret = pm_runtime_get_sync(bc->dev);
-		if (ret < 0) {
-			pm_runtime_put_noidle(bc->dev);
-			return ret;
-		}
-	}
+	if (pm_runtime_suspended(dev))
+		return 0;
 
 	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
+	clk_disable_unprepare(bc->clk_apb);
 
 	return 0;
 }
@@ -488,10 +488,11 @@ static int imx95_bc_resume(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
 
-	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
+	if (pm_runtime_suspended(dev))
+		return 0;
 
-	if (bc->pdata->rpm_enabled)
-		pm_runtime_put(bc->dev);
+	clk_prepare_enable(bc->clk_apb);
+	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
 
 	return 0;
 }
-- 
2.34.1

