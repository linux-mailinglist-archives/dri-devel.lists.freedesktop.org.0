Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AB0591D621
	for <lists+dri-devel@lfdr.de>; Mon,  1 Jul 2024 04:32:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7EF10E2D1;
	Mon,  1 Jul 2024 02:32:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=renesas.com header.i=@renesas.com header.b="CVFkWOKU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from JPN01-TYC-obe.outbound.protection.outlook.com
 (mail-tycjpn01on2048.outbound.protection.outlook.com [40.107.114.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2419E10E2D2
 for <dri-devel@lists.freedesktop.org>; Mon,  1 Jul 2024 02:32:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XP7jzcrF0y+YWFt2PkxriwlVrkfDUfTRIn7tUO3KsgXt0GJRLTjRK5Xz1LttHu/uJcKRj+vAPCN5mZK9qFR2vNhBu2eBKRiasUYVlb0rcL96U3MMj+fFLenwe+INgHXijtBWtzAtMqMW+Jl7X9dRV7O5+SwoQeOcUn+9Z47fuxil6sckv8mJL39RAPTF2RdEGT1xzGJn8VR5ISvZ7WXRWuuUkeXWoH5lwW1ZkKngy8S/fYpyFonczXNtnxOK7LXcmjcUChO7h2WzfxGTEM5dPemMUhZJL+E0pzKGwQvTg9dLH9FkwhtIYYMePyloXHj8pygCOsEQvVlm0afUTbiQ5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TDYtQKJOJc+EDlCZzEvwK/6q2HUOMib2w9uKHniF1j8=;
 b=DAlw3Wm4k71aewkxueIR15IVkqS/jrVBJgk6SrZ7G1wMHIPVxzNBbeyHq7TG4GebUapP38UYomyDIqt+sUn8CPttz0EN2JQj4iW5Jg5nqtTQGelFlPN13eZRxnRAD1XTMNJ6dhECcrAhZVr+XmRLTJ5xB8i2DHTqA7ckc6tEyWku8MvkeB9pJuBhwcq1JLmEIHdb9l6RJN/fso/DPL7YfgQcXCfhNC3gR/ZaLN/ZUe8nVdugNOSEfjeWw1dbZFfGet4xp4/78e5zBJk+CjM8fu25p9TKUauzdxJU2I/hxpsf0M1VSNXoQ/WAUSbMgh424WQc3YdkClWx1JdLl6Vg+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=renesas.com; dmarc=pass action=none header.from=renesas.com;
 dkim=pass header.d=renesas.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TDYtQKJOJc+EDlCZzEvwK/6q2HUOMib2w9uKHniF1j8=;
 b=CVFkWOKU3N/IxUFqLRsJ4vLmKhejlJxhgarQJoeXqXSVzQyktRfZfF0+Y3f298STIrnR1mOUZ4oF+n3lARKc7ctK17ut4+7gA1b9CAWnyRltYHuFtZ5OqMOZhGDdRs4yPU5iG9jFSIPtzgBs8g0vEdlnaPvUo4Y1pwnLZWBW7GM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=renesas.com;
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11) by TY3PR01MB9730.jpnprd01.prod.outlook.com
 (2603:1096:400:22e::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.29; Mon, 1 Jul
 2024 02:32:42 +0000
Received: from TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11]) by TYCPR01MB10914.jpnprd01.prod.outlook.com
 ([fe80::c568:1028:2fd1:6e11%5]) with mapi id 15.20.7719.029; Mon, 1 Jul 2024
 02:32:42 +0000
Message-ID: <877ce59705.wl-kuninori.morimoto.gx@renesas.com>
From: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [PATCH v5 4/7] media: platform: microchip: use
 for_each_endpoint_of_node()
To: "Lad,  Prabhakar" <prabhakar.csengg@gmail.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Eugen Hristev <eugen.hristev@collabora.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Michal Simek <michal.simek@amd.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
 coresight@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
 linux-rpi-kernel@lists.infradead.org, linux-staging@lists.linux.dev
In-Reply-To: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
References: <87cynx971l.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=US-ASCII
Date: Mon, 1 Jul 2024 02:32:42 +0000
X-ClientProxiedBy: TYAPR01CA0021.jpnprd01.prod.outlook.com (2603:1096:404::33)
 To TYCPR01MB10914.jpnprd01.prod.outlook.com
 (2603:1096:400:3a9::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYCPR01MB10914:EE_|TY3PR01MB9730:EE_
X-MS-Office365-Filtering-Correlation-Id: b4b5d8b3-f0a2-454f-120d-08dc99761599
X-LD-Processed: 53d82571-da19-47e4-9cb4-625a166a4a2a,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|7416014|1800799024|366016|921020|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+smDaZwwrq/3sKCp+/M+nu1y+Ts/R/mHI9b1mxU/T3v2tDgXTwHpuEkBpasT?=
 =?us-ascii?Q?M2g87bk5AM6pPmO6J2c4nrv4xJGCP/MkCMmFoNdGpyG2/hPEfz3V4Fx/vHLa?=
 =?us-ascii?Q?NJFoMIwFEOXBA4ppROcOr06+d2A6mBr/AxQPfaRHThgQHRJmsnESrgTVvoTB?=
 =?us-ascii?Q?OQFDpbJZpTbCg6uckDuK86TO3t9yEX/+DgGMrCIoO3ZPJWfhfx013ag88r0V?=
 =?us-ascii?Q?Q5v985dB3A+z9fRcMqzF5+SWj6F42vCml5E/msIasdub3SV5l9R5uGO4v+Te?=
 =?us-ascii?Q?QRyEg7Ne+Q6iLSHca4wYt7gyU/rVbP7n72qNzWXVBgTBKFBe6yv4OO/gGF81?=
 =?us-ascii?Q?EVP2IIYkzunYTXGwbQD2fmodCFYWVGHY/ZGSEyLrPqk+NwQ9oK/S7XHfyild?=
 =?us-ascii?Q?f/Fxg+h+N/sVUJUIXC3HBLszJV33BJxaELTWfKtVKYPzneO1K0ftsOERoVZB?=
 =?us-ascii?Q?qdiKId2xE2AIS7LElSYQSUxdrSDvGArYrNBJ0SPHzvQ1efB6i7sqiqRtNyOI?=
 =?us-ascii?Q?Z0OcNSrpheaZq7fBAsK0d8fpEcs6XHahd4J5yDcz2jJRoLD3rIuq5+Rxdt2S?=
 =?us-ascii?Q?E9ZyL/EukWqapJ5FD+04guKFWJYR+4P+Jy5mpyA06HFOE+Vo9n2Dt1NkuUXU?=
 =?us-ascii?Q?f/0EuuzuUzkQngG2mJDpuWfFk2BMgFzZVqdJvanxmbPjH6mWsEVtVHYP5cpb?=
 =?us-ascii?Q?VhQGNCj7hZl4z7k6RKSk2vU8I2ajfGMvYrQDP7V5AqWklkMsLlUbR2PKlpcs?=
 =?us-ascii?Q?hCd4WnxUOsPUtlCGKxOhww6QHFsUXfjcikzw84hhycBYsgquBHFxWovGp+8w?=
 =?us-ascii?Q?oj3RJ1W5WKl6Nx9MQ+AlxdX9a4kaSmBmMIer5ln24PVn6Rcyretmx9D2K78f?=
 =?us-ascii?Q?tEM1U+W3bfSwxkGQBRyhryh/H8HRAFnwnEOkgVOgUlk0rY2c0BWON+6sEhBS?=
 =?us-ascii?Q?EcTWePhF0cHj7f2QuOdJe3u6YkOsuMpvULHWc2r/5CTo+QhVEPMRK3gYkgyZ?=
 =?us-ascii?Q?khuMg5CveNIVIn2R6om7jS+KSqegaBy3b7HvqT61clsg3du/KDQa05rExi7K?=
 =?us-ascii?Q?MJCGxE7VH1dz57qVMZSE0SuWD7EFeX4RpK7X06nC8zPtI/yg1IYKHlISVDD3?=
 =?us-ascii?Q?59sahNXtK2XOuV+FY3IEE1w0cLxeuEce1Yv6RtajePE+18BBG+pS7NstLidN?=
 =?us-ascii?Q?d2zYRtcESZrcqKYJD0oxpa+JM75SoKudxFKYxVhxdDCjhShr6O6QbO5dUqnn?=
 =?us-ascii?Q?+hQjnnCPbRZB8sSfuoWXY0/JMBSEQLf6oqzysRpxiwJsqV+H5A916g7QjKOc?=
 =?us-ascii?Q?+eVdSn98G9Wsv1CB3LBY5Vaz6PHSOOfzbCoBjx0AILdfJ1DA7TbtU/FWCMVI?=
 =?us-ascii?Q?iIFnoPeDU48cozC0gwvANg5GOes7hgwrkB6LrIZsR/jwRoNi5n/K4DAgvf4+?=
 =?us-ascii?Q?PiFU2LSpCsU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYCPR01MB10914.jpnprd01.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(366016)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RoiObshygGhjiKFYlrtFaVmXNsC9mSMWtCYccZgLkhriHk9PI2YeuO5RzryB?=
 =?us-ascii?Q?eBFSbeTOwjotFmXY3eiqYEcNa9YUqZyS6vD0nk6+g3Joeu/8bd9Ai8ie2iv+?=
 =?us-ascii?Q?KqXtZu6FJ9OASuri3VOgPZc6qpgFmJ54bOU78Whz2CfyGzkQSkiOHgRGxNSC?=
 =?us-ascii?Q?MHCspkr0t71jrvwmX20GO5Q80PVWiGPUilwF2DWw2W3skryKRUzXIXRrmYUv?=
 =?us-ascii?Q?xHWUciX7k8dAG5h/eLrDsWQemK7zjuM/sjRTAHzrk3YwqX66E9Jv2iH6a7Yw?=
 =?us-ascii?Q?N5LtNEX7w+0FZhkwJJTUc/9G+XJggOMkn0aPBIKK1c2VcozsOUcqc09prdIZ?=
 =?us-ascii?Q?jT6tMvt0ACyvtKxczuGyLYnHmeVPVV/85eDM552jU2K7uXqXYanZocjPSgUx?=
 =?us-ascii?Q?j9BHt2ihonIEHCB9Y/w4z5rTkycYcd6FRy54XHEDc0vpQ9FmSJ6bHMSez6AM?=
 =?us-ascii?Q?p47soWPvYb4RMBkBPPv7j6c2E2RBreVnKtW54EWmpx1t7DkSrAZessruoUjJ?=
 =?us-ascii?Q?hjzHNXec85LqQJoRuNNptp/oTABW+J5dxqtUiiCFByNxm+3eB375xY1VX9qH?=
 =?us-ascii?Q?UDWl5GxsvBZThEiJAPueux4MwdTTjZKQT3wepXihLTF6arHUovBCxGcqXykb?=
 =?us-ascii?Q?UQPqepCCDxTJvzd21xKuCaeJAuHir/TerrKj0KpFw/xT2CagIUL0bdx8tdfa?=
 =?us-ascii?Q?GJZ0RV1PmgJLZKPbaDun2FVVwRSmgYQvPf+3saMfVug8D2Ki3XuExRfhpulC?=
 =?us-ascii?Q?xRx1VqJT96GyoqiJlSiJwpwvG/8vMH5COuasp2qCjXdspXH2l7BtsBV1Gw+1?=
 =?us-ascii?Q?h/WdxWCPhMTy8Osa4xkBvq1CgdqFN0gLARoVeMcakR6AQ6F26I0+gZfYTH2O?=
 =?us-ascii?Q?nIH71R0kzOZkyz/GT4Suou03/PK7e5kDFidkxCMNMO35tv82/u8henlwQwhA?=
 =?us-ascii?Q?NikuXgCWcdo91vMqpUtCx8+ATTXHcEqY0OkAJNbU2z+SKdQ/vEnPm07hivL8?=
 =?us-ascii?Q?v+GzBn2Yh2gQ7UQCk6Ms1wv0V0twIIj8MWaIwWXivnt8Ge9E3LnirwA1VbDr?=
 =?us-ascii?Q?lo8R62pWwVZS2d6HLeD62aNnng2NYSADo0wfaV2KDoxUtoFfjmgv6Tv3+2J4?=
 =?us-ascii?Q?cMaBOeI1uE7TSo7RYyLuqwb98GIhXw38mG7iuR77jP2t5CQCeA/Btn1MK7O1?=
 =?us-ascii?Q?n1rS9Ia1pBnVhD+QkJRmvvlVudrF6nAJPlqPGTZRrsK9F1uawtn+Dd8falPx?=
 =?us-ascii?Q?ReBOyVTx7vLStMr6HPBZagS0u9E6tEzPfjdUUxe2oMI1FaPEBTa4rTc5e6Ds?=
 =?us-ascii?Q?TBql8PtWLdw+pdiqSZA3GJ+1UsoBjOSF89C1ng9khNMM1eQVNEw99Z8gbxn2?=
 =?us-ascii?Q?Rq5rVPKFXeHBH5VnD52CQfK4zfboDsDZg9jCTsSATp9XfGne87e1s/skYFlN?=
 =?us-ascii?Q?0w9qDsWLtvs6J9gkHO09mn5+hj5JDWC9Dw+8eRkbogJIGjlTC9RURIt8qInc?=
 =?us-ascii?Q?OFpiZmgyosXWcKW+2u2GD4ADvq6wzdWN22lfTt05h+D61Iw3Jgpv+/g4AByI?=
 =?us-ascii?Q?53rVDaY8Z6WP3ZIgejprd/S1Nq49GnYemC5OTfZn+/h+N35P6MsONWhCE6tN?=
 =?us-ascii?Q?7Q1LKnAhI5r2F3v+PX0V6n4=3D?=
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b4b5d8b3-f0a2-454f-120d-08dc99761599
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB10914.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2024 02:32:42.8261 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ZIaKOSk9LS822DFhTXzvCh/VgYOTSlpu89amdIMvlflFDla7VIjmOyEpgUQ3l+Tfd4vNJBkfMT8k7qNytLYIuz3kbBaER2XxlE4uPd3OL2hvfYFmo/8yU+/XYZdd8q2
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY3PR01MB9730
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

We already have for_each_endpoint_of_node(), don't use
of_graph_get_next_endpoint() directly. Replace it.

Signed-off-by: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
---
 .../microchip/microchip-sama5d2-isc.c         | 21 +++++++------------
 .../microchip/microchip-sama7g5-isc.c         | 21 +++++++------------
 2 files changed, 16 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/microchip/microchip-sama5d2-isc.c b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
index 5ac149cf3647..60b6d922d764 100644
--- a/drivers/media/platform/microchip/microchip-sama5d2-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama5d2-isc.c
@@ -353,33 +353,29 @@ static const u32 isc_sama5d2_gamma_table[][GAMMA_ENTRIES] = {
 static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -400,9 +396,8 @@ static int isc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_isc_probe(struct platform_device *pdev)
diff --git a/drivers/media/platform/microchip/microchip-sama7g5-isc.c b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
index 73445f33d26b..e97abe3e35af 100644
--- a/drivers/media/platform/microchip/microchip-sama7g5-isc.c
+++ b/drivers/media/platform/microchip/microchip-sama7g5-isc.c
@@ -336,36 +336,32 @@ static const u32 isc_sama7g5_gamma_table[][GAMMA_ENTRIES] = {
 static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 {
 	struct device_node *np = dev->of_node;
-	struct device_node *epn = NULL;
+	struct device_node *epn;
 	struct isc_subdev_entity *subdev_entity;
 	unsigned int flags;
-	int ret;
 	bool mipi_mode;
 
 	INIT_LIST_HEAD(&isc->subdev_entities);
 
 	mipi_mode = of_property_read_bool(np, "microchip,mipi-mode");
 
-	while (1) {
+	for_each_endpoint_of_node(np, epn) {
 		struct v4l2_fwnode_endpoint v4l2_epn = { .bus_type = 0 };
-
-		epn = of_graph_get_next_endpoint(np, epn);
-		if (!epn)
-			return 0;
+		int ret;
 
 		ret = v4l2_fwnode_endpoint_parse(of_fwnode_handle(epn),
 						 &v4l2_epn);
 		if (ret) {
-			ret = -EINVAL;
+			of_node_put(epn);
 			dev_err(dev, "Could not parse the endpoint\n");
-			break;
+			return -EINVAL;
 		}
 
 		subdev_entity = devm_kzalloc(dev, sizeof(*subdev_entity),
 					     GFP_KERNEL);
 		if (!subdev_entity) {
-			ret = -ENOMEM;
-			break;
+			of_node_put(epn);
+			return -ENOMEM;
 		}
 		subdev_entity->epn = epn;
 
@@ -389,9 +385,8 @@ static int xisc_parse_dt(struct device *dev, struct isc_device *isc)
 
 		list_add_tail(&subdev_entity->list, &isc->subdev_entities);
 	}
-	of_node_put(epn);
 
-	return ret;
+	return 0;
 }
 
 static int microchip_xisc_probe(struct platform_device *pdev)
-- 
2.43.0

