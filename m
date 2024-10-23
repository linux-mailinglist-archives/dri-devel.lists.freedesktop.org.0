Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7F89AD359
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 19:54:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9385010E380;
	Wed, 23 Oct 2024 17:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="L57meQvR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9CC610E380
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 17:54:41 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 4C25D2FC004A;
 Wed, 23 Oct 2024 19:54:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1729706080;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qg6J2ZKjKuT4NxpJxzY+/4uhSMmE1FV8vXNLyqWjSwU=;
 b=L57meQvRSn7NFM0dls4nqJzDyda9eeYwdS3HS23gutt88rjXInhg+hgsce9YkuDFNsHZhM
 r+VvwxPvLdEBP/gpHU0noFZrQ5PyiwOtT3+B0tu1NpWPHygJXhTwahz2jKOLzxmFnLeny+
 t5DMP+scGYbBMOV+Gxm8nW85au0Es48=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <73c36418-34d6-46cf-9f10-6ca5e569274f@tuxedocomputers.com>
Date: Wed, 23 Oct 2024 19:54:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Armin Wolf <W_Armin@gmx.de>, Pavel Machek <pavel@ucw.cz>,
 Benjamin Tissoires <bentiss@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <82a6eca1-728c-436f-8c4d-073d8a43ee27@tuxedocomputers.com>
 <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <kywhqw5ef6hioemoydwub57dcmfuu3bwqpz3vjur4pkabboydo@2hrqj3zy4txv>
 <ZxdyQFMRIRusMD6S@duo.ucw.cz> <eb829c6c-cee0-4d65-b9d6-3df7fd1096a7@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <eb829c6c-cee0-4d65-b9d6-3df7fd1096a7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 22.10.24 um 17:02 schrieb Armin Wolf:
> Am 22.10.24 um 11:37 schrieb Pavel Machek:
>
>> Hi!
>>
>>>> Personally I really like the idea to just emulate a HID LampArray device
>>>> for this instead or rolling our own API.  I believe there need to be
>>>> strong arguments to go with some alternative NIH API and I have not
>>>> heard such arguments yet.
>
> Using a virtual HID LampArray already creates two issues:
>
> 1. We have to supply device size data (length, width, height), but the driver
> cannot know this.
>
> 2. It is very difficult to extend the HID LampArray interface, for example
> there is no way to read the current LED color from the hardware or switch
> between different modes.
>
> A sysfs- and/or ioctl-based interface would allow us to:
>
> 1. Threat some data as optional.
>
> 2. Extend the interface later should the need arise.
>
> Looking at the tuxedo-drivers code, it seems that the WMI interface also reports:
>
> - preset color
> - device type (touchpad, keyboard, ...)
> - keyboard type (US/UK)
>
> Making this information available through the HID LampArray protocol would be
> difficult (except for the device type information).
>
>>> Agreed on everything Hans said.
>>>
>>> I'll personnaly fight against any new "illumination" API as long as we
>>> don't have committed users. This is the same policy the DRM folks
>>>> are
>> Well, and I'll personally fight against user<->kernel protocol as
>> crazy as HID LampArray is.
>>
>> OpenRGB is not suitable hardware driver.
>>                                 Pavel
>
> I agree.
>
> The point is that we need to design a userspace API since we cannot just allow
> userspace to access the raw device like with HID devices.
>
> And since we are already forced to come up with a userspace API, then maybe it 
> would
> make sense to build a extendable userspace API or else we might end up in the 
> exact
> same situation later should another similar driver appear.
>
> Since the HID LampArray is a hardware interface standard, we AFAIK cannot 
> easily extend it.
>
> Also i like to point out that OpenRGB seems to be willing to use this new 
> "illumination" API
> as long as the underlying hardware interface is properly documented so that 
> they can implement
> support for it under Windows.
>
> I would even volunteer to write the necessary OpenRGB backend since i already 
> contributed to
> the project in the past.

Just wanting to leave my 2 cents here: I'm in theory fine with both approaches 
(hidraw LampArray or wrapping it in some kind of new UAPI which at least has the 
LampArray feature set).

I also don't think that OpenRGB has a problem with a new Linux exclusive API as 
long as someone is doing the implementation work. After all the reason why 
OpenRGB was started is to unify all the different vendor APIs under one UI. So 
one more or less doesn't matter.

BUT: I already did work for the hidraw LampArray approach and OpenRGB already 
did work for that as well (albeit I didn't yet managed to get the draft running) 
and we already had a lengthy discussion about this in the last thread. (This one 
https://lore.kernel.org/all/20231011190017.1230898-1-wse@tuxedocomputers.com/) 
with all the same arguments.

e.g. Expansion of the API: How should that look like? It would have to be 
basically an own extension for every keyboard manufacturer because every one 
supports different built in modes with different values to tweak.

So I'm siding with Hans and Benjamin on this one.

My only plan for the current patch besides some more code beautification: Move 
the device-sku specific values (key map, and key positions) to a bpf driver.

The question in my mind currently is: Is the patch merge ready with just that? 
Or must the OpenRGB implemenation also be finished before the merge?

Best regards,

Werner

>
> Thanks,
> Armin Wolf
>
