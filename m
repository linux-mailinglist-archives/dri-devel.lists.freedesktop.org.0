Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 035C04AE1E7
	for <lists+dri-devel@lfdr.de>; Tue,  8 Feb 2022 20:09:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5916B88E41;
	Tue,  8 Feb 2022 19:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D0C3A10E18A
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Feb 2022 19:08:53 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id b3a5f943-8912-11ec-ac19-0050568cd888;
 Tue, 08 Feb 2022 19:09:55 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 69D3E194BB8;
 Tue,  8 Feb 2022 20:08:52 +0100 (CET)
Date: Tue, 8 Feb 2022 20:08:49 +0100
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH v1 5/9] drm/bridge: ti-sn65dsi86: Fetch bpc via
 drm_bridge_state
Message-ID: <YgK/wWGVtpHJicDj@ravnborg.org>
References: <20220206154405.1243333-1-sam@ravnborg.org>
 <20220206154405.1243333-6-sam@ravnborg.org>
 <CAD=FV=WW6HWLOD9AzTpjwva9UHY=AR+LABEWqJQznz6Nbb4sOw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAD=FV=WW6HWLOD9AzTpjwva9UHY=AR+LABEWqJQznz6Nbb4sOw@mail.gmail.com>
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
 Neil Armstrong <narmstrong@baylibre.com>, Robert Foss <robert.foss@linaro.org>,
 Andrzej Hajda <a.hajda@samsung.com>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 07, 2022 at 02:34:10PM -0800, Doug Anderson wrote:
> Hi,
> 
> On Sun, Feb 6, 2022 at 7:44 AM Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > To prepare for DRM_BRIDGE_ATTACH_NO_CONNECTOR support,
> > fix so the bpc is found using the output format.
> >
> > This avoids the use of the connector stored in the private data.
> >
> > Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
> > Cc: Douglas Anderson <dianders@chromium.org>
> > Cc: Andrzej Hajda <a.hajda@samsung.com>
> > Cc: Neil Armstrong <narmstrong@baylibre.com>
> > Cc: Robert Foss <robert.foss@linaro.org>
> > Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> > Cc: Jonas Karlman <jonas@kwiboo.se>
> > Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> > ---
> >  drivers/gpu/drm/bridge/ti-sn65dsi86.c | 16 ++++++++++------
> >  1 file changed, 10 insertions(+), 6 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > index d681ab68205c..dc6ec40bc1ef 100644
> > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > @@ -33,6 +33,7 @@
> >  #include <drm/drm_panel.h>
> >  #include <drm/drm_print.h>
> >  #include <drm/drm_probe_helper.h>
> > +#include <drm/media-bus-format.h>
> >
> >  #define SN_DEVICE_REV_REG                      0x08
> >  #define SN_DPPLL_SRC_REG                       0x0A
> > @@ -823,9 +824,11 @@ static void ti_sn_bridge_set_dsi_rate(struct ti_sn65dsi86 *pdata)
> >         regmap_write(pdata->regmap, SN_DSIA_CLK_FREQ_REG, val);
> >  }
> >
> > -static unsigned int ti_sn_bridge_get_bpp(struct ti_sn65dsi86 *pdata)
> > +static unsigned int ti_sn_bridge_get_bpp(struct drm_bridge_state *bridge_state)
> >  {
> > -       if (pdata->connector.display_info.bpc <= 6)
> > +       int bpc = media_bus_format_to_bpc(bridge_state->output_bus_cfg.format);
> > +
> > +       if (bpc <= 6)
> >                 return 18;
> >         else
> >                 return 24;
> 
> Unfortunately this doesn't work as hoped. :(
> `bridge_state->output_bus_cfg.format` is 0 in my testing...
> 
> ...and then media_bus_format_to_bpc() returns an error, which is
> negative and <= 6. That's not super ideal...
> 
> I guess this gets down to what the output bus format is _supposed_ to
> be for eDP. Based on my understanding of eDP there isn't really a
> concept of a fixed "bus format" that the panel ought to work at. There
> is a concept of the number of bits per component (6, 8, 10, 12) that a
> panel can run at but then after that I believe the format is standard,
> or at least it's something that's dynamic / negotiated. Also note that
> the format on the bus is more related to the current mode we're
> running the panel in than some inherent property of the panel. For
> instance, a 10 bpc panel can likely have data provided in 8 bpc and 6
> bpc. I've also seen 6 bpc panels that can accept 8 bpc data and can
> dither it. In any case, this type of stuff is really all dynamic for
> eDP. The old value we were looking at was really being interpreted as
> the "max" bpc that the panel could run in and we'd choose to run the
> panel in 8 bpc if the panel supported it and 6 bpc otherwise (this
> bridge chip only supports 6bpc or 8bpc).
> 
> So I guess the question is: how do we move forward here?

I skipped a patch to find the connector - will try to give that a spin
again.
Thanks for the testing and the feedback!

	Sam


> 
> Do we need to somehow figure out how to get "output_bus_cfg.format"
> filled in? Any suggestions for how to do that? Do we just implement
> atomic_get_output_bus_fmts() and then pick one of
> MEDIA_BUS_FMT_RGB666_1X18 or MEDIA_BUS_FMT_RBG888_1X24 based on the
> bpc in the connector state? ...or do we just list both of them and
> something magically will pick the right one? Hrm, I tried that and it
> didn't magically work, but I didn't debug further...
> 
> One thing I realized is that, at least in theory, we might not know
> whether we want to run in 6 bpc or 8 bpc until we've done link
> training. It's at least somewhat plausible that there could be edge
> cases where we'd want to fall back to the low bpc if link training
> failed at the higher bpc. The driver doesn't support that right now,
> but ideally the design wouldn't preclude it. At the moment link
> training happens in enable. Maybe that's a problem to worry about
> another day, though?
> 
> -Doug
