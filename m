Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 693179ABFA6
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 09:03:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FBEF10E279;
	Wed, 23 Oct 2024 07:03:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=gmx.de header.i=w_armin@gmx.de header.b="T4GWh7sj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBB710E279
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 07:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
 s=s31663417; t=1729667008; x=1730271808; i=w_armin@gmx.de;
 bh=lITTQi1+xpDe/eRs5y9aBbZ20hdHWc0TWoYNWU0Bu/k=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:Cc:
 References:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=T4GWh7sj0kt2R+sHcQgs/R5eo+U2lAtSWTdSHhXN7lg8aUmRCtJ3Vi3Zf0cslCh8
 gir/069k0TZTC9YoXPbKdLw6RZ/+ef+c7mO1FH3lzytJQS7Dsexq+xo4S1v2UQ9Zf
 MLrWKAa875uMO75y5ppO7/inH5SAmh5yyYnF0BD9T6OrjmeG5QOouxx/bYR9YEgxF
 lZQ23hhM2aqb9X/cdi8E32lyls0Rt29+xbT7F3DV7FEUotQfkeiZy5XMga0kO2jKL
 fh8FGLygIDzvD/0rzWCu2CnDtYTtPWsj1vFZl/Pzb4R7408kkvmvDwbtSdgJmVO6P
 gk7hJcGyA4G+r05g6Q==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [141.30.226.129] ([141.30.226.129]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MVvLB-1tVNOX2WnN-00RqJg; Wed, 23
 Oct 2024 09:03:28 +0200
Message-ID: <e029404c-88f7-4e8a-affa-40d589412e61@gmx.de>
Date: Wed, 23 Oct 2024 09:03:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] platform/x86/tuxedo: Add virtual LampArray for TUXEDO
 NB04 devices
To: Pavel Machek <pavel@ucw.cz>
Cc: Hans de Goede <hdegoede@redhat.com>,
 Werner Sembach <wse@tuxedocomputers.com>,
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
From: Armin Wolf <W_Armin@gmx.de>
In-Reply-To: <Zxf5u9jgmt9vpz2u@duo.ucw.cz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cuXi8m4Br6nrlYzivR7wZJwXSlMK5QyjD1PQlgXa70bII4xYI1U
 kJda8SCxdeZiizmfIeODCMFWO/j6fI0IVQkYygtQ8SjLfdkbXvvkPWwkEOnuJBwSmi0tnFo
 kw0TqdoX7Q5sxqq3XY65CHUnLle9h+2hGP6AKyILbxYu41yYOr2wmPaa8Ukx4sPokK13SCH
 7MAiATwmgVrq1uqCTqLtA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:jTr3/4093ac=;w0fY4nHWFtbC/hjK2YYpqhZXS+3
 ZRWHmBZQwTsgcwbKsgeZSaq6I3MKbSTJMNkr4v+fdzZOPGHlZZ/BdfCJe19zxp9/tRyoXG2e6
 syfVfCQJwOdnhWUhzQ9t+Omgjr0k7qG/b/vj82iiDiV9Fo1qdKuVLFpigjdTJKwsvmYTksJp1
 x7d4QaphkRTL5Nj30Y3zNyECkrbVisLdEyJHop5D1Tue2qNx3D/5Qie2PQXeivDobZAEXqU6o
 R+wPWDtoU2df2ulGBTFFDYCdSSOVAnUIuQnv1y2K/vDqnaRN5AjUOXRgvUkaGhRnCjkRaLmYe
 hWZs/UZ/WhCu1n4+w9r7mJfXXimp1X73ALsp1YdN8HNmrQkO4jEaP2uZviFSIFJmbpOjTX4Gg
 JjOgLAtxRmUgX6Nw5XUT/fhS0eyizJg0K53ishDAESdizDXKaUes2by97id917zGXK4ArdzkZ
 n49fzkAsh4nhZEOmdKbY3a1uXPast54gfYTygBTe4FiCVlV8U3IYiHDPkC6cGD4C7nfw+TrBN
 4wbIV8bkoUwYbqlcrE8hQxQBqTO8e9fHyYgSI19pYcW2NWn9BWEQcIP0C0CRjx3bygPUJ64nM
 prt+bV6A4VLcsmh79kyN+NiQLOYTAYJnOIQOqpV5QtyNNHOn1yWL3hjPnoAzA2eHIfAz9IWWM
 qvc+C8JiHFKQbLMtXXcwpd3pgf39vdoFR1fuf5o3hWgj2RjRLO5jbsv18mh8MfKSugRwhUecY
 lkKfxnBtrBOG/T8Jg9RRRzGEUdzB7Wf51DQA+SxJJ5CizIvkuR/58txj83Caw6+ZOtFYfy2fo
 CnRKDGt+XBgGU8crz5B9OL/FHAa1ygdXRKj8Gl0tGkR7Y=
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
Good idea, the LED device could also be provided by the illumination subsystem code.

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

Maybe a PC case with LEDs on each corner.

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
>
> Yes, we'll have some number of non-present pixels, but again, I
> believe that's not uncommon due to round screens, etc.
>
> (But I'm fine with other interfaces, as long as they are "normal")
>
> Best regards,
> 								Pavel

Using an ID-based interface would allow for more flexibility and allow
us to support 3D-arrays.

Thanks,
Armin Wolf

