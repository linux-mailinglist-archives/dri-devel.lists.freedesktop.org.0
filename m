Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 810B874CA75
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B075C10E13F;
	Mon, 10 Jul 2023 03:24:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63AD010E13F
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZzz4AerefYKjNUryNaI/DjOB+gfMwSl3ENetGy6kIU7iIowAeD9QNceszB99x27VKjly/68cE7+XTOdO3hc+sP4gwrM/flTtFME6c4eiRBvQkiBXX+prEDw0Sop5q+nboIOflNzJLtbVTigsEI1zGBvhX2trxnlENZ13LHL2dN5I4YfraXUF0T0CufquhX6Th0zvRSLbp8GNLUyfnEX57DIiC5ZqSvI/FuuPP3mxDInnLrFhlypFbU2gzHRtZJzvarElmEVtgbj4o96sfGMdkoWCBHJUfPtInKLy5lXlyP0kXbQc/gMfKbFx4ZfuIFkEBT5Uxf/IGhFICbfRFFsWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lPI3daS+UM0ggiLDXQPd3BbYxuHM1WOWXBknGZQuNk=;
 b=kG461iWmbGnacaGgHk9nGFPa/Uq3UMjkDXRH29WRzr10K+ssFVluS9OahExSfXNaoND4rUrB3GuHFRWWFlM/g7k5R09IC2jZF2vAVNgKkvtaxzrpZASpVOxpSqOQK5BdfS4A7Fm4Aml/33UXQoqhWgwc0fqE8NMI3vPUWEqSlt+to/fIIbe5CzImxlU1udGyDBPLT6WN18ZnaV9w+ArR+92v/5QL+eNcafGDhKlB8xGWKeKk5a+iPegZCA9hTZTSeBFMCQvpa/fWLGxIgg5RquYedLsUKlafdJ1GTSIlav9KwYd6fx180zkd8SpWPA8PYxRuVDmtPMOgFTnRL61cVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lPI3daS+UM0ggiLDXQPd3BbYxuHM1WOWXBknGZQuNk=;
 b=JKCgy31rtDlogL+ebHzNVDqybtIuoUG9/1ty4va+o5rgEB8RmTHSMXib+ZyB5K8Va9kLynivBo5Fa2hjectYpgD14vI0OxeTuUuOiTYQwHgEhkdqntS68ovp18lB95eHASn8BUKpiQ+VW0oowyqPVHhN5P+iW1TENaphJHsKcxMI3osCvxwNDghth4L4E7DMaIp9Gen+dUV2APmteeQ1H/gM7GT6d9GxzPwkA+jFUEYqlTa3hFYd4HhSKI9mKb0+tXGNNCDWqeTt1gjSOv49C2Ia7za6Icp/NHwb7JZFXBCDTImh+dILETHOPDMDAV1X5DBGD+etvP518Bl+7uyP8Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:47 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:46 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>
Subject: [PATCH v2 16/19] drm/tegra: sor: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:52 +0800
Message-Id: <20230710032355.72914-16-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230710032355.72914-1-frank.li@vivo.com>
References: <20230710032355.72914-1-frank.li@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: b0c4bf3a-f947-4da7-c7fa-08db80f53623
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: RkZ5UTJqxJK1MDMwcOW7/uEz2jEH7OTaVmlXj5bYnc1F0YaQYWByoxVRpCZgR/YbuucRgF4wpX7YHfRWouWNwb9EbRqRMtOUEBIzDhVtAFNhgA/JlPRQpZmKyjTWhe1KKA9C/zE6dNhmBJUIQ8fzvbjLJginWMWWmpAyEQpSlBfs6i7B9PFEWrGfH3KKL0WVlIT4x0J9CJf+ZWokwdJVW98RGyK+5Jj5o2FIZ7jDqoYtuVumclMmcjYlYLD9PzCUyRf3zMrhT2OINvThl/vLIYuEL7TQf5pl3aGsMWfV6fM6bQ9MulSkwK8zB9yc2831Hp0EdcOVX4eisZz0by9vdvFuZv9BiD/daq685jm1XTW5Mv7vgge9R10pLMKAeA/e4qInSjOK/rp8pp5pla2pNYwCR49BGpTb+QyInkDX4ewDyucMDCx19gElIT+Z1OSutXzD834mBCnOiVi8anzkXdRMZrPSrQKZ8ygw1rtLbONGqIt+DqtNznM3u0U0hfwDDZvAGOGsVxlvlpNpl9oyPPDXhVQMejjuP6sT8C5sOUoS9ey6Ybj4lnDjNxu9cloST2dluYEgPYDYydQXL7kc8kPA1yvlmIwpn+0b67BvnUDp14sP1HqGEkryXMD7Z1rU
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(4744005)(2906002)(110136005)(186003)(83380400001)(2616005)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(6666004)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IsZ6HUVMG09iSZ+QwVTiFgoU0SMGgBdUt+gZTVYHGnbk4FLuufc7/yrDR/st?=
 =?us-ascii?Q?wS4wu2Ytg98j21REKmvhru9sk+tLuvSjeIeLgsyUyMsYXt8TdlI/iTvcBK7s?=
 =?us-ascii?Q?UuAyD07p2YR7os7So8QaLGpnAneFNtxQx/dBSwh/2skWjCuX0RNzcQJ7CTRd?=
 =?us-ascii?Q?xKLJRXib0WFkCKp7csUe0iwwN+oIH2xwp+G38DxYMF2ngFu/62KSq2KI3PNb?=
 =?us-ascii?Q?sytOqhRtSoai1MLCz6UcGcSLDRZ0fnv8J6OYNyjtHAgXmwJj6WJWPjCAB+HQ?=
 =?us-ascii?Q?Aj1pauzR0ljeAvCx4K5AxHo1YIXYkJbC0iRUV5FGhWNSN0t9NpDD9DoN/NN+?=
 =?us-ascii?Q?NQBvM5G91Tzx16MAU/VdAAkqfPXhRR38V+07Gq1v0K3nUTDI3zTVrIsb9Gn6?=
 =?us-ascii?Q?u+z9Q9GE/DO2VOd7kScqOAXnB9yISPIpmNJFOqoXKUSexU273LVEOfswWbpv?=
 =?us-ascii?Q?6z7VN7+FPGSag6foPzxDZ7WM+vbKVqA8MzLgSqAdB07Z1r+brMEKsZz2sdoE?=
 =?us-ascii?Q?KPYw8jDJKZxf5ua8zghBkIwHkZzUYuQ8GLErcoB2TLOSOBkCEZdgd2n4MBRM?=
 =?us-ascii?Q?83fuq7qasdyrp4GT1RFncvq89Ek+p0ikFRZVz9X+tutBRzxvjiFzThaRgYJO?=
 =?us-ascii?Q?ciDsLvoldLDSQGKxzrBroJkLZLMSjtVR1oSD/SX5Y+9lUeldel4MjsCTia6T?=
 =?us-ascii?Q?YkBC5Ey8wzujnnPj6HPrqft6ayLoANQ/h/2kEX+mzSOYBrUHrBkC+4IbvZrU?=
 =?us-ascii?Q?z4E+LNnJX7sqpFefufRdWt6WvmkMb2YTcCCy6IVlslgsJV3X38GYP9kGJC6d?=
 =?us-ascii?Q?TMAO1Db7VxqPGRbWqngeyVNf0KZ8OuPWGR0BLbj77XoCtI7lfZNF4yvF982L?=
 =?us-ascii?Q?5b5GE97uqkaUO+NOP9jsBSNHXU+O8YdjLP4aR1rjVWm9didek88x0Yynd/+i?=
 =?us-ascii?Q?8HTPzLvfoFJhryxatfic791FVR/XdOQqcq17Dm/Pw5ud6ebaJAwD5TIEVS81?=
 =?us-ascii?Q?etxnPUwii/NeLL55AJrCYIGO5ZPosZqwi44RClFskNDsL2RLjwKunJkX5NsF?=
 =?us-ascii?Q?7f3tIrY3UKMZdSrQL6jSlqqonpHPj0kOaJQJs+9GkKJZyRSzJTxRxoxEXCDQ?=
 =?us-ascii?Q?nnL4790KRaSx43OEWxsqSJqaY+5XojGhm31aIUVZAUZZBzG1Ur+eDYyEfx1R?=
 =?us-ascii?Q?ANUsdwxy5GFoUl6YoaFDYmCssh9pXLaLlkVPzHNSGyCebgm8bpTVN/S1EwJp?=
 =?us-ascii?Q?MU3UKZ5YO9C7un5ZnWcxXWS+Tj0t2zR8uN/jyAFrblgalxAx0FetQndxhBhl?=
 =?us-ascii?Q?eR2KQiW4eNUNcUicdPdffxg4ZBJ00T/5G82kpVyx8INr1/a0TtT9O4ZN+nW4?=
 =?us-ascii?Q?L4YQlkL/LDtaVRL052fUVo0PlGGJDLjp7/CyncIlt5bjVHtS81jpIYeb6LQb?=
 =?us-ascii?Q?TemRrq92J7RmQTERyzhAIjRRYYyoYWZo0B04tTO06YIa318KGi7Jw28uCMDI?=
 =?us-ascii?Q?wMPzDnt/zwmfWsGdJOdB+bCTNhOaQoOds/jCw0s+9Zo/U5XjHujZfbVvXoXW?=
 =?us-ascii?Q?kHJdI0TFAFaa8NCQHFbVEg9bWt/+RGypXcqB4hL9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0c4bf3a-f947-4da7-c7fa-08db80f53623
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:46.8885 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeig+ctKAYL77wAh+UAeTcaxEk2pjXVsUNLQNXScVDH2/d2zT3u2ix3yXMbhv09UtcZdIkMYbIB8SbL35zv9nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
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

