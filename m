Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA594AE1E3
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 20:07:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B6E10E17B;
	Tue,  8 Feb 2022 19:07:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6082D10E17B
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 19:07:04 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 725bd9eb-8912-11ec-ac19-0050568cd888;
 Tue, 08 Feb 2022 19:08:06 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id F0AA9194B5C;
 Tue,  8 Feb 2022 20:07:01 +0100 (CET)
Date: Tue, 8 Feb 2022 20:06:59 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH v1 3/9] drm: add drm_atomic_helper_bridge_dsi_input_bus_fmt
Message-ID: <YgK/U95F16Gqhu5J@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-4-sam@ravnborg.org>
 <CAD=FV=U2MnR895FDw79ATQr0TCjQzAxiZbXVr7sL5hXxH3fz6g@mail.gmail.com>
 <YgG86bskmyggAaEF@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YgG86bskmyggAaEF@pendragon.ideasonboard.com>
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
 Jitao Shi <jitao.shi@mediatek.com>, Jonas Karlman <jonas@kwiboo.se>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Neil Armstrong <narmstrong@baylibre.com>,
 Doug Anderson <dianders@chromium.org>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Feb 08, 2022 at 02:44:25AM +0200, Laurent Pinchart wrote:
> Hello,
> 
> On Mon, Feb 07, 2022 at 02:32:45PM -0800, Doug Anderson wrote:
> > On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> > >
> > > There is a number of bridge drivers that supports a single media bus
> > > format for DSI. Add a helper to avoid duplicating the code.
> > >
> > > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > > ---
> > >  drivers/gpu/drm/drm_atomic_helper.c | 41 +++++++++++++++++++++++++++++
> > >  include/drm/drm_atomic_helper.h     |  7 +++++
> > >  2 files changed, 48 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> > > index a7a05e1e26bb..94f313dc196f 100644
> > > --- a/drivers/gpu/drm/drm_atomic_helper.c
> > > +++ b/drivers/gpu/drm/drm_atomic_helper.c
> > > @@ -3549,3 +3549,44 @@ drm_atomic_helper_bridge_propagate_bus_fmt(struct drm_bridge *bridge,
> > >         return input_fmts;
> > >  }
> > >  EXPORT_SYMBOL(drm_atomic_helper_bridge_propagate_bus_fmt);
> > > +
> > > +/**
> > > + * drm_atomic_helper_bridge_dsi_input_bus_fmt - Define one DSI output format
> > 
> > Is the description right? It's called "input" format but it defines an
> > output format?
> > 
> > 
> > > + * @bridge: bridge control structure
> > > + * @bridge_state: new bridge state
> > > + * @crtc_state: new CRTC state
> > > + * @conn_state: new connector state
> > > + * @output_fmt: tested output bus format
> > > + * @num_input_fmts: will contain the size of the returned array
> > 
> > Maybe indicate that it's always 1 in the comments?
> > 
> > > + *
> > > + * This helper is an implementation of the
> > > + * &drm_bridge_funcs.atomic_get_input_bus_fmts operation for bridges that supports
> > > + * a single DSI media bus format MEDIA_BUS_FMT_RGB888_1X24.
> > > + *
> > > + * RETURNS
> > 
> > kernel-doc can't parse this return syntax and warns:
> > 
> > warning: No description found for return value of
> > 'drm_atomic_helper_bridge_dsi_input_bus_fmt'
> > 
> > 
> > > + * A format array with one entry containing MEDIA_BUS_FMT_RGB888_1X24,
> > > + * or NULL if the allocation failed
> > > + */
> > > +u32 *
> > > +drm_atomic_helper_bridge_dsi_input_bus_fmt(struct drm_bridge *bridge,
> > > +                                          struct drm_bridge_state *bridge_state,
> > > +                                          struct drm_crtc_state *crtc_state,
> > > +                                          struct drm_connector_state *conn_state,
> > > +                                          u32 output_fmt,
> > > +                                          unsigned int *num_input_fmts)
> > > +{
> > > +       u32 *input_fmts;
> > > +
> > > +       *num_input_fmts = 0;
> > > +
> > > +       input_fmts = kcalloc(MAX_INPUT_SEL_FORMATS, sizeof(*input_fmts), GFP_KERNEL);
> > 
> > I probably wouldn't have bothered with `kcalloc` for something that's
> > always just one value and you're setting it. Why not just
> > 
> > input_fmts = kmalloc(sizeof(*input_fmts), GFP_KERNEL);
> > 
> > ...also MAX_INPUT_SEL_FORMATS isn't defined. I guess that's why you
> > said it didn't compile?
> > 
> > Also: if it was common for others to want to provide fixed formats, I
> > wonder about adding a helper function that did most of the work here?
> > Dunno what it would be named since it's already a bit a of handful,
> > but I'd expect to call it like:
> > 
> > static const u32 formats[] = { MEDIA_BUS_FMT_RGB888_1X24 };
> > return my_neat_helper(formats, ARRAY_SIZE(formats), num_output_formats)
> > 
> > Then my_neat_helper() could do kmemdup() on the array passed and fill
> > in "num_output_formats" to be either the array size of 0 (if the
> > kmemdup failed).
> 
> I quite like that approach. We could even have a wrapper macro that adds
> the ARRAY_SIZE() argument automatically.

Agree, will try to give that a spin.
And will then also process all the nice feedback from Douglas.

	Sam
