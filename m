Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0A7490488
	for <lists+dri-devel@lfdr.de>; Mon, 17 Jan 2022 10:02:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A117110E472;
	Mon, 17 Jan 2022 09:02:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECCE410E472
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 09:02:04 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id o15so54896961lfo.11
 for <dri-devel@lists.freedesktop.org>; Mon, 17 Jan 2022 01:02:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5eWNHkxEDcvDnOVa58vimxj0RFzSnZVX78Y15KWp4XE=;
 b=F04iKpf55HWHZUfNd0MND3kcC57yHpdTxP2HADRAYHB8O1xd4GhvxL5ge//KS4A7TS
 gpejjKDT3cDnZAclFrysE8oNstHYfFzAc9Xxt1Z6B96UtuI7T3RYhU56mMNBQZGcPJ1S
 9NeSRFgzrZiCJ3BaQjQFBzJfWoY4POEB95y48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5eWNHkxEDcvDnOVa58vimxj0RFzSnZVX78Y15KWp4XE=;
 b=58Lb3ty6JAwsl4+Gm9mU1+CbEenRQaWVsLZ5oY5/h8H10TN/kxDItQIQHsKGNvsEm8
 QVkgcV59NmdonqfM9sFOoKZVnmc9Q2xMtWCMY1z5iK4MthwwZwWHaW0Mh8CuXri6O41v
 iD1kBO+nOuelAHnAoyXFpmT4MKqdn4ljTMVUqUREdwX22bcpxjM2LNYZ5evr3qjyJxI4
 vJBFTJyEnT5R2Fwj/60HR72YEb6/ZehqLFnqR+YKCmbaNWX2acz4PW+bbb1afMuNrqMb
 +FE1TrYmolJ6Pyp/5zgjgghPm6NeJ2Ha9GW8wQav1XSu4wgpxJof/JZS1afPKSdUuJDq
 SFwA==
X-Gm-Message-State: AOAM5304kqINYevQzsKl5eLbSN/qSpNsE/N+EG1JkDiiDei4uwNR+6hb
 ddoDpKMxpZfcL6BZzzx6ZDJE/MbDfbDoanU1PvBPcQ==
X-Google-Smtp-Source: ABdhPJwK4naYaBZ+8GM/Ab9/Ixhagfb6WfeIhngfxmIkwTvUXsUhPQGr5I/x32U0ZdswDbRkgjWjQoAnUK/H9/TpoSc=
X-Received: by 2002:a2e:b602:: with SMTP id r2mr3683300ljn.392.1642410123234; 
 Mon, 17 Jan 2022 01:02:03 -0800 (PST)
MIME-Version: 1.0
References: <20220114230209.4091727-1-briannorris@chromium.org>
 <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
In-Reply-To: <20220114150129.v2.3.I3c79b1466c14b02980071221e5b99283cd26ec77@changeid>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Mon, 17 Jan 2022 17:01:52 +0800
Message-ID: <CAGXv+5HC00YU6ARtGDahxWLqivvUCowh7wDq5H5OzoGO9htB+g@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] ASoC: rk3399_gru_sound: Wire up DP jack detection
To: Brian Norris <briannorris@chromium.org>
Content-Type: text/plain; charset="UTF-8"
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
Cc: devicetree@vger.kernel.org, alsa-devel@alsa-project.org,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Liam Girdwood <lgirdwood@gmail.com>, dri-devel@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>, linux-rockchip@lists.infradead.org,
 Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Lin Huang <hl@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, Jan 15, 2022 at 7:03 AM Brian Norris <briannorris@chromium.org> wrote:
>
> Now that the cdn-dp driver supports plug-change callbacks, let's wire it
> up.
>
> Signed-off-by: Brian Norris <briannorris@chromium.org>
> ---
>
> (no changes since v1)
>
>  sound/soc/rockchip/rk3399_gru_sound.c | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/sound/soc/rockchip/rk3399_gru_sound.c b/sound/soc/rockchip/rk3399_gru_sound.c
> index e2d52d8d0ff9..eeef3ed70037 100644
> --- a/sound/soc/rockchip/rk3399_gru_sound.c
> +++ b/sound/soc/rockchip/rk3399_gru_sound.c
> @@ -164,6 +164,25 @@ static int rockchip_sound_da7219_hw_params(struct snd_pcm_substream *substream,
>         return 0;
>  }
>
> +static struct snd_soc_jack cdn_dp_card_jack;
> +
> +static int rockchip_sound_cdndp_init(struct snd_soc_pcm_runtime *rtd)
> +{
> +       struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;

Using snd_soc_card_get_codec_dai() might be a better choice throughout this
driver. While it will work for the cdn_dp case, because it is the first DAI
in |rockchip_dais[]|, all the invocations for the other codecs are likely
returning the wrong DAI.

For this particular patch it works either way, so

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>


> +       struct snd_soc_card *card = rtd->card;
> +       int ret;
> +
> +       /* Enable jack detection. */
> +       ret = snd_soc_card_jack_new(card, "DP Jack", SND_JACK_LINEOUT,
> +                                   &cdn_dp_card_jack, NULL, 0);
> +       if (ret) {
> +               dev_err(card->dev, "Can't create DP Jack %d\n", ret);
> +               return ret;
> +       }
> +
> +       return snd_soc_component_set_jack(component, &cdn_dp_card_jack, NULL);
> +}
> +
>  static int rockchip_sound_da7219_init(struct snd_soc_pcm_runtime *rtd)
>  {
>         struct snd_soc_component *component = asoc_rtd_to_codec(rtd, 0)->component;
> @@ -315,6 +334,7 @@ static const struct snd_soc_dai_link rockchip_dais[] = {
>         [DAILINK_CDNDP] = {
>                 .name = "DP",
>                 .stream_name = "DP PCM",
> +               .init = rockchip_sound_cdndp_init,
>                 .dai_fmt = SND_SOC_DAIFMT_I2S | SND_SOC_DAIFMT_NB_NF |
>                         SND_SOC_DAIFMT_CBS_CFS,
>                 SND_SOC_DAILINK_REG(cdndp),
> --
> 2.34.1.703.g22d0c6ccf7-goog
>
>
> _______________________________________________
> Linux-rockchip mailing list
> Linux-rockchip@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-rockchip
