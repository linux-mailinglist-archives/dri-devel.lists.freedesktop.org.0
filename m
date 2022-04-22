Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFC250B33B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 10:49:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 082C010E27B;
	Fri, 22 Apr 2022 08:49:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2139.outbound.protection.outlook.com [40.107.92.139])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 930DA10E27B
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Apr 2022 08:49:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ki9zSmzGky1iOM87teC0L3LQ2Ci+n147S/AHWbq/OBsHyJtFSTv+JpNMI5zO2aSLX8x/6/y3Bz5gqQccayUMQdSIIGnFzyEjc+PgLb3L7Iz1RYwxxnSwatwSqLHKYuNfT0Si31y/fSBbXNNJXMlZPgx0zG8o3k3J6yLIyIXgs8hWyvjYDrL5FDquByfhxs4DUgNqZ0g/pB7ZnAi2p3hDsOFpw1jVugPSdIKM/iOafxVH1UT3w6z3C+rb0nwEhhGL5m12wfwCjiY40MtVnSUZ4SR9zWclgFcOH3CUgK4F2dGIWmyK2FodlWcDi/R0EbrLxaPZcZ85fo2RDTQ4CvGMzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j1/z3TyVl1mo21smyh1h9BKGDHYODA2+RMSKD5e+mtg=;
 b=aFuZNetoU6KqH1Ke7mym60C54HIQ6FFToR1KqtSvDA3f+83BA7cuiv6FbIr6Mf5qFDV2cRKGD4J7LOb8uYVr9ogeFyph9PgjheLtCnGR92Up+jrX3oGlV2moG+Z5obhgnj2Z49YIfYaTX5fVmfiJBrlOI3hs6foaYfoqZxye8XZqR9BumUrploefUYtjQAjx5xXnAu0Bnf/EgyCXYnYut+vCuZlblcJNyuU95MznKuZzdJjQcZ18wQRqFGZG/Vy8sSMILFiaGKMkCld3WSnanj+zo4M6BGqdJJf/Qaw5MhrQgNV2N/T1eWnTgiGh+ZsNqpmdCjl/Cam4K7H6oXYlJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j1/z3TyVl1mo21smyh1h9BKGDHYODA2+RMSKD5e+mtg=;
 b=kY0vd/NXztaIXavblr3TilbjVHJqN+/aILL4kZfpaFPkaAPCLmudaL0EH9eGmbZrZr/jxg+T5R4Xjk0CJQx8xQHAy78wfX/aNYL82NJh6c41a3Fa5iYTQnGHGetnkX2D2/FgczwV2/FBZbGazI/LWPBSNT0waiW5KRh1myE6RDI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4598.namprd04.prod.outlook.com (2603:10b6:a03:55::29)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 08:49:07 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e9ba:4c90:6e9c:39f%4]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 08:49:07 +0000
From: Xin Ji <xji@analogixsemi.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Xin Ji <xji@analogixsemi.com>
Subject: [PATCH v2 4/4] drm/bridge: anx7625: Use DPI bus type
Date: Fri, 22 Apr 2022 16:47:18 +0800
Message-Id: <20220422084720.959271-4-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422084720.959271-1-xji@analogixsemi.com>
References: <20220422084720.959271-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR04CA0084.apcprd04.prod.outlook.com
 (2603:1096:202:15::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5d5c4547-97ed-42af-1923-08da243cf632
X-MS-TrafficTypeDiagnostic: BYAPR04MB4598:EE_
X-Microsoft-Antispam-PRVS: <BYAPR04MB4598FC37A0800555B6FE524DC7F79@BYAPR04MB4598.namprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5/1eFNouHS4IrCs8IbmRQbDD5bPSVN9R3V/bL75M2u5GqAFs7L1mcQZPNshlS2fJ7N7T/Gv9f7MnSIZecvNp6okgLb0CfDCxQFfbHHfO+fjBl79m6M9RTevMV4EPrEmWngqD53wp7A7VT7Y9uCxEOZ7RAydqavYLFZad2++Poy5Uoh55w4ZAS5yoImuyHbLhboFTO+JwDmSBWUyqhsBASVxJOyk83E1JB1vMMW7jJg5A897xODgyMWbvavHNL1ASujFvrvBPj3LLgAmJm6cXNu6HDYkYEq2Gdo6KdLgahPWMlaTwQR/8+WeCJPFE8an/DwYyLhpVal2nliRVP0NyCTkBfAqNvHu8vmELcr7aBFIAj62xaWTecFhGl3BzbanGrq/6NcjjVyJIiUXfCZjbM5MBSMG4sG+Ea15NelwfvHKrvRFLpW9KookKWNavHybo3gqIOimHPiWRmoISojPw422kUnu5KSPMWBOrJHmC3eIOh4tPOfdClIEN4zSrnM0XLkGpNpAfqC6mEnCliyudRkHL1mB/6JlRYQYmovXPIvOtXW25wjn3FhyHYB/xZWlUM8eBUY6n5osYvMTAIz6VcUrhqh8pMy7aEJrDkMHvr6w/JgcWLbomFao3OxNqcZKZfP7JV+RItdaFUNgfZ/rxh74caFa28lP22gJYINnyZiYIJWr2/JnV1+GcEF9wTJwQBFvQmAQ91b6LgETLznjMtKvqSS4gDO7KZNZaSlvCWHQ4DFDmCPzfIPkLKjFoOeTk
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(366004)(7049001)(2906002)(8936002)(110136005)(7416002)(5660300002)(38350700002)(38100700002)(6506007)(55236004)(508600001)(86362001)(52116002)(6486002)(6512007)(6666004)(36756003)(66556008)(66946007)(66476007)(83380400001)(1076003)(26005)(186003)(4326008)(8676002)(2616005)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0QwktS8UKK46Wt4DImlN/RG6NOqt9MS0/mQhrIdM6A0+HwjeLyhFzEEWSVW4?=
 =?us-ascii?Q?pqTRk9bDev7yefDtkE/0Qx3Tq+rzqyAOBgbEZlvC6M5i/gJ3TYx6vpUl/gGB?=
 =?us-ascii?Q?ulIK4Js4IBHVN4UIc9bkFy94DUnOFTd2qDHgiW0JnavdMO8GShtFwcpJaSb/?=
 =?us-ascii?Q?vhwokTH+vbVezc9haIGDaM+OIW/c4TZ1BJRh2EizKQbySk+IIPv9rFbYhzYK?=
 =?us-ascii?Q?5jpzbo+EOFXEfJQYwJ2ALfE6j7dW8nJevhQ/+FD/p0c2yPQ3Gb/enonXxmHk?=
 =?us-ascii?Q?Bnjo55cxdTFh5tSmnMbZfOXGfuiET9g64a6Evc65PZv1LqJj9TgkA2GILhN4?=
 =?us-ascii?Q?IwW8vSDiaTh0ey2ScnqeoJrW8m6/Tq/rd53J++mTR7T6Y6fV4rYe9/Mj7fiv?=
 =?us-ascii?Q?ErVBZYKkjZQ3aNxOPSArJhqSmC5/XiECfQstP4TlfHHodGj0qskYE0s/Xnwj?=
 =?us-ascii?Q?EEuI3GJS9gDwq+xgA1jzeokhIBTq8lf/dcVqmwROMalBS5Tp028iFpG4ZQ4m?=
 =?us-ascii?Q?D/pafO4xYH7v0n9t/isbDIpxcJsZbeCQyYrQNck5fs/RJ80ufyppqTj1o0sT?=
 =?us-ascii?Q?8zTrQeOHi1v7FovzsQTyXEIw0INar3Jn01rSW431f3gIgMGY94PyVSG/hfvY?=
 =?us-ascii?Q?im7vzQ5SXku4JOcfkMq4in8gJDeNuN79Qu4yucvum6t7N3nuJYjpvbBmwYPN?=
 =?us-ascii?Q?hXSRHeGapMbO0ZAjhRo92SO5y0GHIaqO1KxXShvTzCr5jDUCoGX0EM4eehtl?=
 =?us-ascii?Q?QkcoZs0ElO5ryM1M2nYO64SXVRMZfJDGUAr3/Nn5pwZ0J9i5okDoZ8DEdW5a?=
 =?us-ascii?Q?5+AxZHg//PKxtse/+bpq0eyWAxCHbHkg5wkqgmjp2yPEa0KeX8LmhTkkL1O6?=
 =?us-ascii?Q?1js2U0p1BGCtzfmVre1WwaAMfr3HtbHlwhOPebVm72hyVFSt+X0xBKUhoj57?=
 =?us-ascii?Q?6VbsqDF6nnQEFhhk7YWgz1YHAT7P+xcDUaS48XIiT02pRonxqNFLhKBA1T+s?=
 =?us-ascii?Q?69X2t1/syLtVqZdBUvzNvfok1GVOXAk6z0JDZde7hdtMWPxmag/UudXJxpof?=
 =?us-ascii?Q?SmxrL91vTlrmyqGevwJ3sgir3hycE3syVKyX9V/ZJTdDcaihjKYaKP0zn50i?=
 =?us-ascii?Q?NGaDhkSFyLUwh8W6+E/pAzrqe8Kewsizn9Pq8YfglVDEOxzRyFitI/3rlGY9?=
 =?us-ascii?Q?UIE2DokhWETedQwKmQueX5rERD5eYzY8lp0DKMc5eVYP3QB2ozddiZfJfjPT?=
 =?us-ascii?Q?F5vC3D/0z8vnjYytz82JZ1yR5d0bxgX0juRCxQeUdHZ6EdPuxLZH9VzcrqK5?=
 =?us-ascii?Q?jXVz3242YqkyoG58y49MbabCIoByVhw+vxMph1jHNo6oCTtruScS/28UodWs?=
 =?us-ascii?Q?c1pKAF2yUSbz5MHnriAilXoCMehaUqvUiA5e+CFz4OALxr+NlblC5DfxsVWk?=
 =?us-ascii?Q?dM0xNhFTLigMne9JPfEl5+wiC6/5GWHrZIbXXPXJOZn3NnFPaob9+XRkDtkE?=
 =?us-ascii?Q?+ENnRSbPUxsc1AQwinW+KWEyNxytTGwbmjD8/JcWnyOzkxbpBvIYq64Avl9i?=
 =?us-ascii?Q?yrejmQT6Xr8QgeP6wFkolhKX2GWHSzwkeL9uG6egiXUSTShspsj8zIvfAAZo?=
 =?us-ascii?Q?tYQOrTdTE39VnfTSgXoILNBhd/apt8OzlBV2sE/5kUSbbSiNR0QIcv/8xj0P?=
 =?us-ascii?Q?3B/qEpUdvxE5HORviYhTE+9v6bMgvTxaU1zqkf3ARWbqOGFmJajO490rdw+7?=
 =?us-ascii?Q?cdL8AiDIoQ=3D=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d5c4547-97ed-42af-1923-08da243cf632
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2022 08:49:07.5337 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: owEC14ILyYcfpYJ9sHY0MnE7M15eZBGB69DMFFnax334JTGi5OZxoFcFe51Jpv53OuovUPVeW283neNu5shi/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4598
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
Cc: qwen@analogixsemi.com, bliang@analogixsemi.com,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As V4L2_FWNODE_BUS_TYPE_PARALLEL not properly descript for DPI
interface, this patch use new defined V4L2_FWNODE_BUS_TYPE_DPI for it.

Fixes: fd0310b6fe7d ("drm/bridge: anx7625: add MIPI DPI input feature")
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 376da01243a3..71df977e8f53 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -1623,14 +1623,14 @@ static int anx7625_parse_dt(struct device *dev,
 
 	anx7625_get_swing_setting(dev, pdata);
 
-	pdata->is_dpi = 1; /* default dpi mode */
+	pdata->is_dpi = 0; /* default dsi mode */
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
 		return -ENODEV;
 	}
 
-	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
+	bus_type = 0;
 	mipi_lanes = MAX_LANES_SUPPORT;
 	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
 	if (ep0) {
@@ -1640,8 +1640,8 @@ static int anx7625_parse_dt(struct device *dev,
 		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
 	}
 
-	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
-		pdata->is_dpi = 0;
+	if (bus_type == V4L2_FWNODE_BUS_TYPE_DPI) /* bus type is DPI */
+		pdata->is_dpi = 1;
 
 	pdata->mipi_lanes = mipi_lanes;
 	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
-- 
2.25.1

