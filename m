Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 73D0F7F2E4E
	for <lists+dri-devel@lfdr.de>; Tue, 21 Nov 2023 14:29:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5353610E0B0;
	Tue, 21 Nov 2023 13:29:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E045710E0B0
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Nov 2023 13:29:35 +0000 (UTC)
Received: from [192.168.42.20] (p5b164862.dip0.t-ipconnect.de [91.22.72.98])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id B65852FC01F9;
 Tue, 21 Nov 2023 14:29:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1700573374;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oJvMBifarv+hJKntJue/VPuBCrrPqYvgBBAEq0tUgBQ=;
 b=Yt0RXSrB8OTBqGx5lC1udvYoRk+uLncyJ6HykBuza5D5QHxSph0sgH15Zb4V4Uq6Yl7GiT
 17ChoLECQ+17MS3IN080yzOB8bageGcjIq5h8MWDWwWqA1L50jEY/SZPn/qkuzCEPKGcbQ
 YGEgcmRpYLyQLZ1VbogozQIxsgZ3gOg=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
Date: Tue, 21 Nov 2023 14:29:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
Content-Language: en-US
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org
References: <20231011190017.1230898-1-wse@tuxedocomputers.com>
 <ZSe1GYLplZo5fsAe@duo.ucw.cz>
 <0440ed38-c53b-4aa1-8899-969e5193cfef@tuxedocomputers.com>
 <ZSf9QneKO/8IzWhd@duo.ucw.cz>
 <a244a00d-6be4-44bc-9d41-6f9df14de8ee@tuxedocomputers.com>
 <ZSk16iTBmZ2fLHZ0@duo.ucw.cz>
 <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


Am 21.11.23 um 13:20 schrieb Hans de Goede:
> Hi Werner,
>
> On 11/21/23 12:33, Werner Sembach wrote:
>> Hi,
>>
>> Am 20.11.23 um 21:52 schrieb Pavel Machek:
>>> Hi!
>>>
>>>>>> So... a bit of rationale. The keyboard does not really fit into the
>>>>>> LED subsystem; LEDs are expected to be independent ("hdd led") and not
>>>>>> a matrix of them.
>>>>> Makes sense.
>>>>>
>>>>>> We do see various strange displays these days -- they commonly have
>>>>>> rounded corners and holes in them. I'm not sure how that's currently
>>>>>> supported, but I believe it is reasonable to view keyboard as a
>>>>>> display with slightly weird placing of pixels.
>>>>>>
>>>>>> Plus, I'd really like to play tetris on one of those :-).
>>>>>>
>>>>>> So, would presenting them as auxdisplay be acceptable? Or are there
>>>>>> better options?
>>>>> It sounds like a fair use case -- auxdisplay are typically simple
>>>>> character-based or small graphical displays, e.g. 128x64, that may not
>>>>> be a "main" / usual screen as typically understood, but the concept is
>>>>> a bit fuzzy and we are a bit of a catch-all.
>>>>>
>>>>> And "keyboard backlight display with a pixel/color per-key" does not
>>>>> sound like a "main" screen, and having some cute effects displayed
>>>>> there are the kind of thing that one could do in the usual small
>>>>> graphical ones too. :)
>>>>>
>>>>> But if somebody prefers to create new categories (or subcategories
>>>>> within auxdisplay) to hold these, that could be nice too (in the
>>>>> latter case, I would perhaps suggest reorganizing all of the existing
>>>>> ones while at it).
>>>> One could also reasonably make the argument that controlling the
>>>> individual keyboard key backlights should be part of the input
>>>> subsystem. It's not a display per se. (Unless you actually have small
>>>> displays on the keycaps, and I think that's a thing too.)
>>> While it would not be completely crazy to do that... I believe the
>>> backlight is more of a display and less of a keyboard. Plus input
>>> subystem is very far away from supporting this, and we had no input
>>> from input people here.
>>>
>>> I don't think LED subsystem is right place for this, and I believe
>>> auxdisplay makes slightly more sense than input.
>>>
>>> Unless someone steps up, I'd suggest Werner tries to implement this as
>>> an auxdisplay. [And yes, this will not be simple task. RGB on LED is
>>> different from RGB on display. But there are other LED displays, so
>>> auxdisplay should handle this. Plus pixels are really funnily
>>> shaped. But displays with missing pixels -- aka holes for camera --
>>> are common in phones, and I believe we'll get variable pixel densities
>>> -- less dense over camera -- too. So displays will have to deal with
>>> these in the end.]
>> Another idea I want to throw in the mix:
>>
>> Maybe the kernel is not the right place to implement this at all. RGB stuff is not at all standardized and every vendor is doing completely different interfaces, which does not fit the kernel userpsace apis desire to be uniformal and fixed. e.g. Auxdisplay might fit static setting of RGB values, but it does not fit the snake-effect mode, or the raindrops mode, or the 4-different-colors-in-the-edges-breathing-and-color-cycling mode.
>>
>> So my current idea: Implement these keyboards as a single zone RGB kbd_backlight in the leds interface to have something functional out of the box, but make it runtime disable-able if something like https://gitlab.com/CalcProgrammer1/OpenRGB wants to take over more fine granular control from userspace via hidraw.
> That sounds like a good approach to me. We are seeing the same with game controllers where steam and wine/proton also sometimes use hidraw mode to get access to all the crazy^W interesting features.
>
> That would mean that all we need to standardize and the kernel <-> userspace API level is adding a standard way to disable the single zone RGB kbd_backlight support in the kernel.

I would suggest a simple "enable" entry. Default is 1. When set to 0 the kernel 
driver no longer does anything.

Questions:

- Should the driver try to reset the settings to boot default? Or just leave the 
device in the current state? With the former I could see issues that they 
keyboard is flashing when changing from kernelspace control to userspace 
control. With the later the burden on bringing the device to a know state lies 
with the userspace driver.

- Should this be a optional entry that only shows up on drivers supporting it, 
or could this implemented in a generic way affecting all current led entries?

- I guess UPower integration for the userspace driver could be archived with 
https://www.kernel.org/doc/html/latest/leds/uleds.html however this limited to 
brightness atm, so when accent colors actually come to UPower this would also 
need some expansion to be able to pass a preferred color to the userspace driver 
(regardless of what that driver is then doing with that information).

On a different note: This approach does currently not cover the older EC 
controlled 3 zone keyboards from clevo. Here only the kernel has access access 
to the device so the kernel driver has to expose all functionality somehow. 
Should this be done by an arbitrarily designed platform device?

Kind regards,

Werner

>
> Regards,
>
> Hans
>
>
