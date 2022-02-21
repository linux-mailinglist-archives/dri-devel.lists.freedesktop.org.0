Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8B4BEC31
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 22:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E42A210E20F;
	Mon, 21 Feb 2022 21:02:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3321410E20F
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 21:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645477329;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wDRxqxZuWPSaCv6rqIdjrfVOR7wM38/w+tQeZAITHHI=;
 b=feF99/DPtSvRxmaICs0PAJhJWz2VZYANrn8+zSwAtbX/3W1b0pDv8PUJhrAmRbIAqWbUgJ
 r0vtc8axIhNB2sGxWnAufa3CRc7Y3to4LUVIubZy1BbSyjPNElaWZLW5dxMpLoBKmc7kJt
 FtLB7CSskCqUXwDIum9D0os5RPI/L3I=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-55-WkxK9kAEOjuZIEeK0xp-1Q-1; Mon, 21 Feb 2022 16:02:08 -0500
X-MC-Unique: WkxK9kAEOjuZIEeK0xp-1Q-1
Received: by mail-qk1-f199.google.com with SMTP id
 p67-20020a378d46000000b0062adb7627edso10434519qkd.8
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 13:02:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=wDRxqxZuWPSaCv6rqIdjrfVOR7wM38/w+tQeZAITHHI=;
 b=gECEaeWYXGZpYZzwGooMZQ7w1WK+Y4IbfXje83OHKWDupWQNGU0ej9ndtDe1fAroCh
 8vkp7eigz95PBnhPBq0XRIjUYsX9dNbaEL+g3g83uQbrA50KrC19iubjWb1xwqTgZxgL
 QJItJGq9s/FUN11iuCdtULIgoMNIcmvnnWAlO1pNLm9XVeU2GjZqO7ndqDk4mtciqRut
 E18+VXvEmHY2nGmhud/XfX7ucbdQc8HcE64HRzEoxau8lXt2/GIjxckqJVht9UVO2p6m
 eWOmyNwOJGuN9fsALA8oFiHzkNkjtzh5FLpNofdzbYmMP3iua0PRX841BygMQA5Lzgit
 jgLQ==
X-Gm-Message-State: AOAM5332EBkWeFkbydEFatXOkudqpr7O2wJkifnzMsrSy4eO+aQwthn1
 +68jcu4bOeMacwdEZCjAnUJ/D3qo914vbAOWZqFyqnOlmkMnpQ15Z5oum6ZfWpmkzufD/IaOfIF
 KqRUCOlQM4v2/oKZoXzmlrgria2uO
X-Received: by 2002:a05:620a:c4a:b0:508:ab56:416a with SMTP id
 u10-20020a05620a0c4a00b00508ab56416amr13105372qki.635.1645477327525; 
 Mon, 21 Feb 2022 13:02:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMWVJJ3w7YQ16IhiKVsRJpXk3MDA7O6OtbGiyG5NMXzYhn7xuySqMgh6EnOg/tCrpRwnWHzw==
X-Received: by 2002:a05:620a:c4a:b0:508:ab56:416a with SMTP id
 u10-20020a05620a0c4a00b00508ab56416amr13105346qki.635.1645477327212; 
 Mon, 21 Feb 2022 13:02:07 -0800 (PST)
Received: from localhost.localdomain (024-205-208-113.res.spectrum.com.
 [24.205.208.113])
 by smtp.gmail.com with ESMTPSA id a20sm4639202qtx.6.2022.02.21.13.02.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 21 Feb 2022 13:02:06 -0800 (PST)
Subject: Re: [PATCH] drm/amdgpu: fix printk format for size_t variable
To: Luben Tuikov <luben.tuikov@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, Xinhui.Pan@amd.com, airlied@linux.ie,
 daniel@ffwll.ch, guchun.chen@amd.com, Prike.Liang@amd.com,
 Hawking.Zhang@amd.com
References: <20220221173737.3725760-1-trix@redhat.com>
 <84e354ec-cfbf-a23f-ddd5-417d6f029873@amd.com>
 <e490241d-9a22-f873-2b15-18b12896ea65@redhat.com>
 <84b3679e-8900-ae51-e700-867631618829@amd.com>
From: Tom Rix <trix@redhat.com>
Message-ID: <24848c09-8cee-5df1-bf4c-9d187ac107af@redhat.com>
Date: Mon, 21 Feb 2022 13:02:03 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <84b3679e-8900-ae51-e700-867631618829@amd.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=trix@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
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
Cc: Nick Desaulniers <ndesaulniers@google.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/21/22 12:53 PM, Luben Tuikov wrote:
> On 2022-02-21 15:36, Tom Rix wrote:
>> On 2/21/22 11:57 AM, Luben Tuikov wrote:
>>> Hi Tom,
>>>
>>> This was already fixed with this patch, and LKML was CC-ed. See the CC tags in the patch below,
>>>
>>> commit 4f7d7cda90cbd7
>>> Author: Luben Tuikov <luben.tuikov@amd.com>
>>> Date:   Wed Feb 16 16:47:32 2022 -0500
>>>
>>>       drm/amdgpu: Fix ARM compilation warning
>>>       
>>>       Fix this ARM warning:
>> I glad it wasn't just mips ;)
>>
>> There have been a couple of build breaks with amdgpu recently.
>>
>> Nick asked about adding clang to your ci.
>>
>> Could at least one non x86_64 gcc also be added, maybe aarch64 ?
> Yeah, that's a great idea. I tried the make.cross (for ARM) as per
> the initial breakage report, but when I tried it, it got into a loop of
> "make ARCH=arm mrproper" --> "make prepare" --> "make ARCH=arm mrproper" --> "make prepare" --> ...
> and I couldn't figure out why.
Maybe need to set CROSS_COMPILE ?
> I don't mind adding ARM cross compilation into my local setup.

For crosses, I generate a 'make' script like

#!/bin/sh

export PATH=<path-to-cross-tools>/bin:$PATH

make ARCH=arm64 CROSS_COMPILE=aarch64-elf- $@

so workflow looks like normal, replacing make with ./make

Tom

>
> Regards,
> Luben
>
>
>> Tom
>>
>>>       
>>>       drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c:664:35: warning: format '%ld'
>>>       expects argument of type 'long int', but argument 4 has type 'size_t' {aka
>>>       'unsigned int'} [-Wformat=]
>>>       
>>>       Cc: Alex Deucher <Alexander.Deucher@amd.com>
>>>       Cc: kbuild-all@lists.01.org
>>>       Cc: linux-kernel@vger.kernel.org
>>>       Reported-by: kernel test robot <lkp@intel.com>
>>>       Fixes: 7e60fbfbdc10a0 ("drm/amdgpu: Show IP discovery in sysfs")
>>>       Signed-off-by: Luben Tuikov <luben.tuikov@amd.com>
>>>       Acked-by: Alex Deucher <Alexander.Deucher@amd.com>
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>> index 2506bcf36c870c..6c7ec058125e1d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>>                               le16_to_cpu(ip->hw_id) != ii)
>>>                                   goto next_ip;
>>>    
>>> -                       DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>>> +                       DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>>>    
>>>                           /* We have a hw_id match; register the hw
>>>                            * block if not yet registered.
>>>
>>> Regards,
>>> Luben
>>>
>>> On 2022-02-21 12:37, trix@redhat.com wrote:
>>>> From: Tom Rix <trix@redhat.com>
>>>>
>>>> On mips64 allyesconfig, there is this build break
>>>> amdgpu_discovery.c:671:35: error: format '%ld' expects
>>>>     argument of type 'long int', but argument 4 has
>>>>     type 'size_t' {aka 'unsigned int'}
>>>>     DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>>>>
>>>> For size_t, use %zu.
>>>>
>>>> Fixes: a6c40b178092 ("drm/amdgpu: Show IP discovery in sysfs")
>>>> Signed-off-by: Tom Rix <trix@redhat.com>
>>>> ---
>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c | 2 +-
>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>> index 7c7e28fd912e..58238f67b1d3 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_discovery.c
>>>> @@ -668,7 +668,7 @@ static int amdgpu_discovery_sysfs_ips(struct amdgpu_device *adev,
>>>>    			    le16_to_cpu(ip->hw_id) != ii)
>>>>    				goto next_ip;
>>>>    
>>>> -			DRM_DEBUG("match:%d @ ip_offset:%ld", ii, ip_offset);
>>>> +			DRM_DEBUG("match:%d @ ip_offset:%zu", ii, ip_offset);
>>>>    
>>>>    			/* We have a hw_id match; register the hw
>>>>    			 * block if not yet registered.
>>> Regards,
> Regards,

