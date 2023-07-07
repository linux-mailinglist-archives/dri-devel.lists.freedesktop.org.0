Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BEC374AE76
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8C2710E54C;
	Fri,  7 Jul 2023 10:06:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20730.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::730])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C924D10E516
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ADTRpBSOn9KJO4VW4l1ZxiV5nNbYFq+cYnvxbSYhhcXci/e0LZGScvrabPOZYj/ufH0gGYSWM6uk4Hn/jaBMCc4dt5ZTb7UoT3Zum1oyraFQV019eq7gyzChbPLNUTJLOmbNPGDUw8Q1xlZq4hDX/G3sJQi/KzK2076oVFswrq6lXV6oRhJQhZm3OY22dzfV0xvJIc0UHWrg4dFBy6NDbiay9bCMytbsCPm0VDx9DUU3F2KpEq4EFIMN4FPR80WXsqJZn7TKD8VHMU79KP0QLLdUNcVpnaAGPYuNXGo0q9fAH8iwE0ev5ZZQ4H9QgCnIQSMbiBeDaVvVdejuAEKKvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX8d3Rt/yv4cLgjgnhQifBprqlClsb7HOd2RAGU+eVU=;
 b=CANvE+MxPBkb7IfYZpYPRuiNStwGrj3Dnk3z2NlBP6cxrxPGxMZs2YNuzNUrJsOxbuJF8fxSz/s11IPMmTZ6HAXUMk4Q/1yLAyNw3/hSbMjlHZoZbmWWPDImsxxd3jt8j7yhKXKqWl1cTLkes7DTGNqh2K1Ynya8Sj+k1W4ydhEHgyFyenkK6QihV05EQYmhOj+ocvtzSMV7ZPnbEgDJLwDa59UaQgtlzjvuxZqw6SMskFJ/UkgGu9uBEsSjZI6KoAOvQWMDIPAt9buivgVluEk5J3v66c7/nSK4LnLKtITBCrs58sh4SKn0fKk/gJuvw0hX1IUYjB4FGBTyaAtSrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX8d3Rt/yv4cLgjgnhQifBprqlClsb7HOd2RAGU+eVU=;
 b=aetJhNHrAj6oNnTZvjfksIwG4JllOoswEKqtNxK8SCIye79eWhAtf4gkOYJuavbGJC7+ljxEgbZcesPmlDe9Ndd1uj9+uEyfQTykGpnUANWPnh4QvhUoy/Y3uQmbPd0TTTYhITKGY+uBCXa6LklXD6BChw7uxZFE0qYWLs1eo1UMFDvxzm3NLnn5DDxnW4wqIVcUxRpK514pNarygbFH+zU+rbjLzDQxbxxT7TZOgWTaOLUpDwHw3gof+x258p23G0k3qsAjPGN0GieKtIkPpqB+fCdv2IG7lGziCYTfNJDrYkkNMbanZg17e+RkyS9U4FCE441HIoPmL+w9ro3Zuw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB3954.apcprd06.prod.outlook.com (2603:1096:820:2d::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:28 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:28 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH 14/18] drm/aspeed: Convert to devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:30 +0800
Message-Id: <20230707072034.48977-14-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 98ca81fb-a898-437a-03f6-08db7ebac7c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: K8+2pVw7WfpvGyWWuyHxRS1412QtRc8T90OjMwUBRx6lflp6gQpSC2JBaGm9XTFMKRPz6A0tJQjj9M147KXV7IOxhnLEHurOOCkmzNQ7T2Rnca7rzIcim+L32vzIkEmwbBQr0ZK9GbZRIdw1hrdoG+2EMOopfsjoONOOIEyY9ofXS4H4rZK1b/XVL8tay2XXG0Trf2Xrn5HJfzmEFTsQmW563Y2sJTZ9DlwC01bD8VMR/d3PUm6ykOpNdySSqoaQVGnQOWnuJjYa0cHtXZIWMJ8P40onGfZRb/a0h1s3XaiHWFbepe38GW06tOKFfj6jpy6vWLfZoYOvzDfdA/Nm2a1xCyv3XEz+X00AdMmZO2HvbZiXMXG8mjn+gBxz4Fm5ANnTQVx8tgoJcQKUwOb5ch3iDunmsP/OXvyJDQHK/vzs5JDsDbNaU2L0bwzCgmRotsomRYUuDeHvQCxog+UHlDnptHfqwG5fr+hCcjDXGcFHttle0qX9TL58WitsT0Cv4uw8jog69FdGX2b7f7fDsGxxkl+gZ9aJBrPHvtXF5L/COaJc6GnvCzo/CcM8BpsQoYqMtUcZnJ2MYYs8po5gz3wwwKdXkWnz6w1297SCAQtUd9934BcOOwBGaaSdnQkf
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(39860400002)(396003)(346002)(376002)(136003)(451199021)(4326008)(478600001)(316002)(38100700002)(38350700002)(36756003)(83380400001)(110136005)(66946007)(66476007)(66556008)(2616005)(6666004)(8676002)(8936002)(6506007)(186003)(86362001)(4744005)(26005)(1076003)(5660300002)(6486002)(52116002)(2906002)(41300700001)(6512007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RLzLwAI15JN1wKnm0/TtuMG7iYMBBAeolgJYrTJqudVv3B4PRiiKi9alfb5V?=
 =?us-ascii?Q?X+6MXNukRBORTXxRcVFWywvYpTnxzkQ94YnzitUkcUnz/MpfsQw4AlZMq5GE?=
 =?us-ascii?Q?EnuTtBTQeNVzc1qcF3n50zx/Vl6kefzY1SttA9zzMo0L3UqteUHMtD1wD3Fd?=
 =?us-ascii?Q?Eci9oQw01XSuOrOcvug/a5cTL15TlBSLjCdXpJ1yb4RDHoFUNbUMQeSfDyxG?=
 =?us-ascii?Q?NyGphXH/mGbgr1cUrUut/CYkauiA9v2KQUTbxkzjxdaI0z72UbRNFI4W9Gut?=
 =?us-ascii?Q?fzCwiu2p+Q64ZCc8qwSwmDS1zuULpB+Pvm1wBYjz5U/vdairN2AiBn9Kz/5K?=
 =?us-ascii?Q?5YpK/Uvn7isNYg3PxVPq5B6FkOpl4a2/pE2lryoJt75S88TpYqb4qiiMrhgI?=
 =?us-ascii?Q?vf77sLQusqsuajIiHzi3alrCwXL+ipPprp6s/zq0gAniPo4NsfS9wL/uzyIJ?=
 =?us-ascii?Q?bBWcKwKAGCyga2MRL3kKMHLfBp8ZGHHklETKrQ7BkQDBP4pRCnoMJPRNu6ku?=
 =?us-ascii?Q?PgSizlyaPYZqaqI1AHJFWvQsLLRzgCQ6PtdIpK1SgbLpwayZpl3raJEBUS0m?=
 =?us-ascii?Q?R5Fk09pLeb65qIS6icDKahMyAaRHueekW7TgQc+wVTfW0tKbjoAqc47B0lk0?=
 =?us-ascii?Q?Hib2ifqfGn1Z1693YiThFUToyZ03m7Wvj67BDGQJbhlQiadYTWeERIX3L2hp?=
 =?us-ascii?Q?rpTQwJaKNWAdMpK77VCV3NAuvyyrEhtFOGdG6nWvl+HtUVLSq4aiyYFCPteF?=
 =?us-ascii?Q?iVJaO1wxPdR+p5ZooJ40Fqbw/7ahQ5R04RxNSJoyuC5PNFPZeEkUL/Z0deG1?=
 =?us-ascii?Q?T1rrhLd5ttTyg60YuYZZM5eJGc9X74QsG8GJ3asevzZdBqPoHKJ0sEsIxSMi?=
 =?us-ascii?Q?eQUOBQ78pEQfIwxSX4de42njgb04sgW6iZgZgJpJrRy4KxpLsWneq1eHGmI9?=
 =?us-ascii?Q?VjOchgqnAydIVGNzzeJZ7HwNcUki6gbfeEFUyyDyit8cQDOJjSE5j4zwUsfg?=
 =?us-ascii?Q?xleIue3/uqPr9QvBEHuzujp02uwnvC3W9jcke2itK37sIvgkCCU5wyS6n9cI?=
 =?us-ascii?Q?Dgj5umI7qET3fV/Lcv5oztyaeTVxdpiiDUftg5q4XMJs2O5gpGTmWvq4r8DB?=
 =?us-ascii?Q?iaGjmDSHgyNqD8anr/k6Msm4XzlgPEOOUU2tMuJPBh8wIyuf9L5KB9r/+Kvu?=
 =?us-ascii?Q?bxEkEVLNPUjYN7EhQVWliaSmNJrw3E4HzUsDyc2cZQlrBms3JpWDqWwFJseT?=
 =?us-ascii?Q?gA4tFCO3BCAHO6ugVGSNDRpltGwe7k46VPXJwmbLyPJuJIN5upB4yV2yl8Fq?=
 =?us-ascii?Q?H0bxW8PfyhhWxmisdV38tQh8Al2lYR4oBRtxN7uVxp9x2U+pXrGnhifF2VI/?=
 =?us-ascii?Q?QrMxpeh+UbkFcj2ZL85p0burcnakxQMe87S6IFqge7CFpvvvLbcvrFNKjqjO?=
 =?us-ascii?Q?zxfQl1cjBOOBvTCyO/eQaO460S1V5aWZ6deUecaApMIOBhWWfpQxaur1/PkH?=
 =?us-ascii?Q?LGhzDhnH0Scuu2tZcITB9dN46hutCcWHGfnB7T+IhCxvMhVitVJX9rgBknYq?=
 =?us-ascii?Q?GqgI6T2CY1nGRhsoweh5+W3xIMaBYmL8G9I7Q0fC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98ca81fb-a898-437a-03f6-08db7ebac7c9
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:28.6081 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aMTiNHQ6mwg+E62Dg2vWV63sFjJQFsrO/attVtfm7WQeSX4l2Hsh0ZN9771eVOUX/Ivg2xYUdqchdWpBm9oe6w==
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
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-aspeed@lists.ozlabs.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 drivers/gpu/drm/aspeed/aspeed_gfx_drv.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
index c8c7f8215155..d681248f098c 100644
--- a/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
+++ b/drivers/gpu/drm/aspeed/aspeed_gfx_drv.c
@@ -144,11 +144,9 @@ static int aspeed_gfx_load(struct drm_device *drm)
 	struct device_node *np = pdev->dev.of_node;
 	const struct aspeed_gfx_config *config;
 	const struct of_device_id *match;
-	struct resource *res;
 	int ret;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	priv->base = devm_ioremap_resource(drm->dev, res);
+	priv->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(priv->base))
 		return PTR_ERR(priv->base);
 
-- 
2.39.0

