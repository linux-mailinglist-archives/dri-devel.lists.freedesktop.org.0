Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C459433E0C5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Mar 2021 22:47:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2737589BD2;
	Tue, 16 Mar 2021 21:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C340D89DD3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Mar 2021 21:46:55 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 72935D8B;
 Tue, 16 Mar 2021 22:46:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1615931213;
 bh=i2LuQeu7lxvCtawfyP8B93mR5EXB1M5wx/2iAFD9/Sw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTTpiTs6X37hBs3CYue2FJcvDjSbt35KPyPDALCxJXuyPJuKgGQ6E5KFH7lWpqJhq
 ZSpL00+vVzUOD9K6DORB++81DFLgtci391o0l2fri0HcSGlCa5AmW/nJiOxSBJXkHH
 t8e+99+z+SL6hX9ohr3jjL4I509EoQfE67AICoMY=
Date: Tue, 16 Mar 2021 23:46:18 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
Message-ID: <YFEnKgwEOWdeQBK6@pendragon.ideasonboard.com>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
 <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com>
 <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
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
Cc: robdclark@chromium.org, Jernej Skrabec <jernej.skrabec@siol.net>,
 Jonas Karlman <jonas@kwiboo.se>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Neil Armstrong <narmstrong@baylibre.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Mon, Mar 15, 2021 at 09:25:37AM -0700, Doug Anderson wrote:
> On Sat, Mar 13, 2021 at 1:17 PM Laurent Pinchart wrote:
> > On Thu, Mar 04, 2021 at 03:52:01PM -0800, Douglas Anderson wrote:
> > > In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> > > DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> > > EDID from the panel. That commit kinda worked but it had some serious
> > > problems.
> > >
> > > The problems all stem from the fact that userspace wants to be able to
> > > read the EDID before it explicitly enables the panel. For eDP panels,
> > > though, we don't actually power the panel up until the pre-enable
> > > stage and the pre-enable call happens right before the enable call
> > > with no way to interject in-between. For eDP panels, you can't read
> > > the EDID until you power the panel. The result was that
> > > ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> > > (falling back to what drm_panel_get_modes() returned) until _after_
> > > the EDID was needed.
> > >
> > > To make it concrete, on my system I saw this happen:
> > > 1. We'd attach the bridge.
> > > 2. Userspace would ask for the EDID (several times). We'd try but fail
> > >    to read the EDID over and over again and fall back to the hardcoded
> > >    modes.
> > > 3. Userspace would decide on a mode based only on the hardcoded modes.
> > > 4. Userspace would ask to turn the panel on.
> > > 5. Userspace would (eventually) check the modes again (in Chrome OS
> > >    this happens on the handoff from the boot splash screen to the
> > >    browser). Now we'd read them properly and, if they were different,
> > >    userspace would request to change the mode.
> > >
> > > The fact that userspace would always end up using the hardcoded modes
> > > at first significantly decreases the benefit of the EDID
> > > reading. Also: if the modes were even a tiny bit different we'd end up
> > > doing a wasteful modeset and at boot.
> >
> > s/and at/at/ ?
> 
> Sure, I can correct if/when I respin or it can be corrected when landed.
> 
> > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > index 491c9c4f32d1..af3fb4657af6 100644
> > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > @@ -16,6 +16,7 @@
> > >  #include <linux/pm_runtime.h>
> > >  #include <linux/regmap.h>
> > >  #include <linux/regulator/consumer.h>
> > > +#include <linux/workqueue.h>
> > >
> > >  #include <asm/unaligned.h>
> > >
> > > @@ -130,6 +131,12 @@
> > >   * @ln_assign:    Value to program to the LN_ASSIGN register.
> > >   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> > >   *
> > > + * @pre_enabled_early: If true we did an early pre_enable at attach.
> > > + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> > > + *                           if a normal pre_enable never came.
> >
> > Could we simplify this by using the runtime PM autosuspend feature ? The
> > configuration of the bridge would be moved from pre_enable to the PM
> > runtime resume handler, the clk_disable_unprepare() call moved from
> > post_disable to the runtime suspend handler, and the work queue replaced
> > by usage of pm_runtime_put_autosuspend().
> 
> It's an interesting idea but I don't think I can make it work, at
> least not in a generic enough way. Specifically we can also use this
> bridge chip as a generic GPIO provider in Linux. When someone asks us
> to read a GPIO then we have to power the bridge on
> (pm_runtime_get_sync()) and when someone asks us to configure a GPIO
> as an output then we actually leave the bridge powered until they stop
> requesting it as an output. At the moment the only user of this
> functionality (that I know of) is for the HPD pin on trogdor boards
> (long story about why we don't use the dedicated HPD) but the API
> supports using these GPIOs for anything and I've tested that it works.
> It wouldn't be great to have to keep the panel on in order to access
> the GPIOs.

The issue you're trying to fix doesn't seem specific to this bridge, so
handling it in the bridge driver bothers me :-S Is there any way we
could handle this in the DRM core ? I don't want to see similar
implementations duplicated in all HDMI/DP bridges.

> The other problem is that I think the time scales are different. At
> boot time I think we'd want to leave the panel on for tens of seconds
> to give userspace a chance to start up and configure the panel. After
> userspace starts up I think we'd want autosuspend to be much faster.
> This could probably be solved by tweaking the runtime delay in code
> but I didn't fully dig because of the above problem.

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
