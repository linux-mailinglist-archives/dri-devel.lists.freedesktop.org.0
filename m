Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D79C4F9310
	for <lists+dri-devel@lfdr.de>; Fri,  8 Apr 2022 12:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 047F010E393;
	Fri,  8 Apr 2022 10:33:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
 (mail-eopbgr80089.outbound.protection.outlook.com [40.107.8.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E981D10E41D
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Apr 2022 10:33:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ARDU35salKFhlOcpct2wkxuzkHyBfi3MhkufLFF90XOw5P7DKSxBpqb9jgyJZ6gu0kjCizwB1UlPI44G1fbes3mtrYIt/Jl7vYAAuBU9a9wF+v9019ZhuS3gfwmYfIlVeHXGrPQC3mIFJn+8P39+V1ub2xmZcuCWeKUpUJ1UQ8424uOGKoe9JilxnWRRUir2JWVZEK9prDU1rgbcAJaAY57KTrJg2BRdui1NbBJhg7Bpvh7B/Ix1ZNUvDjkqKqk4Mi+/g429Y3mhsmqOoZFtFKXtyfmEpsXvWxqRcb9yqB7x4x/6Glc8XDvJGx+tXp6TxXfUNSo4her7gDO9z7s2xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ejtBfzbWzWEfRbA052Z5HtmhmHAZq1Mhygd1OrxWbAQ=;
 b=HnTCRzEWJU6xWQCXBBENLOfz7UzlsHYUA46XE/D76gwDXVb9iNtqi4E8WZ016vyX1+Ped0EZD7zWFVRfZBKjh0TOWMSUvpyL/z+Bhj0SxlE6cEQlMyoawmq0nF2VNZnR3qCSsex20ugciemFLO8gnSKYT+YtqrIX2ysSicby7T3h90DCAqkN0Fk+K8N/tB6gUpJ0QO2xszbC4J2LlK3m5LFJ1/46bmuDgwa5GhkDZRioS9lRIDweWrwWyKDvcmG3C94LXoguHPndFzJ0svO4UbpW3X8yBjuhezCegngr9/t+43pUJ4THCPofTcYr5AfKTxnuopKOfuwU5QLWZ2KEMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ejtBfzbWzWEfRbA052Z5HtmhmHAZq1Mhygd1OrxWbAQ=;
 b=Me1vmOZMMHsxGzMd4OQbZ2FLHqzW8P1mwgqD6C6/Kjv0YjjlD2ICAZuPN6mrqH7rI6ZkWmvBEO3E1vfw8GbaHlKeWHrWLxtDwhpIQIUqTAGDcfbXNwOH58GlNURtdquGOJROnP9j6iQitO2eyKKEv46Lgq2DvBe/KdvbKgEIDJA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nxp.com;
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com (2603:10a6:10:86::11)
 by VI1PR0402MB3405.eurprd04.prod.outlook.com (2603:10a6:803:3::26) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.22; Fri, 8 Apr
 2022 10:33:23 +0000
Received: from DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430]) by DB7PR04MB5450.eurprd04.prod.outlook.com
 ([fe80::7997:2892:d230:2430%7]) with mapi id 15.20.5144.025; Fri, 8 Apr 2022
 10:33:23 +0000
From: Sandor Yu <Sandor.yu@nxp.com>
To: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 andrzej.hajda@intel.com, narmstrong@baylibre.com, robert.foss@linaro.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, hverkuil-cisco@xs4all.nl
Subject: [PATCH v2 5/5] drm: bridge: dw_hdmi: Audio: Add General Parallel
 Audio (GPA) driver
Date: Fri,  8 Apr 2022 18:32:28 +0800
Message-Id: <2ab98e4cf8fccc56dbb69b6d5248bb244f0c2a61.1649412256.git.Sandor.yu@nxp.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1649412256.git.Sandor.yu@nxp.com>
References: <cover.1649412256.git.Sandor.yu@nxp.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SGXP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::29)
 To DB7PR04MB5450.eurprd04.prod.outlook.com
 (2603:10a6:10:86::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 5c752bb3-fb21-45c8-2bf0-08da194b3505
X-MS-TrafficTypeDiagnostic: VI1PR0402MB3405:EE_
X-Microsoft-Antispam-PRVS: <VI1PR0402MB340597CDDE93B649B2C08E77F4E99@VI1PR0402MB3405.eurprd04.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: S/Z6LcmUv8s9sX6QBGfAhGlLgNaiQChzdU43NFrP5PeER97ZA3fNSyF/jRF0q8Rij28XKScbnjMcGJM0GeU5AItmdYqfbf1hBOKSkjzD8bkulVC2R79XvGvE8VMgj8cIKvThjcnioQCSze0uOMaqY1O94xuBskFMC10u1CNvTfvuupna54C/NyE9IxlmUtMr0bRtb14+0w/ltJ7D2tACxi8eZa0IvT8Hpj1O8GDv5E0xuOJVtSQzJCkL+KLY+FnOiT7FFaEggNJd6Aspo1mOumt2H+H2PRPRVG3hbSSFcc+4Os5O51tmnn5re3fH70brY4+/pbzPIDQEt8UFWlS3c4YAS7Xk+DcnjhDSp/Ccktd85UP5gg/nuEK1Bat+4EVTGSozAmxGKyL6dMBDw43pPI5I5eMWVnoJpmGj6EuDaGUxwDhj8vxuVftRva1TaVbEzcBEYFJsd1Ltlv/ijsy9NVDl4TJ+k8npitEiiv0I24PTDezO8O66uvmT0UGBTty8y5/9Vl3VR3v/VYnLJlmEYhQc5YVkF/ASdCHApG3lmv5CdjphjaVVR4XrMOEbLusq45HaDxcd5xSpPPXDan/8gTxfyuPV+ym0hju+QZ0QWOWvjMkfxNgHJ3REHZ0Kw2ni96xPp4zjAj2qiinZCju/0Y/56VZh2XHwGHSQpixNnS2m3kFATD2jjRNS+ZvSh2OykGmPJLW6EGMeRmYKsKuz1w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DB7PR04MB5450.eurprd04.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(8936002)(2616005)(52116002)(66476007)(83380400001)(8676002)(86362001)(508600001)(66556008)(66946007)(38350700002)(4326008)(30864003)(7416002)(2906002)(186003)(316002)(5660300002)(6506007)(26005)(36756003)(6512007)(38100700002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?XagKwmq9f9xA4AtyBK8iUrzQx85gwJ0DgKNa7TC3REvSYzUgGTcY6jzhFsZ/?=
 =?us-ascii?Q?TPG/XIJwpMBG251Wn9qKJzutMfei+lzcy7iCaiHEClMDf2d3biiPql19QCOj?=
 =?us-ascii?Q?6wMZ1KVskrmZJGB34GF/NJw/XU/DzpSf4wnXFFmqxfzzklKDuvyF8DF1ELYy?=
 =?us-ascii?Q?4U7dIGA2QuGNCGakdTWGKZ08rYeFo0AxpGeltQC7+d/XxhA13AAZS/oE/IiZ?=
 =?us-ascii?Q?UVIPlLiLrGWj2NH57sd5NsrGvKra30XK88TPDR1+FbiPsdgXonxUajpz5Z6d?=
 =?us-ascii?Q?GF8C66AyR14u8HoIlU0q0VMNI7udBBr1nGahQL5jgQayDf4UYs37Pq1of9rM?=
 =?us-ascii?Q?iN/zdYsH6jWJxLZMjf9cp7U09a3cr60WvJsEsVjtrSDhQseIfakVtWDbC80n?=
 =?us-ascii?Q?COLXSDQTXYJ7wMInbb8+uqBX3QfkKD3Ilpmt7ht4wEh/pQ/ySuB6UUDgtyPO?=
 =?us-ascii?Q?eyGdTziW5gF/Af8XXlFJPqErOo8MKKuC6wqA6HLMksCOs7PJ8aQxG3AhvANB?=
 =?us-ascii?Q?GnzSFDjhsBLdJWJSMFtrLtrNiS4AP4F26yGLDaHehKZba8Cp+kbgGrXmXPNi?=
 =?us-ascii?Q?nUw9sPtiDld2ABioehd4h4uEo4sttrS2IylGn3TMZ7eDX9DxmmVrPYCEXIjJ?=
 =?us-ascii?Q?Sd8rgMH09N6yTPbUsFJYhyHGEIg8B/jOc9DrtgBWCgcuAevhxjLpjR/5JUHT?=
 =?us-ascii?Q?QKcqx4LEv4aULy4dDNwvkDHs1andEF2NFsszgzxajuAeVXjbW6GOMUhdDGNV?=
 =?us-ascii?Q?YiMMN0cAGfFwSzOC7JjWrmZIUP1SdlCiFIJh5UfGfRSYf0m9gfp52b2EBqca?=
 =?us-ascii?Q?xyTcIlq0O18zqGAvZD6rW3leTiGfNSNXlVaPD3BbBrkERjc/0Mhy09l99l8f?=
 =?us-ascii?Q?6Zaq/66KHr/CCMVdxkLYxofnviZlazbK6ElJxuqOHdYtlv/WwYv+OOXRo7jL?=
 =?us-ascii?Q?C2jl7oNx3DUrXTahF4e2Vm1x37mo0AxPTkDN8Ua8UydTL3w3wIFUR+O8wYzV?=
 =?us-ascii?Q?dCruNTNNLs04LyjjE89lhPs7tQltlb8AuEbfJxoLHdwBJOwHdrACgsVKfxSF?=
 =?us-ascii?Q?h2CJGs28eE3xnDSFBKn2M/wAbLpDS5SNa4OQFeg0snilYdDwEDqcUYu+fyIf?=
 =?us-ascii?Q?nDoqssIoQ4eWLxzHMycZvG8V8HsZSg6OrXwxM7QnSWZpsCJvoiaIALBig4BW?=
 =?us-ascii?Q?tX5rDfPUGlcUPPlSM+43VxLfdWEhcrekiwm2AldwA5sbFHxrwYdlMnUXz3Wv?=
 =?us-ascii?Q?cMw2zRNatWYHOPeVUCUc+9QbM6jP+8ok/+2CvfvLdT0gOX73oPMV+IndvY+d?=
 =?us-ascii?Q?ARX165ovCrs/a2yMSz4UN5UecACEbVSrVVwqVlD3/aTxBWlYaLYtx3j6edUL?=
 =?us-ascii?Q?rxRC8tNws5+DwQIVYfYYjIhbYUy7zf4MtHehlzh1wwnZLUF+dSehwOejv/1k?=
 =?us-ascii?Q?VT8gvmvNkDTaXVYEcj6Havku/4GQlt6tRLO+GErWrlUqxDgIkDjSpSMIUx4h?=
 =?us-ascii?Q?zGXVA9yz9mzajgayV6TnboYL/huVolYc5g10iU4SjEmOd2tPT3bkmMcqfSGX?=
 =?us-ascii?Q?dNPDigMq0LKLytUCpNkBNdBFwoZ4uwQx3Wlo7TSnyOnfBFKIjUNaC1GEdqwW?=
 =?us-ascii?Q?+wxy8jN7m8ZPAKuT04HOUtpeUcrziOIP5EyM47rk2LDve7F60rfq2HdftItD?=
 =?us-ascii?Q?SBkxnJLyy8Ob3CuMgTpwJ4g6oT8CAznWceI/sc9fjxJdprmCMyEsphr62fan?=
 =?us-ascii?Q?7BDNUBAQ+g=3D=3D?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c752bb3-fb21-45c8-2bf0-08da194b3505
X-MS-Exchange-CrossTenant-AuthSource: DB7PR04MB5450.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2022 10:33:23.2088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WzUoiv94WfFIqCLIBsJ28ZL0BXDdXnrHUm33HxV89b19DJeg6eGWYIq7ONKh7xugv5hDwxcHFf2u/WhXNlm+OQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR0402MB3405
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
Cc: Sandor.yu@nxp.com, shengjiu.wang@nxp.com, cai.huoqing@linux.dev,
 maxime@cerno.tech
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

General Parallel Audio (GPA) interface is one of the supported
audio interface for synopsys HDMI module, which has verified for
i.MX8MPlus platform.
This is initial version for GPA.

Signed-off-by: Shengjiu Wang <shengjiu.wang@nxp.com>
Signed-off-by: Sandor Yu <Sandor.yu@nxp.com>
---
 drivers/gpu/drm/bridge/synopsys/Kconfig       |  10 +
 drivers/gpu/drm/bridge/synopsys/Makefile      |   1 +
 .../drm/bridge/synopsys/dw-hdmi-gp-audio.c    | 199 ++++++++++++++++++
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c     | 128 ++++++++++-
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.h     |  13 +-
 include/drm/bridge/dw_hdmi.h                  |   5 +
 6 files changed, 353 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index 21a1be3ced0f..a4a31b669b65 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -25,6 +25,16 @@ config DRM_DW_HDMI_I2S_AUDIO
 	  Support the I2S Audio interface which is part of the Synopsys
 	  Designware HDMI block.
 
+config DRM_DW_HDMI_GP_AUDIO
+	tristate "Synopsys Designware GP Audio interface"
+	depends on DRM_DW_HDMI && SND
+	select SND_PCM
+	select SND_PCM_ELD
+	select SND_PCM_IEC958
+	help
+	  Support the GP Audio interface which is part of the Synopsys
+	  Designware HDMI block.
+
 config DRM_DW_HDMI_CEC
 	tristate "Synopsis Designware CEC interface"
 	depends on DRM_DW_HDMI
diff --git a/drivers/gpu/drm/bridge/synopsys/Makefile b/drivers/gpu/drm/bridge/synopsys/Makefile
index 91d746ad5de1..ce715562e9e5 100644
--- a/drivers/gpu/drm/bridge/synopsys/Makefile
+++ b/drivers/gpu/drm/bridge/synopsys/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 obj-$(CONFIG_DRM_DW_HDMI) += dw-hdmi.o
 obj-$(CONFIG_DRM_DW_HDMI_AHB_AUDIO) += dw-hdmi-ahb-audio.o
+obj-$(CONFIG_DRM_DW_HDMI_GP_AUDIO) += dw-hdmi-gp-audio.o
 obj-$(CONFIG_DRM_DW_HDMI_I2S_AUDIO) += dw-hdmi-i2s-audio.o
 obj-$(CONFIG_DRM_DW_HDMI_CEC) += dw-hdmi-cec.o
 
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
new file mode 100644
index 000000000000..10a957c85a83
--- /dev/null
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-gp-audio.c
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * dw-hdmi-gp-audio.c
+ *
+ * Copyright 2020-2022 NXP
+ */
+#include <linux/io.h>
+#include <linux/interrupt.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/dmaengine.h>
+#include <linux/dma-mapping.h>
+#include <drm/bridge/dw_hdmi.h>
+#include <drm/drm_edid.h>
+#include <drm/drm_connector.h>
+
+#include <sound/hdmi-codec.h>
+#include <sound/asoundef.h>
+#include <sound/core.h>
+#include <sound/initval.h>
+#include <sound/pcm.h>
+#include <sound/pcm_drm_eld.h>
+#include <sound/pcm_iec958.h>
+#include <sound/dmaengine_pcm.h>
+
+#include "dw-hdmi-audio.h"
+
+#define DRIVER_NAME "dw-hdmi-gp-audio"
+#define DRV_NAME    "hdmi-gp-audio"
+
+struct snd_dw_hdmi {
+	struct dw_hdmi_audio_data data;
+	struct platform_device  *audio_pdev;
+	unsigned int pos;
+};
+
+struct dw_hdmi_channel_conf {
+	u8 conf1;
+	u8 ca;
+};
+
+/*
+ * The default mapping of ALSA channels to HDMI channels and speaker
+ * allocation bits.  Note that we can't do channel remapping here -
+ * channels must be in the same order.
+ *
+ * Mappings for alsa-lib pcm/surround*.conf files:
+ *
+ *		Front	Sur4.0	Sur4.1	Sur5.0	Sur5.1	Sur7.1
+ * Channels	2	4	6	6	6	8
+ *
+ * Our mapping from ALSA channel to CEA686D speaker name and HDMI channel:
+ *
+ *				Number of ALSA channels
+ * ALSA Channel	2	3	4	5	6	7	8
+ * 0		FL:0	=	=	=	=	=	=
+ * 1		FR:1	=	=	=	=	=	=
+ * 2			FC:3	RL:4	LFE:2	=	=	=
+ * 3				RR:5	RL:4	FC:3	=	=
+ * 4					RR:5	RL:4	=	=
+ * 5						RR:5	=	=
+ * 6							RC:6	=
+ * 7							RLC/FRC	RLC/FRC
+ */
+static struct dw_hdmi_channel_conf default_hdmi_channel_config[7] = {
+	{ 0x03, 0x00 },	/* FL,FR */
+	{ 0x0b, 0x02 },	/* FL,FR,FC */
+	{ 0x33, 0x08 },	/* FL,FR,RL,RR */
+	{ 0x37, 0x09 },	/* FL,FR,LFE,RL,RR */
+	{ 0x3f, 0x0b },	/* FL,FR,LFE,FC,RL,RR */
+	{ 0x7f, 0x0f },	/* FL,FR,LFE,FC,RL,RR,RC */
+	{ 0xff, 0x13 },	/* FL,FR,LFE,FC,RL,RR,[FR]RC,[FR]LC */
+};
+
+static int audio_hw_params(struct device *dev,  void *data,
+			   struct hdmi_codec_daifmt *daifmt,
+			   struct hdmi_codec_params *params)
+{
+	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
+	int ret = 0;
+	u8 ca;
+
+	dw_hdmi_set_sample_rate(dw->data.hdmi, params->sample_rate);
+
+	ca = default_hdmi_channel_config[params->channels - 2].ca;
+
+	dw_hdmi_set_channel_count(dw->data.hdmi, params->channels);
+	dw_hdmi_set_channel_allocation(dw->data.hdmi, ca);
+
+	dw_hdmi_set_sample_non_pcm(dw->data.hdmi,
+				   params->iec.status[0] & IEC958_AES0_NONAUDIO);
+	dw_hdmi_set_sample_width(dw->data.hdmi, params->sample_width);
+
+	return ret;
+}
+
+static void audio_shutdown(struct device *dev, void *data)
+{
+}
+
+static int audio_mute_stream(struct device *dev, void *data,
+			      bool enable, int direction)
+{
+	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
+	int ret = 0;
+
+	if (!enable)
+		dw_hdmi_audio_enable(dw->data.hdmi);
+	else
+		dw_hdmi_audio_disable(dw->data.hdmi);
+
+	return ret;
+}
+
+static int audio_get_eld(struct device *dev, void *data,
+			 u8 *buf, size_t len)
+{
+	struct dw_hdmi_audio_data *audio = data;
+	u8 *eld;
+
+	eld = audio->get_eld(audio->hdmi);
+	if (eld)
+		memcpy(buf, eld, min_t(size_t, MAX_ELD_BYTES, len));
+	else
+		/* Pass en empty ELD if connector not available */
+		memset(buf, 0, len);
+
+	return 0;
+}
+
+static int audio_hook_plugged_cb(struct device *dev, void *data,
+				 hdmi_codec_plugged_cb fn,
+				 struct device *codec_dev)
+{
+	struct snd_dw_hdmi *dw = dev_get_drvdata(dev);
+
+	return dw_hdmi_set_plugged_cb(dw->data.hdmi, fn, codec_dev);
+}
+
+static const struct hdmi_codec_ops audio_codec_ops = {
+	.hw_params = audio_hw_params,
+	.audio_shutdown = audio_shutdown,
+	.mute_stream = audio_mute_stream,
+	.get_eld = audio_get_eld,
+	.hook_plugged_cb = audio_hook_plugged_cb,
+};
+
+static int snd_dw_hdmi_probe(struct platform_device *pdev)
+{
+	struct dw_hdmi_audio_data *data = pdev->dev.platform_data;
+	struct snd_dw_hdmi *dw;
+
+	const struct hdmi_codec_pdata codec_data = {
+		.i2s = 1,
+		.spdif = 0,
+		.ops = &audio_codec_ops,
+		.max_i2s_channels = 8,
+		.data = data,
+	};
+
+	dw = devm_kzalloc(&pdev->dev, sizeof(*dw), GFP_KERNEL);
+	if (!dw)
+		return -ENOMEM;
+
+	dw->data = *data;
+
+	platform_set_drvdata(pdev, dw);
+
+	dw->audio_pdev = platform_device_register_data(&pdev->dev,
+						       HDMI_CODEC_DRV_NAME, 1,
+						       &codec_data,
+						       sizeof(codec_data));
+
+	return PTR_ERR_OR_ZERO(dw->audio_pdev);
+}
+
+static int snd_dw_hdmi_remove(struct platform_device *pdev)
+{
+	struct snd_dw_hdmi *dw = platform_get_drvdata(pdev);
+
+	platform_device_unregister(dw->audio_pdev);
+
+	return 0;
+}
+
+static struct platform_driver snd_dw_hdmi_driver = {
+	.probe	= snd_dw_hdmi_probe,
+	.remove	= snd_dw_hdmi_remove,
+	.driver	= {
+		.name = DRIVER_NAME,
+	},
+};
+
+module_platform_driver(snd_dw_hdmi_driver);
+
+MODULE_AUTHOR("Shengjiu Wang <shengjiu.wang@nxp.com>");
+MODULE_DESCRIPTION("Synopsis Designware HDMI GPA ALSA interface");
+MODULE_LICENSE("GPL");
+MODULE_ALIAS("platform:" DRIVER_NAME);
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 13270d96e5be..2ebbe9fc5d7f 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -191,7 +191,10 @@ struct dw_hdmi {
 
 	spinlock_t audio_lock;
 	struct mutex audio_mutex;
+	unsigned int sample_non_pcm;
+	unsigned int sample_width;
 	unsigned int sample_rate;
+	unsigned int channels;
 	unsigned int audio_cts;
 	unsigned int audio_n;
 	bool audio_enable;
@@ -589,6 +592,8 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
 			n = 4096;
 		else if (pixel_clk == 74176000 || pixel_clk == 148352000)
 			n = 11648;
+		else if (pixel_clk == 297000000)
+			n = 3072;
 		else
 			n = 4096;
 		n *= mult;
@@ -601,6 +606,8 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
 			n = 17836;
 		else if (pixel_clk == 148352000)
 			n = 8918;
+		else if (pixel_clk == 297000000)
+			n = 4704;
 		else
 			n = 6272;
 		n *= mult;
@@ -615,6 +622,8 @@ static unsigned int hdmi_compute_n(unsigned int freq, unsigned long pixel_clk)
 			n = 11648;
 		else if (pixel_clk == 148352000)
 			n = 5824;
+		else if (pixel_clk == 297000000)
+			n = 5120;
 		else
 			n = 6144;
 		n *= mult;
@@ -660,7 +669,7 @@ static void hdmi_set_clk_regenerator(struct dw_hdmi *hdmi,
 	config3 = hdmi_readb(hdmi, HDMI_CONFIG3_ID);
 
 	/* Only compute CTS when using internal AHB audio */
-	if (config3 & HDMI_CONFIG3_AHBAUDDMA) {
+	if ((config3 & HDMI_CONFIG3_AHBAUDDMA) || (config3 & HDMI_CONFIG3_GPAUD)) {
 		/*
 		 * Compute the CTS value from the N value.  Note that CTS and N
 		 * can be up to 20 bits in total, so we need 64-bit math.  Also
@@ -702,6 +711,22 @@ static void hdmi_clk_regenerator_update_pixel_clock(struct dw_hdmi *hdmi)
 	mutex_unlock(&hdmi->audio_mutex);
 }
 
+void dw_hdmi_set_sample_width(struct dw_hdmi *hdmi, unsigned int width)
+{
+	mutex_lock(&hdmi->audio_mutex);
+	hdmi->sample_width = width;
+	mutex_unlock(&hdmi->audio_mutex);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_width);
+
+void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm)
+{
+	mutex_lock(&hdmi->audio_mutex);
+	hdmi->sample_non_pcm = non_pcm;
+	mutex_unlock(&hdmi->audio_mutex);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_set_sample_non_pcm);
+
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate)
 {
 	mutex_lock(&hdmi->audio_mutex);
@@ -717,6 +742,7 @@ void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt)
 	u8 layout;
 
 	mutex_lock(&hdmi->audio_mutex);
+	hdmi->channels = cnt;
 
 	/*
 	 * For >2 channel PCM audio, we need to select layout 1
@@ -765,6 +791,87 @@ static u8 *hdmi_audio_get_eld(struct dw_hdmi *hdmi)
 	return hdmi->curr_conn->eld;
 }
 
+static void dw_hdmi_gp_audio_enable(struct dw_hdmi *hdmi)
+{
+	int sample_freq = 0x2, org_sample_freq = 0xD;
+	int ch_mask = BIT(hdmi->channels) - 1;
+
+	switch (hdmi->sample_rate) {
+	case 32000:
+		sample_freq = 0x03;
+		org_sample_freq = 0x0C;
+		break;
+	case 44100:
+		sample_freq = 0x00;
+		org_sample_freq = 0x0F;
+		break;
+	case 48000:
+		sample_freq = 0x02;
+		org_sample_freq = 0x0D;
+		break;
+	case 88200:
+		sample_freq = 0x08;
+		org_sample_freq = 0x07;
+		break;
+	case 96000:
+		sample_freq = 0x0A;
+		org_sample_freq = 0x05;
+		break;
+	case 176400:
+		sample_freq = 0x0C;
+		org_sample_freq = 0x03;
+		break;
+	case 192000:
+		sample_freq = 0x0E;
+		org_sample_freq = 0x01;
+		break;
+	default:
+		break;
+	}
+
+	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
+	hdmi_enable_audio_clk(hdmi, true);
+
+	hdmi_writeb(hdmi, 0x1, HDMI_FC_AUDSCHNLS0);
+	hdmi_writeb(hdmi, hdmi->channels, HDMI_FC_AUDSCHNLS2);
+	hdmi_writeb(hdmi, 0x22, HDMI_FC_AUDSCHNLS3);
+	hdmi_writeb(hdmi, 0x22, HDMI_FC_AUDSCHNLS4);
+	hdmi_writeb(hdmi, 0x11, HDMI_FC_AUDSCHNLS5);
+	hdmi_writeb(hdmi, 0x11, HDMI_FC_AUDSCHNLS6);
+	hdmi_writeb(hdmi, (0x3 << 4) | sample_freq, HDMI_FC_AUDSCHNLS7);
+	hdmi_writeb(hdmi, (org_sample_freq << 4) | 0xb, HDMI_FC_AUDSCHNLS8);
+
+	hdmi_writeb(hdmi, ch_mask, HDMI_GP_CONF1);
+	hdmi_writeb(hdmi, 0x02, HDMI_GP_CONF2);
+	hdmi_writeb(hdmi, 0x01, HDMI_GP_CONF0);
+
+	hdmi_modb(hdmi,  0x3, 0x3, HDMI_FC_DATAUTO3);
+
+	/* hbr */
+	if (hdmi->sample_rate == 192000 && hdmi->channels == 8 &&
+	    hdmi->sample_width == 32 && hdmi->sample_non_pcm) {
+		hdmi_modb(hdmi, 0x01, 0x01, HDMI_GP_CONF2);
+	}
+
+	if (hdmi->phy.ops->enable_audio)
+		hdmi->phy.ops->enable_audio(hdmi, hdmi->phy.data,
+					    hdmi->channels,
+					    hdmi->sample_width,
+					    hdmi->sample_rate,
+					    hdmi->sample_non_pcm);
+}
+
+static void dw_hdmi_gp_audio_disable(struct dw_hdmi *hdmi)
+{
+	hdmi_set_cts_n(hdmi, hdmi->audio_cts, 0);
+
+	hdmi_modb(hdmi,  0, 0x3, HDMI_FC_DATAUTO3);
+	if (hdmi->phy.ops->disable_audio)
+		hdmi->phy.ops->disable_audio(hdmi, hdmi->phy.data);
+
+	hdmi_enable_audio_clk(hdmi, false);
+}
+
 static void dw_hdmi_ahb_audio_enable(struct dw_hdmi *hdmi)
 {
 	hdmi_set_cts_n(hdmi, hdmi->audio_cts, hdmi->audio_n);
@@ -3253,6 +3360,7 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 	hdmi->plat_data = plat_data;
 	hdmi->dev = dev;
 	hdmi->sample_rate = 48000;
+	hdmi->channels = 2;
 	hdmi->disabled = true;
 	hdmi->rxsense = true;
 	hdmi->phy_mask = (u8)~(HDMI_PHY_HPD | HDMI_PHY_RX_SENSE);
@@ -3476,6 +3584,24 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		pdevinfo.size_data = sizeof(audio);
 		pdevinfo.dma_mask = DMA_BIT_MASK(32);
 		hdmi->audio = platform_device_register_full(&pdevinfo);
+	} else if (iores && config3 & HDMI_CONFIG3_GPAUD) {
+		struct dw_hdmi_audio_data audio;
+
+		audio.phys = iores->start;
+		audio.base = hdmi->regs;
+		audio.irq = irq;
+		audio.hdmi = hdmi;
+		audio.get_eld = hdmi_audio_get_eld;
+
+		hdmi->enable_audio = dw_hdmi_gp_audio_enable;
+		hdmi->disable_audio = dw_hdmi_gp_audio_disable;
+
+		pdevinfo.name = "dw-hdmi-gp-audio";
+		pdevinfo.id = PLATFORM_DEVID_NONE;
+		pdevinfo.data = &audio;
+		pdevinfo.size_data = sizeof(audio);
+		pdevinfo.dma_mask = DMA_BIT_MASK(32);
+		hdmi->audio = platform_device_register_full(&pdevinfo);
 	}
 
 	if (!plat_data->disable_cec && (config0 & HDMI_CONFIG0_CEC)) {
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
index 1999db05bc3b..99aa1c03343b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.h
@@ -158,8 +158,17 @@
 #define HDMI_FC_SPDDEVICEINF                    0x1062
 #define HDMI_FC_AUDSCONF                        0x1063
 #define HDMI_FC_AUDSSTAT                        0x1064
-#define HDMI_FC_AUDSCHNLS7                      0x106e
-#define HDMI_FC_AUDSCHNLS8                      0x106f
+#define HDMI_FC_AUDSV                           0x1065
+#define HDMI_FC_AUDSU                           0x1066
+#define HDMI_FC_AUDSCHNLS0                       0x1067
+#define HDMI_FC_AUDSCHNLS1                       0x1068
+#define HDMI_FC_AUDSCHNLS2                       0x1069
+#define HDMI_FC_AUDSCHNLS3                       0x106A
+#define HDMI_FC_AUDSCHNLS4                       0x106B
+#define HDMI_FC_AUDSCHNLS5                       0x106C
+#define HDMI_FC_AUDSCHNLS6                       0x106D
+#define HDMI_FC_AUDSCHNLS7                       0x106E
+#define HDMI_FC_AUDSCHNLS8                       0x106F
 #define HDMI_FC_DATACH0FILL                     0x1070
 #define HDMI_FC_DATACH1FILL                     0x1071
 #define HDMI_FC_DATACH2FILL                     0x1072
diff --git a/include/drm/bridge/dw_hdmi.h b/include/drm/bridge/dw_hdmi.h
index 70082f80a8c8..7f73c3398a54 100644
--- a/include/drm/bridge/dw_hdmi.h
+++ b/include/drm/bridge/dw_hdmi.h
@@ -121,6 +121,9 @@ struct dw_hdmi_phy_ops {
 	void (*update_hpd)(struct dw_hdmi *hdmi, void *data,
 			   bool force, bool disabled, bool rxsense);
 	void (*setup_hpd)(struct dw_hdmi *hdmi, void *data);
+	void (*enable_audio)(struct dw_hdmi *hdmi, void *data, int channel,
+			     int width, int rate, int non_pcm);
+	void (*disable_audio)(struct dw_hdmi *hdmi, void *data);
 };
 
 struct dw_hdmi_plat_data {
@@ -173,6 +176,8 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense);
 
 int dw_hdmi_set_plugged_cb(struct dw_hdmi *hdmi, hdmi_codec_plugged_cb fn,
 			   struct device *codec_dev);
+void dw_hdmi_set_sample_non_pcm(struct dw_hdmi *hdmi, unsigned int non_pcm);
+void dw_hdmi_set_sample_width(struct dw_hdmi *hdmi, unsigned int width);
 void dw_hdmi_set_sample_rate(struct dw_hdmi *hdmi, unsigned int rate);
 void dw_hdmi_set_channel_count(struct dw_hdmi *hdmi, unsigned int cnt);
 void dw_hdmi_set_channel_status(struct dw_hdmi *hdmi, u8 *channel_status);
-- 
2.25.1

