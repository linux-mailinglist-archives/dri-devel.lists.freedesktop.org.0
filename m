Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F8F37CE75A
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 21:08:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA5710E454;
	Wed, 18 Oct 2023 19:08:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E189310E454
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 19:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697656100;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DbHVcLfAbll6mrcfBWXl4iis7+24sALhp3ul/LsYEr0=;
 b=J0ZB1uhu87pZ11/aRXHyaj7tyJUntSQqSx9ki7j5yh1gHYSv/+KNlv/V1lObECDO48dSdl
 49Ym4ehy9D+lSAs1In6egDRQgIbRxhfH63zl+7RABwYdelwtSVNypQVF/mlt0cta/OQ4et
 ia4+N7qEUnRwoL+Nd/f+eTrWvqcZWro=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-446-NZPGH2y1MCy7Ve2j749HtQ-1; Wed, 18 Oct 2023 15:08:18 -0400
X-MC-Unique: NZPGH2y1MCy7Ve2j749HtQ-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-538128e18e9so5400025a12.2
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Oct 2023 12:08:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697656097; x=1698260897;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=DbHVcLfAbll6mrcfBWXl4iis7+24sALhp3ul/LsYEr0=;
 b=WzfHZDdR5Q3Wa6PqJLSj0kN/zZlVOTlUc9klro9VG130PbU/KqqSo1iDzYr7TEBzlC
 DyyOqpAMCapwjyBu5vj/PUw4otCrGy+Wf+qOs6m0Ekgb2kj2O0rEGBOx9X+SVqo0JgzM
 qQFvPiSl+gm8mzIEpzzSV3l18y5gCVJ/9+bcbUMTUW+nJZhUbNdeLRGdE+hAVZfzHnF+
 faSnCLX+cTJhVuX3917l2LD4w2kMf6iIQJK8fEJ+8KJVsDJ3rngP6ez43kJv9xIdKF8L
 ayo4u10ZfwfbG1Plf8dB6LpxihJYpGfw+kcI/Qa2r8rFBZn3AiVDriErQ2r1J2bY/Kqz
 7mFQ==
X-Gm-Message-State: AOJu0YyAbxqg08zUklhFUXRE9JKodo2ahtiJEVWyFDlrJf5BGx7I3U3U
 5G9oLCQOZTyktwu8OX+EisUPDpRV01vMbp3hph0q7BT7E9iO7zd6/G+q7rfeP+asu6X/JfArOmI
 +iRm5FA5K3TkQObM9k8ySJa+Ef+vT
X-Received: by 2002:a50:ab5d:0:b0:533:c55f:5830 with SMTP id
 t29-20020a50ab5d000000b00533c55f5830mr4239389edc.28.1697656097151; 
 Wed, 18 Oct 2023 12:08:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHgCEzPFiGzOVlfxm8KBiyEhgH99a614kciOPwziYd2W/4GtdvNokWo3YOfqj5GA+Y8qMizbw==
X-Received: by 2002:a50:ab5d:0:b0:533:c55f:5830 with SMTP id
 t29-20020a50ab5d000000b00533c55f5830mr4239371edc.28.1697656096807; 
 Wed, 18 Oct 2023 12:08:16 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec?
 (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
 by smtp.gmail.com with ESMTPSA id
 i23-20020a508717000000b0053db1ca293asm3286587edb.19.2023.10.18.12.08.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Oct 2023 12:08:16 -0700 (PDT)
Message-ID: <e143bbe2-212c-cfc8-131f-8ec9c0bff56d@redhat.com>
Date: Wed, 18 Oct 2023 21:08:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v4 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
To: Mario Limonciello <mario.limonciello@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
 =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>
References: <20231018070241.2041529-1-Shyam-sundar.S-k@amd.com>
 <20231018070241.2041529-14-Shyam-sundar.S-k@amd.com>
 <9e6c4a42-fbce-c5ea-15ce-5eb22fc3767a@linux.intel.com>
 <84af64f2-42bd-4e09-a1c9-bde2a935c8f2@amd.com>
 <92bba3b3-a3f9-4fab-86c7-4d0ef4c23fcb@amd.com>
 <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <238f915f-b95f-4d85-ad67-66781f53e75d@amd.com>
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
Cc: Xinhui.Pan@amd.com, Patil.Reddy@amd.com, basavaraj.natikar@amd.com,
 jikos@kernel.org, amd-gfx@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, markgross@kernel.org,
 benjamin.tissoires@redhat.com, dri-devel@lists.freedesktop.org,
 linux-input@vger.kernel.org, alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

I was not following this at first, so my apologies for
jumping in in the middle of the thread:


<snip>

>>>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>>>>> +                     unsigned long *state)
>>>>> +{
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!acpi_video_backlight_use_native())
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    *state = backlight_get_brightness(bd);
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>>>>> +                     unsigned long *state)
>>>>> +{
>>>>> +    struct backlight_device *bd;
>>>>> +
>>>>> +    if (!acpi_video_backlight_use_native())
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>>>> +    if (!bd)
>>>>> +        return -ENODEV;
>>>>> +
>>>>> +    if (backlight_is_blank(bd))
>>>>> +        *state = 0;
>>>>> +    else
>>>>> +        *state = bd->props.max_brightness;
>>>>> +
>>>>> +    return 0;
>>>>> +}
>>>>> +
>>>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>>>> +    .get_max_state = amd_pmf_gpu_get_max_state,
>>>>> +    .get_cur_state = amd_pmf_gpu_get_cur_state,
>>>>> +};

So first of all, good to see that this is using the
thermal_cooling_device APIs now, that is great thank you.

But the whole idea behind using the thermal_cooling_device APIs
is that amdgpu exports the cooling_device itself, rather then have
the AMD PMF code export it. Now the AMD PMF code is still poking
at the backlight_device itself, while the idea was to delegate
this to the GPU driver.

Actually seeing all the acpi_video_backlight_use_native()
checks here, I wonder why only have this work with native backlight
control. One step better would be to add thermal_cooling_device
support to the backlight core in:
drivers/video/backlight/backlight.c

Then it will work with any backlight control provider!



Last but not least this code MUST not call
acpi_video_backlight_use_native()

No code other then native GPU drivers must ever call
acpi_video_backlight_use_native(). This special function
not only checks if the native backlight control is the
one which the detection code in drivers/acpi/video_detect.c
has selected, it also signals to video_detect.c that
native GPU backlight control is available.

So by calling this in the AMD PMF code you are now
telling video_detect.c that native GPU backlight control
is available on all systems where AMD PMF runs.

As I already said I really believe the whole cooling
device should be registered somewhere else. But if you
do end up sticking with this then you MUST replace
the acpi_video_backlight_use_native() calls with:

	if (acpi_video_get_backlight_type() == acpi_backlight_native) {...}

Regards,

Hans



