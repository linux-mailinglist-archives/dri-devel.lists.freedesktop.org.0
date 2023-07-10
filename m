Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E6F374CA79
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE3BD10E167;
	Mon, 10 Jul 2023 03:24:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on20712.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::712])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696A210E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QrslrVyaBZWWkWVnPR1BSO7ukRcBKeBkBylTmU2pXtRW6sjoSU0oV2SWPrPtpdK1/uUTpkTDmKLcZ/XX83R4VQqbTwXwonNiowxiBrESvgIDOJ9s78I4VsHWf/bpo0K/I8Yi7LFqSZatIBIcif/LJSzIu3I6NNORXRVe8GjF2P02BtGvOhQvVld9HBLkeBcLmov5JdCoLKFMIc1NL8qsJO3Mgx0/ZCkeVOcpyYYjcQLgsy+q7u4AE03JUZqg0XL2sOsCfl2IV1gj4iOqa4UoSiDE2NJfkqLH6hhzwrydv3yi71PAO2yaQMq+pxylQAAiWZ+Us9bitxHcZ9CzEVvo4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOxYaTJHHXcIKOZ5Jo1IIuZ+JvmIreSp+yxbv7EYeCU=;
 b=biE7/JysUvUK/lRfuqqtixm9ldWAncICWj29hShN/ZGhF81MqdF5AzKb0iQnpi62YRJqafdyAfl5e00jpxOFdzI9vuhUy89Jiai2TV+G4r13Qt2vvzGaPvHazNdLWFRZ1nhJVNw9z8Dqe+zS4nQMMh08deHxo2K2DdySGlZ0M8cNQOdPjPjDvqDF6eeyU2YyuQAXXveK/e/N/c5Ou8tBKN7rHBFgL7ANdTOaumiQGDXYLChABZr4KeaOqInVcq0NGCHrSuiTSPy15CXt9iA2eXh99jGkqY7B1vX3YLNNUE9BaSUOkUiovf3QxhVX+oOYk/juFF5bnnI+WrlZGyKVQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOxYaTJHHXcIKOZ5Jo1IIuZ+JvmIreSp+yxbv7EYeCU=;
 b=fZwW+IGEZ/LfE006H4SdUBoO6e9rClME6/uybleyKrgtD7ed7m2ZlnaUtZcXzzrDiL2ieYOUgRoBIzsmWM8jI4uVnaGqzyt/WMdmHMl51GQiiIDErS1pEHG6LItmsA991pn8tnMQJd4i+qbJnm3xjONEPcjxwf9g60yMg7/Ko4eZwyL1UWT3a7z4bGDktsIzb6bbh2IdpGue3/XEM3rLKEVcKu9Du3qPOSiIquC+X/2RnsXzwE/vuuhh9FUVhF+pSIf12QFDGYvdFb5xsvCRpWsAQGu2AfqW1zmQyfpT4/00u68LYxn5jRvAYulHwtfOdw7FyQ2v96x/M8y4RWLNWA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:51 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:51 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Alexey Brodkin <abrodkin@synopsys.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 18/19] drm/arcpgu: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:54 +0800
Message-Id: <20230710032355.72914-18-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 059bc2d4-1967-4242-8a80-08db80f538ae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7p/iS2T/XDGL3N0JgieZluSDW76khcHGQ+29nfZbjc/4+pvXhbjiQSb5yamLDjW2trtImx89q3KAFewCUwLC8oP5YuaQIehYEOMCGq0Rz9QwChNY9fEkQEgmq7MFVPdW8s9pzskaN3YpHKLaUCcm31U3Jb18vBs2Fu5ugluP0WFHtOseUeVDBB/Yv+re2GR67hNya9CDbrJ6/f6E0THZlyORPd/yUg1b25w4g5cqaIWsjswucRb40FHdb8eGzkFm9Hs03idR7dzg9fMmX8kLOJCU/qoBO81tlbglSE4osPyDuqT2xudEW3DqQ3qX7HGOCxEaybkd019QA8LTGEOS6ZuvVLRQH0/Hh6S4yFuvUBU/b0BSVA4VEj1j0bL+lys8A2QWMI95tOG6ByDT0IQU+utg5fjFB/XNfP2mcI8oSegi0xa7SL6sQZtfsWd9ZiOu9cY5A59EE7Zuju4ZVpXf6qpM7HOyLLSvJ1Vz5+l/2ErQmUnT0QqOWVce4g9/4y+kc7QYREoNXIhNow8lAYIs92NE0rZu+VDZJgeTh5cwnQU9b2AHhMxpRit5ImH4waFkjixr7B80Z/2pWf6MZue2KVeEBT6HK1rwKQRN5IY2KxiqAkrZPtklGwM95VE3bbt4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(2906002)(110136005)(186003)(83380400001)(2616005)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rjNGdthGWaq830ZP9PB7r/+p9tvfLek3kfVmdHsBKy3hGaOkpx5/rZg0Xcoa?=
 =?us-ascii?Q?3iUs++B8Unp7xnBASZDaYb6EabvLlEWurrxypg8vlYSCP69DbRGTZ7cx8Lre?=
 =?us-ascii?Q?rkv4xHz50Z3tXTFkt8G38d4sqBfUq13YDpCLv9cqvXRLeeg4mp9N+tR5h1DS?=
 =?us-ascii?Q?AdBoMgnbRBoH3aL+3tlR8hK4cAbfECvsgCBkkfsjM+y4e13jHVRTrAZHW9aS?=
 =?us-ascii?Q?3pRLD9vnYe/oVLMELknJ25NZtyWcP8WRLj1t+i1emAXBCaxv3vGlBvV8DOxj?=
 =?us-ascii?Q?A+9b/Ky+exCLKhxQFA5/k0K2Tx0kPFBGc+4PYp4u2ToihS3HLoz1XRD1JSRK?=
 =?us-ascii?Q?YhpLZBYnqdpZU/W8poozaIVojUWDGTZJFxhs65dXNBl7spJVslaQ4L6ohbgd?=
 =?us-ascii?Q?r4lqaLWAcmF0OwwKbbflLTUG+NgHuTLFch3TscAfS3zl98H9zsq9aN0qYUbl?=
 =?us-ascii?Q?zDkqtlc93AyXlLYql/bFDfjjWQ/xIo1DpkwrTDr+WJgTEEWiKI60cNDkFwXb?=
 =?us-ascii?Q?KQS95O2yJAYEZnagYIaiZBFEehmsrk0jCjEJkQDt+DdEO9yfcTOn1ovpROlB?=
 =?us-ascii?Q?rqzG8pPW4eFlPYHOIwpfVgoLvv7SEARqCyuGxCNmElnsrtumJMvsUIB0qm+v?=
 =?us-ascii?Q?MHsG4TPG8CM3gBf+FFhFu4vBmhuzWr0ovUjAYD3LJaNpZVlKjSsdenr4PEdq?=
 =?us-ascii?Q?vg8w7XT+MYpyVfflvZlvFKMl3Z28gWhYovxTVpYLUuHwZcIv/GvQlAon3q//?=
 =?us-ascii?Q?VHm9WuojDsEiGPZGMMPl2aPEtlGLLyVYH8nfUnCCwxZPVTZTcmZMpfAU9E25?=
 =?us-ascii?Q?tj8vbnhi3TxRPaOVsEeNENreUErPsPePINv7X543wEHNW4//qrN1lRyPx6ui?=
 =?us-ascii?Q?UlE+gS6y4gajEfi9CL1qtjorv7ebWAoPdI6UMasrvJ2Jx3xrfDiFCDtRGLgd?=
 =?us-ascii?Q?8ncE6OwHvc6gCPvsAw+dG42HnCzrRf//3nwKopsG86Bh/nxGI+aRCITXZHEC?=
 =?us-ascii?Q?e9T/JeTkoumKVlvvlJwt3JGeCkxw+iS5wP0zrydgYx60eIeVmP9S9nKypSgY?=
 =?us-ascii?Q?399rKoZMt+Phl61rSsvfsu7d3FJbkCSH7MUlJGQpA4MkKmrsZxCXrzfoQ91F?=
 =?us-ascii?Q?4Zzr19KZu4eizui+nX1+P0v9sKm+MjLCp96lAEdpMJtVOxZDU1k7HZR4iuoz?=
 =?us-ascii?Q?iUQv0zMzgAhyYMhSsFRV25UcKeAavewYE34a0u1vtSOuYXN69WDuM4NpyVA7?=
 =?us-ascii?Q?xMueT/x3a92RJ8qop+mHDmc9h6VFA9GydzKKRvqO7rb91hXrFRJfyrpGog7H?=
 =?us-ascii?Q?bGs2yocq9lDCztZ4TBlr8fe1PofV0GlmMnPCgrbss+xb7lTw9Wm6ibTWg3NS?=
 =?us-ascii?Q?bITf1EGX/fc2VA975HpKvCHmouJJVq4PJh1hmKuNvzUY6zFhFlEQxeMWmC95?=
 =?us-ascii?Q?sZ2Z4O6AJrA2i7yspnq3N+v1vr6PGmrCGbiy9lEhP6LUrh/YHC2tUeeF+p+G?=
 =?us-ascii?Q?FhQYsoa6BRqOk1ufQnZcLcyLK36p+x314HS7ZO3TFAv28i1R4uuEpUhVYXBf?=
 =?us-ascii?Q?Ff+uL8abc/URqqg9qMN1Hk1oWRrCzVczX6DjOOPG?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 059bc2d4-1967-4242-8a80-08db80f538ae
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:51.1520 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JT1w0mDtM2d96qLVIR4QImWF0Kg7XDKJYXboVMLY89I57gMJcZRidCawr4neF1SNuv1Gi3GTi/wKYsbqryKkIw==
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Acked-by: Alexey Brodkin <abrodkin@synopsys.com>
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

