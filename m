Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A30619D13
	for <lists+dri-devel@lfdr.de>; Fri,  4 Nov 2022 17:23:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4443E10E8E9;
	Fri,  4 Nov 2022 16:23:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A459C10E8EE
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Nov 2022 16:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1667579014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pp1gAvCv0S7a0+LbSi7mwLtPne5YYp7ectQ1uCFFxiU=;
 b=fFymtvpqCeN7W0YS5iXp5Ed91GtCDDbvxlgpzezUSpvQB3oTRJMBKw1OI8oFXMzFtcRj1X
 GVof6vWxd7X0aszzTQS03BJGhaTzX9R12afFXZo1XoLacG3YWHWQ4i5IFcI/NryeTRGwuT
 G5zciEq4ayq9pKT76ZmZmydCnOcZ5B8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-186-_PXYES51OkqI4dLsieetYg-1; Fri, 04 Nov 2022 12:23:31 -0400
X-MC-Unique: _PXYES51OkqI4dLsieetYg-1
Received: by mail-ej1-f71.google.com with SMTP id
 xj11-20020a170906db0b00b0077b6ecb23fcso3620423ejb.5
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Nov 2022 09:23:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:subject:from:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pp1gAvCv0S7a0+LbSi7mwLtPne5YYp7ectQ1uCFFxiU=;
 b=cPSIQu0nAsN0ISGMZfoozLIwbdhpOGnk5+H3hNalq3FkNUjHRn3efwP1ABrlAjBLIM
 yFM7t07fmcfUHgWkCURb8F5FrEcuKefKhcEl2tfQahNTppXxfBNYEg1ZUQtiv5QDnYWs
 bBbT/R02I7IPlb7UsaA60wHcraMXfR83oL1gJLlgW7R1ZfZEabg0PqeQMrnlRw+EWdbm
 yGfdY2OKPF7BP1AfEokWb+eM3vqWAygpFXIk3oYaAOWxa/uqmFTP9WQEXDlLN0wxP0tk
 a2qUbgALLRJ5UmlKTR6gpqsa/DgNUtTYKbhHiCkyuVZQJETf4f7crsU1/dQOWi3Feml2
 +aPw==
X-Gm-Message-State: ACrzQf2lgMZBjLDoSYOeByEpqsg94+aM2/3aPRBCS46W/u4l8NHMf1vY
 hgswLskfUQiFITJtPCoNhOr6wVZGaF0Ki72NsRWGB42qYXd2wTaBW+Rl6SeoX4AK94InQWsPG9Z
 g6OQvpAkPN4GbJ70udMHjF9yItQJV
X-Received: by 2002:a05:6402:616:b0:463:e2cd:a88d with SMTP id
 n22-20020a056402061600b00463e2cda88dmr16819446edv.400.1667579010736; 
 Fri, 04 Nov 2022 09:23:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4/8CDlsJM8kAPum5+A8l+FVPBOMe0EiU2tBjdUeoP0F0C41kd0gCeOXJ3Aca9vhGBJ4ehIWQ==
X-Received: by 2002:a05:6402:616:b0:463:e2cd:a88d with SMTP id
 n22-20020a056402061600b00463e2cda88dmr16819392edv.400.1667579010403; 
 Fri, 04 Nov 2022 09:23:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:2a07:3a01:67e5:daf9:cec0:df6?
 (2001-1c00-2a07-3a01-67e5-daf9-cec0-0df6.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:2a07:3a01:67e5:daf9:cec0:df6])
 by smtp.gmail.com with ESMTPSA id
 j1-20020a17090623e100b0078d46aa3b82sm1988678ejg.21.2022.11.04.09.23.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Nov 2022 09:23:29 -0700 (PDT)
Message-ID: <09408910-e806-cf4d-1377-82ab5b2990d5@redhat.com>
Date: Fri, 4 Nov 2022 17:23:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
From: Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v5 02/31] drm/i915: Don't register backlight when another
 backlight should be used (v2)
To: "Rafael J. Wysocki" <rafael@kernel.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>
References: <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
 <20221025204043.GA23306@srcf.ucam.org>
 <cb5add36-c13c-ccd5-1b4b-71b45163a170@redhat.com>
 <20221025234040.GA27673@srcf.ucam.org>
 <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
 <20221026204920.GA15326@srcf.ucam.org>
 <099dee98-8aeb-af36-828c-110f5ac6e9a3@redhat.com>
 <20221027091123.GA28089@srcf.ucam.org>
 <933be908-0bc2-56cc-8d6f-38f2d208ef20@redhat.com>
 <20221027095249.GA28666@srcf.ucam.org>
 <6df2016d-ed2d-57fa-dcad-48537732895f@redhat.com>
 <CAJZ5v0jM1JAySagv=u2be1bAmfTt3jJgVnOEjGzskBvZY7k6aw@mail.gmail.com>
In-Reply-To: <CAJZ5v0jM1JAySagv=u2be1bAmfTt3jJgVnOEjGzskBvZY7k6aw@mail.gmail.com>
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
Cc: Karol Herbst <kherbst@redhat.com>, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>, Mark Gross <markgross@kernel.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Matthew, Rafael,

On 10/27/22 14:09, Rafael J. Wysocki wrote:
> On Thu, Oct 27, 2022 at 12:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 10/27/22 11:52, Matthew Garrett wrote:
>>> On Thu, Oct 27, 2022 at 11:39:38AM +0200, Hans de Goede wrote:
>>>
>>>> The *only* behavior which actually is new in 6.1 is the native GPU
>>>> drivers now doing the equivalent of:
>>>>
>>>>      if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>>>              return;
>>>>
>>>> In their backlight register paths (i), which is causing the native
>>>> backlight to disappear on your custom laptop setup and on Chromebooks
>>>> (with the Chromebooks case being already solved I hope.).
>>>
>>> It's causing the backlight control to vanish on any machine that isn't
>>> ((acpi_video || vendor interface) || !acpi). Most machines that fall
>>> into that are either weird or Chromebooks or old, but there are machines
>>> that fall into that.
>>
>> I acknowledge that their are machines that fall into this category,
>> but I expect / hope there to be so few of them that we can just DMI
>> quirk our way out if this.
>>
>> I believe the old group to be small because:
>>
>> 1. Generally speaking the "native" control method is usually not
>> present on the really old (pre ACPI video spec) mobile GPUs.
>>
>> 2. On most old laptops I would still expect there to be a vendor
>> interface too, and if both get registered standard desktop environments
>> will prefer the vendor one, so then we need a native DMI quirk to
>> disable the vendor interface anyways and we already have a bunch of
>> those, so some laptops in this group are already covered by DMI quirks.
>>
>> And a fix for the Chromebook case is already in Linus' tree, which
>> just leaves the weird case, of which there will hopefully be only
>> a few.
>>
>> I do share your worry that this might break some machines, but
>> the only way to really find out is to get this code out there
>> I'm afraid.
>>
>> I have just written a blog post asking for people to check if
>> their laptop might be affected; and to report various details
>> to me of their laptop is affected:
>>
>> https://hansdegoede.dreamwidth.org/26548.html
>>
>> Lets wait and see how this goes. If I get (too) many reports then
>> I will send a revert of the addition of the:
>>
>>         if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>                 return;
>>
>> check to the i915 / radeon / amd / nouveau drivers.
>>
>> (And if I only get a couple of reports I will probably just submit
>> DMI quirks for the affected models).
> 
> Sounds reasonable to me, FWIW.

I have received quite a few test reports as a result of my blogpost
(and of the blogpost's mention in an arstechnica article).

Long story short, Matthew, you are right. Quite a few laptop models
will end up with an empty /sys/class/backlight because of the native
backlight class devices no longer registering when
acpi_video_backlight_use_native() returns false.

I will submit a patch-set later today to fix this (by making 
cpi_video_backlight_use_native() always return true for now).

More detailed summary/analysis of the received test reports:

-30 unaffected models

-The following laptop models:
 Acer Aspire 1640
 Apple MacBook 2.1
 Apple MacBook 4.1
 Apple MacBook Pro 7.1 (uses nv_backligh instead of intel_backlight!)
 HP Compaq nc6120
 IBM ThinkPad X40
 System76 Starling Star1

 All only have a native intel_backlight interface and the heuristics from
 acpi_video_get_backlight_type() return acpi_backlight_vendor there causing
 the changes in 6.1 to not register native backlights when
 acpi_video_backlight_use_native() returns false resulting in an empty
 /sys/class/backlight, breaking users ability to control their laptop
 panel's brightness.

 I will submit a patch to always make acpi_video_backlight_use_native()
 return true for now to work around this for 6.1.

 I do plan to try to re-introduce that change again later. First I need to
 change the heuristics to still native on more models so that on models
 where the native backlight is the only (working) entry they will
 return native.

-The Dell N1410 has acpi_video support and acpi_osi_is_win8() returns false
 so acpi_video_get_backlight_type() returns acpi_video, but acpi_video
 fails to register a backlight device due to a_BCM eval error.
 The intel_backlight interface works fine, but this model is going to need
 a DMI-use-native-quirk to avoid intel_backlight disappearing when
 acpi_video_backlight_use_native() is changed back.

-The following laptop models actually use a vendor backlight control method,
 while also having a native backlight entry under /sys/class/backlight:

 Asus EeePC 901       -> native backlight confirmed to also work
 Dell Latitude D610   -> native backlight confirmed to work better then vendor
 Sony Vaio PCG-FRV3   -> native backlight not tested

 Note these will keep working the same as before in 6.1, independent of
 the revert. I've tracked these seperately because they will likely be
 affected by future changes to the heuristics.


Regards,

Hans


p.s.

My plan is to try again with 6.2 by making native be preferred over vendor
(when native is available).  It looks like native tends to work well when
available even on systems so old that the don't have acpi_video
backlight control support.

I do plan to do another blogpost asking people to explicitly test
that native works on laptops with a combination of vendor + native
backlight control available.

