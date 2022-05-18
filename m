Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FD6552B695
	for <lists+dri-devel@lfdr.de>; Wed, 18 May 2022 12:06:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87D5C10E259;
	Wed, 18 May 2022 10:06:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F5D110E1BF
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 10:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652868400;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C2r1rWBmdtu0FZ4mggyVs/7L7uA3dpDog4rnPbZik/0=;
 b=W6tt3m2u4VVn74mYMI9lZQJhqcwc4ATF/HagYjvC9v47LLHbdnM6g/LDlH65OHU642PTmQ
 dQBkzES/obqa95//xFFSJFejA6UvLZJI7uqnrlh4fOsSHfgfnegWVvW4lxnfz7SG9uKPtB
 702ohGPrw7loBXD3ffmt67ptEhXOzwM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-512-TwA0hOnpPiiJQv1i3Z-B-g-1; Wed, 18 May 2022 06:06:38 -0400
X-MC-Unique: TwA0hOnpPiiJQv1i3Z-B-g-1
Received: by mail-ed1-f71.google.com with SMTP id
 ay24-20020a056402203800b0042a96a76ba5so1276672edb.20
 for <dri-devel@lists.freedesktop.org>; Wed, 18 May 2022 03:06:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=C2r1rWBmdtu0FZ4mggyVs/7L7uA3dpDog4rnPbZik/0=;
 b=6rAmW4C8LhYYflLFdVAhuH+dFl9h1GsB3128vwCUPMzyuoNhoqllfrSUdWY3LiE/hn
 DI9tialJAvwFlLfktJ8ZmUPgU0QO8B0h/Sen2Wu7Nso7Codh3tf6m/CKQOHPNFnLTXXi
 r3SQoc4eCUbZw9kTb2nuOYRoNsJFIfbJEWLQX+RMMvTKi5zzaqOO4zdDlEN6cOo6XToE
 1ax/NwCvbZm7vfTNpycH1qRQv6UVPVsTLJ7VvUPFfT581VeDiwrobS4oxDIRVSvHrwwQ
 r9Yi/Sotm9keF+R/hEeoRqYfL/6/X6+NQSFHe9kXdDePQAFm78ILQ7GGJlU4rmRlFPsa
 uQng==
X-Gm-Message-State: AOAM5336vWukp0DWL3zaOsUfYltp4yNZjT2VAcxMCs08k+XAwnBroAGJ
 T1qqZFsSFm1h91O2wDJeG/Q5R5uwh82sUrQ2LNdUUyYUvb5YhTuZKc6B1etKkuW1QhXQmlxW6TE
 gTwxs7vUiyTqtwja0X77oeOlubCL6
X-Received: by 2002:aa7:d2cf:0:b0:42a:c1b1:9d6b with SMTP id
 k15-20020aa7d2cf000000b0042ac1b19d6bmr10645149edr.405.1652868397575; 
 Wed, 18 May 2022 03:06:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxW5N5eEgYNDxxR01FDnen1+ArS6hUX6UjT6X85gxiN1WIP+fe7U2YYHCi6kVoLRTzUEVBJfw==
X-Received: by 2002:aa7:d2cf:0:b0:42a:c1b1:9d6b with SMTP id
 k15-20020aa7d2cf000000b0042ac1b19d6bmr10645102edr.405.1652868397330; 
 Wed, 18 May 2022 03:06:37 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 gx3-20020a1709068a4300b006f3ef214e0csm774697ejc.114.2022.05.18.03.06.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 May 2022 03:06:36 -0700 (PDT)
Message-ID: <dc30ddc2-b00e-234e-5ec3-b1ea79c74082@redhat.com>
Date: Wed, 18 May 2022 12:06:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 01/14] ACPI: video: Add a native function parameter to
 acpi_video_get_backlight_type()
To: Jani Nikula <jani.nikula@linux.intel.com>, Ben Skeggs
 <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-2-hdegoede@redhat.com> <87y1yzdxtk.fsf@intel.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87y1yzdxtk.fsf@intel.com>
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Len Brown <lenb@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 5/18/22 10:55, Jani Nikula wrote:
> On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> ATM on x86 laptops where we want userspace to use the acpi_video backlight
>> device we often register both the GPU's native backlight device and
>> acpi_video's firmware acpi_video# backlight device. This relies on
>> userspace preferring firmware type backlight devices over native ones, but
>> registering 2 backlight devices for a single display really is undesirable.
>>
>> On x86 laptops where the native GPU backlight device should be used,
>> the registering of other backlight devices is avoided by their drivers
>> using acpi_video_get_backlight_type() and only registering their backlight
>> if the return value matches their type.
>>
>> acpi_video_get_backlight_type() uses
>> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
>> driver is available and will never return native if this returns
>> false. This means that the GPU's native backlight registering code
>> cannot just call acpi_video_get_backlight_type() to determine if it
>> should register its backlight, since acpi_video_get_backlight_type() will
>> never return native until the native backlight has already registered.
>>
>> To fix this add a native function parameter to
>> acpi_video_get_backlight_type(), which when set to true will make
>> acpi_video_get_backlight_type() behave as if a native backlight has
>> already been registered.
>>
>> Note that all current callers are updated to pass false for the new
>> parameter, so this change in itself causes no functional changes.
> 
> 
>> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
>> index becc198e4c22..0a06f0edd298 100644
>> --- a/drivers/acpi/video_detect.c
>> +++ b/drivers/acpi/video_detect.c
>> @@ -17,12 +17,14 @@
>>   * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>>   * sony_acpi,... can take care about backlight brightness.
>>   *
>> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
>> - * which driver should handle the backlight.
>> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
>> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
>> + * pass true for the native function argument, other drivers must pass false.
>>   *
>>   * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>>   * this file will not be compiled and acpi_video_get_backlight_type() will
>> - * always return acpi_backlight_vendor.
>> + * return acpi_backlight_native when its native argument is true and
>> + * acpi_backlight_vendor when it is false.
>>   */
> 
> Frankly, I think the boolean native parameter here, and at the call
> sites, is confusing, and the slightly different explanations in the
> commit message and comment here aren't helping.

Can you elaborate the "slightly different explanations in the
commit message and comment" part a bit (so that I can fix this) ?

> I suggest adding a separate function that the native backlight drivers
> should use. I think it's more obvious all around, and easier to document
> too.

Code wise I think this would mean renaming the original and
then adding 2 wrappers, but that is fine with me. I've no real
preference either way and I'm happy with adding a new variant of
acpi_video_get_backlight_type() for the native backlight drivers
any suggestion for a name ?

Regards,

Hans

