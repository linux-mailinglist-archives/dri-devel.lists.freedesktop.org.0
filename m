Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D83D748B14
	for <lists+dri-devel@lfdr.de>; Wed,  5 Jul 2023 19:56:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 810A110E3A8;
	Wed,  5 Jul 2023 17:56:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay2-1.pub.mailoutpod2-cph3.one.com
 (mailrelay2-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:401::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B3610E3A8
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Jul 2023 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=iBBtnRklVqMQ6mkde8T1v6wMY0Ar5kLbR8KuMGyUvyw=;
 b=GF90gPCvd8mEOngfUgQ59M+s5yRlPK7b2PnKpmpMnIjBFMszO4/vVi8TdAIN+T4XXNDIBa1cEljQA
 OaSgSWv9V4iO8aiBOkixFILrXIigudR1NAANlPev2komLg+lvFqYkKOVyw7dU7ciKRpuqOHuixtnCW
 azZqlkQw7SLDnFd7RdJeupMSRKwpLduu1VjDes2+Uu4ZiuWiF5OVKEMq/tcdLBTBfw+JfSicHqDQRF
 IYTpvxpmZ4rv107iezXfjqLdQ70qXOdVeeOroTWIh77DcdHy3MseQ9mAmn9v98uk2Ze+Mtd90bG0HJ
 Rb3zZy+8jWl2H1z2nLf+tQcWtCzHKvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed1;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=iBBtnRklVqMQ6mkde8T1v6wMY0Ar5kLbR8KuMGyUvyw=;
 b=/U4cLTc4mm2o+4LrKjw/bJrmBsg6NMPgQJ9mg4yrxISURD04T/fLHemun271zeTYH/jq/QmT2Kf1V
 /gOZs4QCA==
X-HalOne-ID: 4359365c-1b5d-11ee-87e5-5ba399456a4a
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay2 (Halon) with ESMTPSA
 id 4359365c-1b5d-11ee-87e5-5ba399456a4a;
 Wed, 05 Jul 2023 17:56:28 +0000 (UTC)
Date: Wed, 5 Jul 2023 19:56:27 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Daniel Thompson <daniel.thompson@linaro.org>
Subject: Re: [PATCH] backlight: led_bl: fix initial power state
Message-ID: <20230705175627.GD106478@ravnborg.org>
References: <20230704140750.25799-1-mans@mansr.com>
 <20230704150310.GA385243@aspen.lan>
 <20230704170731.GB940443@ravnborg.org>
 <20230705140731.GB6265@aspen.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230705140731.GB6265@aspen.lan>
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
Cc: linux-fbdev@vger.kernel.org, Mans Rullgard <mans@mansr.com>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Tomi Valkeinen <tomi.valkeinen@ti.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Daniel,

On Wed, Jul 05, 2023 at 03:07:31PM +0100, Daniel Thompson wrote:
> On Tue, Jul 04, 2023 at 07:07:31PM +0200, Sam Ravnborg wrote:
> > Hi Daniel,
> >
> > > > @@ -200,8 +200,8 @@ static int led_bl_probe(struct platform_device *pdev)
> > > >  	props.type = BACKLIGHT_RAW;
> > > >  	props.max_brightness = priv->max_brightness;
> > > >  	props.brightness = priv->default_brightness;
> > > > -	props.power = (priv->default_brightness > 0) ? FB_BLANK_POWERDOWN :
> > > > -		      FB_BLANK_UNBLANK;
> > > > +	props.power = (priv->default_brightness > 0) ? FB_BLANK_UNBLANK :
> > > > +		      FB_BLANK_POWERDOWN;
> > >
> > > The logic was wrong before but I think will still be wrong after the
> > > change too (e.g. the bogus logic is probably avoiding backlight flicker
> > > in some use cases).
> > >
> > > The logic here needs to be similar to what pwm_bl.c implements in
> > > pwm_backlight_initial_power_state(). Whilst it might be better
> > > to implement this in led_bl_get_leds() let me show what I mean
> > > in code that fits in the current line:
> > >
> > > 	/*
> > > 	 * Activate the backlight if the LEDs are already lit *or*
> > > 	 * there is no phandle link (meaning the backlight power
> > > 	 * state cannot be synced with the display state).
> > > 	 */
> > > 	props.power = (active_at_boot || !dev->node->phandle) ?
> > > 			FB_BLANK_UNBLANK : FB_BLANK_POWERDOWN;
> > >
> > The following code does the same using helpers:
> >
> > 	if (active_at_boot || !dev->node->phandle))
> > 		backlight_enable(bd);
> > 	else
> > 		backlight_disable(bd);
> >
> > The code needs to execute after backlight_device_register() so maybe not
> > so great an idea?!?
> 
> It would introduce a need for a bunch of new locks since userspace
> could get in between device creation and the call to the helpers.
I thought we were safe while in the probe function, but I have been
fooled by the driver model before.

> 
> Additionally, it is even correct for a driver to forcefully set
> fb_blank to powerdown during the probe? All current drivers set
> fb_blank to unblank during the probe.
fb_blank is more or less unused. I thought that Lee applied the patch set
to eliminate most users, but I see that this is not the case.
I need to resend one day.
Some (at least one) drivers update .power after registering the device, so if this
is racy then these drivers could use some care.

Anyway, looking at how many drivers access backlight_properties direct is
is futile to try to avoid it. So the approach you suggest seems the best
way to do it.

	Sam
