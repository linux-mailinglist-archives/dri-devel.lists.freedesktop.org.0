Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62774AE81
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:07:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA7C10E55D;
	Fri,  7 Jul 2023 10:06:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20731.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::731])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6240E10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzkWJLnnX6IE89idvaSnKfMGcuI4QpSmEF1PqgPkTK99ljL2mI64VNN1RLKzZLHROtJzbhnROZZSux21ewoEl2qOp2KFlVKFqq0nxnfHBqzsdmgrRS01UkmAJYIB83GjVDsD1E0+4N64VhZcoRAbFjMpg4gU8FikVeKIAw5e4VvLhV13O96RELgf3xvUv0MlB7xnN3PoAiCrzGhLBpmTMdFSJ0PvnXChcyjlp6drVlhEoaJY4bbphqQz/2j2Oy2sSVEGP7IokAOHAAWvStUZN6ZagDeF3qKypnCnlG1K2rmn7g9LQ3d2z/+opCzTrzzREiu6lPhJ4MLG36+rXt0syg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=449EzXD50MDqlapJVYQHXZbZyaDsBh6tefDqbEGmmWg=;
 b=kRjnAEQtAhpIkFacpXCF2Moqa4vJEDwsjchp28dbbVUNP5snH9Jf86VGMOJVPNpBtcoFRckOwl5w/86kMxylSxI6dC8r1Ro156h0lFt9+/86HMk1Cld/gVhk9t+aIp8GzFtJDk6qdwKi+5+2G5+wWNvIFGhapSkSa/z+DIqlIoFIw6ptl6iZDAfkJfWlrH83yP2zlkG1JP0NeIhmZ94U5qm+ZtIxgGeX9iXeXOKy8m1qIdU+EhboLR7zjCfSfsiokyzLawvqHHrNVO7iYG+3lKmTcRaj/uOHqV1ooXT+fKfs1OB+on13yE4UTqHVloAmftOuzDcK6LLXDpyAu8S9Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=449EzXD50MDqlapJVYQHXZbZyaDsBh6tefDqbEGmmWg=;
 b=POJapzSII1NIVMXqqx4KPsOKZWkr7Nbq8aGqukRaQ41U73p5YUvVLMsDSUD8jOkhkr09dMrpeIoBcgB4fvWhnJOoyabbITYvlxzFZgnByJP0RuEWBI5hbdDLuKiwT5v+2tzLS0vHM0lvcIR/LpI+KmqdTJ1DGpxo6EwiGoOoXO3cUhpP1Nd6HuIkZQ94za0iTZvv1EvvvT9UaL/gYMZeAn+754VpPNhpb6mDZJSSDsISRDYT611F/u+XVMFbqWPKyWbEi+GHR/Sbl1PS5mLm5N2RPx6FR8ubBgkaLrzaLmXLkSlYQCSQ3VM+YnTrft/yIL8ND5loraLAktM74rRh4g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB5342.apcprd06.prod.outlook.com (2603:1096:101:7e::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:18 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:18 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 12/18] drm/tegra: dpaux: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:28 +0800
Message-Id: <20230707072034.48977-12-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: a36ee63b-f772-4493-4c5a-08db7ebac18e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sqQqkG4FSCgluNNJB9/b6vBvdGYv06sEb3jywUWSksApu7o4w9PpujC7AP1k6wcr3KWa5IeJqscxipEtDL6IFwVnJ866Qa/Q84c3OkoEA1yasxCturIr4I9bn6+93AjNFg3nss1XEhh4a97wowqKlWcJ3KM6htlt9qQW3HvPu7zFV0yL0uB0Uaeile9XFp4OPOSTqaSNUox/3SNiORDDHoOtjFDxK70qa+EUbTKUN9W4FvE3fu0IuLXzYhKpHz8sTQtxF0etoE4GkKsfN8qOTtjFateZJW2WK9rIWTW4Db+5jJ+GlaMWsb5LN/haV1IwTUyyOkO3E4ajCz0F6zsWLASEBN+b8ZKQm0FmpfRZTLDpdaoFqdGYPaYHHmCgSoGF7QpCuzR3gr/UElzOZLhhO2r5KHYjdj5wLN2W2Y6Wnb+ek+WIQzpJvAdCcy1toHsUHi5oJAqhDy1QkKV+ykAhuZpM+RNhtqk32zeWi5Y3cDY+7dQDg+dhbREcLTILI4R2O9XSs5QPtxN91YiimQr8w5tMxQc0AmjU+Z4ufkFz+sdxSfgo71GG9uWTCvmf+agB5Rw7yDBmgEgQrG4dVbTb/Hf1VBeVM+Uu7ucitcAcdIx18Z63tH+XDch5wtKT3ezV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(366004)(136003)(396003)(346002)(451199021)(41300700001)(5660300002)(110136005)(6486002)(316002)(2906002)(8676002)(8936002)(66476007)(66556008)(66946007)(36756003)(6512007)(478600001)(38350700002)(186003)(86362001)(2616005)(38100700002)(4326008)(83380400001)(6506007)(1076003)(26005)(52116002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ChQCMjE7rJYrf4S/bi6DMYZAoIPIiiZNlApAlK/CQzyiv0eO/+VKdXuxBtAi?=
 =?us-ascii?Q?BNtXntlQWwvWnHoEEWagomJRFNJJJGsf7WGGgLbV9LS08osuImgcfX+rSwtk?=
 =?us-ascii?Q?cMwHQoaWn64uMnX/dOyzOzHvwpQ8h6+f/ugypKAQq6cTahDNa6yJxJp7litm?=
 =?us-ascii?Q?Ks1LwUySMejDNkutN3YEcQcOtMPPW/VzOdjLNpuodebcVZEoegjY0Xx3+Wp5?=
 =?us-ascii?Q?iL8KP0DDUEj3iwkQrvEn+3NHcYW8Kb/CSk7fbCWQ8+X0OuzMXH5dmMtxCQzv?=
 =?us-ascii?Q?0xibduHTvVT2FYIvr11KXDS2Rje9l76oqNFZH5exnZp+pWt9cTVNGglI9C29?=
 =?us-ascii?Q?leyNxPfEd3O+PwEM/BId57Sz6DxheNGMHggyRD7Nyxt9Hl7EpmtJrSAsXHGF?=
 =?us-ascii?Q?tSX/Tc+3YyO3mEbpJ47ju/0zIjuDMoajAQC4IbbcaBqXTj7J24ORHzBaTTWd?=
 =?us-ascii?Q?0MxWvMtaq0zPzpAUSnGeoIEWy9S+hyPECNhiEXWjyyJMy0Lh2J7ynlpTEpg6?=
 =?us-ascii?Q?IfzodEd4n9J21IWZORDylc/Np4vLkk2YT4LXtWexG3cHRfGlwnawUNh/DIlz?=
 =?us-ascii?Q?2kyHerB4VGNeYATJUyMnQiQqjUlyl8l9e26paUXM1gvBglWF3kFxM4y8mB17?=
 =?us-ascii?Q?ju+uXsXurZp2lbz+AflYw0ipNcUdtXHvjoXvAaBN4hVINQeb4cMFHRalXue6?=
 =?us-ascii?Q?YlHJjIGt9/PEmmsmRXX6xf4ix6eqAARQmlZtvavqEAMEhSKWhnOqYlcBWAO3?=
 =?us-ascii?Q?VDRudfoiC8KyKAtdgQpPRV8VrjSg/ReRa4IZGqhRJjfYvtXc3SEJoeeJNxAP?=
 =?us-ascii?Q?EdEL4YXLlLmY9e0R8G9k9LRlDHaVGizaXTKBVAy6stp46JU3wXfQBJFINuxH?=
 =?us-ascii?Q?wtiVw6VdITKZokD4CaYigHFldsMwWc951vbLxXib5jlrItODJ/rB3sYD3xQ9?=
 =?us-ascii?Q?xLs7XHNra/NNGveOyNXOBSp/m+NEVWbtJgNjPz2XbXeNVBLVTnIIiM1xDgMO?=
 =?us-ascii?Q?tu+7UlfjWDNOGFI8nNXOVYlFK/nZKZKy8+RqoUeMtTnSyw1eoPAxvkiJE9Ev?=
 =?us-ascii?Q?Zp/r3wzjjJ3fOUOqfomFPZmMmqBK4xfyg441xDxHozfRqKCoIGp6nZfDOeza?=
 =?us-ascii?Q?w+b8iwXiIYcFSXyMEhnJRQiRjzWNqMJHlIepOU9qABOBPslrvyiQUuQowiye?=
 =?us-ascii?Q?H7+aFJKekiXoSqzUl1GbbLs6qJM9yE2y1yJegJ0kMn0bFqqT+4UUy9pIzJHO?=
 =?us-ascii?Q?Z22FemFP+BuWKvCCiv5KuOyoY54yRPSNZ+UvfY/EiTghwtYFOUIhTdU5AwhI?=
 =?us-ascii?Q?lUNHwhfyUrwQRcXCl7sYJDBBoKLw9nhIM5LCi0MywnDi2j814KoQ/cdSB46v?=
 =?us-ascii?Q?AaWi+YZCBZ4asKFFNopOfmjzT2/CvuL0WZ6gmcJ//5i76lhIXKkNxaglMB1B?=
 =?us-ascii?Q?X0OGhopc2g3FyjvZZqkDAIZLXDtuJ9eE4cCIxhfBsGCU+tOqcUzR5vborFd7?=
 =?us-ascii?Q?pEbUyONyYlic2vX/AuqScSLEzPwAPA7cgyv2O6MnbP2QzHjwRtO1YkpvZTMf?=
 =?us-ascii?Q?J1+AYCq1HhoUMfCx10Wumizv0mOIoUAZGyGQZ8yB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a36ee63b-f772-4493-4c5a-08db7ebac18e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:18.1757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AA0WdiQfesJnkJ1MksVfrdi6927HgcEsyu3HtNMU6jNAD86HlQT1ZSMWd0Rew4hMV/AGKQepsPtd4sJuUI5CQg==
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
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/tegra/dpaux.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dpaux.c b/drivers/gpu/drm/tegra/dpaux.c
index 4d2677dcd831..f120897ce4b3 100644
--- a/drivers/gpu/drm/tegra/dpaux.c
+++ b/drivers/gpu/drm/tegra/dpaux.c
@@ -447,7 +447,6 @@ static const struct pinmux_ops tegra_dpaux_pinmux_ops = {
 static int tegra_dpaux_probe(struct platform_device *pdev)
 {
 	struct tegra_dpaux *dpaux;
-	struct resource *regs;
 	u32 value;
 	int err;
 
@@ -461,14 +460,13 @@ static int tegra_dpaux_probe(struct platform_device *pdev)
 	INIT_LIST_HEAD(&dpaux->list);
 	dpaux->dev = &pdev->dev;
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dpaux->regs = devm_ioremap_resource(&pdev->dev, regs);
+	dpaux->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dpaux->regs))
 		return PTR_ERR(dpaux->regs);
 
 	dpaux->irq = platform_get_irq(pdev, 0);
 	if (dpaux->irq < 0)
-		return -ENXIO;
+		return dpaux->irq;
 
 	if (!pdev->dev.pm_domain) {
 		dpaux->rst = devm_reset_control_get(&pdev->dev, "dpaux");
-- 
2.39.0

