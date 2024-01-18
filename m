Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D4D1832197
	for <lists+dri-devel@lfdr.de>; Thu, 18 Jan 2024 23:33:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9618B10E1BF;
	Thu, 18 Jan 2024 22:32:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D4D10E1BF
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Jan 2024 22:32:47 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id AC7DC2FC0077;
 Thu, 18 Jan 2024 23:32:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1705617166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TcAihJqhysfhWWUhnS+B4zIl0C6+wxno+qUkxODtDPs=;
 b=skrnqaFiJ30IpZ0KeddjZA0Z9cIyIwoe8HLgXuaXz4KKqIqEgsudvsukql3T+IOW2uDbHP
 jbaMWKK87uEsRCg4DQDKW+Bhy5QKSKPozbH+Z1GqYBHr+Ux753Hg5FX87UfK6mrFBDVuPi
 v6Aw2KkthLlUGXtzlf1gUT2gzI0QhP4=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <5f144fb7-647e-4488-af20-211e95679d1c@tuxedocomputers.com>
Date: Thu, 18 Jan 2024 23:32:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Pavel Machek <pavel@ucw.cz>
References: <aac81702-df1e-43a2-bfe9-28e9cb8d2282@tuxedocomputers.com>
 <ZSmg4tqXiYiX18K/@duo.ucw.cz>
 <CANiq72mfP+dOLFR352O0UNVF8m8yTi_VmOY1zzQdTBjPWCRowg@mail.gmail.com>
 <87sf61bm8t.fsf@intel.com> <ZVvHG/Q+V6kCnfKZ@duo.ucw.cz>
 <f4137e34-c7fb-4f21-bc93-1496cbf61fdf@tuxedocomputers.com>
 <8096a042-83bd-4b9f-b633-79e86995c9b8@redhat.com>
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
 <ZaljwLe7P+dXHEHb@duo.ucw.cz>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <ZaljwLe7P+dXHEHb@duo.ucw.cz>
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
Cc: jikos@kernel.org, Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>, Hans de Goede <hdegoede@redhat.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi

Am 18.01.24 um 18:45 schrieb Pavel Machek:
> Hi!
>
>> We have an upcoming device that has a per-key keyboard backlight, but does
>> the control completely via a wmi/acpi interface. So no usable hidraw here
>> for a potential userspace driver implementation ...
>>
>> So a quick summary for the ideas floating in this thread so far:
>>
>> 1. Expand leds interface allowing arbitrary modes with semi arbitrary
>> optional attributes:
>>      - Con:
>>
>>          - Violates the simplicity paradigm of the leds interface (e.g. with
>> this one leds entry controls possible multiple leds)
> Let's not do this.
>
>> 2. Implement per-key keyboards as auxdisplay
>>
>>      - Pro:
>>
>>          - Already has a concept for led positions
>>
>>          - Is conceptually closer to "multiple leds forming a singular entity"
>>
>>      - Con:
>>
>>          - No preexisting UPower support
>>
>>          - No concept for special hardware lightning modes
>>
>>          - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
> Please do this one.

2 more maybe cons to add to this that popped into my mind just now:

- How would lightbars, or mice fit into this?

- How do 3-zone, 4-zone, n-zone keyboards fit into this? aka how many zones to 
be considered an aux display?

>
>> 3. Implement in input subsystem
>>
>>      - Pro:
>>
>>          - Preexisting concept for keys and key purpose
>>
>>      - Con:
>>
>>          - Not in scope for subsystem
>>
>>          - No other preexisting light infrastructure
> Or negotiate with input people to do this.
>
>> 4. Implement a simple leds driver only supporting a small subset of the
>> capabilities and make it disable-able for a userspace driver to take over
> No. Kernel should abstract this away.
>
> Best regards,
> 									Pavel

Kind regards,

Werner

