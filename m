Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BC01B8406CA
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 14:25:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0467D10E954;
	Mon, 29 Jan 2024 13:24:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A841C10E954
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 13:24:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1706534680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BGlFJrp2hLINa9F8XlDW2FVIbAYnTd96Mns8ZAb4VDE=;
 b=Lfn/I/mVpDpfPflUPKiMBQCx9MUSU4XkpQfS8wxV2VnQ8nhYJMJBqcxpL0fBtPq7X9d4Qh
 79UXrg/ExZ7W9lv5aRQfL3K2I7sMZOWBb16XA/Rlyd7mO5Lwt3PleHXalZ4zNjAZtVb2ro
 crz0B40gxW+ggz6aLYK4foAeho8kWOw=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-209-la3sCrDaPSmlu8k_M87w0A-1; Mon, 29 Jan 2024 08:24:39 -0500
X-MC-Unique: la3sCrDaPSmlu8k_M87w0A-1
Received: by mail-lf1-f72.google.com with SMTP id
 2adb3069b0e04-5101e82696bso1941965e87.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Jan 2024 05:24:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706534678; x=1707139478;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BGlFJrp2hLINa9F8XlDW2FVIbAYnTd96Mns8ZAb4VDE=;
 b=EQUGyLFg1IJAxHqiJizmhmz3e8aX5jOCf6Bw5CHx2ZJl7L8/T749e8NIfG0ziUKF6I
 TGhVjwLPHyOc6HjG99fkll2XJ7Sm8ynZiselsH4pnIiUr/RAZvphefDwM0a7zP6fPWb5
 ucENiUJS9BtR/94bonhROnEZ2s/6Z8RWkZ3vtWW/fi4IGlZ0bIPK62Gsh11OGvHQG42U
 TG2SKkaKEgWHDGbJoXeLYPYMRd++PiaKnI4XPLKOeD7DLYUmStO9/QdGniSxFn7UXl+4
 49BDckRw4Fa8axB6opMAYbSRg/9U3IJdbvFJk4Cdet5GRZdDHGyS+63NFiuJvM+NUA+V
 kQcQ==
X-Gm-Message-State: AOJu0YxrrB3sv5lvbbmQBwgtERfj763drP0nXukEAD0nDmgE7xrSy0y3
 TQ2T7yGeCeO1p1I2YCkLuZUasl2G7VGPVtMe2hou0IbNokNa4FvH7T2gDOXXtxyQ3sNyFLGlAdZ
 9kN1Yc5ywxLCczaoWck6fqtAWCgnBnfZlZd01T/ulH7RdoIWTW8Zi5kU85qbXCKVvUQ==
X-Received: by 2002:a05:6512:2019:b0:510:d7e:4cbe with SMTP id
 a25-20020a056512201900b005100d7e4cbemr2856027lfb.63.1706534677940; 
 Mon, 29 Jan 2024 05:24:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH2N6aqVZGWGTsGYC6uZhJGvG/Rt9NH6BcQcbE2XifyO9LcSwUAWCUTThWz4kwbtJvSoGU7GA==
X-Received: by 2002:a05:6512:2019:b0:510:d7e:4cbe with SMTP id
 a25-20020a056512201900b005100d7e4cbemr2856016lfb.63.1706534677633; 
 Mon, 29 Jan 2024 05:24:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 vg10-20020a170907d30a00b00a356c0fdd2csm2164303ejc.26.2024.01.29.05.24.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jan 2024 05:24:37 -0800 (PST)
Message-ID: <bf47614c-0270-462d-9cad-ff415a3a3d81@redhat.com>
Date: Mon, 29 Jan 2024 14:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Pavel Machek <pavel@ucw.cz>
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZarYSkzISyS+wuYR@duo.ucw.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
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
Cc: jikos@kernel.org,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Lee Jones <lee@kernel.org>, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Werner Sembach <wse@tuxedocomputers.com>, linux-input@vger.kernel.org,
 ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/19/24 21:15, Pavel Machek wrote:
> Hi!
> 
>>>> 2. Implement per-key keyboards as auxdisplay
>>>>
>>>>     - Pro:
>>>>
>>>>         - Already has a concept for led positions
>>>>
>>>>         - Is conceptually closer to "multiple leds forming a singular entity"
>>>>
>>>>     - Con:
>>>>
>>>>         - No preexisting UPower support
>>>>
>>>>         - No concept for special hardware lightning modes
>>>>
>>>>         - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
>>>
>>> Please do this one.
>>
>> Ok, so based on the discussion so far and Pavel's feedback lets try to
>> design a custom userspace API for this. I do not believe that auxdisplay
>> is a good fit because:
> 
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
> 
> That's really really weird interface. If you are doing RGB888 64x14,
> lets make it a ... display? :-).
> 
> ioctl always sending 3072 bytes is really a hack.
> 
> Small displays exist and are quite common, surely we'd handle this as
> a display:
> https://pajenicko.cz/displeje/graficky-oled-displej-0-66-64x48-i2c-bily-wemos-d1-mini
> It is 64x48.

This is indeed a display and should use display APIs

> And then there's this:
> https://pajenicko.cz/displeje/maticovy-8x8-led-displej-s-radicem-max7219
> and this:
> https://pajenicko.cz/displeje/maticovy-8x32-led-displej-s-radicem-max7219
>
> One of them is 8x8.
> 
> Surely those should be displays, too?

The 8x8 one not really, the other one could be used to scroll
some text one but cannot display images, so not really displays
IMHO.

Anyways we are talking about keyboards here and those do not have
a regular x-y grid like your example above, so they certainly do
not count as displays. See the long discussion earlier in the thread.

Regards,

Hans




