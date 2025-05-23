Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 02F7DAC22A9
	for <lists+dri-devel@lfdr.de>; Fri, 23 May 2025 14:32:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A43210E2C3;
	Fri, 23 May 2025 12:32:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="FTkcYd3c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A88D310E2C3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 12:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748003524;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JcvksgI45S/8E1WUYGj2/F8s3tMa9vH57sxKYk6s7xg=;
 b=FTkcYd3cL2UUoNJgKVAmVdwLv2epZpnESHx8QYJinX9ZaeHzi/Q6V0gOTAU+kzNMN3F0L5
 IDW8/VepYrwvnR22k3sEtJGtzZXUUIEd05LN7SOBggCZubey3dY7RbyDVqZKm14oF0aXXA
 BzZ6qOUn36rg0JEAsiBAVgMMgSj7Zdc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-190-F0M7J3egO9aBiJbZh9I59g-1; Fri, 23 May 2025 08:32:01 -0400
X-MC-Unique: F0M7J3egO9aBiJbZh9I59g-1
X-Mimecast-MFC-AGG-ID: F0M7J3egO9aBiJbZh9I59g_1748003520
Received: by mail-wr1-f71.google.com with SMTP id
 ffacd0b85a97d-3a3703c1fe7so2823855f8f.1
 for <dri-devel@lists.freedesktop.org>; Fri, 23 May 2025 05:32:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748003520; x=1748608320;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JcvksgI45S/8E1WUYGj2/F8s3tMa9vH57sxKYk6s7xg=;
 b=twMKRx0mhPZeEpHNn70B4+WL2NHIBeQCUUP++fN/lasY6oO18JoZJphOq+ml+VDU+b
 KYGlpC9iZpa9z8sMXlNqAJob91tni987cw+WMQqpihzrzEuyWrCYzjCyikRNXbqbofy3
 pCeLB+tjqmEe3isZCVgY2ZGrQkNJiI03l+iXAxJFNtmrjPG6raVRZU0itCJTAiKKzalP
 o0wfzIQsmUpeczCykmOLo10z8byB8+03DEypAL8TzzmdqCWNLiSlHOwROTFmbHl414nG
 RLikPuhIx88zQi9tJFJOvpUmaATHobA2NwVKZv5AkK0bMJA+qt7gjGdmCwXuHeZUgtTp
 W5pA==
X-Gm-Message-State: AOJu0YwWZ0A0lWUK7A+lyNd3fnecBZUAGSOVqP5YZDD1lJTp+AhNmvVn
 YqCS4MNkFmRXJcZGpjsMFefEWzxpPTjwc9suY11/vLQZSrRJnVoSm65EisUkFdhLS41xQxk8aNu
 d8pNUom4NpCqkbR/q5IMOAmaT5sdZnEOCQnjFKChYRDuXgxTrDRwyQe6n92o6kSRrdC5Ycw==
X-Gm-Gg: ASbGncvwQhghFkTL0wC45uHMzfbLESF9fUGripTEPWe5JuTbaoeh1A3DxSuN5troRDI
 XiBwK3MWXpDpA8fzt0I8zcuYTg6IQsSifNoVD99UoYQyhnn5nx794FLkKs4PgDCfEqQ9P/Nq7lq
 ugEA+fY5e7DKx2RwSQQ6Wg1ynJtpVleKd52FMPUnIxMIqhRVRRRtLML3gC1W37701cYSpoP7UuC
 UWCoNGS2+FDil+KDCMT2wTyYJw7olkH7Ym9wY61doN4UCnCMolq8jLehNlRi+y0DsapSlQ/A5bp
 FAWAEgFoZUE6KsCti1gdtf2tX1FlCLTH0VOvxjyZdc0OGrtVfes=
X-Received: by 2002:a5d:5850:0:b0:3a3:671f:3b8d with SMTP id
 ffacd0b85a97d-3a3671f3bdbmr20822201f8f.24.1748003519830; 
 Fri, 23 May 2025 05:31:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENe0zYjJCdhmq6TU5dk0Zz1XOk+XjQUKGqMTA/fbZa5Ytp2n9rDy/yn9zLGJCZSh2INWr/jw==
X-Received: by 2002:a5d:5850:0:b0:3a3:671f:3b8d with SMTP id
 ffacd0b85a97d-3a3671f3bdbmr20822173f8f.24.1748003519411; 
 Fri, 23 May 2025 05:31:59 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a35ca4d2ddsm26133607f8f.7.2025.05.23.05.31.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 May 2025 05:31:59 -0700 (PDT)
Message-ID: <d269185e-64ad-49cb-8ef9-760feb1d80bb@redhat.com>
Date: Fri, 23 May 2025 14:31:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 9/9] iosys_map: embed the is_iomem bit into the pointer.
To: Lucas De Marchi <lucas.demarchi@intel.com>, Dave Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, tzimmermann@suse.de,
 intel-xe@lists.freedesktop.org, Michal.Wajdeczko@intel.com
References: <20250522065519.318013-1-airlied@gmail.com>
 <20250522065519.318013-10-airlied@gmail.com>
 <wz6cduq6kh2n2pwxm3q75vjmrsht4rvnbjnch5t66kj773t2rj@kfk2bj7pewwm>
 <CAPM=9twLXMbaTNhr0y52aA90sytE2-zb_zC4eZ5xLC0CE1_1dg@mail.gmail.com>
 <vsyxybzdei2tgybmhwbt7fc2rerphe5zmgbvgh4uj4sr3onsru@bcq72ctoli7q>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <vsyxybzdei2tgybmhwbt7fc2rerphe5zmgbvgh4uj4sr3onsru@bcq72ctoli7q>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Spz0PkRyBr5u4ipCdILt035x2xg4QBAAuvWoNIfC6v8_1748003520
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 22/05/2025 23:05, Lucas De Marchi wrote:
> On Fri, May 23, 2025 at 06:32:43AM +1000, Dave Airlie wrote:
>> On Fri, 23 May 2025 at 01:10, Lucas De Marchi 
>> <lucas.demarchi@intel.com> wrote:
>>>
>>> On Thu, May 22, 2025 at 04:52:18PM +1000, Dave Airlie wrote:
>>> >From: Dave Airlie <airlied@redhat.com>
>>> >
>>> >This reduces this struct from 16 to 8 bytes, and it gets embedded
>>> >into a lot of things.
>>> >
>>> >Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>
>>> Replied too early on cover. Chatting with Michal Wajdeczko today, this
>>> may break things as we then can't byte-address anymore. It seems
>>> particularly dangerous when using the iosys_map_wr/iosys_map_rd as
>>> there's nothing preventing an unaligned address and we increment the map
>>> with the sizeof() of a struct that could be __packed. Example: in
>>> xe_guc_ads.c we use it to write packed structs like guc_gt_system_info.
>>> In this particular case it doesn't give unaligned address, but we should
>>> probably then protect iosys_map from doing the wrong thing.
>>>
>>> So, if we are keeping this patch, we should probably protect
>>> initially-unaligned addresses and the iosys_map_incr() call?
>>
>> oh interesting, my thoughts was of course nobody would want to use
>> this for < 32-byte aligned ptrs :-)
>>
>> but I forgot about using the incr for stuff, I do wonder if the incr
>> could be modelled on a base + offset, as I do think for a lot of stuff
>> we'd want to retain the original vaddr for unmapping or other things,
> 
> for the parts of the code that want to update "inner blocks", the
> approach is to copy the struct and operate on that. Example from
> drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c:guc_prep_golden_context:
> 
>      info_map = IOSYS_MAP_INIT_OFFSET(&guc->ads_map,
>                       offsetof(struct __guc_ads_blob, system_info));
> 
> then that function can manipulate its "local map" without affecting the
> one used for really mapping the memory.

Also drm_panic uses that to draw into the frame buffer:
https://elixir.bootlin.com/linux/v6.14.7/source/drivers/gpu/drm/drm_panic.c#L181

So in case of 16bits or 24bits pixel width, it might be unaligned.
As it is used only to save one argument to the "blit" function, I think 
saving 8 bytes in the iosys_map struct, and using an additional offset 
argument is doable.

It is also used the same way in drm_format_helper:
https://elixir.bootlin.com/linux/v6.14.7/source/drivers/gpu/drm/drm_format_helper.c#L290

Best regards,

-- 

Jocelyn

> 
>>
>> I'll play around a bit more next week with at least protecting against 
>> bad uses.
> 
> thanks
> Lucas De Marchi
> 
>>
>> Dave.
> 

