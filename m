Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06766F5C27
	for <lists+dri-devel@lfdr.de>; Wed,  3 May 2023 18:36:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74D8C10E297;
	Wed,  3 May 2023 16:36:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com
 [IPv6:2607:f8b0:4864:20::1131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DB4410E31B
 for <dri-devel@lists.freedesktop.org>; Wed,  3 May 2023 16:36:09 +0000 (UTC)
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-55a2691637bso59472527b3.0
 for <dri-devel@lists.freedesktop.org>; Wed, 03 May 2023 09:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1683131768; x=1685723768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=d/907v6qlrO+vgCs3WjNzG1/NauBMPopzZK9UTvbynU=;
 b=XEyEzVkiiwnZJGFsWnGM0c/KJmcFHp95byWnjRbnn0ITkTswKKM1EeLk4gbaC9+5Ar
 hoGVxxwdsEXXLqLugJmBz2VErtyAwfCVrY9Z4qIzixocOjKuxCCc90jizXWXs0BY731D
 iCaBKRBHSTtSaIeTcGHmWOhljisey60vgTuik=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683131768; x=1685723768;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d/907v6qlrO+vgCs3WjNzG1/NauBMPopzZK9UTvbynU=;
 b=P5safPRKGD7IvrY1CenpY0VEl4st+HGkCUtIRUReZJr3Viw5GOw+iX36urAnWUUeZb
 LoIX5ZU53NSXSyOppwV3KxL4lz2m2DocpQfGGvcet/ol1SWc2rSHTl+LFQHf/8aXTXs7
 l80/JwokwsD9CdSR+QGdD9Granyb2Q1eleEKf3m9Zd/6F0LPoMnH9VxUZWG+YjAgPHEA
 Y/WV5Gdy08f4hu8z/l62eMi1QbKkyq7WtYZNURGXU8a0fj8bTjZQIokWSSsIRQWpAXbI
 0cBNWDaA6dk2n+Os+33YiODYHXVv5e/DbJq6nY7umz+J/tIqMaJO1+MKxxqvVUXXY7CC
 0IEQ==
X-Gm-Message-State: AC+VfDzaDScK3ogbsMc9inVdnHbtVVr2oS6M75kTxODY3JzrPy7CnpGc
 jEb8o8kxWpfeGAU414a0YiPl9iSANvfyOS7FkyBgZQ==
X-Google-Smtp-Source: ACHHUZ4jy6BhscYAIyIWZXUqVR7LWYFy1QquV9iIbGTx9DTE26ZPw/idXmwHZ+h1dD3KFj1uYuT3oWq9sY/rIdshzdA=
X-Received: by 2002:a81:a007:0:b0:55a:4117:a8f2 with SMTP id
 x7-20020a81a007000000b0055a4117a8f2mr11909110ywg.4.1683131768294; Wed, 03 May
 2023 09:36:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230423121232.1345909-1-aford173@gmail.com>
 <20230423121232.1345909-2-aford173@gmail.com>
 <CAMty3ZCn9_AT8SOfFD-MYox16ZcqOEezt_0x6aES6LWQFj8Kpg@mail.gmail.com>
 <CAHCN7xLYfEO9Pxq91vZSDG0QXjnx3BEKYdsTXgQ1BTbtuTbLGQ@mail.gmail.com>
In-Reply-To: <CAHCN7xLYfEO9Pxq91vZSDG0QXjnx3BEKYdsTXgQ1BTbtuTbLGQ@mail.gmail.com>
From: Jagan Teki <jagan@amarulasolutions.com>
Date: Wed, 3 May 2023 22:05:56 +0530
Message-ID: <CAMty3ZB0q7MLRyu4TgcV20rX7c8d2SMbvBr39XRru5_Ry6q1Ug@mail.gmail.com>
Subject: Re: [PATCH V2 1/6] drm: bridge: samsung-dsim: fix blanking packet
 size calculation
To: Adam Ford <aford173@gmail.com>
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
Cc: Marek Vasut <marex@denx.de>, Neil Armstrong <neil.armstrong@linaro.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Robert Foss <rfoss@kernel.org>,
 Jonas Karlman <jonas@kwiboo.se>, linux-kernel@vger.kernel.org,
 aford@beaconembedded.com, dri-devel@lists.freedesktop.org,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dario.binacchi@amarulasolutions.com,
 m.szyprowski@samsung.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Apr 24, 2023 at 3:17=E2=80=AFPM Adam Ford <aford173@gmail.com> wrot=
e:
>
> On Mon, Apr 24, 2023 at 4:03=E2=80=AFAM Jagan Teki <jagan@amarulasolution=
s.com> wrote:
> >
> > On Sun, Apr 23, 2023 at 5:42=E2=80=AFPM Adam Ford <aford173@gmail.com> =
wrote:
> > >
> > > From: Lucas Stach <l.stach@pengutronix.de>
> > >
> > > Scale the blanking packet sizes to match the ratio between HS clock
> > > and DPI interface clock. The controller seems to do internal scaling
> > > to the number of active lanes, so we don't take those into account.
> > >
> > > Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
> > > Signed-off-by: Adam Ford <aford173@gmail.com>
> > > ---
> > >  drivers/gpu/drm/bridge/samsung-dsim.c | 18 +++++++++++++++---
> > >  1 file changed, 15 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/=
bridge/samsung-dsim.c
> > > index e0a402a85787..2be3b58624c3 100644
> > > --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> > > +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> > > @@ -874,17 +874,29 @@ static void samsung_dsim_set_display_mode(struc=
t samsung_dsim *dsi)
> > >         u32 reg;
> > >
> > >         if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO) {
> > > +               int byte_clk_khz =3D dsi->burst_clk_rate / 1000 / 8;
> > > +               int hfp =3D (m->hsync_start - m->hdisplay) * byte_clk=
_khz / m->clock;
> >
> > I do not quite understand why it depends on burst_clk_rate, would you
> > please explain? does it depends on bpp something like this
> >
> > mipi_dsi_pixel_format_to_bpp(format) / 8
>
> The pixel clock is currently set to the burst clock rate.  Dividing
> the clock by 1000 gets the pixel clock in KHz, and dividing by 8
> converts bits to bytes.
> Later in the series, I change the clock from the burst clock to the
> cached value returned from samsung_dsim_set_pll.

Okay.

>
> >
> > > +               int hbp =3D (m->htotal - m->hsync_end) * byte_clk_khz=
 / m->clock;
> > > +               int hsa =3D (m->hsync_end - m->hsync_start) * byte_cl=
k_khz / m->clock;
> > > +
> > > +               /* remove packet overhead when possible */
> > > +               hfp =3D max(hfp - 6, 0);
> > > +               hbp =3D max(hbp - 6, 0);
> > > +               hsa =3D max(hsa - 6, 0);
> >
> > 6 blanking packet overhead here means, 4 bytes + payload + 2 bytes
> > format? does this packet overhead depends on the respective porch's
> > like hpf, hbp and hsa has different packet overheads?
>
> Lucas might be able to explain this better.  However, it does match
> the values of the downstream NXP kernel, and I tried playing with
> these values manually, and 6 appeared to be the only number that
> seemed to work for me too.  I abandoned my approach for Lucas'
> implementation, because it seemed more clear than mine.
> Maybe Lucas can chime in, since this is really his patch.

Lucan, any inputs?

Jagan.
