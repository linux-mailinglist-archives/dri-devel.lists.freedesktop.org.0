Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A91154E70E
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jun 2022 18:27:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 422B611A4CD;
	Thu, 16 Jun 2022 16:26:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com
 [67.231.149.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6E8A11A449
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jun 2022 14:55:53 +0000 (UTC)
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
 by mx0a-001ae601.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25GC07C4027888;
 Thu, 16 Jun 2022 09:34:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com;
 h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=PODMain02222019;
 bh=X5rIioPEn1luVBfgfBvfqj4i6k66u2yiOtkysHye1SQ=;
 b=NWjUxcT5VNNfjMomcFW6j3Znw+N811YxmsC4Toh3tJB1PXkDIidv3uT8ji6GVzOZgdru
 pJ+UFqQ0rracp/cuWEV7XwxOFJFGHmY7xvB3L7F+kG3wB8WvcFAYUppwOrJcL7XwFomQ
 2VvGH1nchmzYvJMXf9rPudaAcyn5KgVqUIqzPngH81CBo5aCDzJZn07wqotaW5bSdMf+
 6XQDoVZMN99dwMgO75qOcu7U7ATlQS+IOVh6daFbXdrA7+hGfi7puLsuhyJCV6jlUyhy
 tYyCpt+9Z9AJICEtr27NFwTaTMFbb3tlV0cFqsO8m9oaXaU0gOIkQZccC3zUluySWNES nA== 
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
 by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 3gmrf35vuu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT);
 Thu, 16 Jun 2022 09:34:32 -0500
Received: from EDIEX01.ad.cirrus.com (198.61.84.80) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Thu, 16 Jun
 2022 15:34:30 +0100
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by EDIEX01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server id 15.1.2375.28 via
 Frontend Transport; Thu, 16 Jun 2022 15:34:30 +0100
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
 by ediswmail.ad.cirrus.com (Postfix) with ESMTP id D9C90478;
 Thu, 16 Jun 2022 14:34:29 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
Subject: [PATCH 00/96] Refactor non_legacy_dai_naming flag
Date: Thu, 16 Jun 2022 15:32:53 +0100
Message-ID: <20220616143429.1324494-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: UlpjuDH7dQfZHnLnZtZieJ_0ebKgTQK8
X-Proofpoint-ORIG-GUID: UlpjuDH7dQfZHnLnZtZieJ_0ebKgTQK8
X-Proofpoint-Spam-Reason: safe
X-Mailman-Approved-At: Thu, 16 Jun 2022 16:26:00 +0000
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
Cc: cezary.rojewski@intel.com, kuninori.morimoto.gx@renesas.com,
 airlied@linux.ie, alsa-devel@alsa-project.org, dri-devel@lists.freedesktop.org,
 nicolas.ferre@microchip.com, srinivas.kandagatla@linaro.org,
 peter.ujfalusi@gmail.com, linux-stm32@st-md-mailman.stormreply.com,
 jbrunet@baylibre.com, pierre-louis.bossart@linux.intel.com, krzk@kernel.org,
 linux-rockchip@lists.infradead.org, linux-imx@nxp.com,
 linux-mips@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-xtensa@linux-xtensa.org, nsaenz@kernel.org, kernel@pengutronix.de,
 linux-rpi-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-omap@vger.kernel.org,
 patches@opensource.cirrus.com, lgirdwood@gmail.com, vkoul@kernel.org,
 jarkko.nikula@bitmer.com, shawnguo@kernel.org, daniel@zonque.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Historically, the legacy DAI naming scheme was applied to platform
drivers and the newer scheme to CODEC drivers. During componentisation
the core lost the knowledge of if a driver was a CODEC or platform, they
were all now components. To continue to support the legacy naming on
older platform drivers a flag was added to the snd_soc_component_driver
structure, non_legacy_dai_naming, to indicate to use the new scheme and
this was applied to all CODECs as part of the migration.

However, a slight issue appears to be developing with respect to this
flag being opt in for the non-legacy scheme, which presumably we want to
be the primary scheme used. Many codec drivers appear to forget to
include this flag:

  grep -l -r "snd_soc_component_driver" sound/soc/codecs/*.c |
  xargs grep -L "non_legacy_dai_naming" | wc
     48      48    556

Whilst in many cases the configuration of the DAIs themselves will cause
the core to apply the new scheme anyway, it would seem more sensible to
change the flag to legacy_dai_naming making the new scheme opt out. This
patch series migrates across to such a scheme.

Thanks,
Charles

Charles Keepax (96):
  ASoC: soc-component: Add legacy_dai_naming flag
  soundwire: intel: Migrate to new style legacy DAI naming flag
  drm/vc4: Migrate to new style legacy DAI naming flag
  ASoC: img: Migrate to new style legacy DAI naming flag
  ASoC: spear: Migrate to new style legacy DAI naming flag
  ASoC: jz4740-i2c: Migrate to new style legacy DAI naming flag
  ASoC: ep93xx: Migrate to new style legacy DAI naming flag
  ASoC: stm32: Migrate to new style legacy DAI naming flag
  ASoC: bcm: Migrate to new style legacy DAI naming flag
  ASoC: sh: Migrate to new style legacy DAI naming flag
  ASoC: tegra: Migrate to new style legacy DAI naming flag
  ASoC: hisilicon: Migrate to new style legacy DAI naming flag
  ASoC: xilinx: Migrate to new style legacy DAI naming flag
  ASoC: sunxi: Migrate to new style legacy DAI naming flag
  ASoC: Intel: Migrate to new style legacy DAI naming flag
  ASoC: meson: Migrate to new style legacy DAI naming flag
  ASoC: sti-uniperf: Migrate to new style legacy DAI naming flag
  ASoC: amd: Migrate to new style legacy DAI naming flag
  ASoC: atmel: Migrate to new style legacy DAI naming flag
  ASoC: fsl: Migrate to new style legacy DAI naming flag
  ASoC: xtensa: Migrate to new style legacy DAI naming flag
  ASoC: adi: Migrate to new style legacy DAI naming flag
  ASoC: dwc: Migrate to new style legacy DAI naming flag
  ASoC: qcom: Migrate to new style legacy DAI naming flag
  ASoC: test-component: Migrate to new style legacy DAI naming flag
  ASoC: rockchip: Migrate to new style legacy DAI naming flag
  ASoC: au1x: Migrate to new style legacy DAI naming flag
  ASoC: pxa: Migrate to new style legacy DAI naming flag
  ASoC: sof: Migrate to new style legacy DAI naming flag
  ASoC: ux500: Migrate to new style legacy DAI naming flag
  ASoC: ti: Migrate to new style legacy DAI naming flag
  ASoC: mxs-saif: Migrate to new style legacy DAI naming flag
  ASoC: samsung: Migrate to new style legacy DAI naming flag
  ASoC: core: Switch core to new DAI naming flag
  media: TDA1997x: Remove now redundant non_legacy_dai_naming flag
  ASoC: fsl: Remove now redundant non_legacy_dai_naming flag
  ASoC: meson: Remove now redundant non_legacy_dai_naming flag
  ASoC: pistachio: Remove now redundant non_legacy_dai_naming flag
  ASoC: samsung: Remove now redundant non_legacy_dai_naming flag
  ASoC: soc-utils: Remove now redundant non_legacy_dai_naming flag
  ASoC: sunxi: Remove now redundant non_legacy_dai_naming flag
  ASoC: tegra: Remove now redundant non_legacy_dai_naming flag
  ASoC: test-component: Remove now redundant non_legacy_dai_naming flag
  ASoC: topology: KUnit: Remove now redundant non_legacy_dai_naming flag
  ASoC: uniphier: Remove now redundant non_legacy_dai_naming flag
  ASoC: ad*: Remove now redundant non_legacy_dai_naming flag
  ASoC: ak*: Remove now redundant non_legacy_dai_naming flag
  ASoC: alc*: Remove now redundant non_legacy_dai_naming flag
  ASoC: cs*: Remove now redundant non_legacy_dai_naming flag
  ASoC: da*: Remove now redundant non_legacy_dai_naming flag
  ASoC: es*: Remove now redundant non_legacy_dai_naming flag
  ASoC: max*: Remove now redundant non_legacy_dai_naming flag
  ASoC: msm*: Remove now redundant non_legacy_dai_naming flag
  ASoC: nau*: Remove now redundant non_legacy_dai_naming flag
  ASoC: pcm*: Remove now redundant non_legacy_dai_naming flag
  ASoC: rt*: Remove now redundant non_legacy_dai_naming flag
  ASoC: spdif: Remove now redundant non_legacy_dai_naming flag
  ASoC: ssm*: Remove now redundant non_legacy_dai_naming flag
  ASoC: sta*: Remove now redundant non_legacy_dai_naming flag
  ASoC: tas*: Remove now redundant non_legacy_dai_naming flag
  ASoC: tfa*: Remove now redundant non_legacy_dai_naming flag
  ASoC: tlv320*: Remove now redundant non_legacy_dai_naming flag
  ASoC: twl*: Remove now redundant non_legacy_dai_naming flag
  ASoC: uda*: Remove now redundant non_legacy_dai_naming flag
  ASoC: wm*: Remove now redundant non_legacy_dai_naming flag
  ASoC: 88pm860x: Remove now redundant non_legacy_dai_naming flag
  ASoC: ab8500: Remove now redundant non_legacy_dai_naming flag
  ASoC: ac97: Remove now redundant non_legacy_dai_naming flag
  ASoC: ads117x: Remove now redundant non_legacy_dai_naming flag
  ASoC: bd28623: Remove now redundant non_legacy_dai_naming flag
  ASoC: bt-sco: Remove now redundant non_legacy_dai_naming flag
  ASoC: cpcap: Remove now redundant non_legacy_dai_naming flag
  ASoC: cq93vc: Remove now redundant non_legacy_dai_naming flag
  ASoC: cx20442: Remove now redundant non_legacy_dai_naming flag
  ASoC: dmic: Remove now redundant non_legacy_dai_naming flag
  ASoC: gtm601: Remove now redundant non_legacy_dai_naming flag
  ASoC: hdac_hdmi: Remove now redundant non_legacy_dai_naming flag
  ASoC: hdmi-codec: Remove now redundant non_legacy_dai_naming flag
  ASoC: ics43432: Remove now redundant non_legacy_dai_naming flag
  ASoC: inno_rk3036: Remove now redundant non_legacy_dai_naming flag
  ASoC: Intel: avs: Remove now redundant non_legacy_dai_naming flag
  ASoC: isabelle: Remove now redundant non_legacy_dai_naming flag
  ASoC: jz4740: Remove now redundant non_legacy_dai_naming flag
  ASoC: lm49453: Remove now redundant non_legacy_dai_naming flag
  ASoC: lochnagar: Remove now redundant non_legacy_dai_naming flag
  ASoC: mc13783: Remove now redundant non_legacy_dai_naming flag
  ASoC: ml26124: Remove now redundant non_legacy_dai_naming flag
  ASoC: rk817: Remove now redundant non_legacy_dai_naming flag
  ASoC: sgtl5000: Remove now redundant non_legacy_dai_naming flag
  ASoC: si476x: Remove now redundant non_legacy_dai_naming flag
  ASoC: stac9766: Remove now redundant non_legacy_dai_naming flag
  ASoC: sti-sas: Remove now redundant non_legacy_dai_naming flag
  ASoC: tscs42xx: Remove now redundant non_legacy_dai_naming flag
  ASoC: wl1273: Remove now redundant non_legacy_dai_naming flag
  ASoC: zl38060: Remove now redundant non_legacy_dai_naming flag
  ASoC: soc-component: Remove non_legacy_dai_naming flag

 drivers/gpu/drm/vc4/vc4_hdmi.c         |  1 +
 drivers/media/i2c/tda1997x.c           |  1 -
 drivers/soundwire/intel.c              |  5 +++--
 include/sound/soc-component.h          |  2 +-
 sound/soc/adi/axi-i2s.c                |  1 +
 sound/soc/adi/axi-spdif.c              |  1 +
 sound/soc/amd/acp/acp-platform.c       | 15 ++++++++-------
 sound/soc/amd/raven/acp3x-i2s.c        |  3 ++-
 sound/soc/amd/renoir/acp3x-pdm-dma.c   | 13 +++++++------
 sound/soc/amd/vangogh/acp5x-i2s.c      |  1 +
 sound/soc/amd/yc/acp6x-pdm-dma.c       | 13 +++++++------
 sound/soc/atmel/atmel-classd.c         |  1 +
 sound/soc/atmel/atmel-i2s.c            |  3 ++-
 sound/soc/atmel/atmel-pdmic.c          |  1 +
 sound/soc/atmel/atmel_ssc_dai.c        |  7 ++++---
 sound/soc/atmel/mchp-i2s-mcc.c         |  3 ++-
 sound/soc/atmel/mchp-pdmc.c            |  1 +
 sound/soc/atmel/mchp-spdifrx.c         |  3 ++-
 sound/soc/atmel/mchp-spdiftx.c         |  3 ++-
 sound/soc/au1x/ac97c.c                 |  3 ++-
 sound/soc/au1x/i2sc.c                  |  3 ++-
 sound/soc/au1x/psc-ac97.c              |  3 ++-
 sound/soc/au1x/psc-i2s.c               |  3 ++-
 sound/soc/bcm/bcm2835-i2s.c            |  3 ++-
 sound/soc/bcm/bcm63xx-i2s-whistler.c   |  1 +
 sound/soc/bcm/cygnus-ssp.c             |  7 ++++---
 sound/soc/cirrus/ep93xx-ac97.c         |  3 ++-
 sound/soc/cirrus/ep93xx-i2s.c          |  7 ++++---
 sound/soc/codecs/88pm860x-codec.c      |  1 -
 sound/soc/codecs/ab8500-codec.c        |  1 -
 sound/soc/codecs/ac97.c                |  1 -
 sound/soc/codecs/ad1836.c              |  1 -
 sound/soc/codecs/ad193x.c              |  1 -
 sound/soc/codecs/ad1980.c              |  1 -
 sound/soc/codecs/ad73311.c             |  1 -
 sound/soc/codecs/adau1373.c            |  1 -
 sound/soc/codecs/adau1701.c            |  1 -
 sound/soc/codecs/adau1761.c            |  1 -
 sound/soc/codecs/adau1781.c            |  1 -
 sound/soc/codecs/adau1977.c            |  1 -
 sound/soc/codecs/adau7002.c            |  1 -
 sound/soc/codecs/adau7118.c            |  1 -
 sound/soc/codecs/adav80x.c             |  1 -
 sound/soc/codecs/ads117x.c             |  1 -
 sound/soc/codecs/ak4104.c              |  1 -
 sound/soc/codecs/ak4118.c              |  1 -
 sound/soc/codecs/ak4375.c              |  1 -
 sound/soc/codecs/ak4458.c              |  2 --
 sound/soc/codecs/ak4535.c              |  1 -
 sound/soc/codecs/ak4554.c              |  1 -
 sound/soc/codecs/ak4613.c              |  1 -
 sound/soc/codecs/ak4641.c              |  1 -
 sound/soc/codecs/ak4642.c              |  1 -
 sound/soc/codecs/ak4671.c              |  1 -
 sound/soc/codecs/ak5386.c              |  1 -
 sound/soc/codecs/ak5558.c              |  2 --
 sound/soc/codecs/alc5623.c             |  1 -
 sound/soc/codecs/alc5632.c             |  1 -
 sound/soc/codecs/bd28623.c             |  1 -
 sound/soc/codecs/bt-sco.c              |  1 -
 sound/soc/codecs/cpcap.c               |  1 -
 sound/soc/codecs/cq93vc.c              |  1 -
 sound/soc/codecs/cs35l32.c             |  1 -
 sound/soc/codecs/cs35l33.c             |  1 -
 sound/soc/codecs/cs35l34.c             |  1 -
 sound/soc/codecs/cs35l35.c             |  1 -
 sound/soc/codecs/cs35l36.c             |  1 -
 sound/soc/codecs/cs4234.c              |  1 -
 sound/soc/codecs/cs4265.c              |  1 -
 sound/soc/codecs/cs4270.c              |  1 -
 sound/soc/codecs/cs4271.c              |  1 -
 sound/soc/codecs/cs42l42.c             |  1 -
 sound/soc/codecs/cs42l51.c             |  1 -
 sound/soc/codecs/cs42l52.c             |  1 -
 sound/soc/codecs/cs42l56.c             |  1 -
 sound/soc/codecs/cs42l73.c             |  1 -
 sound/soc/codecs/cs42xx8.c             |  1 -
 sound/soc/codecs/cs43130.c             |  1 -
 sound/soc/codecs/cs4341.c              |  1 -
 sound/soc/codecs/cs4349.c              |  1 -
 sound/soc/codecs/cs47l15.c             |  1 -
 sound/soc/codecs/cs47l24.c             |  1 -
 sound/soc/codecs/cs47l35.c             |  1 -
 sound/soc/codecs/cs47l85.c             |  1 -
 sound/soc/codecs/cs47l90.c             |  1 -
 sound/soc/codecs/cs47l92.c             |  1 -
 sound/soc/codecs/cs53l30.c             |  1 -
 sound/soc/codecs/cx20442.c             |  1 -
 sound/soc/codecs/da7210.c              |  1 -
 sound/soc/codecs/da7213.c              |  1 -
 sound/soc/codecs/da7218.c              |  1 -
 sound/soc/codecs/da7219.c              |  1 -
 sound/soc/codecs/da732x.c              |  1 -
 sound/soc/codecs/da9055.c              |  1 -
 sound/soc/codecs/dmic.c                |  1 -
 sound/soc/codecs/es7134.c              |  1 -
 sound/soc/codecs/es7241.c              |  1 -
 sound/soc/codecs/es8316.c              |  1 -
 sound/soc/codecs/es8328.c              |  1 -
 sound/soc/codecs/gtm601.c              |  1 -
 sound/soc/codecs/hdac_hdmi.c           |  1 -
 sound/soc/codecs/hdmi-codec.c          |  1 -
 sound/soc/codecs/ics43432.c            |  1 -
 sound/soc/codecs/inno_rk3036.c         |  1 -
 sound/soc/codecs/isabelle.c            |  1 -
 sound/soc/codecs/jz4740.c              |  2 --
 sound/soc/codecs/lm49453.c             |  1 -
 sound/soc/codecs/lochnagar-sc.c        |  1 -
 sound/soc/codecs/max98088.c            |  1 -
 sound/soc/codecs/max98090.c            |  1 -
 sound/soc/codecs/max98095.c            |  1 -
 sound/soc/codecs/max98357a.c           |  1 -
 sound/soc/codecs/max98371.c            |  1 -
 sound/soc/codecs/max98373.c            |  2 --
 sound/soc/codecs/max98390.c            |  1 -
 sound/soc/codecs/max98396.c            |  2 --
 sound/soc/codecs/max9850.c             |  1 -
 sound/soc/codecs/max98520.c            |  1 -
 sound/soc/codecs/max9860.c             |  1 -
 sound/soc/codecs/max9867.c             |  1 -
 sound/soc/codecs/max98925.c            |  1 -
 sound/soc/codecs/max98926.c            |  1 -
 sound/soc/codecs/max98927.c            |  1 -
 sound/soc/codecs/mc13783.c             |  1 -
 sound/soc/codecs/ml26124.c             |  1 -
 sound/soc/codecs/msm8916-wcd-analog.c  |  1 -
 sound/soc/codecs/msm8916-wcd-digital.c |  1 -
 sound/soc/codecs/nau8315.c             |  1 -
 sound/soc/codecs/nau8540.c             |  1 -
 sound/soc/codecs/nau8810.c             |  1 -
 sound/soc/codecs/nau8821.c             |  1 -
 sound/soc/codecs/nau8822.c             |  1 -
 sound/soc/codecs/nau8824.c             |  1 -
 sound/soc/codecs/nau8825.c             |  1 -
 sound/soc/codecs/pcm1681.c             |  1 -
 sound/soc/codecs/pcm1789.c             |  1 -
 sound/soc/codecs/pcm179x.c             |  1 -
 sound/soc/codecs/pcm186x.c             |  2 --
 sound/soc/codecs/pcm3008.c             |  1 -
 sound/soc/codecs/pcm3168a.c            |  1 -
 sound/soc/codecs/pcm5102a.c            |  1 -
 sound/soc/codecs/pcm512x.c             |  1 -
 sound/soc/codecs/rk817_codec.c         |  1 -
 sound/soc/codecs/rt1011.c              |  1 -
 sound/soc/codecs/rt1015.c              |  1 -
 sound/soc/codecs/rt1015p.c             |  1 -
 sound/soc/codecs/rt1016.c              |  1 -
 sound/soc/codecs/rt1019.c              |  1 -
 sound/soc/codecs/rt1305.c              |  1 -
 sound/soc/codecs/rt1308.c              |  1 -
 sound/soc/codecs/rt274.c               |  1 -
 sound/soc/codecs/rt286.c               |  1 -
 sound/soc/codecs/rt298.c               |  1 -
 sound/soc/codecs/rt5514.c              |  1 -
 sound/soc/codecs/rt5616.c              |  1 -
 sound/soc/codecs/rt5631.c              |  1 -
 sound/soc/codecs/rt5640.c              |  2 --
 sound/soc/codecs/rt5645.c              |  1 -
 sound/soc/codecs/rt5651.c              |  1 -
 sound/soc/codecs/rt5659.c              |  1 -
 sound/soc/codecs/rt5660.c              |  1 -
 sound/soc/codecs/rt5663.c              |  1 -
 sound/soc/codecs/rt5665.c              |  1 -
 sound/soc/codecs/rt5668.c              |  1 -
 sound/soc/codecs/rt5670.c              |  1 -
 sound/soc/codecs/rt5677.c              |  1 -
 sound/soc/codecs/rt5682.c              |  1 -
 sound/soc/codecs/rt5682s.c             |  1 -
 sound/soc/codecs/sgtl5000.c            |  1 -
 sound/soc/codecs/si476x.c              |  1 -
 sound/soc/codecs/spdif_receiver.c      |  1 -
 sound/soc/codecs/spdif_transmitter.c   |  1 -
 sound/soc/codecs/ssm2518.c             |  1 -
 sound/soc/codecs/ssm2602.c             |  1 -
 sound/soc/codecs/ssm4567.c             |  1 -
 sound/soc/codecs/sta32x.c              |  1 -
 sound/soc/codecs/sta350.c              |  1 -
 sound/soc/codecs/sta529.c              |  1 -
 sound/soc/codecs/stac9766.c            |  2 --
 sound/soc/codecs/sti-sas.c             |  1 -
 sound/soc/codecs/tas2552.c             |  1 -
 sound/soc/codecs/tas2562.c             |  2 --
 sound/soc/codecs/tas2764.c             |  1 -
 sound/soc/codecs/tas2770.c             |  1 -
 sound/soc/codecs/tas5086.c             |  1 -
 sound/soc/codecs/tas571x.c             |  1 -
 sound/soc/codecs/tas5720.c             |  2 --
 sound/soc/codecs/tas5805m.c            |  1 -
 sound/soc/codecs/tas6424.c             |  1 -
 sound/soc/codecs/tfa9879.c             |  1 -
 sound/soc/codecs/tfa989x.c             |  1 -
 sound/soc/codecs/tlv320adcx140.c       |  1 -
 sound/soc/codecs/tlv320aic23.c         |  1 -
 sound/soc/codecs/tlv320aic26.c         |  1 -
 sound/soc/codecs/tlv320aic31xx.c       |  1 -
 sound/soc/codecs/tlv320aic32x4.c       |  2 --
 sound/soc/codecs/tlv320aic3x.c         |  1 -
 sound/soc/codecs/tlv320dac33.c         |  1 -
 sound/soc/codecs/tscs42xx.c            |  1 -
 sound/soc/codecs/twl4030.c             |  1 -
 sound/soc/codecs/twl6040.c             |  1 -
 sound/soc/codecs/uda1334.c             |  1 -
 sound/soc/codecs/uda134x.c             |  1 -
 sound/soc/codecs/uda1380.c             |  1 -
 sound/soc/codecs/wl1273.c              |  1 -
 sound/soc/codecs/wm0010.c              |  1 -
 sound/soc/codecs/wm1250-ev1.c          |  1 -
 sound/soc/codecs/wm2000.c              |  1 -
 sound/soc/codecs/wm2200.c              |  1 -
 sound/soc/codecs/wm5100.c              |  1 -
 sound/soc/codecs/wm5102.c              |  1 -
 sound/soc/codecs/wm5110.c              |  1 -
 sound/soc/codecs/wm8350.c              |  1 -
 sound/soc/codecs/wm8400.c              |  1 -
 sound/soc/codecs/wm8510.c              |  1 -
 sound/soc/codecs/wm8523.c              |  1 -
 sound/soc/codecs/wm8524.c              |  1 -
 sound/soc/codecs/wm8580.c              |  1 -
 sound/soc/codecs/wm8711.c              |  1 -
 sound/soc/codecs/wm8727.c              |  1 -
 sound/soc/codecs/wm8728.c              |  1 -
 sound/soc/codecs/wm8731.c              |  1 -
 sound/soc/codecs/wm8737.c              |  1 -
 sound/soc/codecs/wm8741.c              |  1 -
 sound/soc/codecs/wm8750.c              |  1 -
 sound/soc/codecs/wm8753.c              |  1 -
 sound/soc/codecs/wm8770.c              |  1 -
 sound/soc/codecs/wm8776.c              |  1 -
 sound/soc/codecs/wm8782.c              |  1 -
 sound/soc/codecs/wm8804.c              |  1 -
 sound/soc/codecs/wm8900.c              |  1 -
 sound/soc/codecs/wm8903.c              |  1 -
 sound/soc/codecs/wm8904.c              |  1 -
 sound/soc/codecs/wm8940.c              |  1 -
 sound/soc/codecs/wm8955.c              |  1 -
 sound/soc/codecs/wm8960.c              |  1 -
 sound/soc/codecs/wm8961.c              |  1 -
 sound/soc/codecs/wm8962.c              |  1 -
 sound/soc/codecs/wm8971.c              |  1 -
 sound/soc/codecs/wm8974.c              |  1 -
 sound/soc/codecs/wm8978.c              |  1 -
 sound/soc/codecs/wm8983.c              |  1 -
 sound/soc/codecs/wm8985.c              |  1 -
 sound/soc/codecs/wm8988.c              |  1 -
 sound/soc/codecs/wm8990.c              |  1 -
 sound/soc/codecs/wm8991.c              |  1 -
 sound/soc/codecs/wm8993.c              |  1 -
 sound/soc/codecs/wm8994.c              |  1 -
 sound/soc/codecs/wm8995.c              |  1 -
 sound/soc/codecs/wm8996.c              |  2 --
 sound/soc/codecs/wm8997.c              |  1 -
 sound/soc/codecs/wm8998.c              |  1 -
 sound/soc/codecs/wm9081.c              |  1 -
 sound/soc/codecs/wm9090.c              |  1 -
 sound/soc/codecs/wm9705.c              |  1 -
 sound/soc/codecs/wm9712.c              |  1 -
 sound/soc/codecs/wm9713.c              |  1 -
 sound/soc/codecs/zl38060.c             |  1 -
 sound/soc/dwc/dwc-i2s.c                |  7 ++++---
 sound/soc/fsl/fsl_aud2htx.c            |  3 ++-
 sound/soc/fsl/fsl_easrc.c              |  7 ++++---
 sound/soc/fsl/fsl_esai.c               |  3 ++-
 sound/soc/fsl/fsl_mqs.c                |  1 -
 sound/soc/fsl/fsl_rpmsg.c              |  3 ++-
 sound/soc/fsl/fsl_sai.c                |  3 ++-
 sound/soc/fsl/fsl_spdif.c              |  3 ++-
 sound/soc/fsl/fsl_ssi.c                |  1 +
 sound/soc/fsl/fsl_xcvr.c               |  3 ++-
 sound/soc/fsl/mpc5200_psc_i2s.c        |  3 ++-
 sound/soc/generic/test-component.c     |  2 +-
 sound/soc/hisilicon/hi6210-i2s.c       |  1 +
 sound/soc/img/img-i2s-in.c             |  3 ++-
 sound/soc/img/img-i2s-out.c            |  3 ++-
 sound/soc/img/img-parallel-out.c       |  3 ++-
 sound/soc/img/img-spdif-in.c           |  3 ++-
 sound/soc/img/img-spdif-out.c          |  3 ++-
 sound/soc/img/pistachio-internal-dac.c |  1 -
 sound/soc/intel/avs/pcm.c              |  2 --
 sound/soc/intel/keembay/kmb_platform.c | 14 ++++++++------
 sound/soc/jz4740/jz4740-i2s.c          |  7 ++++---
 sound/soc/meson/aiu-acodec-ctrl.c      |  1 -
 sound/soc/meson/aiu-codec-ctrl.c       |  1 -
 sound/soc/meson/axg-frddr.c            |  3 +++
 sound/soc/meson/axg-pdm.c              |  4 +++-
 sound/soc/meson/axg-spdifin.c          |  1 +
 sound/soc/meson/axg-spdifout.c         |  1 +
 sound/soc/meson/axg-toddr.c            |  3 +++
 sound/soc/meson/g12a-toacodec.c        |  2 --
 sound/soc/meson/g12a-tohdmitx.c        |  1 -
 sound/soc/meson/t9015.c                |  1 -
 sound/soc/mxs/mxs-saif.c               |  3 ++-
 sound/soc/pxa/mmp-sspa.c               |  9 +++++----
 sound/soc/pxa/pxa-ssp.c                | 21 +++++++++++----------
 sound/soc/pxa/pxa2xx-i2s.c             | 21 +++++++++++----------
 sound/soc/qcom/lpass-cpu.c             |  1 +
 sound/soc/qcom/qdsp6/q6asm-dai.c       | 23 ++++++++++++-----------
 sound/soc/rockchip/rockchip_i2s.c      |  1 +
 sound/soc/rockchip/rockchip_i2s_tdm.c  |  1 +
 sound/soc/rockchip/rockchip_pdm.c      |  1 +
 sound/soc/rockchip/rockchip_spdif.c    |  1 +
 sound/soc/samsung/aries_wm8994.c       |  1 -
 sound/soc/samsung/i2s.c                |  2 ++
 sound/soc/samsung/pcm.c                |  3 ++-
 sound/soc/samsung/s3c2412-i2s.c        |  7 ++++---
 sound/soc/samsung/s3c24xx-i2s.c        |  7 ++++---
 sound/soc/samsung/spdif.c              |  7 ++++---
 sound/soc/sh/hac.c                     |  3 ++-
 sound/soc/sh/rcar/core.c               | 11 ++++++-----
 sound/soc/sh/rz-ssi.c                  |  9 +++++----
 sound/soc/sh/siu_pcm.c                 | 17 +++++++++--------
 sound/soc/sh/ssi.c                     |  3 ++-
 sound/soc/soc-core.c                   |  2 +-
 sound/soc/soc-topology-test.c          |  3 ---
 sound/soc/soc-utils.c                  |  1 -
 sound/soc/sof/pcm.c                    |  2 ++
 sound/soc/sof/sof-client-probes.c      |  1 +
 sound/soc/spear/spdif_in.c             |  3 ++-
 sound/soc/spear/spdif_out.c            |  3 ++-
 sound/soc/sti/sti_uniperif.c           |  3 ++-
 sound/soc/stm/stm32_adfsdm.c           |  1 +
 sound/soc/stm/stm32_i2s.c              |  1 +
 sound/soc/stm/stm32_sai_sub.c          |  1 +
 sound/soc/stm/stm32_spdifrx.c          |  1 +
 sound/soc/sunxi/sun4i-codec.c          |  7 ++-----
 sound/soc/sunxi/sun4i-i2s.c            |  3 ++-
 sound/soc/sunxi/sun4i-spdif.c          |  3 ++-
 sound/soc/sunxi/sun8i-codec.c          |  1 -
 sound/soc/tegra/tegra20_ac97.c         |  3 ++-
 sound/soc/tegra/tegra20_i2s.c          |  3 ++-
 sound/soc/tegra/tegra20_spdif.c        |  1 +
 sound/soc/tegra/tegra210_i2s.c         |  1 -
 sound/soc/tegra/tegra30_i2s.c          |  3 ++-
 sound/soc/ti/davinci-i2s.c             |  3 ++-
 sound/soc/ti/davinci-mcasp.c           |  3 ++-
 sound/soc/ti/davinci-vcif.c            |  3 ++-
 sound/soc/ti/omap-dmic.c               |  3 ++-
 sound/soc/ti/omap-hdmi.c               |  1 +
 sound/soc/ti/omap-mcbsp.c              |  3 ++-
 sound/soc/ti/omap-mcpdm.c              |  7 ++++---
 sound/soc/uniphier/evea.c              |  1 -
 sound/soc/ux500/ux500_msp_dai.c        |  3 ++-
 sound/soc/xilinx/xlnx_formatter_pcm.c  | 16 ++++++++--------
 sound/soc/xilinx/xlnx_i2s.c            |  1 +
 sound/soc/xilinx/xlnx_spdif.c          |  1 +
 sound/soc/xtensa/xtfpga-i2s.c          | 15 ++++++++-------
 345 files changed, 274 insertions(+), 435 deletions(-)

-- 
2.30.2

