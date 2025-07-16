Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D79B0700B
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jul 2025 10:16:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D696C10E704;
	Wed, 16 Jul 2025 08:15:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="Ewr5WuZT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from AM0PR83CU005.outbound.protection.outlook.com
 (mail-westeuropeazon11010046.outbound.protection.outlook.com [52.101.69.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F76010E704
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jul 2025 08:15:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qfgYCRBD/lbkSGV2nv/O8wzZhqUTRPNbpylVdxWjxoFAWsKPVhOQBJ5Ll2iLkRZgG+LljAwYpiu095qJwH2egT0UaBYE0ADJBXL4CpOwHpgGQAcXo+4KtnBHHK2dAb8xWqEXQ6KOlIvOZtEcKB2WCENQd1STgXfyTVcVcdK6HCG7lOKKab4ZTqIQekBSROVW96pNtMDPMmOky0tyPIqvwEuGGEcWWSxxBLVQWJtRj+er4AcPub+h7mlg38SMlOGwvbYCpzFwu9gfbVxsBxPaWsZttrU7uSkwUs+KuLta5ke2uemArPlml+45zsXk4xf7wgtNEvaPt8UfGk6wH4edFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iwpwDJnC0U6c8ium4/Os2+b9q+dtHJwFSsrsGGU8ljg=;
 b=yRfFHFkEGb2yT/jH1wHytNImW8jSbL8gUsE8GGu1UO6T8wVtPdAki1pJ4IKk1EeE8xJ+/tHZKsJHxxWRYALXpRcintyKi3gex9nhS35UHu8SU04Pvr8OAIM4PxeDwZDCW1XQ9dU64GWUnuVt1yyiA586VDOs13+KsHxNZfyJpccxITVACeo9J3ZXF4Qqkl2gj3ARriwApIJlS/dTBuqbJ2uN0XlaBy3jKgJHVtWEaPE+4I2GxOpjzrU0lLYd1AYcJvBhpKPwp1FRmbxoNntAjYcOr4nO8Rs5Odz1yTcSfH7l8kIrD3VZh0HFlOk5xRVjqkWCmAFWgLOQqHOAsIX3Ag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com; 
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iwpwDJnC0U6c8ium4/Os2+b9q+dtHJwFSsrsGGU8ljg=;
 b=Ewr5WuZTbj7q61/CBdGgdGv2jMBEuYYt8r/dixa+Jj7b23D+EvUT6ArUOL8rQmrBEz3SGrB2XLasK7vA2HhaSp5/90OFTFqI2BFiq9P3kKYVmX5oz/EoogcziESSn7vXPwUrrA2vt95HidoFsRfOMl9Q9dZCvW9V+Ps8QzxlwkdkPI4NdLcqSTMIsQHMHigRUkhhW4OPisjh9wtkIIclh1s2MnycCuYFv5CS+gPitrvFEZpPmqAxPQJrQQOOR9dOyVr2uGEV240He38iNHQFMTgqs4dptOBYnBt5awFBUVpEyD8CtWwebOhwh6MM8C2uG1s8gHgoPwGKKDrN/QIrcA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com (2603:10a6:20b:4fe::12)
 by DBBPR04MB7820.eurprd04.prod.outlook.com (2603:10a6:10:1ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Wed, 16 Jul
 2025 08:15:44 +0000
Received: from AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30]) by AS4PR04MB9576.eurprd04.prod.outlook.com
 ([fe80::9cf2:8eae:c3d1:2f30%4]) with mapi id 15.20.8901.021; Wed, 16 Jul 2025
 08:15:44 +0000
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
Subject: [PATCH v2 01/10] clk: imx95-blk-ctl: Save platform data in
 imx95_blk_ctl structure
Date: Wed, 16 Jul 2025 11:15:05 +0300
Message-Id: <20250716081519.3400158-2-laurentiu.palcu@oss.nxp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
References: <20250716081519.3400158-1-laurentiu.palcu@oss.nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: FR2P281CA0074.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9a::16) To AS4PR04MB9576.eurprd04.prod.outlook.com
 (2603:10a6:20b:4fe::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS4PR04MB9576:EE_|DBBPR04MB7820:EE_
X-MS-Office365-Filtering-Correlation-Id: f862405f-9ff6-41a6-b841-08ddc440f61d
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|19092799006; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WCQxdJ+dh1B319TYuI26otIiIvBefJIXrVxfQBcGAcrrlXUX/RhY/0QFJx7r?=
 =?us-ascii?Q?61EWwGw3OwT75Qq3nE5HkcMsa4nSJjA9PiksO+qQizt8bhMb0UxPzuTyUTj6?=
 =?us-ascii?Q?MBd0yvbafrIg1Gs1iFLEAiDgI5vP0P/A/SZ/XywRffXuvUGCZdjJkjVDFP/1?=
 =?us-ascii?Q?k/6uSNxoxuSOdAS7t0MPE5WQgQAWBfq1z4lYOj9wlucM42jgbg+UW9/P/3Bx?=
 =?us-ascii?Q?iykCzo38B3trgZNrtd2VR2LFJBGnKsF326YCZBMESHj/nUpvu3/nz3kkGYHM?=
 =?us-ascii?Q?bBqsGXh/1W/Wa4TRhQSp6uUKPyMSb8KiQFrEwvCtPkkbf1K84HbF+XPAlkvV?=
 =?us-ascii?Q?yPZwqKLm0IkkIOmlPy4dMlsYPCZfikQKFyyrHjIetji5UXm5Eq2xAzQOsg9J?=
 =?us-ascii?Q?MDXzMtFojU+utjNjmAslUX5fS8W8e8i1FUB0DnSrAovVipLWmeisakqgVGJ9?=
 =?us-ascii?Q?8Xdksxgy55Jz/qgTeyRlQ1RzF4kKbJguh8GUzHCmUV40JGNJgyEso2th0RXT?=
 =?us-ascii?Q?y8mRnhr5xxbxQ4fh9fT7uhTb+x34VLJBKJIMNIxryoH9nB5YzfqHAe6A6XwS?=
 =?us-ascii?Q?qF9ug1L8ZuV7MinIc0LzHIeInlzJVejAViVn46S0D1GHFf02s019z7KMa91H?=
 =?us-ascii?Q?wHP95RCLpoYztxpXq/5fKFqsIOMMlSAvk/vBOzjVllRHLasURC34VLfJhK6J?=
 =?us-ascii?Q?4N0Qrayu+kipK/03N3lHJQWjzuBRC2R9X0eh1vOFqCCY9KhcEA3w/UFWguvh?=
 =?us-ascii?Q?UwRA9jH+s6eRLSoufSkCto7YHf64yqktWf/SqLwelcUSTZeJiT0291FieMvu?=
 =?us-ascii?Q?iDJQvLAJ4MW5Wko0GesbO3TXsvICEt2qqvNhI3e6dnWdp7cF37PHfvYswKIV?=
 =?us-ascii?Q?aB+8sd8xIEsEN8Q4BgGvUWXKTwGmIXZ4QxlqIMeqozV72LzXTtFSjSAw4MgZ?=
 =?us-ascii?Q?Sb72NZf0OgYDhg+2zIkErGJ+7AZ32+gwo5sb8VY/pKeL8yQ5VjQMPU4YIJ3t?=
 =?us-ascii?Q?vzV1ab+UQDdqyqnQWbwO/RbQpP+maerezTj1mvOhuj4Kq02SRnUldg8Z37pT?=
 =?us-ascii?Q?FsAJVYPKs/0D//bZkKmkEQMUT1wwqnq2i5PWiG1hQjODCNPtE1absTTxKBTG?=
 =?us-ascii?Q?jLCcUobgaKSkoxIHObvKt24erqWr8TSozy+9bG63BgejlTyPYQ3gQ8SZa1e+?=
 =?us-ascii?Q?vHjpaCIQuXn+rIwdWC8MMUGQEBlUFhnUCcMdehdLuIf2GYtS4doeetCLGqbm?=
 =?us-ascii?Q?aYpJnHnEENdxi6FC1E0C9DGyYG9TKJ3RQg4P9I+5MClQXK8L5YABwONovzp5?=
 =?us-ascii?Q?fXoTqqvnGG/oWdWI7RE8eIhXq4upAmZdFP1XS8/lHor2cTGlUE+TkwvlQnl8?=
 =?us-ascii?Q?f8RZspeds90L2IJxDgUCjIhbmPm3VSFc130Ce1wJNj+7JivYZ4+jB5h1ilgX?=
 =?us-ascii?Q?sagfp+8qpnM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:AS4PR04MB9576.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(19092799006); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cdwdD1Gzy2aMdChewzsDq5NO8r+hLMPJ64m1BO/o+dE+JwZcCs1AUnrI0sWQ?=
 =?us-ascii?Q?mg/T94fFmKFuBu5+sxKCishkv4Q6srE3esPhjZiHXx+YAvnAE3zZ3mHpaQGa?=
 =?us-ascii?Q?2qYpy/1kbmEYLTT7zZ5acU1JeEhw0ZC6OeTOzsy29SUog7nbXVdvYQMNcWKI?=
 =?us-ascii?Q?tePMAbe5wYDPPMtoNOj+UC4aTtJLGaxt6fCVWkPU5BfIei6TZCGtB87wNSfC?=
 =?us-ascii?Q?B736l1U7GtsSx9M6jM3ClM63PGXq9dM5tXA6cTuFkzrNUCVU47tEsSp3dVNx?=
 =?us-ascii?Q?SsR90pwBsI+qPVMFRbX5HxZXbaiLQqED7Wt5OaT+4mMqpcjt2oFb2BFbtqc8?=
 =?us-ascii?Q?PN88CuxP5stGfGGvqdG1Ak2m1YpCyqnWvENCYKEgnXjcJM9U5Zh4DpN6XY7h?=
 =?us-ascii?Q?w89z8kAiXyfeFZp5UYIVxCTaGe0+aGnd+CYebNFyIuxQYjX0TaCFvJfTg670?=
 =?us-ascii?Q?NQLbhAIROWZ3AlnJJYs+RxylTukMfkVMvIUT6TNfIoSAnlSXuRcpXtBVqdkY?=
 =?us-ascii?Q?cqMDIydD1FKr3UebKwDYKvVPEo+2ASQlAFJ8FkNwCq40DXS0SZU5PoSzsp8J?=
 =?us-ascii?Q?uz8eQNsGCifpoPVrYhQ+CLqazGtWYDFm8OsPrjkJdHju/8WsCszCOnCj7BHg?=
 =?us-ascii?Q?RvpmxX0bi06MxT0ETNNSEtR9A03ovtYnJkkClMOLJFEv/nAmoDVOckdZ52+F?=
 =?us-ascii?Q?cK9U/TymH/cFjHznvmwphVJF2+dYw5IwlrVg9iT+KhrFyJZr6dXHgK7Qzjqm?=
 =?us-ascii?Q?Rkmh+3bJoF4iM8/mIi/byfVbOi5Okul0t54aBTZj+yvbFuBlO+mx4czvXplP?=
 =?us-ascii?Q?EOtE4tvnNpInkFY2ugA8vMcrxQf7qF4bXcbNUhTH1Cjw2a/Ze52zlW63l9A8?=
 =?us-ascii?Q?9w6UVrCFN3ar/Trx/EpDEDkhNFKBBrETRzOTKZobA4/4km9WLfXn4aNcCuAQ?=
 =?us-ascii?Q?/y1md4b5BnaA1WCyDLw5q8eXHsqcg+Zr+FUVwYnH78fzpzREdj1SJKk3Pb56?=
 =?us-ascii?Q?kIqVjr7PeIgZcDS9SfRt/s7N9mOBChViuEFdFFaTSaBMDY3PzI3lHANwha4b?=
 =?us-ascii?Q?0yLbRBX6bAryz1flk9qvEU/lZ7IJesrY38aWo1k9vSPqzJCrgk34oFDZ5Nzn?=
 =?us-ascii?Q?GNXn0RxJxhoWwVnUamg+NuFf2Xv3VEOIsD6h7PxKwsY48cc8J/GznTOmV4q0?=
 =?us-ascii?Q?fHcpENSMjm3BlvcEBvmJ8XR1N6/YXOVaczyXgzL+9o6b+z5jppGlZP4R7B6V?=
 =?us-ascii?Q?pTJt7+w9IxollfIXQSjR/En/NkTj3pkuSSV1v6Rj0JU+Ql01DWPBgV0o1H0Y?=
 =?us-ascii?Q?XGMtrlme1wohqVEmO9jnzrzBQA8scj/dr4KfsAFAcBAjsx43TvNAKE6/VnmV?=
 =?us-ascii?Q?bbpYO9m0SqfVSh4UKmIkwQ1rHBlD3L2/zhxgwRjReOdGj5PN56Eon9klEhOZ?=
 =?us-ascii?Q?FullHZiwEUbZyV8Zt6Nq5iJKxzFE66LTg+rzxxw4f7youwVCKd2CsyPRVcXc?=
 =?us-ascii?Q?8Ci7CuKtjAeNUZ1Pu+rokBnMZjBEw8g9rRS9LLF3FjmZ4Dmdl4mZA9cg+zFC?=
 =?us-ascii?Q?SNzNdwD5jAt4WLywzYXnk22DFGe3f5womNPHMpBFDxr1sEiXYzdcv0d+aD5B?=
 =?us-ascii?Q?bQ=3D=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f862405f-9ff6-41a6-b841-08ddc440f61d
X-MS-Exchange-CrossTenant-AuthSource: AS4PR04MB9576.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2025 08:15:44.4177 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RhioZpyyoXmpFmXUu+HmOLqhrR4Ql0kZrDzlATN2PN12+PAD3izB1ATp6sorWUs6ejXy+ke3RPGT73nENunYWQ==
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

Currently, besides probe(), the platform data is read in both suspend()
and resume(). Let's avoid this by making pdata a member of imx95_blk_ctl
structure.

Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 drivers/clk/imx/clk-imx95-blk-ctl.c | 36 +++++++++++------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/clk/imx/clk-imx95-blk-ctl.c b/drivers/clk/imx/clk-imx95-blk-ctl.c
index 7e88877a62451..c72debaf3a60b 100644
--- a/drivers/clk/imx/clk-imx95-blk-ctl.c
+++ b/drivers/clk/imx/clk-imx95-blk-ctl.c
@@ -36,6 +36,7 @@ struct imx95_blk_ctl {
 	void __iomem *base;
 	/* clock gate register */
 	u32 clk_reg_restore;
+	const struct imx95_blk_ctl_dev_data *pdata;
 };
 
 struct imx95_blk_ctl_clk_dev_data {
@@ -349,7 +350,6 @@ static const struct imx95_blk_ctl_dev_data imx94_dispmix_csr_dev_data = {
 static int imx95_bc_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	const struct imx95_blk_ctl_dev_data *bc_data;
 	struct imx95_blk_ctl *bc;
 	struct clk_hw_onecell_data *clk_hw_data;
 	struct clk_hw **hws;
@@ -379,25 +379,25 @@ static int imx95_bc_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
+	bc->pdata = of_device_get_match_data(dev);
+	if (!bc->pdata)
 		return devm_of_platform_populate(dev);
 
-	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc_data->num_clks),
+	clk_hw_data = devm_kzalloc(dev, struct_size(clk_hw_data, hws, bc->pdata->num_clks),
 				   GFP_KERNEL);
 	if (!clk_hw_data)
 		return -ENOMEM;
 
-	if (bc_data->rpm_enabled) {
+	if (bc->pdata->rpm_enabled) {
 		devm_pm_runtime_enable(&pdev->dev);
 		pm_runtime_resume_and_get(&pdev->dev);
 	}
 
-	clk_hw_data->num = bc_data->num_clks;
+	clk_hw_data->num = bc->pdata->num_clks;
 	hws = clk_hw_data->hws;
 
-	for (i = 0; i < bc_data->num_clks; i++) {
-		const struct imx95_blk_ctl_clk_dev_data *data = &bc_data->clk_dev_data[i];
+	for (i = 0; i < bc->pdata->num_clks; i++) {
+		const struct imx95_blk_ctl_clk_dev_data *data = &bc->pdata->clk_dev_data[i];
 		void __iomem *reg = base + data->reg;
 
 		if (data->type == CLK_MUX) {
@@ -439,7 +439,7 @@ static int imx95_bc_probe(struct platform_device *pdev)
 	return 0;
 
 cleanup:
-	for (i = 0; i < bc_data->num_clks; i++) {
+	for (i = 0; i < bc->pdata->num_clks; i++) {
 		if (IS_ERR_OR_NULL(hws[i]))
 			continue;
 		clk_hw_unregister(hws[i]);
@@ -469,14 +469,9 @@ static int imx95_bc_runtime_resume(struct device *dev)
 static int imx95_bc_suspend(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	const struct imx95_blk_ctl_dev_data *bc_data;
 	int ret;
 
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
-		return 0;
-
-	if (bc_data->rpm_enabled) {
+	if (bc->pdata->rpm_enabled) {
 		ret = pm_runtime_get_sync(bc->dev);
 		if (ret < 0) {
 			pm_runtime_put_noidle(bc->dev);
@@ -484,7 +479,7 @@ static int imx95_bc_suspend(struct device *dev)
 		}
 	}
 
-	bc->clk_reg_restore = readl(bc->base + bc_data->clk_reg_offset);
+	bc->clk_reg_restore = readl(bc->base + bc->pdata->clk_reg_offset);
 
 	return 0;
 }
@@ -492,15 +487,10 @@ static int imx95_bc_suspend(struct device *dev)
 static int imx95_bc_resume(struct device *dev)
 {
 	struct imx95_blk_ctl *bc = dev_get_drvdata(dev);
-	const struct imx95_blk_ctl_dev_data *bc_data;
-
-	bc_data = of_device_get_match_data(dev);
-	if (!bc_data)
-		return 0;
 
-	writel(bc->clk_reg_restore, bc->base + bc_data->clk_reg_offset);
+	writel(bc->clk_reg_restore, bc->base + bc->pdata->clk_reg_offset);
 
-	if (bc_data->rpm_enabled)
+	if (bc->pdata->rpm_enabled)
 		pm_runtime_put(bc->dev);
 
 	return 0;
-- 
2.34.1

