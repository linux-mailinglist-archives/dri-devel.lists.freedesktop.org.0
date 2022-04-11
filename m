Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B067C4FB945
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 12:18:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 667D910EFFD;
	Mon, 11 Apr 2022 10:18:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7740810EC2C
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 10:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649672316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+mi3CkrxQA8BiHQES8EDnp5tWrJVyuGmGvT8wuOBp7o=;
 b=f/km10TfAit/Htpv80jhgb5x4dDVnYefisUPA8mdF1YhVcEqQEYM4HT0UU9/CMAH0WRsgg
 4fiVGXL6N0mz2RHrfMORrl6Gt7ImIHyLaF28xLZ/SOW2EyUtY5MUNMu7cRo+pGRpgYKe5N
 i95tVG7uVAJF6T0+eY7R8fQFxenGRtM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-63-PdWX5T_iMTqB0eG8o64bow-1; Mon, 11 Apr 2022 06:18:32 -0400
X-MC-Unique: PdWX5T_iMTqB0eG8o64bow-1
Received: by mail-ed1-f71.google.com with SMTP id
 o20-20020aa7dd54000000b00413bc19ad08so8724441edw.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 03:18:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+mi3CkrxQA8BiHQES8EDnp5tWrJVyuGmGvT8wuOBp7o=;
 b=ybLl6ukQVq1WoZPDZyrlTvm3h4pUXUb6WGHwb63Lh/8RnliSFkr5hAT8m7th8D9NxG
 FqQ2cvalTq7xVdt3q/3uv31qOCerMYs9/E0iOZ9WnNzE+2pp0asFZF6cGONTcQM2dg1P
 BPmnO4As9ofNZoiI1jBJ6NV+JdSI5rm2zPv8Atx7Xojl9msCfJdI+Sg7IuG+wdJz6+0S
 +N56Xm3gjdmmLDZ06J3IDzRv9MS7G4DIAjPRG1RPFzdJXIN6HZIaslbSvhAUnffitz6Y
 TP3ss/L+KrPOYo6uXkr4uzfkMV79OKIX//WMplDK/7+Vv8EuVEzZTFVZ4ZO3DZl7YjE1
 9GbA==
X-Gm-Message-State: AOAM532gs7DIu7wesR1nWU1nG5sS4+OO8xyXzzF2qoZ72vR4p3YgVmSZ
 65XfN0LtICkU5emMv3+tZY81odjYQs3OThTZjmFqqyVZxgWApWN1p88cmWi9s8+EOfop230LTVB
 pcxuqqCVlxnM+YvB2njBsW93ltOB0
X-Received: by 2002:a17:906:b157:b0:6d0:9f3b:a6aa with SMTP id
 bt23-20020a170906b15700b006d09f3ba6aamr29180748ejb.365.1649672311269; 
 Mon, 11 Apr 2022 03:18:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxO4v3ReIpbmZcmrYpBvhBod8MgiaRYKreIneMoI0lgqfiNMfJiYKqTSrRQVUQE09ZnVbCxnQ==
X-Received: by 2002:a17:906:b157:b0:6d0:9f3b:a6aa with SMTP id
 bt23-20020a170906b15700b006d09f3ba6aamr29180730ejb.365.1649672310966; 
 Mon, 11 Apr 2022 03:18:30 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 w22-20020a056402269600b004194f4eb3e7sm15353779edd.19.2022.04.11.03.18.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 03:18:30 -0700 (PDT)
Message-ID: <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
Date: Mon, 11 Apr 2022 12:18:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Alex Deucher <alexdeucher@gmail.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hdegoede@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
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
Cc: Sebastian Wick <sebastian.wick@redhat.com>,
 Martin Roukala <martin.roukala@mupuf.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 wayland <wayland-devel@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 4/8/22 17:11, Alex Deucher wrote:
> On Fri, Apr 8, 2022 at 10:56 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 4/8/22 16:08, Alex Deucher wrote:
>>> On Fri, Apr 8, 2022 at 4:07 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>>>>
>>>> On Thu, Apr 07, 2022 at 05:05:52PM -0400, Alex Deucher wrote:
>>>>> On Thu, Apr 7, 2022 at 1:43 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>
>>>>>> Hi Simon,
>>>>>>
>>>>>> On 4/7/22 18:51, Simon Ser wrote:
>>>>>>> Very nice plan! Big +1 for the overall approach.
>>>>>>
>>>>>> Thanks.
>>>>>>
>>>>>>> On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
>>>>>>>
>>>>>>>> The drm_connector brightness properties
>>>>>>>> =======================================
>>>>>>>>
>>>>>>>> bl_brightness: rw 0-int32_max property controlling the brightness setting
>>>>>>>> of the connected display. The actual maximum of this will be less then
>>>>>>>> int32_max and is given in bl_brightness_max.
>>>>>>>
>>>>>>> Do we need to split this up into two props for sw/hw state? The privacy screen
>>>>>>> stuff needed this, but you're pretty familiar with that. :)
>>>>>>
>>>>>> Luckily that won't be necessary, since the privacy-screen is a security
>>>>>> feature the firmware/embedded-controller may refuse our requests
>>>>>> (may temporarily lock-out changes) and/or may make changes without
>>>>>> us requesting them itself. Neither is really the case with the
>>>>>> brightness setting of displays.
>>>>>>
>>>>>>>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
>>>>>>>> of the display's brightness setting. This will report 0 when brightness
>>>>>>>> control is not available (yet).
>>>>>>>
>>>>>>> I don't think we actually need that one. Integer KMS props all have a
>>>>>>> range which can be fetched via drmModeGetProperty. The max can be
>>>>>>> exposed via this range. Example with the existing alpha prop:
>>>>>>>
>>>>>>>     "alpha": range [0, UINT16_MAX] = 65535
>>>>>>
>>>>>> Right, I already knew that, which is why I explicitly added a range
>>>>>> to the props already. The problem is that the range must be set
>>>>>> before registering the connector and when the backlight driver
>>>>>> only shows up (much) later during boot then we don't know the
>>>>>> range when registering the connector. I guess we could "patch-up"
>>>>>> the range later. But AFAIK that would be a bit of abuse of the
>>>>>> property API as the range is intended to never change, not
>>>>>> even after hotplug uevents. At least atm there is no infra
>>>>>> in the kernel to change the range later.
>>>>>>
>>>>>> Which is why I added an explicit bl_brightness_max property
>>>>>> of which the value gives the actual effective maximum of the
>>>>>> brightness.
>>>>
>>>> Uh ... I'm not a huge fan tbh. The thing is, if we allow hotplugging
>>>> brightness control later on then we just perpetuate the nonsense we have
>>>> right now, forever.
>>>>
>>>> Imo we should support two kinds of drivers:
>>>>
>>>> - drivers which are non-crap, and make sure their backlight driver is
>>>>   loaded before they register the drm_device (or at least the
>>>>   drm_connector). For those we want the drm_connector->backlight pointer
>>>>   to bit static over the lifetime of the connector, and then we can also
>>>>   set up the brightness range correctly.
>>>>
>>>> - funny drivers which implement the glorious fallback dance which
>>>>   libbacklight implements currently in userspace. Imo for these drivers we
>>>>   should have a libbacklight_heuristics_backlight, which normalizes or
>>>>   whatever, and is also ways there. And then internally handles the
>>>>   fallback mess to the "right" backlight driver.
>>>>
>>>> We might have some gaps on acpi systems to make sure the drm driver can
>>>> wait for the backlight driver to show up, but that's about it.
>>>>
>>>> Hotplugging random pieces later on is really not how drivers work nowadays
>>>> with deferred probe and component framework and all that.
>>>>
>>>>>> I did consider using the range for this and updating it
>>>>>> on the fly I think nothing is really preventing us from
>>>>>> doing so, but it very much feels like abusing the generic
>>>>>> properties API.
>>>>>>
>>>>>>>> bl_brightness_0_is_min_brightness: ro, boolean
>>>>>>>> When this is set to true then it is safe to set brightness to 0
>>>>>>>> without worrying that this completely turns the backlight off causing
>>>>>>>> the screen to become unreadable. When this is false setting brightness
>>>>>>>> to 0 may turn the backlight off, but this is not guaranteed.
>>>>>>>> This will e.g. be true when directly driving a PWM and the video-BIOS
>>>>>>>> has provided a minimum (non 0) duty-cycle below which the driver will
>>>>>>>> never go.
>>>>>>>
>>>>>>> Hm. It's quite unfortunate that it's impossible to have strong guarantees
>>>>>>> here.
>>>>>>>
>>>>>>> Is there any way we can avoid this prop?
>>>>>>
>>>>>> Not really, the problem is that we really don't know if 0 is off
>>>>>> or min-brightness. In the given example where we actually never go
>>>>>> down to a duty-cycle of 0% because the video BIOS tables tell us
>>>>>> not to, we can be certain that setting the brightness prop to 0
>>>>>> will not turn of the backlight, since we then set the duty-cycle
>>>>>> to the VBT provided minimum. Note the intend here is to only set
>>>>>> the boolean to true if the VBT provided minimum is _not_ 0, 0
>>>>>> just means the vendor did not bother to provide a minimum.
>>>>>>
>>>>>> Currently e.g. GNOME never goes lower then something like 5%
>>>>>> of brightness_max to avoid accidentally turning the screen off.
>>>>>>
>>>>>> Turning the screen off is quite bad to do on e.g. tablets where
>>>>>> the GUI is the only way to undo the brightness change and now
>>>>>> the user can no longer see the GUI.
>>>>>>
>>>>>> The idea behind this boolean is to give e.g. GNOME a way to
>>>>>> know that it is safe to go down to 0% and for it to use
>>>>>> the entire range.
>>>>>
>>>>> Why not just make it policy that 0 is defined as minimum brightness,
>>>>> not off, and have all drivers conform to that?
>>>>
>>>> Because the backlight subsystem isn't as consistent on this, and it's been
>>>> an epic source of confusion since forever.
>>>>
>>>> What's worse, there's both userspace out there which assumes brightness =
>>>> 0 is a really fast dpms off _and_ userspace that assumes that brightness =
>>>> 0 is the lowest setting. Of course on different sets of machines.
>>>>
>>>> So yeah we're screwed. I have no idea how to get out of this.
>>>
>>> Yes, but this is a new API.  So can't we do better?  Sure the old
>>> backlight interface is broken, but why carry around clunky workarounds
>>> for new interfaces?
>>
>> Right we certainly need to define the behavior of the new API
>> clearly, so that userspace does not misuse / misinterpret it.
>>
>> The intend is for brightness=0 to mean minimum brightness
>> to still be able to see what is on the screen. But the problem
>> is that in many cases the GPU driver directly controls a PWM
>> output, no minimum PWM value is given in the video BIOS tables
>> and actually setting the PWM to 0% dutycycle turns off the
>> screen.
> 
> Sure.  So have the GPU driver map 0 to some valid minimum if that is
> the case or might be the case.  If bugs come up, we can add quirks in
> the GPU drivers.

The problem is that when 0% duty-cycle is not off, but minimum
brightness because there is some smart backlight-controller involved
downstream of the pwm, then of we limit it to say min 5% then we
have just limited the range of the brightness. GNOME already does
this in userspace now and it is already receiving bug-reports
from users that GNOME does not allow the brightness to go as low
as they like to have it in a dark(ish) room.

And in some cases 5% is likely not enough for the backlight to
actually turn on. So it will be wrong in one direction on some
devices and wrong in the other direction in other devices.

Which means that to satisfy everyone here we will need a ton
of quirks, much too many to maintain in the kernel IMHO.


>> So we can only promise a best-effort to make brightness=0
>> mean minimum brightness, combined with documenting that it
>> may turn off the backlight and that userspace _must_ never
>> depend on it turning off the backlight.
>>
>> Also note that setting a direct PWM output to duty-cycle 0%
>> does not guarantee that the backlight goes off, this may be
>> an input for a special backlight LED driver IC like the
>> TI LP855x series which can have an internal lookup
>> table causing it to actually output a minimum brightness
>> when its PWM input is at 0% dutycycle.  So this is a case
>> where we just don't get enough info from the fw/hw to be able
>> to offer the guarantees which we would like to guarantee.
> 
> So set it to a level we can guarantee can call it 0.  If we have the
> flag we are just punting on the problem in my opinion.

Right this an impossible problem to solve so the intent is indeed
to punt this to userspace, which IMHO is the best thing we can do
here.  The idea behind the "bl_brightness_0_is_min_brightness:
ro, boolean" property is to provide a hint to userspace to help
userspace deal with this (and if userspace ends up using e.g.
systemd's hwdb for this to avoid unnecessary entries in hwdb).

>  The kernel
> driver would seem to have a better idea what is a valid minimum than
> some arbitrary userspace application.

If the kernel driver knows the valid minimum then it can make 0
actually be that valid minimum as you suggest and it can set the
hint flag to let userspace know this. OTOH there are many cases
where the kernel's guess is just as bad as userspace's guess and
there are too many laptops where this is the case to quirk
ourselves out of this situation.

> Plus then if we need a
> workaround for what is the minimum valid brightness, we can fix it one
> place rather than letting every application try and fix it.

I wish we could solve this in the kernel, but at least on
laptops with Intel integrated gfx many vendors don't bother
to put a non 0 value in the minimum duty-cycle field of the
VBT, so there really is no good way to solve this.

If the userspace folks ever want to do a database for this,
I would expect them to do something with hwdb + udev which
can then be shared between the different desktop-environments.

Regards,

Hans

