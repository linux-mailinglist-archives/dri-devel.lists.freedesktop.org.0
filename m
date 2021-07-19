Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F25023CD19E
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 12:12:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EFD06E0E5;
	Mon, 19 Jul 2021 10:12:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2112.outbound.protection.outlook.com [40.107.94.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7C986E0E5
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 10:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ha+AWfZHJ9fAZ0m0qFc7vug3dmUy4/f0yfRDySKBQL/J9AYVkHiVpKyWmE/mZzKWWN+IY+ha6y684WN57Z77hxYTjFR8VMjrqitVGvr90uyvpWwBosGl9tIFvnR4ZZPof04IIYb1efEK565JwgXdnLUdhoVdB7vses3r+E2ezE63WzDH5IqfRUvSRHECp7QWEKYLhc1k1Hgn968uLaj1wnLPkV8WjGm29spl59HW7E6wjiubTlG6ESZIPZBPExf4+wZJHPwyw5PXdG4omOaoaO7H4P1P2DU8k106BDTTgaanEF3sJiIJk07ITfhsQTpV92bY9iIVjYvHcMb8QFpDUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzAKmazeTdRPPEd+gIWSZKEAL5bDvhh4oRnNWRugv6c=;
 b=nSA917FqCoQYbU75zV7ikAXk/119z7AmDmJHJYEj43BZbDnhBa0kC2NKiAnusk/zexhU5Qq3BEquyhI170qnRnm+GB+5516kUO/aSyfpdfeyl+RV0gTV28PJoFWBfkpFwZoSl8gqMbR5KBxw3NBmbolt68YBMQZNdH/yjmqUcwtBf9yVBzOVaj4bRJGcM629cO96ls9uCXpCwKGSwsfXl04gp/yb1dlNQZt/pz8gi+sr5R0NY4Sgfa+y8syOZ0XK+sRp9I8dtZh5SotUymW6iGFW/D0WZN8EyARm+702xUU0nEqwY3Y1zD1p9GFFGlr/1A2DCnC3rbSqzIdyQxdukQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analogixsemi.com; dmarc=pass action=none
 header.from=analogixsemi.com; dkim=pass header.d=analogixsemi.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=Analogixsemi.onmicrosoft.com; s=selector2-Analogixsemi-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OzAKmazeTdRPPEd+gIWSZKEAL5bDvhh4oRnNWRugv6c=;
 b=Srt/Agvyqrvl3fjmepOCAQtkxRk7wlnJWnZwiYCmIxTR9laQfzLO2uu37G/9jed4OXQR5XDPKYrh/plK3Z844DK+7MnDq9K/QTZh3x4hm5Y8jHZuGZa1GpJDaKP0nF65fDT2uwIhi8vXaigE6E5UjKy4HTs76WV6334LU8FAFRU=
Authentication-Results: driverdev.osuosl.org; dkim=none (message not signed)
 header.d=none;driverdev.osuosl.org; dmarc=none action=none
 header.from=analogixsemi.com;
Received: from BY5PR04MB6739.namprd04.prod.outlook.com (2603:10b6:a03:229::8)
 by BYAPR04MB4742.namprd04.prod.outlook.com (2603:10b6:a03:5f::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Mon, 19 Jul
 2021 10:12:17 +0000
Received: from BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6]) by BY5PR04MB6739.namprd04.prod.outlook.com
 ([fe80::5c0e:fbe5:2bd6:ec6%4]) with mapi id 15.20.4331.033; Mon, 19 Jul 2021
 10:12:17 +0000
Date: Mon, 19 Jul 2021 18:12:11 +0800
From: Xin Ji <xji@analogixsemi.com>
To: Robert Foss <robert.foss@linaro.org>,
 Nicolas Boichat <drinkcat@google.com>, Andrzej Hajda <a.hajda@samsung.com>
Subject: [PATCH v10 4/4] drm/bridge: anx7625: add HDMI audio function
Message-ID: <c89c7116c672fd1d7301fc652738a3f815bdc3cd.1626685856.git.xji@analogixsemi.com>
References: <cover.1626685856.git.xji@analogixsemi.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1626685856.git.xji@analogixsemi.com>
X-ClientProxiedBy: TYAP286CA0012.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:404:8015::17) To BY5PR04MB6739.namprd04.prod.outlook.com
 (2603:10b6:a03:229::8)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from anxtwsw-Precision-3640-Tower (60.251.58.79) by
 TYAP286CA0012.JPNP286.PROD.OUTLOOK.COM (2603:1096:404:8015::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21 via Frontend
 Transport; Mon, 19 Jul 2021 10:12:16 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 683e1af8-e655-4f4a-e4d2-08d94a9dafc8
X-MS-TrafficTypeDiagnostic: BYAPR04MB4742:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BYAPR04MB47427DEC71F651BFFD3FC5DFC7E19@BYAPR04MB4742.namprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:162;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mFl8bZrcVGXGC7NDZ4b4SS7qQcM+igLXHaQ/ImZR0cDO7zT4OGMiDdjZL1+lDbsrL4rthm4v5cslX8JJUOfEewdZJvvQ9kwaBPrvlHhlHfAnMEC7kEUdG6P1K5Ew8o4q1aP/eLc8nPfuex8FB2R4HD8EbeYH+uLKfzgMHKflTaACl77hkn5KJVbzLn8jn1LNUbsTTDY3XnZIA0VuE6R7meVgVBD9tDjHO/klc03UXfiN3GQs7bJg5yg0rO28Y0DYzVvRlGuFVprPnntQ/axQ9ceMT+/uNCS3zV3RmzwnUAzdc0M0J0VBCQjX7R5G6OEGeVM8nqRyUl9B8K/vYHkAeqw8CeRtLLoVXDuoqnvEed8BxSk92KO2fRQTVJNMwrgY67WmXCeZynSGuW3KNH2e9kkf+0VU84OBK6HVwMTKL+FtJI38s4pD+/SgIT8nwHjhGz4LrwO/3kF/l61SudHEbky1RYUbFBifEPyNKh3grMeu+6zEt3GLJMe+nBIOp+YnPzY1WhqBHPvVHo2wTrQwlW7EUycCqyZ9kwvExTLXa0EqjD0e4B/cG31AoNi6M912BYEcnw+H8eAL9EqdO0Es3PWjcXasEu/5LzGOxc1Mc00lQ0cHRtDJWX9RVF+jOnYtVLqIXPADLyocvDfuq1vSIycsKG74QsTJbgMPqqOp3sydQThijwE3Z6ud1ohpFLhBEQoFavoY3kDUK1TTXe2UDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR04MB6739.namprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(396003)(376002)(39840400004)(366004)(346002)(136003)(6666004)(54906003)(38100700002)(38350700002)(110136005)(316002)(478600001)(36756003)(8676002)(26005)(2616005)(86362001)(186003)(956004)(8936002)(83380400001)(2906002)(55236004)(66946007)(4326008)(66476007)(5660300002)(66556008)(52116002)(6496006)(7416002)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i33n4Q+V5iwyM5yEOco7pNRGkWmqxKv2W0fXdMOIM/J2WiNaZMqKT5V/E3OU?=
 =?us-ascii?Q?+g37Xo5H1KdV0euCVhq1wBjdNc+vfHK4QJGyzlYF5Jv/8VLIkYvd2Bpoa3Jz?=
 =?us-ascii?Q?0sI+YgHp7o1uQpGaTA0TkoWRgWXHsVneY+GlnsVtJ9LnzZkD+Gwd8Q5662dj?=
 =?us-ascii?Q?ck3QbseA2eQcI8w93PWEHznuKj0LEDFVAUVvJW5j7ZkvyBBr704SA4tgXXXa?=
 =?us-ascii?Q?ZiJhfx22e95ZKPqIwNVZZzjMrjihS8Xi//DBx4EDc3uo+q0aj1VVmJHb3E3A?=
 =?us-ascii?Q?GDNPitxOYS6WiR4Zf6PcFumgfV/6oSy5ulXlsCYcQWo7tHXftUnwnPI2XPAW?=
 =?us-ascii?Q?b7XtEfQIC8bGiiyT6ZfVxnnbqqwGWfRyavyjA2stft+wy6bhhF0xjccGtCuU?=
 =?us-ascii?Q?J23cDxSGvrkinOVAwSnRM7BWf2DWQPwfnly8Qcj1efEPcA1q2hN08UXKVK3o?=
 =?us-ascii?Q?pnVOqKVGnlvxDIeWTu8AYVHzEhZnKTAGEoa3WA58P4KV8ZkW18a0ijsFvaer?=
 =?us-ascii?Q?ChKH8+3VqZkzsVAD7aHGHBc6/pKOFRuxaBBEhXUMdt2kJLIjklDxIAJFQUsZ?=
 =?us-ascii?Q?MTMLMg01BRoUlLdqnBaj59WcsTFY1g4JGIlxsQQ4qa7rPhO3l09u5Tp9NoJI?=
 =?us-ascii?Q?5JitzN18NkZy9RhReC4UjioYX0xLiDcAEiFOqXSfIkLBT2R6c/Wu/LY09abm?=
 =?us-ascii?Q?u6JBsaiPP0lQFYNVTvd59sOt28erYFitpGO7XvKgMXTs6BIh0LaI6qAyEn1R?=
 =?us-ascii?Q?mSsd18uW5x038Z7A6NYizbNZAr1r373F4YIX2Oqn5hY0oDHPw121h5/XwXt9?=
 =?us-ascii?Q?NseX8dDd9r5/CBvbzycuyhmUGrPctM/9McpSND+dBLsXQmkKxXrDfWFyCnqn?=
 =?us-ascii?Q?V1iW11fq9wh5enuQJhKO+8VOUFlJD0Wqx48ABxZxwPIAtWAlN+kHBYDrOjsi?=
 =?us-ascii?Q?VSg04x/Xyk56oI6U37xEkYTyQXPvLL0HZMK97B4YyfnYSVyvf8X8eEnzry8Q?=
 =?us-ascii?Q?sKVADaiE9scNVI2rz6QZ2OzO7hMfu+bTJ+5KEZUXpehLTebrNiTR+CZokanD?=
 =?us-ascii?Q?ML1ikWCFjOmKI0vgNzccCh5Wi2tCQbhtEyMrjcOduiXzpROSAGjLJ9iS27CK?=
 =?us-ascii?Q?YRUg9zI3OX0Zc5AEFGRHV7ridHB4ZOQtANwuqD1sOSNkEUoRR+DiS0CJ2UZz?=
 =?us-ascii?Q?FVnadHQ1tEcC+EVxIzQlVjZpUeS0vFv584sTWPleCqYCbcY4uiLpcgrRL3lK?=
 =?us-ascii?Q?GyEKEUltjsBACs0ZOMN/F6LgC7VBSTEMFlaBZI/7XjbF8qFVffxtZA3hw9vV?=
 =?us-ascii?Q?dO+ZDPYRWS5zHd0b+bVKnXqb?=
X-OriginatorOrg: analogixsemi.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 683e1af8-e655-4f4a-e4d2-08d94a9dafc8
X-MS-Exchange-CrossTenant-AuthSource: BY5PR04MB6739.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 10:12:17.1156 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b099b0b4-f26c-4cf5-9a0f-d5be9acab205
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4qR3Kh5DI3fJxjeFIJMSnwJK7GgXDIUlVgn0MO1HyIodAVrrryHRaYv/yGUQE8O3couH0OiBd3KlmGEKiiPrNw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR04MB4742
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

Add audio HDMI codec function support, enable it through device true
flag "analogix,audio-enable".

Reviewed-by: Robert Foss <robert.foss@linaro.org>
Signed-off-by: Xin Ji <xji@analogixsemi.com>
---
 drivers/gpu/drm/bridge/analogix/anx7625.c | 226 ++++++++++++++++++++++
 drivers/gpu/drm/bridge/analogix/anx7625.h |   5 +
 2 files changed, 231 insertions(+)

diff --git a/drivers/gpu/drm/bridge/analogix/anx7625.c b/drivers/gpu/drm/bridge/analogix/anx7625.c
index a5a20cc0f3e0..44ab0893f600 100644
--- a/drivers/gpu/drm/bridge/analogix/anx7625.c
+++ b/drivers/gpu/drm/bridge/analogix/anx7625.c
@@ -33,6 +33,7 @@
 #include <drm/drm_probe_helper.h>
 
 #include <media/v4l2-fwnode.h>
+#include <sound/hdmi-codec.h>
 #include <video/display_timing.h>
 
 #include "anx7625.h"
@@ -153,6 +154,20 @@ static int anx7625_write_and(struct anx7625_data *ctx,
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
@@ -1325,6 +1340,9 @@ static int anx7625_parse_dt(struct device *dev,
 	else
 		DRM_DEV_DEBUG_DRIVER(dev, "found MIPI DSI host node.\n");
 
+	if (of_property_read_bool(np, "analogix,audio-enable"))
+		pdata->audio_en = 1;
+
 	ret = drm_of_find_panel_or_bridge(np, 1, 0, &panel, NULL);
 	if (ret < 0) {
 		if (ret == -ENODEV)
@@ -1395,6 +1413,208 @@ static enum drm_connector_status anx7625_sink_detect(struct anx7625_data *ctx)
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
@@ -1959,6 +2179,9 @@ static int anx7625_i2c_probe(struct i2c_client *client,
 				    DRM_MODE_CONNECTOR_DisplayPort;
 	drm_bridge_add(&platform->bridge);
 
+	if (platform->pdata.audio_en)
+		anx7625_register_audio(dev, platform);
+
 	DRM_DEV_DEBUG_DRIVER(dev, "probe done\n");
 
 	return 0;
@@ -1987,6 +2210,9 @@ static int anx7625_i2c_remove(struct i2c_client *client)
 
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

