Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1136F8325F1
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 09:44:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8005110E988;
	Fri, 19 Jan 2024 08:44:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45BB110E988
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 08:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705653853;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MJTkm+mOw+g+wQwvmg6Px3ajeLTkr/0B7LPwNJlQxg0=;
 b=ZtZv2Yw5jq35B+QEx8K8nChFSO2bHkkDOdBE/6yewrxBfMuya09pq70ScRjp3Pk8OuX/1l
 gVmZCTqqfRrdNwEv2luDTmmmDYv5Cy2Ab7sbHXA+S/dt1IRBVDWKYCR/Wnac5WcKgWpth0
 kgfO6NDsrNE6XaAoso78AKjwBWqa7ho=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-44-4XGHVdFbMVSpL31Ijt6GDw-1; Fri, 19 Jan 2024 03:44:12 -0500
X-MC-Unique: 4XGHVdFbMVSpL31Ijt6GDw-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-a2f71c83b7eso25356566b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Jan 2024 00:44:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705653851; x=1706258651;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MJTkm+mOw+g+wQwvmg6Px3ajeLTkr/0B7LPwNJlQxg0=;
 b=pyBJor53A4p0I6NpU5a3e5meMWSK1rcSECRwdimTE1Bhlgt7/3Zk6LtoQEXlAMA6bh
 o8BYlEJM5JN4MCdCvcB/hhHRbIgZUFs8Sih9J71er6WBfaHFwhydVeFIJyVPxkRy3sYS
 9uZYDhuCPnDIGfafr/fjojGvWHONP6y+chBu4GCwTAldKaR9g4pb++dbS01IyJPYZ1nX
 42ciCzek0DKSJnbgsJ73Ynsu+Jn1Ti8aXeK5H9gE5MCNJG9VZ3XxXNZm8zFFUZMObY8D
 0nd2697FSoqOdBjJxA65URLLOnryy0ntSs9ADuw4M5iIXzmmz/y7b97mQuBfj3eUONXX
 d/OA==
X-Gm-Message-State: AOJu0YykLK36GPdiHr6CpfZ5yy16GBkDieFhjZ9qzyMa/Y+zuQyjUwza
 QkHTfLrsGAbMoSuj9ex4HwZW3QUeF/AHyTjxqzakBO1B5bpi07Imft3lHs5ecTAoXv6YPU2Z9og
 7mRfmG06XlDiu0Hkv83QOHqxdThLSd5mTdF8qot+e5WCPP1e875aZbfockgmVg7FQyA==
X-Received: by 2002:a17:907:970a:b0:a28:d122:ef4a with SMTP id
 jg10-20020a170907970a00b00a28d122ef4amr1014786ejc.125.1705653850888; 
 Fri, 19 Jan 2024 00:44:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEPaki7Nvh5s+ZRsiTzSg8e/2nNuxfLn/8eX3GvtF22Txji1mc1ty+kzsiF/OK7tcW1i5nY+A==
X-Received: by 2002:a17:907:970a:b0:a28:d122:ef4a with SMTP id
 jg10-20020a170907970a00b00a28d122ef4amr1014778ejc.125.1705653850502; 
 Fri, 19 Jan 2024 00:44:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 ti8-20020a170907c20800b00a2da4738882sm6498313ejc.131.2024.01.19.00.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 19 Jan 2024 00:44:09 -0800 (PST)
Message-ID: <6bbfdd62-e663-4a45-82f4-445069a8d690@redhat.com>
Date: Fri, 19 Jan 2024 09:44:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Implement per-key keyboard backlight as auxdisplay?
To: Pavel Machek <pavel@ucw.cz>, Werner Sembach <wse@tuxedocomputers.com>
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
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZaljwLe7P+dXHEHb@duo.ucw.cz>
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
Cc: Lee Jones <lee@kernel.org>, jikos@kernel.org, linux-kernel@vger.kernel.org,
 Jelle van der Waa <jelle@vdwaa.nl>,
 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 linux-input@vger.kernel.org, ojeda@kernel.org, linux-leds@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/18/24 18:45, Pavel Machek wrote:
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
> 
>>     - Con:
>>
>>         - Violates the simplicity paradigm of the leds interface (e.g. with
>> this one leds entry controls possible multiple leds)
> 
> Let's not do this.
> 
>> 2. Implement per-key keyboards as auxdisplay
>>
>>     - Pro:
>>
>>         - Already has a concept for led positions
>>
>>         - Is conceptually closer to "multiple leds forming a singular entity"
>>
>>     - Con:
>>
>>         - No preexisting UPower support
>>
>>         - No concept for special hardware lightning modes
>>
>>         - No support for arbitrary led outlines yet (e.g. ISO style enter-key)
> 
> Please do this one.

Ok, so based on the discussion so far and Pavel's feedback lets try to
design a custom userspace API for this. I do not believe that auxdisplay
is a good fit because:

- auxdisplay is just a directory name, it does not seem to clearly
  define an API

- instead the deprecated /dev/fb API is used which is deprecated

- auxdisplays are very much displays (hence /dev/fb) they are typically
  small LCD displays with a straight widthxheight grid of square pixels

- /dev/fb does gives us nothing for effects, zoned keyboard, etc.

So my proposal would be an ioctl interface (ioctl only no r/w)
using /dev/rgbkbd0 /dev/rgbkdb1, etc. registered as a misc chardev.

For per key controllable rgb LEDs we need to discuss a coordinate
system. I propose using a fixed size of 16 rows of 64 keys,
so 64x16 in standard WxH notation.

And then storing RGB in separate bytes, so userspace will then
always send a buffer of 192 bytes per line (64x3) x 14 rows
= 3072 bytes. With the kernel driver ignoring parts of
the buffer where there are no actual keys.

I would then like the map the standard 105 key layout onto this,
starting at x.y (column.row) coordinates of 16.6 (with 0.0 being
the top left). Leaving plenty of space on the left top and right
(and some on the bottom) for extra media key rows, macro keys, etc.

The idea to have the standard layout at a fixed place is to allow
userspace to have a database of preset patterns which will work
everywhere.

Note I say standard 105 key layout, but in reality for
defining the standardized part of the buffer we should
use the maximum amount of keys per row of all the standard layouts,
so for row 6 (the ESC row) and for extra keys on the right outside
the main block we use the standard layout as shown here:

http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg

For the main area of the keyboard looking at:

http://bopqehorizon.weebly.com/uploads/1/3/4/3/134337299/913246919_orig.png

We want to max rows per key, so this means that per row we use
(from the above image) :

row  7: 106/109 - JIS 
row  8: 101/104 - ANSI
row  9: 102/105 - ISO
row 10: 104/107 - ABNT
row 11: 106/109 - JIS

(with row 7 being the main area top row)

This way we can address all the possible keys in the various
standard layouts in one standard wat and then the drivers can
just skip keys which are not there when preparing the buffer
to send to the hw / fw.

One open question is if we should add padding after the main
area so that the printscreen / ins / del / leftarrow of the
"middle" block of 

http://www.maxkeyboard.com/images/105_ISO_6_25_Key_Layout.jpg

all start at the same x (say 32) or we just pack these directly
after the main area.

And the same question for the numlock block, do we align
this to an x of say 36, or pack it ?


As for the actual IOCTL API I think there should be
the following ioctls:

1. A get-info ioctl returning a struct with the following members:

{
char name[64]      /* Keyboard model name / identifier */
int row_begin[16]; /* The x address of the first available key per row. On a std 105key kbd this will be 16 for rows 6-11, 0 for other rows */
int row_end[16];   /* x+1 for the address of the last available key per row, end - begin gives number of keys in a row */
int rgb_zones;     /* number of rgb zones for zoned keyboards. Note both
                      zones and per key addressing may be available if
                      effects are applied per zone. */
?
}

2. A set-leds ioctl which takes the earlier discussed 3092 bytes buffer
to set all the LEDs at once, only valid if at least one row has a non 0 lenght.

3. A set-zones ioctl which takes an array of bytes sized 3 * number-of-zones
containing RGB values for each zone

4. A enum_effects ioctl which takes a struct with the following members:

{
long size; /* Size of passed in struct including the size member itself */
long effects_mask[]
}

the idea being that there is an enum with effects, which gets extended
as we encounter more effects and the bitmask in effects_mask has a bit set
for each effects enum value which is supported. effects_mask is an array
so that we don't run out of bits. If older userspace only passes 1 long
(size == (2*sizeof(long)) when 2 are needed at some point in the future 
then the kernel will simply only fill the first long.

5. A set_effect ioctl which takes a struct with the following members:

{
long size; /* Size of passed in struct including the size member itself */
int effect_nr; /* enum value of the effect to enable, 0 for disable effect */
int zone;  /* zone to apply the effect to */
int speed; /* cycle speed of the effect in milli-hz */
char color1[3]; /* effect dependend may be unused. */
char color2[3]; /* effect dependend may be unused. */
}

Again the idea with the size member is that the struct can be extended with
new members if necessary and the kernel will supply a default value for
older userspaces which provide a smaller struct (note size being smaller
then sizeof(struct-v1) will invalid).


Note this is all just a rough sketch suggestions welcome!

Regards,

Hans



