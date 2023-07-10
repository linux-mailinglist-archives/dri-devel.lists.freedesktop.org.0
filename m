Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6664174CA5F
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jul 2023 05:24:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3223D10E0B1;
	Mon, 10 Jul 2023 03:24:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from APC01-PSA-obe.outbound.protection.outlook.com
 (mail-psaapc01on20701.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:feae::701])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 533A010E0B1
 for <dri-devel@lists.freedesktop.org>; Mon, 10 Jul 2023 03:24:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UDH4EPMUcp8HWhe8SszUgpQwifY/ps4X3oj7yVPclLMRllJY8coKMw/eyhf1WqQXgJXAoLBqNhR3nHEpPFTzeHdXcpflQjX0o0vfJDiKc7bTAmQYCjE3wdjBGDloY5/TaraGvGrl97FliLYstHBlwnxi0d0oi3bUrZqyiMX6b1GvB18JSsN1rEc9km9ydGUH0X6c0lOgRtdJccASxmkWtdz7UpTQ06glnAJuSkEgk9VyzM64ZmaC31csEU0l2fYv/UqAZQbtbZVr8KDD9f1lZjANS+OJxQXP6zJe39e0BoPbzBdKxleQP7Rx65QXFb9rcQkjDNdup892PUixZtQcxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+ubNA55ot4g9uV8DnDaa0Wk8oto8gA0f3+jKufnOzYg=;
 b=ivHI6/sk1Cd835jJE/ldAPR7G9FwlECF4kYR9FSAPc65KOzU2egSvzNxkWZ3ePEUdmzo4M1fwdz6e1Bwjjubr6XL7BESnKDp3xZBQcqFkr46nSYlGE4JwsTiEf/ULQPnJlj7/rzG2U/vNXmzI96x0GKv8Oy4JJByRpwX8xRQgymXleIMu7+q2gUM2c846eoHbDE58kNDqFXi+wc+0rbNmOKl2840r9yAsLtFOwtJZiSXH2kM0B0GD5Wf/TqIqIO7QQ+JoJW/mOcWaIpIRzzYbRDmqPm99uex/1QDc7uMqZFIXeOvUvrASAgOGI8mRU9WV+dWrMiVqH6NweFaISuiAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+ubNA55ot4g9uV8DnDaa0Wk8oto8gA0f3+jKufnOzYg=;
 b=i12DTCZt1+eZqzaZ1CfMyZCJ6xWI+b1+kuNuvkJ+dTHMtJVrF1+DDC72PKUPhw3YzrYBBJu8PHZghT3i+m1QmXcNsNkgu6RXO4Y9hwhiePQkf6mYPiPfu07XJgNbJv7v1Vqqh0IGxklOtxy+Tqj/YiNpJ1wH2HTWSJhlLhtW6YrOS/6O9Nzi0oLpuUegzJWrkvqZt5EpNba76YZWb2pvSz1aCVCM30Og5ArRmLba8N8HtZ1yaNeUqhi8+sVppEB+pg6NAlN7geHG/D9Dpd2lcbVH+/cRGW+qFH6rXxPKPnnH26e3moHGyQWZedpwcSg8zF4ksLLsjlg0ct5Mi2j0FQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4488.apcprd06.prod.outlook.com (2603:1096:301:81::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6565.30; Mon, 10 Jul
 2023 03:24:10 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::fa0e:6c06:7474:285c%5]) with mapi id 15.20.6565.028; Mon, 10 Jul 2023
 03:24:10 +0000
From: Yangtao Li <frank.li@vivo.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 01/19] drm/renesas: Convert to
 devm_platform_ioremap_resource()
Date: Mon, 10 Jul 2023 11:23:37 +0800
Message-Id: <20230710032355.72914-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0020.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::32)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4488:EE_
X-MS-Office365-Filtering-Correlation-Id: dc53c45c-1e74-4db1-d679-08db80f52059
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7k2C6znyJX4BfwjAVlocYqDfoZkP3lj1dMohYqvFZ1i/zS+EEEfB0y5aK4uuBxoR0pnXd3+hsIzAVc/em055RUOY2ERsUTUv8w7BU7oVScvDy0eZqUL3IAeQtKiLyoLGWhnVl6AwbeV6E7zqapjSpHbjIlJf9ZLdwdaD5fuhU0ruDRKTDRTnzQ7jJahLHMe9fmAi6dtzAzWFg2Bzt89Xs7O2zrA+yf4HgWsFBjhKNcQms/oHi54z3EV1V8FgsdcmKIjBuFwjlD9Esw5BGIqSdJYipQi2sVJ/0/IUt4LrzI0B6XxnUoPoJKhNrQezIHlY3QHYAbxQKuR2yfW5NzzpBlv6Lyusf9/rG/L+IoKB5CfGoIqDPK6mQXDuYav4WHj/duPeS6PkzONYYrApYZrCeyNVMRETI0T4AdoTw/V0SM2I/YnfkqwchiCS1mBEtQvUBU1eQ/HDyaRd3PweUclX4fTI0gnDbZJZ4rPciRi7SiZF4Ht//qYpGhJjYBiVE9WvaxLSWPfWaDzCkyOU9hCS54zMs6/ST6cbL7lcrjvVlgy6uOZFgG8Kp3t/2Bxhze7viDdtept9nXVk6z7Ra8IfiSYwMWAFesk0foIgGVqm2Wn4xEeq3I7lMwYsivj1QFMa
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(376002)(366004)(396003)(39850400004)(451199021)(186003)(6506007)(26005)(2616005)(6512007)(1076003)(83380400001)(41300700001)(4326008)(2906002)(66556008)(316002)(5660300002)(8676002)(8936002)(66476007)(478600001)(66946007)(6486002)(52116002)(6666004)(110136005)(54906003)(36756003)(86362001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yDGp9p5EijFC6ppkzcVD+TsDK7RaGZDGDgkuNiEnEiIrgwEXSCEtRteNyetq?=
 =?us-ascii?Q?QImExoWX3lr9zpXz95ebM8Vp3xyPa6ClUgF+uvqk+jLYdqGbcyorZJiJ7MLW?=
 =?us-ascii?Q?xjJGIQi9VJ0kwBY98m1pZ1bUfJGeBidt8OV9Ltx92VOoH5omlYqizWFVXCh9?=
 =?us-ascii?Q?h43LbVklUfV2Tr2B/Z4knLw55uGVnCLM1rnsxS2F4pQ5jUWlvHTQNx3XMRWk?=
 =?us-ascii?Q?pfS8lGkJU69OC2Wtogt7B6+EfxLcFZMVpFrII/ChhzLzpd8uAtNj6/XPfvEO?=
 =?us-ascii?Q?kOGgF/muN6MAXhJBm7hIJpknHnEsv5gygVil7e0AgzllmRFtL8CL6O7ovxBV?=
 =?us-ascii?Q?TrizycCPEmgH5wm5IJy0tIgzysQhb7+EGuvd/GS9vXVYcpZ4NA290GKJBnwQ?=
 =?us-ascii?Q?a02NJBR5EEYM2oFDdiGJP+dUOF3wdzBqAbctruhOAXdUw/1I1kJRh0S6TZgc?=
 =?us-ascii?Q?EecrEvrQ6XwWWX3PfSpj9aS0zec7W8axsABXrGX395zot52jNsO0xCPOG4ID?=
 =?us-ascii?Q?QMLfWnSPUbZvYWccuqs0I5V6PNG1VbWdf79nTznIRadR6OaCln2s6WJyUURb?=
 =?us-ascii?Q?JWDVTPLIKQPXl5bG5FBp46cP3ucUFpqOs0MDwy3XjORvNmMQgeA87yPDFhma?=
 =?us-ascii?Q?MnMsD17em0/lZJ1pwGxOTYblxU6U62i3ry/QP/7Pmkt4JDycaIdh9QqXYoN7?=
 =?us-ascii?Q?wP1po8F/SUfqvD4r8mJ/+h85+wc3VoTICRYsh9Hi25EpmAJQW3pt3DB+X+Gg?=
 =?us-ascii?Q?AgN035g4klQaMgO7vYU4iUBCMdmI7RW/+dEpr07cOX/rTLVtD+1rvi5yxFf2?=
 =?us-ascii?Q?7sBOa6sGqdgJVdV7AON/En+pRQA/GOUWbtt4B2zIx5dpdSHLOFygRP72F0mT?=
 =?us-ascii?Q?HMTEzQxlf3xntpL9mHNGICECTnI1pdmEUcsl8uir9nCBXwZforKTv79/hTKa?=
 =?us-ascii?Q?KMCkXNH0MK9MGT4j4f/d0Pce7dqYJuhP5YrUROA22FUHkdqLFqQHd8XAIto9?=
 =?us-ascii?Q?9O8eiii3IUMDxxOjdSIIuwFcmC6Ti3vMSAOclkX1/weEdzpNCjnrxMw/TQLk?=
 =?us-ascii?Q?nIcbF6iG4Yc31f+9pUfaze9NtwBIcMOcr31n9jsunt5L380/MT0zPyAbq6iN?=
 =?us-ascii?Q?FgO9LtQR3oiJ2m7gNt9Xoa4A2iI44LV+abTM+dgXypzq46D3F7nUyxBW/d3Q?=
 =?us-ascii?Q?4UJT73o1f2Ce6bCuI95tcQfKimMxxo4ly64AWDssE5yGK5+sdKKr4JELSLDM?=
 =?us-ascii?Q?xofWizmV5MWEEQVQCkLSlatodGnwzww59arFboFtDRNhnrP+le3rtfnHsk6G?=
 =?us-ascii?Q?j4h9aEFuVQfUn1Rek4qcGf275EsqNH7MZf27kCt1rBpryj8PAIGYGSmbsFJJ?=
 =?us-ascii?Q?PJVH5DZoBZMsFhHazEmEJVxAo2DUBY8/Vk+fRwr1aqICtBcO2xDV8yhCAjfn?=
 =?us-ascii?Q?NiHl/w6XPR10RydW6HaojS2WCmB1WW4D6qLU+A2oaSX1/MnqM4eeOHL3J6wC?=
 =?us-ascii?Q?3QepGhpPyR/d6MaVSqQOkuVZA+O5VB2qGO+T3U44sfXq5dbgDJGq+Am12jvJ?=
 =?us-ascii?Q?WJcHkeQujLsxDjok8tW7cwku5Vw8g+4QgBkmEv20?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc53c45c-1e74-4db1-d679-08db80f52059
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2023 03:24:10.4239 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C1QWMJieevsbX4JIMAZs0VT5eR+BbZTb5qzd2RADqVllfyM77FowKi48AZIEMmsBGlM9+VZiU9puAdQueFDZsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4488
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
Cc: linux-renesas-soc@vger.kernel.org,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Yangtao Li <frank.li@vivo.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use devm_platform_ioremap_resource() to simplify code.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
index e10e4d4b89a2..4bf9f5d15fa8 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_mipi_dsi.c
@@ -1002,7 +1002,6 @@ static int rcar_mipi_dsi_get_clocks(struct rcar_mipi_dsi *dsi)
 static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 {
 	struct rcar_mipi_dsi *dsi;
-	struct resource *mem;
 	int ret;
 
 	dsi = devm_kzalloc(&pdev->dev, sizeof(*dsi), GFP_KERNEL);
@@ -1019,8 +1018,7 @@ static int rcar_mipi_dsi_probe(struct platform_device *pdev)
 		return ret;
 
 	/* Acquire resources. */
-	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
-	dsi->mmio = devm_ioremap_resource(dsi->dev, mem);
+	dsi->mmio = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(dsi->mmio))
 		return PTR_ERR(dsi->mmio);
 
-- 
2.39.0

