Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9EF9A9DE1
	for <lists+dri-devel@lfdr.de>; Tue, 22 Oct 2024 11:05:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F28A710E626;
	Tue, 22 Oct 2024 09:05:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="KaIbzR7T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F4B10E624
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Oct 2024 09:05:29 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 5A747A414D8;
 Tue, 22 Oct 2024 09:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAFA6C4CEC3;
 Tue, 22 Oct 2024 09:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1729587927;
 bh=KVj6eLMEBlRYZiWuK+4pxzDP6yrXseLw1QFl9GKKPqI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KaIbzR7TbABpbidMnzsaoYQyVJzcf/VjoLrtLdymzrs2QUsV3fGEYFvnLdbMV0FUg
 g9cP42CHRcwhHTucWsLdQzhMyhUIMxUD3QRbDcFzZ5vsv4BcRXJF+gxCLzZEwTxhVp
 qWSoB7pvQoREg19EU9qFTOaZ79DkBqbvFKK078cWX7ZcMFWLu9RQXMJrsJ8NmKs3Xg
 j1IImKAGmUdPZstmuGUNYO90KGf+8HJnal+rfVOmF8U+3vSvf/ZgiHqpTcww3oMLdv
 /Cqgnmj4JEYNUSkKLLDuF0QeN8sjHkdMR1uh8bfQSLuG5jAI2ahekHqq6OycPrA0QV
 NqL8lqnfbQ4gA==
Date: Tue, 22 Oct 2024 11:05:21 +0200
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
Message-ID: <zmecavqq5iztb5pkdkk6q52lupolpnufisid4ljydesqh2dtoe@qynhfo3n2i6q>
References: <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
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

Sorry I should have answered earlier...

On Oct 09 2024, Werner Sembach wrote:
> Resend because HTML mail ..., but I think I now know when Thunderbird does
> it: Every time I include a link it gets converted.
> 
> Hi
> 
> Am 08.10.24 um 17:21 schrieb Benjamin Tissoires:
> > On Oct 08 2024, Werner Sembach wrote:
> > > [...]
> > Yeah, it just means that you can query or send the data. You can also
> > use HIDIOCGINPUT() and HIDIOCSOUTPUT() to get a current input report and
> > set an output report through the hidraw ioctl...
> > 
> > Internally, HIDIOCGINPUT() uses the same code path than
> > HIDIOCGFEATURE(), but with the report type being an Input instead of a
> > Feature. Same for HIDIOCSOUTPUT() and HIDIOCSFEATURE().
> 
> Ok so just a difference in definition not in implementation.
> 
> Then I use a get feature report for the device status function and use it as
> input and output at the same time, and use a set output report for the led
> update function (which technically has a return value but i think it's
> always 0 anyway).

not quite. You can not use a get feature to set something on the device.

The semantic is:
Set -> "write" something on the device (from host to device)
Get -> "read" something from the device (from device to host)

Features can be set/get.
Input can only be get.
Output can only be set.

The implementation in the kernel should enforce that.

> 
> I scoured the old thread about exposing WMI calls to userspace, because I
> remembered that something here came up already.
> 
> 1. https://lore.kernel.org/all/6b32fb73-0544-4a68-95ba-e82406a4b188@gmx.de/
> -> Should be no problem? Because this is not generally exposing wmi calls,
> just mapping two explicitly with sanitized input (whitelisting basically).
> 
> 2.
> https://lore.kernel.org/all/b6d79727-ae94-44b1-aa88-069416435c14@redhat.com/
> -> Do this concerns this apply here? The actual API to be used is LampArray
> and the HID mapped WMI calls are just an "internal" interface for the BPF
> driver, but technically UAPI.
> 
> Also at Armin and Hans: Do you have comments on this approach?
> 
> > > (well as far as I can tell the hut doesn't actual specify, if they need to
> > > be feature reports, or am I missing something?)
> > They can be both actually. The HUT is missing what's expected here :(.
> > 
> > However, looking at the HUT RR 84:
> > https://www.usb.org/sites/default/files/hutrr84_-_lighting_and_illumination_page.pdf
> > 
> > There is an example of a report descriptor, and they are using Features.
> > Not Input+Output.
> > 
> > And looking even further (above), in 3.5 Usage Definitions:
> > 3.5.2, 3.5.3 and 3.5.5 all of them are meant to be a feature, like:
> > LampArrayAttributesReport CL – Feature -
> > LampAttributesRequestReport CL – Feature –
> > LampAttributesResponseReport CL – Feature –
> > LampArrayControlReport CL – Feature –
> > 
> > 3.5.4: can be either feature or output, like:
> > LampMultiUpdateReport CL – Feature/Output –
> > LampRangeUpdateReport CL – Feature/ Output –
> > 
> > So I guess the MS implementation can handle Feature only for all but the
> > update commands.
> Thanks for the link, I guess for the BPF driver I will stick to feature
> reports for the LampArray part until there is actually a hid descriptor
> spotted in the wild defining LampMultiUpdateReport and LampRangeUpdateReport
> as Output and not feature.
> > > and there is the pair with LampAttributesRequestReport and
> > > LampAttributesResponseReport.
> > Yeah, not a big deal. The bold IN and OUT are just to say that calling a
> > setReport on a LampAttributesResponseReport is just ignored AFAIU.
> > 
> > > Sorry for my confusion over the hid spec.
> > No worries. It is definitely confusing :)
> 
> On this note as I fathom:
> 
> Input Report (usually always get report): Interrupts (the ioctl just there
> to repeat the last one?)

yeah, but from hidraw the kernel calls the device directly to query the
report, so some device don't like that and just hang.

Rule of thumbs: never use get_report on an input report, unless the
specification explicitely says that the device is supposed to support
it for the given usage.

> 
> Output Report (usually always set report): Async write, no return value
> (Buffer should stay untouched)

yep

> 
> Feature report set: Sync write, no return value (Buffer should stay untouched)

yep

> 
> Feature report get: Sync read/write (intended only for read, but not limited
> to it, uses singular buffer for both input and output)

sync read only, no write. The existing values in the incoming buffer are
just overwritten.

> 
> I kind of don't get why feature report set exists, but well it's the specs ^^.

if "feature report set" doesn't exist, you can not write a vlaue to a
feature on a device (because get doesn't allow you to write).

Anyway, it's a USB implementation detail: input/output are using URB, so
direct USB read/write, when Features are using the control endpoint,
which allows for a slightly different approach.

And this transfered as output being async, when features are
synchronous.

Cheers,
Benjamin
