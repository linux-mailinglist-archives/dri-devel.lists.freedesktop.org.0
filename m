Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A59B74AE7E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D44F510E557;
	Fri,  7 Jul 2023 10:06:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2070d.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::70d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3043D10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K+IAqfpygwTyejVG/xWVCMSPg/hB9Ja4jSoYgLMf6W3dJ6ilgEBf3f/ox7uNE8XC/sohoiLB6/q385BXicxbiMvWDZ65pjs7RRYA5RzQXwkO7ERSr4HHtIS3lN6yrhZXo9bFWcufiIKVhlG+d9vSXQWopYvN9qpnD/pyq2QRxW4B+73/ZyiQE5/wYRyqTULEBk/mRdxhbgCq1U+3k8BqmCKtxOPFV7oegvxFG/SH3eAzbbe0zR6zsaFnZlepjR92RF0nQKdpFXpbnB1TJKb27iRnGV4Ni2kWNqi6s0V2ebyNBoRkDqM14MmzNQ38JnXWsZrI/RgkjLCem/jQGTWD4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nEl3Vs5H/lT+04CKc95r4c0yu8RtZ5y+LJcwuewX1o8=;
 b=QevF/v7qQyRdkIqLnNOSOYGvcWYTqekvGzH5JxSOZZIKfmf4L38DquWzS+fQknbP2S6hXxLGE/uluAqIFP8TESOrqDb0rkC5tH1tAgsfwiFg9/KSpJ9y/nNx4rfwCNUIsWWYD1DI66Ropa+FSU/3+6Rjo31cMSAgFxvGqTzxFWKLaYt2e8yd2Cv2wBlWGjsMWrrDWEuSFS7jWmgsTB76ov2fcff7fPAJ7iHN4YUF/b6SWxvopjQXIzoo/QuoCO8CshOwh8g5anksuL3RVwpEDBM3Izld/+ODddggZNe2qXltLnDbea/f2Eq6PeFzOVV7EFYCDktLXyLMRWzgmDC71g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nEl3Vs5H/lT+04CKc95r4c0yu8RtZ5y+LJcwuewX1o8=;
 b=m36uZp3kG58OjWtQe4OewyqJBbiWRxnZbxS5z6HtKDq1f1hXeSmGs9u1ZrKInuUPx/Az1JjTrqkG/wpZZ3opkf/HjZLLfHZMdY/HPZM3lyPEz4htkdBgfQ0itQMGLJqPDAaq8h3H+pLwt0m+NlTpfN7p536MMN89WDgy1TrWjEMNO3bWIjAcf/GgClZ3Arbl7zviW7tn43fDIX2nkJgazVr1Kv7s0StLQL303KqZEC/FuR0PXBQ1D3Ph+ooux4ujTYmeB1knzpQFGX6gb1PVLY+UkF3qUPohVCSs9g3SBnVxIKezqnK8XPY1zKDhP8Vl8TL7HvADQ8gCJCnj9LgAfQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:01 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:01 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 08/18] gpu: ipu-v3: prg: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:24 +0800
Message-Id: <20230707072034.48977-8-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230707072034.48977-1-frank.li@vivo.com>
References: <20230707072034.48977-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SG2PR01CA0129.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::33) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB5342:EE_
X-MS-Office365-Filtering-Correlation-Id: 94f65122-0ed1-45f3-8d69-08db7ebab790
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: I0G58zR99uIa5qqTjvCowrPPYzNRPjfUNjd4+WflhobyNcxtQTe47YJ5mpWE34NuWNcdBbv2wLabdvoyrBUjqCXHUFMSXH1AT8BgZrD+QBod4okDmCAAUWkmss9pyHKXTxgVZST0w4SNomjAcl0dXHHiS2U8oadEI6wT6ArIYXqswxn1hjgV2iFF2VeeDxY1TGz9OPsekhtd/mrCMDziltMeQlsU2T+EVk6zodYrMh+s4ttVq4NfNktVsiStZCh+f3eMdGoZPgG1yEGAckXHmZTEfBUGNVthwzO69XDnNbNMSDkGwo9gV82ZwoBRPZrV2go1FiXRZ/R7VbajlBc8ipnzhq9xdb54rFx3zaBYnwt3wc0dFx0yVnYMQv2+pnEIcxkh3TdpI2LpFeq3qbVkN6Q8FGWMunXYaUkI3IWpAcpE6iKcqpIWbOb+9Hmstn3s6p+hfTKLln6mbc2rv5toQLH7WfWEMvL3cOfW1YpBagpMFYBzdoYrwsjtkjiHn4dTm9ajPZkf9g/Swlyaz1Ve+q383My5cDxb6ExGQFcFabhSono4b7lIqS/1PnE24qpbGtuy2FTDkGKmt5XWH5JE+RBZoG+OIhV73LZWaAq5inIkO7r3GtOXqg4JUGTv/vfq
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?m8qcpvmorlYuvQuHkCcYlbGYgTRLarb/t8MO7CjSGmNCau/kRAWpOfdnNqV0?=
 =?us-ascii?Q?TxkSx9P+LNkk/VjkZFbliuAdKh6SWVKC7jG6tRTjesh43f53uhJfJ4BEcha9?=
 =?us-ascii?Q?txnGf5VN+THaZi3KtMe2QPAZzTvMgEYfYTU1CT71yKynky8pf8rRguodUbLr?=
 =?us-ascii?Q?wtbaeQiqrRPpnCC3Ma43yB+PmIHYgqMbyJapsiFQexsJE8ZqTLuMk2RUonhN?=
 =?us-ascii?Q?TPI3H1NJf1aVYRYMih4vAq4pwOGugMTidHISrgp5Ah6uav0vPB8uI9d4tVJv?=
 =?us-ascii?Q?es0WRSA6qOzaVul8iGjLbrwzwvFDj7hGZnTcQdaYc3Q3A2Hl3ES1iRA3SpnH?=
 =?us-ascii?Q?r/KIb2DXfbQ+kTUS3xyP8DjHi9Gcj328tAKJjA4zzMrWTalc5xsipixACYDI?=
 =?us-ascii?Q?YwwVt4hwJhBuZJF/mCfsplQnzIfN33BoT2S6VG91YhywNiF8Y8SRKkR23sOf?=
 =?us-ascii?Q?2q2+7O3oWm27LwNgqcn+utGxD3wzqa1oVr5Ct9nfn0uEj9LRzJENAWVmWuj4?=
 =?us-ascii?Q?wvUZ+QK6OLsi2u4G5qzy8NTySdkK3LXZI8cYoK0Ssu1DklMZ5oFXD0SeXhkB?=
 =?us-ascii?Q?cu1BOT/UzPvRFfDIMXjmbK1brFaezHtW7W6gdKjFvS3j0GeZW/6cWnk6IAmy?=
 =?us-ascii?Q?8LKTstBt9YJLG2B/JYw3Ue4TBPNUtjq3scBNPVR7uy9pAxDjR76qtJhKKD3z?=
 =?us-ascii?Q?VA7CKS5DOfce1qW/P1rq2REu9jbd7iSfOoq1385vykq7kOhJ6mTmhkeWYT2q?=
 =?us-ascii?Q?bVoXo1moJh/hj/NObYBS5bx6Foe2pzJMqdYafx1I0PGywdt9Xv5yNQGpJtnc?=
 =?us-ascii?Q?LAuNq8nrvTboVkUvMBkmWrWng/Qq25AL29KNqhQ0uVfGqKkEsmRyBNvClH/d?=
 =?us-ascii?Q?BDN9EbsXgU1vYskOk16/6lpmGRcBatdJ1l3IifUUmGc+eD3aVI28N/SoBBng?=
 =?us-ascii?Q?WKcsls7LckNnygPjEIA+rgIYhqxcRqFjO0wojuUL/NWLLfNyv3kRbUTSVUZA?=
 =?us-ascii?Q?0mBj4iOhT72ySYHVLPYckeq2IfsXz4XuXKnJCOgrZ+kpuDYvNNolnnn/ZT8p?=
 =?us-ascii?Q?zBrb2cMPWqm78RUc8PvD0RgTrs8bgaQG9uyvJFCHBt87YAkta7RXXkuQ2bhE?=
 =?us-ascii?Q?TeZGmtGxtm+DD0mK7juIP3+06CJDBZLIWfid2ikLcJGoXGhnbF3d5M6Wk4G2?=
 =?us-ascii?Q?ZczdhE2gIE3h/RUa9G8vXoTCbCw6PG80NseJcap2fNzrHmuMG0USRCfBpUYj?=
 =?us-ascii?Q?MVH364LpOePyspAOaFrXDgd1FZf6Fc0k0fu95MXfRCNpy+kZ3L2zoJP9LFY4?=
 =?us-ascii?Q?5WK5KzxEtYShHiJVbi9xEFCFJGGdU3nA8Hgwhp+x6fA5G0WvoT+fQ8FyxX6Y?=
 =?us-ascii?Q?6/+uIXwPbF7YK42uTliShxrOEkwbzTKADje+LxppwL/Q5W6qTNBX7e58JprD?=
 =?us-ascii?Q?jvp9/9iTbNerfZfGqtXIXYI7w7PMPm2JFgjS3tMqt9ySFZ/J4dIFzAV0zd4j?=
 =?us-ascii?Q?4d1SYqB0Kgs6Gu3czVXse0qxfZuE2u1QCKmHrd42JAZ7MutE1GjhWkLhMa++?=
 =?us-ascii?Q?7jujXkSfWmFGN5hRjCMDDkO4SR4m/FoW0uwQ7XXK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94f65122-0ed1-45f3-8d69-08db7ebab790
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:01.3872 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HzQrotGqxkUKVKsnlJ9jZ/mmPDTyjarBI77U0e9+KeUgJricGTseNxuNIus05uXW7PyiEtmIAIBJKEouLiRB3Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5342
X-Mailman-Approved-At: Fri, 07 Jul 2023 10:06:28 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/ipu-v3/ipu-prg.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-prg.c b/drivers/gpu/ipu-v3/ipu-prg.c
index 196797c1b4b3..729605709955 100644
--- a/drivers/gpu/ipu-v3/ipu-prg.c
+++ b/drivers/gpu/ipu-v3/ipu-prg.c
@@ -358,7 +358,6 @@ EXPORT_SYMBOL_GPL(ipu_prg_channel_configure_pending);
 static int ipu_prg_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct resource *res;
 	struct ipu_prg *prg;
 	u32 val;
 	int i, ret;
@@ -367,12 +366,10 @@ static int ipu_prg_probe(struct platform_device *pdev)
 	if (!prg)
 		return -ENOMEM;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	prg->regs = devm_ioremap_resource(&pdev->dev, res);
+	prg->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(prg->regs))
 		return PTR_ERR(prg->regs);
 
-
 	prg->clk_ipg = devm_clk_get(dev, "ipg");
 	if (IS_ERR(prg->clk_ipg))
 		return PTR_ERR(prg->clk_ipg);
-- 
2.39.0

