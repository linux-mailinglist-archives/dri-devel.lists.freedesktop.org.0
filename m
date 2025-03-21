Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45739A6BBB0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 14:25:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3090910E7CC;
	Fri, 21 Mar 2025 13:25:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UHXPyuSh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FA710E7C9;
 Fri, 21 Mar 2025 13:25:08 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-43cfdc2c8c9so11742745e9.2; 
 Fri, 21 Mar 2025 06:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742563507; x=1743168307; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iRoO2HIVhJx7KXEKNQR5uppWvhdr6UHy9j0aDQciE08=;
 b=UHXPyuShPxkuJfzd8VqcWy/RGPIT6rsQNIovb//ULyUaO8s93J9tbWpJ5yTGu/zn94
 8YMKosuPxN4LNA00zDjFuTqJ9de6dMjfDTV4CPJCwXAKxPDxhyhk2pDAx5DZbJn7S1Ye
 bjw5jiYZIFRfhiVcGRy2mTWfm7aPQBRHicJnWXHyR/8MeIHvJnYSDB6NWxiTLI4tIMYZ
 QlOwW/5SGjIXrjWlrZaCYGDPIE0LcMjqD1DbmgiF/Nt/JKoc75HlLyPD8Yy4KofgprVf
 OrMMA3/2emYYN92ZH5MP+aShOXgY2c9kK3vUaPwMTnXTMEQ5yXwm6cf2hC1BT/jRWAun
 N8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742563507; x=1743168307;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iRoO2HIVhJx7KXEKNQR5uppWvhdr6UHy9j0aDQciE08=;
 b=Kanf8j8iLe19dk0bhTsXXCWjr6y27tps0w9erYv/pgQ1xIvszFvc+GcUwKXh8qDe2L
 ITQ/OMO77hUujGau5i69CwF+HXc6SH6ekjJkF8Hbl6sfIOhS1JLI2949wjIG7q7ga0yo
 KGVGwdorJOnj8tVuaVKha1+AbBIAak8ytJ+Lqo8dlfXAEa8WCsdq76ePq2G6OjhCfP76
 LsxdDmVBfoNBKialINMaxo5BLYY2Y1uZHKvaHdeyvE9T1+UkmdCMpW3vp4wVb6KZJB0A
 sbrEVYm2JhOq7SZg+2oouGVEaSa7ociR//0xl725GDeSjFjynN9oKroGdSyVJc9ooHsx
 bb6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUk/2mGsIjniK8qUUvxU8hRkkSerOnxSKQwEP4H3gKJ2Vs/q5afyIjqI/bM7EtmMvuqNimsAwIv@lists.freedesktop.org,
 AJvYcCWmgpMB9CoD2s2SlNxYKh4Xb6dmEOlXaAVJ7yocsaXh8WAT/bX9UVT5cvmbEHD4yWec+czLdsJyzZh6@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzWva3xAryQYU59TkXhath+Cm9hrSqWGaxSkjVoEGL3+QNtldDa
 tFxA3H+sbYkO0dILd2Oifw3S0X3CygSu45eYvq6Il+U/vh8DmDNP
X-Gm-Gg: ASbGncuBXycQgU3BVPu+NXUoAMiG1QBXjqz0wAVaCi3dcP9h2twQnDRgd7WCqalkY6G
 /M2YKWwkuWlXnHRHg3fPTtZaev1mcFD4FiwNyWTc/EPjW7SkEBR8yHWaWjsMQtjiJ/ZA9A4BLEv
 xa4/QMLqFkRP+KS7khMmI701u8OXKgTQwmusxMP8ibKDTu0SD2pXqI/w43kdg5tzUFL8AXnTfWD
 8nTeXRLE8V9+2NeDif7exUmFDoJvbCNkxA/T1KW+45GG2dCw8s/pwHzS+CGTOjfUd2aE/r/3ehz
 OW860cSMOylRYSyE1uA3LydM2ALSxAC730v9GggWrro2YQ/mIRwiV5Nzxmmomza7eRFXfCqMAw=
 =
X-Google-Smtp-Source: AGHT+IHtSfmXpUCU8d8KsXFKjS4cAhiQAbBnffdMuWJVTAXrNcdouH8lvBfz0eYaeyMAApUAeHdY8g==
X-Received: by 2002:a05:600c:3584:b0:43c:e2dd:98ea with SMTP id
 5b1f17b1804b1-43d50a211f5mr24054765e9.22.1742563506232; 
 Fri, 21 Mar 2025 06:25:06 -0700 (PDT)
Received: from [10.254.108.83] (munvpn.amd.com. [165.204.72.6])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43d4fceafacsm27426145e9.6.2025.03.21.06.25.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Mar 2025 06:25:05 -0700 (PDT)
Message-ID: <09e28c34-657d-43c1-9f2e-e1870425b450@gmail.com>
Date: Fri, 21 Mar 2025 14:25:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/sched: add drm_sched_prealloc_dependency_slots
To: phasta@kernel.org, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 amd-gfx@lists.freedesktop.org
References: <20250318120313.19099-1-christian.koenig@amd.com>
 <20250318120313.19099-2-christian.koenig@amd.com>
 <769f6c5788eff9459414b8ce0b056989e29773af.camel@mailbox.org>
 <48f07793-0fd4-4cdd-8568-3bd2ff63bb6a@gmail.com>
 <860fb3b6-0f18-49c4-b464-5c8c8995e6bd@igalia.com>
 <773a6105e1b448ecb2be8b2c80bb63c0e08f52d2.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>
In-Reply-To: <773a6105e1b448ecb2be8b2c80bb63c0e08f52d2.camel@mailbox.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 21.03.25 um 09:20 schrieb Philipp Stanner:
> On Thu, 2025-03-20 at 11:49 +0000, Tvrtko Ursulin wrote:
>> On 19/03/2025 11:23, Christian König wrote:
>>>>> + *
>>>>> + * Return:
>>>>> + * 0 on success, or an error on failing to expand the array.
>>>>> + */
>>>>> +int drm_sched_job_prealloc_dependency_slots(struct
>>>>> drm_sched_job
>>>>> *job,
>>>>> +					    unsigned int
>>>>> num_deps)
>>>>> +{
>>>>> +	struct dma_fence *fence;
>>>>> +	u32 id = 0;
>>>>> +	int ret;
>>>>> +
>>>>> +	while (num_deps--) {
>>>>> +		fence = dma_fence_get_stub();
>>>>> +		ret = xa_alloc(&job->dependencies, &id, fence,
>>>>> xa_limit_32b,
>>>>> +			       GFP_KERNEL);
>>>> So this would fill the xarr with already signaled fences which
>>>> then
>>>> later will be replaced with unsignaled fences?
>>> Yes, exactly that's the idea.
>>>
>>>> Help me out here: would it also work to add NULL instead of that
>>>> stub-
>>>> fence?
>>> Good question, idk. That's an implementation detail of the xarray.
>>>
>>> Tvrtko also correctly pointed out that it is most likely a bad idea
>>> to 
>>> use dma_fence_is_signaled() in the critical code path.
>>>
>>> I will try to dig through the xarray behavior up and update the
>>> patch if 
>>> possible.
>> I think NULL on its own is not possible, but the two low bits are 
>> available for pointer tagging, or designating pointers vs integers, 
>> which looks like it could work. Something like storing 
>> xa_tag_pointer(NULL, 1) to reserved slots and at lookup time they
>> would 
>> be detected with "xa_pointer_tag(fence) & 1".
> Almost!
>
> they would be detected with a super-readable
>
> #define DRM_SCHED_XARR_TAG_RESERVED_ENTRY 1
>
> or maybe …UNUSED_ENTRY?

NULL doesn't work because xa_for_each() skips NULL entries, but it looks like somebody else stumbled over the same problem we have here as well.

So there is already the solution to use XA_ZERO_ENTRY! That special value can then either be used with xa_alloc() or through xa_reserve().

It's just that the xarray documentation is not explicitly pointing that out, so I had to dig around in the code a bit to figure out how everything works.

Regards,
Christian.

>
> ^_^
>
> P.
>
>
>> Regards,
>>
>> Tvrtko
>>

