Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6276D915F
	for <lists+dri-devel@lfdr.de>; Thu,  6 Apr 2023 10:21:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67E7A10E0A4;
	Thu,  6 Apr 2023 08:21:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com
 [IPv6:2607:f8b0:4864:20::e30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D81310E0EE
 for <dri-devel@lists.freedesktop.org>; Thu,  6 Apr 2023 08:21:01 +0000 (UTC)
Received: by mail-vs1-xe30.google.com with SMTP id cz11so33741467vsb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 06 Apr 2023 01:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1680769260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nAfsXtBn0nzDoaEWurrUoZWu1BXoDWafMp8Ribw2xoM=;
 b=RWBBfn97A35m/Jk0+ZQHiYyz1tSkPCA8NXd7OvfztgUpqnxS4IwrXVkPgsvbhI3K8J
 C2Y1gq8zbIz8ovfukafOgPsUgiw3fdIeDRR2tV18tFbtNt6tWwiKMxM0vzPzoPg84LTN
 MlOAEz0P0HNHAPDpegqFGjb1/3jTgRac52EvA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680769260;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nAfsXtBn0nzDoaEWurrUoZWu1BXoDWafMp8Ribw2xoM=;
 b=ylo+6445Yoc4TazcvSWajn+HoybgWofYhme+KjHYAqXp62jp2FG9yvNKUBzvsq6Wn8
 qHOQZqbN6nrK3oltakNtHsgro1MeP3J3C6zzL9h+J68+vl9jWj3rGXDNIv659mvpM8i1
 3lR5px+7lEesiznmfd3x1tFGmDsu9B5zhreuh7JCEHhWsQhlgmS/DSyVF7ejR2u9xj0K
 Bh2sX3s5LPM86I+PYul0B6HwJ+5+otlNukbnr6OgXG8FEOjJHGpHZVcKtNVwlOowuv+f
 +5JYPACq9F9T9fpP774coWnmkPnp7dtwjY2wo+lFz3Qmg4XXzF3SLDycLB8kz/s3jZLe
 DZlg==
X-Gm-Message-State: AAQBX9c2Jh3g8AXJgScJ3mESdsjwXLG3HKl6oPg7VWhlXLhi0x4RNQTr
 l6PNlXH48DeyYui/D0A50zhqVNUrwwvWKJDhuurkxA==
X-Google-Smtp-Source: AKy350az8HRB7kj3jahdnvQ8woBX6GVD/2pwkH0213hhBPvI/j4AeaNthtmiBUpiixn8/Rtdqp8Pfx5DUNJg/F/8jvI=
X-Received: by 2002:a67:c81e:0:b0:414:4ef3:839 with SMTP id
 u30-20020a67c81e000000b004144ef30839mr6485313vsk.7.1680769259766; Thu, 06 Apr
 2023 01:20:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230404104800.301150-1-angelogioacchino.delregno@collabora.com>
 <20230404104800.301150-3-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230404104800.301150-3-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Apr 2023 16:20:48 +0800
Message-ID: <CAGXv+5FrUPUg_SsRz6LrW_K_C7By2tSCQ9W_MNJr8XCOcn7gLA@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] drm/mediatek: dp: Move AUX and panel poweron/off
 sequence to function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: chunkuang.hu@kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 matthias.bgg@gmail.com, kernel@collabora.com,
 linux-arm-kernel@lists.infradead.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Apr 4, 2023 at 6:48=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Everytime we run bridge detection and/or EDID read we run a poweron
> and poweroff sequence for both the AUX and the panel; moreover, this
> is also done when enabling the bridge in the .atomic_enable() callback.
>
> Move this power on/off sequence to a new mtk_dp_aux_panel_poweron()
> function as to commonize it.
> Note that, before this commit, in mtk_dp_bridge_atomic_enable() only
> the AUX was getting powered on but the panel was left powered off if
> the DP cable wasn't plugged in while now we unconditionally send a D0
> request and this is done for two reasons:
>  - First, whether this request fails or not, it takes the same time
>    and anyway the DP hardware won't produce any error (or, if it
>    does, it's ignorable because it won't block further commands)
>  - Second, training the link between a sleeping/standby/unpowered
>    display makes little sense.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> ---
>  drivers/gpu/drm/mediatek/mtk_dp.c | 76 ++++++++++++-------------------
>  1 file changed, 30 insertions(+), 46 deletions(-)
>
> diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek=
/mtk_dp.c
> index 84f82cc68672..76ea94167531 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dp.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dp.c
> @@ -1253,6 +1253,29 @@ static void mtk_dp_audio_mute(struct mtk_dp *mtk_d=
p, bool mute)
>                            val[2], AU_TS_CFG_DP_ENC0_P0_MASK);
>  }
>
> +static void mtk_dp_aux_panel_poweron(struct mtk_dp *mtk_dp, bool pwron)
> +{
> +       if (pwron) {
> +               /* power on aux */
> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
> +                                  DP_PWR_STATE_MASK);
> +
> +               /* power on panel */
> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D0);
> +               usleep_range(2000, 5000);
> +       } else {
> +               /* power off panel */
> +               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D3);
> +               usleep_range(2000, 3000);
> +
> +               /* power off aux */
> +               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> +                                  DP_PWR_STATE_BANDGAP_TPLL,
> +                                  DP_PWR_STATE_MASK);
> +       }
> +}
> +
>  static void mtk_dp_power_enable(struct mtk_dp *mtk_dp)
>  {
>         mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_RESET_AND_PROBE,
> @@ -1937,16 +1960,9 @@ static enum drm_connector_status mtk_dp_bdg_detect=
(struct drm_bridge *bridge)
>         if (!mtk_dp->train_info.cable_plugged_in)
>                 return ret;
>
> -       if (!enabled) {
> -               /* power on aux */
> -               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -                                  DP_PWR_STATE_MASK);
> +       if (!enabled)
> +               mtk_dp_aux_panel_poweron(mtk_dp, true);
>
> -               /* power on panel */
> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D0);

I suspect the original code was somewhat wrong already? We shouldn't need
to pull the panel out of standby just for HPD or reading EDID.

This driver probably needs a lot more cleanup. :/

ChenYu

> -               usleep_range(2000, 5000);
> -       }
>         /*
>          * Some dongles still source HPD when they do not connect to any
>          * sink device. To avoid this, we need to read the sink count
> @@ -1958,16 +1974,8 @@ static enum drm_connector_status mtk_dp_bdg_detect=
(struct drm_bridge *bridge)
>         if (DP_GET_SINK_COUNT(sink_count))
>                 ret =3D connector_status_connected;
>
> -       if (!enabled) {
> -               /* power off panel */
> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D3);
> -               usleep_range(2000, 3000);
> -
> -               /* power off aux */
> -               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                  DP_PWR_STATE_BANDGAP_TPLL,
> -                                  DP_PWR_STATE_MASK);
> -       }
> +       if (!enabled)
> +               mtk_dp_aux_panel_poweron(mtk_dp, false);
>
>         return ret;
>  }
> @@ -1983,15 +1991,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bri=
dge *bridge,
>
>         if (!enabled) {
>                 drm_atomic_bridge_chain_pre_enable(bridge, connector->sta=
te->state);
> -
> -               /* power on aux */
> -               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                  DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -                                  DP_PWR_STATE_MASK);
> -
> -               /* power on panel */
> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D0);
> -               usleep_range(2000, 5000);
> +               mtk_dp_aux_panel_poweron(mtk_dp, true);
>         }
>
>         /* eDP panels aren't removable, so we can return a cached EDID. *=
/
> @@ -2015,15 +2015,7 @@ static struct edid *mtk_dp_get_edid(struct drm_bri=
dge *bridge,
>         }
>
>         if (!enabled) {
> -               /* power off panel */
> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D3);
> -               usleep_range(2000, 3000);
> -
> -               /* power off aux */
> -               mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                                  DP_PWR_STATE_BANDGAP_TPLL,
> -                                  DP_PWR_STATE_MASK);
> -
> +               mtk_dp_aux_panel_poweron(mtk_dp, false);
>                 drm_atomic_bridge_chain_post_disable(bridge, connector->s=
tate->state);
>         }
>
> @@ -2188,15 +2180,7 @@ static void mtk_dp_bridge_atomic_enable(struct drm=
_bridge *bridge,
>                 return;
>         }
>
> -       /* power on aux */
> -       mtk_dp_update_bits(mtk_dp, MTK_DP_TOP_PWR_STATE,
> -                          DP_PWR_STATE_BANDGAP_TPLL_LANE,
> -                          DP_PWR_STATE_MASK);
> -
> -       if (mtk_dp->train_info.cable_plugged_in) {
> -               drm_dp_dpcd_writeb(&mtk_dp->aux, DP_SET_POWER, DP_SET_POW=
ER_D0);
> -               usleep_range(2000, 5000);
> -       }
> +       mtk_dp_aux_panel_poweron(mtk_dp, true);
>
>         /* Training */
>         ret =3D mtk_dp_training(mtk_dp);
> --
> 2.40.0
>
