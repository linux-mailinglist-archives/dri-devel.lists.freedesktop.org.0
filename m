Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CEC98C427C
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 15:49:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FED710E77D;
	Mon, 13 May 2024 13:49:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="TPPwwtUh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 45D8D10E77D
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 13:49:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-41fc53252ceso31040165e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 06:49:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1715608192; x=1716212992;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jKUaQRVT8NcLartK7c8w6ZiEp5uv/vNiPpy09Cor7pE=;
 b=TPPwwtUhRptP804cSdEW0PhAJeSOphOd0eHFIUG60i/w/w4+u0HLZkUwRXiLGzvMko
 chO6CZay0zL2/cqxZZjaAxt7mEodYtIcAK9DMhPFLE6n7ca5tYAnaPZkrEAsDb9yoP67
 Ehw/O+ScHeRsHShJZu6AqPezmreP97AkUs0s+WL5g0i+p/ibrkJY9zSPAnQE65+H/tnq
 gn51vQMGzg/sr3F/GNGz+SnCPVesSSC5/SiY74edXG+QYqwAYAJXD55TbVe8txXJ4LWX
 +ry1o7ySveITTwcizHmFFC+MngXnCYNDyXN4jOskhOnsWZ0trtfLRKovfB5tsb/011T6
 VaiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715608192; x=1716212992;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=jKUaQRVT8NcLartK7c8w6ZiEp5uv/vNiPpy09Cor7pE=;
 b=xBR66qgcO6qOBIX4/goA+V9y/J+gqpF51tq8tGhhT1f2yp20MDsaOPrFyZxE3aE7gH
 G7gikU0YVFPUjQ9ia2qhma8HAVmFm5ONXzgdf/ebzl5RIdM45ehj2ktAUGh3OkOnXiQ/
 1d26L6fUrE5j9lyxcpyfgg3iV8s4uTQnI4ncx4tCvadkB/2xg+icIRY+8wes/zyHzWcv
 QlwYwJsEcr82Dz/Xb+pnN0mgK2fTFSb/JXv7RMIhJ/9ArwfXFdRHCG0o/TjTQc1EL0uN
 dLJMk9s3EwebLyhWZmalY2x+HeEO1vyDNQQN12a5PotjqOizOUfli4gZlfHsfE9cVW70
 WzvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbfOfWsF9TEgK17FszR+SFJnUDoqw2aP+aSmPML018/CEYExJJp3IFgwMKi/z5DhEnVwA8zUSo2DGD/oKFS4NPWpgrnx0h+FVAlLgKbTyp
X-Gm-Message-State: AOJu0YxlKzvCfRRBuVy4T4ShchG4hM9WMKNlvyTGeAsags8/amOuwrBF
 fB4rrrz1D4NI5Mp9mpUPSnHvCL+JJHOA8Wjhhioy8KeBUlP+kTKtvKtZ5ihVHiE=
X-Google-Smtp-Source: AGHT+IFMNJ/KDjkdgPxJFA8RtrAE8j2Ed41gi3q6+pVaRLtBu1ZrQq49Dwjta2mTvCrYNdHXqedZfA==
X-Received: by 2002:adf:f9ca:0:b0:347:2055:f49e with SMTP id
 ffacd0b85a97d-3504a73e7admr7442429f8f.33.1715608192369; 
 Mon, 13 May 2024 06:49:52 -0700 (PDT)
Received: from [192.168.0.101] ([84.69.19.168])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3502bbbca98sm11181452f8f.112.2024.05.13.06.49.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 May 2024 06:49:52 -0700 (PDT)
Message-ID: <6b4bbb02-3f12-4a6a-8e61-c776da636d1d@ursulin.net>
Date: Mon, 13 May 2024 14:49:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 0/5] Discussion around eviction improvements
Content-Language: en-GB
To: Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Friedrich Vock <friedrich.vock@gmx.de>
References: <20240508180946.96863-1-tursulin@igalia.com>
 <e39bcdd1-90e7-42f3-94a9-ea1af6b0d278@ursulin.net>
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <e39bcdd1-90e7-42f3-94a9-ea1af6b0d278@ursulin.net>
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


On 09/05/2024 13:40, Tvrtko Ursulin wrote:
> 
> On 08/05/2024 19:09, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Last few days I was looking at the situation with VRAM over 
>> subscription, what
>> happens versus what perhaps should happen. Browsing through the driver 
>> and
>> running some simple experiments.
>>
>> I ended up with this patch series which, as a disclaimer, may be 
>> completely
>> wrong but as I found some suspicious things, to me at least, I thought 
>> it was a
>> good point to stop and request some comments.
>>
>> To perhaps summarise what are the main issues I think I found:
>>
>>   * Migration rate limiting does not bother knowing if actual 
>> migration happened
>>     and so can over-account and unfairly penalise.
>>
>>   * Migration rate limiting does not even work, at least not for the 
>> common case
>>     where userspace configures VRAM+GTT. It thinks it can stop 
>> migration attempts
>>     by playing with bo->allowed_domains vs bo->preferred domains but, 
>> both from
>>     the code, and from empirical experiments, I see that not working 
>> at all. Both
>>     masks are identical so fiddling with them achieves nothing.
>>
>>   * Idea of the fallback placement only works when VRAM has free 
>> space. As soon
>>     as it does not, ttm_resource_compatible is happy to leave the 
>> buffers in the
>>     secondary placement forever.
>>
>>   * Driver thinks it will be re-validating evicted buffers on the next 
>> submission
>>     but it does not for the very common case of VRAM+GTT because it 
>> only checks
>>     if current placement is *none* of the preferred placements.
>>
>> All those problems are addressed in individual patches.
>>
>> End result of this series appears to be driver which will try harder 
>> to move
>> buffers back into VRAM, but will be (more) correctly throttled in 
>> doing so by
>> the existing rate limiting logic.
>>
>> I have run a quick benchmark of Cyberpunk 2077 and cannot say that I 
>> saw a
>> change but that could be a good thing too. At least I did not break 
>> anything,
>> perhaps.. On one occassion I did see the rate limiting logic get 
>> confused while
>> for a period of few minutes it went to a mode where it was constantly 
>> giving a
>> high migration budget. But that recovered itself when I switched 
>> clients and did
>> not come back so I don't know. If there is something wrong there I 
>> don't think
>> it would be caused by any patches in this series.
> 
> Since yesterday I also briefly tested with Far Cry New Dawn. One run 
> each so possibly doesn't mean anything apart that there isn't a 
> regression aka migration throttling is keeping things at bay even with 
> increased requests to migrate things back to VRAM:
> 
>               before         after
> min/avg/max fps        36/44/54        37/45/55
> 
> Cyberpunk 2077 from yesterday was similarly close:
> 
>          26.96/29.59/30.40    29.70/30.00/30.32
> 
> I guess the real story is proper DGPU where misplaced buffers have a 
> real cost.

I found one game which regresses spectacularly badly with this series - 
Assasin's Creed Valhalla. The built-in benchmark at least. The game 
appears to have a working set much larger than the other games I tested, 
around 5GiB total during the benchmark. And for some reason migration 
throttling totally fails to put it in check. I will be investigating 
this shortly.

Regards,

Tvrtko

>> Series is probably rough but should be good enough for dicsussion. I 
>> am curious
>> to hear if I identified at least something correctly as a real problem.
>>
>> It would also be good to hear what are the suggested games to check 
>> and see
>> whether there is any improvement.
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>>
>> Tvrtko Ursulin (5):
>>    drm/amdgpu: Fix migration rate limiting accounting
>>    drm/amdgpu: Actually respect buffer migration budget
>>    drm/ttm: Add preferred placement flag
>>    drm/amdgpu: Use preferred placement for VRAM+GTT
>>    drm/amdgpu: Re-validate evicted buffers
>>
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 38 +++++++++++++++++-----
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  8 +++--
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c     | 21 ++++++++++--
>>   drivers/gpu/drm/ttm/ttm_resource.c         | 13 +++++---
>>   include/drm/ttm/ttm_placement.h            |  3 ++
>>   5 files changed, 65 insertions(+), 18 deletions(-)
>>
