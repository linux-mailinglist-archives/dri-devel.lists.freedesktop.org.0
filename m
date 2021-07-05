Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 03A263BB9A4
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jul 2021 10:53:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA923892B6;
	Mon,  5 Jul 2021 08:53:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE865892B6
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jul 2021 08:53:14 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10035"; a="208903296"
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="208903296"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 01:53:14 -0700
X-IronPort-AV: E=Sophos;i="5.83,325,1616482800"; d="scan'208";a="496051535"
Received: from elang-mobl.ger.corp.intel.com (HELO localhost) ([10.252.59.138])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jul 2021 01:53:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Subject: Re: Questions over DSI within DRM.
In-Reply-To: <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CAPY8ntBUKRkSam59Y+72dW_6XOeKVswPWffzPj3uvgE6pV4ZGQ@mail.gmail.com>
 <YN9BxNP5IfhbJGGk@pendragon.ideasonboard.com>
Date: Mon, 05 Jul 2021 11:52:59 +0300
Message-ID: <87im1p9m6s.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 02 Jul 2021, Laurent Pinchart <laurent.pinchart@ideasonboard.com> wrote:
> On Fri, Jul 02, 2021 at 12:03:31PM +0100, Dave Stevenson wrote:
>> Hi All
>> 
>> I'm trying to get DSI devices working reliably on the Raspberry Pi,
>> but I'm hitting a number of places where it isn't clear as to the
>> expected behaviour within DRM.
>
> Not a surprise. I dread reading the rest of this e-mail though :-)

Indeed.

I'll just note that i915 is *not* a prime example to look at. We
basically just abuse the abstractions as helpers. We have one
parametrized panel driver with both the DSI host and device embedded in
i915, instead of one panel device driver per panel.

>> Power on state. Many devices want the DSI clock and/or data lanes in
>> LP-11 state when they are powered up.
>
> When they are powered up, or when they are enabled ?
>
>> With the normal calling sequence of:
>> - panel/bridge pre_enable calls from connector towards the encoder.
>> - encoder enable which also enables video.
>> - panel/bridge enable calls from encoder to connector.
>> there is no point at which the DSI tx is initialised but not
>> transmitting video. What DSI states are expected to be adopted at each
>> point?
>
> That's undefined I'm afraid, and it should be documented. The upside is
> that you can propose the behaviour that you need :-)
>
>> On a similar theme, some devices want the clock lane in HS mode early
>> so they can use it in place of an external oscillator, but the data
>> lanes still in LP-11. There appears to be no way for the
>> display/bridge to signal this requirement or it be achieved.
>
> You're right. A loooong time ago, the omapdrm driver had an internal
> infrastructure that didn't use drm_bridge or drm_panel and instead
> required omapdrm-specific drivers for those components. It used to model
> the display pipeline in a different way than drm_bridge, with the sync
> explicitly setting the source state. A DSI sink could thus control its
> enable sequence, interleaving programming of the sink with control of
> the source.
>
> Migrating omapdrm to the drm_bridge model took a really large effort,
> which makes me believe that transitioning the whole subsystem to
> sink-controlled sources would be close to impossible. We could add
> DSI-specific operations, or add another enable bridge operation
> (post_pre_enable ? :-D). Neither would scale, but it may be enough.

There's also quite a wide range of DSI abstraction in hardware. IIRC in
omapdrm you need to control the LP and ULPS etc. yourself in the driver,
while in i915 the hardware does quite a bunch of stuff for you. Any drm
level abstraction that does not take this into account will get in the
way.

BR,
Jani.

>> host_transfer calls can supposedly be made at any time, however unless
>> MIPI_DSI_MSG_USE_LPM is set in the message then we're meant to send it
>> in high speed mode. If this is before a mode has been set, what
>> defines the link frequency parameters at this point? Adopting a random
>> default sounds like a good way to get undefined behaviour.
>> 
>> DSI burst mode needs to set the DSI link frequency independently of
>> the display mode. How is that meant to be configured? I would have
>> expected it to come from DT due to link frequency often being chosen
>> based on EMC restrictions, but I don't see such a thing in any
>> binding.
>
> Undefined too. DSI support was added to DRM without any design effort,
> it's more a hack than a real solution. The issue with devices that can
> be controlled over both DSI and I2C is completely unhandled. So far
> nobody has really cared about implementing DSI right as far as I can
> tell.
>
>> As a follow on, bridge devices can support burst mode (eg TI's
>> SN65DSI83 that's just been merged), so it needs to know the desired
>> panel timings for the output side of the bridge, but the DSI link
>> timings to set up the bridge's PLL. What's the correct way for
>> signalling that? drm_crtc_state->adjusted_mode vs
>> drm_crtc_state->mode? Except mode is userspace's request, not what has
>> been validated/updated by the panel/bridge.
>
> adjusted_mode is also a bit of a hack, it solves very specific issues,
> and its design assumes a single encoder in the chain with no extra
> bridges. We should instead add modes to the bridge state, and negotiate
> modes along the pipeline the same way we negotiate formats.
>
>> vc4 has constraints that the DSI host interface is fed off an integer
>> divider from a typically 3GHz clock, so the host interface needs to
>> signal that burst mode is in use even if the panel/bridge doesn't need
>> to run in burst mode. (This does mean that displays that require a
>> very precise link frequency can not be supported).
>> It currently updates the adjusted_mode via drm_encoder_helper_funcs
>> mode_fixup, but is that the correct thing to do, or is there a better
>> solution?
>> I'd have expected the DSI tx to be responsible for configuring burst
>> mode parameters anyway, so the mechanism required would seem to be
>> just the normal approach for adopting burst mode if that is defined.
>> 
>> Some DSI host interfaces are implemented as bridges, others are
>> encoders. Pro's and con's of each? I suspect I'm just missing the
>> history here.
>
> It's indeed history. drm_encoder can't go away as it has been erronously
> exposed to userspace, but going forward, everything should be a bridge.
> The drm_encoder will still be required, but should just be a dummy,
> representing the chain of bridges.
>
>> When it comes to the MIPI_DSI_MODE_* flags, which ones are mutually
>> exclusive, or are assumed based on others? Does a burst mode DSI sink
>> set both MIPI_DSI_MODE_VIDEO and MIPI_DSI_MODE_VIDEO_BURST, or just
>> the latter?
>> Presumably !MIPI_DSI_MODE_VIDEO signals the of use command mode for
>> conveying video. So looking at panel-ilitek-ili9881c where it sets
>> just MIPI_DSI_MODE_VIDEO_SYNC_PULSE means command mode video with sync
>> pulses? That sounds unlikely.
>
> I haven't looked at that, I'm afraid I don't know.
>
>> I have looked for any information that covers this, but failed to find
>> such, hence calling on all your expertise.
>
> I'm sorry for the lack of solutions to your issues. I can try to help
> solving them though.

-- 
Jani Nikula, Intel Open Source Graphics Center
