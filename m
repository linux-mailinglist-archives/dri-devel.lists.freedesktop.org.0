Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C705832FB7
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 21:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651F610EA6C;
	Fri, 19 Jan 2024 20:23:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FC5510EA6C
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 20:22:59 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 64B492FC0077;
 Fri, 19 Jan 2024 21:22:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1705695777;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s3KB8fN1v11h06dDAChI3rThEEmVbSHsahcI++DtPIU=;
 b=W48PXxH98jl59z8cPo3sKMW1zTP7z+54nd2fx/eDRv/x17PK0rrASStRSulK62Zvx8oC1k
 c0Lt2w6WRRXqmefYboiY4vSa7hC4gNQ4ZzGNCrioC1rGuZ8TX23lpo2GSMr1K9e4iln8Mr
 a8PeXyISJub1qytbPrp2YCPSa6SpHLM=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <36973f9d-bf67-417d-998c-ce24c38322c3@tuxedocomputers.com>
Date: Fri, 19 Jan 2024 21:22:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Pavel Machek <pavel@ucw.cz>, Hans de Goede <hdegoede@redhat.com>
References: <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
 <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
 <ZarYSkzISyS+wuYR@duo.ucw.cz>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <ZarYSkzISyS+wuYR@duo.ucw.cz>
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
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Am 19.01.24 um 21:15 schrieb Pavel Machek:
> Hi!
>
>>>> 2. Implement per-key keyboards as auxdisplay
>>>>
>>>>      - Pro:
>>>>
>>>>          - Already has a concept for led positions
>>>>
>>>>          - Is conceptually closer to "multiple leds forming a singular entity"
>>>>
>>>>      - Con:
>>>>
>>>>          - No preexisting UPower support
>>>>
>>>>          - No concept for special hardware lightning modes
>>>>
>>>>          - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
>>> Please do this one.
>> Ok, so based on the discussion so far and Pavel's feedback lets try to
>> design a custom userspace API for this. I do not believe that auxdisplay
>> is a good fit because:
> Ok, so lets call this a "display". These days, framebuffers and drm
> handles displays. My proposal is to use similar API as other displays.
>
>> So my proposal would be an ioctl interface (ioctl only no r/w)
>> using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.
>>
>> For per key controllable rgb LEDs we need to discuss a coordinate
>> system. I propose using a fixed size of 16 rows of 64 keys,
>> so 64x16 in standard WxH notation.
>>
>> And then storing RGB in separate bytes, so userspace will then
>> always send a buffer of 192 bytes per line (64x3) x 14 rows
>> = 3072 bytes. With the kernel driver ignoring parts of
>> the buffer where there are no actual keys.
> That's really really weird interface. If you are doing RGB888 64x14,
> lets make it a ... display? :-).
>
> ioctl always sending 3072 bytes is really a hack.
>
> Small displays exist and are quite common, surely we'd handle this as
> a display:
> https://pajenicko.cz/displeje/graficky-oled-displej-0-66-64x48-i2c-bily-wemos-d1-mini
> It is 64x48.
>
> And then there's this:
> https://pajenicko.cz/displeje/maticovy-8x8-led-displej-s-radicem-max7219
> and this:
> https://pajenicko.cz/displeje/maticovy-8x32-led-displej-s-radicem-max7219
>
> One of them is 8x8.
>
> Surely those should be displays, too?

But what about a light bar with, lets say, 3 zones. Is that a 3x1 display?

And what about a mouse having lit mousebuttons and a single led light bar at the 
wrist: a 2x2 display, but one is thin but long and one is not used?

Regards,

Werner

>
> And yes, we'd probably want some extra ioctls on top, for example to
> map from input device to this and back, and maybe for various effects,
> too. And yes, I realize that display with holes in it and with some
> pixels bigger than others is weird, but it still looks like a display
> to me. (And phones have high-res displays with rounded corners and
> holes in them, so... we'll need to deal with weird displays anyway).
>
> Best regards,
> 								Pavel
