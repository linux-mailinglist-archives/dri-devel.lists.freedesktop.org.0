Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEA730EA1C
	for <lists+dri-devel@lfdr.de>; Thu,  4 Feb 2021 03:23:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EBA76EC6A;
	Thu,  4 Feb 2021 02:23:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744046EC67;
 Thu,  4 Feb 2021 02:23:25 +0000 (UTC)
IronPort-SDR: cvG+C6Dc4ljkPGeNQhPTuHi7bas0C3o5bP/mBtFT33/nuXLrLBOW318u+FI4R23HPY3CcNF2Q1
 UCsZidmt6Zjw==
X-IronPort-AV: E=McAfee;i="6000,8403,9884"; a="168838379"
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="168838379"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:23:19 -0800
IronPort-SDR: I5L7JiA1/4mnuXvq+OYr/SLAeoTIT6G+9UEo3mB9Byt001+vatOWy0vV2BCYWSPm0qzBYABx4c
 zQLk4lwJJDpA==
X-IronPort-AV: E=Sophos;i="5.79,399,1602572400"; d="scan'208";a="372724889"
Received: from brianwel-mobl1.amr.corp.intel.com (HELO [10.213.190.63])
 ([10.213.190.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 18:23:18 -0800
Subject: Re: [RFC PATCH 7/9] drmcg: Add initial support for tracking gpu time
 usage
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Eero Tamminen <eero.t.tamminen@intel.com>,
 Kenny Ho <Kenny.Ho@amd.com>, Tejun Heo <tj@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 amd-gfx@lists.freedesktop.org, cgroups@vger.kernel.org,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210126214626.16260-1-brian.welty@intel.com>
 <20210126214626.16260-8-brian.welty@intel.com>
 <161235875541.15744.14541970842808007912@jlahtine-mobl.ger.corp.intel.com>
From: Brian Welty <brian.welty@intel.com>
Message-ID: <90e4b657-d5d6-e985-4cda-628c74dbac30@intel.com>
Date: Wed, 3 Feb 2021 18:23:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <161235875541.15744.14541970842808007912@jlahtine-mobl.ger.corp.intel.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2/3/2021 5:25 AM, Joonas Lahtinen wrote:
> Quoting Brian Welty (2021-01-26 23:46:24)
>> Single control below is added to DRM cgroup controller in order to track
>> user execution time for GPU devices.  It is up to device drivers to
>> charge execution time to the cgroup via drm_cgroup_try_charge().
>>
>>   sched.runtime
>>       Read-only value, displays current user execution time for each DRM
>>       device. The expectation is that this is incremented by DRM device
>>       driver's scheduler upon user context completion or context switch.
>>       Units of time are in microseconds for consistency with cpu.stats.
> 
> Were not we also planning for a percentage style budgeting?

Yes, that's right.  Above is to report accumlated time usage.
I can include controls for time sharing in next submission.
But not using percentage.
Relative time share can be implemented with weights as described in cgroups
documentation for resource distribution models.
This was also the prior feedback from Tejun [1], and so will look very much
like the existing cpu.weight or io.weight.

> 
> Capping the maximum runtime is definitely useful, but in order to
> configure a system for peaceful co-existence of two or more workloads we
> must also impose a limit on how big portion of the instantaneous
> capacity can be used.

Agreed.  This is also included with CPU and IO controls (cpu.max and io.max),
so we should also plan to have the same.

-Brian

[1]  https://lists.freedesktop.org/archives/dri-devel/2020-April/262141.html

> 
> Regards, Joonas
> 
>> Signed-off-by: Brian Welty <brian.welty@intel.com>
>> ---
>>  Documentation/admin-guide/cgroup-v2.rst |  9 +++++++++
>>  include/drm/drm_cgroup.h                |  2 ++
>>  include/linux/cgroup_drm.h              |  2 ++
>>  kernel/cgroup/drm.c                     | 20 ++++++++++++++++++++
>>  4 files changed, 33 insertions(+)
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
>> index ccc25f03a898..f1d0f333a49e 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2205,6 +2205,15 @@ thresholds are hit, this would then allow the DRM device driver to invoke
>>  some equivalent to OOM-killer or forced memory eviction for the device
>>  backed memory in order to attempt to free additional space.
>>  
>> +The below set of control files are for time accounting of DRM devices. Units
>> +of time are in microseconds.
>> +
>> +  sched.runtime
>> +        Read-only value, displays current user execution time for each DRM
>> +        device. The expectation is that this is incremented by DRM device
>> +        driver's scheduler upon user context completion or context switch.
>> +
>> +
>>  Misc
>>  ----
>>  
>> diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
>> index 9ba0e372eeee..315dab8a93b8 100644
>> --- a/include/drm/drm_cgroup.h
>> +++ b/include/drm/drm_cgroup.h
>> @@ -22,6 +22,7 @@ enum drmcg_res_type {
>>         DRMCG_TYPE_MEM_CURRENT,
>>         DRMCG_TYPE_MEM_MAX,
>>         DRMCG_TYPE_MEM_TOTAL,
>> +       DRMCG_TYPE_SCHED_RUNTIME,
>>         __DRMCG_TYPE_LAST,
>>  };
>>  
>> @@ -79,5 +80,6 @@ void drm_cgroup_uncharge(struct drmcg *drmcg,struct drm_device *dev,
>>                          enum drmcg_res_type type, u64 usage)
>>  {
>>  }
>> +
>>  #endif /* CONFIG_CGROUP_DRM */
>>  #endif /* __DRM_CGROUP_H__ */
>> diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
>> index 3570636473cf..0fafa663321e 100644
>> --- a/include/linux/cgroup_drm.h
>> +++ b/include/linux/cgroup_drm.h
>> @@ -19,6 +19,8 @@
>>   */
>>  struct drmcg_device_resource {
>>         struct page_counter memory;
>> +       seqlock_t sched_lock;
>> +       u64 exec_runtime;
>>  };
>>  
>>  /**
>> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
>> index 08e75eb67593..64e9d0dbe8c8 100644
>> --- a/kernel/cgroup/drm.c
>> +++ b/kernel/cgroup/drm.c
>> @@ -81,6 +81,7 @@ static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
>>         /* set defaults here */
>>         page_counter_init(&ddr->memory,
>>                           parent_ddr ? &parent_ddr->memory : NULL);
>> +       seqlock_init(&ddr->sched_lock);
>>         drmcg->dev_resources[minor] = ddr;
>>  
>>         return 0;
>> @@ -287,6 +288,10 @@ static int drmcg_seq_show_fn(int id, void *ptr, void *data)
>>                 seq_printf(sf, "%d:%d %llu\n", DRM_MAJOR, minor->index,
>>                            minor->dev->drmcg_props.memory_total);
>>                 break;
>> +       case DRMCG_TYPE_SCHED_RUNTIME:
>> +               seq_printf(sf, "%d:%d %llu\n", DRM_MAJOR, minor->index,
>> +                          ktime_to_us(ddr->exec_runtime));
>> +               break;
>>         default:
>>                 seq_printf(sf, "%d:%d\n", DRM_MAJOR, minor->index);
>>                 break;
>> @@ -384,6 +389,12 @@ struct cftype files[] = {
>>                 .private = DRMCG_TYPE_MEM_TOTAL,
>>                 .flags = CFTYPE_ONLY_ON_ROOT,
>>         },
>> +       {
>> +               .name = "sched.runtime",
>> +               .seq_show = drmcg_seq_show,
>> +               .private = DRMCG_TYPE_SCHED_RUNTIME,
>> +               .flags = CFTYPE_NOT_ON_ROOT,
>> +       },
>>         { }     /* terminate */
>>  };
>>  
>> @@ -440,6 +451,10 @@ EXPORT_SYMBOL(drmcg_device_early_init);
>>   * choose to enact some form of memory reclaim, but the exact behavior is left
>>   * to the DRM device driver to define.
>>   *
>> + * For @res type of DRMCG_TYPE_SCHED_RUNTIME:
>> + * For GPU time accounting, add @usage amount of GPU time to @drmcg for
>> + * the given device.
>> + *
>>   * Returns 0 on success.  Otherwise, an error code is returned.
>>   */
>>  int drm_cgroup_try_charge(struct drmcg *drmcg, struct drm_device *dev,
>> @@ -466,6 +481,11 @@ int drm_cgroup_try_charge(struct drmcg *drmcg, struct drm_device *dev,
>>                         err = 0;
>>                 }
>>                 break;
>> +       case DRMCG_TYPE_SCHED_RUNTIME:
>> +               write_seqlock(&res->sched_lock);
>> +               res->exec_runtime = ktime_add(res->exec_runtime, usage);
>> +               write_sequnlock(&res->sched_lock);
>> +               break;
>>         default:
>>                 err = -EINVAL;
>>                 break;
>> -- 
>> 2.20.1
>>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
