Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 013856E7A72
	for <lists+dri-devel@lfdr.de>; Wed, 19 Apr 2023 15:16:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B248110E99C;
	Wed, 19 Apr 2023 13:16:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A140610E993;
 Wed, 19 Apr 2023 13:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681910213; x=1713446213;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=T9OmnESgxGs0kgus3QTCQwr6uKWNiPr1NzZZ13a0veQ=;
 b=YQiaP0yJpeY7IayE7JivZyTVpmQdIizZOhfLFcGBf4L/Myzbw2uDSMfR
 DdMaj5NLPiy/bjtuqnuNizXm5tNOzJNbiVc93Y0VzjMU7yr1ygtoPqJQn
 nEFFjQIjGVYFoFqH/7f7mkL442f1fPSRuvzW6qg3FQgR9fkbV+pHihNWN
 aleQiNBuW8Txhn2bmsgU/YIToZrzUEpO7X3HgVjZpH4l1O238jkyWJi4Y
 C8yM9LJ1bbn4b1obsLsACcZ/WQgr9sdjsAQv5anjgfaGXTHbUBWXE0e6R
 bTa7wYubQCIpOxObmxONU2iYlzvwZBzFPxkvFs+O+j6f5oC6AjiZfvgzu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="325058282"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="325058282"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:16:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10685"; a="780850170"
X-IronPort-AV: E=Sophos;i="5.99,208,1677571200"; d="scan'208";a="780850170"
Received: from halahusx-mobl.ger.corp.intel.com (HELO [10.213.223.36])
 ([10.213.223.36])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Apr 2023 06:16:50 -0700
Message-ID: <3c9d4aed-5c26-6a20-071c-8a3d24f3c9ce@linux.intel.com>
Date: Wed, 19 Apr 2023 14:16:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [RFC 4/6] drm: Add simple fdinfo memory helpers
Content-Language: en-US
To: Rob Clark <robdclark@gmail.com>
References: <20230417155613.4143258-1-tvrtko.ursulin@linux.intel.com>
 <20230417155613.4143258-5-tvrtko.ursulin@linux.intel.com>
 <CAF6AEGuobv8+fU-WU9D9vffNJC5zCqrHDtkppf__ieMJDHsWnw@mail.gmail.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <CAF6AEGuobv8+fU-WU9D9vffNJC5zCqrHDtkppf__ieMJDHsWnw@mail.gmail.com>
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


On 18/04/2023 18:18, Rob Clark wrote:
> On Mon, Apr 17, 2023 at 8:56 AM Tvrtko Ursulin
> <tvrtko.ursulin@linux.intel.com> wrote:
>>
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> For drivers who only wish to show one memory region called 'system,
>> and only account the GEM buffer object handles under it.
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> ---
>>   drivers/gpu/drm/drm_file.c | 45 ++++++++++++++++++++++++++++++++++++++
>>   include/drm/drm_file.h     |  6 +++++
>>   2 files changed, 51 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_file.c b/drivers/gpu/drm/drm_file.c
>> index e202f79e816d..1e70669dddf7 100644
>> --- a/drivers/gpu/drm/drm_file.c
>> +++ b/drivers/gpu/drm/drm_file.c
>> @@ -872,6 +872,51 @@ void drm_send_event(struct drm_device *dev, struct drm_pending_event *e)
>>   }
>>   EXPORT_SYMBOL(drm_send_event);
>>
>> +static void
>> +add_obj(struct drm_gem_object *obj, struct drm_fdinfo_memory_stat *stats)
>> +{
>> +       u64 sz = obj->size;
>> +
>> +       stats[0].size += sz;
>> +
>> +       if (obj->handle_count > 1)
>> +               stats[0].shared += sz;
>> +
>> +       if (!dma_resv_test_signaled(obj->resv, dma_resv_usage_rw(true)))
>> +               stats[0].active += sz;
>> +
>> +       /* Not supported. */
>> +       stats[0].resident = ~0ull;
>> +       stats[0].purgeable = ~0ull;
> 
> Hmm, this kinda makes the simple helper not very useful.  In my
> version, you get something that is useful for all UMA drivers (which
> all, IIRC, have some form of madv ioctl).  I was kinda imagining that
> for ttm drivers, my print_memory_stats() would just become a helper
> and that TTM (or "multi-region") drivers would have their own thing.

Hm how? Your version also needed a driver specific vfunc:

+static enum drm_gem_object_status msm_gem_status(struct drm_gem_object *obj)
+{
+	struct msm_gem_object *msm_obj = to_msm_bo(obj);
+	enum drm_gem_object_status status = 0;
+
+	if (msm_obj->pages)
+		status |= DRM_GEM_OBJECT_RESIDENT;
+
+	if (msm_obj->madv == MSM_MADV_DONTNEED)
+		status |= DRM_GEM_OBJECT_PURGEABLE;
+
+	return status;
+}

Regards,

Tvrtko

> 
> BR,
> -R
> 
>> +}
>> +
>> +char **
>> +drm_query_fdinfo_system_region(struct drm_device *dev, unsigned int *num)
>> +{
>> +       static char *region[] = {
>> +               "system",
>> +       };
>> +
>> +       *num = 1;
>> +
>> +       return region;
>> +}
>> +EXPORT_SYMBOL(drm_query_fdinfo_system_region);
>> +
>> +void
>> +drm_query_fdinfo_system_memory(struct drm_file *file,
>> +                              struct drm_fdinfo_memory_stat *stats)
>> +{
>> +       struct drm_gem_object *obj;
>> +       int id;
>> +
>> +       spin_lock(&file->table_lock);
>> +       idr_for_each_entry(&file->object_idr, obj, id)
>> +               add_obj(obj, stats);
>> +       spin_unlock(&file->table_lock);
>> +}
>> +EXPORT_SYMBOL(drm_query_fdinfo_system_memory);
>> +
>>   static void
>>   print_stat(struct drm_printer *p, const char *stat, const char *region, u64 sz)
>>   {
>> diff --git a/include/drm/drm_file.h b/include/drm/drm_file.h
>> index 00d48beeac5c..dd7c6fb2c975 100644
>> --- a/include/drm/drm_file.h
>> +++ b/include/drm/drm_file.h
>> @@ -383,6 +383,12 @@ struct drm_fdinfo_memory_stat {
>>          u64 active;
>>   };
>>
>> +char **drm_query_fdinfo_system_region(struct drm_device *dev,
>> +                                     unsigned int *num);
>> +void drm_query_fdinfo_system_memory(struct drm_file *file,
>> +                                   struct drm_fdinfo_memory_stat *stats);
>> +
>> +
>>   /**
>>    * drm_is_primary_client - is this an open file of the primary node
>>    * @file_priv: DRM file
>> --
>> 2.37.2
>>
