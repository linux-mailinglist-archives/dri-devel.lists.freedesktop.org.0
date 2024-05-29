Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5228D391F
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:26:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B740310E3DD;
	Wed, 29 May 2024 14:26:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="InGzHoov";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A27110E3DD
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:26:07 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 7EA3D60FC6
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8853C4AF07
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 14:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1716992766;
 bh=rS8lHkl0yDWqapcZK5pUVWvpWXVL4mAki+yp37yJuu8=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=InGzHoovdYBG10zht5uKhrvEsr6kqPSyNn+9IAQDcvsCnG6cvJvMiF/5Es7W/FfyW
 rPinXvv5mawBQ5RQCWxMmqx6Te7jN63uZg3Z7poh5Igf/U3fUhic8qJG3BAI8te8at
 rQiy8BXLSa8gk4EYme+MnmCBXe8xQUa3o/39olwVRhrT3edm263IMuILOCzAhnSmi4
 rGS4velIYjWEHeQ3ZFD1mnrKBzjawunQ4F7oColIYWsJ9FscyuE8C4Jd0VPFh0TEMn
 gKqQmDf/PWqNWvgog58K2SqvNuUHYGK0jjvSDKkUVGQbzqrwVXebapvWBYAlurCwpW
 bNgOJIY2bHIpg==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-62c5fd61d2bso8026657b3.3
 for <dri-devel@lists.freedesktop.org>; Wed, 29 May 2024 07:26:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCVsM4ntukhObwCDSZvTtE1WokKfS3v9iNyiNU8/KpFaE5xLahHIbnIkKMZh2f5Yv4gt3Ha5Ipg6EkPyTvmB1uvBPLmy2Lhg5LX4DDaq++/V
X-Gm-Message-State: AOJu0Yye3E3R3p2RfaHQHJwKLp6hH+GnyyMoWzGzYYRQ1icE3cFcpU0p
 nV4KQpDkMhTtzA++ycjNUjWP0Sl5BkA3mxVcVjKOTz3MyqEfdYVjXltn3sVDVFfZ0hyiT6tOgEU
 UAUhtWgOdQLHymp6r4d76sJZIstq5kcmYfZJ8pw==
X-Google-Smtp-Source: AGHT+IHAwOMmyh9/XBaOY+iVXfegBjzP9smD+dTIpmQP1hKF6dqZExqcqKHcXuI1FgcxJdkSo4bajtY6D9Pcqk3s9AE=
X-Received: by 2002:a81:b625:0:b0:620:50e0:c38 with SMTP id
 00721157ae682-62a08ddeb70mr146870877b3.24.1716992765062; Wed, 29 May 2024
 07:26:05 -0700 (PDT)
MIME-Version: 1.0
References: <20240318203925.2837689-1-l.stach@pengutronix.de>
 <20240318203925.2837689-2-l.stach@pengutronix.de>
In-Reply-To: <20240318203925.2837689-2-l.stach@pengutronix.de>
From: Robert Foss <rfoss@kernel.org>
Date: Wed, 29 May 2024 16:25:54 +0200
X-Gmail-Original-Message-ID: <CAN6tsi46s1ux3yvz6QR22Wd=upjsPAmy47woUkiJRaJw6X6d3Q@mail.gmail.com>
Message-ID: <CAN6tsi46s1ux3yvz6QR22Wd=upjsPAmy47woUkiJRaJw6X6d3Q@mail.gmail.com>
Subject: Re: [PATCH 2/3] drm/bridge: analogix_dp: simplify
 analogix_dp_{set/get}_lane_link_training helpers
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, dri-devel@lists.freedesktop.org, 
 kernel@pengutronix.de, patchwork-lst@pengutronix.de
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Mar 18, 2024 at 9:39=E2=80=AFPM Lucas Stach <l.stach@pengutronix.de=
> wrote:
>
> From: Wyon Bi <bivvy.bi@rock-chips.com>
>
> There is no need for separate functions for each lane, as we can deduct t=
he
> register offset to read/write from the lane index.
>
> Signed-off-by: Wyon Bi <bivvy.bi@rock-chips.com>
> Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> ---
>  .../drm/bridge/analogix/analogix_dp_core.c    |  97 ++-------------
>  .../drm/bridge/analogix/analogix_dp_core.h    |  22 +---
>  .../gpu/drm/bridge/analogix/analogix_dp_reg.c | 114 +++---------------
>  3 files changed, 26 insertions(+), 207 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.c
> index df9370e0ff23..300385db7502 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
> @@ -234,28 +234,6 @@ static int analogix_dp_training_pattern_dis(struct a=
nalogix_dp_device *dp)
>         return ret < 0 ? ret : 0;
>  }
>
> -static void
> -analogix_dp_set_lane_lane_pre_emphasis(struct analogix_dp_device *dp,
> -                                      int pre_emphasis, int lane)
> -{
> -       switch (lane) {
> -       case 0:
> -               analogix_dp_set_lane0_pre_emphasis(dp, pre_emphasis);
> -               break;
> -       case 1:
> -               analogix_dp_set_lane1_pre_emphasis(dp, pre_emphasis);
> -               break;
> -
> -       case 2:
> -               analogix_dp_set_lane2_pre_emphasis(dp, pre_emphasis);
> -               break;
> -
> -       case 3:
> -               analogix_dp_set_lane3_pre_emphasis(dp, pre_emphasis);
> -               break;
> -       }
> -}
> -
>  static int analogix_dp_link_start(struct analogix_dp_device *dp)
>  {
>         u8 buf[4];
> @@ -286,10 +264,12 @@ static int analogix_dp_link_start(struct analogix_d=
p_device *dp)
>                 return retval;
>         }
>
> -       /* Set TX pre-emphasis to minimum */
> +       /* Set TX voltage-swing and pre-emphasis to minimum */
>         for (lane =3D 0; lane < lane_count; lane++)
> -               analogix_dp_set_lane_lane_pre_emphasis(dp,
> -                       PRE_EMPHASIS_LEVEL_0, lane);
> +               dp->link_train.training_lane[lane] =3D
> +                                       DP_TRAIN_VOLTAGE_SWING_LEVEL_0 |
> +                                       DP_TRAIN_PRE_EMPH_LEVEL_0;
> +       analogix_dp_set_lane_link_training(dp);
>
>         /* Wait for PLL lock */
>         pll_tries =3D 0;
> @@ -384,54 +364,6 @@ static unsigned char analogix_dp_get_adjust_request_=
pre_emphasis(
>         return ((link_value >> shift) & 0xc) >> 2;
>  }
>
> -static void analogix_dp_set_lane_link_training(struct analogix_dp_device=
 *dp,
> -                                              u8 training_lane_set, int =
lane)
> -{
> -       switch (lane) {
> -       case 0:
> -               analogix_dp_set_lane0_link_training(dp, training_lane_set=
);
> -               break;
> -       case 1:
> -               analogix_dp_set_lane1_link_training(dp, training_lane_set=
);
> -               break;
> -
> -       case 2:
> -               analogix_dp_set_lane2_link_training(dp, training_lane_set=
);
> -               break;
> -
> -       case 3:
> -               analogix_dp_set_lane3_link_training(dp, training_lane_set=
);
> -               break;
> -       }
> -}
> -
> -static unsigned int
> -analogix_dp_get_lane_link_training(struct analogix_dp_device *dp,
> -                                  int lane)
> -{
> -       u32 reg;
> -
> -       switch (lane) {
> -       case 0:
> -               reg =3D analogix_dp_get_lane0_link_training(dp);
> -               break;
> -       case 1:
> -               reg =3D analogix_dp_get_lane1_link_training(dp);
> -               break;
> -       case 2:
> -               reg =3D analogix_dp_get_lane2_link_training(dp);
> -               break;
> -       case 3:
> -               reg =3D analogix_dp_get_lane3_link_training(dp);
> -               break;
> -       default:
> -               WARN_ON(1);
> -               return 0;
> -       }
> -
> -       return reg;
> -}
> -
>  static void analogix_dp_reduce_link_rate(struct analogix_dp_device *dp)
>  {
>         analogix_dp_training_pattern_dis(dp);
> @@ -523,10 +455,7 @@ static int analogix_dp_process_clock_recovery(struct=
 analogix_dp_device *dp)
>         }
>
>         analogix_dp_get_adjust_training_lane(dp, adjust_request);
> -
> -       for (lane =3D 0; lane < lane_count; lane++)
> -               analogix_dp_set_lane_link_training(dp,
> -                       dp->link_train.training_lane[lane], lane);
> +       analogix_dp_set_lane_link_training(dp);
>
>         retval =3D drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
>                                    dp->link_train.training_lane, lane_cou=
nt);
> @@ -538,7 +467,7 @@ static int analogix_dp_process_clock_recovery(struct =
analogix_dp_device *dp)
>
>  static int analogix_dp_process_equalizer_training(struct analogix_dp_dev=
ice *dp)
>  {
> -       int lane, lane_count, retval;
> +       int lane_count, retval;
>         u32 reg;
>         u8 link_align, link_status[2], adjust_request[2];
>
> @@ -598,9 +527,7 @@ static int analogix_dp_process_equalizer_training(str=
uct analogix_dp_device *dp)
>                 return -EIO;
>         }
>
> -       for (lane =3D 0; lane < lane_count; lane++)
> -               analogix_dp_set_lane_link_training(dp,
> -                       dp->link_train.training_lane[lane], lane);
> +       analogix_dp_set_lane_link_training(dp);
>
>         retval =3D drm_dp_dpcd_write(&dp->aux, DP_TRAINING_LANE0_SET,
>                                    dp->link_train.training_lane, lane_cou=
nt);
> @@ -712,7 +639,7 @@ static int analogix_dp_full_link_train(struct analogi=
x_dp_device *dp,
>
>  static int analogix_dp_fast_link_train(struct analogix_dp_device *dp)
>  {
> -       int i, ret;
> +       int ret;
>         u8 link_align, link_status[2];
>         enum pll_status status;
>
> @@ -720,11 +647,7 @@ static int analogix_dp_fast_link_train(struct analog=
ix_dp_device *dp)
>
>         analogix_dp_set_link_bandwidth(dp, dp->link_train.link_rate);
>         analogix_dp_set_lane_count(dp, dp->link_train.lane_count);
> -
> -       for (i =3D 0; i < dp->link_train.lane_count; i++) {
> -               analogix_dp_set_lane_link_training(dp,
> -                       dp->link_train.training_lane[i], i);
> -       }
> +       analogix_dp_set_lane_link_training(dp);
>
>         ret =3D readx_poll_timeout(analogix_dp_get_pll_lock_status, dp, s=
tatus,
>                                  status !=3D PLL_UNLOCKED, 120,
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h b/drivers=
/gpu/drm/bridge/analogix/analogix_dp_core.h
> index 433f2d7efa0c..382b2f068ab9 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.h
> @@ -213,26 +213,8 @@ void analogix_dp_enable_enhanced_mode(struct analogi=
x_dp_device *dp,
>                                       bool enable);
>  void analogix_dp_set_training_pattern(struct analogix_dp_device *dp,
>                                       enum pattern_set pattern);
> -void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level);
> -void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level);
> -void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level);
> -void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level);
> -void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane);
> -void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane);
> -void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane);
> -void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane);
> -u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp);
> -u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp);
> -u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp);
> -u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp);
> +void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp);
> +u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8=
 lane);
>  void analogix_dp_reset_macro(struct analogix_dp_device *dp);
>  void analogix_dp_init_video(struct analogix_dp_device *dp);
>
> diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c b/drivers/=
gpu/drm/bridge/analogix/analogix_dp_reg.c
> index 7b0bc9704eac..d267cf05cbca 100644
> --- a/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> +++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_reg.c
> @@ -557,6 +557,20 @@ void analogix_dp_get_lane_count(struct analogix_dp_d=
evice *dp, u32 *count)
>         *count =3D reg;
>  }
>
> +void analogix_dp_set_lane_link_training(struct analogix_dp_device *dp)
> +{
> +       u8 lane;
> +
> +       for (lane =3D 0; lane < dp->link_train.lane_count; lane++)
> +               writel(dp->link_train.training_lane[lane],
> +                      dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL +=
 4 * lane);
> +}
> +
> +u32 analogix_dp_get_lane_link_training(struct analogix_dp_device *dp, u8=
 lane)
> +{
> +       return readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL + 4=
 * lane);
> +}
> +
>  void analogix_dp_enable_enhanced_mode(struct analogix_dp_device *dp,
>                                       bool enable)
>  {
> @@ -606,106 +620,6 @@ void analogix_dp_set_training_pattern(struct analog=
ix_dp_device *dp,
>         }
>  }
>
> -void analogix_dp_set_lane0_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level)
> -{
> -       u32 reg;
> -
> -       reg =3D readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
> -       reg &=3D ~PRE_EMPHASIS_SET_MASK;
> -       reg |=3D level << PRE_EMPHASIS_SET_SHIFT;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane1_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level)
> -{
> -       u32 reg;
> -
> -       reg =3D readl(dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
> -       reg &=3D ~PRE_EMPHASIS_SET_MASK;
> -       reg |=3D level << PRE_EMPHASIS_SET_SHIFT;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane2_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level)
> -{
> -       u32 reg;
> -
> -       reg =3D readl(dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
> -       reg &=3D ~PRE_EMPHASIS_SET_MASK;
> -       reg |=3D level << PRE_EMPHASIS_SET_SHIFT;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane3_pre_emphasis(struct analogix_dp_device *dp,
> -                                       u32 level)
> -{
> -       u32 reg;
> -
> -       reg =3D readl(dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
> -       reg &=3D ~PRE_EMPHASIS_SET_MASK;
> -       reg |=3D level << PRE_EMPHASIS_SET_SHIFT;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane0_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane)
> -{
> -       u32 reg;
> -
> -       reg =3D training_lane;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane1_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane)
> -{
> -       u32 reg;
> -
> -       reg =3D training_lane;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane2_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane)
> -{
> -       u32 reg;
> -
> -       reg =3D training_lane;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
> -}
> -
> -void analogix_dp_set_lane3_link_training(struct analogix_dp_device *dp,
> -                                        u32 training_lane)
> -{
> -       u32 reg;
> -
> -       reg =3D training_lane;
> -       writel(reg, dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
> -}
> -
> -u32 analogix_dp_get_lane0_link_training(struct analogix_dp_device *dp)
> -{
> -       return readl(dp->reg_base + ANALOGIX_DP_LN0_LINK_TRAINING_CTL);
> -}
> -
> -u32 analogix_dp_get_lane1_link_training(struct analogix_dp_device *dp)
> -{
> -       return readl(dp->reg_base + ANALOGIX_DP_LN1_LINK_TRAINING_CTL);
> -}
> -
> -u32 analogix_dp_get_lane2_link_training(struct analogix_dp_device *dp)
> -{
> -       return readl(dp->reg_base + ANALOGIX_DP_LN2_LINK_TRAINING_CTL);
> -}
> -
> -u32 analogix_dp_get_lane3_link_training(struct analogix_dp_device *dp)
> -{
> -       return readl(dp->reg_base + ANALOGIX_DP_LN3_LINK_TRAINING_CTL);
> -}
> -
>  void analogix_dp_reset_macro(struct analogix_dp_device *dp)
>  {
>         u32 reg;
> --
> 2.39.2
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
