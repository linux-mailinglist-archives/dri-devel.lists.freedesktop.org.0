Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 927FA560F82
	for <lists+dri-devel@lfdr.de>; Thu, 30 Jun 2022 05:19:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 854F389EFF;
	Thu, 30 Jun 2022 03:18:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2058.outbound.protection.outlook.com [40.107.244.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D0D10EB25;
 Thu, 30 Jun 2022 03:18:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XvvbigXmCg5slYPCfm8qukVIoqeyzp1vW0Ho2hvDdgidi2spCKnYIpENXGhezbmLMs98blzjeCbHZEBv2mR9bnxMG9xpq8A1PdIuKXERvjDX3ITwz3Tc7sQTMa6F68fUNxPaQkg7WyI/X83ALCVoczrJMriD+gnuSSTgGgWLDuOIoiBHXy+mvcMU96TJmGAcEKt+C2N1kYA2a+VFVBfVN6+Yt37A7Z4B6v60JQdKOEg2Jww9VkMUVImbOOvgq/6/sYjikZU87buF0t76SpVHTMw0zqPfWqrty9u305V5i9hKav7A4Uvd8F8wULNBQY7MXgXtLdzLv6cM7eF1YnRjcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mlbTARpi77ZR68eWy5i1k7JjI78yR3/2jRYuL+AxiY4=;
 b=aWdcMFH3SPjBRWC4f0UWSW14gfPkvafVN9kqFfCuCVWmcRqty7LiUGWcMjJKfEVacRX1WAhF6CIevKfACBEfjBEnKWQmle0AhS+c8yhfVz7Nh0lWKH0Gux5mBQ7tuowb97dc50yvtoxbizKmOtGazH+pz0mndZfYQbfqO8CkUErGHRpfXpWdCt5/tiDe1w+jyMWTAgt+hsa55uUL87CxwhZ1Dftn3905cnsCNsWYW8cmhrsZJ4KjKIWoRVlS7F0ovOSZnssL+9KCGBRsPdz1fmkOlXoGPPviWdXAhRbFYE1+y6dpkA/1uN2g4MtfvNIcS4+QHzxQp+ziQidWBXO2yQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=kernel.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mlbTARpi77ZR68eWy5i1k7JjI78yR3/2jRYuL+AxiY4=;
 b=15xpPa7RnkExSiCo1GPFAXHgT4vW2kkKr8tND6QEcXro16FZTD9Q1JDQ0HrQKztiyk6RKm8ndr7qWxPnjx8pbJdSGZh2p+ecjaZEbS2kPcAskmm9L4EoN/jgabQKRyJoD7VaKx4ZiXgY9t6wAnZv2sQE7tfjLBXJrMa98weIV4M=
Received: from BN0PR07CA0006.namprd07.prod.outlook.com (2603:10b6:408:141::23)
 by LV2PR12MB5991.namprd12.prod.outlook.com (2603:10b6:408:14f::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5373.18; Thu, 30 Jun
 2022 03:18:49 +0000
Received: from BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:141:cafe::8c) by BN0PR07CA0006.outlook.office365.com
 (2603:10b6:408:141::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5395.14 via Frontend
 Transport; Thu, 30 Jun 2022 03:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BN8NAM11FT030.mail.protection.outlook.com (10.13.177.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5373.15 via Frontend Transport; Thu, 30 Jun 2022 03:18:49 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 22:18:45 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Wed, 29 Jun
 2022 20:18:37 -0700
Received: from vijendar-X570-GAMING-X.amd.com (10.180.168.240) by
 SATLEXMB03.amd.com (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.28
 via Frontend Transport; Wed, 29 Jun 2022 22:18:33 -0500
From: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
To: <broonie@kernel.org>, <alsa-devel@alsa-project.org>,
 <dri-devel@lists.freedesktop.org>, <amd-gfx@lists.freedesktop.org>
Subject: [PATCH 4/5] ASoC: amd: add Machine driver for Jadeite platform
Date: Thu, 30 Jun 2022 08:47:54 +0530
Message-ID: <20220630031755.1055413-5-Vijendar.Mukunda@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
References: <20220630031755.1055413-1-Vijendar.Mukunda@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c7bb8a84-e850-4e2f-5d48-08da5a474068
X-MS-TrafficTypeDiagnostic: LV2PR12MB5991:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dItr73Ot2umMWHgZe37etuq3v32T/00giT8gNAixXDowoys2tdJE9C9LwSSC/e6UXm+rujc7ARsZqoho5pijz7bv/8jrva0XmVak75ycjK8bu25i+b1aeRVrtb4XZXcrQcZbXVebkk/rkj+KHdepswpFvBxUqNeZ+9LvG1ja4pV4fJRLtzef8NNpzp832gAa0j4EHQC1NZ5gTPngBkg2OsCuccXUlL/FFVu1uZWxJO8NrkrJyFMWzOt+bDdRHMNnxySc50Ve/aA/MsTdWUOAZMhgB94e3JlUBpLfQ17uKbKwskyacDg91R6TOFQStlqfUOUxgaJ+8dk1vN0Y0zYWckvKgYypSlJfv7ksaS4sCRNxDuaRfOI8pgJ4JDVNhlDuqeddldKoPyPFFAbw1jd3YJ3sS6MN5zx82Zgq2AvT6tSG/AbD+nP0uTV+OKA965f52ifMdbpqgmLKQJpPywQkoIfSHLVn6+KKbPkkEoc6cZl/LoV8r1Z7v9i2Wt7PEytQocq6xF7O+BzJB6Dcb0U/RmAwQ65kOcdIr+mtoy5gPOk8WszDa8UT9HaJlNF7OdFMoj68L/O7nPJDsv5BqkbvWoinWu19V/mNkChNDq2FEMgrcb+nOKqFdTcRB+le2YgcLXKQt7haqcYRinLY8jdHr7ahnquoywuj2cYflZLkBfYrKx5XatOLiThuxZjeGnt+r/REY4MnTO4bVCR7wNEVKA1IBnGLn23V7+w2W379UO3Oi4ZgDAuZEha5cxLYgpKd8RXMYMm8IaRDj75EYVTWAaAIK8+/CPdfGs/UQLmC/Q1GMr9HUJcN42KNpelu3DsKAOG1m9cLuMc6xMN3e2p7VnVE8X+RVE2pZrq4DabxnBo=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(376002)(396003)(346002)(39860400002)(46966006)(36840700001)(40470700004)(82740400003)(7696005)(2616005)(81166007)(426003)(478600001)(83380400001)(6666004)(86362001)(47076005)(356005)(40460700003)(82310400005)(26005)(70206006)(41300700001)(316002)(110136005)(70586007)(54906003)(4326008)(5660300002)(36860700001)(36756003)(40480700001)(8676002)(186003)(336012)(8936002)(2906002)(1076003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2022 03:18:49.5480 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c7bb8a84-e850-4e2f-5d48-08da5a474068
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5991
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
 sound/soc/amd/acp-es8336.c | 333 +++++++++++++++++++++++++++++++++++++
 1 file changed, 333 insertions(+)
 create mode 100644 sound/soc/amd/acp-es8336.c

diff --git a/sound/soc/amd/acp-es8336.c b/sound/soc/amd/acp-es8336.c
new file mode 100644
index 000000000000..f703da71b5ab
--- /dev/null
+++ b/sound/soc/amd/acp-es8336.c
@@ -0,0 +1,333 @@
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
+#define ST_PLAT_CLK 24000000
+#define DRV_NAME "acp2x_mach"
+#define ST_JADEITE	1
+#define ST_ES8336_GPIO_QUIRK 1
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
+static int st_es8336_hw_params(struct snd_pcm_substream *substream,
+			       struct snd_pcm_hw_params *params)
+{
+	int ret = 0;
+	struct snd_soc_pcm_runtime *rtd = asoc_substream_to_rtd(substream);
+	struct snd_soc_dai *codec_dai = asoc_rtd_to_codec(rtd, 0);
+
+	ret = snd_soc_dai_set_sysclk(codec_dai, 0, params_rate(params) * 256, SND_SOC_CLOCK_IN);
+	if (ret < 0) {
+		dev_err(rtd->dev, "can't set codec sysclk: %d\n", ret);
+		return ret;
+	}
+	return ret;
+}
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
+
+	runtime = substream->runtime;
+	rtd = asoc_substream_to_rtd(substream);
+	card = rtd->card;
+	machine = snd_soc_card_get_drvdata(card);
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
+	.hw_params = st_es8336_hw_params,
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

