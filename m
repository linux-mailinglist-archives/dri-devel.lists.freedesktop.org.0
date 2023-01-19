Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E08A674259
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 20:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 404F110E231;
	Thu, 19 Jan 2023 19:11:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR05-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur05on2067.outbound.protection.outlook.com [40.107.21.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC7EE10E009
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 19:10:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=J3uHezwUvB+IM3Rfkjq2HdCGN9dclx/IHSDhSpwUTK2qpX+F9HmOrcJ7Hen4wdCVms56kjc44ohNtJZFWTP79+kFuEoXmxP1uFzoMpS5TF2fkkW/pUwotWGpbqurr5jX1prp6CAnhMGdXVDdtNFFV2xTBivvjMXMhS+A4A1pmJGXNE25/VhQqMM1/g4MWvfXd2bsxowcN2dCPILx366KoTsKh/AVemC1moWKCQUmlwwmMzVBeW0wOpNqXLVLyKzqx/jtvHk/X3ak7yCTiyMi0ycuCk+ZKLlVqX1TO4s7pDqCJR9DpGMeqiLStQNdyDl4XDPXgriY0SvNduCOHLksEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/ydqbVYoGu1dC2qotGH8QQawBdORCNycD6Idjm6xok=;
 b=iwOodviHt7S8MVsc10Uq7UB8MleCz2SM9qbYcvDnbIBYmy3FX8D1ssZqEO9Nsud5fPIlrnUh4x+awbZfZYbIp03ruLsjBtlkszNhLqD/2B1dd6peN2K5GFK2iQkDeNHmIU9d2R5Xl45A0h5owMHQPRef9vgD3MU3xnsaP0ztolVceuDBqLGeng7Wfe0kUf4ECMp9B7JSZR9KHfssNA8B0odjQUSmHsDStzH8EhDCwQBMf0aC1hRYG9lmOIuHB6EanYNLH/czGvwOfKvz3Se21h1JDOw4eCQZfAGHwfLMHWWNWrJPTJtTsWMVAhk9ReCG0zQ1166ziVnq7hkrDWzheQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/ydqbVYoGu1dC2qotGH8QQawBdORCNycD6Idjm6xok=;
 b=D6CnGq2m5f+OzmVIQDWiBAc/qrxeRqrLVcqYGcna6ywrJ+GVGD3Fkmm3AtY5DySatZMB2oqUAnNxbSSqBlSQZuCTVx4ePeElIHQe74GWRujxJglPrmd852jLfjGL4k+Uup0kAH6TqwvX4h1TFRX1nCNDTdQAIoSzh1MvZfb30Eu9T5wL/zP1cRxODKbz+nKmiY8mI86Yz6UvzmsGpF3ZC9okmG16pViACBxqx4/4gxUL3eZjgDKaZETL9YZzW4YRba1zfzRV5ob4RFPGNMVmIoLWLCzdDs5kC2fwkKtnyfXQbsgc+qE83T3Cv2Sy49ZJaz61sjEEjt/OsVzQXxnR8g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com (2603:10a6:10:3dd::13)
 by DB9PR03MB8259.eurprd03.prod.outlook.com (2603:10a6:10:307::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.19; Thu, 19 Jan
 2023 19:10:57 +0000
Received: from DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166]) by DB9PR03MB8847.eurprd03.prod.outlook.com
 ([fe80::6b03:ac16:24b5:9166%2]) with mapi id 15.20.5986.023; Thu, 19 Jan 2023
 19:10:57 +0000
From: Sean Anderson <sean.anderson@seco.com>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/3] iommu/sound: Use component_match_add_of helper
Date: Thu, 19 Jan 2023 14:10:38 -0500
Message-Id: <20230119191040.1637739-3-sean.anderson@seco.com>
X-Mailer: git-send-email 2.35.1.1320.gc452695387.dirty
In-Reply-To: <20230119191040.1637739-1-sean.anderson@seco.com>
References: <20230119191040.1637739-1-sean.anderson@seco.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0047.namprd02.prod.outlook.com
 (2603:10b6:207:3d::24) To DB9PR03MB8847.eurprd03.prod.outlook.com
 (2603:10a6:10:3dd::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR03MB8847:EE_|DB9PR03MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: f0df6410-229b-42d1-bdb0-08dafa50e51d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jwEJ2HzgHfRobeCKv6OTf6t3Eo6YJ8mm0ivtHPceVdyvpIbN81R5Q5d3JK0tRpEyXepvIGDT03XR5/gTyB4L63nUyakuMjaWYhKOCn7I8RGS5t9rU/Yi0uiCFboQfLO2v+GJK5H9ZKaJSNuWoXelEBmCtYH/g0XR644p2dDxXLSO4seZjjdMI2KwOuYxyUhkYPcN6bfTchChOzEq1+x6EdHL6HKboEwX++FcuL/W0XQyYFu0PCfBtFJ4yStPBu/80TOANJM/j/dW6hacxI+eLHJoNt2SKEhBdiJ5N6Gqg0IcFxJ3DwHKdX3EOcoA8fO7IDkrgaRToqMPZFi/qn3kAzRKfprZjff5oySfiFMuapjwRwdBG2O3btDbYGnWeQu5HVe5n74au0FwaSIj10GJadr7RLLTV8V+OJrIAqv2Z1Zcbq787lPhfsz7A4EjQ3OFH114UAOWH6cOtV53JT4rLv/9oXZSt9bZ5ItMSQW1Ij6GP8wh8zkXswP33+l3GxcDZR7Lpf7xcmMm3SvifTep+z9B9DiMmfRGPKsPQ6GgTblFpBePKUppgRFw3xuSqJ0WiEVCN2l1WNPYUxZdPRkPSjOuWQbSgQadTBWDMfL8tQxWm0ZLYm5dtFs6nxrUcyhnpQOQ6u6LJE2id4O9Zif3NrwpErrbQMeD2qtbG1FZRMqVKoQZzaipCeECuNzFpe8D
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB9PR03MB8847.eurprd03.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(39850400004)(366004)(346002)(136003)(396003)(376002)(451199015)(66556008)(44832011)(5660300002)(8936002)(7416002)(54906003)(41300700001)(2906002)(316002)(66946007)(4326008)(110136005)(8676002)(66476007)(478600001)(38350700002)(6486002)(52116002)(38100700002)(26005)(6512007)(6506007)(36756003)(6666004)(186003)(1076003)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gNF7W/Osnd2lAyHfU34iesACmNRA7yO1rq/lCh/vhiqJQgjekgWb8OM2BvYA?=
 =?us-ascii?Q?Nltu6pJuKWlnLagyxOPc5Ak60YO5OrGOY0m9et3kr7fOD86ZbAqoghDsI6sV?=
 =?us-ascii?Q?8b45NFf6IMLwo0D8GoOOErjCe+W+MaVlv4PAttRtCrfaj/QibVLkQSr2G76Q?=
 =?us-ascii?Q?I73DmSiDBrq6k0CixYj1HuR3tnqJw43a74VrCt4VI9x74Nx8R1zT6ieIWZPa?=
 =?us-ascii?Q?6cWSK7Lh8xl1iDW5JJ9rRgI4ZDXXnh2UBWv3GmB7hUCYzNDmW3X+zx61jjt0?=
 =?us-ascii?Q?bYTq1EVQa3eR6sHxEw4Z/YZ6x1AsORWN6KeplIGPXym9sr24ajdMg9kTQnRk?=
 =?us-ascii?Q?vw7YiHRG8hcJYXmhtNX1FZCXFpIbqgO/+3/FOeWtJoB5Ufk7SppTniwH94MR?=
 =?us-ascii?Q?rBpSp6g2ajrgta8NGPWwBR1qKhuDPerKsOnUnxO+TeX0CkcV01U0rAE5q1Q6?=
 =?us-ascii?Q?dbH3TAN+K14D38uQicR/DTeDbrsFneV4R3CMbBnLjmv0Ywk2ZGNirFbQ/6Nd?=
 =?us-ascii?Q?6oehfwa6B7TpzwoVkZt8fzZ0GDBOZjBu3FjMKTdVCLM/dhfB8PYec3Ui55fR?=
 =?us-ascii?Q?SEBvmlFdcrvNpp8qKTFZqeHa8fIEu6H5d0hYpYUq1oZk7oR0KjVRBWXhB0J0?=
 =?us-ascii?Q?YfPoiXt6+vG2tovWQQ8a1qdVeOQldsgnV7NTeJ5445bmM1UUKBQd2LXvFpQz?=
 =?us-ascii?Q?F4I7PBd6fhxEt95mrsyeGsz5sdlmGRg1n+QT3m5I19347nlB7IyzMnmpi8CF?=
 =?us-ascii?Q?bOcOpr7M3rrSq3o59NMzFJK2HVR7prJIppx1I4bixPX5vYpsYF62KmDIK1Ln?=
 =?us-ascii?Q?qncCicY6WMPNxw3CgOgT3bRtl/KT7Gh4kbCjxo3O0f8gYEqO7klvcPgUtCov?=
 =?us-ascii?Q?D9LHS3z7ol2Huh5XFgRdv1BB9ABUbOYrbEKHdF65GTe06X7qxGBpb0glJwI9?=
 =?us-ascii?Q?nULKOO19pWHcvmtPFIhNCiSX3wxls9Oly79vLmDkHgvQTecPRydpFdD55ihi?=
 =?us-ascii?Q?yd25fNWPMe337pEKohOLlHCGulaa3UGkQs3h29xkbrJ9hOOgJZMrKRP5jcJq?=
 =?us-ascii?Q?e20+iJ9MpFBfDXBxb6oqmJ88YgYqya/eBQwNuoehuiSuqmKJ89QAwdWABd1f?=
 =?us-ascii?Q?Nl65upD5hgqG+nNxyesaWnECz7Ap6sEzvM7fJ6j3KfEuWBOps8a5g2haJTvT?=
 =?us-ascii?Q?uuSKBTkSZ9ISltPwhHfguqjYooeaZEjvlnz7a9Nh2A+vHGhKZm9b61yl+EpW?=
 =?us-ascii?Q?TL38pLfYvTC7ZGgnO3us1Fnlhm28FN4qr57HGyaiddMcjsAYQfx6R1KTVifu?=
 =?us-ascii?Q?ggBZTeTDoRN2LevukteNcSD8382hzz9WtIAoxmE5H4nLReSDJ+Kl9wfNv2m2?=
 =?us-ascii?Q?zBcNPivMP7CU9LujZxUv86A89Vli4zI3Kf+OeapaAyuLm7tQmW2k28LTaBKK?=
 =?us-ascii?Q?ZnhBMvl48gzVRJ+BAWN7F0n0MBbcbaXyqLJwX/Oa7zBbVekkqcLkllnIvX26?=
 =?us-ascii?Q?d1e9lRZrHfJ7e5QV3XFEj1iK8F+bVzb1wUYi71M7otpaMcbPVr/DkLn7Bwqp?=
 =?us-ascii?Q?tDVDOn1OD9KPIc2GJek/zvP73zdBHHXyKwGJkVX4fWcndJrsYEPi6Y3ldMbe?=
 =?us-ascii?Q?oA=3D=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0df6410-229b-42d1-bdb0-08dafa50e51d
X-MS-Exchange-CrossTenant-AuthSource: DB9PR03MB8847.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 19:10:57.5542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tHs8UYndZ/e5HGDQNjTSU4IiJn2JF1fF07DlkgHnI8Sn2T+UxzUOG4Ec+KhY1jTQ9I2XSj4Oj8Ikuh256sECSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR03MB8259
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

Changes in v3:
- Rebase onto drm/drm-next

Changes in v2:
- Split off from helper addition

 drivers/iommu/mtk_iommu_v1.c | 3 +--
 sound/soc/codecs/wcd938x.c   | 6 ++----
 2 files changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/mtk_iommu_v1.c b/drivers/iommu/mtk_iommu_v1.c
index 69682ee068d2..14019ba1e41c 100644
--- a/drivers/iommu/mtk_iommu_v1.c
+++ b/drivers/iommu/mtk_iommu_v1.c
@@ -670,8 +670,7 @@ static int mtk_iommu_v1_probe(struct platform_device *pdev)
 		}
 		data->larb_imu[i].dev = &plarbdev->dev;
 
-		component_match_add_release(dev, &match, component_release_of,
-					    component_compare_of, larbnode);
+		component_match_add_of(dev, &match, larbnode);
 	}
 
 	platform_set_drvdata(pdev, data);
diff --git a/sound/soc/codecs/wcd938x.c b/sound/soc/codecs/wcd938x.c
index fcac763b04d1..0663b15fa757 100644
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

