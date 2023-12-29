Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D8C3820128
	for <lists+dri-devel@lfdr.de>; Fri, 29 Dec 2023 20:13:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EA6710E02A;
	Fri, 29 Dec 2023 19:13:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com
 [157.90.84.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB09E10E02A
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Dec 2023 19:13:48 +0000 (UTC)
Received: from [192.168.42.20] (p5de453e7.dip0.t-ipconnect.de [93.228.83.231])
 (Authenticated sender: wse@tuxedocomputers.com)
 by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 1DA392FC006B;
 Fri, 29 Dec 2023 20:13:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
 s=default; t=1703877226;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SLTb8MHngpCr9Ay6alL/D0Bkd3X169eJXti2fNSNyUU=;
 b=Ud/KVEaLvSu5mZr8YUyKpZxPaKTMiVlzkT7gRzRovNYW5O6jE76s0nHvX3sKKkiqpQ4aT+
 g4FVQEN+xtw5YnRmzO2e8ZpaoD5WznFS69Z9PTGoEwWlaBAp0BBwGevuglfcPbg+8T7vN1
 xP2xSqZwiIfMaoLCgHz9FoImfR4yKeQ=
Authentication-Results: mail.tuxedocomputers.com;
 auth=pass smtp.auth=wse@tuxedocomputers.com
 smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <49f12cc1-2dce-43b3-addf-b0fdb7df8fdb@tuxedocomputers.com>
Date: Fri, 29 Dec 2023 20:13:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
From: Werner Sembach <wse@tuxedocomputers.com>
To: Hans de Goede <hdegoede@redhat.com>, Pavel Machek <pavel@ucw.cz>,
 Jani Nikula <jani.nikula@linux.intel.com>, jikos@kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>
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
 <f416fbca-589b-4f6a-aad6-323b66398273@tuxedocomputers.com>
 <4222268b-ff44-4b7d-bf11-e350594bbe24@redhat.com>
 <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
Content-Language: en-US
In-Reply-To: <ac02143c-d417-49e5-9c6e-150cbda71ba7@tuxedocomputers.com>
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
Cc: Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Hans & the others,

[snip]
> I also stumbled across a new Problem:
>
> We have an upcoming device that has a per-key keyboard backlight, but does the 
> control completely via a wmi/acpi interface. So no usable hidraw here for a 
> potential userspace driver implementation ...
>
> So a quick summary for the ideas floating in this thread so far:
>
> 1. Expand leds interface allowing arbitrary modes with semi arbitrary optional 
> attributes:
>
>     - Pro:
>
>         - Still offers all default attributes for use with UPower
>
>         - Fairly simple to implement from the preexisting codebase
>
>         - Could be implemented for all (to me) known internal keyboard backlights
>
>     - Con:
>
>         - Violates the simplicity paradigm of the leds interface (e.g. with 
> this one leds entry controls possible multiple leds)
>
> 2. Implement per-key keyboards as auxdisplay
>
>     - Pro:
>
>         - Already has a concept for led positions
>
>         - Is conceptually closer to "multiple leds forming a singular entity"
>
>     - Con:
>
>         - No preexisting UPower support
>
>         - No concept for special hardware lighting modes
>
>         - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
>
> 3. Implement in input subsystem
>
>     - Pro:
>
>         - Preexisting concept for keys and key purpose
>
>     - Con:
>
>         - Not in scope for subsystem
>
>         - No other preexisting light infrastructure
>
> 4. Implement a simple leds driver only supporting a small subset of the 
> capabilities and make it disable-able for a userspace driver to take over
>
>     - Pro:
>
>         - Most simple to implement basic support
>
>         - In scope for led subsystem simplicity paradigm
>
>     - Con:
>
>         - Not all built in keyboard backlights can be implemented in a 
> userspace only driver
>
> Kind Regards,
>
> Werner

Just a gentle bump and request for comments again. 4. would be better then 
nothing but it is not a universal future proof solution so I'm hesitant to put 
work into it even though it would be the simplest driver. I still tend towards 
1. as the leds interface already got expanded once with the multicolor stuff.

The only other way I see would be to implement a platform driver with no 
standardized api or implement a complete new api/subsystem from the ground up.

Kind Regards,

Werner

