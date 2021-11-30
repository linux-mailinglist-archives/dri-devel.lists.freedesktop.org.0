Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B604636A8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Nov 2021 15:30:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9707B6E56D;
	Tue, 30 Nov 2021 14:30:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.domeneshop.no (smtp.domeneshop.no
 [IPv6:2a01:5b40:0:3005::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EAEF6E56D
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Nov 2021 14:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tronnes.org
 ; s=ds202012;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6NOP2+DTQqJWzYfZgacKEgawyS+7L+fJvsJ6rTKXdLA=; b=j7pBp3prUgC8J+CyT27U6yBxWL
 f9l91X9YIQR564dtipwHIhD73fYvzpJ2JDdhfdmq1rX62pRinDd+BIhZuofrvpzlk9DjdI6uZ7WsD
 PXbdZw7MILI7XEcN7+yYfy4deReYWUGwgwNQV9mJLRrvUms4B1IFDfdnkfGf+c1AlIlW441rici04
 y2ZtxvAEGLO3vw32r4WjLN7tpA1Om6YcWtO1YjCjm5jCLIyu8JlQHqxJGzCEaJrAG+5uj65KDqheg
 kYFbEQpzl8t5adFU31Ua3brPbjOeoCpcZJaMdxoA39iqIiPTIu2Th6BJAJGD07rghO9tFTynJ7/TB
 MnusnHQQ==;
Received: from 211.81-166-168.customer.lyse.net ([81.166.168.211]:52436
 helo=[192.168.10.61])
 by smtp.domeneshop.no with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <noralf@tronnes.org>)
 id 1ms498-0000G2-JT; Tue, 30 Nov 2021 15:30:14 +0100
Message-ID: <ca9e432a-6b04-9935-2469-135a9b47514e@tronnes.org>
Date: Tue, 30 Nov 2021 15:30:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 0/6] drm/tiny/st7735r: Match up with staging/fbtft driver
To: Maxime Ripard <maxime@cerno.tech>, David Lechner <david@lechnology.com>
References: <20211124150757.17929-1-noralf@tronnes.org>
 <eba23198-5c52-6520-079b-d2d41f71dc25@lechnology.com>
 <20211129093946.xhp22mvdut3m67sc@houat>
From: =?UTF-8?Q?Noralf_Tr=c3=b8nnes?= <noralf@tronnes.org>
In-Reply-To: <20211129093946.xhp22mvdut3m67sc@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: devicetree@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dave.stevenson@raspberrypi.com, linux-staging@lists.linux.dev,
 dri-devel@lists.freedesktop.org, robh+dt@kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Den 29.11.2021 10.39, skrev Maxime Ripard:
> Hi,
> 
> On Wed, Nov 24, 2021 at 04:03:07PM -0600, David Lechner wrote:
>> On 11/24/21 9:07 AM, Noralf Trønnes wrote:
>>> This patchset adds a missing piece for decommissioning the
>>> staging/fbtft/fb_st7735r.c driver namely a way to configure the
>>> controller from Device Tree.
>>>
>>> All fbtft drivers have builtin support for one display panel and all
>>> other panels using that controller are configured using the Device Tree
>>> 'init' property. This property is supported by all fbtft drivers and
>>> provides a generic way to set register values or issue commands
>>> (depending on the type of controller).
>>>
>>> It is common for these types of displays to have a datasheet listing the
>>> necessary controller settings/commands or some example code doing the
>>> same.
>>>
>>> This is how the panel directly supported by the fb_st7735r staging
>>> driver is described using Device Tree with that driver:
>>>
>>>      width = <160>;
>>>      height = <128>;
>>>
>>>      init = <0x1000001
>>>              0x2000096
>>>              0x1000011
>>>              0x20000ff
>>>              0x10000B1 0x01 0x2C 0x2D
>>>              0x10000B4 0x07
>>>              0x10000C0 0xA2 0x02 0x84
>>>              0x10000C1 0xC5
>>>              0x10000C2 0x0A 0x00
>>>              0x10000C5 0x0E
>>>              0x100003a 0x55
>>>              0x1000036 0x60
>>>              0x10000E0 0x0F 0x1A 0x0F 0x18 0x2F 0x28 0x20 0x22
>>>                        0x1F 0x1B 0x23 0x37 0x00 0x07 0x02 0x10
>>>              0x10000E1 0x0F 0x1B 0x0F 0x17 0x33 0x2C 0x29 0x2E
>>>                        0x30 0x30 0x39 0x3F 0x00 0x07 0x03 0x10
>>>              0x1000029
>>>              0x2000064>;
>>>
>>>
>>> This is how the same panel is described using the st7735r drm driver and
>>> this patchset:
>>>
>>>      width = <160>;
>>>      height = <128>;
>>>
>>>      frmctr1 = [ 01 2C 2D ];
>>>      invctr = [ 07 ];
>>>      pwctr1 = [ A2 02 84 ];
>>>      pwctr2 = [ C5 ];
>>>      pwctr3 = [ 0A 00 ];
>>>      vmctr1 = [ 0E ];
>>>      madctl = [ 60 ];
>>>      gamctrp1 = [ 0F 1A 0F 18 2F 28 20 22 1F 1B 23 37 00 07 02 10 ];
>>>      gamctrn1 = [ 0F 1B 0F 17 33 2C 29 2E 30 30 39 3F 00 07 03 10 ];
>>
>> Do these setting correspond to actual physical properties of the display?
>>
>> What is the advantage of this compared to just adding a new compatible
>> string if a new display requires different settings? (Other than being
>> able to use a new display without compiling a new kernel/module.)
>>
>> It is nice for the driver implementation to be able to use the byte
>> arrays from the binding directly, but it doesn't really make sense from
>> a "device tree describes the hardware" point of view.
>>
>> For example, looking at the data sheet, frmctr1 looks like it is actually
>> multiple properties, the 1-line period, front porch and back porch.
> 
> You're right, but we have two sets of problems that we want to solve,
> and so far the discussion has only been to address one while ignoring
> the other.
> 
> The solution you suggested works great for the problem the kernel is
> facing: we want a solution that is easy to maintain over the long run,
> while being reliable. Thus, we want to introduce a compatible for each
> panel, that will allow us to describe the panel in the DT without
> exposing too much data, the data being in the kernel.
> 
> This works great over the long run because we can update and fix any
> problem we might have had, send them to stable, etc. It's awesome, but
> it's mostly centered on us, the developers and maintainers.
> 
> 
> The problem that fbtft (and this series) wants to fix is completely
> different though: it wants to address the issue the users are facing.
> Namely, you get a cheap display from wherever, connect it to your shiny
> new SBC and wants to get something on the display.
> 
> In this situation, the user probably doesn't have the knowledge to
> introduce the compatible in the kernel in the first place. But there's
> also some technical barriers there: if they use secure boot, they can't
> change the kernel (well, at least the knowledge required is far above
> what we can expect from the average user). If the platform doesn't allow
> access to the DT, you can't change the DT either.
> 

Like Geert I wondered about this statement, since you need to change the
DT to use such a display. But if you count overlays as not changing the
DT, ok.

> Let's set aside those constraints for a moment though. For most of these
> devices, you wouldn't even be able to come up with a proper compatible.
> All of those displays are typically a panel and a controller glued
> together, and the exact initialization sequence depends on both. The
> panel is never really mentioned, neither is its manufacturer, or its
> exact product id. In other words, we wouldn't be able to come up with a
> good compatible for them.
> 
> Let's now assume we do have access to all those info and can come up
> with a good, upstreamable, compatible. We now require the user to
> contribute it upstream, and then expect them to wait for 1-2 years for
> that patch to show up in their distribution of choice.
> 
> And then, if we were to get those patches, chances are we don't really
> want them anyway since we would be drowning in those small patches
> no-one really wants to review.
> 
> 
> So yeah, the solution we have is probably a good solution for "real"
> panels, glued to a device (and even then, the recent discussion around
> panel-edp shows that it has a few shortcomings). But it's a *terrible*
> solution for all parties involved when it comes to those kind of
> displays.
> 

Really good writeup of the situation Maxime!

> 
> I agree that it doesn't really fit in the DT either though. Noralf, what
> kind of data do we need to setup a display in fbtft? The init sequence,
> and maybe some enable/reset GPIO, plus some timing duration maybe?
> 
> There's one similar situation I can think of: wifi chips. Those also
> need a few infos from the DT (like what bus it's connected to, enable
> GPIO, etc) and a different sequence (firmware), sometimes different from
> one board to the other.
> 
> Could we have a binding that would be something like:
> 
> panel@42 {
> 	 compatible = "panel-spi";
> 	 model = "panel-from-random-place-42";
> 	 enable-gpios = <&...>;
> }
> 
> And then, the driver would request the init sequence through the
> firmware mechanism using a name generated from the model property.
> 
> It allows to support multiple devices in a given system, since the
> firmware name wouldn't conflict, it makes a decent binding, and users
> can adjust the init sequence easily (maybe with a bit of tooling)
> 
> Would that work?
> 

I really like this idea. An added benefit is that one driver can handle
all MIPI DBI compatible controllers avoiding the need to do a patchset
like this for all the various MIPI DBI controllers. The firmware will
just contain numeric commands with parameters, so no need for different
controller drivers to handle the controller specific command names.

The following is a list of the MIPI DBI compatible controllers currently
in staging/fbtft: ili9341, hx8357d, st7735r, ili9163, ili9163, ili9163,
ili9163, ili9486, ili9481, tinylcd, s6d02a1, s6d02a1, hx8340bn, ili9340.

The compatible needs to be a bit more specific though since there are 2
major SPI protocols for these display: MIPI DBI and the one used by
ILI9325 and others.

The full binding would be something like this:

panel@42 {
	compatible = "panel-mipi-dbi-spi";
	model = "panel-from-random-place-42";

	/* The MIPI DBI spec lists these powers supply pins */
	vdd-supply = <&...>;
	vddi-supply = <&...>;

	/* Optional gpio to drive the RESX line */
	reset-gpios = <&...>;

	/*
	 * D/CX: Data/Command, Command is active low
	 * Abcense: Interface option 1 (D/C embedded in 9-bit word)
	 * Precense: Interface option 3
	 */
	dc-gpios = <&...>;

	/*
	 * If set the driver won't try to read from the controller to see
	 * if it's already configured by the bootloader or previously by
	 * the driver. A readable controller avoids flicker and/or delay
	 * enabling the pipeline.
	 *
	 * This property might not be necessary if we are guaranteed to
	 * always read back all 1's or 0's when MISO is not connected.
	 * I don't know if all setups can guarantee that.
	 */
	write-only;

	/* Optional ref to backlight node */
	backlight = <&...>;
}

Many of these controllers also have a RGB interface option for the
pixels and only do configuration over SPI.
Maybe the compatible should reflect these 2 options somehow?

Noralf.
