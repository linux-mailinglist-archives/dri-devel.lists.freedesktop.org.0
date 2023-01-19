Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A3B5673C4D
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 15:39:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30E5C10E973;
	Thu, 19 Jan 2023 14:39:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR02-VI1-obe.outbound.protection.outlook.com
 (mail-vi1eur02on2040.outbound.protection.outlook.com [40.107.241.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5283610E96A
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 14:39:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ayV5qIXazNASngfI171B1ZT3PPYX2D372uxnsL/r2KOHV+2j2S5TR430bq35f9QTPlVMFJn5/vBJ5UjveHE2ao3NwavUMJih9JCqvq65Yg1ZsVgoXlgNMq2gqp0HNtomImtt1Sw0KUBJxYWKhT8cAh6pPS/77LVh6R2i4UsV2Y4xGVnYQ/66z3HNqG9ro3LQ3yXX9QpVQQQGMRML781mswkZcGhmF7iK61z27jhtDCkORbUdnj7zS0J7LgC0cfl1wPZi6tfj4adgBbBoUySvVrbibMxirERQXMdZUJePs7ArtRGpcix9xw2G8NnQKSbfiuLiyv2KIbb/V3WzzOYjvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jymqeV+w4uIMgpBiV126XddF0BF4GjQeni91Q6nnFoE=;
 b=H/wozGDRoiS8QUZ18/0889lsCevgMpdtMuV0JLOlJ0ifSZcAoPfUmpQlCX83xmsV4Y45ua4lZkYwcpk1tj3J9+hQyhZ7G7xQ1oQZ+qKuxxmy/eeJnbOJJyl8+Iyr2wDoguvTu3nmAod655f/E9CvzmL9QKC0j2EzRcBObYEfPycSytbz0ezeBWe5o8E34EznDshUIFoBA6y4IAmNj95kOHxfNthDbvPULJMscTfZ8txS/fwJPBATXm11oqISFKwkwRsu80SBE3jFo2iY8VKopZFA0veaXzaizAb+UJnhPEFfzCpkl5/b6d2qxECscliOFOCgUGJoUXgjYeMaUDET7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wolfvision.net; dmarc=pass action=none
 header.from=wolfvision.net; dkim=pass header.d=wolfvision.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wolfvision.net;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jymqeV+w4uIMgpBiV126XddF0BF4GjQeni91Q6nnFoE=;
 b=AmhnmA0rq1q/Xb8mQkxWAy5QChybml45yzJVTmuDkn+fKHaQGw8NxinktuxjmEmWEK+Vc2ufvjGvBNUcmuO6ALpLI0IZF4mBlP5vrieQGkXXQb+4D8OF0ecxV27SH6df52OLUCFu/L3Ma6gFkbfE6JZ/5Tr72keoc8yyPBb6lx4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=wolfvision.net;
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com (2603:10a6:10:416::5)
 by DB9PR08MB6556.eurprd08.prod.outlook.com (2603:10a6:10:261::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 14:39:27 +0000
Received: from DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219]) by DU0PR08MB9155.eurprd08.prod.outlook.com
 ([fe80::4718:6092:e763:4219%2]) with mapi id 15.20.6002.024; Thu, 19 Jan 2023
 14:39:27 +0000
From: Michael Riesch <michael.riesch@wolfvision.net>
To: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/6] drm/rockchip: rgb: embed drm_encoder into
 rockchip_encoder
Date: Thu, 19 Jan 2023 15:39:07 +0100
Message-Id: <20230119143911.3793654-3-michael.riesch@wolfvision.net>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
References: <20230119143911.3793654-1-michael.riesch@wolfvision.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VI1PR07CA0152.eurprd07.prod.outlook.com
 (2603:10a6:802:16::39) To DU0PR08MB9155.eurprd08.prod.outlook.com
 (2603:10a6:10:416::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU0PR08MB9155:EE_|DB9PR08MB6556:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b57ce7c-ca97-4c4d-8be0-08dafa2af756
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TAJnk7X8QtgkGwoduVBfjMKNhnFq14LamwkoS/cltUl75q6WiYWrv+/aMWqFS1tBLLs4L9kXWyvUceIQmAbIrdSOAHrm0TtN1KV1ABe72/VK4NSoD3Mcznyg7cCvwoh7cE3ekr6ses7EiOtQpcGE+KpJDP+1iHxYhblGg1AkNWflWHPlBQ2hJQ2aElP2NlYZiauDeZAHKbFkZQKy8y3KrtdZ+SWt2LKiz0CrvPo6iXevHxjDrZjIuSUhBbp29Larul0Q+HQWkmT9IixeJzfJFOLXDKOXf/QXYQSQrZb9P/0qWyDuUYXGHNn6eu2Dax5tiE6BdaSbk/uhOrQRP302y/i4vRtsOTRxvneSB2TW+6YEpK/DLpHGuI1t6t8XxKVD6nP9sHIyX7fBbZ7fOMHR2oSInQC116mEVTiA2UvD8HN/0KS0tb+QByvqnqs7SXsglGH3bwVyk40Zz62qpLjEH2avlmuvi720Bl9IDCs5RxcBiLzqE//YFjhlTTNGIdb6agRGgm8QV48bs4bO4Bu3zBQX3/yDtRuguN0J2QXLmNrdSavI+s3ZmlXjrfnOJsGtq0bji4djc0Rq9/s3Niru6yWjts35PuMvCTr4csgQml39BkVZl4dLOh8CYN9ZxcKR4Z+ARcXUNG3PFKdtcETGiA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DU0PR08MB9155.eurprd08.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(366004)(346002)(136003)(39850400004)(396003)(451199015)(2616005)(52116002)(36756003)(478600001)(6512007)(8936002)(186003)(6486002)(5660300002)(83380400001)(41300700001)(7416002)(38100700002)(44832011)(316002)(1076003)(66556008)(66946007)(66476007)(86362001)(8676002)(107886003)(2906002)(4326008)(54906003)(6666004)(6506007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YrGJpzRZqip2I4XoZ9BDrIPL/YBxu9Lo6krHzaNJHw18WT9cEWFItr+qHpqW?=
 =?us-ascii?Q?nNKGgizcmFIwqRYq4SST087Ae+Lck7+kF0K6mAEEQj5X6x0h885N5AQCMHfF?=
 =?us-ascii?Q?5NdIeIJQmdRF0VFLI5fnYJsYxRP8bFc0/kRg53lH3OPKi+JQAIVh14XjFP5m?=
 =?us-ascii?Q?27vHdVSuWZ4/hu0AOHreS+avrYKYZnFKGEpuYhQhk5Y1XhzEVgMWfO9kjupR?=
 =?us-ascii?Q?sTqswsN0iJh1cpIWxQKHzqdSycu3FPMNys0em0/Usn9TAz5XBFApSkspW/4A?=
 =?us-ascii?Q?3ugZ9kC4XYKItgE6AX5c0jPVlg7JK/LflPYtjRGKA8lSaEdttm1sdtM7vOqP?=
 =?us-ascii?Q?D4o0Sod+DAAghIN01BIfhS7BOwEN/rm5iZR245auRNCdTDiSUh1PJER4Z9St?=
 =?us-ascii?Q?d5JRo8tKG9ko2BXn6TjfKbEkj5DCBDKVIOeWsNKIuwpWkdCXDzk/cZ4/+cXT?=
 =?us-ascii?Q?IBsR9LQJT3Ru/VKSPzBugnHXul3wAT+upkqGJhzarTRM+0C8WEaTXHlEmXd2?=
 =?us-ascii?Q?o4CRakxzdurn2fMcpQ4VhAofdk+9Fk5GGJQNsIoL4tYfz144O9Qa3rYuu2C3?=
 =?us-ascii?Q?jJ/G/RfNcYCAWVcDt5/H+UnOz46EWde9KbLA9N/dpj38N/QA74nG7fIgKwTL?=
 =?us-ascii?Q?snNI4NLCeof2Q2/WQOVCWSCYPwZRKF7nRplEpobI+XcIgHWpq3825i/AAN9y?=
 =?us-ascii?Q?cMNgDT4+IXZNP8FGeqqDsc5fUyXYOlJlx0X6Ip7smkN5c2HYPXXFIpj6Dt6Z?=
 =?us-ascii?Q?xna0mCMHv5zwFu+p1/9Ha2KpsiPpqgN0XkXgrNfZ1KuH98wxKFYfKrOWBnMg?=
 =?us-ascii?Q?L4V0Iq0LXC7beXw2HfAc1/GlVfXwVb7rYvWFBHsmdbWsvL+LhaEEiev/JgPx?=
 =?us-ascii?Q?hioNsUz4Dgj6wBiRDrEzQuHQ3b0vSwlfzktfzIlmX6FHU4d5bFXd3ZM9aM3o?=
 =?us-ascii?Q?Wzr03N4/f7l3bniOQDTXtchuahePSJeTPe5cigfEGLfwWTX5/7MAMOVyp7Mu?=
 =?us-ascii?Q?C4Iw+/iP80mP75bMO5MsmlTMzqwkRAUfmNHEkurXH1fxMGBjoMkYbL2hs8FK?=
 =?us-ascii?Q?W9IGR9udlmPcHOI4jUtKeCqCZ2ByCaNmPAbNsJQ9P8U1F6GGAKnUrQD4FGvn?=
 =?us-ascii?Q?lm+PPcePcIDZXPlIHTCeHej+IxXxAgxLD+Djdv7mLTTF6jSc+69DTMlVaKsM?=
 =?us-ascii?Q?5ah3nVkJS6N5HrPgEj2GJ6KOEZIR8P00A30LAXxbMyWvVH4Gj+5O6ZJ6U19u?=
 =?us-ascii?Q?0wWoWXUeFtNERSDt8hNz5izDHAH/GWLd7vJF+Z5VAphYON5Q+tlRbu0oQ8Va?=
 =?us-ascii?Q?DzqnYnyJuwF8/0bfWUiz5YSmjgYkHpp3KDdgdZH/7Eo+OHB18uFIqgiLj50I?=
 =?us-ascii?Q?GpVvqM8Y45drpA+z6Q6i64fU5zSGtkcqtcP9cjd4lsv97SksHZcywjuRS0cI?=
 =?us-ascii?Q?HDXCiq+FevwoRPZ+GjnAsNzlaxIaB3eF6p0nJHxAKFr4RxXj3Vud3eM2+WX1?=
 =?us-ascii?Q?wDzbBYgMUmd17qVKLadIdY0Xdc95wwq7grZwy1IXhG24t2+KX+10jQrVs7CT?=
 =?us-ascii?Q?yyrK/6hmV0oKYqzQ/9JoaWnvs5EZox1iALfKubeqheHW2wMNLYOgTHAb5I2K?=
 =?us-ascii?Q?TY6Y03WPG9kHB/slHTA5WcSdHLV4proAzuo7LfdsdAFUIqpXrq9kunf5WsVF?=
 =?us-ascii?Q?imAl2syH9o0bRKM3iclybWKUH14=3D?=
X-OriginatorOrg: wolfvision.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b57ce7c-ca97-4c4d-8be0-08dafa2af756
X-MS-Exchange-CrossTenant-AuthSource: DU0PR08MB9155.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 14:39:27.2341 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: e94ec9da-9183-471e-83b3-51baa8eb804f
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XEVtC2F+TdNpyHT7S90e4zH8TTN+Rb4Y/UVU/dYY9Y2+0WxlmRtmd88wmeOCpw9b4NbFgMkCQ5BTugXhrBTqZ/7rl3SB8AsrBI+2wwtRX2Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB6556
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

Commit 540b8f271e53 ("drm/rockchip: Embed drm_encoder into
rockchip_decoder") provides the means to pass the endpoint ID to the
VOP2 driver, which sets the interface MUX accordingly. However, this
step has not yet been carried out for the RGB output block. Embed the
drm_encoder structure into the rockchip_encoder structure and set the
endpoint ID correctly.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
---
v2:
 - use endpoint id from device tree instead of hardcoded value

 drivers/gpu/drm/rockchip/rockchip_rgb.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_rgb.c b/drivers/gpu/drm/rockchip/rockchip_rgb.c
index 75eb7cca3d82..5971df4302f2 100644
--- a/drivers/gpu/drm/rockchip/rockchip_rgb.c
+++ b/drivers/gpu/drm/rockchip/rockchip_rgb.c
@@ -22,13 +22,11 @@
 #include "rockchip_drm_vop.h"
 #include "rockchip_rgb.h"
 
-#define encoder_to_rgb(c) container_of(c, struct rockchip_rgb, encoder)
-
 struct rockchip_rgb {
 	struct device *dev;
 	struct drm_device *drm_dev;
 	struct drm_bridge *bridge;
-	struct drm_encoder encoder;
+	struct rockchip_encoder encoder;
 	struct drm_connector connector;
 	int output_mode;
 };
@@ -125,7 +123,7 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		return ERR_PTR(ret);
 	}
 
-	encoder = &rgb->encoder;
+	encoder = &rgb->encoder.encoder;
 	encoder->possible_crtcs = drm_crtc_mask(crtc);
 
 	ret = drm_simple_encoder_init(drm_dev, encoder, DRM_MODE_ENCODER_NONE);
@@ -161,6 +159,8 @@ struct rockchip_rgb *rockchip_rgb_init(struct device *dev,
 		goto err_free_encoder;
 	}
 
+	rgb->encoder.crtc_endpoint_id = endpoint_id;
+
 	ret = drm_connector_attach_encoder(connector, encoder);
 	if (ret < 0) {
 		DRM_DEV_ERROR(drm_dev->dev,
@@ -182,6 +182,6 @@ void rockchip_rgb_fini(struct rockchip_rgb *rgb)
 {
 	drm_panel_bridge_remove(rgb->bridge);
 	drm_connector_cleanup(&rgb->connector);
-	drm_encoder_cleanup(&rgb->encoder);
+	drm_encoder_cleanup(&rgb->encoder.encoder);
 }
 EXPORT_SYMBOL_GPL(rockchip_rgb_fini);
-- 
2.30.2

