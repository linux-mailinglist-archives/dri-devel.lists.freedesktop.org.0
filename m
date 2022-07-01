Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D57145632B3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Jul 2022 13:42:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B28E411BABB;
	Fri,  1 Jul 2022 11:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2065.outbound.protection.outlook.com [40.107.102.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F6E11BAC1;
 Fri,  1 Jul 2022 11:42:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b77I6uNxXpL3EgZOwfLJLJDX2wDMvZpRDNY48tCBLz0R+RAjRqC318xLKd2HSpGqKd3wo6tpB33V45NlpthzYcCtNTEcXJcBjeHO+g9Z1UM195uNKuPbR7lJ5EPssAQrVZCuzdCw4ATBenG/rptEech3K/d8r7LhV3BZOveehA7dMbCmvK7KUKdF9RE9l1npfPZlJ/Vbal9bHSb2/tvqIx/WzXbiXyXjApCZuTOaPRh6hpWeP+FMpT0a5W49EPoWAkxGCkyhgIy5WNJ6M1A9MWdNMrshCB1xkzlC79iQnCBWqJv2WZRjq54y1obH6fsIsXpqZQfkoshbfgms1jJoIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gG8r0QwDPrHhTq49NWepI7vVWWbhZNs41DgdabjQv+w=;
 b=UMGFiLnXAzwzVXEZQhYQuoEAUutsWutoeV1Oz/ObHfWpqQSuh5r3CNyX30ARHDhUeMZ6MjwTJTcm3xNC86zhmznPjobKMZjaWTv1XUt5bCSgPIc515Avf2rH2SyROysxttD+dH90xEEQ3tOXoMpRpjlMi2cwoj4pEnk7g7TSHODCcqlPG6K/usZqfnUX6OCVf3he7UBAz8k8nBMmrBF0EoOH2dn6snlgpAtR5y8Mdi7ZIhZ9D4/0reHexYXHQiaZBz4JxdpTg7TmMXInc1LTsJ9pY8NtHEI70uJAtWT1qWOHt9WNOIH8g4LtD0D1opBnMcXPB+vLZY/fVDd/YfXn1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gG8r0QwDPrHhTq49NWepI7vVWWbhZNs41DgdabjQv+w=;
 b=E2/uzhXzpZJQQ8AiNFQYl6+X2jKeOcPHxs3RNdOtN70Iapew/NOdQlhW74gandr9hxubryVVIXRiz5FLH6tRsJPpKizixNqC5u++Byf/cFDx4NyNcpO31LcCJEAY/jGf/YYR/ykW2lOwxcp9AzmufzToYuMmktEorVJPpySIeI8=
Received: from DS7PR03CA0087.namprd03.prod.outlook.com (2603:10b6:5:3bb::32)
 by DM5PR12MB1388.namprd12.prod.outlook.com (2603:10b6:3:78::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5373.18; Fri, 1 Jul 2022 11:41:59 +0000
Received: from DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::f0) by DS7PR03CA0087.outlook.office365.com
 (2603:10b6:5:3bb::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.17 via Frontend
 Transport; Fri, 1 Jul 2022 11:41:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT013.mail.protection.outlook.com (10.13.173.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5395.14 via Frontend Transport; Fri, 1 Jul 2022 11:41:59 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 06:41:56 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Fri, 1 Jul
 2022 04:41:55 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB04.amd.com (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Fri, 1 Jul 2022 06:41:51 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH V2 4/5] ASoC: amd: add Machine driver for Jadeite platform
Date: Fri, 1 Jul 2022 17:11:06 +0530
Message-ID: <20220701114107.1105948-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
References: <20220701114107.1105948-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 023fb7d5-a96b-4c82-8460-08da5b56b58d
X-MS-TrafficTypeDiagnostic: DM5PR12MB1388:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0Ae95xwYXpjmVO8feEKQ+5Nn95qT6qam/HCsQ0dhnU1Wmnp671k8+xk4ssXtK0gzJo9eSUbq9zc2VK6S4SBCsgyoQ/fNM6Leg1c+ilR79xs74gDkbefmUQDIKIjmCBpxiAWvptgHCwn2mXYbO04HASY+Ev/OiV7bmNUK6kvM/hRqcyrZpzoRCvrP7OiCiGEECc428VOxfwjgoncZShbJS/fd73Uqv8XJ2fV1265VVbLhjOUpMWgIrloUjL3DSztCVxGmuyQDHQ8jsjcoMXnZXjCbqcjPvODjWrSEpSqBRPO1O/4q4tJPdRBGf5xKwU7RpnYulMoftF2Aj3WK4J4hFOKfWYITmTIfSGaXGRUXpFfN0FN+hwOIFIzoh38TjO7o8qu4u2Sm6qMbRmQd/NNhaOEUEaIiGfZU3wBIE1zgW1hH0JLKwuA06IGJrWXYOsJFXaya9prCDApLtMUVUTBpngtQ6OClqvJT2gO2uimJifJ7tRWEs7E21n6SOLtZv/wO+6CqOm6ooFdjZlFn+I7noCj/BVbauSZVy0rx5PfVK3RtHxtSuiOSVyfckQFFi67VSg00kC6LygU+sZtef9gwRoFw5mkCQUbom623cELPT9xjgcM7UbqzgjGxaojAuELc24BnncFV+KuQiM6q0A/CdCf+sfd8YvwAJzO7/WRtnZ1O8jWO/IGKIO7UQvWanAEr4VYZ/TzS+LVmC8j7Qon2fvhZuC9hbUdNowODJDUq7P/09baWcrLaveG2J6Ve56Oz86RE+yRn7TMVWZ1jqi24v2smfvccPxDBbtGUOthwlQWZPPqCZ51inuayR1UIP2e2b5N9QHni52JnhwNDX/2U7odFoWHDvaXOmZnazZHuVJs=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(346002)(396003)(39860400002)(136003)(376002)(40470700004)(36840700001)(46966006)(83380400001)(36756003)(40460700003)(356005)(54906003)(82310400005)(86362001)(2906002)(336012)(36860700001)(426003)(81166007)(47076005)(40480700001)(186003)(7696005)(8676002)(8936002)(70206006)(478600001)(316002)(5660300002)(26005)(82740400003)(70586007)(2616005)(6666004)(4326008)(1076003)(41300700001)(110136005)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jul 2022 11:41:59.6518 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 023fb7d5-a96b-4c82-8460-08da5b56b58d
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT013.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1388
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
Cc: Sunil-kumar.Dommati@amd.com, open list <linux-kernel@vger.kernel.org>,
 Basavaraj.Hiregoudar@amd.com, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Jaroslav
 Kysela <perex@perex.cz>, Vijendar Mukunda <Vijendar.Mukunda@amd.com>,
 Alexander.Deucher@amd.com, zhuning@everest-semi.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add Machine driver for Jadeite platform which uses ES8336 codec.

Signed-off-by: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
---
 sound/soc/amd/acp-es8336.c | 324 +++++++++++++++++++++++++++++++++++++
 1 file changed, 324 insertions(+)
 create mode 100644 sound/soc/amd/acp-es8336.c

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
new file mode 100644
index 000000000000..eec3d57092fa
--- /dev/null
+++ b/sound/soc/amd/acp-es8336.c
@@ -0,0 +1,324 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Machine driver for AMD Stoney platform using ES8336 Codec
+ *
+ * Copyright 2022 Advanced Micro Devices, Inc.
+ */
+
+#include <sound/core.h>
+#include <sound/soc.h>
+#include <sound/pcm.h>
+#include <sound/pcm_params.h>
+#include <sound/soc-dapm.h>
+#include <sound/jack.h>
+#include <linux/gpio.h>
+#include <linux/device.h>
+#include <linux/dmi.h>
+#include <linux/gpio/consumer.h>
+#include <linux/gpio/machine.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/module.h>
+#include <linux/acpi.h>
+
+#include "../codecs/es8316.h"
+#include "acp.h"
+
+#define DUAL_CHANNEL	2
+#define DRV_NAME "acp2x_mach"
+#define ST_JADEITE	1
+#define ES8336_PLL_FREQ (48000 * 256)
+
+static unsigned long acp2x_machine_id;
+static struct snd_soc_jack st_jack;
+struct device *codec_dev;
+struct gpio_desc *gpio_pa;
+
+static int sof_es8316_speaker_power_event(struct snd_soc_dapm_widget *w,
+					  struct snd_kcontrol *kcontrol, int event)
+{
+	if (SND_SOC_DAPM_EVENT_ON(event))
+		gpiod_set_value_cansleep(gpio_pa, true);
+	else
+		gpiod_set_value_cansleep(gpio_pa, false);
+
+	return 0;
+}
+
+static struct snd_soc_jack_pin st_es8316_jack_pins[] = {
+	{
+		.pin	= "Headphone",
+		.mask	= SND_JACK_HEADPHONE,
+	},
+	{
+		.pin	= "Headset Mic",
+		.mask	= SND_JACK_MICROPHONE,
+	},
+};
+
+static int st_es8336_init(struct snd_soc_pcm_runtime *rtd)
+{
+	int ret;
+	struct snd_soc_card *card;
+	struct snd_soc_component *codec;
+
+	codec = asoc_rtd_to_codec(rtd, 0)->component;
+	card = rtd->card;
+
+	ret = snd_soc_card_jack_new_pins(card, "Headset", SND_JACK_HEADSET | SND_JACK_BTN_0,
+					 &st_jack, st_es8316_jack_pins,
+					 ARRAY_SIZE(st_es8316_jack_pins));
+	if (ret) {
+		dev_err(card->dev, "HP jack creation failed %d\n", ret);
+		return ret;
+	}
+	snd_jack_set_key(st_jack.jack, SND_JACK_BTN_0, KEY_PLAYPAUSE);
+	ret = snd_soc_component_set_jack(codec, &st_jack, NULL);
+	if (ret) {
+		dev_err(rtd->dev, "Headset Jack call-back failed: %d\n", ret);
+		return ret;
+	}
+	return 0;
+}
+
+static const unsigned int st_channels[] = {
+	DUAL_CHANNEL,
+};
+
+static const unsigned int st_rates[] = {
+	48000,
+};
+
+static const struct snd_pcm_hw_constraint_list st_constraints_rates = {
+	.count = ARRAY_SIZE(st_rates),
+	.list  = st_rates,
+	.mask = 0,
+};
+
+static const struct snd_pcm_hw_constraint_list st_constraints_channels = {
+	.count = ARRAY_SIZE(st_channels),
+	.list = st_channels,
+	.mask = 0,
+};
+
+static int st_es8336_codec_startup(struct snd_pcm_substream *substream)
+{
+	struct snd_pcm_runtime *runtime;
+	struct snd_soc_pcm_runtime *rtd;
+	struct snd_soc_card *card;
+	struct acp_platform_info *machine;
+	struct snd_soc_dai *codec_dai;
+	int ret;
+
+	runtime = substream->runtime;
+	rtd = asoc_substream_to_rtd(substream);
+	card = rtd->card;
+	machine = snd_soc_card_get_drvdata(card);
+	codec_dai = asoc_rtd_to_codec(rtd, 0);
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, ES8336_PLL_FREQ, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
+		return ret;
+	}
+	runtime->hw.channels_max = DUAL_CHANNEL;
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_CHANNELS,
+				   &st_constraints_channels);
+	snd_pcm_hw_constraint_list(runtime, 0, SNDRV_PCM_HW_PARAM_RATE,
+				   &st_constraints_rates);
+
+	machine->play_i2s_instance = I2S_MICSP_INSTANCE;
+	machine->cap_i2s_instance = I2S_MICSP_INSTANCE;
+	machine->capture_channel = CAP_CHANNEL0;
+	return 0;
+}
+
+static const struct snd_soc_ops st_es8336_ops = {
+	.startup = st_es8336_codec_startup,
+};
+
+SND_SOC_DAILINK_DEF(designware1,
+		    DAILINK_COMP_ARRAY(COMP_CPU("designware-i2s.2.auto")));
+SND_SOC_DAILINK_DEF(codec,
+		    DAILINK_COMP_ARRAY(COMP_CODEC("i2c-ESSX8336:00", "ES8316 HiFi")));
+SND_SOC_DAILINK_DEF(platform,
+		    DAILINK_COMP_ARRAY(COMP_PLATFORM("acp_audio_dma.1.auto")));
+
+static struct snd_soc_dai_link st_dai_es8336[] = {
+	{
+		.name = "amdes8336",
+		.stream_name = "ES8336 HiFi Play",
+		.dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF
+				| SND_SOC_DAIFMT_CBP_CFP,
+		.stop_dma_first = 1,
+		.dpcm_capture = 1,
+		.dpcm_playback = 1,
+		.init = st_es8336_init,
+		.ops = &st_es8336_ops,
+		SND_SOC_DAILINK_REG(designware1, codec, platform),
+	},
+};
+
+static const struct snd_soc_dapm_widget st_widgets[] = {
+	SND_SOC_DAPM_SPK("Speaker", NULL),
+	SND_SOC_DAPM_HP("Headphone", NULL),
+	SND_SOC_DAPM_MIC("Headset Mic", NULL),
+	SND_SOC_DAPM_MIC("Internal Mic", NULL),
+
+	SND_SOC_DAPM_SUPPLY("Speaker Power", SND_SOC_NOPM, 0, 0,
+			    sof_es8316_speaker_power_event,
+			    SND_SOC_DAPM_PRE_PMD | SND_SOC_DAPM_POST_PMU),
+};
+
+static const struct snd_soc_dapm_route st_audio_route[] = {
+	{"Speaker", NULL, "HPOL"},
+	{"Speaker", NULL, "HPOR"},
+	{"Headphone", NULL, "HPOL"},
+	{"Headphone", NULL, "HPOR"},
+	{"MIC1", NULL, "Headset Mic"},
+	{"MIC2", NULL, "Internal Mic"},
+	{"Speaker", NULL, "Speaker Power"},
+};
+
+static const struct snd_kcontrol_new st_mc_controls[] = {
+	SOC_DAPM_PIN_SWITCH("Speaker"),
+	SOC_DAPM_PIN_SWITCH("Headphone"),
+	SOC_DAPM_PIN_SWITCH("Headset Mic"),
+	SOC_DAPM_PIN_SWITCH("Internal Mic"),
+};
+
+static const struct acpi_gpio_params pa_enable_gpio = { 0, 0, false };
+static const struct acpi_gpio_mapping acpi_es8336_gpios[] = {
+	{ "pa-enable-gpios", &pa_enable_gpio, 1 },
+	{ }
+};
+
+static int st_es8336_late_probe(struct snd_soc_card *card)
+{
+	struct acpi_device *adev;
+	int ret;
+
+	adev = acpi_dev_get_first_match_dev("ESSX8336", NULL, -1);
+	if (adev)
+		put_device(&adev->dev);
+	codec_dev = acpi_get_first_physical_node(adev);
+	if (!codec_dev)
+		dev_err(card->dev, "can not find codec dev\n");
+
+	ret = devm_acpi_dev_add_driver_gpios(codec_dev, acpi_es8336_gpios);
+
+	gpio_pa = gpiod_get_optional(codec_dev, "pa-enable", GPIOD_OUT_LOW);
+	if (IS_ERR(gpio_pa)) {
+		ret = dev_err_probe(card->dev, PTR_ERR(gpio_pa),
+				    "could not get pa-enable GPIO\n");
+		gpiod_put(gpio_pa);
+		put_device(codec_dev);
+	}
+	return 0;
+}
+
+static struct snd_soc_card st_card = {
+	.name = "acpes8336",
+	.owner = THIS_MODULE,
+	.dai_link = st_dai_es8336,
+	.num_links = ARRAY_SIZE(st_dai_es8336),
+	.dapm_widgets = st_widgets,
+	.num_dapm_widgets = ARRAY_SIZE(st_widgets),
+	.dapm_routes = st_audio_route,
+	.num_dapm_routes = ARRAY_SIZE(st_audio_route),
+	.controls = st_mc_controls,
+	.num_controls = ARRAY_SIZE(st_mc_controls),
+	.late_probe = st_es8336_late_probe,
+};
+
+static int st_es8336_quirk_cb(const struct dmi_system_id *id)
+{
+	acp2x_machine_id = ST_JADEITE;
+	return 1;
+}
+
+static const struct dmi_system_id st_es8336_quirk_table[] = {
+	{
+		.callback = st_es8336_quirk_cb,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "AMD"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "Jadeite"),
+		},
+	},
+	{
+		.callback = st_es8336_quirk_cb,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "IP3 Technology CO.,Ltd."),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ASN1D"),
+		},
+	},
+	{
+		.callback = st_es8336_quirk_cb,
+		.matches = {
+			DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "Standard"),
+			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "ASN10"),
+		},
+	},
+	{}
+};
+
+static int st_es8336_probe(struct platform_device *pdev)
+{
+	int ret;
+	struct snd_soc_card *card;
+	struct acp_platform_info *machine;
+
+	machine = devm_kzalloc(&pdev->dev, sizeof(struct acp_platform_info), GFP_KERNEL);
+	if (!machine)
+		return -ENOMEM;
+
+	dmi_check_system(st_es8336_quirk_table);
+	switch (acp2x_machine_id) {
+	case ST_JADEITE:
+		card = &st_card;
+		st_card.dev = &pdev->dev;
+		break;
+	default:
+		return -ENODEV;
+	}
+
+	platform_set_drvdata(pdev, card);
+	snd_soc_card_set_drvdata(card, machine);
+	ret = devm_snd_soc_register_card(&pdev->dev, &st_card);
+	if (ret) {
+		return dev_err_probe(&pdev->dev, ret,
+				     "devm_snd_soc_register_card(%s) failed\n",
+				     card->name);
+	}
+	return 0;
+}
+
+static int st_es8336_remove(struct platform_device *pdev)
+{
+	return 0;
+}
+
+#ifdef CONFIG_ACPI
+static const struct acpi_device_id st_audio_acpi_match[] = {
+	{"AMDI8336", 0},
+	{},
+};
+MODULE_DEVICE_TABLE(acpi, st_audio_acpi_match);
+#endif
+
+static struct platform_driver st_mach_driver = {
+	.driver = {
+		.name = "st-es8316",
+		.acpi_match_table = ACPI_PTR(st_audio_acpi_match),
+		.pm = &snd_soc_pm_ops,
+	},
+	.probe = st_es8336_probe,
+	.remove = st_es8336_remove,
+};
+
+module_platform_driver(st_mach_driver);
+
+MODULE_AUTHOR("Vijendar.Mukunda@amd.com");
+MODULE_DESCRIPTION("st-es8316 audio support");
+MODULE_LICENSE("GPL v2");
-- 
2.25.1

