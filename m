Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BDC904FF400
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 11:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AC910F13C;
	Wed, 13 Apr 2022 09:44:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06FE410F164
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 09:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1649843086;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vCOpbsA3LWLEDxxS1pTEGRyO16+At2GXelay3+kPStQ=;
 b=L6MNJn+gni3F5nAt1EsBqTihvVR6MpApCpOxaWCIuQPPcXHUZ6yjx6Q4Pu9LuS8qovnTCr
 SS4JECh1o4+5+4Qzsttd/ogAy1r4ZpyP0EHKCTqP+N60gbjY/MUXu+JU4Wi1kL2B0oKQiN
 s5RKAEznIRDGIQOToqsajGv1YPg3nNw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-OjmuCedjO5K8oMSJ5r9UmQ-1; Wed, 13 Apr 2022 05:44:43 -0400
X-MC-Unique: OjmuCedjO5K8oMSJ5r9UmQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 dm27-20020a05640222db00b0041d76d4f795so829084edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Apr 2022 02:44:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vCOpbsA3LWLEDxxS1pTEGRyO16+At2GXelay3+kPStQ=;
 b=yapFN4HlN5tESlR2TGKYzqzNiwunBj7381u3q07lR1sMJPxtu366hXDUkpIQAdMFIu
 r44R2+AX24kajU506rHMQBRxaIbAt9TjaaKyUtpMvoOdUZythavS6uj2y0VUFjo1Ja99
 NHnXA9vj7W86ePXefAafA3T63iijqSLzHS8bxk/qQRFWOu+nv5nO9igIsCKXuyNJhReU
 e3P4eLZZ+eZqsJ4QQmEXsaB3x/gt10qFNtbeHe2JQy2WaMnc8rZwbXP1SIIRO/MlG1s4
 vcPrsUmzaCFc4ALBb2qxUlNNvAZrH+0E4TG2WP/CeF0QnFdQ3oc744HzJbL2Fwlod8eH
 shdQ==
X-Gm-Message-State: AOAM5327WqMBt3O2w28MsxSTy0CxYu992aEuTz6/WCODmq8f6kRJuAJ3
 YPZYYGbuAaWv5C0xA5qNQUhtrcTFbuct29XhPuz8iERfuDm5KwAhv4JOZiYx6bO8vErcDDSrPj0
 +CNsWM64aRkhQPH4tFZagrGdQfgV9
X-Received: by 2002:a17:906:d552:b0:6e8:4edc:f2ee with SMTP id
 cr18-20020a170906d55200b006e84edcf2eemr22449897ejc.572.1649843081948; 
 Wed, 13 Apr 2022 02:44:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7OL6NbfTlsQblE4Qhaw7FA8v5Nvb1u8uq+ijuGSr14aSd37woA3OxOsKeUC1w4fsFQyHxXA==
X-Received: by 2002:a17:906:d552:b0:6e8:4edc:f2ee with SMTP id
 cr18-20020a170906d55200b006e84edcf2eemr22449887ejc.572.1649843081692; 
 Wed, 13 Apr 2022 02:44:41 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1?
 (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
 by smtp.gmail.com with ESMTPSA id
 cb25-20020a170906a45900b006e87e5f9c4asm4355010ejb.140.2022.04.13.02.44.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Apr 2022 02:44:41 -0700 (PDT)
Message-ID: <3b467446-95de-3773-eb4b-8090eab27daf@redhat.com>
Date: Wed, 13 Apr 2022 11:44:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [RFC] drm/kms: control display brightness through drm_connector
 properties
To: Daniel Vetter <daniel@ffwll.ch>
References: <0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com>
 <dP36CeeNjDVKgcJzbBAdkNM0HzB3N5Uzd6cgBcmrb5mA6xzWs9AKMmRdMKG2y6c1geMhZ1i8hONKQmxYYHN-ZhRLGT_TXz5IhtqnJSWBD9Q=@emersion.fr>
 <0e1cffc1-e8b6-dc58-56ff-53f911f33e60@redhat.com>
 <CADnq5_OGtERRYUPLskgjVD4eLbb2PxKdzcr+xmR2mRMAK73Log@mail.gmail.com>
 <Yk/tOG+iga/wj/Gt@phenom.ffwll.local>
 <acd0c8b6-b045-bab7-dc92-ea166b22c1c6@redhat.com>
 <dc3754a4-3f74-95bb-adae-56000a3756f5@redhat.com>
 <AQ3YD3wm6m_Knso5FAW-CKcokQqjDweExgrnV-f84VGkcOk8B0UcaooLiNqFMsHLOnhVnsnxC9kJMh_gY7z6rHlFaIx1OAZxSUfrOnd2jtY=@emersion.fr>
 <ca6eead3-13e7-2973-657d-48798c6cf89f@redhat.com>
 <YlaKnRY/aON+EUOx@phenom.ffwll.local>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YlaKnRY/aON+EUOx@phenom.ffwll.local>
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

On 4/13/22 10:32, Daniel Vetter wrote:
> On Fri, Apr 08, 2022 at 12:26:24PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 4/8/22 12:16, Simon Ser wrote:
>>> Would it be an option to only support the KMS prop for Good devices,
>>> and continue using the suboptimal existing sysfs API for Bad devices?
>>>
>>> (I'm just throwing ideas around to see what sticks, feel free to ignore.)
>>
>> Currently suid-root or pkexec helpers are used to deal with the
>> /sys/class/backlight requires root rights issue. I really want to
>> be able to disable these helpers at build time in e.g. GNOME once
>> the new properties are supported in GNOME.  So that distros with
>> a new enough kernel can reduce their attack surface this way.
> 
> Yeah but otoh perpetuating a bad interface forever isn't a great idea
> either. I think the pragmatic plan here is
> - Implement this properly on good devices, i.e. anything new.
> - Do some runtime disabling in the pkexec helpers if they detect a modern
>   system (we should be able to put a proper symlink into the drm sysfs
>   connector directories, to make this easy to detect). It's not as great
>   as doing this at compile time, but it's a step.
> - Figure out a solution for the old crap. We can't really change anything
>   with the load ordering for existing systems, so if the hacked-up compat
>   libbacklight-backlight isn't an option then I guess we need some quirk
>   list/extracted code which makes i915/nouveau/radeon driver load fail
>   until the right backlight shows up. And that needs to be behind a
>   Kconfig to avoid breaking existing systems.
> 
> Inflicting hotplug complications on all userspace (including uevent
> handling for this hotpluggable backlight and everything) just because
> fixing the old crap systems is work is imo really not a good idea. Much
> better if we get to the correct future step-by-step.

This assumes that we only use the new brightness properties for laptop
internal LCD panels.

But what about controlling the brightness of external monitors through
DDC/CI? If we do that we need hotplug support for this regardless since
external monitors can be hotplugged.

As I mentioned in other parts of the thread one of the reasons why
I've started looking into this again is because of people being
interested in this (1).

And even just taking internal LCD panels into account, there are
hybrid GPU laptops where the backlight is directly controlled by
the GPU (native type backlight driver) connected to the panel(2),
if we runtime switch the GPU attached to the panel there, then we
will get an actual hotplug of the LCD connector and I'm not sure if
we can always detect the maximum value of the brightness on the GPU
which is not connected to the panel at boot. So in this case we
need userspace to support re-reading the brightness max at
a hotplug event regardless.

So in all in all I feel that supporting hotplug events is
unavoidable here.

Regards,

Hans


1) Including attempting to do this through the old /sys/class/backlight
interface which IMHO would be quite bad to do:
https://lore.kernel.org/lkml/20220403230850.2986-1-yusisamerican@gmail.com/

2) E.g. gnome-settings-daemon has special code to detect which native
backlight interface to use if there are 2 native backlight devices on
a single laptop, see:
https://gitlab.gnome.org/GNOME/gnome-settings-daemon/-/blob/master/plugins/power/gsd-backlight.c#L95




