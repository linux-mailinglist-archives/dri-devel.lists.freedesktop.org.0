Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E2F4ACCD2
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 01:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B945410E1A6;
	Tue,  8 Feb 2022 00:44:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DE810E1A6
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 00:44:29 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6ACA7340;
 Tue,  8 Feb 2022 01:44:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1644281067;
 bh=giqCutdNDRq/wdRBaK4rI2HXN07MPaMA/hOpUn3Zb2E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VDkFar2nuY+ShfwR2SDR8Q+IO2fitx6+W93zFxPg72Ppwws7jl2Sfpv2fUSz0omtr
 U9o4A17vcXUINgLSY13QaCLBoB1wmwOBMO3lahzaTO8C8bB5fDAyTrhDkZG9jmNcAv
 0IZS5ADpklEaEOBepkttpeRP8Z6k/tL2qunLN8yE=
Date: Tue, 8 Feb 2022 02:44:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 3/9] drm: add drm_atomic_helper_bridge_dsi_input_bus_fmt
Message-ID: <YgG86bskmyggAaEF@pendragon.ideasonboard.com>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-4-sam@ravnborg.org>
 <CAD=FV=U2MnR895FDw79ATQr0TCjQzAxiZbXVr7sL5hXxH3fz6g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CAD=FV=U2MnR895FDw79ATQr0TCjQzAxiZbXVr7sL5hXxH3fz6g@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Philip Chen <philipchen@chromium.org>,
 Jitao Shi <jitao.shi@mediatek.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonas Karlman <jonas@kwiboo.se>, Robert Foss <robert.foss@linaro.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Andrzej Hajda <a.hajda@samsung.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello,

On Mon, Feb 07, 2022 at 02:32:45PM -0800, Doug Anderson wrote:
> On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > There is a number of bridge drivers that supports a single media bus
> > format for DSI. Add a helper to avoid duplicating the code.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > ---
> >  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
> >  include/drm/drm_atomic_helper.h     |  7 +++++
> >  2 files changed, 48 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > index a7a05e1e26bb..94f313dc196f 100644
> > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > @@ -3549,3 +3549,44 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
> >         return input_fmts;
> >  }
> >  EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
> > +
> > +/**
> > + * drm_atomic_helper_bridge_dsi_input_bus_fmt - Define one DSI output format
> 
> Is the description right? It's called "input" format but it defines an
> output format?
> 
> 
> > + * @bridge: bridge control structure
> > + * @bridge_state: new bridge state
> > + * @crtc_state: new CRTC state
> > + * @conn_state: new connector state
> > + * @output_fmt: tested output bus format
> > + * @num_input_fmts: will contain the size of the returned array
> 
> Maybe indicate that it's always 1 in the comments?
> 
> > + *
> > + * This helper is an implementation of the
> > + * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that supports
> > + * a single DSI media bus format MEDIA_BUS_FMT_RGB888_1X24.
> > + *
> > + * RETURNS
> 
> kernel-doc can't parse this return syntax and warns:
> 
> warning: No description found for return value of
> 'drm_atomic_helper_bridge_dsi_input_bus_fmt'
> 
> 
> > + * A format array with one entry containing MEDIA_BUS_FMT_RGB888_1X24,
> > + * or NULL if the allocation failed
> > + */
> > +u32 *
> > +drm_atomic_helper_bridge_dsi_input_bus_fmt(struct drm_bridge *bridge,
> > +                                          struct drm_bridge_state *bridge_state,
> > +                                          struct drm_crtc_state *crtc_state,
> > +                                          struct drm_connector_state *conn_state,
> > +                                          u32 output_fmt,
> > +                                          unsigned int *num_input_fmts)
> > +{
> > +       u32 *input_fmts;
> > +
> > +       *num_input_fmts = 0;
> > +
> > +       input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
> 
> I probably wouldn't have bothered with `kcalloc` for something that's
> always just one value and you're setting it. Why not just
> 
> input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> 
> ...also MAX_INPUT_SEL_FORMATS isn't defined. I guess that's why you
> said it didn't compile?
> 
> Also: if it was common for others to want to provide fixed formats, I
> wonder about adding a helper function that did most of the work here?
> Dunno what it would be named since it's already a bit a of handful,
> but I'd expect to call it like:
> 
> static const u32 formats[] = { MEDIA_BUS_FMT_RGB888_1X24 };
> return my_neat_helper(formats, ARRAY_SIZE(formats), num_output_formats)
> 
> Then my_neat_helper() could do kmemdup() on the array passed and fill
> in "num_output_formats" to be either the array size of 0 (if the
> kmemdup failed).

I quite like that approach. We could even have a wrapper macro that adds
the ARRAY_SIZE() argument automatically.

> > +       if (!input_fmts)
> > +               return NULL;
> > +
> > +       /* This is the DSI-end bus format */
> > +       input_fmts[0] = MEDIA_BUS_FMT_RGB888_1X24;
> 
> I'm not an expert, but I'm curious. Can't DSI run in other formats?
> ...or maybe I'm misunderstanding what this is for. I guess I'm not
> sure how it relates to:
> 
> enum mipi_dsi_pixel_format {
>   MIPI_DSI_FMT_RGB888,
>   MIPI_DSI_FMT_RGB666,
>   MIPI_DSI_FMT_RGB666_PACKED,
>   MIPI_DSI_FMT_RGB565,
> };

-- 
Regards,

Laurent Pinchart
