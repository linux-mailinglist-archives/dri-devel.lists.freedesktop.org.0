Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F10B4FB9CA
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 12:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17D9E10EC0D;
	Mon, 11 Apr 2022 10:35:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9BFC10E3E9
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 10:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649673323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RHjWAOjwe9YkFe6B/qf2TjGc0rmWAclWS07SRUnQH5Q=;
 b=hZLM2u/RdmqutKIZQ1KBU1FNKaLh/jaEpnv8HDpgdJORgsyWM8mAgaKZZ0kT6fGEU3rbSs
 57efXR9qLOH939AJ3vAzAD9w+FHhYW4ZiXkXjv43Sx9xURrEgdHQfwKGDJ0DpKrXNpmZhp
 CukX/mte2cX//Gwd0OL77LBdg+M+68k=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-QlaT0IQaOF2aplJRoJ4rPA-1; Mon, 11 Apr 2022 06:35:22 -0400
X-MC-Unique: QlaT0IQaOF2aplJRoJ4rPA-1
Received: by mail-ej1-f69.google.com with SMTP id
 ne8-20020a1709077b8800b006e87e97d2e7so869964ejc.3
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 03:35:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=RHjWAOjwe9YkFe6B/qf2TjGc0rmWAclWS07SRUnQH5Q=;
 b=UMr8vzvSU0kS/q+kLlSHAlLzVzEaihydpPaoxHLmpt1o/mai+UHZmhAEzs1Wk0pzXQ
 8bwwQHbWfvRwa/f8z46ih7ck389UeI2vORfe2bXhCqJnD1qZpde0GgFYh4VEiw/b+w9X
 NzLryebET0Q1Hs5hhfpP81bsx/MTGDbyiDH9Rqd6BsF2yjM/WatWQ1BU5EuIl7hWn1fG
 f2zAnPdOhahtnCSZP5CPfKqVE4Ftu5UuOYy98VBTXgzQVPjTX8yPsduOBgIFp/xCtIAl
 sxWX2wIhd7eYy2ibs9k4j1y5CFMLRf/ScZQOeGKbkaFDyHgA5lpA0C4zyS5V72PlHn8c
 U/Kg==
X-Gm-Message-State: AOAM530rfpDLZ3jPRsb1oy9yaA//Xoa/vC36UueplzK4kwOq6GfzUA0k
 fqz6teu9J2NokWsEsbpO0RE4Ciw8g5Vn2c0Qas4QeSDWHXKzxpV5PWvAcyuK8yjqUGo9sJsR7t9
 8LJG7uSAd5d2D5Ac3Kplk+Fwym4fw
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr29948748ejr.41.1649673321426; 
 Mon, 11 Apr 2022 03:35:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcRdi/M6S5Y5OJuGSqWCzHZdci2ybAZwXF/CV/YDh2QPPfWjQoO8j+qEbmxE+t4fRnBwsscA==
X-Received: by 2002:a17:906:68c2:b0:6b4:9f26:c099 with SMTP id
 y2-20020a17090668c200b006b49f26c099mr29948731ejr.41.1649673321238; 
 Mon, 11 Apr 2022 03:35:21 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a509d44000000b0041cdc7ffda4sm10356306edk.59.2022.04.11.03.35.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 03:35:20 -0700 (PDT)
Message-ID: <2e4963f6-6746-082d-c516-6fb73307cd18@redhat.com>
Date: Mon, 11 Apr 2022 12:35:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Simon Ser <contact@emersion.fr>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <XwpYE-RK1zRFJfojeMJV5ddsxHnHg4HRTXd4fZ_7yUMBZRCy3ARRIPC6Y-eCJ5Ag9Fin8FGLz6t-L8Ix4P7ykQlrJ6dH4LYye20kyHKtVaI=@emersion.fr>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <XwpYE-RK1zRFJfojeMJV5ddsxHnHg4HRTXd4fZ_7yUMBZRCy3ARRIPC6Y-eCJ5Ag9Fin8FGLz6t-L8Ix4P7ykQlrJ6dH4LYye20kyHKtVaI=@emersion.fr>
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

Hi Simon,

On 4/8/22 10:22, Simon Ser wrote:
> Hi Hans,
> 
> Thanks for your details replies!
> 
> On Thursday, April 7th, 2022 at 19:43, Hans de Goede <hdegoede@redhat.com> wrote:
> 
>>> On Thursday, April 7th, 2022 at 17:38, Hans de Goede <hdegoede@redhat.com> wrote:
>>>
>>>> The drm_connector brightness properties
>>>> =======================================
>>>>
>>>> bl_brightness: rw 0-int32_max property controlling the brightness setting
>>>> of the connected display. The actual maximum of this will be less then
>>>> int32_max and is given in bl_brightness_max.
>>>
>>> Do we need to split this up into two props for sw/hw state? The privacy screen
>>> stuff needed this, but you're pretty familiar with that. :)
>>
>> Luckily that won't be necessary, since the privacy-screen is a security
>> feature the firmware/embedded-controller may refuse our requests
>> (may temporarily lock-out changes) and/or may make changes without
>> us requesting them itself. Neither is really the case with the
>> brightness setting of displays.
> 
> Cool, makes sense to me!
> 
>>>> bl_brightness_max: ro 0-int32_max property giving the actual maximum
>>>> of the display's brightness setting. This will report 0 when brightness
>>>> control is not available (yet).
>>>
>>> I don't think we actually need that one. Integer KMS props all have a
>>> range which can be fetched via drmModeGetProperty. The max can be
>>> exposed via this range. Example with the existing alpha prop:
>>>
>>>     "alpha": range [0, UINT16_MAX] = 65535
>>
>> Right, I already knew that, which is why I explicitly added a range
>> to the props already. The problem is that the range must be set
>> before registering the connector and when the backlight driver
>> only shows up (much) later during boot then we don't know the
>> range when registering the connector. I guess we could "patch-up"
>> the range later. But AFAIK that would be a bit of abuse of the
>> property API as the range is intended to never change, not
>> even after hotplug uevents. At least atm there is no infra
>> in the kernel to change the range later.
>>
>> Which is why I added an explicit bl_brightness_max property
>> of which the value gives the actual effective maximum of the
>> brightness.
>>
>> I did consider using the range for this and updating it
>> on the fly I think nothing is really preventing us from
>> doing so, but it very much feels like abusing the generic
>> properties API.
> 
> Since this is new uAPI there's no concern about backwards compat here. So it's
> pretty much a matter of how we want the uAPI to look like. I was suggesting
> using a range because it's self-describing, but maybe it's an abuse.
> 
> Daniel Vetter, what do you think? If a property's range is going to be updated
> on the fly, should we go for it, or should we use a separate prop to describe
> the max value?

Daniel, as explained in my replies to you, I do believe that dynamically
updating the range is unavoidable. Especially once we also add support
for setting a monitor's brightness over DDC/CI.

Since external monitors (with/without DDC/CI support) can come and go and
since properties cannot be added/removed after connector registration, we
need a way to let userspace know if brightness control is actually available
or not and what the range is. We can use a max value of 0 for not available
and other values for the actual range, which I believe is a sane API.

But the question from Simon then still remains, do we update the range
of the property on the fly, followed by a connector hotplug uevent; or
do we use a separate brightness_max property for this?

Note that as Rasterman indicated that with DDC/CI support we could also
offer other properties (for which I see no reason atm) and if we do
say also add a contrast property over DDC/CI then if we go the
separate brightness_max route that would mean adding 2 props for
each setting which we want to support.

Regards,

Hans


