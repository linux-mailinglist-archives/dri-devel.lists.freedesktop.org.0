Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E05C445E85
	for <lists+dri-devel@lfdr.de>; Fri,  5 Nov 2021 04:19:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 402596E147;
	Fri,  5 Nov 2021 03:19:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2096.outbound.protection.outlook.com [40.107.223.96])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4470E6E147
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Nov 2021 03:19:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NgEv00ozkhRHDeZwTf+4j/xJ1KAiSkL7Fb9poD067vxmSjs15zr2zn+RKpg5lA7VuDE0aALFYgSq6cazfW81cAdjw6OLQuOYSLmy1G28aFC33QvCj5EbPfS12jlMoq5tKpVRAhRM3MGcfIeefj9K38ulncE1WggxwsnLTOR/X9jVGJ5Az0N8IWjx46S7yK6aZJ3ioL+zma9idUhYqAvLWHQS7WO76hL8ioxacwZ0aIRyGpJSgmsoLcxeSzeZEyDfiPYhkaT+v3fUk40YdzXM8g/T0ppk/x+5Bxj66lSJkqdKI26KdjiEhQ5hiuX2Zqk5VQW/T3O5VDv828Azmcw/cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XI4I4PFL7ux2e5iZDFcxqC/7kGl6roMNNOYYfyEidu4=;
 b=WQsge05jbzzYG8IHFy/jFvd05EsJPolUVaoQRfEQr5WK8To/HFtQXVRs29wDlJbOtRAT4mdzJXR7kwkzY0ppa69wzfUmJVLsbMJDAatrOFptTDHrcg4rV8FL6lVagwJpTQ8F7MD7kCu1kh9M9ee9Ut42/VU21KUFEk+mS884WpWH0cwoJcxmJDNvH7AKdHFD3PBi4rKzPB6TvE9YivZm5ddrpRlhaZ5pe45Vn8PyrA0yByCGXj84uHd2ay7RUr7cP+n9UQ2vjPt3LQuBhYEMllGzXi6gQwaykDGz/t5v8d5grC39BX3ixPwkXCUPUj9F6MD4viByQ7dGaFB1XxubBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XI4I4PFL7ux2e5iZDFcxqC/7kGl6roMNNOYYfyEidu4=;
 b=DNDDi7ZgrnFI2SfUbeyF6xq1sFfmSUbpVyPJSeYJvbUkwdAVAgX3c4PcJtzImNAzz/M4N9S1jfsKUmkuQ44/QbOv9BgpGChw1qPsSK19vqmNZrm3F3h6F+0sFVDohpSZ+SH3g8g3GbyHTZbUHd3jTVMnayAxFEpKxapRUbcbqwQ=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6438.namprd04.prod.outlook.com (2603:10b6:a03:1f2::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4669.11; Fri, 5 Nov
 2021 03:19:46 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6807:22c:61f6:d595%3]) with mapi id 15.20.4669.013; Fri, 5 Nov 2021
 03:19:46 +0000
From: Xin Ji <xji@analogixsemi.com>
To: a.hajda@samsung.com, narmstrong@baylibre.com, dan.carpenter@oracle.com,
 robert.foss@linaro.org, Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@linux.ie, daniel@ffwll.ch,
 sam@ravnborg.org, pihsun@chromium.org, tzungbi@google.com,
 maxime@cerno.tech, drinkcat@google.com, hsinyi@chromium.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 bliang@analogixsemi.com, qwen@analogixsemi.com, robh+dt@kernel.org,
 devicetree@vger.kernel.org
Subject: [PATCH v12 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Date: Fri,  5 Nov 2021 11:19:03 +0800
Message-Id: <20211105031904.2641088-3-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211105031904.2641088-1-xji@analogixsemi.com>
References: <20211105031904.2641088-1-xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HKAPR04CA0018.apcprd04.prod.outlook.com
 (2603:1096:203:d0::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HKAPR04CA0018.apcprd04.prod.outlook.com (2603:1096:203:d0::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.13 via Frontend Transport; Fri, 5 Nov 2021 03:19:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 02a55071-eab8-4be7-8244-08d9a00b1e38
X-MS-TrafficTypeDiagnostic: BY5PR04MB6438:
X-Microsoft-Antispam-PRVS: <BY5PR04MB643803123EF48C013B80EBE3C78E9@BY5PR04MB6438.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XlBSAm0x/+5/HgVqaW5juC3HWfa4Sv940eIzE6/o4R2BHv1aRuh2QcqcJT2MavcgMcUNubrYULIldQMXOuJappYx5kk5KGRnGXf5+0+FT5DFY23bSXSES9azqBKmFenR3pdCDGYhyC+1O7yhn81dqm/EdBddOzAbbON/FHLzQ3hOrwVc1VYIuIRSjw7Tvq6ex/TZbkvqWags+KnL4MTCmL6userx+YA1sRHcw8wp6Y4tZfg9TSqYE5uEoyltwijzGXAa1eci/2O4NXZhkguLnv9r1PTnOVfVXuFZaFuQ4dXs325ADSURmUrtUoYZWpR5WDrkJE0Vj6mhHG48cULThHqPQcYSEU/uOSmYQDMcptrAthW2JANxYIpqqrkvrgR181+4/BU9Ez24/8hzbhdpFd4Iqn1Ysw2HxhIchwOxRuMItnNM5UKqVoT0/zKs/gd9Y+64DN4mGFz1bFNstMXSHIIrZ0jH8KPMPC97jBKOcGw9TuuvvqQTHtEtHARSQnT7wFEvi6srNV6oZ7+aXifMr7Yzzch4BkRVO2DFGzWdMQVo46yXD64M8D9KNM4oMQl20ppR+jsjwstBTHKkGAoEKGXVnpStUA9c8ME80zItTnVjnDJlbOYlZTpLWacCQf7vOGK8SV8RNpVBt/fvsSxKvQ3Dd2dXJi7No4QtLHOwTSqJ5t9hNSd5tfjEdzdl+daZOxoZ708ca4IcK+kSdZZKwr7i0JgFD6irabzRpMH4+08=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(6486002)(66556008)(316002)(66476007)(38350700002)(55236004)(66946007)(38100700002)(8936002)(4326008)(7416002)(508600001)(1076003)(6666004)(30864003)(83380400001)(8676002)(36756003)(86362001)(921005)(26005)(186003)(5660300002)(956004)(107886003)(2616005)(2906002)(52116002)(6496006);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sMojRQjflQvqkelwE36jFxl/M5LSq7CDOjqJHi4Bn9xnOX+2FgipFoKE/UCH?=
 =?us-ascii?Q?TN0X4VSlLFp2LktVMosqbERnpSLQSSbgvIz16qUpHBi02c1Eq6fAncIx5W0O?=
 =?us-ascii?Q?raLDqbhb7cZeC4Ap6TDpevCQZR2jks1ZQeZA4MQt2rXYKgx6Td/ZIyDkwv9l?=
 =?us-ascii?Q?Qm5+ACMyms87n1XmWz2/w9shgCktJr9JH44F4f/+RBvFUSKMc7HMihH5fXzy?=
 =?us-ascii?Q?9gGEeOeb52OJnjpaUOgOjuqkYEhDMtTlKkJspar1VXIwqVPXXtefvi/ufimv?=
 =?us-ascii?Q?wHSnYg2q+Lcq01O+1HYoWPRBEFpyPbqAuWZVkbwhx4boJWaNZ8AszgdJa5Jw?=
 =?us-ascii?Q?IRdSXYcgttCUq/kEERwBBOX+j2WXnylUQgYGbP0u+goWc/0fZ+i23p7ODknR?=
 =?us-ascii?Q?jrL1BH+KlQYmjY9PkTULXt/hYt1tWucLQ00FPAdg3j7Wm2q9FjAdmDQMHtr/?=
 =?us-ascii?Q?i6WsUre6aHu9k2ky9czDfAFlb3OnnQlIqbn98Y9r2RSdx/Rt/5f1MNUlUjYs?=
 =?us-ascii?Q?h6e42eDbiYdzrdO4zhE+f1q0PpKlQNJT0eD/J2X0o6TEyufcrJ/rn2M4CyzO?=
 =?us-ascii?Q?Oro1nnQwBhqCOJ0BWfCSMv5ip6x21VpW3TU7DaGT7NB3XHt8z513zjVukhdn?=
 =?us-ascii?Q?JelPBZ040e5LBAwxa05OdwMJqaZI1fx92u3DnAa9+wbAcYeppks44c/j8lKk?=
 =?us-ascii?Q?WPhR+YyqshdnhTUpmGWghJtyn2Q+5gK2MA+nTMg/FeiOOkQ6PD2ZRLdIRWEP?=
 =?us-ascii?Q?OLsmb1Zz+0p5Nj6e/91mg+KcnzotKCyUqsOiodr5zlPeUGzYiUKKu3uAsiYo?=
 =?us-ascii?Q?DZg6LWF0qxLmJiZOTxl67C47veLn4VFI9GX0i3gRiLKJ+hlICCGAo1OC4ADt?=
 =?us-ascii?Q?R9z749jwAaDe7t8aKI0sFE1s0smF8mHNFRDsAi6spDkIUTo9dBhyeCay19ff?=
 =?us-ascii?Q?VH/nDCO5OtH/31Ms/bmv4lRC9gj6FD3UGM72jX6+jiMah94NjP1OcGNVaNNU?=
 =?us-ascii?Q?TiikHm2Gyh3DBgOEumE4Lebwt1BLZnwAaRrKJReOujPTlCPpW8z4TvGk3pM6?=
 =?us-ascii?Q?9ygkFHZ49fK5QJeFO9humousFcCqRHbqRxJtmqHfsACpElIPdlvsqRTI3rcU?=
 =?us-ascii?Q?Jd5/GtqeBr8OQAdVIWeWJcxMyLeBDT+PhH0/4UBkbcbZhqdT7qkEKyn/qGUv?=
 =?us-ascii?Q?2RheNeoDnmXXITWwH17w6/0qNFiUf8Ab5oZAWUVU97A2IHy3fqf3ZwS/ZM/4?=
 =?us-ascii?Q?ZFox5xB1oJBNcNPW4LvPyH+PrvdCOxf4pzVA1VArnbvpKgBtqwOxbiBrHK5d?=
 =?us-ascii?Q?euITimfi7E3/zClHzc8EUzfwE9+G2/486EVvFBEGX1v/wD40Czn++vDb9QrE?=
 =?us-ascii?Q?+KDVowMMqHuL8SGwYUEGPIexru+Ann8swx3nDZHoNZk1o6gA/ke5c4J69Q9l?=
 =?us-ascii?Q?5X2whjHnAQBwrDNkl4jBihcbbl/ZmevjanNsqfwkwbv+sec9OoOuaefke5Dq?=
 =?us-ascii?Q?FDzK8V1Qut+7moPJ0FK8ErTmsILzcOjGE+qJzSJVwW+vju4s80QpWAvGGWJU?=
 =?us-ascii?Q?ImqqK4kXAbYc+PyaS9Zb2CqoSvoUUfIn8yVXcqo2bjCxJjNMqI9W4vw1pdov?=
 =?us-ascii?Q?ACTkY/5Ajkqj30U1QB3WUxs=3D?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02a55071-eab8-4be7-8244-08d9a00b1e38
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2021 03:19:46.3283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9OY6orgxOCM8b0Vh1PB1M+vfH4GUyLMbkPshGOC55nUVUxhVQ7Gp0lB1fCEbkNDAfHVZCP2IHXZt9YJcD/nuwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6438
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
Cc: Xin Ji <xji@analogixsemi.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The basic anx7625 driver only support MIPI DSI rx signal input.
This patch add MIPI DPI rx input configuration support, after apply
this patch, the driver can support DSI rx or DPI rx by adding
'bus-type' in DT.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 247 ++++++++++++++++------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
 2 files changed, 205 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index f48e91134c20..f7c3386c8929 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -32,6 +32,7 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <media/v4l2-fwnode.h>
 #include <video/display_timing.h>
 
 #include "anx7625.h"
@@ -152,18 +153,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
 	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
 }
 
-static int anx7625_write_and_or(struct anx7625_data *ctx,
-				struct i2c_client *client,
-				u8 offset, u8 and_mask, u8 or_mask)
+static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
 {
-	int val;
+	int i, ret;
 
-	val = anx7625_reg_read(ctx, client, offset);
-	if (val < 0)
-		return val;
+	ret = anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
+			       AUDIO_CONTROL_REGISTER, 0x80);
+	for (i = 0; i < 13; i++)
+		ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+					 VIDEO_BIT_MATRIX_12 + i,
+					 0x18 + i);
 
-	return anx7625_reg_write(ctx, client,
-				 offset, (val & and_mask) | (or_mask));
+	return ret;
 }
 
 static int anx7625_read_ctrl_status_p0(struct anx7625_data *ctx)
@@ -221,38 +222,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
 	return ret;
 }
 
-static int anx7625_config_audio_input(struct anx7625_data *ctx)
-{
-	struct device *dev = &ctx->client->dev;
-	int ret;
-
-	/* Channel num */
-	ret = anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
-				AUDIO_CHANNEL_STATUS_6, I2S_CH_2 << 5);
-
-	/* FS */
-	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
-				    AUDIO_CHANNEL_STATUS_4,
-				    0xf0, AUDIO_FS_48K);
-	/* Word length */
-	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
-				    AUDIO_CHANNEL_STATUS_5,
-				    0xf0, AUDIO_W_LEN_24_24MAX);
-	/* I2S */
-	ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
-				AUDIO_CHANNEL_STATUS_6, I2S_SLAVE_MODE);
-	ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
-				 AUDIO_CONTROL_REGISTER, ~TDM_TIMING_MODE);
-	/* Audio change flag */
-	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
-				AP_AV_STATUS, AP_AUDIO_CHG);
-
-	if (ret < 0)
-		DRM_DEV_ERROR(dev, "fail to config audio.\n");
-
-	return ret;
-}
-
 /* Reduction of fraction a/b */
 static void anx7625_reduction_of_a_fraction(unsigned long *a, unsigned long *b)
 {
@@ -431,7 +400,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
 			MIPI_LANE_CTRL_0, 0xfc);
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
-				MIPI_LANE_CTRL_0, 3);
+				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
 
 	/* Htotal */
 	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
@@ -615,6 +584,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
 	return ret;
 }
 
+static int anx7625_api_dpi_config(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+	u16 freq = ctx->dt.pixelclock.min / 1000;
+	int ret;
+
+	/* configure pixel clock */
+	ret = anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				PIXEL_CLOCK_L, freq & 0xFF);
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p0_client,
+				 PIXEL_CLOCK_H, (freq >> 8));
+
+	/* set DPI mode */
+	/* set to DPI PLL module sel */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_DIGITAL_PLL_9, 0x20);
+	/* power down MIPI */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_LANE_CTRL_10, 0x08);
+	/* enable DPI mode */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.rx_p1_client,
+				 MIPI_DIGITAL_PLL_18, 0x1C);
+	/* set first edge */
+	ret |= anx7625_reg_write(ctx, ctx->i2c.tx_p2_client,
+				 VIDEO_CONTROL_0, 0x06);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "IO error : dpi phy set failed.\n");
+
+	return ret;
+}
+
+static int anx7625_dpi_config(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+	int ret;
+
+	DRM_DEV_DEBUG_DRIVER(dev, "config dpi\n");
+
+	/* DSC disable */
+	ret = anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+				R_DSC_CTRL_0, ~DSC_EN);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : disable dsc failed.\n");
+		return ret;
+	}
+
+	ret = anx7625_config_bit_matrix(ctx);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "config bit matrix failed.\n");
+		return ret;
+	}
+
+	ret = anx7625_api_dpi_config(ctx);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "mipi phy(dpi) setup failed.\n");
+		return ret;
+	}
+
+	/* set MIPI RX EN */
+	ret = anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+			       AP_AV_STATUS, AP_MIPI_RX_EN);
+	/* clear mute flag */
+	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p0_client,
+				 AP_AV_STATUS, (u8)~AP_MIPI_MUTE);
+	if (ret < 0)
+		DRM_DEV_ERROR(dev, "IO error : enable mipi rx failed.\n");
+
+	return ret;
+}
+
 static void anx7625_dp_start(struct anx7625_data *ctx)
 {
 	int ret;
@@ -625,9 +664,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
 		return;
 	}
 
-	anx7625_config_audio_input(ctx);
-
-	ret = anx7625_dsi_config(ctx);
+	if (ctx->pdata.is_dpi)
+		ret = anx7625_dpi_config(ctx);
+	else
+		ret = anx7625_dsi_config(ctx);
 
 	if (ret < 0)
 		DRM_DEV_ERROR(dev, "MIPI phy setup error.\n");
@@ -1075,6 +1115,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 		return;
 	}
 
+	ctx->hpd_status = 1;
 	ctx->hpd_high_cnt++;
 
 	/* Not support HDCP */
@@ -1084,8 +1125,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xec, 0x10);
 	/* Interrupt for DRM */
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client, 0xff, 0x01);
-	if (ret < 0)
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "fail to setting HDCP/auth\n");
 		return;
+	}
 
 	ret = anx7625_reg_read(ctx, ctx->i2c.rx_p1_client, 0x86);
 	if (ret < 0)
@@ -1104,6 +1147,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
+	/* Interrupt mode, no need poll HPD status, just return */
+	if (ctx->pdata.intp_irq)
+		return;
+
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
@@ -1131,6 +1178,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
 	ctx->slimport_edid_p.edid_block_num = -1;
 }
 
+static void anx7625_dp_adjust_swing(struct anx7625_data *ctx)
+{
+	int i;
+
+	for (i = 0; i < ctx->pdata.dp_lane0_swing_reg_cnt; i++)
+		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
+				  DP_TX_LANE0_SWING_REG0 + i,
+				  ctx->pdata.lane0_reg_data[i] & 0xFF);
+
+	for (i = 0; i < ctx->pdata.dp_lane1_swing_reg_cnt; i++)
+		anx7625_reg_write(ctx, ctx->i2c.tx_p1_client,
+				  DP_TX_LANE1_SWING_REG0 + i,
+				  ctx->pdata.lane1_reg_data[i] & 0xFF);
+}
+
 static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 {
 	struct device *dev = &ctx->client->dev;
@@ -1146,9 +1208,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
 		anx7625_start_dp_work(ctx);
+		anx7625_dp_adjust_swing(ctx);
 	}
-
-	ctx->hpd_status = 1;
 }
 
 static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
@@ -1225,20 +1286,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static int anx7625_get_swing_setting(struct device *dev,
+				     struct anx7625_platform_data *pdata)
+{
+	int num_regs;
+
+	if (of_get_property(dev->of_node,
+			    "analogix,lane0-swing", &num_regs)) {
+		if (num_regs > DP_TX_SWING_REG_CNT)
+			num_regs = DP_TX_SWING_REG_CNT;
+
+		pdata->dp_lane0_swing_reg_cnt = num_regs;
+		of_property_read_u32_array(dev->of_node, "analogix,lane0-swing",
+					   pdata->lane0_reg_data, num_regs);
+	}
+
+	if (of_get_property(dev->of_node,
+			    "analogix,lane1-swing", &num_regs)) {
+		if (num_regs > DP_TX_SWING_REG_CNT)
+			num_regs = DP_TX_SWING_REG_CNT;
+
+		pdata->dp_lane1_swing_reg_cnt = num_regs;
+		of_property_read_u32_array(dev->of_node, "analogix,lane1-swing",
+					   pdata->lane1_reg_data, num_regs);
+	}
+
+	return 0;
+}
+
 static int anx7625_parse_dt(struct device *dev,
 			    struct anx7625_platform_data *pdata)
 {
-	struct device_node *np = dev->of_node;
+	struct device_node *np = dev->of_node, *ep0;
 	struct drm_panel *panel;
 	int ret;
+	int bus_type, mipi_lanes;
+
+	anx7625_get_swing_setting(dev, pdata);
 
+	pdata->is_dpi = 1; /* default dpi mode */
 	pdata->mipi_host_node = of_graph_get_remote_node(np, 0, 0);
 	if (!pdata->mipi_host_node) {
 		DRM_DEV_ERROR(dev, "fail to get internal panel.\n");
 		return -ENODEV;
 	}
 
-	DRM_DEV_DEBUG_DRIVER(dev, "found dsi host node.\n");
+	bus_type = V4L2_FWNODE_BUS_TYPE_PARALLEL;
+	mipi_lanes = MAX_LANES_SUPPORT;
+	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (ep0) {
+		if (of_property_read_u32(ep0, "bus-type", &bus_type))
+			bus_type = 0;
+
+		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
+	}
+
+	if (bus_type == V4L2_FWNODE_BUS_TYPE_PARALLEL) /* bus type is Parallel(DSI) */
+		pdata->is_dpi = 0;
+
+	pdata->mipi_lanes = mipi_lanes;
+	if (pdata->mipi_lanes > MAX_LANES_SUPPORT || pdata->mipi_lanes <= 0)
+		pdata->mipi_lanes = MAX_LANES_SUPPORT;
+
+	if (pdata->is_dpi)
+		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DPI host node.\n");
+	else
+		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
@@ -1301,9 +1414,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
+	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
 
-	return connector_status_connected;
+	if (ctx->pdata.panel_bridge)
+		return connector_status_connected;
+
+	return ctx->hpd_status ? connector_status_connected :
+				     connector_status_disconnected;
 }
 
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
@@ -1332,7 +1449,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi->lanes = 4;
+	dsi->lanes = ctx->pdata.mipi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
@@ -1460,6 +1577,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1835,14 +1956,22 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
 	platform->bridge.funcs = &anx7625_bridge_funcs;
 	platform->bridge.of_node = client->dev.of_node;
-	platform->bridge.ops = DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
-	platform->bridge.type = DRM_MODE_CONNECTOR_eDP;
+	platform->bridge.ops = DRM_BRIDGE_OP_EDID;
+	if (!platform->pdata.panel_bridge)
+		platform->bridge.ops |= DRM_BRIDGE_OP_HPD |
+					DRM_BRIDGE_OP_DETECT;
+	platform->bridge.type = platform->pdata.panel_bridge ?
+				    DRM_MODE_CONNECTOR_eDP :
+				    DRM_MODE_CONNECTOR_DisplayPort;
+
 	drm_bridge_add(&platform->bridge);
 
-	ret = anx7625_attach_dsi(platform);
-	if (ret) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
-		goto unregister_bridge;
+	if (!platform->pdata.is_dpi) {
+		ret = anx7625_attach_dsi(platform);
+		if (ret) {
+			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", ret);
+			goto unregister_bridge;
+		}
 	}
 
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 6dcf64c703f9..3ef1d8f4e575 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -141,12 +141,20 @@
 #define  HORIZONTAL_BACK_PORCH_H      0x22  /* Bit[7:4] are reserved */
 
 /******** END of I2C Address 0x72 *********/
+
+/***************************************************************/
+/* Register definition of device address 0x7a */
+#define DP_TX_SWING_REG_CNT		0x14
+#define DP_TX_LANE0_SWING_REG0		0x00
+#define DP_TX_LANE1_SWING_REG0		0x14
+/******** END of I2C Address 0x7a *********/
+
 /***************************************************************/
 /* Register definition of device address 0x7e */
 
 #define  I2C_ADDR_7E_FLASH_CONTROLLER  0x7E
 
-#define FLASH_LOAD_STA 0x05
+#define FLASH_LOAD_STA          0x05
 #define FLASH_LOAD_STA_CHK	BIT(7)
 
 #define  XTAL_FRQ_SEL    0x3F
@@ -349,12 +357,20 @@ struct s_edid_data {
 
 /***************** Display End *****************/
 
+#define MAX_LANES_SUPPORT	4
+
 struct anx7625_platform_data {
 	struct gpio_desc *gpio_p_on;
 	struct gpio_desc *gpio_reset;
 	struct regulator_bulk_data supplies[3];
 	struct drm_bridge *panel_bridge;
 	int intp_irq;
+	int is_dpi;
+	int mipi_lanes;
+	int dp_lane0_swing_reg_cnt;
+	int lane0_reg_data[DP_TX_SWING_REG_CNT];
+	int dp_lane1_swing_reg_cnt;
+	int lane1_reg_data[DP_TX_SWING_REG_CNT];
 	u32 low_power_mode;
 	struct device_node *mipi_host_node;
 };
-- 
2.25.1

