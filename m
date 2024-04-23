Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF8A8AE83E
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 15:32:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05B44112937;
	Tue, 23 Apr 2024 13:32:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="RXJB8wsp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D414D10F66C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:32:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 3ADC2CE10C9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61B29C116B1
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 13:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1713879148;
 bh=AP67NgULme2krqQcPsRIs+2ZN6mA5krVB1+iZidsmpQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=RXJB8wspxP8pk4Ow4/JgUdQxDYSuMWXtvwZcHMcygIfsV8CZfR5piUq+ffZvqfEf8
 QaaKf3bHJBXR8vawtx32iwMO76Si+wymzaiCe6XIsb0qQN4qg6yOpwkVFwPNV5XJzz
 w3QwhPpK1HIqxgI4nzYSjmrhJExmGY8HDD9LPiymmpo+Rc9iIGYzaXP46hW/p9JnmC
 F7ENkaz77czs+clx3X06vxLdZusskiyvM8EZsWZiLYrN/BfDsp0h0KshKepGB/wZhq
 i7VE5ACvBL2q/FXyyXhWltW+bwyXFIMkKY/KXY0At5eUGls3my/FvtWLlPMvg2Rzcf
 dHMzq6OZow9ww==
Received: by mail-yw1-f179.google.com with SMTP id
 00721157ae682-61b68644ab4so18421657b3.0
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 06:32:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCV9NuTP2LgN2q8+CZWf0ccgSBB6irdKXvGLhv4IqwiIOaTLPdQ2DM50G9cfiyPNqS0l99N2rSUQBot6zJ4yT23yqB6Mpo8/O20gimUeWKNc
X-Gm-Message-State: AOJu0Yyc0N+x6/vLaSGFjpmnD+uuWsrQLtNUUGXKkWe6KkY/lAjyzY7p
 45Q48Vw10780zCDp2spI8IJuYYyV2hS+YnUJrYS+do+ZSSdXppCGA5OHw4X+uIqy4Rrtyu8Siag
 j1sN7e4iyiLH0tOaVLe1S8IYc5jl8N3VXT5dr1Q==
X-Google-Smtp-Source: AGHT+IFshLz5spQ5CQ8dKF+BBgEo+ryWs5tFujTBrjKdLYE1dJu8PqqxFbvK93HDcogCUI2Ar0hY5OF8o/XSbAfFJgs=
X-Received: by 2002:a25:6c0b:0:b0:de3:e1ea:d23 with SMTP id
 h11-20020a256c0b000000b00de3e1ea0d23mr2464770ybc.51.1713879146752; Tue, 23
 Apr 2024 06:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20240322104732.2327060-1-sean@geanix.com>
 <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
In-Reply-To: <lkrxoqhcitmvjvzslhx6mrdjaa6lpxtpmdjt7wwollm6z4h65q@jk5esjje6ppy>
From: Robert Foss <rfoss@kernel.org>
Date: Tue, 23 Apr 2024 15:32:15 +0200
X-Gmail-Original-Message-ID: <CAN6tsi40-gGgG3Bw-rS4TZBO+=JthWkPh-XqErGvkHdvhqx6tA@mail.gmail.com>
Message-ID: <CAN6tsi40-gGgG3Bw-rS4TZBO+=JthWkPh-XqErGvkHdvhqx6tA@mail.gmail.com>
Subject: Re: [PATCH] drm/stm: dsi: relax mode_valid clock tolerance
To: Sean Nyekjaer <sean@geanix.com>
Cc: Yannick Fertre <yannick.fertre@foss.st.com>, 
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>, 
 Philippe Cornu <philippe.cornu@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Antonio Borneo <antonio.borneo@foss.st.com>, dri-devel@lists.freedesktop.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
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

On Mon, Apr 22, 2024 at 4:06=E2=80=AFPM Sean Nyekjaer <sean@geanix.com> wro=
te:
>
> On Fri, Mar 22, 2024 at 11:47:31AM +0100, Sean Nyekjaer wrote:
> > When using the DSI interface via DSI2LVDS bridge, it seems a bit harsh
> > to reguire the requested and the actual px clock to be within
> > 50Hz. A typical LVDS display requires the px clock to be within +-10%.
> >
> > In case for HDMI .5% tolerance is required.
> >
> > Fixes: e01356d18273 ("drm/stm: dsi: provide the implementation of mode_=
valid()")
> > Signed-off-by: Sean Nyekjaer <sean@geanix.com>
> > ---
> Any feedback on this?
>
> >  drivers/gpu/drm/stm/dw_mipi_dsi-stm.c | 7 +++----
> >  1 file changed, 3 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c b/drivers/gpu/drm/st=
m/dw_mipi_dsi-stm.c
> > index d5f8c923d7bc..97936b0ef702 100644
> > --- a/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > +++ b/drivers/gpu/drm/stm/dw_mipi_dsi-stm.c
> > @@ -322,8 +322,6 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigne=
d int lane_mbps,
> >       return 0;
> >  }
> >
> > -#define CLK_TOLERANCE_HZ 50
> > -
> >  static enum drm_mode_status
> >  dw_mipi_dsi_stm_mode_valid(void *priv_data,
> >                          const struct drm_display_mode *mode,
> > @@ -375,9 +373,10 @@ dw_mipi_dsi_stm_mode_valid(void *priv_data,
> >               /*
> >                * Filter modes according to the clock value, particularl=
y useful for
> >                * hdmi modes that require precise pixel clocks.
> > +              * Check that px_clock is within .5% tolerance.
> >                */
> > -             if (px_clock_hz < target_px_clock_hz - CLK_TOLERANCE_HZ |=
|
> > -                 px_clock_hz > target_px_clock_hz + CLK_TOLERANCE_HZ)
> > +             if (px_clock_hz < mult_frac(target_px_clock_hz, 995, 1000=
) ||
> > +                 px_clock_hz > mult_frac(target_px_clock_hz, 1005, 100=
0))
> >                       return MODE_CLOCK_RANGE;
> >
> >               /* sync packets are codes as DSI short packets (4 bytes) =
*/
> > --
> > 2.44.0
> >
>

Reviewed-by: Robert Foss <rfoss@kernel.org>
