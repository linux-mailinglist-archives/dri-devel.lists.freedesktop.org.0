Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AF134DF25
	for <lists+dri-devel@lfdr.de>; Tue, 30 Mar 2021 05:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7A3B6E841;
	Tue, 30 Mar 2021 03:20:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [213.167.242.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B727C6E83B
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Mar 2021 03:20:14 +0000 (UTC)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi
 [62.78.145.57])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 61137292;
 Tue, 30 Mar 2021 05:20:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1617074412;
 bh=0NCp+oS2yKHTWjY6V/e8YEJ2x/cpePCidqcLVOSx/Ug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1cIigPh06lUcidHJUmLtkjbiPA3sgVfOJIsKTGjPeVnum59B5AGGaHhOEKGZ1hjX
 2r0IwKTffjqKZv695+SZwMqd4a/1lAzurdBWno5ODxg1DOUhIIpcoBf5hovxv1y6gG
 nApwpOspq0zFAYQkJLdymwm+g1WqxUGUJnK4u/Z8=
Date: Tue, 30 Mar 2021 06:19:28 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Doug Anderson <dianders@chromium.org>
Subject: Re: [PATCH 3/3] drm/bridge: ti-sn65dsi86: Properly get the EDID, but
 only if refclk
Message-ID: <YGKYwJf/7kWlaoDD@pendragon.ideasonboard.com>
References: <20210304155144.1.Ic9c04f960190faad5290738b2a35d73661862735@changeid>
 <20210304155144.3.I60a7fb23ce4589006bc95c64ab8d15c74b876e68@changeid>
 <YE0ru4JpXfX/4Awe@pendragon.ideasonboard.com>
 <CAD=FV=UY_S8jPkXwK6AGs99XrE=pno2sCgLE7qcPWfmoyYVXiw@mail.gmail.com>
 <YFEnKgwEOWdeQBK6@pendragon.ideasonboard.com>
 <CAD=FV=W5fpyEf4AqJ+dZ7i_rD_PE40MyNsYNydhPi4BHkEfQcQ@mail.gmail.com>
 <CAD=FV=UOk-PUREc-UOPqUDuhPAEUsBfx0LOAQHd9KkLAhpr7Tg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAD=FV=UOk-PUREc-UOPqUDuhPAEUsBfx0LOAQHd9KkLAhpr7Tg@mail.gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>,
 Jernej Skrabec <jernej.skrabec@siol.net>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Neil Armstrong <narmstrong@baylibre.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Andrzej Hajda <a.hajda@samsung.com>,
 Sam Ravnborg <sam@ravnborg.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Doug,

On Mon, Mar 29, 2021 at 07:57:05PM -0700, Doug Anderson wrote:
> On Tue, Mar 16, 2021 at 5:44 PM Doug Anderson wrote:
> > On Tue, Mar 16, 2021 at 2:46 PM Laurent Pinchart wrote:
> > > On Mon, Mar 15, 2021 at 09:25:37AM -0700, Doug Anderson wrote:
> > > > On Sat, Mar 13, 2021 at 1:17 PM Laurent Pinchart wrote:
> > > > > On Thu, Mar 04, 2021 at 03:52:01PM -0800, Douglas Anderson wrote:
> > > > > > In commit 58074b08c04a ("drm/bridge: ti-sn65dsi86: Read EDID blob over
> > > > > > DDC") we attempted to make the ti-sn65dsi86 bridge properly read the
> > > > > > EDID from the panel. That commit kinda worked but it had some serious
> > > > > > problems.
> > > > > >
> > > > > > The problems all stem from the fact that userspace wants to be able to
> > > > > > read the EDID before it explicitly enables the panel. For eDP panels,
> > > > > > though, we don't actually power the panel up until the pre-enable
> > > > > > stage and the pre-enable call happens right before the enable call
> > > > > > with no way to interject in-between. For eDP panels, you can't read
> > > > > > the EDID until you power the panel. The result was that
> > > > > > ti_sn_bridge_connector_get_modes() was always failing to read the EDID
> > > > > > (falling back to what drm_panel_get_modes() returned) until _after_
> > > > > > the EDID was needed.
> > > > > >
> > > > > > To make it concrete, on my system I saw this happen:
> > > > > > 1. We'd attach the bridge.
> > > > > > 2. Userspace would ask for the EDID (several times). We'd try but fail
> > > > > >    to read the EDID over and over again and fall back to the hardcoded
> > > > > >    modes.
> > > > > > 3. Userspace would decide on a mode based only on the hardcoded modes.
> > > > > > 4. Userspace would ask to turn the panel on.
> > > > > > 5. Userspace would (eventually) check the modes again (in Chrome OS
> > > > > >    this happens on the handoff from the boot splash screen to the
> > > > > >    browser). Now we'd read them properly and, if they were different,
> > > > > >    userspace would request to change the mode.
> > > > > >
> > > > > > The fact that userspace would always end up using the hardcoded modes
> > > > > > at first significantly decreases the benefit of the EDID
> > > > > > reading. Also: if the modes were even a tiny bit different we'd end up
> > > > > > doing a wasteful modeset and at boot.
> > > > >
> > > > > s/and at/at/ ?
> > > >
> > > > Sure, I can correct if/when I respin or it can be corrected when landed.
> > > >
> > > > > > diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > > index 491c9c4f32d1..af3fb4657af6 100644
> > > > > > --- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > > +++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
> > > > > > @@ -16,6 +16,7 @@
> > > > > >  #include <linux/pm_runtime.h>
> > > > > >  #include <linux/regmap.h>
> > > > > >  #include <linux/regulator/consumer.h>
> > > > > > +#include <linux/workqueue.h>
> > > > > >
> > > > > >  #include <asm/unaligned.h>
> > > > > >
> > > > > > @@ -130,6 +131,12 @@
> > > > > >   * @ln_assign:    Value to program to the LN_ASSIGN register.
> > > > > >   * @ln_polrs:     Value for the 4-bit LN_POLRS field of SN_ENH_FRAME_REG.
> > > > > >   *
> > > > > > + * @pre_enabled_early: If true we did an early pre_enable at attach.
> > > > > > + * @pre_enable_timeout_work: Delayed work to undo the pre_enable from attach
> > > > > > + *                           if a normal pre_enable never came.
> > > > >
> > > > > Could we simplify this by using the runtime PM autosuspend feature ? The
> > > > > configuration of the bridge would be moved from pre_enable to the PM
> > > > > runtime resume handler, the clk_disable_unprepare() call moved from
> > > > > post_disable to the runtime suspend handler, and the work queue replaced
> > > > > by usage of pm_runtime_put_autosuspend().
> > > >
> > > > It's an interesting idea but I don't think I can make it work, at
> > > > least not in a generic enough way. Specifically we can also use this
> > > > bridge chip as a generic GPIO provider in Linux. When someone asks us
> > > > to read a GPIO then we have to power the bridge on
> > > > (pm_runtime_get_sync()) and when someone asks us to configure a GPIO
> > > > as an output then we actually leave the bridge powered until they stop
> > > > requesting it as an output. At the moment the only user of this
> > > > functionality (that I know of) is for the HPD pin on trogdor boards
> > > > (long story about why we don't use the dedicated HPD) but the API
> > > > supports using these GPIOs for anything and I've tested that it works.
> > > > It wouldn't be great to have to keep the panel on in order to access
> > > > the GPIOs.
> > >
> > > The issue you're trying to fix doesn't seem specific to this bridge, so
> > > handling it in the bridge driver bothers me :-S Is there any way we
> > > could handle this in the DRM core ? I don't want to see similar
> > > implementations duplicated in all HDMI/DP bridges.
> >
> > Yes, it is true that this problem could affect other drivers.  ...and
> > in full disclosure I think there are other similar workarounds already
> > present. I haven't personally worked on those chips, but in
> > ps8640_bridge_get_edid() there is a somewhat similar workaround to
> > chain a pre-enable (though maybe it's not quite as optimized?). I'm
> > told that maybe something had to be handled for anx7625 (in
> > anx7625_get_edid()?) but that definitely doesn't look at all like it's
> > doing a pre-enable, so maybe things for that bridge just work
> > differently.
> >
> > One thing that makes me hesitant about trying to moving this to the
> > core is that even in sn65dsi86 there is a case where it won't work. As
> > I mentioned in the patch I'm not aware of anyone using it in
> > production, but if someone was using the MIPI clock as input to the
> > bridge chip instead of a fixed "refclk" then trying to get the EDID
> > after just "pre-enable" falls over.  Said another way: I can say that
> > with this particular bridge chip, if you're using a fixed refclk, you
> > can read the EDID after the pre-enable. I don't know if that's always
> > true with all other bridge chips.
> >
> > So I guess in summary: I think I could put my code in the core, but I
> > don't _think_ I can just make it automatically enabled.
> >
> > * In sn65dsi I'd have to only enable it if we have a fixed refclk.
> >
> > * Maybe in ps8640 I could just always enable it and replace the
> > existing code? I'd have to find someone to test.
> >
> > * In anx7625 things look totally different.
> >
> > Can you give me any advice on how you'd like me to proceed?
> 
> OK, I've got something that maybe looks better. You can tell me what
> you think [1]. I did manage to use PM Runtime to avoid some of the
> complexity and I put that usage in simple-panel. We'll see if I get
> yelled at for adding more to simple-panel. ;-P
> 
> [1] https://lore.kernel.org/dri-devel/20210330025345.3980086-1-dianders@chromium.org/

Nice :-)

I'm unfortunately afraid I'm quite busy these days. Could you ping me in
a few weeks if I haven't reviewed the series ?

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
