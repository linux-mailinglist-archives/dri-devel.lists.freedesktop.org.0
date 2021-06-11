Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 367D63A3EDF
	for <lists+dri-devel@lfdr.de>; Fri, 11 Jun 2021 11:14:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 405ED6EE56;
	Fri, 11 Jun 2021 09:14:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2106.outbound.protection.outlook.com [40.107.243.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7732E6EE56
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Jun 2021 09:14:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gfsPiIGvrZjJ+PgmqARJxtwJUFAaYexkgPEoW04mVyTcv4V6Xc9fLJLdZ1QzLzKlLOfueo3pX7M18GCLPhsxxRxDfj4Ue2UvEsEZEJY3gXaZxBrPmqEbYDbkG07WpohbewlfUjSAjT3V2vdlFohcvkD9hli+pmwBOsibus2nFzjbECAz/05p1Udq8szttIr3MpKOKV/aZSbhtvAaleoV4xw+mhR12acLDd2l+Jcy67H7ligJuSiM9OCTmsfEsUmFWAQCII0fYoGUghrXtP9/1LAHZTNxgziuGFPmfe+efbaAx4d+Ibv8Qk205u+2k1RMe0wNAx+tH9xwHrROchVHfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu9Yi6UpqNlJw3i3pLaBVcVTtBe5mEg5h4PnxgDED74=;
 b=d2G1rR2pFKbnsTt7qGlMmM8oC6BcNfCb6e9aCsRYCRV6q4JFU6OYIOiG42HXsOX0lUzujI/6tMWzCQLeQ1tIBOYAeWuu4rwYSLa5Fg4FaQK6Z4dQYlV8SdwpjZD6CjvMfuIGFi6qHsSze7Jb7mXa1l6EtN3kVm1krqvTobyBB2Q6J3Zr5/0bvFS06KnoxF+tTlfT6qPordCqVOcNjFtpigfH4Ax2cixQt1h4M/KzQagiXNEHKDegOfMRr1ElKRa4c3n6i7+U25ztzn8DTYoFz6t4H8Fj1hzxwKGiTg814uggfKTGMA3dhdPw+LasXk60cHIQMg0ZEPcEt/YKcUL/ww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu9Yi6UpqNlJw3i3pLaBVcVTtBe5mEg5h4PnxgDED74=;
 b=MKvx/kkw+nDheIP46q1TzwxmpQ8wvvSCHhpT9BLZHINOYWG6ERSA2LSkVRCvzU7aUNF54BhoY6nBPabC2xXPNinIbO/JzVJUJ7QE/gfPTD+X8ZMKMg9UgoPPj2msQw23/4H6yhrsNQe2HDUGykzk1BO0b19WfJCty2NzRB9voyA=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BY5PR04MB6615.namprd04.prod.outlook.com (2603:10b6:a03:1db::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.22; Fri, 11 Jun
 2021 09:14:24 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::8d56:f2c5:7beb:2bf3%9]) with mapi id 15.20.4195.030; Fri, 11 Jun 2021
 09:14:24 +0000
Date: Fri, 11 Jun 2021 17:14:18 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v7 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <d3f5955406b2100ca0c21f0d952ba663837dc64d.1623402115.git.xji@analogixsemi.com>
References: <cover.1623402115.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623402115.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR0401CA0005.apcprd04.prod.outlook.com
 (2603:1096:202:2::15) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR0401CA0005.apcprd04.prod.outlook.com (2603:1096:202:2::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21 via Frontend
 Transport; Fri, 11 Jun 2021 09:14:23 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d19864de-3bce-4c5d-7c12-08d92cb94de9
X-MS-TrafficTypeDiagnostic: BY5PR04MB6615:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BY5PR04MB6615B49E82054A48539CCF36C7349@BY5PR04MB6615.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nc+M4fHKiDfz0OIfD5Cot3276FCAn49LCLqWumD2+hNJFOElqlDgEKezr8BApYQdiSjQryhD/knw4nR0wD75TqLVVkPtWMLn0NfGFAX8+esn9gCDTqXkvFMqapjaEdtP+zrw4pvs6CxzHiehZvw9VK+2bhKhF92sXWRIRVfhrBBIFTa/diw0TlVz+tOU6EZXKxB9yRzi1MBs/SlKTLVkU17ErmMOtAGTkPPxRDWbqgr9IH497zIHVKxGAyq10MHBgv/Cbg6eGaiohx/VOt5PnAyrufxyYhEEV7NrdmBjBSkZI6TKsnNeoi8foIons1xVms/HpqnxGdnKiu5AW3PZVpbG61dCWhjXQuloQiQSXZWK/Zl+fZ7+HUEC4JsXxXF7COxkJGMaxoZPjYcsF3V8romyXxMHVh2LomrYS+gPzPE+tp21DfW72fnSXgALmoi7OBWj1XXhJLRQWkpKw5lgqVCNT7PgwmZ1CTbccu1Pa5NFAjDXu402ynk8t2wEN17NZZdYWQgo8nuLviPtxzY7+o7iD3JLpYRhcvzHvDWB9rTW+I1d5PXyHI1Cj8mpl86jCuxSt46pW9mvRskULBjkCXrbWkCQb1WS+kb8B6tzmsBj2CVd7IWgpPcPABA+SMBxiCRUlOdLwePABDfqW7ThOFpnkT6tAFlqPyJ0DASdJ3g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(376002)(366004)(136003)(346002)(396003)(55236004)(26005)(5660300002)(52116002)(86362001)(6496006)(6666004)(66476007)(6486002)(66556008)(66946007)(16526019)(186003)(316002)(7416002)(36756003)(83380400001)(956004)(8676002)(2616005)(4326008)(110136005)(8936002)(478600001)(38350700002)(38100700002)(54906003)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZD1IPGCusMBslqQUwx2krz8kowZa+W/PAvSzrax8k6IoGSP8VZCtbRbNr2EB?=
 =?us-ascii?Q?TIY+p0BJibtBFou2owGpdhFfx46bf4S5Fy/Vs/nEYxkchPArKMmDygsvjxT5?=
 =?us-ascii?Q?Xj7PHyMFl7EWTHESL/mXrsEq781Po29Axj/a5pWeUCmyOZT8akul9Hg9MSCw?=
 =?us-ascii?Q?j8vtqGvRJl+1MFNcRUlTP4PLx+/m9jCf5104gZgqwCWegoSLeouYEisS6Hur?=
 =?us-ascii?Q?zid2dspX3WCtZmyps5vWvj0WG34MuN5ImMCP6UiKWBAbcAXiNx5Gtdpl3alq?=
 =?us-ascii?Q?sRC/N7dRVwPkWBGEvqqmmfBDo3OgO35LlXjsHhL7qLk0KDTGOVyZJiyLUP7S?=
 =?us-ascii?Q?rvp3pVnMES0awz/IOGoxHWYJT1bPhSjz+MJJCgURxOJlrbSB4X6K+U9g25K5?=
 =?us-ascii?Q?oPULnPA3c1K2Cs4VRoPcQSN8TssBctO5IZ84bgEsE5jkqJlI0VbK9Pzss2vZ?=
 =?us-ascii?Q?lrBWYiRcg19P5/HxFlf07CiEL0MoL7ZDrEhxz9vU9OqonbEz+MQcIXx0Jr4B?=
 =?us-ascii?Q?NpblnHJxNFCNvsECKf5HBugx7LKwqdO5KdqQVJ1mFWsdwkHkxxtn5Yt16n9F?=
 =?us-ascii?Q?iOYydZfjIIwL3cowEFdsJHsmFg6PoQ9DWHs2gwpqU+nMeGquiod2tEL0z7LV?=
 =?us-ascii?Q?47HWH9uWjDvnAImEfP7mR+iJh0SsEIFumYJQJdxy8RysbtFy99jMnLVqmBd9?=
 =?us-ascii?Q?ayCgnjFM/4dkQWgtUh7GfmHlc6s92QzPBmzNcrIDZTWNEORagAtenzkzOFmD?=
 =?us-ascii?Q?EkD614IaSseGAbnXn2aNP/rQEba3raJBtNEFG3/yfTXe6ECSR0m1j3bVnvif?=
 =?us-ascii?Q?OkZwjeVdp/s5+X5Qm1BWalld0a6VbjhGGzpvJPWzCJhITrgKeeFPpT/R3noW?=
 =?us-ascii?Q?1HcUy0/43AgpHvVXw0c3AFSmv5HauU+P/1L3NJldvIqXkz7GetH6sdp3cMvC?=
 =?us-ascii?Q?MGPUxPRWVMjLvG5LkQkWrDIiFImWgznICCbeKz2jTr8JxOqI+bGfA8mDEiUk?=
 =?us-ascii?Q?nkBRvVhQIQCnXrzjFAFR3moTN/bM4s0UK7SHp0s2C2E08sQjBWSYjb3ZW4T0?=
 =?us-ascii?Q?kOAKbyaHjpg5cy4QPpQgCiqf/AM5jkuospqD8cebmKWm2EeEjBt4niEZtoO2?=
 =?us-ascii?Q?+G/eKgNelnwvSNKWcAi6R7WcjyzoA2GBgNmrMW8UMEmWc6ufZCxDp6/UX5B1?=
 =?us-ascii?Q?ALPUWI5sv8xd+XsQjIgbzOKpw8CdsfJYHic1LmZtbx3IjxzMa5f9jKGVG0GJ?=
 =?us-ascii?Q?TKRqxwLWHXhtekG+3hKxhJBaL0ABmJ4tebRTIaVygM0R9J0xqslsFKBb3qDy?=
 =?us-ascii?Q?Xk/43JPg6dC836i129n5aKYb?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d19864de-3bce-4c5d-7c12-08d92cb94de9
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2021 09:14:23.8918 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: j59TH7XLbtwhNxJQUH8FiL6l48fyE2owm7oMYaawFTL8Sx/F1dNOdz+IMTQyEf1IZ4CDQZAcSKXxEB6V0UnGqA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR04MB6615
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add audio HDMI codec function support, enable it through device true flag
"analogix,audio-enable".

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 227 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |   5 +
 2 files changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index fb2301a92704..85ee1fb8b678 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -32,6 +32,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 #include <video/display_timing.h>
 
 #include "anx7625.h"
@@ -152,6 +154,20 @@ static int anx7625_write_and(struct anx7625_data *ctx,
 	return anx7625_reg_write(ctx, client, offset, (val & (mask)));
 }
 
+static int anx7625_write_and_or(struct anx7625_data *ctx,
+				struct i2c_client *client,
+				u8 offset, u8 and_mask, u8 or_mask)
+{
+	int val;
+
+	val = anx7625_reg_read(ctx, client, offset);
+	if (val < 0)
+		return val;
+
+	return anx7625_reg_write(ctx, client,
+				 offset, (val & and_mask) | (or_mask));
+}
+
 static int anx7625_config_bit_matrix(struct anx7625_data *ctx)
 {
 	int i, ret;
@@ -1324,6 +1340,9 @@ static int anx7625_parse_dt(struct device *dev,
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
+	if (of_property_read_bool(np, "analogix,audio-enable"))
+		pdata->audio_en = 1;
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1394,6 +1413,208 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 				     connector_status_disconnected;
 }
 
+static int anx7625_audio_hw_params(struct device *dev, void *data,
+				   struct hdmi_codec_daifmt *fmt,
+				   struct hdmi_codec_params *params)
+{
+	struct anx7625_data *ctx = dev_get_drvdata(dev);
+	int wl, ch, rate;
+	int ret = 0;
+
+	if (fmt->fmt != HDMI_DSP_A) {
+		DRM_DEV_ERROR(dev, "only supports DSP_A\n");
+		return -EINVAL;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "setting %d Hz, %d bit, %d channels\n",
+			     params->sample_rate, params->sample_width,
+			     params->cea.channels);
+
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+				    AUDIO_CHANNEL_STATUS_6,
+				    ~I2S_SLAVE_MODE,
+				    TDM_SLAVE_MODE);
+
+	/* Word length */
+	switch (params->sample_width) {
+	case 16:
+		wl = AUDIO_W_LEN_16_20MAX;
+		break;
+	case 18:
+		wl = AUDIO_W_LEN_18_20MAX;
+		break;
+	case 20:
+		wl = AUDIO_W_LEN_20_20MAX;
+		break;
+	case 24:
+		wl = AUDIO_W_LEN_24_24MAX;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "wordlength: %d bit not support",
+				     params->sample_width);
+		return -EINVAL;
+	}
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+				    AUDIO_CHANNEL_STATUS_5,
+				    0xf0, wl);
+
+	/* Channel num */
+	switch (params->cea.channels) {
+	case 2:
+		ch = I2S_CH_2;
+		break;
+	case 4:
+		ch = TDM_CH_4;
+		break;
+	case 6:
+		ch = TDM_CH_6;
+		break;
+	case 8:
+		ch = TDM_CH_8;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "channel number: %d not support",
+				     params->cea.channels);
+		return -EINVAL;
+	}
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+			       AUDIO_CHANNEL_STATUS_6, 0x1f, ch << 5);
+	if (ch > I2S_CH_2)
+		ret |= anx7625_write_or(ctx, ctx->i2c.tx_p2_client,
+				AUDIO_CHANNEL_STATUS_6, AUDIO_LAYOUT);
+	else
+		ret |= anx7625_write_and(ctx, ctx->i2c.tx_p2_client,
+				AUDIO_CHANNEL_STATUS_6, ~AUDIO_LAYOUT);
+
+	/* FS */
+	switch (params->sample_rate) {
+	case 32000:
+		rate = AUDIO_FS_32K;
+		break;
+	case 44100:
+		rate = AUDIO_FS_441K;
+		break;
+	case 48000:
+		rate = AUDIO_FS_48K;
+		break;
+	case 88200:
+		rate = AUDIO_FS_882K;
+		break;
+	case 96000:
+		rate = AUDIO_FS_96K;
+		break;
+	case 176400:
+		rate = AUDIO_FS_1764K;
+		break;
+	case 192000:
+		rate = AUDIO_FS_192K;
+		break;
+	default:
+		DRM_DEV_DEBUG_DRIVER(dev, "sample rate: %d not support",
+				     params->sample_rate);
+		return -EINVAL;
+	}
+	ret |= anx7625_write_and_or(ctx, ctx->i2c.tx_p2_client,
+				    AUDIO_CHANNEL_STATUS_4,
+				    0xf0, rate);
+	ret |= anx7625_write_or(ctx, ctx->i2c.rx_p0_client,
+				AP_AV_STATUS, AP_AUDIO_CHG);
+	if (ret < 0) {
+		DRM_DEV_ERROR(dev, "IO error : config audio.\n");
+		return -EIO;
+	}
+
+	return 0;
+}
+
+static void anx7625_audio_shutdown(struct device *dev, void *data)
+{
+	DRM_DEV_DEBUG_DRIVER(dev, "stop audio\n");
+}
+
+static int anx7625_hdmi_i2s_get_dai_id(struct snd_soc_component *component,
+				       struct device_node *endpoint)
+{
+	struct of_endpoint of_ep;
+	int ret;
+
+	ret = of_graph_parse_endpoint(endpoint, &of_ep);
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * HDMI sound should be located at external DPI port
+	 * Didn't have good way to check where is internal(DSI)
+	 * or external(DPI) bridge
+	 */
+	return 0;
+}
+
+static void
+anx7625_audio_update_connector_status(struct anx7625_data *ctx,
+				      enum drm_connector_status status)
+{
+	if (ctx->plugged_cb && ctx->codec_dev) {
+		ctx->plugged_cb(ctx->codec_dev,
+				status == connector_status_connected);
+	}
+}
+
+static int anx7625_audio_hook_plugged_cb(struct device *dev, void *data,
+					 hdmi_codec_plugged_cb fn,
+					 struct device *codec_dev)
+{
+	struct anx7625_data *ctx = data;
+
+	ctx->plugged_cb = fn;
+	ctx->codec_dev = codec_dev;
+	anx7625_audio_update_connector_status(ctx, anx7625_sink_detect(ctx));
+
+	return 0;
+}
+
+static const struct hdmi_codec_ops anx7625_codec_ops = {
+	.hw_params	= anx7625_audio_hw_params,
+	.audio_shutdown = anx7625_audio_shutdown,
+	.get_dai_id	= anx7625_hdmi_i2s_get_dai_id,
+	.hook_plugged_cb = anx7625_audio_hook_plugged_cb,
+};
+
+static void anx7625_unregister_audio(struct anx7625_data *ctx)
+{
+	struct device *dev = &ctx->client->dev;
+
+	if (ctx->audio_pdev) {
+		platform_device_unregister(ctx->audio_pdev);
+		ctx->audio_pdev = NULL;
+	}
+
+	DRM_DEV_DEBUG_DRIVER(dev, "unbound to %s", HDMI_CODEC_DRV_NAME);
+}
+
+static int anx7625_register_audio(struct device *dev, struct anx7625_data *ctx)
+{
+	struct hdmi_codec_pdata codec_data = {
+		.ops = &anx7625_codec_ops,
+		.max_i2s_channels = 8,
+		.i2s = 1,
+		.data = ctx,
+	};
+
+	ctx->audio_pdev = platform_device_register_data(dev,
+							HDMI_CODEC_DRV_NAME,
+							PLATFORM_DEVID_AUTO,
+							&codec_data,
+							sizeof(codec_data));
+
+	if (IS_ERR(ctx->audio_pdev))
+		return IS_ERR(ctx->audio_pdev);
+
+	DRM_DEV_DEBUG_DRIVER(dev, "bound to %s", HDMI_CODEC_DRV_NAME);
+
+	return 0;
+}
+
 static int anx7625_attach_dsi(struct anx7625_data *ctx)
 {
 	struct mipi_dsi_device *dsi;
@@ -1958,6 +2179,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&platform->bridge);
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -1986,6 +2210,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	anx7625_unregister_i2c_dummy_clients(platform);
 
+	if (platform->pdata.audio_en)
+		anx7625_unregister_audio(platform);
+
 	kfree(platform);
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index 65db38e5da9a..a9bdf05a1f66 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -111,6 +111,7 @@
 #define AUDIO_CHANNEL_STATUS_6 0xd5
 #define TDM_SLAVE_MODE 0x10
 #define I2S_SLAVE_MODE 0x08
+#define AUDIO_LAYOUT   0x01
 
 #define AUDIO_CONTROL_REGISTER 0xe6
 #define TDM_TIMING_MODE 0x08
@@ -365,6 +366,7 @@ struct anx7625_platform_data {
 	int intp_irq;
 	int is_dpi;
 	int mipi_lanes;
+	int audio_en;
 	int dp_lane0_swing_reg_cnt;
 	int lane0_reg_data[DP_TX_SWING_REG_CNT];
 	int dp_lane1_swing_reg_cnt;
@@ -385,6 +387,7 @@ struct anx7625_i2c_client {
 
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
+	struct platform_device *audio_pdev;
 	int hpd_status;
 	int hpd_high_cnt;
 	/* Lock for work queue */
@@ -393,6 +396,8 @@ struct anx7625_data {
 	struct anx7625_i2c_client i2c;
 	struct i2c_client *last_client;
 	struct s_edid_data slimport_edid_p;
+	struct device *codec_dev;
+	hdmi_codec_plugged_cb plugged_cb;
 	struct work_struct work;
 	struct workqueue_struct *workqueue;
 	char edid_block;
-- 
2.25.1

