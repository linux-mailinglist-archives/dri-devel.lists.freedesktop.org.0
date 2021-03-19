Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD4F341318
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:37:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FBF489FCC;
	Fri, 19 Mar 2021 02:37:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2125.outbound.protection.outlook.com [40.107.94.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCD4089FCC
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:37:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SvUC55RQnQSvCq1oV8qL2b35pgdNf3Tstmbuj1yN8SLjeJ6yocnMKq+gVFTx+oFrC+2Oawc76YIfATMc8T7VQTU7PMiWMxJkeTseZVGacsI3qFLc1M9lo6v0rqC9eQfleiEqUw/uaO9NJUCWT7sm8qI7q1djxjMHFDtjpsFS7CXUyR/r8DzxTCqL61A7t0HUo25ibXdjs8er7ouq2R2T4hCLm/jkEnc4GNZcIs7t2+4EFSfqb6EgTTvbW1NPCa+4Li5JEs7glK473kBy30DrCxsvgvVbIOku5+ZtrTSxXPmsjmA6AdakQW8IKmUWKBGvyQWPiOO2KiqzDO5QcL+V+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2cvsnCv/aNHOyYTeGYEVfdWay6HLEDW9LIWB5XfM7k=;
 b=e5ZlTxccli5disXwRQCUuWeZvU4wF1urEi5Ro41NduR27tSqRUQ8SjQXbs6GQf4p5dwsiJ3sg6HAw7iAT3QD1PHWcKXhl5QckRC26ksjASP0TJ6XBqZlJ6uoR0gYRJA3XJ+IGmkKgBGgmMi+GjtPuAZEVi+f2Ai5oBudpRBF6V0iXpBAzj7zHGlU2Amk+Scc3CvsKMOCAwznkf37fXnijBK+t02fK9wcglsYAI+9fmCNLCE3fWGYO/s/AR4HPp2jjQjDRJ1VOdwT7GVaVc/sevDuDX1wXtUYSmtncotxdpiW6yP+pGFXC7LY5G6ub5hEb1wd0/NbbPK0PNDP3LiCZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c2cvsnCv/aNHOyYTeGYEVfdWay6HLEDW9LIWB5XfM7k=;
 b=yBp6x23OKvv29hi6yHzGnzbBByYN8mGUNpPTdtLB828r0+OA5EMqdCObXZdR27Ve0dhsS/vnmTk7EyzxNemS7eRPEymAQ5tbVYgHsKfttlPidPM5CN4D9xJSuAZXeuOMrIFcQlgKNVRyi11AeX9ckbgpG8qCocwCuGQ55sB+qgI=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4277.namprd04.prod.outlook.com (2603:10b6:a03::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3933.32; Fri, 19 Mar 2021 02:37:52 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:37:52 +0000
Date: Fri, 19 Mar 2021 10:37:45 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 3/5] drm/bridge: anx7625: add MIPI DPI input feature support
Message-ID: <bc9a570d431a01e47903f86e93bd7ae31dc35de9.1616071250.git.xji@analogixsemi.com>
References: <cover.1616071250.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616071250.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK0PR01CA0056.apcprd01.prod.exchangelabs.com
 (2603:1096:203:a6::20) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK0PR01CA0056.apcprd01.prod.exchangelabs.com (2603:1096:203:a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Fri, 19 Mar 2021 02:37:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cc02992e-9917-4c67-6c43-08d8ea7ffe73
X-MS-TrafficTypeDiagnostic: BYAPR04MB4277:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB42773EFAFAAC1A8DA93A450EC7689@BYAPR04MB4277.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:28;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GaTcAVL44+hTnZ3cIslLj3e/gxzyu7JzEQUMBmbe+O3JKD78M3PbWTUVA820E8THg4IhfsEGeOAOmkirnnVTT1hkVIh/1a1SIX0ftShuV9IU9CpaLdtOu8xqxPCXXbPcWlV3CmvCLx8XNQoyqtLwNy5fFm5CPXvZmTvixwe1wgvXY6FeOHEfzD9v3e2x0XAILEDkMGDQI1U5cQOZo96SoGLFm+8Vz12Y324srvBdh1r3sKhMUTkivGy3qnS5iOQEqjb4PbG+BC34PUGnROhKwVIEPqQm96bqVuo9t8TK+ZgM6OzeTama+vVvDMRE0sljU9aWm7k6r+gbotqxz2i0vIH2z3ygPQqTyejgEQJk5iyrjLcREsnJJOiFM+HKBOo19UpAphQRx8MShcGg+JzUbg0GmDNEEGJ8+Bphl8ipBsCNtejgidBWsUeVprQIrV+w8n9CurAk4eDViJh8gJkkmlTePOKwo97yYAeBa5HkC15G81wiUPIlIBmkqswhVzOulJlG0/9HnO+Hr5MgIaKNQKjRwxOzzXx4O/ZTLfFOO8Ne+6zPYoS4W+yuD+qTc1RGg5cjStlU61ulQOKEEQ0DOnFCdYEzE164Y/OU47l6wx0DQSV7JH9aKi+HHoS/jBvc56lC+mvAjU8q1Ht44SAYmw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(366004)(396003)(39840400004)(346002)(376002)(956004)(2906002)(8676002)(6496006)(110136005)(186003)(66556008)(55236004)(6486002)(52116002)(8936002)(26005)(86362001)(316002)(4326008)(83380400001)(30864003)(66476007)(54906003)(66946007)(6666004)(36756003)(7416002)(478600001)(16526019)(2616005)(5660300002)(38100700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?UUmqIJjDy2LCdcamNMDyxxIsgv+E6V9N8QbrJiDwvyGxdfNC3VWwggT+ar9I?=
 =?us-ascii?Q?qdK33EH3FQNpKUsbHou1SrJV2VY6FtY6L5WqiB5JacWG1RuY3lauJW+YDE4+?=
 =?us-ascii?Q?Z1oJWyMAUnfo20Izauwlh1x4Jivq78LpHPR97Q2tQyNas8e7wmlQOsQU5H0i?=
 =?us-ascii?Q?79OENd08bWdaKUUgvn7m71xw1w1HTo+FTKt/cFxlWf7YfnIWt5f/nVk6Megk?=
 =?us-ascii?Q?hTsza/fhtoUj1fpOMizzrglqhc18e9Jp6oYXPSCe4IfgqouEtCtgflNojvyE?=
 =?us-ascii?Q?QDkpLS24+xr46anO9CljUOxKVBi7tiag/HGZeLTOPFtAAlY2y4IC1cIDtRjo?=
 =?us-ascii?Q?xlOwyL/4fAUkid7YkcSP+jGrkVvH/C+Y7IeUzqqgQTLn+hphh2JW1sNSfI7J?=
 =?us-ascii?Q?S9Q7ZcJUkLV2QzyT7ryr+QXxsaEvugHLUHCVIzPDcNVYGpAd8LpumWvjUpPR?=
 =?us-ascii?Q?l+kyjgptSsuFRyQl4Q2Y8ie3yR+7/oNcmEpEVubqGvcpV3RIf9v4DJoZBl16?=
 =?us-ascii?Q?dZ2QHa7htFMK+r1qtS42PW8MQxcZcc9WIm8sf7rI1ajJNZqAtV/pbHfbeE4H?=
 =?us-ascii?Q?o7AIwi9BmGe9R+Vfi7u3y1ZTI24OolHFlQ+ygrCk7QPDfr8URuL1nRYwEpRF?=
 =?us-ascii?Q?V1H96lHZt91JziwjrIzmC5g29mFfcuegoBC4u5FKMk9YNJGTXeB7ywQBxQfC?=
 =?us-ascii?Q?sd6pXuGHaUfJgTNEdqmS6SZePkmy4hOLL+gwaOMyWELSKtMkZJ+WS6CWnWVE?=
 =?us-ascii?Q?RSx5FK6MjFKNqHeI2yXPVE39ftiL1L4f2m8WLt+DdkY/acL4JByDoh3OQTI6?=
 =?us-ascii?Q?6iL6amgf27F4eTMfulexkCqrxo4cXDEVsLK8f+KmK93+8+rHoLYCzqok0/TL?=
 =?us-ascii?Q?819dT0mVJl23kSKvKuOaOwOmYXak3n5XBLRXwT47U2rBPds9B9oLtGIHwO4I?=
 =?us-ascii?Q?WM4Ref05Ps4S5wIQ3+YQbr/JAUJkNKCkAnXqKjy3b1iWdm2iinn0M23A1bnY?=
 =?us-ascii?Q?CPsu1KuQoNpBatHcvfJ6f8VGeuD6nQ5x2PmhAmKRCq3QvAOaudQyVNtIY5aD?=
 =?us-ascii?Q?zuiycUbwuruyrHS5LbiQ4DVoJm8+TB3AnUV63JO4TCPwHxOrHnW15OfRy3/9?=
 =?us-ascii?Q?APxfQzawCtVmKzAJZl472/vPUHnukug3LVQQTL8fsQt+/C/9MAqEFtKhddIw?=
 =?us-ascii?Q?EJepz26DMFYgBcrdYzuRREiXYwrke95qWafA7OhRY/UA+wu1zF4lfRwf3HE1?=
 =?us-ascii?Q?N/CDaf9Rzxcc/OgvEnde4id7dl8W0w2gYzB3g4zXSSY/NDy1Zu7LDKR/i/+l?=
 =?us-ascii?Q?9jpGBH7clGM7WU7tU6wRFEcO?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc02992e-9917-4c67-6c43-08d8ea7ffe73
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:37:52.6675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TM4X7e1ynv9cdyjiZJ+uRUiPnI3+u5DMeH72goNgfXBWJod4sPrsbz08Ez3une3dGsTBnheSf6TJ2A4dhJ4y7Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4277
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
Cc: devel@driverdev.osuosl.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Sheng Pan <span@analogixsemi.com>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, Bernie Liang <bliang@analogixsemi.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Zhen Li <zhenli@analogixsemi.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vasily Khoruzhick <anarsoul@gmail.com>,
 Boris Brezillon <boris.brezillon@collabora.com>, Torsten Duwe <duwe@lst.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Sam Ravnborg <sam@ravnborg.org>,
 Dan Carpenter <dan.carpenter@oracle.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add MIPI rx DPI input support.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 243 ++++++++++++++++++++++--------
 drivers/gpu/drm/bridge/analogix/anx7625.h |  18 ++-
 2 files changed, 201 insertions(+), 60 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 04536cc..5c9b801 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -150,18 +150,18 @@ static int anx7625_write_and(struct anx7625_data *ctx,
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
@@ -219,38 +219,6 @@ static int anx7625_video_mute_control(struct anx7625_data *ctx,
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
@@ -410,7 +378,7 @@ static int anx7625_dsi_video_timing_config(struct anx7625_data *ctx)
 	ret |= anx7625_write_and(ctx, ctx->i2c.rx_p1_client,
 			MIPI_LANE_CTRL_0, 0xfc);
 	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p1_client,
-				MIPI_LANE_CTRL_0, 3);
+				MIPI_LANE_CTRL_0, ctx->pdata.mipi_lanes - 1);
 
 	/* Htotal */
 	htotal = ctx->dt.hactive.min + ctx->dt.hfront_porch.min +
@@ -595,6 +563,76 @@ static int anx7625_dsi_config(struct anx7625_data *ctx)
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
@@ -605,9 +643,10 @@ static void anx7625_dp_start(struct anx7625_data *ctx)
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
@@ -1051,6 +1090,7 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
 		return;
 	}
 
+	ctx->hpd_status = 1;
 	ctx->hpd_high_cnt++;
 
 	/* Not support HDCP */
@@ -1060,8 +1100,10 @@ static void anx7625_start_dp_work(struct anx7625_data *ctx)
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
@@ -1080,6 +1122,10 @@ static void anx7625_hpd_polling(struct anx7625_data *ctx)
 	int ret, val;
 	struct device *dev = &ctx->client->dev;
 
+	/* Interrupt mode, no need poll HPD status, just return */
+	if (ctx->pdata.intp_irq)
+		return;
+
 	if (atomic_read(&ctx->power_status) != 1) {
 		DRM_DEV_DEBUG_DRIVER(dev, "No need to poling HPD status.\n");
 		return;
@@ -1130,6 +1176,21 @@ static void anx7625_remove_edid(struct anx7625_data *ctx)
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
@@ -1145,9 +1206,8 @@ static void dp_hpd_change_handler(struct anx7625_data *ctx, bool on)
 	} else {
 		DRM_DEV_DEBUG_DRIVER(dev, " HPD high\n");
 		anx7625_start_dp_work(ctx);
+		anx7625_dp_adjust_swing(ctx);
 	}
-
-	ctx->hpd_status = 1;
 }
 
 static int anx7625_hpd_change_detect(struct anx7625_data *ctx)
@@ -1224,20 +1284,70 @@ static irqreturn_t anx7625_intr_hpd_isr(int irq, void *data)
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
+	ep0 = of_graph_get_endpoint_by_regs(np, 0, 0);
+	if (ep0) {
+		if (of_property_read_u32(ep0, "bus-type", &bus_type))
+			bus_type = 0;
+
+		mipi_lanes = of_property_count_u32_elems(ep0, "data-lanes");
+	}
+
+	if (bus_type == 5) /* bus type is Parallel(DSI) */
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
@@ -1300,9 +1410,13 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
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
@@ -1330,7 +1444,7 @@ static int anx7625_attach_dsi(struct anx7625_data *ctx)
 		return -EINVAL;
 	}
 
-	dsi->lanes = 4;
+	dsi->lanes = ctx->pdata.mipi_lanes;
 	dsi->format = MIPI_DSI_FMT_RGB888;
 	dsi->mode_flags = MIPI_DSI_MODE_VIDEO	|
 		MIPI_DSI_MODE_VIDEO_SYNC_PULSE	|
@@ -1376,10 +1490,12 @@ static int anx7625_bridge_attach(struct drm_bridge *bridge,
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
@@ -1478,6 +1594,10 @@ static bool anx7625_bridge_mode_fixup(struct drm_bridge *bridge,
 
 	DRM_DEV_DEBUG_DRIVER(dev, "drm mode fixup set\n");
 
+	/* No need fixup for external monitor */
+	if (!ctx->pdata.panel_bridge)
+		return true;
+
 	hsync = mode->hsync_end - mode->hsync_start;
 	hfp = mode->hsync_start - mode->hdisplay;
 	hbp = mode->htotal - mode->hsync_end;
@@ -1786,8 +1906,13 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 
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
index 193ad86..beee95d 100644
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
@@ -347,11 +355,19 @@ struct s_edid_data {
 
 /***************** Display End *****************/
 
+#define MAX_LANES_SUPPORT	4
+
 struct anx7625_platform_data {
 	struct gpio_desc *gpio_p_on;
 	struct gpio_desc *gpio_reset;
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
