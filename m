Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55778988EE9
	for <lists+dri-devel@lfdr.de>; Sat, 28 Sep 2024 12:05:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25E9310E084;
	Sat, 28 Sep 2024 10:05:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="EW18IG5r";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D360110E084
 for <dri-devel@lists.freedesktop.org>; Sat, 28 Sep 2024 10:05:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B78E75C544E;
 Sat, 28 Sep 2024 10:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57844C4CEC3;
 Sat, 28 Sep 2024 10:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727517911;
 bh=HJ9Wpeoic1qJSShdwMTX5ci52e1/NkJCIntPVKd2EEw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EW18IG5rScMdaZmBhHDleJhqAd5vkXlha5dUX16vgAqnmlImtKGNRUtbIDi8EB7st
 ap1RQBIpO3wnXU7z5lnU+S3DA2VvuCEilY/nCGtMuWPXsnBMB59pU1iXvzHnlT9BXq
 6qo+t7bWa8wgMm8Abbk5pVexGOG+RC5NyK7fetrNHYeKdgFHB9eunwoAG2XmoSTvpy
 B9M6DSVDahlqfH7qGsjpneWApsXXjE1XqRC8OgUJha4nBkQTwwkOR/rpmSnzSq+4uP
 QAjHf6j9CYG18WsmB9PpLIzrGw1yxPufBBtOB6RyFQeM7K02uanBeXEp+o+2EWqJPU
 44q6Yh10PghUA==
Date: Sat, 28 Sep 2024 12:05:05 +0200
From: Benjamin Tissoires <bentiss@kernel.org>
To: Werner Sembach <wse@tuxedocomputers.com>
Cc: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>, 
 Hans de Goede <hdegoede@redhat.com>,
 Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, 
 miguel.ojeda.sandonis@gmail.com, ojeda@kernel.org, onitake@gmail.com, 
 platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for
 TUXEDO NB04 devices
Message-ID: <45qkbpaxhrv2r32hghjqoexkenktymzyjgpx2xnnxt6dmfawjt@44lrhgcnozh3>
References: <20240926174405.110748-1-wse@tuxedocomputers.com>
 <20240926174405.110748-2-wse@tuxedocomputers.com>
 <ZvcdNXQJmc8cjifw@amd.ucw.cz>
 <bea39077-6104-4b59-8757-9cbe0e703e5c@gmx.de>
 <7r3zg4tcmp5ozjwyiusstgv7g4dha4wuh4kwssxpk3tkurpgo3@36laqab7lsxp>
 <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <58cf1777-222f-4156-9079-bcbba4a32c96@tuxedocomputers.com>
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

On Sep 28 2024, Werner Sembach wrote:
> Hi,
> 
> Am 28.09.24 um 09:27 schrieb Benjamin Tissoires:
> > On Sep 28 2024, Armin Wolf wrote:
> > > Am 27.09.24 um 23:01 schrieb Pavel Machek:
> > > 
> > > > Hi!
> > > > 
> > > > > The TUXEDO Sirius 16 Gen1 and TUXEDO Sirius 16 Gen2 devices have a per-key
> > > > > controllable RGB keyboard backlight. The firmware API for it is implemented
> > > > > via WMI.
> > > > Ok.
> > > > 
> > > > > To make the backlight userspace configurable this driver emulates a
> > > > > LampArray HID device and translates the input from hidraw to the
> > > > > corresponding WMI calls. This is a new approach as the leds subsystem lacks
> > > > > a suitable UAPI for per-key keyboard backlights, and like this no new UAPI
> > > > > needs to be established.
> > > > Please don't.
> > > > 
> > > > a) I don't believe emulating crazy HID interface si right thing to
> > > > do. (Ton of magic constants. IIRC it stores key positions with
> > > > micrometer accuracy or something that crazy. How is userland going to
> > > > use this? Will we update micrometers for every single machine?)
> > This is exactly why I suggest to make use of HID-BPF. The machine
> > specifics is going to be controlled by userspace, leaving out the crazy
> > bits out of the kernel.
> 
> From just a quick look at
> https://www.kernel.org/doc/html/latest/hid/hid-bpf.html HID-BPF is some kind
> HID remapping?

Yes. HID-BPF allows to customize a HID device by changing the report
descriptor and/or the events, and the requests made from hidraw.

It's a HID -> HID conversion, but controlled by userspace.

See [0] for a tutorial.

> 
> But the device in question nativly does not have a hid interface for the
> backlight. It is controlled via WMI calls.
> 
> Afaik userspace on linux has no access to WMI? How could HID-BPF implement
> the WMI calls?

You'll need a thin WMI to HID wrapper, but without LampArray.
Then you load the HID-BPF program from userspace, that program knows
about the specifics of the device, and can do the LampArray transform.

Which means that once the wmi-to-hid driver specific to this device is
built in the kernel, you can adjust your LampArray implementation (the
device specifics micrometers and what not) from usersapce.

> 
> > 
> > > > Even if it is,
> > > > 
> > > > b) The emulation should go to generic layer, it is not specific to
> > > > your hardware.
> > Well, there is not so much about an emulation here. It's a different way
> > of presenting the information.
> > But given that HID LampArray is a HID standard, userspace is able to
> > implement it once for all the operating systems, which is why this is so
> > appealing for them. For reference, we have the same issue with SDL and
> > Steam regarding advanced game controller: they very much prefer to
> > directly use HID(raw) to talk to the device instead of having a Linux
> > specific interface.
> > 
> > Also, starting with v6.12, systemd (logind) will be able to provide
> > hidraw node access to non root applications (in the same way you can
> > request an input evdev node). So HID LampArray makes a lot of sense IMO.
> > 
> > > Maybe introducing a misc-device which provides an ioctl-based API similar
> > > to the HID LampArray would be a solution?
> > > 
> > > Basically we would need:
> > > - ioctl for querying the supported LEDs and their properties
> > > - ioctl for enabling/disabling autonomous mode
> > > - ioctl for updating a range of LEDs
> > > - ioctl for updating multiple LEDs at once
> > You'll definitely get the API wrong at first, then you'll need to adapt
> > for a new device, extend it, etc... But then, you'll depend on one
> > userspace application that can talk to your custom ioctls, because cross
> > platform applications will have to implement LampArray, and they'ĺl
> > probably skip your custom ioctls. And once that userspace application is
> > gone, you'll still have to maintain this forever.
> > 
> > Also, the application needs to have root access to that misc device, or
> > you need to add extra support for it in systemd...
> > 
> > > If we implement this as a separate subsystem ("illumination subsystem"), then different
> > > drivers could use this. This would also allow us to add additional ioctl calls later
> > > for more features.
> > Again, I strongly advise against this.
> > 
> > I'll just reiterate what makes the more sense to me:
> > - provide a thin wmi-to-hid layer that creates a normal regular HID
> >    device from your device (could be using vendor collections)
> This is what this driver tries to be.

Except that your current implementation also does the LampArray
conversion. I think it'll make more sense to provide an almost raw
access to the underlying protocol (think of it like your own Tuxedo
vendor collection in HID), and handle the LampArray weirdeness in bpf:
definition of the device physicals, conversion from HID LampArray
commands into Tuxedo specifics.

> > - deal with the LampArray bits in the HID stack, that we can reuse for
> >    other devices (I was planing on getting there for my Corsair and
> >    Logitech keyboads).
> 
> If a greater efford in the hid stack is planed here i would be all for it.

That's what makes more sense to me at least. Other operating systems
export the HID nodes directly, so userspace prefers to talk to the
device directly. So I'd rather rely on a standard than trying to fit the
current use case in a new interface that will probably fail.

> 
> On my todolist i would try to integrate the leds subsystem with the
> LampArray interface next, just a simple implementation treating the whole
> keyboard as a single led.

That could be done in HID-core as well. Making it part of HID-core also
means that once we get an actual LampArray device, we'll get support for
it from day one.

> 
> > - Meanwhile, while prototyping the LampArray support in userspace and
> >    kernelspace, make use of HID-BPF to transform your vendor protocol
> >    into LampArray. This will allow to fix things without having to
> >    support them forever. This is why HID-BPF exists: so we can create
> >    crazy but safe kernel interfaces, without having to support them
> >    forever.
> 
> I guess i have to do some readup xD.
> 

Please have a look at the tutorial[0]. That tutorial is missing the
couple of new hooks you'll need to change the requests emitted from
hidraw as LampArray into Tuxedo, but I can also give you a help into
making it happening.

Basically, you also need to define a .hid_hw_request callback in your
HID_BPF_OPS and extract all of the code you have here into that bpf
program (which is roughly C code).

Cheers,
Benjamin


[0] https://libevdev.pages.freedesktop.org/udev-hid-bpf/tutorial.html

