Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F48430E09
	for <lists+dri-devel@lfdr.de>; Mon, 18 Oct 2021 05:04:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B456E93B;
	Mon, 18 Oct 2021 03:04:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2132.outbound.protection.outlook.com [40.107.94.132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CB5B6E93B
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Oct 2021 03:04:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=P86KmjhLKXPvJEjJBLm+Ke24MIGjrmQxSnn+IGk3ATcgXo53AJmBuddpp2Y3w79dY2fa/E1AxMfWvN/giuqMDCzK2aDvWeLW2SDvDbDhHTE3Cto71X9B0mAu3rCT9YeInoJQh/D5TBRtR6GCe4r87h8AxLrrut4eGQZ8FAa0w9uGkJ0afyAqiNrl7yGHf+hZl5NZs8LEoGAar8P0RoQjAB2kbTYMx/csEqX+a6+QBy4nl8GdKV3aticcjvQpxGuHFhc6K8u+jEOLFyB7VcdF/V5oBkf89Ea70IPUDQ/6YWVgedE6wHWiano9iVHpZ2tnyLy7dD0WXOuHosI8lPWprg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AU5bPZzx+kMb3zZGG2WnppvMtKRrJX4fRaZJF4EkExQ=;
 b=Kl7OuPRct9pzEQbEhxZD89yqRkoSHSMcFQtFXJROitLZW9w0wf4NkCwWtB4kEsfmcspTMwjUkymbVLswLgpsneY559SJ6Gb4ouyYMdDzyGyCtPZTjIJWpQ4joWVDchZODaunQ6LtBFlvaUQNu21gbXxHJWc+B0g6JNh81TYEp63+op5Ggr9yCNWTcUrSv6qYS1P3tGT/tolVy7TE83M/35EF7C6ZJrJsnifiQ1fjJBZoGKOmp2yEwDACBP7y3tKC86/jzcfGE/EGSXixrkyZJkDABsdkgvbNmCxr4lQqMmw8ktTjTjH4z1gHCZN+Ler2oWa+lblVOOHikzTCwDMFbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AU5bPZzx+kMb3zZGG2WnppvMtKRrJX4fRaZJF4EkExQ=;
 b=mBkKH4049Mqse8k0ZCkBQL425YWJ7+BnjgMNFFz3wP6uyJ+xOf7seS9H5qbbEE+XAo7GcZL+YiiDSMx6cp6BS56MLrUHQObtQ5tKpyYZo/0zQM9w1wfK4i9cphR6hrEQfaqfR/ma9X3TvhSON/+3McUGbJ7hc679EzeGKL9lXUA=
Authentication-Results: analogixsemi.com; dkim=none (message not signed)
 header.d=none;analogixsemi.com; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB3862.namprd04.prod.outlook.com (2603:10b6:a02:ad::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 03:04:30 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::e149:c2d4:fd23:a682%7]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 03:04:30 +0000
From: Xin Ji <xji@analogixsemi.com>
To: xji@analogixsemi.com
Cc: Laurent.pinchart@ideasonboard.com, a.hajda@samsung.com, airlied@linux.ie,
 anarsoul@gmail.com, bliang@analogixsemi.com, boris.brezillon@collabora.com,
 dan.carpenter@oracle.com, daniel@ffwll.ch, devel@driverdev.osuosl.org,
 dri-devel@lists.freedesktop.org, drinkcat@google.com, duwe@lst.de,
 hsinyi@chromium.org, jonas@kwiboo.se, linux-kernel@vger.kernel.org,
 m.szyprowski@samsung.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 sam@ravnborg.org, span@analogixsemi.com, zhenli@analogixsemi.com
Subject: [PATCH v11 3/4] drm/bridge: anx7625: add MIPI DPI input feature
Date: Mon, 18 Oct 2021 11:04:22 +0800
Message-Id: <20211018030422.2055208-1-xji@analogixsemi.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <5aad2d99649549bfacf1a6a4587cae12de197879.1628161369.git.xji@analogixsemi.com>
References: <5aad2d99649549bfacf1a6a4587cae12de197879.1628161369.git.xji@analogixsemi.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0153.apcprd02.prod.outlook.com
 (2603:1096:201:1f::13) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0153.apcprd02.prod.outlook.com (2603:1096:201:1f::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 03:04:30 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cea8b0b1-223c-4909-c92d-08d991e400f0
X-MS-TrafficTypeDiagnostic: BYAPR04MB3862:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB38621996A7BCFC2C706110FFC7BC9@BYAPR04MB3862.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:66;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: n42ZbJV3SuyTyvR/3krgkvX470+L869SJrd3a6f2iWOYgEMnlukuCCGu9naZWGqBnwufu0tzk3Fk9IfSns6PqUoRwxqcn6wjUHraaGdjmX+rVFlijo2u/R5pOTkOws7utD2pA2YuoPvosaVCoSxPP3MoIhe8/+L7Lbo7h1AQvy2dhHvYxAjVdtKv8g5wMocfRYyfQ4HZwws9m+cMVBAz42O7PEAiqfPDmC7OST5oUMWZVGIoRL+HmpQCip+voX/ttE1/hrskfQI4lywa0lVmTPuj/im7SRjLhgO9QfpxdYov9NKs105UuPWzWT9S5SWVUsdGYvnk3xiY+1lEvqVJ/jxsjILaE4RkL3V1Aq+v0AM5+BkMzCquTpPnvb1avhl50oDqdEAoMGwP/A1Q6YyuMIx0VEL5uXx04vMVow5J/WTn5kb6VweKvm3hcRIEXb9cwyQFzo618d4CPTKGXRrJJduOYGndc0BXiR5OgK2Uqh+WoqhJBSbOjRCqFWc+duuHB3/NgtfPYlrthY5TtM7iRiCbB/L+lgBYlSNIfTWX32MXgz/2gmxCJdBxwPB6sILwzEZuStffh9erukEssHF2zCXNUqhxGUhlAD5r5Hy5Ek48g8vDu2JqgMTdoOTIj63wRpAQ0X0KXjn7/Nn4vDbDVNmeokOqqJJJkC6KR0MFOc3j4VfkehqSlsKdGnrSkaoaE04gxohqqlJoT9+fyjXH+Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(2906002)(38100700002)(186003)(6666004)(1076003)(34206002)(6496006)(55236004)(52116002)(107886003)(36756003)(30864003)(2616005)(956004)(26005)(8676002)(66946007)(6486002)(38350700002)(7416002)(5660300002)(4326008)(37006003)(86362001)(8936002)(508600001)(316002)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Cm2+o2+76yV/CO1/XeJPZCPMQ8WZ5CdTzlwP+g67sq0VaMQZ4odKLHWwRcWn?=
 =?us-ascii?Q?NMx4AgrLkFXYixsHvktMPJDABSO0GRNdzzjIlLOQa2Ag8YS0biU0aYUCO2qw?=
 =?us-ascii?Q?sjh2lQcL7KcsccFR6BjZ20+07HvnwDhAWIluo1wJB+4nZHHV/p+iXNeJ9Ih1?=
 =?us-ascii?Q?2Ba5OLwDX/BmmQCEU1BDt0T88MpGQuVnd69lije1C4MmYXunMXg0wieQSJ/I?=
 =?us-ascii?Q?mJpiDCUvGWpd4mjnkFozsUH048egtOGaPS/oNs30bA0/5nUitGrMZEPmkQVe?=
 =?us-ascii?Q?M4RncNZ2DJkrEtB7mUgo1jHAKdFW7HQB/bsECx9ChAbGgiBtReDKTbOVJMKz?=
 =?us-ascii?Q?cR0kMHqPjSZ1GWY3qv4Zc7mq0Evm9KAfWmH6U1LUH0pwH2DzVaYD++YSzViV?=
 =?us-ascii?Q?WagaSnIE5X51sZjKyf589aKCR0S0a/Z7ZOpT5diwYks/NFubVTGzOBrXC+Uv?=
 =?us-ascii?Q?QqXXQr+l+NX18MGyBWH4ynM6nMlSl8wiGB8gQIATSAA1DTWRsI2iggg8qPpi?=
 =?us-ascii?Q?+TJVxqB5vigUgANkZwSCm5Yuh+GV4nfM1UQYrgWi0Pdqvea31GsDH4OYjPFy?=
 =?us-ascii?Q?7EsE7n/FYVLK28XUKjBhOqYWHB6yFU8CejfcVHxNKrfH3LsjeEE3LjQEzju4?=
 =?us-ascii?Q?5aiMyoke9pOMMfBbITDdcQVSB88bru1gn410fJYa6GdoY9xZ88WtdE7uPoLv?=
 =?us-ascii?Q?5UogK/ILoM0ufkIMOIzpwWRgUTFxfbhuTUbr4hVovsPJI/gx9TD+izVffpwf?=
 =?us-ascii?Q?H9IqWRJW6sd5yzeAD/wVHWSwoHRgzOF988Rx0cGunmD4yD1k4m+M2qO/gaT7?=
 =?us-ascii?Q?DjYKbm9T8Xir9v0w+GFE25peTkKAzmEzWouQLlcghiDRHi7HCo28OJIifeyV?=
 =?us-ascii?Q?IMrt7APvTMJk5lSE1DaKeY1hihsFcj3V6PmGPDJFDaFAAkSxc8dQ5JvkgXs3?=
 =?us-ascii?Q?+Uv2setLETBNwMO7RgSPk/+OvYRJEw5sUR3DCP8mHlDHlLrJUeRV+7q7Divl?=
 =?us-ascii?Q?EiOmZ7qsjl6PZSxtSHHTzxewWRKRvlLXIoWlhv+Y96+aik+qfuFq4mD7+tBN?=
 =?us-ascii?Q?cedQQONWGu6y1rcmX0Ar5pXYuVHpV/0z/SKvOBJZBSfirZl68cgckV6tWLcM?=
 =?us-ascii?Q?rfDkf3cl0MWEtwvKLtGjkfRmIbTCsoDba6CHyqTE6yBhrR6Nkm7hYFfA285j?=
 =?us-ascii?Q?IAbZx3AIBJ2Qb4XPzHBdGBQ3S2Da0I8MBvp2CU43dBc2hjKuwqCACUZrZObG?=
 =?us-ascii?Q?YCiEXyZmEg07gE72xi0RjNEtOZDccK80TXG8zdtUzEcNKbJh0yHjwtcJJl5r?=
 =?us-ascii?Q?rvVu7hZRB1+o4wlSTvipJtLL?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cea8b0b1-223c-4909-c92d-08d991e400f0
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 03:04:30.7093 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wW6P6sphmHKY7soyQU//La8bsn3w5WOkKZf05LF82DoQ+2mH0ujJL9HJ5Jzz2yoY7seq4daWB5XA6hSCim/Bcg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB3862
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
index 469037f2fd3d..92038c4661ff 100644
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
+
+	if (ctx->pdata.panel_bridge)
+		return connector_status_connected;
 
-	return connector_status_connected;
+	return ctx->hpd_status ? connector_status_connected :
+				     connector_status_disconnected;
 }
 
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
@@ -1331,7 +1448,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi->lanes = 4;
+	dsi->lanes = ctx->pdata.mipi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
@@ -1376,10 +1493,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
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
@@ -1475,6 +1594,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1851,8 +1974,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
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

