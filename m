Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 498B279402A
	for <lists+dri-devel@lfdr.de>; Wed,  6 Sep 2023 17:20:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A09F310E694;
	Wed,  6 Sep 2023 15:19:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A7F110E694
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Sep 2023 15:19:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694013597;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YBGwnY8IJ4oOi26b7B4Xq+aeBiWJN7rJ48RnXu/dAI8=;
 b=FbWw5Jm6nbFlVJblQAhQevalVz0btcp63Fi4TLqQrk28P6NRdeyLiTWb1EY24FJ9+VT03c
 U8Ke1d0gX7SB03aKiYoBMr6Jl8eP2KQzZMcTYDOS8zTwwa4Ykfrkb4hyjYh6wsQw/S07CY
 hVRXzeeYiW5HOq2DL2IiHI6S5krNvDI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-90-_jAg1RlYOaGe6Q7_6Pm0iA-1; Wed, 06 Sep 2023 11:19:55 -0400
X-MC-Unique: _jAg1RlYOaGe6Q7_6Pm0iA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-51bef8bb689so1554609a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Sep 2023 08:19:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694013594; x=1694618394;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YBGwnY8IJ4oOi26b7B4Xq+aeBiWJN7rJ48RnXu/dAI8=;
 b=V8sUQg59QzNCrxJDVdvhV0+5wcPdASTBSp782EMD3pFHGzSltunAtPHmuyAZHa8yr9
 Z7isigZkVK37lpJljdENrbDNxFCb9wWW2Gqtc8IOxc7PiIlALwRAgQpYiEwOKB03u8gF
 j2DjCCe8c08h1vuTJRkKrzBnJB+4bNp1ROes6nEVjZS7tXxkWmnuBuy53vQ9VyKhuKDC
 SAEvMYgafx5xWg2Ueqf3bhSwWe2rGp3mhzIT7DX4TCohjY4yAF3VPczdpjez5UGHWgnf
 Sg+Hny4VcU1xJUZj/E9lrwSekwpKdAfqkVEzKqM02zTX8pHBasToIr3CBNQ09QtsT44M
 osQw==
X-Gm-Message-State: AOJu0YxtFWwBLMqvEl2usJ85Yzj1RKG+RANbodEyXpxcREPGJAFx4seW
 dbEVukKgVKMAe6rj7ScA+1XL9TebSbpWMu9+vFE2Y0J7bDLX8N/OIfd16N8hIpFnQUnWk1QJBdd
 MxxxiYKFLsnjNla/+nZJC4C7+YuPc
X-Received: by 2002:aa7:d704:0:b0:523:2e23:a0bf with SMTP id
 t4-20020aa7d704000000b005232e23a0bfmr3399254edq.11.1694013594555; 
 Wed, 06 Sep 2023 08:19:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHQRje1BTiQeDC0pKG0JIZJVNX1y7mzl6y7CEgKpmM02h2Jahwy26ejPbhXZUuWRDSrUFQtQg==
X-Received: by 2002:aa7:d704:0:b0:523:2e23:a0bf with SMTP id
 t4-20020aa7d704000000b005232e23a0bfmr3399238edq.11.1694013594219; 
 Wed, 06 Sep 2023 08:19:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 d17-20020aa7ce11000000b00522572f323dsm8504731edv.16.2023.09.06.08.19.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Sep 2023 08:19:53 -0700 (PDT)
Message-ID: <f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redhat.com>
Date: Wed, 6 Sep 2023 17:19:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
To: Julius Zint <julius@zint.sh>, =?UTF-8?Q?Thomas_Wei=c3=9fschuh?=
 <thomas@t-8ch.de>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
 <f2e1ab9e-e691-42e1-a600-42744f692922@t-8ch.de>
 <9a5364de-28e1-1d4a-1d3a-d6dcedb7e659@zint.sh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <9a5364de-28e1-1d4a-1d3a-d6dcedb7e659@zint.sh>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jiri Kosina <jikos@kernel.org>, Jingoo Han <jingoohan1@gmail.com>,
 Helge Deller <deller@gmx.de>, Lee Jones <lee@kernel.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Benjamin Tissoires <benjamin.tissoires@redhat.com>,
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Julius,

On 9/4/23 21:02, Julius Zint wrote:
> 
> 
> On Mon, 4 Sep 2023, Thomas Weißschuh wrote:
> 
>> +Cc Hans who ins involved with the backlight subsystem
>>
>> Hi Julius,
>>
>> today I stumbled upon a mail from Hans [0], which explains that the
>> backlight subsystem is not actually a good fit (yet?) for external
>> displays.
>>
>> It seems a new API is in the works that would better fit, but I'm not
>> sure about the state of this API. Maybe Hans can clarify.
>>
>> This also ties back to my review question how userspace can figure out
>> to which display a backlight devices applies. So far it can not.
>>
>> [0] https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/
>>
> 
> Hi Thomas,
> 
> thanks for the hint. I will make sure to give this a proper read and
> see, if it fits my use case better then the current backlight subsystem.

Note the actual proposal for the new usespace API for display brightness
control is here:

https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/

I have finished / stabilized the backlight code refactor which I landed
in 6.1, which is a prerequisite for the above proposal. But I have not
been able to make time to actually implement the above proposal; and
I don't know when I will be able to make time for this.

> Especially since I wasnt able to properly address your other review
> comments for now. You are right that the name should align better with
> the kernel module and also, that it is possible for multiple displays to
> be attached.
> 
> In its current state, this would mean that you could only control the
> backlight for the first HID device (enough for me :-).
> 
> The systemd-backlight@.service uses not only the file name, but also the
> full bus path for storing/restoring backlights. I did not yet get around
> to see how the desktops handle brightness control, but since the
> systemd-backlight@.service already uses the name, its important to stay
> the same over multiple boots.
> 
> I would be able to get a handle on the underlying USB device and use the
> serial to uniquely (and persistently) name the backlight. But it does
> feel hacky doing it this way.

So mutter (gnome-shell compositor library) has a similar issue when saving
monitor layouts and I can tell you beforehand that monitor serial numbers
by themselves are not unique enough. Some models just report 123456789
as serial and if you have a dual-monitor setup with 2 such monitors
and name the backlight class device <serial>-vcp-hid or something like that
you will still end up with 2 identical names.

To avoid this when saving monitor layouts mutter saves both the port
to which the monitor is attached (e.g. DP-1 DP-2) and the serialnumber
and on startup / monitor hotplug when it checks to see if it has saved
layout info for the monitor it checks the port+serialnr combination.

So what I think you should do is figure out a way to map which
VCP HID device maps to which drm-connector and then use
the connector-name + serial-nr to generate the backlight device name.

We will need the mapping the a drm-connector object anyway for
the new brightness API proposal from above.

Note this does NOT solve the fact that registering a new backlight
class device for an external monitor on a laptop will hopelessly
confuse userspace, see:

https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/

Regards,

Hans


