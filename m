Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0166065496C
	for <lists+dri-devel@lfdr.de>; Fri, 23 Dec 2022 00:38:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F062810E5C3;
	Thu, 22 Dec 2022 23:38:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-DB3-obe.outbound.protection.outlook.com
 (mail-db3eur04on2040.outbound.protection.outlook.com [40.107.6.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87A110E5BF
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Dec 2022 23:38:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VcjN6cPJHJTHlVR3riOmYa0AuJpKtTolXt8EjYOLgumXVjzoQEZNXRCoyHy6i5wgz8Y55P85ejdRw2dYrM3exLPuJOCT4hNu1GzMW9bpJoadNM3gHGtOF8lba8MBIDKVgeIW2POMYCpyBYq/SlSRVTZXPaG17Zf2lAwd+QB3Bt3GdwV/rQkUavTT2jLOGCZLsoR0J5tbb62V4VNnm4iYVLv1umvWyf3IxXjHWGkPZPj5TEwH4OLK1BmgPlIZ92j7PTX50EK1QethImpR985ThsXYo7uoqauv9BEloZWO5/yEa5fPSQmnRJEdvw7AwAL71BRJtS/Rqw9728RrqGEtEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kEBfPTZlgkreP+XuG4W5PTE+mzXKo0XwInNaxx9l5Ug=;
 b=ONOBXbnCTlhWpxClg+2/bJOnbKXAl6Xul99Iicb4E6gweKdaTejgL/rbhQxlONvqxBwW0rjpiUtOU0aBjHkIkUj+PJv88aY4LfoVb2Y2saTYtYE9n7hK+yQAsJAJdR9wcCfP5K/19hvVJzWvyF/3V1Bajbo4m1baMECPFgH+nyMUR2p5qhmPkkyePuEMyQrhq21OVY5UXyS7Rs7ppEO4hxj/i/Cujb5l6BoFYnJNq51zCywg+V32LzJMbZrICJ7ji6diVNjk9oiJ1+aAmYR1OcKieoZf2Imo++ftafEYT6cJlfQgErtFh3KdAdMmr/hGFKwRg5cbi0XtJOaIRmWrYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kEBfPTZlgkreP+XuG4W5PTE+mzXKo0XwInNaxx9l5Ug=;
 b=ZxYIWT8tdIe786tRfASDvM9R1Q3xQE8YVbETgwMcl/Vc7xXDgtb5SNXLBLyOWXxa/0Qy/rKFCdOdMvPb+whCL2WXZwtpxD4lLRRG/MOzxuR+txM49pJt94FH3lO7mtb8g3IdJKswxcIwdPES24yQhMbEZ5Ym2ovjsoAdyNI3x7wx85SpuB8XtUE6bbDJGRK7WOx2FcfLZeJXPh/n3JXmmcPEgFbS0GnorZMrhEFflhKMnRD8drc0y+NHvONqfyEZcmRGMeH4Wrqgvg+CZv8h0GagHupYR8iP4DxLUxWClja5SreVOzRMl33w1BA5h2wFdMfMrWsQABvNn63CXCYPtw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by AS2PR03MB9100.eurprd03.prod.outlook.com (2603:10a6:20b:5fb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.16; Thu, 22 Dec
 2022 23:38:19 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::2b95:1fe4:5d8f:22fb%7]) with mapi id 15.20.5944.013; Thu, 22 Dec 2022
 23:38:19 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/3] iommu/sound: Use component_match_add_of helper
Date: Thu, 22 Dec 2022 18:37:58 -0500
Message-Id: <20221222233759.1934852-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20221222233759.1934852-1-sean.anderson@seco.com>
References: <20221222233759.1934852-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0205.namprd13.prod.outlook.com
 (2603:10b6:208:2be::30) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|AS2PR03MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: 018f03e4-a305-4ac9-25d9-08dae4759b07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EF/GvGH/+mpcc1bpvYt1wkDNG/hy+mNOxiTWq33s3ALuXesewmsFr2yrdP/jD4vwQj70LvpL/Z0t9tHpQXNmR3LfB6zW3GJA7n89kW2mi5Om/myPJxrpQfj54xZVTAaBAgcllC+1t1KqBqvTojw+hxfBJIcCif3pAYJZEQL+YlSEfWTHqzVPxEu2tCvdn8yasLemLeUogW/x5KYZQq1grRrs4a53OgBHpzymffbEc2bpsRQeYzFQIlXE9PyoXs1FPjDrXugB+CdPNnmDsgbKovMolfxieTZlGFQXX7FTetNmacZbkTNcsI7imPyH9pXK78yjnCQ+FG9TCBFIWiBfq0Xi12jTQa1VQPrwiJqYfdq4xjcKOcPPGZM8taiM/2ZoVvLPrRBFsIMcOxOCZ9dBLiqrZshzDMnyPCuaAxG9lR26ZBHKejw5a4GwYERfZTAJ3oTLkc6DYBgXnrexWLPfvrGErADDcSLHcMP2yZKTD+J0MfCieQuayquCEfB54zWuOZwUvh/Csla1RJD6KvSgVR743RmTNRoeqmgZh/Y1EEXrqViBmkEC4lzLSvOb6gidm7IWD7C3na47z8tWX+wUv83VHtLeizJJSoZ67eEspAuhXK/liHWlqB9maDxVj6h8PbelJIWQjVbhoPQWgFIHJ0WTf4Ng6uxdtvOT3fn+gBn9KcZEKcKxSpLqH1uBrvq7EnYkPhmhXJKJLqtSaPMRiQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(396003)(346002)(366004)(376002)(136003)(39850400004)(451199015)(86362001)(36756003)(110136005)(316002)(54906003)(478600001)(38350700002)(52116002)(8936002)(44832011)(41300700001)(2906002)(4326008)(6486002)(66946007)(66556008)(7416002)(6666004)(5660300002)(66476007)(38100700002)(26005)(8676002)(6512007)(83380400001)(6506007)(186003)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C+48QwAXZC5yEi/kr6vKW5Hd3jP2SDHfjOAYX2ARqLwijYLQ/c+jvATQvATV?=
 =?us-ascii?Q?UgJDlPOwJTwUaG5/tWyHr0iGVh2w0ICX9ybdzwmLHVy7SKHOGfvfdNzkCep+?=
 =?us-ascii?Q?vPgnM9Ci+fU2fVaTpx+hXgpyJ2Ik1BMu84sfzWCUtigMhZ3+dY4y5RipbccA?=
 =?us-ascii?Q?QsxK9V838yXtK5nS/xQKznhIXmCgCNkmc/FEK16Bwd/zvjvHyFieYzXjuq/R?=
 =?us-ascii?Q?+f3JmyCAL8sKk/cr1eR+tcce8BxkIt85Qg6l3s85get8b2xtMyh8rI3eaXi9?=
 =?us-ascii?Q?3u8DPbIlXgBUdRBlmjE0lYGmdO7Wp7y0DsoFjp10biIrFMTJbINnuwS4O02S?=
 =?us-ascii?Q?qpzqm3bYsA/X438a0HBj2oZgjIDTQ113vYLfhPnbRs/rPjxW1lwbOi4eVvWd?=
 =?us-ascii?Q?VmcWHoAdmAN1LCC5k62XhSB6mF74gSFy8QNu0iG4RPQKQnFnX9JICLL7KQ8f?=
 =?us-ascii?Q?MQGRQJ7E7l71kw5iaNdaGt0jFBUthp327EO8PHP53IBriXe+3YnKfmveZLK0?=
 =?us-ascii?Q?vCSjB42u4sVuI2VeCEPlnYgtkb/bUABpR4udldVJ94lmOzvyg6NdzqSw02IB?=
 =?us-ascii?Q?h/ZzeMMGBBzM+YwlgaViyDiUKdzrkRrsqiSnOuB4HL9YAoK7SjKgzBQaL9Wl?=
 =?us-ascii?Q?CW07zcMDucOOs6crzbMXT/xmg8KfUUQMk76v2T8y8OYkCCmWdzuFcvdyfS2y?=
 =?us-ascii?Q?Q37IdMn1aW0W4ILpskPFyoKa4VBH660uaEY0DV/V53xBwsVKPRVIlI3Qc+D3?=
 =?us-ascii?Q?3nOHOSmEgOdt5JWwmTC8BHLHD5ZSG4esya1Vj8WVOFIYklQdN10puutnrHP5?=
 =?us-ascii?Q?oR96LRTORskYcUm91055mf1qkRv5AaFeW0Zhrke8YF7g8jUxW4DimN/rITzs?=
 =?us-ascii?Q?yR3CVYUgyAMQc8yzCs+fejJlGA5evXo3xRVdDSNhxRI4PD3Xvzm8jCR0bWxx?=
 =?us-ascii?Q?JJi2GOE7JWyKzWFbJ4DB27iLMnJ8CB/xePa8bUg85wbRhiksPK5YVZ9ocPpb?=
 =?us-ascii?Q?TcX1A03chZK4WQ0sIIEiK4bn1Tq3yTkwH2cvx0HK7KBT0O9lDz9ur7a6pQvt?=
 =?us-ascii?Q?Jzf5TNCcXiYc4JjIs1N573lSpyWqrF75dwlliRgcMzhzGYGbRuBpr9Men2AZ?=
 =?us-ascii?Q?7ywxc4m6CupMvMp7lR4Fn9C5JADslG5+lhx1BmkCTT2dPT4e0+6DG1w8uLLd?=
 =?us-ascii?Q?iapz7rMXysfrqCdVWP9G4K8GncO4HIRGO23PI/BQE/g92NQlFkc073gJbJey?=
 =?us-ascii?Q?D/EPl1DzsyjVbqbr1/ttRPXy+CBpFzue5Q2i0UbOSNbV+1+4vohB0IlKqq0e?=
 =?us-ascii?Q?FLKLUW4jWdZNFMs4/yS4EtWDISy5ahWNETNOh8qtRTzMaucZhs7lMP63L9RH?=
 =?us-ascii?Q?toi/UPT4+qnBWbMyD1rZIggjy6F6Si1qSicBnyHOLRbCk5kRR0Segv+cv7yZ?=
 =?us-ascii?Q?M47/aXUWlD4n6o+FwFIvuFzO5x6rEDDvKfFOye4OJoy4pEejWr4C8pGA7iNf?=
 =?us-ascii?Q?oB3Itdv/j/WXabrvJjoUVtF8Z6R6BusZ/il/yxm02fqJ7bJFFE83xfQFOYN0?=
 =?us-ascii?Q?Z+ryacsvnX0QfUOMW3z4FztNEfeNoXViJWFcauJRQHgnyzNnOZK51NPqiiIg?=
 =?us-ascii?Q?TQ=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 018f03e4-a305-4ac9-25d9-08dae4759b07
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2022 23:38:19.0662 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6KSwa0DgHjRRJSl/fupxp2pWp/sBt+YZVyTw68BWlejvQiIUOr0MuPL3zt9Y6kiU6EIEh/Jy9IvQ7+wsLqxE7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR03MB9100
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
Cc: alsa-devel@alsa-project.org, Sean Anderson <sean.anderson@seco.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Takashi Iwai <tiwai@suse.com>, Liam Girdwood <lgirdwood@gmail.com>,
 linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
 Mark Brown <broonie@kernel.org>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
 Robin Murphy <robin.murphy@arm.com>, Yong Wu <yong.wu@mediatek.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert users of component_match_add_release with component_release_of
and component_compare_of to component_match_add_of.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
Acked-by: Mark Brown <broonie@kernel.org>
---

Changes in v2:
- Split off from helper addition

 drivers/iommu/mtk_iommu.c    | 3 +--
 drivers/iommu/mtk_iommu_v1.c | 3 +--
 sound/soc/codecs/wcd938x.c   | 6 ++----
 3 files changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index 2ab2ecfe01f8..483b7a9e4410 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1079,8 +1079,7 @@ static int mtk_iommu_mm_dts_parse(struct device *dev, struct component_match **m
 		}
 		data->larb_imu[id].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, match, component_release_of,
-					    component_compare_of, larbnode);
+		component_match_add_of(dev, match, larbnode);
 	}
 
 	/* Get smi-(sub)-common dev from the last larb. */
diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 6e0e65831eb7..fb09ed6bf550 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -672,8 +672,7 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[i].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, &match, component_release_of,
-					    component_compare_of, larbnode);
+		component_match_add_of(dev, &match, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index aca06a4026f3..2f8444e54083 100644
--- a/sound/soc/codecs/wcd938x.c
+++ b/sound/soc/codecs/wcd938x.c
@@ -4474,8 +4474,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 	}
 
 	of_node_get(wcd938x->rxnode);
-	component_match_add_release(dev, matchptr, component_release_of,
-				    component_compare_of, wcd938x->rxnode);
+	component_match_add_of(dev, matchptr, wcd938x->rxnode);
 
 	wcd938x->txnode = of_parse_phandle(np, "qcom,tx-device", 0);
 	if (!wcd938x->txnode) {
@@ -4483,8 +4482,7 @@ static int wcd938x_add_slave_components(struct wcd938x_priv *wcd938x,
 		return -ENODEV;
 	}
 	of_node_get(wcd938x->txnode);
-	component_match_add_release(dev, matchptr, component_release_of,
-				    component_compare_of, wcd938x->txnode);
+	component_match_add_of(dev, matchptr, wcd938x->txnode);
 	return 0;
 }
 
-- 
2.35.1.1320.gc452695387.dirty

