Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A303CD199
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:11:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BD626E0C9;
	Mon, 19 Jul 2021 10:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2113.outbound.protection.outlook.com [40.107.244.113])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A5B46E0C9
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:11:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kGIRP/hqUIJlSdSJeYATDC5UWUr3q5iBRowEnn5jFnhN7yK1KUnJZO14jnbqNjH3PPUWRwtyyvpu9db7jhqYJBe2cUH1NrHWlIWQLjz9AjWYxsupZgkO2ZAf4ujYJvtgZ29HidutoWQ5M9yiQ07RI/I2Oxc8ZjqtI4y4yscoExx0/+55FvdP6N6gdmH+rt5q1K1suJH8aGCGDC2FXSab7erWdGsnHLITwJ0LD0nQvHbctDzfYMFNqtNzKCdoE3hdUA1xcfnpNiV2/CvKMm5Dd+t2DINgYoHBqW2/TEH784MRyDo8tQrLvwVUNwENkcctVDcCTMsUGAe7SrxxbauRSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK457TO73F0rwyAxU0akP20K4bNjGm10bjmEtmBhRa8=;
 b=QimPMocelqr9oUGh/IfSVhL1VqIfyscnlZng45ANG5REsL3RsRPdqAZi2U1e64Ub43xUU7DsBreIh8fUMI1NjfhTp2CqTokeQh7Id3ZXDpaPSyALPEmnOPXs95kZOl3Fo/HWDBg4HHQcBXbjXcCOBwBvzJxMYS4LGVGMRvJsha6dgS/abgO7uPBnF/XOx/T/pSGc57at5xlMNTZHFd1XGz9wem6SqQnhmiDj+VyumcHhl3RidLAApAj0Raebn6+/RhXJuyD9b4O3Uq7UWYJ6LwcGWtETRATfD3AR7/UnqV61T/TUFE6P9DXTUpzrYtPvgbG+6p6JIofKe8uES5AJag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WK457TO73F0rwyAxU0akP20K4bNjGm10bjmEtmBhRa8=;
 b=ZUYoghXTHjxDKQKXnDAn5N5XDeWf+JeOVJ0oAl4uht0HYLJgzdr6qLDzj9AgtpEPROA2ZbEsW5cbsJKJhO78XTk/C0DEW/UmqtV5ug2TDYxG2P82tSp/aSRwQ23AOHSbT9YlsQGbBnRQ/g3yO4q/cdgAQlAgL7ks7xpmXk4v9nU=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6568.namprd04.prod.outlook.com (2603:10b6:a03:1de::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:11:34 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 10:11:34 +0000
Date: Mon, 19 Jul 2021 18:11:29 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v10 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Message-ID: <cb43b1a8901ecd3be9ff0b1cf562e7fdd192c7e7.1626685856.git.xji@analogixsemi.com>
References: <cover.1626685856.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1626685856.git.xji@analogixsemi.com>
X-ClientProxiedBy: HK2PR03CA0065.apcprd03.prod.outlook.com
 (2603:1096:202:17::35) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR03CA0065.apcprd03.prod.outlook.com (2603:1096:202:17::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4352.11 via Frontend Transport; Mon, 19 Jul 2021 10:11:33 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf46cd71-c5eb-467c-3e3f-08d94a9d9630
X-MS-TrafficTypeDiagnostic: BY5PR04MB6568:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB65682B689EF193D4AFDF7619C7E19@BY5PR04MB6568.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +bzqkejT07B1GqYyMohIcQLcObgJrKX9PwmAiXtFvg1jxramHLUmuZ8HpesFsLRSb6EfmBbLjX23dqlKcWhi3D02o0Fr0BBd8FdclegBgjJhIdUyCDrFnJPfufd5kYZ/IDGKGZ8ut7fnH+3f5E5NJkcK1nxY/MXFTzfbO4p2ThYufL450B8ThnpVRyny/D8ltFXteuZvjgonuB+y7iRIzNVWr8hhewqBG28KvVHHgFJrhYXJxnOrAIefDBfWIFwWGXv2DqfNq4HFtJXVgIy3y6WyNlJl86SDulSDpUL8g+MQCG0PSdvh56tPZtPxWxDnGSmU6kKaugSzVhpyH6JRLr8qOZ9I9TMX2pZI6H+g8qk0K+il4c180ocvJK7TKvifLO+VE1d6fTO2Lm+JvTSs1CBMknlEVoqlZrlme1UtQ6taE3Y1paBeREFYv40brvgu7daOemMpjJlD3vw3UfZkz3e8cG3wL2HCItbUbUrdKQUHXs1Cl9XNkooF1sw/Md8Zwl1QUZ6GFdaVJTOVR2QfTUImsZmoB+27xWMPq2b0kq2arcN/cRsMlyNnuyIVAbjDMQJ37e671rNr1nZnglCP5x76/2+UiyvurEnvkDBhZ6GigR6DzaHVyBvuzw0Sls+Kea4g+miEvJFvk1w/qr2EAU9PDNasRDLOX+d1Ll/bDqboQq/OevvSPaQvfnWTMXjxDdnoYk0s7RrNImaN0qpRKg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(136003)(376002)(39840400004)(396003)(346002)(186003)(52116002)(83380400001)(6486002)(8936002)(86362001)(4326008)(6666004)(26005)(2906002)(55236004)(36756003)(5660300002)(30864003)(66556008)(7416002)(66476007)(54906003)(956004)(316002)(2616005)(8676002)(110136005)(38350700002)(66946007)(38100700002)(6496006)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jW8Epkk6oajV4HnKlj6HfMgjFRYoXsPRRkc50DDZADVFY23NbSa+O8mivSJD?=
 =?us-ascii?Q?bqXqiq2lueRUGndjGemXmR60fn+wI4wpikHMTk03ueauz4K3TQOLUY7DCE67?=
 =?us-ascii?Q?/y7IW0AHXoXaPW68vzAojt5Wq5Dpj13qwKiQuruNTQXnfibqUu0MVc5riLau?=
 =?us-ascii?Q?6XPcQs4T3Kx2oUoG6EyqQ46UbQNcte7g5y/BSk0RuYT9W2m3CETdJeWiGcDU?=
 =?us-ascii?Q?L+uxcI5cg9e43fspF3k8yuCMPQqfJ9EAjyhToYBGHcWzdOJzK0OJMto3y3Eo?=
 =?us-ascii?Q?b51zEJxNySvFaRPtLEtgQS/63yQtHYeybL8dFp4z5oo4+4p668jKK5xxuJXU?=
 =?us-ascii?Q?pUSKLbh+c2p3ofCw69D6PH/7BMg3so7crSA+sZCQLxWqBlcadkeae3EZSSUL?=
 =?us-ascii?Q?W/kZtFFta5g9fATBs3Hhvq9nZCO6KPYHnUXn1N6c9CrQynBgOyBU5acq+gDp?=
 =?us-ascii?Q?Cimax6FO3ahivJgpplsIgArX+IMnyxQOYAWZc+biYsXvqVr4OZ5dBJSrrQ/L?=
 =?us-ascii?Q?RRP2BPzLXqh9GMLuqnFogC70XA1q0hQMkFnWoy9ZW3BtYPxpI2TEQFYMYafs?=
 =?us-ascii?Q?gW6NZJppwL5ef1h/hqrjw5taNjvmi5kAJ6bTlt5Wa5ixWZ6+p8sANw4rS0Sg?=
 =?us-ascii?Q?bB4orjXD1ZcLJHMI90aBreQT6P5p2p3lp2NYYdFpVliYWahj3wZSNirUWcXX?=
 =?us-ascii?Q?v3k1l+OaVu/Zi6axWVKQck/WR30UmEgn1A7argrX4u+/8HVenFnzajI4+cQp?=
 =?us-ascii?Q?AD5NFOEmZm/IRamk2xH9pb+JeV+qajoUgBilOFJAwzWqWuv8e3x4Anxymvtw?=
 =?us-ascii?Q?8FKOEg+/KyGkLW9Irgm3QT3rmWJNLYMTU5VnGPZ14G6fl2pEz8LNDcNzmCTf?=
 =?us-ascii?Q?iFzDO4TyiTh9QkOlpJNgDyd5cNAIrUVTFatc9yM+o4L5K5GFYI2eUkyurZhA?=
 =?us-ascii?Q?u3f0XAxc7Wz1HVEI5q/lbdcyB2tp9zfl9z+tVfZwBRRA4ujxTK2GToUjznn6?=
 =?us-ascii?Q?r1rB8+fDDW9ZlSDX+ySh6/YTEvDSotVLYkACKZHO0rKPBnQkdhYUXQ+fbpgS?=
 =?us-ascii?Q?jt8puTTrImi0mxPNwLrRVM9+UcNc8XyGTrML/zoEpncRzSU8tK7Z0KWRE4j7?=
 =?us-ascii?Q?pK/JCdTMyZO9moPDEd/+iPSnCyhbQPpQpw+kAkmemulc+qUc/1fUh2AZPAhE?=
 =?us-ascii?Q?iFmu8lh9koIU4rQb8aDvnwGiIFChjC9/Pp06Qww/9L4Hkcn86rc/ROyWMmQd?=
 =?us-ascii?Q?R+siAVu/eDG38SU5/UiPrvwL6mVhV1MTmoi5lHwZOJzGJ4AR1s7ZvQwW7jzG?=
 =?us-ascii?Q?uLB2bIoVaIAnAX67Mml6URrd?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf46cd71-c5eb-467c-3e3f-08d94a9d9630
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:11:34.1562 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +T3IUaXtk7NdIGb1d7DscO3/oI/EV2ysz4MmmWwM1Tic0LWr7Me1le1zk8YkYDJGkqLDeh9MmJ4KdhHYupOzRQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6568
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
Cc: devel@driverdev.osuosl.org, Sheng Pan <span@analogixsemi.com>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The basic anx7625 driver only support MIPI DSI rx signal input.
This patch add MIPI DPI rx input configuration support, after apply
this patch, the driver can support DSI rx or DPI rx by adding
'bus-type' in DT.

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 246 ++++++++++++++++------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  18 +-
 2 files changed, 204 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 3fc6b7ce7fc7..a5a20cc0f3e0 100644
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
@@ -412,7 +381,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
 			MIPI_LANE_CTRL_0, 0xfc);
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
-				MIPI_LANE_CTRL_0, 3);
+				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
 
 	/* Htotal */
 	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
@@ -597,6 +566,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
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
@@ -607,9 +646,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
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
@@ -1047,6 +1087,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 		return;
 	}
 
+	ctx->hpd_status = 1;
 	ctx->hpd_high_cnt++;
 
 	/* Not support HDCP */
@@ -1056,8 +1097,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
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
@@ -1076,6 +1119,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
+	/* Interrupt mode, no need poll HPD status, just return */
+	if (ctx->pdata.intp_irq)
+		return;
+
 	ret = readx_poll_timeout(anx7625_read_hpd_status_p0,
 				 ctx, val,
 				 ((val & HPD_STATUS) || (val < 0)),
@@ -1103,6 +1150,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
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
@@ -1118,9 +1180,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
 		anx7625_start_dp_work(ctx);
+		anx7625_dp_adjust_swing(ctx);
 	}
-
-	ctx->hpd_status = 1;
 }
 
 static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
@@ -1197,20 +1258,72 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
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
 
+	anx7625_get_swing_setting(dev, pdata);
+
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
@@ -1273,9 +1386,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 {
 	struct device *dev = &ctx->client->dev;
 
-	DRM_DEV_DEBUG_DRIVER(dev, "sink detect, return connected\n");
+	DRM_DEV_DEBUG_DRIVER(dev, "sink detect\n");
+
+	if (ctx->pdata.panel_bridge)
+		return connector_status_connected;
 
-	return connector_status_connected;
+	return ctx->hpd_status ? connector_status_connected :
+				     connector_status_disconnected;
 }
 
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
@@ -1303,7 +1420,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi->lanes = 4;
+	dsi->lanes = ctx->pdata.mipi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
@@ -1349,10 +1466,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
 		return -ENODEV;
 	}
 
-	err = anx7625_attach_dsi(ctx);
-	if (err) {
-		DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
-		return err;
+	if (!ctx->pdata.is_dpi) {
+		err = anx7625_attach_dsi(ctx);
+		if (err) {
+			DRM_DEV_ERROR(dev, "Fail to attach to dsi : %d\n", err);
+			return err;
+		}
 	}
 
 	if (ctx->pdata.panel_bridge) {
@@ -1451,6 +1570,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1827,8 +1950,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
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
 	drm_bridge_add(&platform->bridge);
 
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 034c3840028f..65db38e5da9a 100644
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
@@ -347,12 +355,20 @@ struct s_edid_data {
 
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

