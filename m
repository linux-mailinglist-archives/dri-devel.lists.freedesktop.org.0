Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A4E6E9598
	for <lists+dri-devel@lfdr.de>; Thu, 20 Apr 2023 15:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5C310E2DA;
	Thu, 20 Apr 2023 13:14:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADE9710EC62;
 Thu, 20 Apr 2023 13:14:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681996494; x=1713532494;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5eYsgw1t5FJ2zGKYBNBywEbN7OwDYxEoQCcQImGZHcg=;
 b=L5kHjQoAuH9ed94ryQfDodFzGJAH2d8RkWeJguxhEYuHYVN5xZLozb0C
 Xx8Odlv/k4LNOGmUo/iShNuKOQJDaUwy7MuXvpygFZ0bv05XPWhOivlUh
 4JWwWU6zd+S7A7rCTZpuThy4M+ogpRQPLp06VXxvsjXtd6Djab19z48cU
 FXqLU3XIIgu9SSCPzweHcBFCoChYzapOet8gNL+RO57qP9s6QDl63kD17
 rYDgCd6nYbifnWdMmq4ybLOD5JSZHUKrdODx1wnmUBBXrK9/kAEhw9YLp
 32CaSt856WEuqyF2NLsNtiDdu9lg3+5j2IkYB/0BE3v8KNFZ7h8lpAWzR Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="325336126"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="325336126"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 06:14:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="1021576962"
X-IronPort-AV: E=Sophos;i="5.99,212,1677571200"; d="scan'208";a="1021576962"
Received: from gbyrne6x-mobl1.ger.corp.intel.com (HELO [10.213.221.188])
 ([10.213.221.188])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2023 06:14:51 -0700
Message-ID: <f068707f-8f45-0354-b190-5a81700ef537@linux.intel.com>
Date: Thu, 20 Apr 2023 14:14:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 4/6] drm: Add simple fdinfo memory helpers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuobv8+fU-WU9D9vffNJC5zCqrHDtkppf__ieMJDHsWnw@mail.gmail.com>
 <3c9d4aed-5c26-6a20-071c-8a3d24f3c9ce@linux.intel.com>
 <CAF6AEGvdz9Y96jBqPhbfgNXEsc_NS-nsc_nDqoX-qmJ9VPmLBA@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGvdz9Y96jBqPhbfgNXEsc_NS-nsc_nDqoX-qmJ9VPmLBA@mail.gmail.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Intel-gfx@lists.freedesktop.org,
 Emil Velikov <emil.l.velikov@gmail.com>, dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 19/04/2023 15:32, Rob Clark wrote:
> On Wed, Apr 19, 2023 at 6:16 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>>
>> On 18/04/2023 18:18, Rob Clark wrote:
>>> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
>>> <tvrtko.ursulin@linux.intel.com> wrote:
>>>>
>>>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>>
>>>> For drivers who only wish to show one memory region called 'system,
>>>> and only account the GEM buffer object handles under it.
>>>>
>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>>> ---
>>>>    drivers/gpu/drm/drm_file.c | 45 ++++++++++++++++++++++++++++++++++++++
>>>>    include/drm/drm_file.h     |  6 +++++
>>>>    2 files changed, 51 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>>>> index e202f79e816d..1e70669dddf7 100644
>>>> --- a/drivers/gpu/drm/drm_file.c
>>>> +++ b/drivers/gpu/drm/drm_file.c
>>>> @@ -872,6 +872,51 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>>>    }
>>>>    EXPORT_SYMBOL(drm_send_event);
>>>>
>>>> +static void
>>>> +add_obj(struct drm_gem_object *obj, struct drm_fdinfo_memory_stat *stats)
>>>> +{
>>>> +       u64 sz = obj->size;
>>>> +
>>>> +       stats[0].size += sz;
>>>> +
>>>> +       if (obj->handle_count > 1)
>>>> +               stats[0].shared += sz;
>>>> +
>>>> +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
>>>> +               stats[0].active += sz;
>>>> +
>>>> +       /* Not supported. */
>>>> +       stats[0].resident = ~0ull;
>>>> +       stats[0].purgeable = ~0ull;
>>>
>>> Hmm, this kinda makes the simple helper not very useful.  In my
>>> version, you get something that is useful for all UMA drivers (which
>>> all, IIRC, have some form of madv ioctl).  I was kinda imagining that
>>> for ttm drivers, my print_memory_stats() would just become a helper
>>> and that TTM (or "multi-region") drivers would have their own thing.
>>
>> Hm how? Your version also needed a driver specific vfunc:
> 
> Sure, but there is a possibility for a driver specific vfunc ;-)

Indeed, they are there in both proposals! :)

> And arguably we could move madv to drm_gem_object, along with get/put
> pages tracking.. since all the UMA drivers pretty much do the same
> thing.  So maybe the vfunc is a temporary thing.
> 
> Anyways, I could go back to my original version where it was a helper
> called from the driver to print mem stats.  That way, TTM drivers
> could do their own thing.

I must have missed that. So it was the same idea as in my RFC?

Regards,

Tvrtko
  
> BR,
> -R
> 
>> +static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *obj)
>> +{
>> +       struct msm_gem_object *msm_obj = to_msm_bo(obj);
>> +       enum drm_gem_object_status status = 0;
>> +
>> +       if (msm_obj->pages)
>> +               status |= DRM_GEM_OBJECT_RESIDENT;
>> +
>> +       if (msm_obj->madv == MSM_MADV_DONTNEED)
>> +               status |= DRM_GEM_OBJECT_PURGEABLE;
>> +
>> +       return status;
>> +}
>>
>> Regards,
>>
>> Tvrtko
>>
>>>
>>> BR,
>>> -R
>>>
>>>> +}
>>>> +
>>>> +char **
>>>> +drm_query_fdinfo_system_region(struct drm_device *dev, unsigned int *num)
>>>> +{
>>>> +       static char *region[] = {
>>>> +               "system",
>>>> +       };
>>>> +
>>>> +       *num = 1;
>>>> +
>>>> +       return region;
>>>> +}
>>>> +EXPORT_SYMBOL(drm_query_fdinfo_system_region);
>>>> +
>>>> +void
>>>> +drm_query_fdinfo_system_memory(struct drm_file *file,
>>>> +                              struct drm_fdinfo_memory_stat *stats)
>>>> +{
>>>> +       struct drm_gem_object *obj;
>>>> +       int id;
>>>> +
>>>> +       spin_lock(&file->table_lock);
>>>> +       idr_for_each_entry(&file->object_idr, obj, id)
>>>> +               add_obj(obj, stats);
>>>> +       spin_unlock(&file->table_lock);
>>>> +}
>>>> +EXPORT_SYMBOL(drm_query_fdinfo_system_memory);
>>>> +
>>>>    static void
>>>>    print_stat(struct drm_printer *p, const char *stat, const char *region, u64 sz)
>>>>    {
>>>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>>>> index 00d48beeac5c..dd7c6fb2c975 100644
>>>> --- a/include/drm/drm_file.h
>>>> +++ b/include/drm/drm_file.h
>>>> @@ -383,6 +383,12 @@ struct drm_fdinfo_memory_stat {
>>>>           u64 active;
>>>>    };
>>>>
>>>> +char **drm_query_fdinfo_system_region(struct drm_device *dev,
>>>> +                                     unsigned int *num);
>>>> +void drm_query_fdinfo_system_memory(struct drm_file *file,
>>>> +                                   struct drm_fdinfo_memory_stat *stats);
>>>> +
>>>> +
>>>>    /**
>>>>     * drm_is_primary_client - is this an open file of the primary node
>>>>     * @file_priv: DRM file
>>>> --
>>>> 2.37.2
>>>>
