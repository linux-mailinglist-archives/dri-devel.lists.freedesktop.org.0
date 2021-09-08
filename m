Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AA50403890
	for <lists+dri-devel@lfdr.de>; Wed,  8 Sep 2021 13:11:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F3266E18F;
	Wed,  8 Sep 2021 11:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E4056E18F
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Sep 2021 11:11:28 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 m25-20020a7bcb99000000b002e751bcb5dbso1217873wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Sep 2021 04:11:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=raspberrypi.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1XPvlN/w5rw4NW/sVeYLFAWcn49tP72bXQarOjTRE8k=;
 b=PSKOvwZNIifvy444hFTjddco9EMIjQztIvP89NdC5gqIxrmLYFN5//1Xp9J88Ekabv
 w9Z6IDhsZ1Qx6oUD24UkICFVQn0lHsIxcx0AHv8H5ahDj7otRb41WOK2/BbHa8rFgRro
 IAwwawXzt8W/6F9DCRrK+chSa7Xj6bDH4EmyGrJQHvq9t0NqeRI32Q8bscyyHVdWdIYb
 wPE0Pyg/3CGZFsY377T+lpV8B0nGyvRhpY5SLVMHr1G6Aw9oDGWFxyRDM0JkgV5HxowR
 nOC8slb6AK9MJocXCv1lxB4EA8KoJOxbpfecCJLZ4fUdOe57opLVA1al5aBUM+SUXyQR
 rPIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1XPvlN/w5rw4NW/sVeYLFAWcn49tP72bXQarOjTRE8k=;
 b=hxD61mGAuOy2EeTH/TL4hUXUKt/uMy9sQy4S24C/ErJ4luj/k51BkHarnI85L3zBZb
 F24IaXFEiZFuXmY0LlrlkvbxJgFR68eSKOnFjaevXCgBSe6I9ii06iZpC9X2KHjyfa9E
 R+uXfCPNw4Lfnn+rpkxF9UbGPiz+X8OeLVSizF2XzVV1UJUXrOwZStFyQLXttpUQ8Ja2
 SX9yRcH2xnL3GAmtJ7x+yHPujcrnAaH1B+ZvFWdwFrb9G41HajaQuu0ZUk83C3IEAW67
 1mrY5o9ldDQ9RXKInK09eYTNBTSs+zhaJGc2Uk93l1holtYpH9TnREwZg1wVTBcJXcjt
 9Ccg==
X-Gm-Message-State: AOAM530Y5uq4EFINaxbjUrrth2ZbkSWfU8Y8WTJWQ7Pmw4yVUxhkJo42
 dfhCQsdF7u67gPZEhBGUGD4+I8uHLmq9dpFWB0hwaw==
X-Google-Smtp-Source: ABdhPJwo6CsJOqHxp22SoWavMhc1IcCyIbEXblkwbw9+hFZTkiz/JoB0gNoxzAIVUU+JhZZg+a0a4JvzVl3kvHD1brE=
X-Received: by 2002:a7b:c959:: with SMTP id i25mr3053276wml.55.1631099487113; 
 Wed, 08 Sep 2021 04:11:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210907023948.871281-1-marex@denx.de>
 <CGME20210907073151eucas1p196543fbd114f34f6de700013fd0e4168@eucas1p1.samsung.com>
 <2f530ec2-3781-67eb-6f34-c7b6a29641ea@samsung.com>
 <6544aaba-a3e3-f3f6-32d9-5c396df52601@denx.de>
 <9b3d6595-0330-f716-b443-95f3f4783ac4@samsung.com>
 <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
In-Reply-To: <2bf8e1fe-3f55-85ab-715a-c53ad98bb6d2@denx.de>
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 8 Sep 2021 12:11:11 +0100
Message-ID: <CAPY8ntBVdvHSofXcd7nU5Z4uCMUzmiMF3GmJn=VpLDVoe6xL2g@mail.gmail.com>
Subject: Re: [PATCH] drm/bridge: ti-sn65dsi83: Check link status register
 after enabling the bridge
To: Marek Vasut <marex@denx.de>
Cc: Andrzej Hajda <a.hajda@samsung.com>,
 DRI Development <dri-devel@lists.freedesktop.org>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Linus Walleij <linus.walleij@linaro.org>, Robert Foss <robert.foss@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Marek and Andrzej

On Tue, 7 Sept 2021 at 22:24, Marek Vasut <marex@denx.de> wrote:
>
> On 9/7/21 7:29 PM, Andrzej Hajda wrote:
> >
> > W dniu 07.09.2021 o 16:25, Marek Vasut pisze:
> >> On 9/7/21 9:31 AM, Andrzej Hajda wrote:
> >>> On 07.09.2021 04:39, Marek Vasut wrote:
> >>>> In rare cases, the bridge may not start up correctly, which usually
> >>>> leads to no display output. In case this happens, warn about it in
> >>>> the kernel log.
> >>>>
> >>>> Signed-off-by: Marek Vasut <marex@denx.de>
> >>>> Cc: Jagan Teki <jagan@amarulasolutions.com>
> >>>> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> >>>> Cc: Linus Walleij <linus.walleij@linaro.org>
> >>>> Cc: Robert Foss <robert.foss@linaro.org>
> >>>> Cc: Sam Ravnborg <sam@ravnborg.org>
> >>>> Cc: dri-devel@lists.freedesktop.org
> >>>> ---
> >>>> NOTE: See the following:
> >>>> https://e2e.ti.com/support/interface-group/interface/f/interface-forum/942005/sn65dsi83-dsi83-lvds-bridge---sporadic-behavior---no-video
> >>>>
> >>>> https://community.nxp.com/t5/i-MX-Processors/i-MX8M-MIPI-DSI-Interface-LVDS-Bridge-Initialization/td-p/1156533
> >>>>
> >>>> ---
> >>>>     drivers/gpu/drm/bridge/ti-sn65dsi83.c | 5 +++++
> >>>>     1 file changed, 5 insertions(+)
> >>>>
> >>>> diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>> b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>> index a32f70bc68ea4..4ea71d7f0bfbc 100644
> >>>> --- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>> +++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
> >>>> @@ -520,6 +520,11 @@ static void sn65dsi83_atomic_enable(struct
> >>>> drm_bridge *bridge,
> >>>>         /* Clear all errors that got asserted during initialization. */
> >>>>         regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> >>>>         regmap_write(ctx->regmap, REG_IRQ_STAT, pval);
> >>>
> >>>
> >>> It does not look as correct error handling, maybe it would be good to
> >>> analyze and optionally report 'unexpected' errors here as well.
> >>
> >> The above is correct -- it clears the status register because the
> >> setup might've set random bits in that register. Then we wait a bit,
> >> let the link run, and read them again to get the real link status in
> >> this new piece of code below, hence the usleep_range there. And then
> >> if the link indicates a problem, we know it is a problem.
> >
> >
> > Usually such registers are cleared on very beginning of the
> > initialization, and tested (via irq handler, or via reading), during
> > initalization, if initialization phase goes well. If it is not the case
> > forgive me.
>
> The init just flips the bit at random in the IRQ_STAT register, so no,
> that's not really viable here. That's why we clear them at the end, and
> then wait a bit, and then check whether something new appeared in them.
>
> If not, all is great.
>
> Sure, we could generate an IRQ, but then IRQ line is not always
> connected to this chip on all hardware I have available. So this gives
> the user at least some indication that something is wrong with their HW.
>
> >>>> +
> >>>> +    usleep_range(10000, 12000);
> >>>> +    regmap_read(ctx->regmap, REG_IRQ_STAT, &pval);
> >>>> +    if (pval)
> >>>> +        dev_err(ctx->dev, "Unexpected link status 0x%02x\n", pval);
> >>>
> >>>
> >>> I am not sure what is the case here but it looks like 'we do not know
> >>> what is going on, so let's add some diagnostic messages to gather info
> >>> and figure it out later'.
> >>
> >> That's pretty much the case, see the two links above in the NOTE
> >> section. If something goes wrong, we print the value for the user
> >> (usually developer) so they can fix their problems. We cannot do much
> >> better in the attach callback.
> >>
> >> The issue I ran into (and where this would be helpful information to
> >> me during debugging, since the issue happened real seldom, see also
> >> the NOTE links above) is that the DSI controller driver started
> >> streaming video on the data lanes before the DSI83 had a chance to
> >> initialize. This worked most of the time, except for a few exceptions
> >> here and there, where the video didn't start. This does set link
> >> status bits consistently. In the meantime, I fixed the controller
> >> driver (so far downstream, due to ongoing discussion).
> >
> >
> > Maybe drm_connector_set_link_status_property(conn,
> > DRM_MODE_LINK_STATUS_BAD) would be usefule here.
>
> Hmm, this works on connector, the dsi83 is a bridge and it can be stuck
> between two other bridges. That doesn't seem like the right tool, no ?
>
> >>> Whole driver lacks IRQ handler which IMO could perform better diagnosis,
> >>> and I guess it could also help in recovery, but this is just my guess.
> >>> So if this patch is enough for now you can add:
> >>
> >> No, IRQ won't help you here, because by the time you get the IRQ, the
> >> DSI host already started streaming video on data lanes and you won't
> >> be able to correctly reinit the DSI83 unless you communicate to the
> >> DSI host that it should switch the data lanes back to LP11.
> >>
> >> And for that, there is a bigger chunk missing really. What needs to be
> >> added is a way for the DSI bridge / panel to communicate its needs to
> >> the DSI host -- things like "I need DSI clock lane frequency f MHz, I
> >> need clock lane in HS mode and data lanes in LP11 mode". If you look
> >> at the way DSI hosts and bridges/panels work out the DSI link
> >> parameters, you will notice they basically do it each on their own,
> >> there is no such API or communication channel.
> >
> >
> > There is one-time communication channel via mipi_dsi_attach, it allows
> > to set max frequency i HS and LP, choose mode of operation (HS/LPM) and
> > few more things. If it is necessary to extend it please propse sth.
>
> Well, take for example the drivers/gpu/drm/exynos/exynos_drm_dsi.c ,
> there is this:
>
> static void exynos_dsi_enable(struct drm_encoder *encoder)
> ...
>                  list_for_each_entry_reverse(iter, &dsi->bridge_chain,
>                                              chain_node) {
>                          if (iter->funcs->pre_enable)
>                                  iter->funcs->pre_enable(iter);
> ...
>          exynos_dsi_set_display_mode(dsi);
>          exynos_dsi_set_display_enable(dsi, true);
> ...
>                  list_for_each_entry(iter, &dsi->bridge_chain, chain_node) {
>                          if (iter->funcs->enable)
>                                  iter->funcs->enable(iter);
>                  }
> ...
>
> So the bridge enable callback is called with clock lane already in HS
> mode, and data lanes streaming video. This doesn't work with the DSI83,
> which would need clock lane in HS and providing clock , but data lanes
> in LP11 with no video.
>
> Sure, I could probably move exynos_dsi_set_display_enable(dsi, true);
> after the enable call, but is that really the right solution ? What
> about bridges which need some other specific configuration of the data
> lanes during init ?

I hadn't noticed that Exynos was doing that.
vc4 DSI is doing the same thing in deliberately breaking the
panel/bridge chain so that it gets a chance to do some initialisation
before panel/bridge pre_enable.

Another issue I've noted in doing this is that it breaks calls to the
bridge's mode_set, mode_valid, and mode_fixup hooks. The framework
doesn't know about the bridges/panels beyond the encoder, and the
encoder doesn't get all the information required in order to replicate
those calls.
I'm about to look into whether switching the DSI host to being a
bridge instead of an encoder allows me to overcome that one.
Doing so doesn't solve the issue of the DSI host bridge pre_enable
being called after the panel/bridge pre_enable though.

> > Regarding requesting LP11 I am not sure if we really should have such
> > low level communication. LP11, as I remember ,is initial state in HS so
> > it should be set anyway, before starting video transmission.

LP-11 is the idle LP state. Both P and N lines of the pair are at
LP-high (~1.2V).
You then have an escape sequence to shift to HS mode (LP-01 for
T(lpx), LP-00 for T(hs-prepare), enable HS driver) when you are
wishing to send data bursts. The signalling levels for HS drop to
~100mV for low and ~300mV for high.

Add in ULPS which is effectively powered off but has a specific entry
and escape sequence to sleep/wake up the receiving device. ULPS seems
to be totally ignored in DRM as it seems to rely on regulator or other
control of the panel/bridge to power down.

> Well, see above, that's the problem I ran across recently.
>
> > And maybe this is the main problem:
> >
> > DRM core calls:
> >
> > crtc->enable
> >
> > bridges->pre_enable,
> >
> > encoder->enable,
> >
> > bridges->enable.
> >
> >
> > Usually video transmission starts in crtc->enable (CRTC->Encoder), and
> > in encoder->enable (encoder->bridge), so in bridges->enable it would be
> > too late for LP11 state - transmission can be already in progress.
> >
> > It shows well that this order of calls does not fit well to DSI, and
> > probably many other protocols.
> >
> > Maybe moving most of the bridge->enable code to bridge->pre_enable would
> > help, but I am not sur if it will not pose another issues.
>
> Yep, that won't work e.g. with the exynos DSIM, because
> exynos_dsi_set_display_mode() sets the data lanes to LP11.

Isn't the bigger question for SN65DSI8[3|4|5] whether the clock lane
is running or not in pre_enable?

> > This is quick analysis, so please fix me if I am wrong.
>
> I pretty much agree that the current state of things does not fit with
> DSI too well.

That was why I was questioning how DSI was meant to be implemented in
https://lore.kernel.org/dri-devel/CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com/

The need to have the DSI host in a defined idle state (often LP-11,
but varying whether the clock lane is in HS) before powering up the
panel/bridge is incredibly common, but currently undefined in DRM.

Taking the SN65DSI83 as an example, the datasheet [1] section 7.4.2
states that the clock lane must be in HS mode, and data lanes in LP-11
when coming out of reset. That means that we can't be "enable" as that
will have the data lanes in HS mode and sending video, and as we can't
be in "pre_enable" as the DSI PHY will be powered down and so we won't
have the clock lanes in HS mode.

I've hit a similar one with the Toshiba TC358762 where it seems to get
upset if it is receiving video data when it gets configured.
panel-raspberrypi-touchscreen[2] which drives that chip is
intermittent when using panel enable, whereas panel prepare is
significantly more reliable but relies on the DSI host being
initialised to LP-11 by breaking the chain.

  Dave

[1] https://www.ti.com/lit/ds/symlink/sn65dsi83.pdf
[2] https://github.com/torvalds/linux/blob/master/drivers/gpu/drm/panel/panel-raspberrypi-touchscreen.c
