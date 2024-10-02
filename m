Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7061398CE86
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:13:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A476310E6BF;
	Wed,  2 Oct 2024 08:13:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="sn+z/ssW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 81B7110E6BF
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:13:17 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 8F7425C1002;
 Wed,  2 Oct 2024 08:13:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01D1EC4CEC5;
 Wed,  2 Oct 2024 08:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727856796;
 bh=0Fuegf+4LGhXY7pGtYPrwvIVuy6Iryts5YYCIpBeovw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=sn+z/ssWTC3TTKS2eh4R7D/ZXCb2GFt07Dk78tNVgyd6Xnth6p0+ejWyTmmn5U7NO
 c7PB9uSPA8bpKouTKjQ3grb3QL4p3q5G1gcZ+c/tRZhOQTzS+1EtYlOPNl+9S41KR+
 LjVEbHdCsOqSJnTvqx3wRChobvgcKFAJ7UnDyvwiJp9h6aDVbN09kxYaB3fNKSnEvf
 zK/T2/XR0z5NSEgsm8H2h6inVS/qyD7CbEzBg6PAzkAvqvDQaViyRKqhqIuVXGLrtL
 g0Ph4Qftns8Sr2FVKnWS14h+9hfGE6VA/KwgMd8FF6QsJSXPeCGeTZ4ElzQ4uMEs6w
 WRyRdInhJ9Q+A==
Date: Wed, 2 Oct 2024 10:13:10 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: Werner Sembach <wse@tuxedocomputers.com>, Armin Wolf <W_Armin@gmx.de>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>
References: <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
 <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
 <586a1c41-bbe0-4912-b7c7-1716d886c198@tuxedocomputers.com>
 <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
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

On Oct 01 2024, Pavel Machek wrote:
> Hi!
> 
> > PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> > all of the requirements here:
> > - need to be dynamic
> > - still unsure of the userspace implementation, meaning that userspace
> >   might do something wrong, which might require kernel changes
> > - possibility to extend later the kernel API
> > - lots of fun :)
> 
> Please don't do this.
> 
> We have real drivers for framebuffers. We don't make them emulate
> USB-display devices.

Except that they are not framebuffer for multiple reasons. I know you
disagree, but the DRM maintainers gave a strong NACK already for a
DRM-like interface, and the auxdisplay would need some sort of tweaking
that is going too far IMO (I'll explain below why I believe this).

> 
> Yes, this is a small display, and somewhat unusual with weird pixel
> positions, but it is common enough that we should have real driver for
> that, with real API.

It's not just weird pixel positions. It's also weird shapes. How are you
going to fit the space bar in a grid, unless you start saying that it
spans accross several pixels. But then users will want to address
individual "grouped" pixels, and you'll end up with a weird API. The
Enter key on non US layouts is also a problem: is it 1 or 2 pixels wide?
Is is 2 pixel in heights?

The positions of the pixels also depend on the physical layout of the
keyboard itself. So with the same vendor ID/Product ID, you might have
different pixel positions if the device is sold in Europe, or in the US.

It's also luminance problem IIRC. Some keys might have a different range
of luminance than others. I remember Bastien Nocera telling me we
already have that issue on some Logitech LEDs (for streaming) where the
maximum brightness value changes depending on the current you can pull
from the USB port. You'll have to find a way to provide that to
userspace as well.

But that's just the "easy" part. We can define a kernel API, for sure,
but then we need users. And there are several problems here:

- first, users of this new kernel API need to be root to address the
  LEDs. They probably won't, so they'll rely on a third party daemon for
  that, or just use uaccess (yay!). But that part is easy
- then, user sees a new kernel interface, and they have to implement it.
  OK, fair enough, but more code to maintain
- but that new kernel API doesn't give enough information: all you have
  is an approximation of the keyboard layout, which will not match the
  reality. So they probably start requiring new things, like offsets on
  each row, pixel width, and so on. Or, and that's the easiest (and what
  we did in libratbag at the time), they'll rely on an external DB of
  SVGs representing the keyboard so they can have a GUI. And yes, people
  who like to configure their keys like to have a GUI.
- then, they somehow manage to have a GUI with the new kernel interface,
  and an approximate representation of the keyboard. Great! But now,
  users want to "react" to key presses, like their proprietary stack do
  on Windows. So they still need to have access to the keys, but not
  necessarily the keymap used in wayland/X, the raw keys. Because if you
  switch your keymap from en-US to dvorak, then your GUI needs to also
  do the reverse mapping.
- but then, even if you make everyones happy, the GUI project is
  actually cross-platform (OpenRGB is, Steam is, SDL is). And what is
  done on Windows is simple: raw access to the HID device. And the raw
  access gives you directly the exact representation of the device, the
  raw keys as they are pressed, and for that, under Linux with a 6.12
  kernel, you'll just need to ask logind (through a portal, with mutter
  in the middle) to give you raw access to HID *as a user* (because
  logind can revoke the access whenever it want).
  So that GUI ends up writing raw HID LampArray support, and starts
  complaining at any new kernel API we do, because it conflicts with
  their access.
- and guess what, native HID LampArray devices are coming to be true, so
  that userspace HID implementation is not for nothing.

I've been through this exact same process with Input and game
controllers, and even for libratbag for configuring gaming devices. In
the end, the kernel developer never wins, but the userspace application
does, and the fact that Windows and Mac gives raw access to a sensible
API that already provide anything the userspace application needs is the
killer feature. With raw access they have much finer control over the
device, and TBH it is not a critical component of the system.

If you want a 100 lines of code program to control your keyboard, with
LampArray, you can, as long as you don't require a GUI and don't require
to be generic. Just write the values directly on the hidraw device, and
done. Or use a BPF program like I currently do for fun on my Corsair
keyboard. It's all in the kernel, no overhead, and my daughters are
impressed because the colors of the keys of my keyboard are changing
dynamically...

Having a global keyboard backlight handled through LED class is
perfectly fine also. But we are talking about crazy things that people
do for basically nothing. Having a dedicated kernel interface when there
is already a published standard is IMO shooting ourself in the foot
because there'll be no users, and we'll have to support it forever.

You might agree with me or not, but this is actually not relevant to the
discussion here IMO: all what Werner is doing (with crazy arrays) is to
take a proprietary protocol and convert into a HID standard. He is
basically supplying over a firmware that should have reported this
information from day one. You are arguing against this, and want to
bypass that by providing a new subsystem, but if you take a step back,
that new subsystem, even if I disagree with it, can come on top of HID
LampArray, and it will already have all the information you want. So
instead of having multiple places where you implement that new
subsystem, you have one canonical implementation, meaning one place to
fix it.

I'm also under the impression that you are scared by BPF. BPF is just a
tool here to "fix" the device with an easy path forward. BPF is safer
than a true kernel driver, but all in all, we can have the exact same
discussion on whether having a dedicated kernel API or not once we get
our hands on the first true HID LampArray supported keyboard.

Cheers,
Benjamin
