Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B612341326
	for <lists+dri-devel@lfdr.de>; Fri, 19 Mar 2021 03:39:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 773CF6E329;
	Fri, 19 Mar 2021 02:39:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2117.outbound.protection.outlook.com [40.107.93.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E74116E329
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Mar 2021 02:39:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LK3nXF6V78OsTvIGpg7nYpR2eob2sS3dD9PRXi+xwM1t8CCviG47jmbGa7YvJa82UueqZfnHrjKyJKCzXIGNKSn3xdLB1ya0AU+jggKKXH8BQpeuFS6CFHi2b8EjeUqWFJgvFZ6zmO/RJ8dAzIbGxJqOcsoC4XM4bbtqnPlAd7I5kf3lMzdk7arzKorAA1U4fbyVA/KhrMCgcJKPSlxOl4+KA6AZqpFqEw64knXuIn2eQPXjW8fEaAdyv2cLi8XPunCDO7YJpEmUhpiad1xG2pqVdYhQx95y1OA3eP3VNT9GCcxNhXAavr0VbYLNK7XrP6CXVC52VznbJSQm5dLyow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt2nXYpjZFC7IrNWHjLoPEcX/OnhxWH37S+jvDQX1b8=;
 b=evSu7PBIgqxzJWq3sJ/ptwrvXtvq5on2ZINp/O4gC0pceeNDj4KOAK6N3J5GHsFKK+43fYe5Tgju92+6g0reLEIMTXYiAGqHC9ONDSGf8WfW8Xo5POvIp65kD/buXDv3iOXGVhm0Hu28ikZhWyulXpzp+iltY04PSCh4cJnPu6SR3Pii6Zv7nhIYL6vckX5Sj3kqWhHMuP2H+sHKw1zmiKi294jXqxrTKu3vAiosIdWxcg+XvYbarTRoqXtiFyHxCtNnfc8K+UE1VvjTYLJkUVkOUyJHVjmaShCMa6vqxzEhLgKp+/3bQze1MvXH9h1ksUQX9PbAZsfLsT7fD7ZV7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jt2nXYpjZFC7IrNWHjLoPEcX/OnhxWH37S+jvDQX1b8=;
 b=ncPxkP4rgUS/5LDTpJ2NJDPaG7izCYpWEqzUZdJ3xeIDEgBHNcjRPZogboJZDM20d3T66mhsZA4kDDKpqQ/X/QccqMiXX4fHFkvhFOHOZAv1BPIDLD65RYWzrJoaEmGPcWcrv5vlnGcBtNhHw51ltdC+fO23VpqNdVcVW/McLSQ=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4376.namprd04.prod.outlook.com (2603:10b6:a02:f8::33)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Fri, 19 Mar
 2021 02:39:22 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::6481:f617:8105:491f%2]) with mapi id 15.20.3955.018; Fri, 19 Mar 2021
 02:39:22 +0000
Date: Fri, 19 Mar 2021 10:39:16 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v5 5/5] drm/bridge: anx7625: add HDMI audio function
Message-ID: <0ee28b74edfaeb5b8047bade7c97988d6133b81b.1616071250.git.xji@analogixsemi.com>
References: <cover.1616071250.git.xji@analogixsemi.com>
Content-Disposition: inline
In-Reply-To: <cover.1616071250.git.xji@analogixsemi.com>
X-Originating-IP: [60.251.58.79]
X-ClientProxiedBy: HK2PR02CA0144.apcprd02.prod.outlook.com
 (2603:1096:202:16::28) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 HK2PR02CA0144.apcprd02.prod.outlook.com (2603:1096:202:16::28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Fri, 19 Mar 2021 02:39:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5463f15-5021-4437-c8be-08d8ea8033bf
X-MS-TrafficTypeDiagnostic: BYAPR04MB4376:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB4376729B00D5C9118E5A1F29C7689@BYAPR04MB4376.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:76;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6SG7xC6BZVmpwDHb+wxf3a1p2k+AIF61BPUQxUm7XXb9ZMahDht3SJiBv4ZEFjLG27QNh2UEgzntiVCJjmUHZFP+c+dB+uiaD04x9TcKDuuDTT0CeuHIz3A44TenAeKIPTVn5nndjlMckEe1gfARK69DumTUPmlHBzqg+2nvY8b9bvB6Q0KExsMAHDn0zyrMRbpxwxBnZfLKn1JthEUbjFsibIz4Mhyhw+d7r5jo1S+YaYpYDbihF+pDt84HrbkVXuhR2XzxH3nxfpBOsWzGHq+VJXuIVg7JFVDnuEqNTeECMRwAD1i15/hgs5IVyHTZMBeYK3ZzYPn9NT7tQ82TaELbbprYsSCRuVtKC832jQWa1iSWu8hX6Toach2VKvpoStCW8pfeuJ3pcycFm6j552cXRQQDVQKFhZxoZqLgOKFlQVcfoP2fDb4eed0Dyvj7ssh4JI6vx3cGAuBye7NWwNmCgPfgMq3PGKFZb7giT92iUCckC07O2ulOs4ZarebQOC9sL/k7rgj9DfLqhhaz70nfUy7SfGrEQkDnBks++P/8lUPC37L5/yQmIlkhIaPQatrcQwg9HmXW2yo+fpDmmN45w2Vj5qUPH7U7rLpmf51du/pP72962J4EnCzqlFbYGyis86mMzaXRG+0v/+IS3A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(136003)(346002)(376002)(396003)(366004)(39840400004)(38100700001)(83380400001)(478600001)(6666004)(66476007)(316002)(36756003)(66556008)(16526019)(6486002)(26005)(4326008)(52116002)(8676002)(54906003)(186003)(6496006)(110136005)(55236004)(8936002)(5660300002)(86362001)(66946007)(2906002)(956004)(2616005)(7416002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?ku9PkZ1cIQxG11pelM2ep3DYVTY12IaEtipAx0Lz50WpeOmz+by3SbNAXLFh?=
 =?us-ascii?Q?tNfUPdnuNMtGiGTIseoMfXImaW0JIyRAH4aOUs5pJ6hvg89lzgBYwFicaliE?=
 =?us-ascii?Q?fOLubMhLEjJcqQAQI6jhinNMfpxIS/OTRiUXSAoMZDhjSrqW5wQFhPRJFjcu?=
 =?us-ascii?Q?iUU8xTU7p2wNwHMe+vtBGcNHV/ruFM/HwvxCAoiXR1B/VKUMbiQC+3OUjMSP?=
 =?us-ascii?Q?Rx9RmKLfJ5bh/72k/vyE4XJpLIGTHNMaiJIGwu4eM691j9uv6yG6WMS2waBv?=
 =?us-ascii?Q?bdP7by7ceVUhzyqImUXZ5OPdYj/aLmzZYs2xvckK7tIP91JYNfawGIX6NQ4+?=
 =?us-ascii?Q?oxNQAreKXNuHCHrRgN92BYDmJW1BiEyjgS48SdB/7IoX/OgabtSbmTt7fGVw?=
 =?us-ascii?Q?wXdbdI6icyaenAa70S6LDwgvBh+oTLnAAHfDXZIXy0OeEmzOkK8gRrd1su4y?=
 =?us-ascii?Q?uYp8Al7ZoDn75WovjXLkoBnqBLFhF4AzU1QCL7cmSPgJYyhBFKDQY+1pTK2F?=
 =?us-ascii?Q?PQQI57dmi4xEnCjxvBnGkPD/s+Kjv7kbe0ko48KWRpz3jsagJ8nQ/yTENgBF?=
 =?us-ascii?Q?WeEZZM15J44n4uZKXVUZarGQl+qfNqAIXGozDG6DtVxRi40jazlVHrRq+Dgx?=
 =?us-ascii?Q?foi5EnEAyTcklP2pcH6XSjmOOwteozr4Eaxhg9RO9D4SF0c2L2Gm8DqVM6fR?=
 =?us-ascii?Q?yacK6lsL+UndB+TzaKAcbF3h7zXGLn7vb4AHOR8WLkKeGgjD3vnyq6O3A8zv?=
 =?us-ascii?Q?DhDLbjNBeTo3H6xqStasXpgfHZdJhh4QMPmPUNJvAxsAog0IaLSVONrUUTwO?=
 =?us-ascii?Q?phjwgaMwErKsZvj2DPHvomE5fcVZ8rLVbJtSTMffh6BNMVRu57IXjAMygHe2?=
 =?us-ascii?Q?evgbsla/UpWp3y2ifKz/kPjMGbcbXXjN61O9RT4U27P8tKaMtQbKezUdSSD+?=
 =?us-ascii?Q?tD1F+lqbAVA+6e/MMr4iZDY4Pp91R5HS8xt3gf52xYqCYGQxb9GMOvLqaY0s?=
 =?us-ascii?Q?v4MUFYWw36u1XZu3ZB0xfrK30daJQsw4wv8lsCQwwd4vGpNAb1p5aFiNYisk?=
 =?us-ascii?Q?t/tQJP2DQhaH2+wKSgd5C0qk5fDR1L4DAZNTC6fFeU0vaEwBrYgzDXzmYHDD?=
 =?us-ascii?Q?GWzsoORZpcNLgIX/a3QIDcnjjYBc/8jF/o1pX1ifRvUg5hAcXgGiXUes+RH/?=
 =?us-ascii?Q?LXUO+M1fC+swt6Owje2fd5lMwTPz8FCjqnJxqISbxYYZ64ZFAQEyOlnyrTEN?=
 =?us-ascii?Q?spCvwqIJPX745fJ78Ays1xqsxtCa8Z/5bhgVTKC1bAXpYjAlgvVSLLBUFRW+?=
 =?us-ascii?Q?dqEFxgVbYuYbhWJH1NjZR3NG?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5463f15-5021-4437-c8be-08d8ea8033bf
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2021 02:39:21.9358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/IxouWB4G5ntXUdb8fHGxHY0+gUNOoIwx55xHLDe0wj1P7GaqkI3TbJo7xoWMLKZToW54qkI287ZuchRQunRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4376
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

Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 227 ++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |   5 +
 2 files changed, 232 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index 5e19170..f4653f2 100644
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
@@ -1496,6 +1512,9 @@ static int anx7625_parse_dt(struct device *dev,
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
+	if (of_property_read_bool(np, "analogix,audio-enable"))
+		pdata->audio_en = 1;
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1566,6 +1585,208 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
 				     connector_status_disconnected;
 }
 
+int anx7625_audio_hw_params(struct device *dev, void *data,
+			    struct hdmi_codec_daifmt *fmt,
+			    struct hdmi_codec_params *params)
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
@@ -2062,6 +2283,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&platform->bridge);
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -2087,6 +2311,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
 	anx7625_unregister_i2c_dummy_clients(platform);
 
+	if (platform->pdata.audio_en)
+		anx7625_unregister_audio(platform);
+
 	kfree(platform);
 	return 0;
 }
diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.h b/drivers/gpu/drm/bridge/analogix/anx7625.h
index c6f93e4..d6be2a8 100644
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
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
