Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED14574AE70
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7E2E310E545;
	Fri,  7 Jul 2023 10:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20713.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::713])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913FD10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mEFF59vhho6A4E64kYcLeSoZM0hzBVM3g7uGzXbsUAgRdcXkkYRofMbf/lrazDQTsdFZBHKWXbry9AMNpa3IeA0Vr1cAbaFAQtnVjFpMqY3dorgSX4QRhUmB0dHd6z8HJfF6lBLgueqFarB4ZVZh/mtHBCXsL9W4ef/urw3h3g70Echj0SSrw5IzN1Aog0eVTL5taRnUIHlXZ14HiTq0Xlbg1n81Clva83afeZlEsy9m8SATKz7nGUX2QzBPCJ4qMD+QnUi5+UtgTgi/rN3fxEZ9LPmBjcOEEq3zDlsgw7UF8Pk/t6tBiXwSV6j98tsSg69myDhGrC2fzaJd6zxIcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lPI3daS+UM0ggiLDXQPd3BbYxuHM1WOWXBknGZQuNk=;
 b=R7lmUqGgvb9JBphAMtTmogAn+ncKeyc9N2Lj1+AuKcrKMCS4tdm6s59F2YiludBu6OhsUxAFXgb4uHG+jB7PPKyWjIr0d3ClfXqchHutTxnS2VCS+RSRfmGGyKpZqoUDVefo+aaVHmXKyiXUVjF5ZCLVVsLSg9Xiss8onofndWJtS7HLAy4iaLQZl0WgFW05qDmXDQbg4+rUZazvXAkUQZow+Ve8WVH4NDjX4wIAbU/hu/tDOgBigMopFviGG5Wt5B99q+hR9pBKU8zxPddqUlpKvhalWiK/5m18IlcAc3LnwGQSe2pv3O47N627PB/HNHeanXz3DT7zlL5Uy4UzGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lPI3daS+UM0ggiLDXQPd3BbYxuHM1WOWXBknGZQuNk=;
 b=mFKVO85Is7y+wu7ax9XevM8opExFtWFcd8gVerpPWKzNmguXrzI0+EUjMSpRzkeS3U2XRXpGjXJIpExiwhHPEzbzv9gz4JweWm28dxVaNlbNH8Ivr+oR5HW8jCwPMlrhjS1ubMfwEcYKvstYAID54/LzoXcPZ7zDK6CaapbUe4jOBQTGbFDW9VK6vkvEVSTlkwHXYSt7YXeRHruHClwGwQS0D7dWAcoAe9Gb73wNmYevsy32wRNc26XYjcshaHqP7ax7ibEiQ/CqWrVbZ4xo4PzBFlsx/LjpGPWsXxONO9N8OeUnV1Z86pCmggO0inLQg3Py1Kvhyk/qfOHt9kGaPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3954.apcprd06.prod.outlook.com (2603:1096:820:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:32 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH 15/18] drm/tegra: sor: Convert to
 devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:31 +0800
Message-Id: <20230707072034.48977-15-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB3954:EE_
X-MS-Office365-Filtering-Correlation-Id: 1516ac7c-f56a-407b-f5ee-08db7ebac9fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: U+WgG+oP9X+3L5uL3FEjRzC3gPfUm1qVavcGALaJA+OwCB6SmAWJci5zA7+gdXmPOCJVGwY3ECS+FhOW0auHVKLraZYwnEguYv8zXd+i0UbFNCmw6UjT572uWZECwYFQIP2KvHSAbNm6rG7TYnGfdpOsDOie+tRcuqCT3wf3EE+/oe8y1ySdhDINwpYR70jfZrUyy/rKB2LI59jFZKQCj/E6MWAeugSgMBz52M1JdoGPDV8WFYh5VHFE1SASqu1p2AcrUqNH1EblQ2uq+L2VOGlqjXOXzA5323V3zcxaLK8ppc4PkRB6OzuZ7yIEXgF8cuzBQHUXPXn2vhtCyk6X1f4lM6KoNv3yKuxMeFGla1jxBtYe8sDCDLxO0qssmhPNn2CRg9IoGDw3/yIaGhmQ07ejCo6thMWy9UQow+b4iKTErmXH2Y5Ht281p7c2iOEEJjmDeUcvvhx8L9KBxQXW4fg2I/1ka2lGvhh91ZLFJFPC0r+f1m76moZqHr6yJyl6G6sRcZgaFlIPX0XFWysemZxq5xyGfLmm3ScSPZR0EsQLRHzxe0czLUKuH/SxnJDISmsF11w4T76dYmX3nOgbrq9BPwY3DQaQApQl1ENLM0+HaZuG3Tz+yeezWWCoi6Wz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(4326008)(478600001)(316002)(38100700002)(38350700002)(36756003)(83380400001)(110136005)(66946007)(66476007)(66556008)(2616005)(8676002)(8936002)(6506007)(186003)(86362001)(4744005)(26005)(1076003)(5660300002)(6486002)(52116002)(2906002)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5jBYFMHFkmOo8hmolyFPLTxzcfiX3Jcr/lJzrVKcl+6sK2iAPU0tFrohryDg?=
 =?us-ascii?Q?6lk8j9mkNKrvkaLHxG7UDtkUGBoBxoula7uTgYqd6HjxQVSK4Se14b+Kbcko?=
 =?us-ascii?Q?QY+08q8Hjkopgt5VaGVudsnfLHrw/q9kC5tRfCAy7utW4OjAzvtp5HxLxx/h?=
 =?us-ascii?Q?xttHYdzMYm7xVD4Jgi290Z2eUff8hKGne78oRrNxSbcH1VTzQuML/TSz0TkJ?=
 =?us-ascii?Q?S9IR5pZgaiJkceq4/kSaQ4llPI2jEYpIAcDQeT3uA0TkaAJ2KlLL92P6ZQoq?=
 =?us-ascii?Q?o15aR08155FapORQ0xV/Z+wQWQ6OcjfgcDO4l3XmNKGdVmC7+0lpwMt+bdud?=
 =?us-ascii?Q?6jFQOS54s2vM7PeVdbGnuU2dm4TI4pz9iqA1z/rjL4eqTzABFNK1c5XNVFkP?=
 =?us-ascii?Q?kIJg9vI+/Zcq4eJOTl0PgNzdjwgSaVK+fEyDIDe4fA49S0vPbX87w/Gsz+Mm?=
 =?us-ascii?Q?ETjvUmSSesLYgTkOoIpNJhMF+ij1W9NUcIG17smJ1dt+oTw1yvazBglR1Yrd?=
 =?us-ascii?Q?+VZoF0u9qQFJRB396MwF7qzn9Zn36QQ4Ne8S2HnZakBuNxSCOiG7dBzy1bzt?=
 =?us-ascii?Q?NyzFF+12eoYfBfpW7Si0dzQ/G6F/5qQ8e15x2Vqy6KP6XUYPeowEVjAnGl/F?=
 =?us-ascii?Q?lVggpf+hFWuECSTwgCPoBSmBMBNBs6DO1bsABc/lk+GsTE21rxjLFm1HgCWx?=
 =?us-ascii?Q?Rd/0Se0sECt0J2F+FmlGed3mSyIs9tpVRAwXua+LHu5cgOSXxmGrZS7FSg1B?=
 =?us-ascii?Q?t373UGBXYbb0XKFLOJDYxcACs9DrSh97gvRMgz6mh6rBYpHboFhl8XihFbUz?=
 =?us-ascii?Q?1exLhPnq+0ibrjgHb0Iy8ORoZ5tWilLlrqT00578zn6NKCCcj8HYPdGfJtQ6?=
 =?us-ascii?Q?ZCvw/yhn/nhfc362EovQ3FI994DuXrPSmA+vMb4fjLJn/L9aq5NMInsS+M/7?=
 =?us-ascii?Q?O4qGjL+kRh8FeNNQc8QcD2oicf8wDwzALbyysCBjN14pagx/KYH4GnbUYGNT?=
 =?us-ascii?Q?blo3f2YXqFyRddRTfknsVme6DGiV/LddxKZYWZzywkoNtacrA2m0vtGOFDql?=
 =?us-ascii?Q?feepGelwvJHubGrg7c2EhzHTuZPKmzKh3LUdCurgMbBio2RJ7MLJ1qeaTDfK?=
 =?us-ascii?Q?uDet3HFqZsw8et1kar813oNy3XOJTsGYvm823Lu6pcEiP7LR6Aadf0MSNOsV?=
 =?us-ascii?Q?d3+78GP8OTnRyrO9iMzKE51T9/4hkMRELxox/9dNouASLt/R/SgaBHIZxEbG?=
 =?us-ascii?Q?MdU9NZmTvG8ozAnqBLm1aEryeNoVwEmF7jGMzDBqAVxRiTuQeLumk3C1u9Et?=
 =?us-ascii?Q?DyHMRwd6sXNKv2ek7+w5DViW4VVtgdchvWCU7R7z76JwoflqdJ1gRBCKpMCa?=
 =?us-ascii?Q?E9ns2BRwT+QbUj0Po4zlXgY+GHRQN0a9DKIGqj/yluowSi7LK10t1spIycOV?=
 =?us-ascii?Q?O2scJX3+n257L0ZTiFkQ75TfN4xDYjyER01emkBm8u34GMzR453IGgEHZc/2?=
 =?us-ascii?Q?XD28fs+Z87sHIV3ucmr92NnNIJbK8s2eWJ+65uCOTf0ed3Rrwwmrr/MArBlw?=
 =?us-ascii?Q?zPxMacIDAEzdqj5mlp+Yv8aMFWg4rEfrVQ2s7P55?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1516ac7c-f56a-407b-f5ee-08db7ebac9fd
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:32.3103 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZHQcM1VlZfBWbINtpEAgR7kBSKKnPjlarm6LAPNSVZiyAaTBbrMuq6eMmdfXlfx5RNk1XVayX5HySOuYVuPD9Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3954
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
 drivers/gpu/drm/tegra/sor.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index abd6e3b92293..f23d54626883 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3708,7 +3708,6 @@ static int tegra_sor_probe(struct platform_device *pdev)
 {
 	struct device_node *np;
 	struct tegra_sor *sor;
-	struct resource *regs;
 	int err;
 
 	sor = devm_kzalloc(&pdev->dev, sizeof(*sor), GFP_KERNEL);
@@ -3781,8 +3780,7 @@ static int tegra_sor_probe(struct platform_device *pdev)
 		}
 	}
 
-	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	sor->regs = devm_ioremap_resource(&pdev->dev, regs);
+	sor->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(sor->regs)) {
 		err = PTR_ERR(sor->regs);
 		goto remove;
-- 
2.39.0

