Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B64F5251C6
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 18:02:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 062C51126E0;
	Thu, 12 May 2022 16:02:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 276EB1126DB
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:02:38 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 l11-20020a17090a49cb00b001d923a9ca99so5310241pjm.1
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XpBKFT+FxEIAZBvGnrKeb1xPfavPAp8Tm0r9tTrTZi8=;
 b=jKRQMtb5MGJ6974fIypCyE1kYgTTzi9fFl4ZveIillmJ0HWZOP1tjAsjIrqKf4SeZC
 2wgAtokXKNfKTzTXZ+/uWgI2iMUZ4VB/lzSIU16/ortHMGia/331CYKztZDa09oGivfT
 CLYnQcu2hoh0aX5J6t4aKB/nwaa08/DYCztdvPLfoPyqR4Lvm0qWhvz17ZMAvulYKz/w
 mEl4CBMMiwHw6IlibboxXSG+72Nxrp7zuQYg6ZP3IzYc1i0WkQWoGd8iT2R7xIPkV8lD
 hEKAAUx1T64GQnXXVN/GwBScEvdlNdGu7/Xr9vZydNOaGVXHtTQROnjxxM0SVMMUERDY
 rhiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XpBKFT+FxEIAZBvGnrKeb1xPfavPAp8Tm0r9tTrTZi8=;
 b=NLcRNPSMAtR6Cul7BbtFRyb1KBgxb3oJFMNdJe+9hrc2xaYL4AqgnnbseYXI2NnbMh
 VHe64fWFYGi18RFUGPX/DxojtQDsZx1lyIhYm2n4g7hiJpA9MwlujizVBOWaLvlajBpY
 btoblPt9dpNPUcQ9oG5h1n3hzvCFKCWcDxAao+Diaw8HLvomPhYMsAOvKYxolng10I/O
 WJWS9rLsYHuwEKXzL5wLLhs298PgBOVXYNMi/317xovUiqKV8PZYGGTRbuKEzzgR4E12
 ky5x62pClwF8+/Sds5y67N2c4+Y5WYmw7Ni2Nijjx6vHj7byJZxaldvMLtVNK+6s+epg
 Qwdw==
X-Gm-Message-State: AOAM530Zpp69mR5I9rwQz0nB6EaSGwi12pe2fOzv5BcPb/tF7JWT5E9c
 DTFnYMsCE1jmm2g3tDG7bDFfRS8fzGnAfubpObX1AO7qiY0=
X-Google-Smtp-Source: ABdhPJzI4Mxio+8VfZRvkdnJjO2LsmWHt9s5ow1CXnKGVmAuRp5fHv7SvJNfr5x+YAYpHzEuzlnbAPBX2fY95yPYl6s=
X-Received: by 2002:a17:903:228f:b0:15e:be12:a181 with SMTP id
 b15-20020a170903228f00b0015ebe12a181mr254115plh.21.1652371357674; Thu, 12 May
 2022 09:02:37 -0700 (PDT)
MIME-Version: 1.0
References: <20220429205644.245480-1-marex@denx.de>
In-Reply-To: <20220429205644.245480-1-marex@denx.de>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 12 May 2022 18:02:26 +0200
Message-ID: <CAG3jFyvC_vbXz=43Sdc9THdOMx0BuC9e-siEwKhs1TsjkNxvvg@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/bridge: tc358767: Factor out DSI and DPI RX
 enablement
To: Marek Vasut <marex@denx.de>
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
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <narmstrong@baylibre.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel@lists.freedesktop.org, Maxime Ripard <maxime@cerno.tech>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 29 Apr 2022 at 22:56, Marek Vasut <marex@denx.de> wrote:
>
> Factor out register programming to configure the chip video RX side for
> reception of video data from DSI or DPI. This is particularly useful in
> the (e)DP output mode, where the video data can be received from either
> DPI or DSI. While only the former is supported in (e)DP output mode so
> far, this patch is added in preparation for addition of the later.
>
> There is a change in the order or register programming in case of the
> DSI-to-DPI mode. The DSI RX side is now programmed and enabled all in
> one place after the output mode has been configured. Before this change,
> the DSI RX has been programmed before the output mode has been set and
> only enabled afterward. The order makes no difference however, since the
> DSI RX is only enabled at the end either way.
>
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Marek Vasut <marex@denx.de>
> Cc: Maxime Ripard <maxime@cerno.tech>
> Cc: Neil Armstrong <narmstrong@baylibre.com>
> Cc: Robert Foss <robert.foss@linaro.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/bridge/tc358767.c | 94 +++++++++++++++++--------------
>  1 file changed, 53 insertions(+), 41 deletions(-)
>
> diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> index 485717c8f0b4..e72dd5cd9700 100644
> --- a/drivers/gpu/drm/bridge/tc358767.c
> +++ b/drivers/gpu/drm/bridge/tc358767.c
> @@ -1247,11 +1247,60 @@ static int tc_main_link_disable(struct tc_data *tc)
>         return regmap_write(tc->regmap, DP0CTL, 0);
>  }
>
> -static int tc_dpi_stream_enable(struct tc_data *tc)
> +static int tc_dsi_rx_enable(struct tc_data *tc)
>  {
> +       u32 value;
>         int ret;
> +
> +       regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
> +       regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
> +       regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
> +       regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
> +       regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
> +       regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
> +       regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> +       regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
> +
> +       value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> +               LANEENABLE_CLEN;
> +       regmap_write(tc->regmap, PPI_LANEENABLE, value);
> +       regmap_write(tc->regmap, DSI_LANEENABLE, value);
> +
> +       /* Set input interface */
> +       value = DP0_AUDSRC_NO_INPUT;
> +       if (tc_test_pattern)
> +               value |= DP0_VIDSRC_COLOR_BAR;
> +       else
> +               value |= DP0_VIDSRC_DSI_RX;
> +       ret = regmap_write(tc->regmap, SYSCTRL, value);
> +       if (ret)
> +               return ret;
> +
> +       usleep_range(120, 150);
> +
> +       regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
> +       regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
> +
> +       return 0;
> +}
> +
> +static int tc_dpi_rx_enable(struct tc_data *tc)
> +{
>         u32 value;
>
> +       /* Set input interface */
> +       value = DP0_AUDSRC_NO_INPUT;
> +       if (tc_test_pattern)
> +               value |= DP0_VIDSRC_COLOR_BAR;
> +       else
> +               value |= DP0_VIDSRC_DPI_RX;
> +       return regmap_write(tc->regmap, SYSCTRL, value);
> +}
> +
> +static int tc_dpi_stream_enable(struct tc_data *tc)
> +{
> +       int ret;
> +
>         dev_dbg(tc->dev, "enable video stream\n");
>
>         /* Setup PLL */
> @@ -1277,20 +1326,6 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
>         if (ret)
>                 return ret;
>
> -       regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
> -       regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
> -       regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
> -       regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
> -       regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
> -       regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
> -       regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> -       regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
> -
> -       value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> -               LANEENABLE_CLEN;
> -       regmap_write(tc->regmap, PPI_LANEENABLE, value);
> -       regmap_write(tc->regmap, DSI_LANEENABLE, value);
> -
>         ret = tc_set_common_video_mode(tc, &tc->mode);
>         if (ret)
>                 return ret;
> @@ -1299,22 +1334,7 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
>         if (ret)
>                 return ret;
>
> -       /* Set input interface */
> -       value = DP0_AUDSRC_NO_INPUT;
> -       if (tc_test_pattern)
> -               value |= DP0_VIDSRC_COLOR_BAR;
> -       else
> -               value |= DP0_VIDSRC_DSI_RX;
> -       ret = regmap_write(tc->regmap, SYSCTRL, value);
> -       if (ret)
> -               return ret;
> -
> -       usleep_range(120, 150);
> -
> -       regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
> -       regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
> -
> -       return 0;
> +       return tc_dsi_rx_enable(tc);
>  }
>
>  static int tc_dpi_stream_disable(struct tc_data *tc)
> @@ -1370,19 +1390,11 @@ static int tc_edp_stream_enable(struct tc_data *tc)
>         usleep_range(500, 1000);
>         value |= VID_EN;
>         ret = regmap_write(tc->regmap, DP0CTL, value);
> -       if (ret)
> -               return ret;
> -       /* Set input interface */
> -       value = DP0_AUDSRC_NO_INPUT;
> -       if (tc_test_pattern)
> -               value |= DP0_VIDSRC_COLOR_BAR;
> -       else
> -               value |= DP0_VIDSRC_DPI_RX;
> -       ret = regmap_write(tc->regmap, SYSCTRL, value);
>         if (ret)
>                 return ret;
>
> -       return 0;
> +       /* Set input interface */
> +       return tc_dpi_rx_enable(tc);
>  }
>
>  static int tc_edp_stream_disable(struct tc_data *tc)
> --
> 2.35.1
>

Reviewed-by: Robert Foss <robert.foss@linaro.org>
