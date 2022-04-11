Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 251DB4FBB58
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 13:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 234F210E5CE;
	Mon, 11 Apr 2022 11:51:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9C210E52B
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 11:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649677861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nGZ6bTNMXwiPdzOAtnk4Y0Xo2heZ5uPl+aT90cHgb7s=;
 b=UddJuHwt7BNlKuvzcflKNlB73RqAPuuybVckv0o/V0/T4djrsLdV7nqval3uvbqWCi3xyV
 2+t1wT7YAo/gmUY5RF++4m0LbiTSD8FAHSf73sC0i2UuudtqWHzf8lztHOtg4A3vfIllwH
 Wyo7ZK5ECleDV6BeX/oXXmrKMBaakOw=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-402-WL7rdD9rPKG_LACH5oZ21Q-1; Mon, 11 Apr 2022 07:51:00 -0400
X-MC-Unique: WL7rdD9rPKG_LACH5oZ21Q-1
Received: by mail-ej1-f70.google.com with SMTP id
 hr36-20020a1709073fa400b006e88d626dc3so862013ejc.7
 for <dri-devel@lists.freedesktop.org>; Mon, 11 Apr 2022 04:51:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nGZ6bTNMXwiPdzOAtnk4Y0Xo2heZ5uPl+aT90cHgb7s=;
 b=XwSbjrlzWL3/COSrMg3DMIeBAOOYfhx1WJXLF69Oug0qNIoUT/AMzhmm5n9FVW016K
 eD6BUNzIiufim9aOh2t0V/iAQh0t6zti8b0sfgL5dPBV8+HzPE2nsvuIOwBnCDFq/7Ya
 VP+2GSvGq9iJMFGt1hhSk7rYHOGNp/mV/4Nf8LLXGFPukEtXcu6iH7arANuDDtJVi7Qp
 kjR0/qKcr70V6QvN84rgpFrR/89wER+JWcCIV4jMuz/WnI278pElQpzsmfOeDFo5IFPY
 nuW2Y52WXI/XgHNWRN0gbhbDViwt6wxKR72+U5iKK1w+2OaX8oOGSEk+cjcDky03JcEk
 a9qQ==
X-Gm-Message-State: AOAM533JkyLgco3lbTUQk0ejtXVbdNqNQAEP3mQ+vb1ETARzE/X8Uz9K
 anNCZcztQHbe7FJwTf6s+vFRLFWOWm0EAgQQNBE4tm/pMDCBRW2z9oJjl2LUwZ79vQZJAjue23C
 v8EdGDYYLVMR/ROM/GqhrpoctMnqO
X-Received: by 2002:a17:906:9458:b0:6e8:86e5:5b8c with SMTP id
 z24-20020a170906945800b006e886e55b8cmr5730891ejx.325.1649677859113; 
 Mon, 11 Apr 2022 04:50:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL+rK2+KLdWbdbz/mgBo9YW1FYb5d1BugLHaM5zXqEQ+wcm7kxDmFjYWv4BFGevIrrgPgFlQ==
X-Received: by 2002:a17:906:9458:b0:6e8:86e5:5b8c with SMTP id
 z24-20020a170906945800b006e886e55b8cmr5730866ejx.325.1649677858803; 
 Mon, 11 Apr 2022 04:50:58 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 bn14-20020a170906c0ce00b006c5ef0494besm11868550ejb.86.2022.04.11.04.50.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 11 Apr 2022 04:50:58 -0700 (PDT)
Message-ID: <327c6efa-192f-5553-9a6f-8278a8a0b87d@redhat.com>
Date: Mon, 11 Apr 2022 13:50:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Pekka Paalanen <ppaalanen@gmail.com>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <CADnq5_NT=pSZwvMN_0_S4duk-StRxh0JcsraJo+erPDkq+GyJg@mail.gmail.com>
 <4a3cf9b6-1e08-c08c-bebd-ec2ca648059c@redhat.com>
 <CADnq5_M2zLedFmAS+udyg1zRavv-aCm1hRY+t=qW7wD33JEALg@mail.gmail.com>
 <a42f03bf-bf85-b08e-fa4f-e36a226922bc@redhat.com>
 <20220411143416.04a65b5d@eldfell>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220411143416.04a65b5d@eldfell>
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
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 wayland <wayland-devel@lists.freedesktop.org>,
 Christoph Grenz <christophg+lkml@grenz-bonn.de>,
 Yusuf Khan <yusisamerican@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Pekka,

On 4/11/22 13:34, Pekka Paalanen wrote:
> On Mon, 11 Apr 2022 12:18:30 +0200
> Hans de Goede <hdegoede@redhat.com> wrote:
> 
>> Hi,
>>
>> On 4/8/22 17:11, Alex Deucher wrote:
>>> On Fri, Apr 8, 2022 at 10:56 AM Hans de Goede <hdegoede@redhat.com> wrote:  
>>>>
> 
> ...
> 
>>> So set it to a level we can guarantee can call it 0.  If we have the
>>> flag we are just punting on the problem in my opinion.  
>>
>> Right this an impossible problem to solve so the intent is indeed
>> to punt this to userspace, which IMHO is the best thing we can do
>> here.  The idea behind the "bl_brightness_0_is_min_brightness:
>> ro, boolean" property is to provide a hint to userspace to help
>> userspace deal with this (and if userspace ends up using e.g.
>> systemd's hwdb for this to avoid unnecessary entries in hwdb).
>>
>>>  The kernel
>>> driver would seem to have a better idea what is a valid minimum than
>>> some arbitrary userspace application.  
>>
>> If the kernel driver knows the valid minimum then it can make 0
>> actually be that valid minimum as you suggest and it can set the
>> hint flag to let userspace know this. OTOH there are many cases
>> where the kernel's guess is just as bad as userspace's guess and
>> there are too many laptops where this is the case to quirk
>> ourselves out of this situation.
>>
>>> Plus then if we need a
>>> workaround for what is the minimum valid brightness, we can fix it one
>>> place rather than letting every application try and fix it.  
>>
>> I wish we could solve this in the kernel, but at least on
>> laptops with Intel integrated gfx many vendors don't bother
>> to put a non 0 value in the minimum duty-cycle field of the
>> VBT, so there really is no good way to solve this.
>>
>> If the userspace folks ever want to do a database for this,
>> I would expect them to do something with hwdb + udev which
>> can then be shared between the different desktop-environments.
> 
> Hi Hans,
> 
> assuming that it is impossible to reach a reasonable user experience by
> having a quirk database in the kernel in order to offer a consistent
> definition of bl_brightness=0, then should you not be recommending a
> userspace hwdb solution with full steam, rather than adding a hint in
> the kernel that might be just enough to have no-one ever bother
> investing in a proper solution?

The problem is we already lack the manpower for a quirk database,
and even if we ever get the manpower then it would still be good
to avoid the work necessary to add models to the database where
the kernel already knows how things work, see below.

As for no-one ever bothering coming up with a full-steam hwdb
solution for the cases where the kernel has no idea what
bl_brightness=0 means, yes that is likely, but that already
is the status quo, the hint will at least allow using the
full brightness range on devices where the kernel knows
(with certainty) that this is correct.

> Re-reading your "bl_brightness_0_is_min_brightness" definition, it
> seems to be specified as exposing a certain condition in the system.
> When it is true, you imply that userspace can safely use value 0 as min
> brightness, but that is assuming the hint is correct. How likely
> is the hint incorrect?

It should never be incorrect, there are cases when the kernel knows
reliably that bl_brightness=0 means minimum brightness
(and NOT backlight off).

> If the hint can be incorrect, does this hint
> actually give anything to userspace, or would userspace still choose to
> be safer than sorry and ignore the hint by assuming the worst?

If the hint is incorrect then that would be a kernel bug and that
should be fixed in the kernel. The whole idea behind the hind is
that userspace can absolutely trust it to be correct when set to true
(false basically means that the kernel does not know of 0=off or not).

> Is this situation much different to the quirk database libinput needs
> to work beautifully out of the box?

libinput's quirk database is relatively pretty small and a lot
of effort is done to fix things in generic ways where possible,
to avoid growing it.

As a general rule quirks should only be used to handle exceptions
to general rules, the problem here is that bl_brightness=0 being
backlight off is not a true exception it happens quite often.

Which is also why I believe that a hwdb for this is not necessarily
a great idea, because maintaining it will be a lot of work.

> Should desktop environments offer a couple more "advanced
> configuration" knobs for the lowest safe brightness value and the
> value-to-perceived brightness mapping to calibrate the familiar
> brightness slider? E.g. something like "click this button as soon as
> you see it on the display" for finding the lowest usable brightness,
> with defaults coming from a database.

Maybe, but that would defeat all the attempts done to make Linux
on the desktop just work.

> If the situation is as grim as you say, I would propose to drop
> "bl_brightness_0_is_min_brightness" (and
> "bl_brightness_control_method"), and document the dangers of using too
> low brightness values. Maybe also start looking for a project that
> would be appropriate for hosting such a database, just to point people
> to cooperate in a single place rather than each DE coming up with their
> own.

I agree with dropping bl_brightness_control_method, but I do
believe that bl_brightness_0_is_min_brightness will be actually
useful to have, see above.

As for starting a database for this. I gave a talk about improving the
backlight situation under Linux in 2014, nothing has happened since
then. I think we need to be realistic here and accept that we don't
have the manpower to do something like a database here.

Regards,

Hans

