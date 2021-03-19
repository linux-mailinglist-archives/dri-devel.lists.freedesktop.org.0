Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 745A83415E5
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 07:35:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BB146E98D;
	Fri, 19 Mar 2021 06:35:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2125.outbound.protection.outlook.com [40.107.223.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCE9F6E98D
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 06:35:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Sl1QTSb0p1LCNGbWwKLMr/NEzL7MyryDxai1h9MX3q1n/gwLW1bAn34XdWYa2qkGh2J+dI1A6W4zYZc0pYrQWJYVPsMUgnbNe/mitFWHxPIM4isCTavbrHm1bfG9qgW5ixkFH/sb4iUGXF9eJlQi9zvgpv5oKeZ7mHIshb2w64Sw2guXN9K712OLbqx2EHVl52W8KLN0sRZG+m+2rdHDH9acPnzkuxJfAAwx78TGtpUBx9MQZoLb1rQIeBNRVgUFG996/6AqzOiTTmOfZOjv0rWBzgsSJPBxuJ7P9M5CKvMbELE83RLzWJXeqWDWp2XzQI1cPwx/cubYKkGODpTfmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rTj3tCzTo6hp/x7AHElA4CIZCIWHmK1qYTbg45gts4=;
 b=g86EzgPesp5PLtLNzemS96NSKKSrzAurqMkxOh/XDEpCI8WiIcFxhAM3dfSJCgds0OcfAwH6YZvFLvE3sGJzsHeFyUDfUwEU8Yikd5SPjUg2rsKSsqCuNUa/a+vxJMJNnHq43ELKdUY5Z9l+T6unrTSiTMimJpqxRTN1yRPdtSy+Y4q5bDoBdLQn1VPbuFurSdMyz9r7UdjpO0bkNetoyWeVXFv/cl39LE+FDyKL6XwA4YWD2Dk/L+KSXFRmkMnvP/jZH6C3Q3YygU8iFiiV4N3AJyqaSxUczETWaLZPSphjXR6yQGlbYvARcGarof663BWud2JXJT9Qa49MwmWUew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3rTj3tCzTo6hp/x7AHElA4CIZCIWHmK1qYTbg45gts4=;
 b=q+Rdd6kRNU6VYmGGCLfUP4THb+kyff04HvFRv7DuSpTM62NgAgfRYkzuHRfnGWSwgRsIlxchpFNMuYKZsAXM0l1X4QHxjKg31g7UYGVT2SRJ8Iq4TuExUif/6DZRS9toFIfz+7WNIuHjeKgokK71s4kzRcFVesDwWOlHJBNusZY=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4581.namprd04.prod.outlook.com (2603:10b6:a03:15::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 06:35:32 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 06:35:31 +0000
Date: Fri, 19 Mar 2021 14:35:26 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v6 5/5] drm/bridge: anx7625: add HDMI audio function
Message-ID: <f5d689c6ad6fd585292550950e9c69c31e551e61.1616135353.git.xji@analogixsemi.com>
References: <cover.1616135353.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616135353.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0173.apcprd02.prod.outlook.com
 (2603:1096:201:1f::33) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0173.apcprd02.prod.outlook.com (2603:1096:201:1f::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 06:35:31 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fee40ef2-8fd3-41af-0b63-08d8eaa1319c
X-MS-TrafficTypeDiagnostic: BYAPR04MB4581:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4581D116FAFC5680E0081B85C7689@BYAPR04MB4581.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8QqD5AjtJ4mJu2jq1zGYdWw2pGTmb6ml2LiXdwqyZe4YvHpcZvrlnh9szZ+zE3hKUIiOVsWWuiScncIJPvQmMlG+PCdgI8cJGkIbi+6wvhy6SRu5tDgCZRbdVrzOsRzF/dCBPjPHZw2sfkpyplreQ0hYWc4alxytE5S2PYtyR8ZvbVgtXlHHXiFEdnUDzlDTxnE8RBAB4bJkaOQCduKikrideg4Otde66cVTg+mQ52vOGIADJYHA9r6QujtzgtIYD/lhtSGtJbBKcHkhDhCNU/sF6cxwXkWGfH8nl5T1+nQbPdYptllK0FoIFCzIAdMY0H/Qeab/WUuAjxhLRvTMQij4dYbuxD0acw0LbdmsCsl/7PDEwes7MI3eHd1Jk2OPX3+aBZVPLl0nSoVq409RyFuIWFqQR19vjQVR15BXDZXBxYQwSxn1/58tQNUZat5nGgoKt3TonojxTkai6MEJATTE0dCM+EjGzCa0oCoDM7+Q7mc5W4uQjNBHFp0/xMMnbkugRY5FJ7t69cXfGSQdrg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(346002)(376002)(39840400004)(136003)(396003)(26005)(54906003)(7416002)(186003)(36756003)(2616005)(6486002)(86362001)(6496006)(956004)(38100700001)(16526019)(2906002)(52116002)(8676002)(5660300002)(4326008)(110136005)(66476007)(316002)(478600001)(55236004)(66946007)(6666004)(83380400001)(66556008)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?hH+6aU8OD3fHdNdzeixBhXPk1mMGZR1WJD9Ev5cJVvSWYrXyPrkRdgb6KUBc?=
 =?us-ascii?Q?eU46qBCdoj2A3d3nMs2MGyaYIh1N+YtmzGiJR4zyCPrwmkJMO88x45tcxaak?=
 =?us-ascii?Q?ALXFl+VlVL6l3Tu75Bt7C7us2kA6Pyym5ak1gM/uOTqaDSY+sybVb4FNdLvH?=
 =?us-ascii?Q?+lmtrgeqk2VeSBQYN2fa/4wUkM8AxhdvB1T1qsUiASLYZuQ3H//uCuI11P0G?=
 =?us-ascii?Q?glIw1Bq5vU22SM+UuMtiu3jld5U+t6XeGmUy5AJonOcuQnClbTOKb9ox+o0M?=
 =?us-ascii?Q?ano4FgtSdsgLz3nibp1YUF/4UIujX4Hpzu2PMi0+UdKqYbDES3Mu2N00GdGO?=
 =?us-ascii?Q?sFnBq2vSz5bKsd5Rh8sCsSdNufENCDg+vP7bKiwpGwI1GLs1dYt1vIXxSLKp?=
 =?us-ascii?Q?6PhMgh1/mdW/fa1Ef1ejj+e9lgBiuT9mAH2bmQ3H2i3i+nE8vetQ6StQc/Pe?=
 =?us-ascii?Q?P0Lu+VgvScoHX4jBvwUXW8eR+B7eX/cAsi7Qa1kCBZtDOePenG0hy6p9wLGg?=
 =?us-ascii?Q?mXV9FBjmfkNrCO45m1SqYNzox1BoDKTBvu0aniQzPku44UFfPZzLMawdlo3Z?=
 =?us-ascii?Q?h9FXLId7C+e1eq6+dIlQ1cg+uDYC6OHti5qoXvnwjoXi5vIHN7XN+rAR0UQe?=
 =?us-ascii?Q?U9BlfbtkfEWzjNylfi6Vfz3E0gLrN+OKMujsRqmpiNnBY7SUgAgTlBVLlQbp?=
 =?us-ascii?Q?M9/wXNzfPxzmMT3FFBSO5JumHKChhjdgJra+snDMbso85Ys151Pio63FeTwq?=
 =?us-ascii?Q?M8e4ZgxOV5TqyTKvMD8RiByNNLp2ShAkOO3iTlBxp91KxjKmp6JtfRRr/aL8?=
 =?us-ascii?Q?H4luMNDBJkmv97o6+jHtO727ylphxVe+qH1bhFFdPhXPvAT60eMlfwLzKxqq?=
 =?us-ascii?Q?a+Zhq3UQCwCMF4EKogZsQvXt2oDZIp7e8SoUeI55yX3C7n0c5GaJOLMuqFmO?=
 =?us-ascii?Q?uO5xcRoaqMx8s+1+YBS4vEeSAgzVp5kQ+IplNe+CXoVmFpl4A5pTbwl2Tnff?=
 =?us-ascii?Q?vUL8ze8QoedTks71AMCPv9uF9uDhMTELZ8OK3HMtz6bvOb1jFKRT+LFtw4Ko?=
 =?us-ascii?Q?SjhGHYmYH7/xWOJRufHFjghqDyvl68XdLQJ/ktoiaoflVkLswNAPN5MZqFcu?=
 =?us-ascii?Q?98NtpLLg/Z8TWs1J+qpurSTuhwPJ2kXxQJS9/FDubj2Xudo9mEgzKkVHCklF?=
 =?us-ascii?Q?iIG25U+4TiXZzzi/0oV9P6mi5OI/sVFDxmZHWgT69Zq9sQ7SJZh0fRv4nPtH?=
 =?us-ascii?Q?34EFxSOB7zpzRP4HI6Z+h644oF2UDeMcWbw3QkYyYwWrdUCz8TgAfOVVAuyA?=
 =?us-ascii?Q?WBZFitKpnSyjIHrFeLecbDOZ?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fee40ef2-8fd3-41af-0b63-08d8eaa1319c
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 06:35:31.7801 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: krid4z5mi4QyJtx7AHd6s1NuOEtHA7mwGhE8rhgvkGjd21vOu8ma0In7q5qRbStBB8xGkCrOjfBjqODOgLAUDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4581
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

Add audio HDMI codec function support, enable it through device true flag
"analogix,audio-enable".

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 227 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |   5 +
 2 files changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index b424a570effa..02bb169d9c57 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -30,6 +30,8 @@
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
 
+#include <sound/hdmi-codec.h>
+
 #include <video/display_timing.h>
 
 #include "anx7625.h"
@@ -150,6 +152,20 @@ static int anx7625_write_and(struct anx7625_data *ctx,
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
@@ -1498,6 +1514,9 @@ static int anx7625_parse_dt(struct device *dev,
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
+	if (of_property_read_bool(np, "analogix,audio-enable"))
+		pdata->audio_en = 1;
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1568,6 +1587,208 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
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
@@ -2064,6 +2285,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&platform->bridge);
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -2089,6 +2313,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	anx7625_unregister_i2c_dummy_clients(platform);
 
+	if (platform->pdata.audio_en)
+		anx7625_unregister_audio(platform);
+
 	kfree(platform);
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index c6f93e4df0ed..d6be2a83fad9 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.h
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.h
@@ -111,6 +111,7 @@
 #define AUDIO_CHANNEL_STATUS_6 0xd5
 #define TDM_SLAVE_MODE 0x10
 #define I2S_SLAVE_MODE 0x08
+#define AUDIO_LAYOUT   0x01
 
 #define AUDIO_CONTROL_REGISTER 0xe6
 #define TDM_TIMING_MODE 0x08
@@ -400,6 +401,7 @@ struct anx7625_platform_data {
 	int intp_irq;
 	int is_dpi;
 	int mipi_lanes;
+	int audio_en;
 	int dp_lane0_swing_reg_cnt;
 	int lane0_reg_data[DP_TX_SWING_REG_CNT];
 	int dp_lane1_swing_reg_cnt;
@@ -420,6 +422,7 @@ struct anx7625_i2c_client {
 
 struct anx7625_data {
 	struct anx7625_platform_data pdata;
+	struct platform_device *audio_pdev;
 	atomic_t power_status;
 	int hpd_status;
 	int hpd_high_cnt;
@@ -429,6 +432,8 @@ struct anx7625_data {
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

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
