Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 206C798EFBF
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 14:54:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82E9010E00E;
	Thu,  3 Oct 2024 12:54:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KEl8PKRa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 50A6A10E00E
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 12:54:55 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id A2808A40E25;
 Thu,  3 Oct 2024 12:54:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55D8EC4CEC5;
 Thu,  3 Oct 2024 12:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727960093;
 bh=jQAcHVSSj5IEV8CkJIYNkBOVkifIG505tJlB5w5mV4g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KEl8PKRamd+RdDBI2RD8Z/e4/D7pfJ4E5rGZFR4DNlzmuTKsoB/7cKhjZYq8J9z7s
 sfpRthwojqLH76Th5UzTpp7jd2Cs9PgFAC4O9X+e/6ukr9lghJbvAjui6VnZM8mhNq
 OWkf4WXxUsDd+c2RIoPxb8sq5ZC/Yc94jd2e8k4s5IsPmrk2wFy5DSy59RrbX6s3zc
 Hle7UA5a/MnORU0HfbvSSG59/AA7vlFGLd7vYsNBP08HhAkAYsQDTnW2YPtt4qt8Pt
 pVCxmYKOkj3RhHODhydc6DLqhPaV8R8ZlkXn+elbcVl2YJYTiy/u5Ju6aYEhgOyfsI
 7KjSTmi4kTgtQ==
Date: Thu, 3 Oct 2024 14:54:47 +0200
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
Message-ID: <ysidntvhwmqwe5o6rpshtoam674lwnkook747ni5dbf4z5sf3a@vdf44xu2ydjz>
References: <5th4pisccud5s7dbia42glsnu7e5u3q7jszty6o3mjdedsd2bg@7nsvp6t2krnf>
 <b6f2244d-7567-49ac-b2db-23b632a4e181@tuxedocomputers.com>
 <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <Zvxjo/CYXmKw2jjM@duo.ucw.cz>
 <rdo2yyy5dxsxrfm7bweuuvsqjzjelyevo5xvufixuiyrdlf7pc@mprc7pzbpnla>
 <Zv0YI3qIEg88Dx4c@duo.ucw.cz>
 <hdahq2vfi3bnvaqswwdtave2kc2qm3ngvcwn6cgfiirfjfbqnz@zk77mbs3yktp>
 <Zv54/T+6znqZB3X9@duo.ucw.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Zv54/T+6znqZB3X9@duo.ucw.cz>
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

On Oct 03 2024, Pavel Machek wrote:
> Hi!
> 
> > > (Hint: it is LEDs below regular keyboard.)
> > 
> > Yes, I know, and if you read this email and the few others, you'll read
> > that I own a few of them already (for a long time), and I worked on a
> > cross vendor userspace API to configure them. So I know what I am
> > talking about.
> 
> Ok.
> 
> > > > The positions of the pixels also depend on the physical layout of the
> > > > keyboard itself. So with the same vendor ID/Product ID, you might have
> > > > different pixel positions if the device is sold in Europe, or in the
> > > > US.
> > > 
> > > If vendor sells different hardware with same IDs, well 1) that's a
> > > nono, a 2) that's what kernel parameters are for.
> > 
> > This is already the case (hello hid-uclogic), and no, kernel parameters
> > are not helping. In that case (uclogic), we ask the device a specific
> > USB string which has the information, but is not part of HID. This is
> > dumb, but we don't control hardware makers.
> 
> Well, good you find other solution. Kernel parameter would have worked
> as a fallback.

This is probably a side topic, but IMO, kernel parameter are most of the
time the worst solution. Basically we are asking people to look for
solutions on random forums and they have to manually add the parameter
in their bootcmd. But that's a different topic.

Of course, I'm not saying kernel parameters are just a bad thing: being
able to enable specific debug or some per user configuration (like
enabling disabling a feature) is a whole different story. It's just
"kernel parameter to fix a device" that I dislike.

> 
> > > > But that's just the "easy" part. We can define a kernel API, for sure,
> > > > but then we need users. And there are several problems here:
> > > > 
> > > > - first, users of this new kernel API need to be root to address the
> > > >   LEDs. They probably won't, so they'll rely on a third party daemon for
> > > >   that, or just use uaccess (yay!). But that part is easy
> > > 
> > > Eventually, desktop environment should talk the interface. (Plus, how
> > > does HID or BPF craziness help with his?)
> > 
> > HID helps because we already have the case with game controllers. Steam
> > and SDL (both widely use), put rules giving uaccess to hidraw nodes on
> > those controllers. So we finally made the jump and now provide in v6.12
> > a new hidraw ioctl to allow logind to revoke the hidraw node. This
> > should allow us to not give uaccess to those hidraw nodes.
> > 
> > So in the near future, there will be a portal available, that says
> > "please give me a fd for this hidraw node", the compositor will then ask
> > logind to open the file for it and then will pass that fd to the final
> > application. Once there is a vt-switch, logind will revoke the fd,
> > meaning that the application will not have access to the device.
> 
> Yes, you can work around kernel not providing abstractions. But you
> should not have to.
> 
> > > > - but then, even if you make everyones happy, the GUI project is
> > > >   actually cross-platform (OpenRGB is, Steam is, SDL is). And what is
> > > >   done on Windows is simple: raw access to the HID device. And the
> > > >   raw
> > > 
> > > Yes, Windows is a mess. We don't want to emulate them.
> > > 
> > > > I've been through this exact same process with Input and game
> > > > controllers, and even for libratbag for configuring gaming devices. In
> > > > the end, the kernel developer never wins, but the userspace
> > > 
> > > Yes, we have been in this exact situation. Userland was directly
> > > accessing mice. It was called "gpm" and we moved away from that for
> > > good reasons.
> > 
> > There is a slight difference between mouse support and LEDs on your
> > keyboard. The former is actually required to bring up the machine and to
> > use it, the latter is nice to have.
> 
> But that's not the difference that matters. Linux is not microkernel,
> and is trying to provide hardware abstractions. (Except for printers,
> I guess that's because printers are often network devices).
> 
> Besides, mouse was not required to bring up a machine "back then".
> 
> Besides,
> 
> 1) using those keyboards in dark room without backlight is hard,
> because their labels are translucent and not having enough contrast.
> 
> 2) rainbow effects make people ill.

And I agree with you here. And that's also why I agree with Werner's
plan: have a minimum support in kernel for that with the already
supported LED class, which is supported by UPower and others, and let
the ones who want the fancy effects be in charge of their mess.

To me, there is no value in designing a new API, gather all the
requirements, try to make it perfect, when the users will just say
"nope, we rather talk to hidraw because we can have the same code on
Linux, Windows and Mac".

This is what happened to us with SDL and Steam. We added support for the
PlayStation controllers, the XBox ones, the Wii, and many others,
through the regular input and FF stacks. But all they want is being able
to disable what the kernel is doing because they are using the device
differently and in the same way on Windows, Mac and Linux.

And if you look at OpenRGB (or any other tool that configures multiple
crazy LEDs devices), they are all doing the same thing, *already*. So if
we come to them with a new fancy interface, they'll just laugh at us.

(and no, it's not just a hidraw problem, they are actually dettaching
the USB device entirely, having a userspace USB library and then on top
of it parse the HID data with a userspace HID library).

> 
> Note how we have drivers for audio, LEDs, cameras, dunno, iio sensors,
> none of that is required to bring system up.
> 
> We need driver for the WMI stuff in kernel. And that point it should
> be pretty clear proper driver/subsystem should be done.

Yes, and again, I never said we need to provide WMI to userspace.

What I want is:
- provide a minimum support on Linux using already existing APIs (LED
  class)
- allow crazy people to do their thing if they want to have a rainbow
  initiated by every key press
- ensure the minimum support of the LED class is not messed up when
  people start using the HID LampArray API.

HID LampArray is a ratified standard by a few hardware makers already[0]
(Acer, Asus, HP, Logitech, Razer, SteelSeries and Twinkly apparently).
They already made the job of knowing their requirements. From the
kernel, we probably don't need all of this. But they have users who
cares. So providing the minimum support in Linux and a way to forward
more advanced usage seems like a good way to me.

> 
> > > > If you want a 100 lines of code program to control your keyboard, with
> > > > LampArray, you can, as long as you don't require a GUI and don't require
> > > > to be generic. Just write the values directly on the hidraw device,
> > > > and
> > > 
> > > Haha, no. Kernel part was 400+ lines, no way you can parse that in 100
> > > lines.
> > 
> > I'm not saying "parsing", I mean adapt to your use case. If you know
> > your device, your simple CLI is just writing a static array of bytes to
> > the hidraw interface.
> 
> No. Hardware abstraction is kernel work, my application should work
> everywhere.

So when you say "Kernel part was 400+ lines" you mean the HID parsing of
the report descriptor? You don't want to use a already existing HID
parsing library?

Because if you want a plain C program without anything outside stdlib,
then yes, 100 LoC is going to be tricky. But if you can cope with a HID
parsing library, setting the color of a keyboard driven by LampArray is
a single write to the hidraw node (see page 345 of HID HUT 1.5[1]):

LampRangeUpdateReport(LampIdStart==0, LampIdEnd==(LampCount-1),
RGBI==color)

where LampCount is found in the report descriptor and color a simple
(r,g,b) value.

> 
> > > What is relevant that these crazy arrays are not going to be merged,
> > > and better solution is needed.
> > 
> > Again, you seemn to miss the point: those crazy arrays should have been
> > in the firmware from day one. They are not, so the idea is to convert
> > proprietary protocol into a standard. Then we can start thinking what
> > comes next.
> 
> Firmware is what it is and we have to deal with that.
> 
> (Not to mention that "standard" you are citing is not used by anyone
> and is ugly as hell. So not even open hardware such as MNT Reform uses
> it).

See Microsoft's pledge[0] and the list of vendors I quoted. And again, I
don't care if it's ugly as long as we have minimal support in the kernel
and can let userspace deal with this, if they want.


Cheers,
Benjamin

[0] https://learn.microsoft.com/en-us/windows-hardware/design/component-guidelines/dynamic-lighting-devices
[1] https://www.usb.org/sites/default/files/hut1_5.pdf
