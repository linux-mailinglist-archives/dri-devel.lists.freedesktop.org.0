Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA843AE77C
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 12:45:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052E0899D4;
	Mon, 21 Jun 2021 10:45:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3B7B4892BD
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Jun 2021 10:45:22 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 380ED1FB;
 Mon, 21 Jun 2021 03:45:21 -0700 (PDT)
Received: from [192.168.1.179] (unknown [172.31.20.19])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 074AE3F718;
 Mon, 21 Jun 2021 03:45:19 -0700 (PDT)
Subject: Re: [PATCH] drm/panfrost:modify 'break' to 'continue' to traverse the
 circulation
To: Chunyou Tang <tangchunyou@163.com>
References: <20210617080414.1940-1-tangchunyou@163.com>
 <4d289eed-59f2-161a-40d1-2a434a1955c2@arm.com>
 <20210619110923.00001c64@163.com>
From: Steven Price <steven.price@arm.com>
Message-ID: <eb036b84-ebb7-1f2d-3abd-7de13479fa3c@arm.com>
Date: Mon, 21 Jun 2021 11:45:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210619110923.00001c64@163.com>
Content-Type: text/plain; charset=gb18030
Content-Language: en-GB
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
Cc: tomeu.vizoso@collabora.com, airlied@linux.ie, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, alyssa.rosenzweig@collabora.com,
 ChunyouTang <tangchunyou@icubecorp.cn>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 19/06/2021 04:09, Chunyou Tang wrote:
> Hi Steve,
> 	1,
> from
> https://lore.kernel.org/lkml/31644881-134a-2d6e-dddf-e658a3a8176b@arm.com/
> I can see what your sent,I used a wrong email address,Now it correct.
> 	2,
>>> Unless I'm mistaken the situation where some mappings may be NULL is
>>> caused by the loop in panfrost_lookup_bos() not completing
>>> successfully
>>> (panfrost_gem_mapping_get() returning NULL). In this case if
>>> mappings[i]
>>> is NULL then all following mappings must also be NULL. So 'break'
>>> allows
>>> us to skip the later ones. Admittedly the performance here isn't
>>> important so I'm not sure it's worth the optimisation, but AIUI this
>>> code isn't actually wrong.
> 
> from panfrost_lookup_bos(),you can see:
>         for (i = 0; i < job->bo_count; i++) {
>                 struct panfrost_gem_mapping *mapping;
> 
>                 bo = to_panfrost_bo(job->bos[i]);
>                 ICUBE_DEBUG_PRINTK("panfrost bo gem handle=0x%x
>                 is_dumb=%d\n", bo->gem_handle, bo->is_dumb);
>                 if (!bo->is_dumb) {
>                        mapping = panfrost_gem_mapping_get(bo, priv);
>                        if (!mapping) {
>                                 ret = -EINVAL;
>                                 break;
>                        }
> 
>                         atomic_inc(&bo->gpu_usecount);
>                         job->mappings[i] = mapping;
>                 } else {
>                         atomic_inc(&bo->gpu_usecount);
>                         job->mappings[i] = NULL;
>                 }
>         }

This code isn't upstream - in drm-misc/drm-misc-next (and all mainline
kernels from what I can tell) this doesn't have any "is_dumb" test.
Which branch are you using?

> if bo->is_dumb is TRUE,the job->mappings[i] will set to NULL,and the
> while will be continue,so if job->mappings[i] is NULL,the following
> can not be NULL.

I agree that with the above code the panfrost_job_cleanup() would need
changing. But we don't (currently) have this code upstream, so this
change doesn't make sense upstream.

Thanks,

Steve

> 	3,
> I've had this problem in our project,the value of is_dumb like these:
> 0
> 0
> 0
> 1
> 0
> 0
> 0
> so,when job->mappings[i] is NULL,we can not break the while in 
> panfrost_job_cleanup().
> 
> thanks
> Chunyou
> 
> ÓÚ Fri, 18 Jun 2021 13:43:25 +0100
> Steven Price <steven.price@arm.com> Ð´µÀ:
> 
>> On 17/06/2021 09:04, ChunyouTang wrote:
>>> From: ChunyouTang <tangchunyou@icubecorp.cn>
>>>
>>> The 'break' can cause 'Memory manager not clean during takedown'
>>>
>>> It cannot use break to finish the circulation,it should use
>>>
>>> continue to traverse the circulation.it should put every mapping
>>>
>>> which is not NULL.
>>
>> You don't appear to have answered my question about whether you've
>> actually seen this happen (and ideally what circumstances). In my
>> previous email[1] I explained why I don't think this is needed. You
>> need to convince me that I've overlooked something.
>>
>> Thanks,
>>
>> Steve
>>
>> [1]
>> https://lore.kernel.org/r/31644881-134a-2d6e-dddf-e658a3a8176b%40arm.com
>>
>>> Signed-off-by: ChunyouTang <tangchunyou@icubecorp.cn>
>>> ---
>>>  drivers/gpu/drm/panfrost/panfrost_job.c | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/panfrost/panfrost_job.c
>>> b/drivers/gpu/drm/panfrost/panfrost_job.c index
>>> 6003cfeb1322..52bccc1d2d42 100644 ---
>>> a/drivers/gpu/drm/panfrost/panfrost_job.c +++
>>> b/drivers/gpu/drm/panfrost/panfrost_job.c @@ -281,7 +281,7 @@
>>> static void panfrost_job_cleanup(struct kref *ref) if
>>> (job->mappings) { for (i = 0; i < job->bo_count; i++) {
>>>  			if (!job->mappings[i])
>>> -				break;
>>> +				continue;
>>>  
>>>  			atomic_dec(&job->mappings[i]->obj->gpu_usecount);
>>>  			panfrost_gem_mapping_put(job->mappings[i]);
>>>
> 
> 

