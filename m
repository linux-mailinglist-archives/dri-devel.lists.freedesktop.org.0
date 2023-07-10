Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2225C74CA78
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FD1710E14B;
	Mon, 10 Jul 2023 03:24:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-TYZ-obe.outbound.protection.outlook.com
 (mail-tyzapc01on2071a.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:704b::71a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22CF710E13A
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dh8EgDO7ZHDCI3P9AJhVnGh0/2aatrqWMzCGrSgYmQzmb2FH3tzdL0DHH9Sr8dDj4ntLJpVh2x/WI2JD/ZIZd+XkJX0Uu86wuDeRafDR0/5suHwI4ebG83wQ565Kz//DY2tQzv6TXZYBY4/NdAw+uaGLmRnWkHdV5wNTVoxketQXH+9GpAvPd4C6+pkBpwXErrKTxwiAmLY4YjQTV/gpYiEI0QvcNLd/GlxwUE3w8lVTRsgfYWUOHIG21NibPppXDZAA5gAA9A51OwtvqImRyQhxCIPKN8TCBAQJvF/cOmmCt614aBqvg6sb0CupZfFXpkZas253j8t1NIjL7mpvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hX8d3Rt/yv4cLgjgnhQifBprqlClsb7HOd2RAGU+eVU=;
 b=n1XZ4bzoWiwm5TnQknHimQ+AVJfFg892BttlnPNvNiuyJHKd/21HT98YKTXDWDC5n4klsgFguCBgzd8+ARWZVdNd1xBmCfAOj4xJxBX1KQ4KyKTELwvXtwBaQPkfnYBRQ/LdctNpLvFElndT74DGgOmG1Nhx8IU1FDUvc7kld+eB0YN10jTnIffmyh0RfKMO7RcJEfFiAZ3sr/Ee5x+BULm1qPhXu/wcEoHAjpMHGTWPYYlyR/OynN2hRLNbyyqyLzs9cPSrqTCl0aFIMVQUSzWi4nmTPeSxp8RcjyyIVIXJznMhCR+7FYhKvxx3gNpgV/l9PbyrA2PBP4p9/8Dobw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hX8d3Rt/yv4cLgjgnhQifBprqlClsb7HOd2RAGU+eVU=;
 b=njtuL3O8mqL3up8WKbEmi9NaT2dBnetbfWUaVU+UGqm6OdBN7F2eh5LchARWbYlbT4AbGrHnwFDoMU+I4738o9nYHxTzdZy/ZLtk7OglAK+VanZD2+fbO0QLSjGStZKUPbDMhsejG2THObE8BhlgeEHFROyZzt60IF45wLBsak01WNcFDsiRr8v5NCLiRFteXLhq+6C1Bs+Ef2adB/D5QEmcLHEHEJRLtMe6pEj0TE/CTMi31bwPQ0naf9REAEhhqCnHMWNM8tTNOgqNXcmFKZiangjGd+7MUYcv2A6GdFFatmWe7ldlt8PHK/PgHlxpVdiM3KEArJab92cO2H6Aug==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.29; Mon, 10 Jul
 2023 03:24:45 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:44 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Joel Stanley <joel@jms.id.au>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Jeffery <andrew@aj.id.au>
Subject: [PATCH v2 15/19] drm/aspeed: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:51 +0800
Message-Id: <20230710032355.72914-15-frank.li@vivo.com>
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
X-MS-Office365-Filtering-Correlation-Id: 6ab087a7-6fbd-46f1-fce1-08db80f534c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7b7+xCh73WeozwqxH4Du7EfSc2yap085JqWTibyAgkaB6EaOFalHwS6EOCD/aWpUNu1rpcA3mpeUGECaILuk2WZKKxZY9DhwzKkh0TazY0yCy55Pwo0yXd0RIXqfibTHch4ERW4HAOi+JA6jQxfrhjMHNrMVJsmO3zbMYniubIcuRTS+YT9KGTqOmIrZIabaQlBynWpafHhLijJKpqaLaO4aSinDxfAOBMRPbPG20byCbgtGXRklNi4PJQdNCupDFnEk3hBa+z1/JYgVo7IBf1dyMCaEVXIQgyO1MwWf4kMiBRguYE9YHrmeSkzWTNgcLRxxl/fivyKy+zeLGJssTN+JCAguy2wgEnCpjRmyTLjR/kaoHwPro4JMtBt2DB3kiDhJMc8r98meIYaCLbea5+AAqqVC7B1MAlOTm/n2hcwuXpENz6BWxhEl164vzLfDA8wYvZSotIPr4ZWkvyB8SxnbZIZRq4tMPtk8cKZ7ACUg5Kc7eWfI9vtllbEoWiIKlloG3kcTqrIOJP8C8PdSUN/MrhrmK9287Kw872LohPp4317W7+B1ILWNYqHg/QKgS61YirDJ+zCy8LCfBcoP+OXazn8qG7ai2mUg86EwfaZksf3ISzGHfrmO8RX0VpGw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(376002)(366004)(136003)(451199021)(6506007)(1076003)(5660300002)(26005)(478600001)(6512007)(4744005)(2906002)(110136005)(186003)(83380400001)(2616005)(41300700001)(86362001)(316002)(38100700002)(8676002)(38350700002)(8936002)(52116002)(6666004)(36756003)(66946007)(66476007)(4326008)(6486002)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ORviGm6leSCCIgZTOk5Of8r2sQIVxrNlj9ApbOcJlhOhdVF941p/0UHdYM71?=
 =?us-ascii?Q?S//Bp9izC0F+Eg4jwiDTq/lVglOye42L5FpB5AnVXb7yGHXjNKF2bH1wIIOa?=
 =?us-ascii?Q?hVyvECG+SYxJkXL3p8WIJLDBPwQYHzo93IqpgBxtSEz/8M+QxwOrsqo3RAhZ?=
 =?us-ascii?Q?+vSptaIdxRWZnYpQmpHDDeXWPgNRQTkAEeVYLQSMdOYyhEfSR+oCdBD0M1x5?=
 =?us-ascii?Q?a0en5J+zfUsHgp2F8eKXuusyuE3E5ZALiRV6SzCWD4/H+4YxXJ4d4BbsOhxt?=
 =?us-ascii?Q?JTxNs2b1KYfeG8NR7h/gNO0JpKReWVLhAFRu0v3xIoz8Y34CiPnXweqk3uFW?=
 =?us-ascii?Q?N3+Y6p3q1aiiPA0pXsTe8sK1OUcmxEGW5QZ/bcwicYjzGB935dDjxPvO9kOT?=
 =?us-ascii?Q?Dv6Gq4VZlpKjsqVpTPtdj7cfufFAmuqKZa18YOUk8gHzZ4np7hI7UDYhxZ9L?=
 =?us-ascii?Q?7on7AtFfYypcQZ4UShG67SWq5uYWCAQWY1yZFxTd4qW1SUAyMQ8zE36LOpMj?=
 =?us-ascii?Q?gnIQlkFVOvIDNa7YKhD9sb4ldW7xl8YR87I+ogy4D3vyKQulGMlDj6ZfMC7s?=
 =?us-ascii?Q?k9PaWBKEAzmdEF3VV4YiOzZS2I+k50DCftdXwTRoz3hmAj9HW78onCno6Yj8?=
 =?us-ascii?Q?pXZaiH6uioqPSgitzsaDoGsS2dOB1nUpjFfr++ZCMSZ6AbjF+o5DKeHBh3kg?=
 =?us-ascii?Q?gTGSge1OzpoGdeYn0JaCQaK5Wp8urTGrtikFmOloRO5eWnCY1KPRUSKHdKt9?=
 =?us-ascii?Q?OR49k6EL+J5XzDaPG4+pZpnTBxV/MyLZlb0ojWPQzzvyVceZghjIc/OphXYj?=
 =?us-ascii?Q?u6o4BkuZH4uBpB2NXOMK81Nhru4YKLgdFJzkEO2Fldwj9v4fubE8OxWNE/7S?=
 =?us-ascii?Q?QyoKAcyyum0gZ6KQ7QBCPvad1hAkYyza3obZHNPszCDcyikkQhl+pmfTTgHv?=
 =?us-ascii?Q?jTgGAVMtEBB8bBlYvXl1p9bY3WzFQDZgjDxi0in9FauK9cdMc+1HIvRX/O64?=
 =?us-ascii?Q?Z4Hy9UsyeQ9uTOVnLbWdDUfi0270BRPR9z9ku0wRzDHoHCDa7w0wyvyXq1Nj?=
 =?us-ascii?Q?8jJ4jGieLXq8vtX32BGxGaPQS1Dn7O7Nz79Faz2Y7cyCax4S5IkqL5IX6qZV?=
 =?us-ascii?Q?2r677ny6R5RQwoYouYmFf3+DqqZcswpCCdzbnx4NyBUI4fhGoZnIGRMfO4xF?=
 =?us-ascii?Q?MKPpNYG3R4ddsquGyUU3bdNZiG3t4z1RxCWb8GIK9deuXfsGs0olUNsSa+S9?=
 =?us-ascii?Q?i2FJy3GzydiouV3Lk6WW//Vsxq3JwM3dZMlqlMylxmj15LJnHtZsE9v5bOym?=
 =?us-ascii?Q?PuoN6uOUU3JwAkmKLJGy6aqCV0nlbiWP9lc9D5wLChDUXPycjIoblUtFWoEs?=
 =?us-ascii?Q?GKa1p+K4EUWNGhn0CyGBqzN3jpvsnOCMF6x6ILHcV+2sw6ZsBQgWmiAD/SPN?=
 =?us-ascii?Q?elPaPvE5k4LQRkXv9ZUXxrQX+UwFlsuP1gCBk6jkQHdULLK9vWtnwDVxhqfj?=
 =?us-ascii?Q?vmULr6jgrf8tqYL42DD8VaEGXm5okgWgoZ8Tta32GJew59ZFLTroK2F4zYYT?=
 =?us-ascii?Q?zeCY/RN6COlGn0u1A/i0tQP1uso7Gtogoo92YJPD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ab087a7-6fbd-46f1-fce1-08db80f534c2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:44.5719 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N63Kza7frI9lcXyBkGt0lLh14V1WFqNFjji2m00k+9GcfU9cc1hYL1kpvU5K7tOIxDbADjxovCEOFx9sXw+7Kg==
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

