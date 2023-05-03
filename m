Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AB36F5BCE
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 18:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4268A10E0FC;
	Wed,  3 May 2023 16:18:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 771E510E0FC
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 16:18:03 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-51b4ef5378bso4653957a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 09:18:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683130682; x=1685722682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=UmKZspVB74y8KHaujMmKpQPz93YiFFN2bzMFb4mgq1o=;
 b=Q4Ot9zXTgNgD0strUAihBbymUptaXwEyFHutNOzqHf70COhEz0B4r6UBHbNfo0YULN
 CUKHiHMxW10d0m4/u2MdRzuT36JryMXu/v8wzTs5BsdwyngeMQqcM2wqUgLVmaUtjTrr
 tx9Q1MsfFBklXwZNCpX7s0u6gEE9iwVmXGvvWy0VNaFJMN5MYNvoIGvKG2lfNm/dFboP
 kFpb0DsAFA9gnlMRjxhNcYt4Pih5R56vjzluoeTQikprSC8e540eshNvl0A6cg10+1Qj
 vzxLxKRmbV89iPyDQyD+heEQhkZHNmD1e158SQ9E2flojyzeGXZgHAsuEYYwafxUzL1w
 H4fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683130682; x=1685722682;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=UmKZspVB74y8KHaujMmKpQPz93YiFFN2bzMFb4mgq1o=;
 b=bln2RtB6xr5BdNrE6DiHBypwcD/dmfSyvOT6oURrW+skfdC/JvklPe7M7tf3ksfveU
 BExb7CqglQKq9et6mv3tBaQpiiQUapkUGSHTjzqFKaxz+wWVCf/sbxDn/SZfCY/raBpz
 BgBr3xx6VssPIbccL17EWTBcJn8mlQjTdHTIyAQcYloA5lv5DHMg/++4uCKvNwBfGo8U
 se16oox7NRPzlFA/YT3UOhHXbGRA5zodPmOmP11eoNlQGK5sdopCfx0T/AfG4L9NtbvJ
 hor/4rF0+jHBTstwpAaN8cokE8r0LZXI3mTvzaU6w0Xbt1GKHu7738BNhKzgSAWUfutw
 2AvQ==
X-Gm-Message-State: AC+VfDzdNmCwGpbIJF42Cj5SWTdCy5OEjZZ8ZrjA4TZpxzAoBF1Pdb52
 FgZr0dRESXJr9nZpqifriAyiQePUOIjU3pLkoJs=
X-Google-Smtp-Source: ACHHUZ7J2U5JE/rIMcy4i2ok3/I41F44ypaSOWGNPZ9hXcPpCyTr3JavDAAKGO/0IQMTysI+qWj8BNnsAcL13ND2Nu4=
X-Received: by 2002:a17:90a:8b92:b0:24d:f59a:d331 with SMTP id
 z18-20020a17090a8b9200b0024df59ad331mr12791706pjn.26.1683130682321; Wed, 03
 May 2023 09:18:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230502010759.17282-1-aford173@gmail.com>
 <20230502010759.17282-8-aford173@gmail.com>
 <ba50c423-2678-3865-8f9a-907480c9870a@kontron.de>
In-Reply-To: <ba50c423-2678-3865-8f9a-907480c9870a@kontron.de>
From: Adam Ford <aford173@gmail.com>
Date: Wed, 3 May 2023 11:17:50 -0500
Message-ID: <CAHCN7x+ZQWspfiJVyrsJ=2E6OBya1o4vhBh9efxcjC09hv=Ziw@mail.gmail.com>
Subject: Re: [PATCH V3 7/7] drm: bridge: samsung-dsim: Let blanking calcuation
 work in non-burst mode
To: Frieder Schrempf <frieder.schrempf@kontron.de>
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
Cc: marex@denx.de, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, aford@beaconembedded.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, Chen-Yu Tsai <wenst@chromium.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 3, 2023 at 10:52=E2=80=AFAM Frieder Schrempf
<frieder.schrempf@kontron.de> wrote:
>
> On 02.05.23 03:07, Adam Ford wrote:
> > The blanking calculation currently uses burst_clk_rate for calculating
> > the settings. Since it's possible to use this in non-burst mode, it's
> > possible that where won't be burst_clk_rate.  Instead, cache the
>
> "possible that burst_clk_rate is 0"
>
> > clock rate configured from of samsung_dsim_set_pll and use it instead.
> >
> > Signed-off-by: Adam Ford <aford173@gmail.com> Tested-by: Chen-Yu Tsai <=
wenst@chromium.org>
>
> Maybe this patch should be squashed into patch 6/7 as otherwise
> burst_clk_rate could be 0 here causing bisection issues?

I thought about squashing them and I went back and forth on that.
Since there are some other minor edits in this series, I can push a V4
with these squashed.

>
> Apart from that:
>
> Tested on Kontron BL i.MX8MM with SN65DSI84 and ADV7535 bridges.
>

Thank you for testing this series.

> Tested-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> Reviewed-by: Frieder Schrempf <frieder.schrempf@kontron.de>
>

adam
> > ---
> >  drivers/gpu/drm/bridge/samsung-dsim.c | 4 +++-
> >  include/drm/bridge/samsung-dsim.h     | 1 +
> >  2 files changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/br=
idge/samsung-dsim.c
> > index 53099461cdc2..1dc913db2cb3 100644
> > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > @@ -652,6 +652,8 @@ static unsigned long samsung_dsim_set_pll(struct sa=
msung_dsim *dsi,
> >               reg =3D samsung_dsim_read(dsi, DSIM_STATUS_REG);
> >       } while ((reg & DSIM_PLL_STABLE) =3D=3D 0);
> >
> > +     dsi->hs_clock =3D fout;
> > +
> >       return fout;
> >  }
> >
> > @@ -960,7 +962,7 @@ static void samsung_dsim_set_display_mode(struct sa=
msung_dsim *dsi)
> >       u32 reg;
> >
> >       if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > -             int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> > +             int byte_clk_khz =3D dsi->hs_clock / 1000 / 8;>          =
 int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk_khz / m->clock;
> >               int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz / m=
->clock;
> >               int hsa =3D (m->hsync_end - m->hsync_start) * byte_clk_kh=
z / m->clock;
> > diff --git a/include/drm/bridge/samsung-dsim.h b/include/drm/bridge/sam=
sung-dsim.h
> > index 76ea8a1720cc..14176e6e9040 100644
> > --- a/include/drm/bridge/samsung-dsim.h
> > +++ b/include/drm/bridge/samsung-dsim.h
> > @@ -94,6 +94,7 @@ struct samsung_dsim {
> >
> >       u32 pll_clk_rate;
> >       u32 burst_clk_rate;
> > +     u32 hs_clock;
> >       u32 esc_clk_rate;
> >       u32 lanes;
> >       u32 mode_flags;
