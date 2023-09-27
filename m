Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B60377B070C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 16:37:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9251A10E542;
	Wed, 27 Sep 2023 14:37:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D2C10E53B;
 Wed, 27 Sep 2023 14:37:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695825423; x=1727361423;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Vq86wg25E1S0QDmaQFQmXhGozSKSAKKVSmU2/hjQZnw=;
 b=EDRa8Fyi39v2aVcpVcJkvLecle32wJcdIBVTDPmHrBcJYI0tonOqtmiQ
 BFvRBBPhSH1j5ES17/kKibQEArllIcxxteCGHi2ruOetsTXzPPRqsv7Fk
 10dstYOaz2B7+DAKIiyEtN6ORmtHwPOaStK4tgTrHfSrXqOTloZfK7eYa
 7tmGortpqIXp5HQzZGLhCq3QwlU0ZpTEVBAcNY0woZjeJxS0aPIAlBu4I
 +QwUs2Yl1ozB0rXkpmcf8p6Jh+WrFKkMaziBrfcpLjzMtqpPVeXOXaGvT
 15c1TeLHxyc4rNGnHVsbpX54NALz8r1Jaep9Mfyy36jiZn2eQurSZ8SQA g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="372181185"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="372181185"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:37:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="1080191656"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; d="scan'208";a="1080191656"
Received: from mscanex-mobl.ger.corp.intel.com (HELO [10.213.204.17])
 ([10.213.204.17])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Sep 2023 07:36:57 -0700
Message-ID: <eeff4966-8a93-c2c9-5ec3-5b1f71cd1ad9@linux.intel.com>
Date: Wed, 27 Sep 2023 15:36:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH v6 4/6] drm/drm_file: Add DRM obj's RSS reporting function
 for fdinfo
Content-Language: en-US
To: =?UTF-8?Q?Adri=c3=a1n_Larumbe?= <adrian.larumbe@collabora.com>
References: <20230919233556.1458793-1-adrian.larumbe@collabora.com>
 <20230919233556.1458793-5-adrian.larumbe@collabora.com>
 <495203cd-d85e-2c00-4fa9-81879a882441@linux.intel.com>
 <fs3u3b62vhixqpuoa5c4dwckew3l4etvps4zhlgeuwle6o2as2@tsgwsil4s35k>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <fs3u3b62vhixqpuoa5c4dwckew3l4etvps4zhlgeuwle6o2as2@tsgwsil4s35k>
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
Cc: tzimmermann@suse.de, sean@poorly.run, quic_abhinavk@quicinc.com,
 mripard@kernel.org, steven.price@arm.com, freedreno@lists.freedesktop.org,
 healych@amazon.com, Boris Brezillon <boris.brezillon@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 dmitry.baryshkov@linaro.org, marijn.suijten@somainline.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/09/2023 11:58, Adrián Larumbe wrote:
> On 20.09.2023 16:53, Tvrtko Ursulin wrote:
>>
>> On 20/09/2023 00:34, Adrián Larumbe wrote:
>>> Some BO's might be mapped onto physical memory chunkwise and on demand,
>>> like Panfrost's tiler heap. In this case, even though the
>>> drm_gem_shmem_object page array might already be allocated, only a very
>>> small fraction of the BO is currently backed by system memory, but
>>> drm_show_memory_stats will then proceed to add its entire virtual size to
>>> the file's total resident size regardless.
>>>
>>> This led to very unrealistic RSS sizes being reckoned for Panfrost, where
>>> said tiler heap buffer is initially allocated with a virtual size of 128
>>> MiB, but only a small part of it will eventually be backed by system memory
>>> after successive GPU page faults.
>>>
>>> Provide a new DRM object generic function that would allow drivers to
>>> return a more accurate RSS size for their BOs.
>>>
>>> Signed-off-by: Adrián Larumbe <adrian.larumbe@collabora.com>
>>> Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
>>> Reviewed-by: Steven Price <steven.price@arm.com>
>>> ---
>>>    drivers/gpu/drm/drm_file.c | 5 ++++-
>>>    include/drm/drm_gem.h      | 9 +++++++++
>>>    2 files changed, 13 insertions(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>> index 883d83bc0e3d..762965e3d503 100644
>>> --- a/drivers/gpu/drm/drm_file.c
>>> +++ b/drivers/gpu/drm/drm_file.c
>>> @@ -944,7 +944,10 @@ void drm_show_memory_stats(struct drm_printer *p, struct drm_file *file)
>>>    		}
>>>    		if (s & DRM_GEM_OBJECT_RESIDENT) {
>>> -			status.resident += obj->size;
>>> +			if (obj->funcs && obj->funcs->rss)
>>> +				status.resident += obj->funcs->rss(obj);
>>> +			else
>>> +				status.resident += obj->size;
>>
>> Presumably you'd want the same smaller size in both active and purgeable? Or
>> you can end up with more in those two than in rss which would look odd.
> 
> I didn't think of this. I guess when an object is both resident and purgeable,
> then its RSS and purgeable sizes should be the same.
> 
>> Also, alternative to adding a new callback could be adding multiple output
>> parameters to the existing obj->func->status() which maybe ends up simpler due
>> fewer callbacks?
>>
>> Like:
>>
>> s = obj->funcs->status(obj, &supported_status, &rss)
>>
>> And adjust the code flow to pick up the rss if driver signaled it supports
>> reporting it.
> 
> I personally find having a separate object callback more readable in this case.
> There's also the question of what output parameter value would be used as a token
> that the relevant BO doesn't have an RSS different from its virtual
> size. I guess '0' would be alright, but this is on the assumption that this
> could never be a legitimate BO virtual size across all DRM drivers. I guess
> most of them round the size up to the nearest page multiple at BO creation
> time.

Okay. See how it will look once you need to apply it to resident and 
purgeable. I wonder if "driver knows better" will end up a dominant case 
and we do end up considering reversing the scheme (like ask the driver 
to fill in the meminfo record). TBH I do not remember all the flavours 
both Rob and I proposed at this point.

Regards,

Tvrtko

> 
>>
>> Regards,
>>
>> Tvrtko
>>
>>>    		} else {
>>>    			/* If already purged or not yet backed by pages, don't
>>>    			 * count it as purgeable:
>>> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
>>> index bc9f6aa2f3fe..16364487fde9 100644
>>> --- a/include/drm/drm_gem.h
>>> +++ b/include/drm/drm_gem.h
>>> @@ -208,6 +208,15 @@ struct drm_gem_object_funcs {
>>>    	 */
>>>    	enum drm_gem_object_status (*status)(struct drm_gem_object *obj);
>>> +	/**
>>> +	 * @rss:
>>> +	 *
>>> +	 * Return resident size of the object in physical memory.
>>> +	 *
>>> +	 * Called by drm_show_memory_stats().
>>> +	 */
>>> +	size_t (*rss)(struct drm_gem_object *obj);
>>> +
>>>    	/**
>>>    	 * @vm_ops:
>>>    	 *
