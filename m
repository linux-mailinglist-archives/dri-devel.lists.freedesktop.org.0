Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC0B995341
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 17:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F78F10E235;
	Tue,  8 Oct 2024 15:21:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YQbPZTKz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A71810E235
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Oct 2024 15:21:45 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E71FAA417A6;
 Tue,  8 Oct 2024 15:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 110A0C4CEC7;
 Tue,  8 Oct 2024 15:21:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728400904;
 bh=UWc2qvCFSN/lJ4nXoiViC2Mk+bdUrVpTctmrpmU2MX0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YQbPZTKznkz7snGmIxfOlgvGNOndnoQnAWFbJQxWppnNqX6GBWTaH9DU7Urk7MzD8
 PY6pO2AqN0z2PzWkbsvnGiQ7qY95i2wXOsHRpjKmMLPUlbjJXSC07HFkKLpKc2sb9t
 c3uknU7lxFoX5PgFVyiKp0OC4fW8mYcfNPeDBooeLnhaaiOT9qfE7hk83ztTxrFMhq
 vC2dT9sF25uVaWxvmNV9cA3dMvB/iROZpxsj5L+CdXcT1MadHF74rRcM6+7lk0bHy6
 DSuqDRqXmgYllQ1DcDYFsPqZQlo7M5QlKyI7hUkSL1moYICCgI6FacPsKFHVpVc8em
 RE5NjkMyuWqtw==
Date: Tue, 8 Oct 2024 17:21:38 +0200
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
Message-ID: <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
References: <cflor5mz4flekn44ttlbanfigmwn5mmp3p54gkeeznzmzkyjqz@p2c6q7gulrdl>
 <84b629c6-5b26-4285-9b2f-66dd1afa99e5@tuxedocomputers.com>
 <zph6fnuaamhayivmzftowjw6klgcy2gb7vdub2v2yo7n665vpo@rkxtorfvmzph>
 <7ce4470c-a502-416a-8472-a5b606bb8fd4@tuxedocomputers.com>
 <d7gk2mgihtg6242l3isnhw3xpdt745ehpu2kvim2xxgmxdhat7@g5cqei7uqujj>
 <39f84cfe-bb89-4194-81a9-e178c93e5309@tuxedocomputers.com>
 <sih5i2ausorlpiosifvj2vvlut4ok6bbgt6cympuxhdbjljjiw@gg2r5al552az>
 <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
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

On Oct 08 2024, Werner Sembach wrote:
> 
> Am 08.10.24 um 14:18 schrieb Benjamin Tissoires:
> > On Oct 08 2024, Werner Sembach wrote:
> > > Am 08.10.24 um 11:53 schrieb Benjamin Tissoires:
> > > > On Oct 07 2024, Werner Sembach wrote:
> > > > > Hi,
> > > > > 
> > > > > Am 02.10.24 um 10:31 schrieb Benjamin Tissoires:
> > > > > > On Oct 01 2024, Werner Sembach wrote:
> > > > > > > Hi Benjamin,
> > > > > > > 
> > > > > > > Am 01.10.24 um 15:41 schrieb Benjamin Tissoires:
> > > > > > > > [...]
> > > > > > > > PPS: sorry for pushing that hard on HID-BPF, but I can see that it fits
> > > > > > > > all of the requirements here:
> > > > > > > > - need to be dynamic
> > > > > > > > - still unsure of the userspace implementation, meaning that userspace
> > > > > > > >       might do something wrong, which might require kernel changes
> > > > > > > Well the reference implementetion for the arduiono macropad from microsoft
> > > > > > > ignores the intensity (brightness) channel on rgb leds contrary to the HID
> > > > > > > spec, soo yeah you have a point here ...
> > > > > > Heh :)
> > > > > > 
> > > > > > > > - possibility to extend later the kernel API
> > > > > > > > - lots of fun :)
> > > > > > > You advertise it good ;). More work for me now but maybe less work for me
> > > > > > > later, I will look into it.
> > > > > > Again, I'm pushing this because I see the benefits and because I can
> > > > > > probably reuse the same code on my Corsair and Logitech keyboards. But
> > > > > > also, keep in mind that it's not mandatory because you can actually
> > > > > > attach the BPF code on top of your existing driver to change the way it
> > > > > > behaves. It'll be slightly more complex if you don't let a couple of
> > > > > > vendor passthrough reports that we can use to directly talk to the
> > > > > > device without any tampering, but that's doable. But if you want to keep
> > > > > > the current implementation and have a different layout, this can easily
> > > > > > be done in BPF on top.
> > > > > > 
> > > > > > Cheers,
> > > > > > Benjamin
> > > > > > 
> > > > > > 
> > > > > > [0] https://lore.kernel.org/linux-input/20241001-hid-bpf-hid-generic-v3-0-2ef1019468df@kernel.org/T/#t
> > > > > Thinking about the minimal WMI to HID today, but found a problem: a HID
> > > > > feature report is either strictly input or output afaik, but the WMI
> > > > > interface has both in some functions.
> > > > Not sure you are talking about feature reports, because they are
> > > > read/write. It's just that they are synchronous over the USB control
> > > > endpoint (on USB).
> > > I'm confused about the split between get and send feature reports
> > > https://www.kernel.org/doc/html/latest/hid/hidraw.html
> > > 
> > > I guess then a get feature report can also carry input data and the
> > > difference is that a send feature report doesn't wait for a reply? but then
> > > what is it's reason of existence in contrast to an output report?
> > I'm under the impression you are mixing the 3 types of reports (just
> > re-stating that here in case I wasn't clear).
> > 
> > - Input reports:
> >    `Input()` in the report descriptor
> >    -> data emitted by the device to the host, and notified through an IRQ
> >    mechanism
> >    -> obtained in hidraw through a blocking read() operation
> > - Output reports:
> >    `Output()` in the report descriptor
> >    -> data sent asynchronously by the host to the device.
> >    -> sent from hidraw by calling write() on the dev node (no feedback
> >    except how many bytes were sent)
> > - Feature reports:
> >    `Feature()` in the report descriptor
> >    -> way to synchronously configure the device. Think of it like a
> >    register on the device: you can read it, write it, but you never get
> >    an interrupt when there is a change
> >    -> read/written by using an ioctl on the hidraw node
> 
> From userspace there are the HIDIOCSFEATURE and HIDIOCGFEATURE ioctls.
> 
> From the hid 1.11 spec:
> 
> "
> 
> 7.2.2 Set_Report Request
> 
> [...]
> 
> The meaning of the request fields for the Set_Report request is the same as for
> the Get_Report request, however the data direction is reversed and the Report
> Data is sent from host to device.
> 
> "
> 
> and from the hut 1.5, some of the LampArray feature reports are meant to be
> used with set report and some with get report

Yeah, it just means that you can query or send the data. You can also
use HIDIOCGINPUT() and HIDIOCSOUTPUT() to get a current input report and
set an output report through the hidraw ioctl...

Internally, HIDIOCGINPUT() uses the same code path than
HIDIOCGFEATURE(), but with the report type being an Input instead of a
Feature. Same for HIDIOCSOUTPUT() and HIDIOCSFEATURE().

> 
> (well as far as I can tell the hut doesn't actual specify, if they need to
> be feature reports, or am I missing something?)

They can be both actually. The HUT is missing what's expected here :(.

However, looking at the HUT RR 84:
https://www.usb.org/sites/default/files/hutrr84_-_lighting_and_illumination_page.pdf

There is an example of a report descriptor, and they are using Features.
Not Input+Output.

And looking even further (above), in 3.5 Usage Definitions:
3.5.2, 3.5.3 and 3.5.5 all of them are meant to be a feature, like:
LampArrayAttributesReport CL – Feature -
LampAttributesRequestReport CL – Feature –
LampAttributesResponseReport CL – Feature –
LampArrayControlReport CL – Feature –

3.5.4: can be either feature or output, like:
LampMultiUpdateReport CL – Feature/Output –
LampRangeUpdateReport CL – Feature/ Output –

So I guess the MS implementation can handle Feature only for all but the
update commands.

> 
> and there is the pair with LampAttributesRequestReport and
> LampAttributesResponseReport.

Yeah, not a big deal. The bold IN and OUT are just to say that calling a
setReport on a LampAttributesResponseReport is just ignored AFAIU.

> 
> Sorry for my confusion over the hid spec.

No worries. It is definitely confusing :)

Cheers,
Benjamin

> 
> > 
> > And BTW, it's perfectly fine to have a dedicated report ID which has
> > Input, Output and Feature attached to it :)
> > 
> > > > An input report is strictly directed from the device, and an output
> > > > report is from the host to the device.
> > > > 
> > > > But a feature report is bidirectional.
> > > > 
> > > > > How would I map that?
> > > > Depending on the WMI interface, if you want this to be synchronous,
> > > > defining a Feature report is correct, otherwise (if you don't need
> > > > feedback from WMI), you can declare the commands to WMI as Output
> > > > reports.
> > > Thanks for reminding me that output reports exist xD.
> > hehe
> > 
> > > > > If I split everything in input and output the new interface wouldn't
> > > > > actually be much smaller.
> > > > The HID report descriptor doesn't need to be smaller. The fact that by
> > > > default it exposes only one or two LEDs so we don't have the micrometers
> > > > arrays is the only purpose.
> > > > 
> > > > But if we also implement a not-full HID implementation of LampArray, we
> > > > should be able to strip out the parts that we don't care in the LED
> > > > class implementation, like the exact positioning, or the multiupdate.
> > > > 
> > > > > Also what would I write for the usage for the reserved padding in the report
> > > > > descriptor. Usage: 0x00?
> > > > padding are ignored by HID. So whatever current usage you have is fine.
> > > > 
> > > > However, if you are talking about the custom WMI vendor access, I'd go
> > > > with a vendor collection (usage page 0xff00, usage 0x08 for the 8 bytes
> > > > long WMI command for instance, 0x10 for the 16 bytes long one).
> > > > 
> > > > Side note: in drivers/hid/bpf/progs/hid_report_helpers.h we have some
> > > > autogenerated macros to help writing report descriptors (see
> > > > drivers/hid/bpf/progs/Huion__Dial-2.bpf.c for an example of usage). It's
> > > > in the hid-bpf tree but I think we might be able to include this in
> > > > other drivers (or do a minimal rewrite/move into include).
> > > > I'm not asking you to use it on your code right now, but this has the
> > > > advantage of becoming less "binary blob" in your code, and prevent
> > > > mistakes where you edit the comments but not the values.
> > > I will look into it.
> > > 
> > > Since the interface is fixed I don't need to flesh out the whole descriptor
> > > (which i thought i must do) and usage page (0xff42, because NB04 and the wmi
> > > has 2 other ec controlling wmi interfaces besides the AB one), report usage
> > > (matching the wmi comand id's) and report size should be enough.
> > I'm a little confused by that last sentence. But yeah, I would expect
> > some minimal sanity check before handing over the HID report to the WMI
> > interface :)
> > 
> > Cheers,
> > Benjamin
> > 
