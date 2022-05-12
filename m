Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3BA652521A
	for <lists+dri-devel@lfdr.de>; Thu, 12 May 2022 18:09:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8757911278D;
	Thu, 12 May 2022 16:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [IPv6:2607:f8b0:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 412EB11278D
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 16:09:32 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id q76so5003986pgq.10
 for <dri-devel@lists.freedesktop.org>; Thu, 12 May 2022 09:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lFLCmK9y63u2FBlC+pHgkiyzlrt6fLB34hDDsjRLIWo=;
 b=fbwlPovvcoMeyPCp2YTJLpuyktl2+v3G0jX8leQUEvQ8+TqNyldUjIqD/82O5lUgu/
 AiJQkd7m1j1Rd0T5BXWc8z4ut3VOLtDiOZtY0BpuvzUfXE0jCDcdhXPpNdzd1d3Q6e6o
 KJ9P8K4iDXqnVQkxvfILGNPXvsegY+GxEBrPiPtewdAw7NVKzHOR7Ex+MEOX4QXW3NdM
 q3fg9U1t5BqntZmuNZTf7xXeK3syhw1leEqEjtd2kOvRcDKcoGqFsEcL9bLP4Ngq66Yb
 CX2UktQAw8U3vlcRW3t89lbV87rVyOURYc+FlVkwK489zgwBiTQ5Tjfm7oe6ZK1KS6lj
 U9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lFLCmK9y63u2FBlC+pHgkiyzlrt6fLB34hDDsjRLIWo=;
 b=HGVEGW7KnPDWzOq0ExqUM47NcsXD44pYdhd92L9p+LRZvWJ8MO41i8/uw0SNhFRt9O
 4AtKkNzbg76+aRZiUG1rop5uNA6H+yX7eBZ1HLIPkjeNpdF1eKDU5riFLT8r3r2xOj6a
 eCjc67ylxA1RxzfaNAeb2yDnduZHCmlhD1crrvs6vr3odW8qbRgKE3Me/ea0MSn+Yrc+
 UqDT2PD1xMy0vccvuX+oxltgu2aO785AaNbD9LWlaH3bKkJEYqLZa9KpKbODhfcCj7L6
 osSE7mWuNzLm5Ka22tTRwQj04QIxkU/ABp5jcsYGP6iFMNyth+Nc7/N6cF0r7j+TbwmJ
 NfNg==
X-Gm-Message-State: AOAM531wmoIhkVljGQn+8v3WCFWmcpkc+eEUn8wqF+0Nxw8FOpBZ6nyp
 ynU0GAt883tqcWLn++UOMdN+1+xxkx2zm2HeRthDRg==
X-Google-Smtp-Source: ABdhPJw08DLs+rDSC9MPE61I7b4SXBdffC5MW/PSUU4UTe3n55WrVfv1GKTJHOyj001xEYJ6PAtnUr2tD7Qa4EOkyqQ=
X-Received: by 2002:a63:d04a:0:b0:3c1:65f2:5d09 with SMTP id
 s10-20020a63d04a000000b003c165f25d09mr317264pgi.201.1652371771822; Thu, 12
 May 2022 09:09:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220429205644.245480-1-marex@denx.de>
 <CAG3jFyvC_vbXz=43Sdc9THdOMx0BuC9e-siEwKhs1TsjkNxvvg@mail.gmail.com>
In-Reply-To: <CAG3jFyvC_vbXz=43Sdc9THdOMx0BuC9e-siEwKhs1TsjkNxvvg@mail.gmail.com>
From: Robert Foss <robert.foss@linaro.org>
Date: Thu, 12 May 2022 18:09:20 +0200
Message-ID: <CAG3jFytZov9_db4GYEEt4ah6zAHvafaQuPrhJzUV1BO7VTABJQ@mail.gmail.com>
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

On Thu, 12 May 2022 at 18:02, Robert Foss <robert.foss@linaro.org> wrote:
>
> On Fri, 29 Apr 2022 at 22:56, Marek Vasut <marex@denx.de> wrote:
> >
> > Factor out register programming to configure the chip video RX side for
> > reception of video data from DSI or DPI. This is particularly useful in
> > the (e)DP output mode, where the video data can be received from either
> > DPI or DSI. While only the former is supported in (e)DP output mode so
> > far, this patch is added in preparation for addition of the later.
> >
> > There is a change in the order or register programming in case of the
> > DSI-to-DPI mode. The DSI RX side is now programmed and enabled all in
> > one place after the output mode has been configured. Before this change,
> > the DSI RX has been programmed before the output mode has been set and
> > only enabled afterward. The order makes no difference however, since the
> > DSI RX is only enabled at the end either way.
> >
> > Signed-off-by: Marek Vasut <marex@denx.de>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Lucas Stach <l.stach@pengutronix.de>
> > Cc: Marek Vasut <marex@denx.de>
> > Cc: Maxime Ripard <maxime@cerno.tech>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/bridge/tc358767.c | 94 +++++++++++++++++--------------
> >  1 file changed, 53 insertions(+), 41 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
> > index 485717c8f0b4..e72dd5cd9700 100644
> > --- a/drivers/gpu/drm/bridge/tc358767.c
> > +++ b/drivers/gpu/drm/bridge/tc358767.c
> > @@ -1247,11 +1247,60 @@ static int tc_main_link_disable(struct tc_data *tc)
> >         return regmap_write(tc->regmap, DP0CTL, 0);
> >  }
> >
> > -static int tc_dpi_stream_enable(struct tc_data *tc)
> > +static int tc_dsi_rx_enable(struct tc_data *tc)
> >  {
> > +       u32 value;
> >         int ret;
> > +
> > +       regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
> > +       regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
> > +       regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
> > +       regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
> > +       regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
> > +       regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
> > +       regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> > +       regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
> > +
> > +       value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> > +               LANEENABLE_CLEN;
> > +       regmap_write(tc->regmap, PPI_LANEENABLE, value);
> > +       regmap_write(tc->regmap, DSI_LANEENABLE, value);
> > +
> > +       /* Set input interface */
> > +       value = DP0_AUDSRC_NO_INPUT;
> > +       if (tc_test_pattern)
> > +               value |= DP0_VIDSRC_COLOR_BAR;
> > +       else
> > +               value |= DP0_VIDSRC_DSI_RX;
> > +       ret = regmap_write(tc->regmap, SYSCTRL, value);
> > +       if (ret)
> > +               return ret;
> > +
> > +       usleep_range(120, 150);
> > +
> > +       regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
> > +       regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
> > +
> > +       return 0;
> > +}
> > +
> > +static int tc_dpi_rx_enable(struct tc_data *tc)
> > +{
> >         u32 value;
> >
> > +       /* Set input interface */
> > +       value = DP0_AUDSRC_NO_INPUT;
> > +       if (tc_test_pattern)
> > +               value |= DP0_VIDSRC_COLOR_BAR;
> > +       else
> > +               value |= DP0_VIDSRC_DPI_RX;
> > +       return regmap_write(tc->regmap, SYSCTRL, value);
> > +}
> > +
> > +static int tc_dpi_stream_enable(struct tc_data *tc)
> > +{
> > +       int ret;
> > +
> >         dev_dbg(tc->dev, "enable video stream\n");
> >
> >         /* Setup PLL */
> > @@ -1277,20 +1326,6 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
> >         if (ret)
> >                 return ret;
> >
> > -       regmap_write(tc->regmap, PPI_D0S_CLRSIPOCOUNT, 3);
> > -       regmap_write(tc->regmap, PPI_D1S_CLRSIPOCOUNT, 3);
> > -       regmap_write(tc->regmap, PPI_D2S_CLRSIPOCOUNT, 3);
> > -       regmap_write(tc->regmap, PPI_D3S_CLRSIPOCOUNT, 3);
> > -       regmap_write(tc->regmap, PPI_D0S_ATMR, 0);
> > -       regmap_write(tc->regmap, PPI_D1S_ATMR, 0);
> > -       regmap_write(tc->regmap, PPI_TX_RX_TA, TTA_GET | TTA_SURE);
> > -       regmap_write(tc->regmap, PPI_LPTXTIMECNT, LPX_PERIOD);
> > -
> > -       value = ((LANEENABLE_L0EN << tc->dsi_lanes) - LANEENABLE_L0EN) |
> > -               LANEENABLE_CLEN;
> > -       regmap_write(tc->regmap, PPI_LANEENABLE, value);
> > -       regmap_write(tc->regmap, DSI_LANEENABLE, value);
> > -
> >         ret = tc_set_common_video_mode(tc, &tc->mode);
> >         if (ret)
> >                 return ret;
> > @@ -1299,22 +1334,7 @@ static int tc_dpi_stream_enable(struct tc_data *tc)
> >         if (ret)
> >                 return ret;
> >
> > -       /* Set input interface */
> > -       value = DP0_AUDSRC_NO_INPUT;
> > -       if (tc_test_pattern)
> > -               value |= DP0_VIDSRC_COLOR_BAR;
> > -       else
> > -               value |= DP0_VIDSRC_DSI_RX;
> > -       ret = regmap_write(tc->regmap, SYSCTRL, value);
> > -       if (ret)
> > -               return ret;
> > -
> > -       usleep_range(120, 150);
> > -
> > -       regmap_write(tc->regmap, PPI_STARTPPI, PPI_START_FUNCTION);
> > -       regmap_write(tc->regmap, DSI_STARTDSI, DSI_RX_START);
> > -
> > -       return 0;
> > +       return tc_dsi_rx_enable(tc);
> >  }
> >
> >  static int tc_dpi_stream_disable(struct tc_data *tc)
> > @@ -1370,19 +1390,11 @@ static int tc_edp_stream_enable(struct tc_data *tc)
> >         usleep_range(500, 1000);
> >         value |= VID_EN;
> >         ret = regmap_write(tc->regmap, DP0CTL, value);
> > -       if (ret)
> > -               return ret;
> > -       /* Set input interface */
> > -       value = DP0_AUDSRC_NO_INPUT;
> > -       if (tc_test_pattern)
> > -               value |= DP0_VIDSRC_COLOR_BAR;
> > -       else
> > -               value |= DP0_VIDSRC_DPI_RX;
> > -       ret = regmap_write(tc->regmap, SYSCTRL, value);
> >         if (ret)
> >                 return ret;
> >
> > -       return 0;
> > +       /* Set input interface */
> > +       return tc_dpi_rx_enable(tc);
> >  }
> >
> >  static int tc_edp_stream_disable(struct tc_data *tc)
> > --
> > 2.35.1
> >
>
> Reviewed-by: Robert Foss <robert.foss@linaro.org>

Applied to drm-misc-next.
