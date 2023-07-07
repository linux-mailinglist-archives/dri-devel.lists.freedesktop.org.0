Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DC68774AE74
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 12:06:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56AFB10E54B;
	Fri,  7 Jul 2023 10:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on2071c.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::71c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B4010E51C
 for <dri-devel@lists.freedesktop.org>; Fri,  7 Jul 2023 07:21:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jbcHiV77zGTTF+86IoSidXR0xxPfw47DNRcAMM14G6DTea+fTb5+OjxFzIYH5S+vikr0t3w01aLpJo1Vtyf2hsr4b/rw7IrcY6GjyGhRakJsSHLXJ9JPyBZEF93HmO/DH+0LrS1GzYGDYat/JAY09qhg4c+2AmmpJSeBR3ly+BXVaB4SMxyD8XnUAXEm7XI5mfufikKCJN8W5ieSwIfxlXLHJltJb8OEYfgBximZ8bAUtzuT5bdYFr86wUK+KpNebq0V6SJDff+dEHqKBIm4bzxUdQbRngACj4WuJjtrWFDSdCgPrcW9+GD4zsvbesDCoVTj59f+5VUUykukquwpvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hWlxDQgJPt5iRXpnTJfIfafjSNsW3eAZ4uVj1DMmoI8=;
 b=SEMzNy9KwzDq6/vwR8FPeX0HhSCblChb1qqRm0bcxt092JSwCSih9/+9HZwrCSsx9bJkDJo77XjWPiyYlpac3NifyfQuOFThBKufTeoVuiqwu/tWlW/qWB5Y8fqWrrNIW6ykshqETk4KdFN8ZOfYVHWfgD85byMUrJDKdow+OMoQsrsTiaIpvOxZ4y30SPti8KxpZIIv88yrnkvWaMxoxAz1C2gAGWYdiG/l3wd4Z/wsskTNn2FrFSoVCkiaqnQnJc1HRe4GaEtTMN5LKJhT2kuoayod/Jnk94EDlytps34ROlP6i1pdGEO+SB7ip48mcymvIq/wgh5OwvUiNGyQeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hWlxDQgJPt5iRXpnTJfIfafjSNsW3eAZ4uVj1DMmoI8=;
 b=hX0iCBD566E65htPEKxnP3xl9yWnTKNbcHlxeFRvM8ZH06f2Se3xWFvL988YHFsnZcl5VgmIVUl6VpwkCDs4CLO2qsHKYQW8kgWieK1N26W88SMuxcPdl54jtwMMlX/nAAUuB3c1J1bsZjzqDMYCx4XpVjGBwQGI39aRNXxiBlppBQK4oCIje1uWtONoDfIpB0CdSzJthunKyN44sJWAEye6/XedibVUCh3mw8pndgXuHiplXyLF2WATjxf+ZZ9qiKCAS/P5zI3i/sxRCpSxr9uMnMVBVsyuBQTGoFdllMKbPkH1sr+FWslLwUTsGzZE9ZflsBGCxpvGAOZGhigsfw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEZPR06MB6743.apcprd06.prod.outlook.com (2603:1096:101:17a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.25; Fri, 7 Jul
 2023 07:21:40 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.025; Fri, 7 Jul 2023
 07:21:40 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 17/18] drm/arcpgu: Convert to devm_platform_ioremap_resource()
Date: Fri,  7 Jul 2023 15:20:33 +0800
Message-Id: <20230707072034.48977-17-frank.li@vivo.com>
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
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEZPR06MB6743:EE_
X-MS-Office365-Filtering-Correlation-Id: d0954b82-994b-4ef6-d6ae-08db7ebace86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VkAQNHpbPbcria/cIToEJdttYMWZyfZt+jBLzi1m9yKBNx7FVy7Qz4XL66qm0g0C9zAv+1VFJaKHzbuHP50MBCjqMLL1tI1nc8afEfSGk5fTa0iNvRlRG2ObMBZOmonDA2jIG0r0LehDYI3vZMN/wmqahTPaNQOCi749dMAwNzQdo0ygvvkGF23jTuqfIKMCnBCPYTdaWEaNlvnWZdxCOt5scC6Nmw0UI2wAf/hKPbYryWHXM+xT12TGN+KjA2iMHMFZMzD/ikIVlYaRng4Ha2E0UmS6UxxMCYFvKPu6HUHk6bBzRSmPsIyxu92AOjWjYqzjxZOayGohD2b1yBg3T5xhqT8Q75dmMF4ALg9gpK8+A/AHk8mLO4Dg/goPOLZtn9dJXVQdsYa4rqQQfRe8r0aiHrH2gBZCMBo5XFI38khVoXBoU7YZl0cKXuTdy5sQbmt6lmuuQO9t8ICyX5l5Hw+eL272h59odr7hPdGQK4Go/oQOB/9KJqXKcRbecgv386drtV98ixHWl6OJPQRCQIrmLwlgcZ6YMTNhVU3MiwAvqX7ntECh8lILarZO8TJ7khThNpMHXwZ0EzB+TMikuDoG7tUzWsd4PSNpQfk/BL2nupC2UoBHmBqNxssjWFJ9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(39860400002)(366004)(376002)(136003)(346002)(451199021)(6512007)(6666004)(52116002)(6486002)(478600001)(110136005)(1076003)(186003)(26005)(6506007)(2906002)(66476007)(66946007)(4326008)(66556008)(8936002)(8676002)(5660300002)(41300700001)(38100700002)(38350700002)(36756003)(316002)(86362001)(83380400001)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?CMHiylyK4ft8zlwn1WrFTy4actvCZQtFa5za7arHhb1lA8S6lLIltSX72+mI?=
 =?us-ascii?Q?DfwEjhqAfE6dKm3iY2f8RdT383I3He4hgmx8h7Tt7CkFzSyxUa4wiNkxysiG?=
 =?us-ascii?Q?+Ccwd+eQN+qVB/CWAVIHIPro8MBpmpGN7B/d6fTyGsiJ9GDNFchc/a0YHLuT?=
 =?us-ascii?Q?HYX6FMexhTH05UOu8fQ2sk3zISTaP+gjCmnmbxDIpbbL8itOrPSyTxsyGwub?=
 =?us-ascii?Q?i2yUfNZolUCp7vUwdNPe5i4xULomIK11pIHvGxJCrlramZjb5tkWbpu99SBA?=
 =?us-ascii?Q?dPif88Fxn4Rm/C61BEKNkAU26YZ7i76RvUCRSqvWxpW2EjJwP0TgY1h9f2m4?=
 =?us-ascii?Q?J3trK4GnCr1AnWVwZVRXg4lmsRTi9S4ABI38qHT5B1cu0osJdm0V5+/Xicdf?=
 =?us-ascii?Q?l9KOeSi87mKiy1BjuE7r9DpOFA0pMmIfV559RnUEKnXOx7/NU0B1q5MZjgy9?=
 =?us-ascii?Q?5SvRw5/Pcez1jpEaqeT2ERtwmbgwmpi6xMAQskplVY7C1X63kd/nS1ftIh4R?=
 =?us-ascii?Q?10H3iQg5dQy7Q1hmeaOY3pcBpSXNWnuWwNjhzDU9YJrEZFXJ39YJmwBubhGd?=
 =?us-ascii?Q?z6MXLh6x7AeMMWadNOpBcrbG5aMvWjxAIbs4HsSmVQmwSLId71kU2g3WZUAW?=
 =?us-ascii?Q?PusvqFR3iUSH8GuEZJy1V951hYiQXC3uW6GQfWMoTa7x0ezpcXLqD+7fwUWD?=
 =?us-ascii?Q?GYpldy4dQyiKbzSDdZl59/128bU8NooynS6OHdbRQD4CJOjsJpTPFWPc/S3R?=
 =?us-ascii?Q?V+l+hyZ+JkCQla6Io6cgPr5OzLkWQQPX4lF7jSNrS4BTH6zD1yu/DWKtSgXV?=
 =?us-ascii?Q?BfKXyoM6GHiGKfmlAdhxWHugd3HxRy3AQ7Jm2nQC00oNJjrxTz37Kx5YvJVf?=
 =?us-ascii?Q?fT5NIufRnT1USOrr8ipYY6K2CKLTw8K6C7jOBP6boCfnIXoXV1USHlop6Dxp?=
 =?us-ascii?Q?D3SAq/iO/ey08lTa6KZTc3cRl7CUl1bpAQczFrqw0VSMB8VNWyB2Ahd610P4?=
 =?us-ascii?Q?INjphQwRF0cffD2gVNsZTVDj8g5Un1VKDostF6nDRv7grs2rsSru1hz7cpvk?=
 =?us-ascii?Q?yei+d4M5uvpbMbEKwlv636+PbwZH2Sm7EYZnyRAT+bQSdf8GfumZoq+rKm2d?=
 =?us-ascii?Q?rTkUYq/ykLe7YV0eiTjgkExKfLUorTgUholgg8kKylIR4/uILW+91KEbxDYe?=
 =?us-ascii?Q?6LyUFSi1Uwpcex8AkxwvodVHnxRe9kCau/PbQQQqhXXkx2ZGYG3+CnIcABzr?=
 =?us-ascii?Q?UlwxtxVYrqdy1o2DKteP/VIUYhASGMp7CFXSam+5PRgKdQDwTemJxVEaf5aj?=
 =?us-ascii?Q?CJOZsqfvxawPOcoY0c1UpAQ3cssr4BpRoo8+/otIrPMM/9UEgYCOaXZcfOrH?=
 =?us-ascii?Q?+4JLYkSr0SKZcnuy0pJye4p4GyhLKdIXpti1Xy56HLczVmrtOSr2U9qRQtIw?=
 =?us-ascii?Q?n8NJhEPPXO5grmd7+spDu4p8AzN2sn62ptnxKnttzSN3NZfuC2b3nwLPHQ8I?=
 =?us-ascii?Q?GrjR29Ai21Z+y+Nj1B8mNRQZ9YAZnL57rVwQvrLX/90j4wT8RtPEGLUOnX2K?=
 =?us-ascii?Q?m3VwmCzNGQNEMBJl5q4L+NCda6VeTb7NACBMO7RD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0954b82-994b-4ef6-d6ae-08db7ebace86
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2023 07:21:40.3037 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: a2xVT1UM4zwEYqOS8IgXGtWiSltbeq1uHEGMsZGwfsN2DD/uGDjnFYT2ThnIomuPilUqN6tlgv32270XIey0/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6743
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
 drivers/gpu/drm/tiny/arcpgu.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/arcpgu.c b/drivers/gpu/drm/tiny/arcpgu.c
index e5b10e41554a..3a5e66d909a4 100644
--- a/drivers/gpu/drm/tiny/arcpgu.c
+++ b/drivers/gpu/drm/tiny/arcpgu.c
@@ -251,7 +251,6 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	struct device_node *encoder_node = NULL, *endpoint_node = NULL;
 	struct drm_connector *connector = NULL;
 	struct drm_device *drm = &arcpgu->drm;
-	struct resource *res;
 	int ret;
 
 	arcpgu->clk = devm_clk_get(drm->dev, "pxlclk");
@@ -268,8 +267,7 @@ static int arcpgu_load(struct arcpgu_drm_private *arcpgu)
 	drm->mode_config.max_height = 1080;
 	drm->mode_config.funcs = &arcpgu_drm_modecfg_funcs;
 
-	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	arcpgu->regs = devm_ioremap_resource(&pdev->dev, res);
+	arcpgu->regs = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(arcpgu->regs))
 		return PTR_ERR(arcpgu->regs);
 
-- 
2.39.0

