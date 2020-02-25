Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68D9B16F904
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2020 09:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26E776E17B;
	Wed, 26 Feb 2020 08:08:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from olimex.com (olimex.com [184.105.72.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3BEC6EA7F
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 10:01:27 +0000 (UTC)
Received: from 94.155.250.134 ([94.155.250.134]) by olimex.com with ESMTPSA
 (ECDHE-RSA-AES128-GCM-SHA256:TLSv1.2:Kx=ECDH:Au=RSA:Enc=AESGCM(128):Mac=AEAD)
 (SMTP-AUTH username stefan@olimex.com, mechanism PLAIN)
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Feb 2020 02:01:20 -0800
Subject: Re: [linux-sunxi] [PATCH v3 1/1] drm: sun4i: hdmi: Add support for
 sun4i HDMI encoder audio
To: Maxime Ripard <maxime@cerno.tech>, Stefan Mavrodiev <stefan@olimex.com>
References: <20200128140642.8404-1-stefan@olimex.com>
 <20200128140642.8404-2-stefan@olimex.com>
 <CAGb2v66kEACD0oOqoL2sx8JJJAnZzZc+EwEK8+74bZx48L-Z5A@mail.gmail.com>
 <81b0a464-22f7-4d36-e9bc-f08a52accdbc@olimex.com>
 <20200225095837.py6v2tkpyb7bonoz@gilmour.lan>
From: Stefan Mavrodiev <stefan@olimex.com>
Message-ID: <4c5a22c6-0f0f-1f5c-d6b1-1614d59d9ec4@olimex.com>
Date: Tue, 25 Feb 2020 12:01:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200225095837.py6v2tkpyb7bonoz@gilmour.lan>
Content-Language: en-US
X-Mailman-Approved-At: Wed, 26 Feb 2020 08:08:26 +0000
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
Cc: Linux-ALSA <alsa-devel@alsa-project.org>, Chen-Yu Tsai <wens@csie.org>,
 Liam Girdwood <lgirdwood@gmail.com>, David Airlie <airlied@linux.ie>,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVERS FOR ALLWINNER A10" <dri-devel@lists.freedesktop.org>,
 Takashi Iwai <tiwai@suse.com>, linux-sunxi <linux-sunxi@googlegroups.com>,
 Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 wens@kernel.org, "moderated list:ARM/Allwinner sunXi SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/25/20 11:58 AM, Maxime Ripard wrote:
> On Tue, Feb 25, 2020 at 11:45:28AM +0200, Stefan Mavrodiev wrote:
>> On 1/29/20 6:34 PM, Chen-Yu Tsai wrote:
>>> On Tue, Jan 28, 2020 at 10:07 PM Stefan Mavrodiev <stefan@olimex.com> wrote:
>>>> Add HDMI audio support for the sun4i-hdmi encoder, used on
>>>> the older Allwinner chips - A10, A20, A31.
>>>>
>>>> Most of the code is based on the BSP implementation. In it
>>>> dditional formats are supported (S20_3LE and S24_LE), however
>>>> there where some problems with them and only S16_LE is left.
>>>>
>>>> Signed-off-by: Stefan Mavrodiev <stefan@olimex.com>
>>>> ---
>>>> Changes for v3:
>>>>    - Instead of platfrom_driver dynammicly register/unregister card
>>>>    - Add Kconfig dependencies
>>>>    - Restrore drvdata after card unregistering
>>>>
>>>> Changes for v2:
>>>>    - Create a new platform driver instead of using the HDMI encoder
>>>>    - Expose a new kcontrol to the userspace holding the ELD data
>>>>    - Wrap all macro arguments in parentheses
>>>>
>>>>    drivers/gpu/drm/sun4i/Kconfig            |  11 +
>>>>    drivers/gpu/drm/sun4i/Makefile           |   3 +
>>>>    drivers/gpu/drm/sun4i/sun4i_hdmi.h       |  37 ++
>>>>    drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c | 450 +++++++++++++++++++++++
>>>>    drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c   |  14 +
>>>>    5 files changed, 515 insertions(+)
>>>>    create mode 100644 drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
>>> Since this is actually an audio driver, please include all the ALSA / ASoC
>>> maintainers and mailing lists (CC-ed).
>>>
>>>> diff --git a/drivers/gpu/drm/sun4i/Kconfig b/drivers/gpu/drm/sun4i/Kconfig
>>>> index 37e90e42943f..ca2ab5d53dd4 100644
>>>> --- a/drivers/gpu/drm/sun4i/Kconfig
>>>> +++ b/drivers/gpu/drm/sun4i/Kconfig
>>>> @@ -23,6 +23,17 @@ config DRM_SUN4I_HDMI
>>>>             Choose this option if you have an Allwinner SoC with an HDMI
>>>>             controller.
>>>>
>>>> +config DRM_SUN4I_HDMI_AUDIO
>>>> +       bool "Allwinner A10 HDMI Audio Support"
>>>> +       default y
>>>> +       depends on DRM_SUN4I_HDMI
>>>> +       depends on SND_SOC=y || SND_SOC=DRM_SUN4I_HDMI
>>>> +       select SND_PCM_ELD
>>>> +       select SND_SOC_GENERIC_DMAENGINE_PCM
>>>> +       help
>>>> +         Choose this option if you have an Allwinner SoC with an HDMI
>>>> +         controller and want to use audio.
>>>> +
>>>>    config DRM_SUN4I_HDMI_CEC
>>>>           bool "Allwinner A10 HDMI CEC Support"
>>>>           depends on DRM_SUN4I_HDMI
>>>> diff --git a/drivers/gpu/drm/sun4i/Makefile b/drivers/gpu/drm/sun4i/Makefile
>>>> index 0d04f2447b01..492bfd28ad2e 100644
>>>> --- a/drivers/gpu/drm/sun4i/Makefile
>>>> +++ b/drivers/gpu/drm/sun4i/Makefile
>>>> @@ -5,6 +5,9 @@ sun4i-frontend-y                += sun4i_frontend.o
>>>>    sun4i-drm-y                    += sun4i_drv.o
>>>>    sun4i-drm-y                    += sun4i_framebuffer.o
>>>>
>>>> +ifdef CONFIG_DRM_SUN4I_HDMI_AUDIO
>>>> +sun4i-drm-hdmi-y               += sun4i_hdmi_audio.o
>>>> +endif
>>>>    sun4i-drm-hdmi-y               += sun4i_hdmi_ddc_clk.o
>>>>    sun4i-drm-hdmi-y               += sun4i_hdmi_enc.o
>>>>    sun4i-drm-hdmi-y               += sun4i_hdmi_i2c.o
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi.h b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
>>>> index 7ad3f06c127e..28621d289655 100644
>>>> --- a/drivers/gpu/drm/sun4i/sun4i_hdmi.h
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi.h
>>>> @@ -42,7 +42,32 @@
>>>>    #define SUN4I_HDMI_VID_TIMING_POL_VSYNC                BIT(1)
>>>>    #define SUN4I_HDMI_VID_TIMING_POL_HSYNC                BIT(0)
>>>>
>>>> +#define SUN4I_HDMI_AUDIO_CTRL_REG      0x040
>>>> +#define SUN4I_HDMI_AUDIO_CTRL_ENABLE           BIT(31)
>>>> +#define SUN4I_HDMI_AUDIO_CTRL_RESET            BIT(30)
>>>> +
>>>> +#define SUN4I_HDMI_AUDIO_FMT_REG       0x048
>>>> +#define SUN4I_HDMI_AUDIO_FMT_SRC               BIT(31)
>>>> +#define SUN4I_HDMI_AUDIO_FMT_LAYOUT            BIT(3)
>>>> +#define SUN4I_HDMI_AUDIO_FMT_CH_CFG(n)         ((n) - 1)
>>>> +#define SUN4I_HDMI_AUDIO_FMT_CH_CFG_MASK       GENMASK(2, 0)
>>>> +
>>>> +#define SUN4I_HDMI_AUDIO_PCM_REG       0x4c
>>>> +#define SUN4I_HDMI_AUDIO_PCM_CH_MAP(n, m)      (((m) - 1) << ((n) * 4))
>>>> +#define SUN4I_HDMI_AUDIO_PCM_CH_MAP_MASK(n)    (GENMASK(2, 0) << ((n) * 4))
>>>> +
>>>> +#define SUN4I_HDMI_AUDIO_CTS_REG       0x050
>>>> +#define SUN4I_HDMI_AUDIO_CTS(n)                        ((n) & GENMASK(19, 0))
>>>> +
>>>> +#define SUN4I_HDMI_AUDIO_N_REG         0x054
>>>> +#define SUN4I_HDMI_AUDIO_N(n)                  ((n) & GENMASK(19, 0))
>>>> +
>>>> +#define SUN4I_HDMI_AUDIO_STAT0_REG     0x58
>>>> +#define SUN4I_HDMI_AUDIO_STAT0_FREQ(n)         ((n) << 24)
>>>> +#define SUN4I_HDMI_AUDIO_STAT0_FREQ_MASK       GENMASK(27, 24)
>>>> +
>>>>    #define SUN4I_HDMI_AVI_INFOFRAME_REG(n)        (0x080 + (n))
>>>> +#define SUN4I_HDMI_AUDIO_INFOFRAME_REG(n)      (0x0a0 + (n))
>>>>
>>>>    #define SUN4I_HDMI_PAD_CTRL0_REG       0x200
>>>>    #define SUN4I_HDMI_PAD_CTRL0_BIASEN            BIT(31)
>>>> @@ -242,6 +267,11 @@ struct sun4i_hdmi_variant {
>>>>           bool                    ddc_fifo_has_dir;
>>>>    };
>>>>
>>>> +struct sun4i_hdmi_audio {
>>>> +       struct snd_soc_card             *card;
>>>> +       u8                              channels;
>>>> +};
>>>> +
>>>>    struct sun4i_hdmi {
>>>>           struct drm_connector    connector;
>>>>           struct drm_encoder      encoder;
>>>> @@ -283,9 +313,14 @@ struct sun4i_hdmi {
>>>>           struct regmap_field     *field_ddc_sda_en;
>>>>           struct regmap_field     *field_ddc_sck_en;
>>>>
>>>> +
>>>>           struct sun4i_drv        *drv;
>>>>
>>>>           bool                    hdmi_monitor;
>>>> +       bool                    hdmi_audio;
>>>> +
>>>> +       struct sun4i_hdmi_audio audio;
>>>> +
>>>>           struct cec_adapter      *cec_adap;
>>>>
>>>>           const struct sun4i_hdmi_variant *variant;
>>>> @@ -294,5 +329,7 @@ struct sun4i_hdmi {
>>>>    int sun4i_ddc_create(struct sun4i_hdmi *hdmi, struct clk *clk);
>>>>    int sun4i_tmds_create(struct sun4i_hdmi *hdmi);
>>>>    int sun4i_hdmi_i2c_create(struct device *dev, struct sun4i_hdmi *hdmi);
>>>> +int sun4i_hdmi_audio_create(struct sun4i_hdmi *hdmi);
>>>> +void sun4i_hdmi_audio_destroy(struct sun4i_hdmi *hdmi);
>>>>
>>>>    #endif /* _SUN4I_HDMI_H_ */
>>>> diff --git a/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c b/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
>>>> new file mode 100644
>>>> index 000000000000..f42f2cea4e9e
>>>> --- /dev/null
>>>> +++ b/drivers/gpu/drm/sun4i/sun4i_hdmi_audio.c
>>>> @@ -0,0 +1,450 @@
>>>> +// SPDX-License-Identifier: GPL-2.0-or-later
>>>> +/*
>>>> + * Copyright (C) 2020 Olimex Ltd.
>>>> + *   Author: Stefan Mavrodiev <stefan@olimex.com>
>>>> + */
>>>> +#include <linux/dma-mapping.h>
>>>> +#include <linux/dmaengine.h>
>>>> +#include <linux/module.h>
>>>> +#include <linux/of_dma.h>
>>>> +#include <linux/regmap.h>
>>>> +
>>>> +#include <drm/drm_print.h>
>>>> +
>>>> +#include <sound/dmaengine_pcm.h>
>>>> +#include <sound/pcm_drm_eld.h>
>>>> +#include <sound/pcm_params.h>
>>>> +#include <sound/soc.h>
>>>> +
>>>> +#include "sun4i_hdmi.h"
>>>> +
>>>> +static int sun4i_hdmi_audio_ctl_eld_info(struct snd_kcontrol *kcontrol,
>>>> +                                        struct snd_ctl_elem_info *uinfo)
>>>> +{
>>>> +       uinfo->type = SNDRV_CTL_ELEM_TYPE_BYTES;
>>>> +       uinfo->count = MAX_ELD_BYTES;
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int sun4i_hdmi_audio_ctl_eld_get(struct snd_kcontrol *kcontrol,
>>>> +                                       struct snd_ctl_elem_value *ucontrol)
>>>> +{
>>>> +       struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
>>>> +       struct snd_soc_card *card = snd_soc_component_get_drvdata(component);
>>>> +       struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
>>>> +
>>>> +       memcpy(ucontrol->value.bytes.data,
>>>> +              hdmi->connector.eld,
>>>> +              MAX_ELD_BYTES);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static const struct snd_kcontrol_new sun4i_hdmi_audio_controls[] = {
>>>> +       {
>>>> +               .access = SNDRV_CTL_ELEM_ACCESS_READ |
>>>> +                         SNDRV_CTL_ELEM_ACCESS_VOLATILE,
>>>> +               .iface = SNDRV_CTL_ELEM_IFACE_PCM,
>>>> +               .name = "ELD",
>>>> +               .info = sun4i_hdmi_audio_ctl_eld_info,
>>>> +               .get = sun4i_hdmi_audio_ctl_eld_get,
>>>> +       },
>>>> +};
>>>> +
>>>> +static const struct snd_soc_dapm_widget sun4i_hdmi_audio_widgets[] = {
>>>> +       SND_SOC_DAPM_OUTPUT("TX"),
>>>> +};
>>>> +
>>>> +static const struct snd_soc_dapm_route sun4i_hdmi_audio_routes[] = {
>>>> +       { "TX", NULL, "Playback" },
>>>> +};
>>>> +
>>>> +static const struct snd_soc_component_driver sun4i_hdmi_audio_component = {
>>>> +       .controls               = sun4i_hdmi_audio_controls,
>>>> +       .num_controls           = ARRAY_SIZE(sun4i_hdmi_audio_controls),
>>>> +       .dapm_widgets           = sun4i_hdmi_audio_widgets,
>>>> +       .num_dapm_widgets       = ARRAY_SIZE(sun4i_hdmi_audio_widgets),
>>>> +       .dapm_routes            = sun4i_hdmi_audio_routes,
>>>> +       .num_dapm_routes        = ARRAY_SIZE(sun4i_hdmi_audio_routes),
>>>> +};
>>>> +
>>>> +static int sun4i_hdmi_audio_startup(struct snd_pcm_substream *substream,
>>>> +                                   struct snd_soc_dai *dai)
>>>> +{
>>>> +       struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
>>>> +       struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
>>>> +       u32 reg;
>>>> +       int ret;
>>>> +
>>>> +       regmap_write(hdmi->regmap, SUN4I_HDMI_AUDIO_CTRL_REG, 0);
>>>> +       regmap_write(hdmi->regmap,
>>>> +                    SUN4I_HDMI_AUDIO_CTRL_REG,
>>>> +                    SUN4I_HDMI_AUDIO_CTRL_RESET);
>>>> +       ret = regmap_read_poll_timeout(hdmi->regmap,
>>>> +                                      SUN4I_HDMI_AUDIO_CTRL_REG,
>>>> +                                      reg, !reg, 100, 50000);
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("Failed to reset HDMI Audio\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       regmap_write(hdmi->regmap,
>>>> +                    SUN4I_HDMI_AUDIO_CTRL_REG,
>>>> +                    SUN4I_HDMI_AUDIO_CTRL_ENABLE);
>>>> +
>>>> +       return snd_pcm_hw_constraint_eld(substream->runtime,
>>>> +                                       hdmi->connector.eld);
>>>> +}
>>>> +
>>>> +static void sun4i_hdmi_audio_shutdown(struct snd_pcm_substream *substream,
>>>> +                                     struct snd_soc_dai *dai)
>>>> +{
>>>> +       struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
>>>> +       struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
>>>> +
>>>> +       regmap_write(hdmi->regmap, SUN4I_HDMI_AUDIO_CTRL_REG, 0);
>>>> +}
>>>> +
>>>> +static int sun4i_hdmi_setup_audio_infoframes(struct sun4i_hdmi *hdmi)
>>>> +{
>>>> +       union hdmi_infoframe frame;
>>>> +       u8 buffer[14];
>>>> +       int i, ret;
>>>> +
>>>> +       ret = hdmi_audio_infoframe_init(&frame.audio);
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("Failed to init HDMI audio infoframe\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       frame.audio.coding_type = HDMI_AUDIO_CODING_TYPE_STREAM;
>>>> +       frame.audio.sample_frequency = HDMI_AUDIO_SAMPLE_FREQUENCY_STREAM;
>>>> +       frame.audio.sample_size = HDMI_AUDIO_SAMPLE_SIZE_STREAM;
>>>> +       frame.audio.channels = hdmi->audio.channels;
>>>> +
>>>> +       ret = hdmi_infoframe_pack(&frame, buffer, sizeof(buffer));
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("Failed to pack HDMI audio infoframe\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       for (i = 0; i < sizeof(buffer); i++)
>>>> +               writeb(buffer[i],
>>>> +                      hdmi->base + SUN4I_HDMI_AUDIO_INFOFRAME_REG(i));
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static void sun4i_hdmi_audio_set_cts_n(struct sun4i_hdmi *hdmi,
>>>> +                                      struct snd_pcm_hw_params *params)
>>>> +{
>>>> +       struct drm_encoder *encoder = &hdmi->encoder;
>>>> +       struct drm_crtc *crtc = encoder->crtc;
>>>> +       const struct drm_display_mode *mode = &crtc->state->adjusted_mode;
>>>> +       u32 rate = params_rate(params);
>>>> +       u32 n, cts;
>>>> +       u64 tmp;
>>>> +
>>>> +       /**
>>>> +        * Calculate Cycle Time Stamp (CTS) and Numerator (N):
>>>> +        *
>>>> +        * N = 128 * Samplerate / 1000
>>>> +        * CTS = (Ftdms * N) / (128 * Samplerate)
>>>> +        */
>>>> +
>>>> +       n = 128 * rate / 1000;
>>>> +       tmp = (u64)(mode->clock * 1000) * n;
>>>> +       do_div(tmp, 128 * rate);
>>>> +       cts = tmp;
>>>> +
>>>> +       regmap_write(hdmi->regmap,
>>>> +                    SUN4I_HDMI_AUDIO_CTS_REG,
>>>> +                    SUN4I_HDMI_AUDIO_CTS(cts));
>>>> +
>>>> +       regmap_write(hdmi->regmap,
>>>> +                    SUN4I_HDMI_AUDIO_N_REG,
>>>> +                    SUN4I_HDMI_AUDIO_N(n));
>>>> +}
>>>> +
>>>> +static int sun4i_hdmi_audio_set_hw_rate(struct sun4i_hdmi *hdmi,
>>>> +                                       struct snd_pcm_hw_params *params)
>>>> +{
>>>> +       u32 rate = params_rate(params);
>>>> +       u32 val;
>>>> +
>>>> +       switch (rate) {
>>>> +       case 44100:
>>>> +               val = 0x0;
>>>> +               break;
>>>> +       case 48000:
>>>> +               val = 0x2;
>>>> +               break;
>>>> +       case 32000:
>>>> +               val = 0x3;
>>>> +               break;
>>>> +       case 88200:
>>>> +               val = 0x8;
>>>> +               break;
>>>> +       case 96000:
>>>> +               val = 0x9;
>>>> +               break;
>>>> +       case 176400:
>>>> +               val = 0xc;
>>>> +               break;
>>>> +       case 192000:
>>>> +               val = 0xe;
>>>> +               break;
>>>> +       default:
>>>> +               return -EINVAL;
>>>> +       }
>>>> +
>>>> +       regmap_update_bits(hdmi->regmap,
>>>> +                          SUN4I_HDMI_AUDIO_STAT0_REG,
>>>> +                          SUN4I_HDMI_AUDIO_STAT0_FREQ_MASK,
>>>> +                          SUN4I_HDMI_AUDIO_STAT0_FREQ(val));
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int sun4i_hdmi_audio_set_hw_channels(struct sun4i_hdmi *hdmi,
>>>> +                                           struct snd_pcm_hw_params *params)
>>>> +{
>>>> +       u32 channels = params_channels(params);
>>>> +
>>>> +       if (channels > 8)
>>>> +               return -EINVAL;
>>>> +
>>>> +       hdmi->audio.channels = channels;
>>>> +
>>>> +       regmap_update_bits(hdmi->regmap,
>>>> +                          SUN4I_HDMI_AUDIO_FMT_REG,
>>>> +                          SUN4I_HDMI_AUDIO_FMT_LAYOUT,
>>>> +                          (channels > 2) ? SUN4I_HDMI_AUDIO_FMT_LAYOUT : 0);
>>>> +
>>>> +       regmap_update_bits(hdmi->regmap,
>>>> +                          SUN4I_HDMI_AUDIO_FMT_REG,
>>>> +                          SUN4I_HDMI_AUDIO_FMT_CH_CFG_MASK,
>>>> +                          SUN4I_HDMI_AUDIO_FMT_CH_CFG(channels));
>>>> +
>>>> +       regmap_write(hdmi->regmap, SUN4I_HDMI_AUDIO_PCM_REG, 0x76543210);
>>>> +
>>>> +       /**
>>>> +        * If only one channel is required, send the same sample
>>>> +        * to the sink device as a left and right channel.
>>>> +        */
>>>> +       if (channels == 1)
>>>> +               regmap_update_bits(hdmi->regmap,
>>>> +                                  SUN4I_HDMI_AUDIO_PCM_REG,
>>>> +                                  SUN4I_HDMI_AUDIO_PCM_CH_MAP_MASK(1),
>>>> +                                  SUN4I_HDMI_AUDIO_PCM_CH_MAP(1, 1));
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int sun4i_hdmi_audio_hw_params(struct snd_pcm_substream *substream,
>>>> +                                     struct snd_pcm_hw_params *params,
>>>> +                                     struct snd_soc_dai *dai)
>>>> +{
>>>> +       struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
>>>> +       struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
>>>> +       int ret;
>>>> +
>>>> +       ret = sun4i_hdmi_audio_set_hw_rate(hdmi, params);
>>>> +       if (ret < 0)
>>>> +               return ret;
>>>> +
>>>> +       ret = sun4i_hdmi_audio_set_hw_channels(hdmi, params);
>>>> +       if (ret < 0)
>>>> +               return ret;
>>>> +
>>>> +       sun4i_hdmi_audio_set_cts_n(hdmi, params);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static int sun4i_hdmi_audio_trigger(struct snd_pcm_substream *substream,
>>>> +                                   int cmd,
>>>> +                                   struct snd_soc_dai *dai)
>>>> +{
>>>> +       struct snd_soc_card *card = snd_soc_dai_get_drvdata(dai);
>>>> +       struct sun4i_hdmi *hdmi = snd_soc_card_get_drvdata(card);
>>>> +       int ret = 0;
>>>> +
>>>> +       switch (cmd) {
>>>> +       case SNDRV_PCM_TRIGGER_START:
>>>> +               ret = sun4i_hdmi_setup_audio_infoframes(hdmi);
>>>> +               break;
>>>> +       default:
>>>> +               break;
>>>> +       }
>>>> +
>>>> +       return ret;
>>>> +}
>>>> +
>>>> +static const struct snd_soc_dai_ops sun4i_hdmi_audio_dai_ops = {
>>>> +       .startup = sun4i_hdmi_audio_startup,
>>>> +       .shutdown = sun4i_hdmi_audio_shutdown,
>>>> +       .hw_params = sun4i_hdmi_audio_hw_params,
>>>> +       .trigger = sun4i_hdmi_audio_trigger,
>>>> +};
>>>> +
>>>> +static int sun4i_hdmi_audio_dai_probe(struct snd_soc_dai *dai)
>>>> +{
>>>> +       struct snd_dmaengine_dai_dma_data *dma_data;
>>>> +
>>>> +       dma_data = devm_kzalloc(dai->dev, sizeof(*dma_data), GFP_KERNEL);
>>>> +       if (!dma_data)
>>>> +               return -ENOMEM;
>>>> +
>>>> +       dma_data->addr_width = DMA_SLAVE_BUSWIDTH_4_BYTES;
>>>> +       dma_data->maxburst = 8;
>>>> +
>>>> +       snd_soc_dai_init_dma_data(dai, dma_data, NULL);
>>>> +
>>>> +       return 0;
>>>> +}
>>>> +
>>>> +static struct snd_soc_dai_driver sun4i_hdmi_audio_dai = {
>>>> +       .name = "HDMI",
>>>> +       .ops = &sun4i_hdmi_audio_dai_ops,
>>>> +       .probe = sun4i_hdmi_audio_dai_probe,
>>>> +       .playback = {
>>>> +               .stream_name    = "Playback",
>>>> +               .channels_min   = 1,
>>>> +               .channels_max   = 8,
>>>> +               .formats        = SNDRV_PCM_FMTBIT_S16_LE,
>>>> +               .rates          = SNDRV_PCM_RATE_8000_192000,
>>>> +       },
>>>> +};
>>>> +
>>>> +static const struct snd_pcm_hardware sun4i_hdmi_audio_pcm_hardware = {
>>>> +       .info                   = SNDRV_PCM_INFO_INTERLEAVED |
>>>> +                                 SNDRV_PCM_INFO_BLOCK_TRANSFER |
>>>> +                                 SNDRV_PCM_INFO_MMAP |
>>>> +                                 SNDRV_PCM_INFO_MMAP_VALID |
>>>> +                                 SNDRV_PCM_INFO_PAUSE |
>>>> +                                 SNDRV_PCM_INFO_RESUME,
>>>> +       .formats                = SNDRV_PCM_FMTBIT_S16_LE,
>>>> +       .rates                  = SNDRV_PCM_RATE_8000_192000,
>>>> +       .rate_min               = 8000,
>>>> +       .rate_max               = 192000,
>>>> +       .channels_min           = 1,
>>>> +       .channels_max           = 8,
>>>> +       .buffer_bytes_max       = 128 * 1024,
>>>> +       .period_bytes_min       = 4 * 1024,
>>>> +       .period_bytes_max       = 32 * 1024,
>>>> +       .periods_min            = 2,
>>>> +       .periods_max            = 8,
>>>> +       .fifo_size              = 128,
>>>> +};
>>>> +
>>>> +static const struct snd_dmaengine_pcm_config sun4i_hdmi_audio_pcm_config = {
>>>> +       .chan_names[SNDRV_PCM_STREAM_PLAYBACK] = "audio-tx",
>>>> +       .pcm_hardware = &sun4i_hdmi_audio_pcm_hardware,
>>>> +       .prealloc_buffer_size = 128 * 1024,
>>>> +       .prepare_slave_config = snd_dmaengine_pcm_prepare_slave_config,
>>>> +};
>>>> +
>>>> +struct snd_soc_card sun4i_hdmi_audio_card = {
>>>> +       .name = "sun4i-hdmi",
>>>> +};
>>>> +
>>>> +int sun4i_hdmi_audio_create(struct sun4i_hdmi *hdmi)
>>>> +{
>>>> +       struct snd_soc_card *card = &sun4i_hdmi_audio_card;
>>>> +       struct snd_soc_dai_link_component *comp;
>>>> +       struct snd_soc_dai_link *link;
>>>> +       int ret;
>>>> +
>>>> +       ret = snd_dmaengine_pcm_register(hdmi->dev,
>>>> +                                        &sun4i_hdmi_audio_pcm_config, 0);
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("Could not register PCM\n");
>>>> +               return ret;
>>>> +       }
>>>> +
>>>> +       ret = snd_soc_register_component(hdmi->dev,
>>>> +                                        &sun4i_hdmi_audio_component,
>>>> +                                        &sun4i_hdmi_audio_dai, 1);
>>>> +       if (ret < 0) {
>>>> +               DRM_ERROR("Could not register DAI\n");
>>>> +               goto unregister_pcm;
>>>> +       }
>>>> +
>>>> +       link = devm_kzalloc(hdmi->dev, sizeof(*link), GFP_KERNEL);
>>>> +       if (!link) {
>>>> +               ret = -ENOMEM;
>>>> +               goto unregister_component;
>>>> +       }
>>>> +
>>>> +       comp = devm_kzalloc(hdmi->dev, sizeof(*comp) * 3, GFP_KERNEL);
>>>> +       if (!comp) {
>>>> +               ret = -ENOMEM;
>>>> +               goto unregister_component;
>>>> +       }
>>>> +
>>>> +       link->cpus = &comp[0];
>>>> +       link->codecs = &comp[1];
>>>> +       link->platforms = &comp[2];
>>>> +
>>>> +       link->num_cpus = 1;
>>>> +       link->num_codecs = 1;
>>>> +       link->num_platforms = 1;
>>>> +
>>>> +       link->playback_only = 1;
>>>> +
>>>> +       link->name = "SUN4I-HDMI";
>>>> +       link->stream_name = "SUN4I-HDMI PCM";
>>>> +
>>>> +       link->codecs->name = dev_name(hdmi->dev);
>>>> +       link->codecs->dai_name  = sun4i_hdmi_audio_dai.name;
>>>> +
>>>> +       link->cpus->dai_name = dev_name(hdmi->dev);
>>>> +
>>>> +       link->platforms->name = dev_name(hdmi->dev);
>>>> +
>>>> +       link->dai_fmt = SND_SOC_DAIFMT_I2S;
>>>> +
>>>> +       card->dai_link = link;
>>>> +       card->num_links = 1;
>>>> +       card->dev = hdmi->dev;
>>>> +
>>>> +       hdmi->audio.card = card;
>>>> +
>>>> +       /**
>>>> +        * snd_soc_register_card() will overwrite the driver_data pointer.
>>>> +        * So before registering the card, store the original pointer in
>>>> +        * card->drvdata.
>>>> +        */
>>>> +       snd_soc_card_set_drvdata(card, hdmi);
>>>> +       ret = snd_soc_register_card(card);
>>>> +       if (ret)
>>>> +               goto unregister_component;
>>> So using ASoC with all the components IMHO is just adding dead weight. The
>>> audio interface for this particular hardware is just a FIFO that needs to
>>> be written to by an external DMA engine, and a bunch of controls to setup
>>> the parameters of the HDMI audio stream. There's no power sequencing to do,
>>> and no actual individual components to control. There's no reason you couldn't
>>> use just the ALSA DMAENGINE helpers to create a simple ALSA sound card.
>>>
>>> (Maybe we could clean it up after it's merged? Would there be any issues
>>>    with backward compatibility?)
>>>
>>> I think the only example of this besides ASoC is the PXA2xx sound library
>>> and AC97 driver:
>>>
>>>     - sound/arm/pxa2xx-pcm-lib.c
>>>     - sound/arm/pxa2xx-ac97.c
>> I'd like to hear Maxime opinion on this. I get it why it's overkill to use
>> ASoC.
>> However it will take only couple of lines to make the changes for v4. On the
>> other
>> side with dropping the ASoC, the driver must be almost rewritten. It's not
>> such a big deal,
>> but I want to know that this is the right thing to do.
> I don't really have an opinion on this, either way is fine for me, so
> if it's simpler to go for ALSA, then let's do it :)

Then ALSA will be. Thanks :)

Stefan

>
> Maxime
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
