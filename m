Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6885863D76E
	for <lists+dri-devel@lfdr.de>; Wed, 30 Nov 2022 15:03:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA24510E452;
	Wed, 30 Nov 2022 14:03:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur04on0628.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe0e::628])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D37510E452
 for <dri-devel@lists.freedesktop.org>; Wed, 30 Nov 2022 14:02:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YmwGQ2k6oJMS97IBgw6nMFb8NzPImZw2uHPcHoW1Z1cxK03vpB0g6HYeldN0az/aZz7R5QTB34+jsO3QtQwAM8pJOpn99yubIt5BKUvR90z3z5/NO63Sr6w8E2TvxpqXy85YvZl4IQQQO3JoPn4umIbhmPmk6BndWPyjRPGy2OKHlHmkPAeha7PUQb6aKHJSjoTXVUNj8Ta419k6u4n9J9+4LYZYzzgUMFy8YlhMC8LahWKre4tjH/fI4Q6p0uLuqc2+iMKQgpg8U5HPtEzkTmj7YURD6spm+d3A1pveQI/7SRDqt3A9xrpZc2lQSPpK9B7JXsZfuoP3DB6MRDcpbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6QnMkoj/qIu2VnXnxmUTbYZrKmW6PqlhIrdh+PAaceU=;
 b=PEYX81wbAeUVy2k71K+gge9VVCqVq1a+viDUJ2m/Oq2xX9vW9viLdY5h1NYF2Bo+53/jjhvoYx8wa1hUgd+/sTYfIQGltrFXVcSRXw8iP59XhJpOvfbiubnhwMG6M4Xfgcz1I1PwBGGGzQFhQ0OQcHn7EKAlu51I9atwafuleT7HmADJ1ZZESUM52pk1pO2rjJWFm0PJck3jbX7pd7wdknEA1X9ncGxbOfNp1o05phXWfyjn12kDSplozFxO5/rVkSl0/gRRP2BGBoBFjamTdKjNcGq+2KmrjyAZgA4pcHXEYqfbPbuFvXCy83LiAh0wwseZnVij5XT+wMRK9Q/Pcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6QnMkoj/qIu2VnXnxmUTbYZrKmW6PqlhIrdh+PAaceU=;
 b=lQvFdH767oqVxqulN+Yse2JszfNGNJzl3ntI9tMirwTX//v+2T2vM41urIw+jw2doKzT87ArqFfiHpFNxjhJN6Iegy9CY1SLtoO+78TJV8xeu2ugRNk3Cj1bKV0DqXQhpFj06U/a7EylQo89w8jMEpVwjLQSRpsfAxKq+WC311w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by AS2PR08MB8695.eurprd08.prod.outlook.com (2603:10a6:20b:55e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Wed, 30 Nov
 2022 14:02:50 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::3643:6226:28c:e637%2]) with mapi id 15.20.5880.008; Wed, 30 Nov 2022
 14:02:50 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/rockchip: rgb: add video_port parameter to init
 function
Date: Wed, 30 Nov 2022 15:02:14 +0100
Message-Id: <20221130140217.3196414-3-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
References: <20221130140217.3196414-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: ZR0P278CA0182.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::15) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|AS2PR08MB8695:EE_
X-MS-Office365-Filtering-Correlation-Id: 492e764c-5c54-4ba9-ba85-08dad2db911f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l0OT7zrdmhpkUf8YeMbupjJxM9LWBc0jG8+95gtWMuBBs/DEJgHeac4p8oEua896fSshZkPqOaxnM0FUMXLiaSMIYqJznxXWF5ebEgv+SIbw3HO3NRq3kpX+kQqb+LmDFgailNizTtWVHH5+OtqdfB135d4zAVAnqPWdQnpr0yiYA+wohovumtsvQY0RTiDzzq416dQqStKLF7D3db8JxzBiaqF0AKijma/Rz6ZC02EdRzvj1tav7BeK3ybWpCY+EpHWIQ0PHW6T91Khvu3xW3faz1fyMIyW7YxuNbt5Yz5W69ThVzT2kAh5HN2IWe/gB58C2n14MhYdCcgnR/Xl1ftteTdQ0rOzH3gtf5TLQssfsHplsLriRCNBOXusnWClK9CGgyqo+OCwkk2Yv9oxXJa0rR23SI4m6Oom/3Hx53a4NIm4EzPLefZANZZYaTEN3DIO08b0PeOOj9QaJF/eJV/SRYh+wxe52Xt4zhvLXB9oE9NP3riCqC8/aZJfe72lzarwC1TUqJKakDwvufU9hKUF56uRtco9hHCFOQWfWV1tqz0AlABKL8O3S5+TuHdEw1mGh/uO3jBzgGXiGq2WP+ABLEHmU01/i+08sm+pRppLbvm0dy6rWPiBb+7NTmA7VUtsQOaY6xMeRLOCxjym+w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(136003)(396003)(376002)(39850400004)(451199015)(38100700002)(6486002)(54906003)(478600001)(316002)(8936002)(2906002)(41300700001)(83380400001)(1076003)(2616005)(86362001)(6512007)(107886003)(6666004)(36756003)(52116002)(6506007)(66556008)(7416002)(186003)(8676002)(66476007)(44832011)(5660300002)(66946007)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4tXNZjmbHP9igB7KKZukdjBuat2924PM9+7dH1zXXYHiBTzcFZ41xN2I9G4k?=
 =?us-ascii?Q?TUvBxPPCnDEP67U8Z9JLMVh9u1xzDfrxqnxatdmqmM8zltUUiGDh1b/UgGS9?=
 =?us-ascii?Q?zc1dneshZ8JhE5OcGc3iup1Qp5OlgRInsshjpHpe+1knCUeoW42T5Y46dCwy?=
 =?us-ascii?Q?kJvASSHbGCH9UWGgqdJbEtSIOC9ooUO+o0YB9Q/CholWeQQZpm8UnDibRONn?=
 =?us-ascii?Q?qzvFF17M8J0tDNvesX0FWqyquSsLKDmaBBhMA3PZN1NOWYODf7k8Pr9xTCrw?=
 =?us-ascii?Q?GBYaNJ7azCrjnlW1J79XuG7lJ5Eg+odkvv8DBXMNb+1UylfZeZ2BuqQzn9wt?=
 =?us-ascii?Q?I+9jfD8oKhj5YO6Hv8+KxknA6TXcXNPQUmm1y1NbTG/Cwvahyiu5O99P6Of+?=
 =?us-ascii?Q?+mIYQvCdTV9ZQmmRk02WH01ujA6VKLhZOniJVUVZOosXGoTyn0bKGRB10FVT?=
 =?us-ascii?Q?fzUdoLRzReXHc82w7hMHMO1kn7VI5affO8Mgakx1Vqwhb8ChsdH99kfZDloJ?=
 =?us-ascii?Q?4UfuB2Idk5Orsmog+eu1txGyOqsmiOUK4vcBNxp0BTlahQt0tesR8FHoY1nV?=
 =?us-ascii?Q?EL8SPJbuAsWmufsCTwkYBweibDM++id1mmxoukMW+WcOjbZ02wq/upd3sl3d?=
 =?us-ascii?Q?gk5HWNH//FMs0PY7PzSN7UhxUmqQqeHY1uYCIOLBqEV2IapXyzJN8ewrKChy?=
 =?us-ascii?Q?7+xkK+mJCF2WqO61phqERjl/3o3O6mVHf9T2Ew7jLeqfq4zaaX7hKSfnAOH4?=
 =?us-ascii?Q?wC7RdDVhWhQUvwF4D/2Jorg3KKN4seEP2iCSDOlzOledLlAFjUjFCpFCSWaM?=
 =?us-ascii?Q?ECniAqnYvZe1tagbCTU55nSGDeWL2FJSWG9n5k+xa32vtgalwW9Hfdx82mAn?=
 =?us-ascii?Q?cZt9vowS8i7d4HyIs+TZwdStamzEf94dFmWUk7I5IY6AcQxiSiwHoESGbsNp?=
 =?us-ascii?Q?HesH2ZPN5GrwmecTfypTwjNXjP9O7v0yE9XkHNiRaueaBjBQPzT/nqyGyLFZ?=
 =?us-ascii?Q?T1qvXWUDvm/4PRgEN6yarm/PPGnOV+YN/isHjAxYlXw+hUJcdE4ke/nbIlCM?=
 =?us-ascii?Q?ZWv2Llq+zmRfamLpicMdIHwqDmOCQ5OCsiq/C1B+IPbaTdIXzC6KbOn8Ravo?=
 =?us-ascii?Q?I31JDlSn7ofsNICzLnYW14MJCglSOiJUFTqoSuF1rKYvZz1oHdAH1kKtAE7E?=
 =?us-ascii?Q?eX7Pzgveu8njpjZbSET4M35yUCf1+T/DfvBg8ZrcE4YyVvYpsEXzWu8qKgQO?=
 =?us-ascii?Q?QJSeq9J1M1YF7LxHrgHxIfs2KLnycryDzbpoWkB744QyJ3TSNv85rJ73T3i1?=
 =?us-ascii?Q?5TOYfozYkXL4IyeGUeVd1TYiX9ZIFRCHvf3aYmJOtgRpiAc/tC09R+zTY814?=
 =?us-ascii?Q?cUVnRK0VBhyGIjjq/jcoOC+tIg4UDcFQ6AuLo23A8AWp+yDzVpyHb9072S13?=
 =?us-ascii?Q?G2gRtzjbLW8uuOFbDForIvTYI8u6h6uM5lanSuHbV0fOEiFZBZKtpT9kfU5N?=
 =?us-ascii?Q?JEnnDEi1MqnWORvm6uyPLYcAo12ojhEqqjeXHf2yF5DQeKw8B4pnG0AGebyX?=
 =?us-ascii?Q?dsIb9QP+yFskSQ9yS7+ZTGU/d81u2v3QwQfgDNjWW4gmTOlDpQEBgfd+ExFI?=
 =?us-ascii?Q?5dCiHcI8pX3sjl9ukC+rphzSvrUnlbKoPPBFAj3/TVaVXDjlulosp0IugVs/?=
 =?us-ascii?Q?Pnj4hA=3D=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 492e764c-5c54-4ba9-ba85-08dad2db911f
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 14:02:50.1417 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9N8R8MhXGv9atloN/xSEorCxaou5H/6KuvmnfUM0mSE1NX6U84/YQTIiE9oUgI/zwjv0B9ICj/8/lljv4niqRN89/137jw6YtI0rBBnBBhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB8695
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sandy Huang <hjc@rock-chips.com>, Rob Herring <robh+dt@kernel.org>,
 Michael Riesch <michael.riesch@wolfvision.net>,
 Sascha Hauer <sha@pengutronix.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The VOP2 driver has more than one video port, hence the hard-coded
port id will not work anymore. Add an extra parameter for the video
port id to the rockchip_rgb_init function.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop.c | 2 +-
 drivers/gpu/drm/rockchip/rockchip_rgb.c     | 9 +++++----
 drivers/gpu/drm/rockchip/rockchip_rgb.h     | 6 ++++--
 3 files changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
index c356de5dd220..f7335f9cac73 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop.c
@@ -2221,7 +2221,7 @@ static int vop_bind(struct device *dev, struct device *master, void *data)
 		goto err_disable_pm_runtime;
 
 	if (vop->data->feature & VOP_FEATURE_INTERNAL_RGB) {
-		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev);
+		vop->rgb = rockchip_rgb_init(dev, &vop->crtc, vop->drm_dev, 0);
 		if (IS_ERR(vop->rgb)) {
 			ret = PTR_ERR(vop->rgb);
 			goto err_disable_pm_runtime;
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 16201a5cf1e8..ed6ccd1db465 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -74,7 +74,8 @@ struct drm_encoder_helper_funcs rockchip_rgb_encoder_helper_funcs = {
 
 struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 				       struct drm_crtc *crtc,
-				       struct drm_device *drm_dev)
+				       struct drm_device *drm_dev,
+				       int video_port)
 {
 	struct rockchip_rgb *rgb;
 	struct drm_encoder *encoder;
@@ -92,7 +93,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 	rgb->dev = dev;
 	rgb->drm_dev = drm_dev;
 
-	port = of_graph_get_port_by_id(dev->of_node, 0);
+	port = of_graph_get_port_by_id(dev->of_node, video_port);
 	if (!port)
 		return ERR_PTR(-EINVAL);
 
@@ -105,8 +106,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 			continue;
 
 		child_count++;
-		ret = drm_of_find_panel_or_bridge(dev->of_node, 0, endpoint_id,
-						  &panel, &bridge);
+		ret = drm_of_find_panel_or_bridge(dev->of_node, video_port,
+						  endpoint_id, &panel, &bridge);
 		if (!ret) {
 			of_node_put(endpoint);
 			break;
diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.h b/drivers/gpu/drm/rockchip/rockchip_rgb.h
index 27b9635124bc..1bd4e20e91eb 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.h
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.h
@@ -8,12 +8,14 @@
 #ifdef CONFIG_ROCKCHIP_RGB
 struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 				       struct drm_crtc *crtc,
-				       struct drm_device *drm_dev);
+				       struct drm_device *drm_dev,
+				       int video_port);
 void rockchip_rgb_fini(struct rockchip_rgb *rgb);
 #else
 static inline struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 						     struct drm_crtc *crtc,
-						     struct drm_device *drm_dev)
+						     struct drm_device *drm_dev,
+						     int video_port)
 {
 	return NULL;
 }
-- 
2.30.2

