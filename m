Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2E77A779A
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 11:32:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D528010E46F;
	Wed, 20 Sep 2023 09:32:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBDB910E2AE
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 09:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695202340;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=sQo8vDODXx3fYaCE4WfuBHpjkAu0nWv+Aif1bIm+G0c=;
 b=ZaFnVAPkMD2B7waWW9+2jTbuNzZu6JNJH/xPOd2UNzJWgkva+MuMXvjrrSzykQyL+VN4Hc
 aSGzq+4fV9oUq6lqFYzs9EZM6zL9txnoGHcW3idAnonTDLyoIjE54MTgeOq+8XPVj06Zl4
 ImR3yBtq7bFev2giZbhVQFnuFjKrb6w=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-px-DtjovOG-eYguyPW-e9w-1; Wed, 20 Sep 2023 05:32:17 -0400
X-MC-Unique: px-DtjovOG-eYguyPW-e9w-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-532b7ee264cso1407967a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 02:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695202336; x=1695807136;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sQo8vDODXx3fYaCE4WfuBHpjkAu0nWv+Aif1bIm+G0c=;
 b=xTmDlD7LEyJsHjl8ymp0yz5WmC9BN0zCDbNqTs719QSFZBiwyWqO5J5ufRhg8R1HaX
 CnQBSniaA1IC6rZBljt++R/eJgXJbvzEKi/ZPR3lw+i+O49B3NTu1lkH7rrdsmb7M0iC
 GqRcHiIiJAd+0WQ+BRvJot0U/VBvK+F0NyBQ9WN6KV3WTe67qn6Rimwh1DCP5PLQ7j7D
 GkgKZaoPSUwQMaEaVXcferDBpKlVY09oqPe4JMrFt8tTKyZHRYhyW030L4N/8lqMqQvK
 M/QoxrZdOc+POdZBYolmI74+WcRyPo3BjPmnwF+4hZQ07r7a3+lNXtuteHcwrJVpurnE
 LDlw==
X-Gm-Message-State: AOJu0Yy+0s4D4YXFh1409ntIu9/Yj3szRP/t9MObtrVTJqtIWOXPL1gZ
 5IEJ6Lg5X1aLGMF4UtGzqm0NeVWZ66TSwh5zNFaLdLNPd+O6h93S2kCKYGueJz+YZDM/NtBtnVz
 OGfZ2bszEjuqMXv4TLoTCX+RH/xFc
X-Received: by 2002:aa7:c54f:0:b0:530:ccf7:37af with SMTP id
 s15-20020aa7c54f000000b00530ccf737afmr1655280edr.12.1695202335953; 
 Wed, 20 Sep 2023 02:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFaUP5dVk9CWrrPSr4tZuRr3vNxGCrFv9HX3iFf0s8C4SfG5v0k/wBMpGQFXLN/ulBtdLvDqw==
X-Received: by 2002:aa7:c54f:0:b0:530:ccf7:37af with SMTP id
 s15-20020aa7c54f000000b00530ccf737afmr1655263edr.12.1695202335605; 
 Wed, 20 Sep 2023 02:32:15 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 fg5-20020a056402548500b00530aae2d5bfsm6429345edb.9.2023.09.20.02.32.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 20 Sep 2023 02:32:14 -0700 (PDT)
Message-ID: <b85fe6f1-3c1b-4bca-25c5-7b0e6441ed27@redhat.com>
Date: Wed, 20 Sep 2023 11:32:14 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v3 1/1] backlight: hid_bl: Add VESA VCP HID backlight
 driver
To: Julius Zint <julius@zint.sh>
References: <20230820094118.20521-1-julius@zint.sh>
 <20230820094118.20521-2-julius@zint.sh>
 <f2e1ab9e-e691-42e1-a600-42744f692922@t-8ch.de>
 <9a5364de-28e1-1d4a-1d3a-d6dcedb7e659@zint.sh>
 <f95da7ff-06dd-2c0e-d563-7e5ad61c3bcc@redhat.com>
 <afed6395-8680-7e2c-d88c-8bb5f3c39346@zint.sh>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <afed6395-8680-7e2c-d88c-8bb5f3c39346@zint.sh>
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
 linux-fbdev@vger.kernel.org, linux-input@vger.kernel.org,
 =?UTF-8?Q?Thomas_Wei=c3=9fschuh?= <thomas@t-8ch.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 9/19/23 19:46, Julius Zint wrote:
> 
> 
> On Wed, 6 Sep 2023, Hans de Goede wrote:
> 
>> Hi Julius,
>>
>> On 9/4/23 21:02, Julius Zint wrote:
>>>
>>>
>>> On Mon, 4 Sep 2023, Thomas Weißschuh wrote:
>>>
>>>> +Cc Hans who ins involved with the backlight subsystem
>>>>
>>>> Hi Julius,
>>>>
>>>> today I stumbled upon a mail from Hans [0], which explains that the
>>>> backlight subsystem is not actually a good fit (yet?) for external
>>>> displays.
>>>>
>>>> It seems a new API is in the works that would better fit, but I'm not
>>>> sure about the state of this API. Maybe Hans can clarify.
>>>>
>>>> This also ties back to my review question how userspace can figure out
>>>> to which display a backlight devices applies. So far it can not.
>>>>
>>>> [0] https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/
>>>>
>>>
>>> Hi Thomas,
>>>
>>> thanks for the hint. I will make sure to give this a proper read and
>>> see, if it fits my use case better then the current backlight subsystem.
>>
>> Note the actual proposal for the new usespace API for display brightness
>> control is here:
>>
>> https://lore.kernel.org/dri-devel/b61d3eeb-6213-afac-2e70-7b9791c86d2e@redhat.com/
>>
>> I have finished / stabilized the backlight code refactor which I landed
>> in 6.1, which is a prerequisite for the above proposal. But I have not
>> been able to make time to actually implement the above proposal; and
>> I don't know when I will be able to make time for this.
>>
>>> Especially since I wasnt able to properly address your other review
>>> comments for now. You are right that the name should align better with
>>> the kernel module and also, that it is possible for multiple displays to
>>> be attached.
>>>
>>> In its current state, this would mean that you could only control the
>>> backlight for the first HID device (enough for me :-).
>>>
>>> The systemd-backlight@.service uses not only the file name, but also the
>>> full bus path for storing/restoring backlights. I did not yet get around
>>> to see how the desktops handle brightness control, but since the
>>> systemd-backlight@.service already uses the name, its important to stay
>>> the same over multiple boots.
>>>
>>> I would be able to get a handle on the underlying USB device and use the
>>> serial to uniquely (and persistently) name the backlight. But it does
>>> feel hacky doing it this way.
>>
>> So mutter (gnome-shell compositor library) has a similar issue when saving
>> monitor layouts and I can tell you beforehand that monitor serial numbers
>> by themselves are not unique enough. Some models just report 123456789
>> as serial and if you have a dual-monitor setup with 2 such monitors
>> and name the backlight class device <serial>-vcp-hid or something like that
>> you will still end up with 2 identical names.
>>
>> To avoid this when saving monitor layouts mutter saves both the port
>> to which the monitor is attached (e.g. DP-1 DP-2) and the serialnumber
>> and on startup / monitor hotplug when it checks to see if it has saved
>> layout info for the monitor it checks the port+serialnr combination.
>>
>> So what I think you should do is figure out a way to map which
>> VCP HID device maps to which drm-connector and then use
>> the connector-name + serial-nr to generate the backlight device name.
>>
>> We will need the mapping the a drm-connector object anyway for
>> the new brightness API proposal from above.
>>
>> Note this does NOT solve the fact that registering a new backlight
>> class device for an external monitor on a laptop will hopelessly
>> confuse userspace, see:
>>
>> https://lore.kernel.org/lkml/7f2d88de-60c5-e2ff-9b22-acba35cfdfb6@redhat.com/
>>
>> Regards,
>>
>> Hans
>>
> 
> Thank you for all this additional information. I have watched the talks
> and read up upon the mail threads you`ve linked.

Now I wonder which presentation you have watched, did you watch
the old XDC2014 presentation ?  Note I gave a much more up2date
presentation on this at kernel-recipes last year:

https://kernel-recipes.org/en/2022/talks/new-userspace-api-for-display-panel-brightness-control/

> I will see if I can make the mapping to the DRM connector and plan to
> update this patchset.

Sounds good.

Regards,

Hans

