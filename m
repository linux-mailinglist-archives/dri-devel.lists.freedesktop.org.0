Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8088F3A9473
	for <lists+dri-devel@lfdr.de>; Wed, 16 Jun 2021 09:52:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B72AE6E516;
	Wed, 16 Jun 2021 07:51:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2098.outbound.protection.outlook.com [40.107.243.98])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F01D86E516
 for <dri-devel@lists.freedesktop.org>; Wed, 16 Jun 2021 07:51:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=by4Bb03uRTZ7oGuBC1KjtLvRVu6PsGd4IJl/DYGvFefNqu7j39yFiW5RNMFLB9tC06U+9w7FjN7twAWspTyrgLXyjuAT0y4S9VtImDmhe/kat/9z9rW5lt5qZXaorhF2VjYvW9y0ifaTa37Y6DJ+G9jstY0nM9pktztOW7yQbk5rM0vipj6FMYubfeL9oSqOEc6mY799baX7+O8b2y8foaZZefB7T+FFPAtNzxFIRW4Ud/PMQzuOyajnO+R08m9fjD/bmVDl+mECpxgYpGek9ZHMZY6/UUPovkN9/z9xNtTBfp96ocj0bWVKqWsWgp14yCwTpSbSfa0VTmdCqqt0OA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu9Yi6UpqNlJw3i3pLaBVcVTtBe5mEg5h4PnxgDED74=;
 b=FYDS1Fw8qPBR2zzy/J6AWz61MSQjBhSB3Z6azXwUIsGTpmYG5BWGHan8kItFsgpHcHOTNxprnRS/p5UfRjQwI8Qou2K+Av4UdVLvC6HEfDo31vg0MlLJCTHEqXe88ck3swrVj69hTcyDx7nlJacEIZaNNvl8Vo9mVqwC/RaWzVrshz0HvREJ0kMYdRHCrKIaP8/Lna7NCYTYY0h8oyUSt8TaLJNa7kuCyPg/p3eMt8JkheUccpDuzjoc1oBtSiTc8l0Fyi4pgtEOmkxMe/mDXhvF4QDIKIGwtVPSz6YHflnHFFVax4rFzHa26FQQPpHNYzXOP9bqNoBkxE+/Nuh7kQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nu9Yi6UpqNlJw3i3pLaBVcVTtBe5mEg5h4PnxgDED74=;
 b=e9uNEVSMxyEiPq1uOh9P1AKuTTtEIxOS4+7S8Dovk4l2eBwIHnGO5AF1KvI/J4jFET5Wn1ILbeVWTjkdl0USK+ZVHvXql6f/vLnHBfSQzBrtg35ffR3EwhFuhMgiI9StBZL2ViEZAnrzFOmvpiRfLF2IO4c5Byccy+d/uR75XDk=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB6261.namprd04.prod.outlook.com (2603:10b6:a03:f0::31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.24; Wed, 16 Jun
 2021 07:51:53 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%3]) with mapi id 15.20.4219.026; Wed, 16 Jun 2021
 07:51:53 +0000
Date: Wed, 16 Jun 2021 15:51:47 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v8 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <af0b2f6e74de06e29f4e054b73ed74f66f49b75c.1623725300.git.xji@analogixsemi.com>
References: <cover.1623725300.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1623725300.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0216.apcprd02.prod.outlook.com
 (2603:1096:201:20::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0216.apcprd02.prod.outlook.com (2603:1096:201:20::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4242.16 via Frontend Transport; Wed, 16 Jun 2021 07:51:52 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e1ee1937-e20f-4d41-bd3f-08d9309b9afc
X-MS-TrafficTypeDiagnostic: BYAPR04MB6261:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB62613C8D175C1E9C1A8C9DC1C70F9@BYAPR04MB6261.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Q6ahIRJkXCmsi9euHFXSWq5VumIXQ24JBn44CzkjwPgXMH36s0W2A4TGC3JBOjQeoN97wX/Ori9vUHftuhkVQQeBqaOUHpdgOPykLsUW6EmGmWD5gXYe58WrGJ1m+rZAHPAYc+aVFZEz7x9PEPFL7Sy7wr0AG0ACUY8XWw3sky3s+l1WZsU9q14Jbzgc7ZpkWBCOsQvE3RltRywDBA7OgvdTUACE+cPklzFj382y44gdYKQwj7scPmdoaHBSzol5c33/o3cciuLwL8R0kh6/46exN3u7+R7vqt11V0X8VedNCjg6sf79L6dJUCriWdOUG+e+u7doMfMu55xzv/6lrw1HFkuSKsYFwtxK9Z8zZ09gUjoCFriHYE+orNi0YNN7zWOCAUXTCPWEsU5liHy6EYeAhJsCtsPjV+IzRNpP5ubAvQZIVnPbUr5YNJfrLrIZftLf5/MnCqKVP0zAGzIjyyszB2orv3hMnT72Uresnnh3ii9FCz7xa/HR3+Bu6/fgSmc5yejCuQGVhLlLNcsdvtt2PZvhEnb1SXdaQfQ76aME9clB34wdVL61N2tPaDvwwbJE7fpHfVrAhEaLkE9ZEAGj6nHs6XvX9ZX92uhRa46WIo7d5XX4gKRbU3m/plWvz7O0R79azMkvvEm1EjEbrvCPmgkg4ACPGcbH912kMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(39840400004)(136003)(396003)(376002)(346002)(366004)(38350700002)(4326008)(6666004)(6486002)(26005)(38100700002)(36756003)(83380400001)(956004)(54906003)(2906002)(2616005)(66556008)(7416002)(8676002)(316002)(16526019)(66476007)(52116002)(186003)(66946007)(110136005)(6496006)(55236004)(86362001)(478600001)(8936002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vNE6C8FWPUEY9q9ZsoN0T/jUOGcv4uju5XptJGq51K1N01Ww89Dz3lcTyA76?=
 =?us-ascii?Q?2uOYjaO/sbjX4g59wSwSibhFM8A8E2Tjom+xM9d6lLCNYhy0Qk+F54op8vG8?=
 =?us-ascii?Q?+Q93uqTTBFw6DwU6n8I1KoRV+1eopCfkucSAyGptzNNw3mg4PO/SsmD0k+iY?=
 =?us-ascii?Q?VPzMBIHIhi1oexRwspwbb48/XOPJ2aCOD4FeV2dscsxIiroIU8FalnAOI2x+?=
 =?us-ascii?Q?mx51MA4TKHquKvbEJu5hqoDKcxRqMN/yrb3va7rlkPwKBVGtl8LiUkJCKI1o?=
 =?us-ascii?Q?x4SvQy3nMQFMrjnQEPTM5roJilmjcg9n1sWoFfeyCFlGdungg+epVWzXh7PK?=
 =?us-ascii?Q?HXWfS7eqD5Z/YHo6aIWn30Y6DppN7zLMYtljj7NloEvZFFgqQF3pv7SL4J/m?=
 =?us-ascii?Q?xUz6mCxDQtDWx4nmnaZjCZDd7H5VTkW4MljaVVi34KIM2xJ2d68qrv0yYlzf?=
 =?us-ascii?Q?lXNSxHDVDmqHH0UFoW5ZRczWGDtz7IKisgZ42PfshM5kECBKOt5F33gglJl4?=
 =?us-ascii?Q?JEX5JGiECjt0Q55MVHU7XthFa/f7IJEHewGVpOYi5d5eGsAk5++U6rjrN1/C?=
 =?us-ascii?Q?e7UEi7piufxJTZj7hDquBFyRrxexSA9CYEUhWiaVK48Rx5p5m9IwfZWNt3YF?=
 =?us-ascii?Q?8coPSqGWUUWH7wHrWjIojIyumM+xUb24NfVIZMFf1c2yiUJ4Ygu+08SIHnFt?=
 =?us-ascii?Q?YoYcV81vVYInB/s6qqQqUjikCslxgKOdObShw7vz9Qijr2VYLwv6ZYibhR+3?=
 =?us-ascii?Q?ng9B2S9yzgIqGQUg1glF/MLIoqen/N9ww1OnIIdX0YKAehpsClvPlKk71cf2?=
 =?us-ascii?Q?lL57sINKileF8eUvQPuDEmCyjG8TCXIZzRyGyYT0nHZnBbjHafTuoVq6d7XV?=
 =?us-ascii?Q?bZIjvaHwLpzBkLRxyUEc9IjLsu2VQpI8WyqPHrdw7O3j/Yfa4CGJq+cSq8vj?=
 =?us-ascii?Q?CE91Nc3cJb67vPSpnVnZDRN1uTFc5pMWirACLEjo2UmDcCfMZ+V/O4qUOLsi?=
 =?us-ascii?Q?jW/bQPxt6SxKkIvgEc5J9cW+eFxAIu8Wyag6rL7YqdZ0PQK2BFZqiICr9/TS?=
 =?us-ascii?Q?KbVt/xu6W1Os2gf8+loadEiIOxkjygy4cvSvCc/93Kvo6MvXPFz8oktonoZ+?=
 =?us-ascii?Q?8swG/XhYAu5kWcoe7ZL4lt/AcgTsM4Nbb4OiGzeFAFlQ7rCVb7A/wFDHcYMS?=
 =?us-ascii?Q?kBWENySZMxWkWeeE68VatwJDZdhhI1x5HDPo+WseSfCdGVlAIh+zqSaQwowo?=
 =?us-ascii?Q?mqjbQ/SLv1Sk3OKmTvmMvgVQAYr67ENGwa6w8JDQj+R6zrukXsRM4VzAj5Wk?=
 =?us-ascii?Q?Yi7I65PSscabfQeGM/ckKhkK?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1ee1937-e20f-4d41-bd3f-08d9309b9afc
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2021 07:51:52.9856 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IUKYrxfe+t0b3DzKuMeXHFlGF/8FlLRROOtAOclDDp7RJgJbT96JE3zfA2lA4rZA3hVZ1Ing7bgO27XgOl46Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB6261
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

