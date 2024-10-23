Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 935D59AD247
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 19:14:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19E5E10E37E;
	Wed, 23 Oct 2024 17:14:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="mJ68xLxi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0A0A10E35E
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 17:14:23 +0000 (UTC)
Received: from [192.168.42.96] (p5de457db.dip0.t-ipconnect.de [93.228.87.219])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id C303D2FC0059;
 Wed, 23 Oct 2024 19:14:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1729703662;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ij9zwFvuXFBDoW4kC2rr9WT96DzuvZ7BkBrnd8lgs6o=;
 b=mJ68xLxiO0fLlSPSR4QHJxmpiVn7Hq3tqOWvRVDFGaiTEFqA9tN/klDmyvHYafBn6oglEF
 nlbxBLgcSEXqMuK6aPojPFWytK/ZjV+XK5HeUnL3xph7FnS8JyMlinnj3aIy+PCcOIaBzr
 jCIkaay8FLMnNQYCFGtftmOeS+j+1Ro=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <c0791e1d-a63f-40fd-bcb8-5f2eec15c59e@tuxedocomputers.com>
Date: Wed, 23 Oct 2024 19:14:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>, Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Benjamin Tissoires <bentiss@kernel.org>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, jelle@vdwaa.nl, jikos@kernel.org,
 lee@kernel.org, linux-input@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-leds@vger.kernel.org, miguel.ojeda.sandonis@gmail.com,
 ojeda@kernel.org, onitake@gmail.com, platform-driver-x86@vger.kernel.org
References: <5crqia4gecxg62n2m2lf6haiifue4wlxrr3g35dyoaa3svjyuj@cd5bhouz5rlh>
 <4a761cd0-611a-4245-8353-5c66ba133715@tuxedocomputers.com>
 <rszv4p34oivysoyi337dxwooebipiikzd3pyq7rof5r3agbzce@xejutpd4jcfv>
 <06c58141-4aa9-4b54-8ae4-e27069561ac9@tuxedocomputers.com>
 <48a8d62f-ea3f-4f17-b917-ff3aaa83e89c@gmx.de> <ZwlDpCPhieF3tezX@duo.ucw.cz>
 <a796f0e7-47a8-40fa-a64e-9dd56117bf78@gmx.de>
 <c52019d7-01b4-4585-a2d1-b44b0a773fc9@redhat.com>
 <Zxd0ou7GpCRu0K5a@duo.ucw.cz> <35a98b67-d1eb-4aa9-9d3f-025c94cd6b0f@gmx.de>
 <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi

Am 22.10.24 um 21:15 schrieb Pavel Machek:
> Hi!
>
>>>>> - interface for setting multiple LEDs at once
>>>>> - interface for setting a range of LEDs at once
>>> How are LEDs ordered? I don't believe range makes much sense.
>> Range would allow for efficiently changing the color of all LEDs. But i agree
>> that this can be considered optional and can be added later.
> Yep, setting all of them makes sense. We should probably provide
> backward-compatible interface for keyboards with single backlight, so
> this would likely be LED class.
>
>>>> Personally I really like the idea to just emulate a HID LampArray device
>>>> for this instead or rolling our own API.  I believe there need to be
>>>> strong arguments to go with some alternative NIH API and I have not
>>>> heard such arguments yet.
>>> If you don't want "some alternative API", we already have perfectly
>>> working API for 2D arrays of LEDs. I believe I mentioned it before
>>> :-). Senzrohssre.
>> We may have to support 3D arrays of LEDs, so using a simple framebuffer
>> would likely cause trouble.
> Do you have pointer for device that is 3D?

The example from the spec is a keyboard with lightbars on the side, the we 
actually sell notebooks with similar led configurations (mostly on the front and 
not on the side). Example is the Sirius I implemented which has a not yet 
implemented lightbar on the front.

Another usecase is probably ergonomic keyboards, but I cannot tell you a real 
world example atm.

>
> OpenRGB manages to map keyboard into plane... so what I'd propose is
> this:
>
> Framebuffer
> Information for each pixel:
> 	    present ? (displays with missing pixels are pretty common)
> 	    list of keys related to this pixel
> 	    width, height, length (if we know them)
>
> Pixels map to keys M:N.

How would iso-enter be mapped here?

How would the q-key be mapped relative the the 1-key? (they are exactly halve a 
key offset)

would it be:
~,1,2
tab,q,w

or:

~,1,2
tab,missing pixel,q

Regards

Werner

>
> Yes, we'll have some number of non-present pixels, but again, I
> believe that's not uncommon due to round screens, etc.
>
> (But I'm fine with other interfaces, as long as they are "normal")
>
> Best regards,
> 								Pavel
>
