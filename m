Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B1E49C4958
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 23:53:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3005F10E20C;
	Mon, 11 Nov 2024 22:53:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EEttbxzh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7704610E0BC;
 Mon, 11 Nov 2024 22:53:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731365623; x=1762901623;
 h=message-id:date:mime-version:from:subject:to:cc:
 references:in-reply-to:content-transfer-encoding;
 bh=aDsp7lDxtxIOYCCqEcHjGcZbGK3gRNnxFhfeut2hqwk=;
 b=EEttbxzh65EhpyWs6vNwcvbyclWRyRMbZ+onrUEfvniL1mZSQaZNS5Wa
 bB8D+IczlQ1yPgodRJ4xVMCSLhz+pizEOyEkTXrOdkV2od9qJWnI/ZSVE
 fE4ve6ofCU7qQiDzBpAMDlJJPhv654DQeFjLJJ/hm5i4PPFkP9VKAf+B4
 1m/pMcIGou7HotO8Dfbmr9ZIgebgKZBE58I45ukawODqg6aiLSPY+gJzV
 8Q8ueqxcR4BkcNlgS1+s+v9xQjZagL/XU36lE1GRkhcKoPJS/8U+Fbmff
 RbCXT28XPJIfzYLX00AfxjJsKmtr4Owcj89imk+PDYOKv2Dheq94rvAvZ A==;
X-CSE-ConnectionGUID: htCxchD8QAiDp4tn8giCFA==
X-CSE-MsgGUID: pkXFN6gsQzmJbpCWIt4Vcg==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="31360228"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="31360228"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 14:53:42 -0800
X-CSE-ConnectionGUID: KE6VwBfrQv2bxOUKWXn9dg==
X-CSE-MsgGUID: MwtYqvv5QYSJDp0hobNOpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,146,1728975600"; d="scan'208";a="91909304"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO [10.245.244.165])
 ([10.245.244.165])
 by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 14:53:39 -0800
Message-ID: <a3484c87-fefb-46f3-908e-d31474145a85@linux.intel.com>
Date: Mon, 11 Nov 2024 23:53:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
To: Friedrich Vock <friedrich.vock@gmx.de>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: cgroups@vger.kernel.org, linux-mm@kvack.org,
 Maxime Ripard <mripard@kernel.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
 <91125995-3a33-4971-a581-e6e24ccf0b47@gmx.de>
Content-Language: en-US
In-Reply-To: <91125995-3a33-4971-a581-e6e24ccf0b47@gmx.de>
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



Den 2024-10-28 kl. 15:53, skrev Friedrich Vock:
> On 23.10.24 09:52, Maarten Lankhorst wrote:
>> The initial version was based roughly on the rdma and misc cgroup
>> controllers, with a lot of the accounting code borrowed from rdma.
>>
>> The current version is a complete rewrite with page counter; it uses
>> the same min/low/max semantics as the memory cgroup as a result.
>>
>> There's a small mismatch as TTM uses u64, and page_counter long pages.
>> In practice it's not a problem. 32-bits systems don't really come with
>>> =4GB cards and as long as we're consistently wrong with units, it's
>> fine. The device page size may not be in the same units as kernel page
>> size, and each region might also have a different page size (VRAM vs GART
>> for example).
>>
>> The interface is simple:
>> - populate dev_cgroup_try_charge->regions[..] name and size for each 
>> active
>>    region, set num_regions accordingly.
>> - Call (dev,drmm)_cgroup_register_device()
>> - Use dev_cgroup_try_charge to check if you can allocate a chunk of 
>> memory,
>>    use dev_cgroup__uncharge when freeing it. This may return an error 
>> code,
>>    or -EAGAIN when the cgroup limit is reached. In that case a reference
>>    to the limiting pool is returned.
>> - The limiting cs can be used as compare function for
>>    dev_cgroup_state_evict_valuable.
>> - After having evicted enough, drop reference to limiting cs with
>>    dev_cgroup_pool_state_put.
>>
>> This API allows you to limit device resources with cgroups.
>> You can see the supported cards in /sys/fs/cgroup/dev.region.capacity
>> You need to echo +dev to cgroup.subtree_control, and then you can
>> partition memory.
>>
>> Co-developed-by: Friedrich Vock <friedrich.vock@gmx.de>
>> Signed-off-by: Friedrich Vock <friedrich.vock@gmx.de>
>> Co-developed-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>   Documentation/admin-guide/cgroup-v2.rst |  51 ++
>>   Documentation/core-api/cgroup.rst       |   9 +
>>   Documentation/core-api/index.rst        |   1 +
>>   Documentation/gpu/drm-compute.rst       |  54 ++
>>   include/linux/cgroup_dev.h              |  91 +++
>>   include/linux/cgroup_subsys.h           |   4 +
>>   include/linux/page_counter.h            |   2 +-
>>   init/Kconfig                            |   7 +
>>   kernel/cgroup/Makefile                  |   1 +
>>   kernel/cgroup/dev.c                     | 893 ++++++++++++++++++++++++
>>   mm/page_counter.c                       |   4 +-
>>   11 files changed, 1114 insertions(+), 3 deletions(-)
>>   create mode 100644 Documentation/core-api/cgroup.rst
>>   create mode 100644 Documentation/gpu/drm-compute.rst
>>   create mode 100644 include/linux/cgroup_dev.h
>>   create mode 100644 kernel/cgroup/dev.c
>>
>> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/ 
>> admin-guide/cgroup-v2.rst
>> index 69af2173555fb..e8fe79244af9c 100644
>> --- a/Documentation/admin-guide/cgroup-v2.rst
>> +++ b/Documentation/admin-guide/cgroup-v2.rst
>> @@ -2612,6 +2612,57 @@ RDMA Interface Files
>>         mlx4_0 hca_handle=1 hca_object=20
>>         ocrdma1 hca_handle=1 hca_object=23
>>
>> +DEV
>> +----
>> +
>> +The "dev" controller regulates the distribution and accounting of
>> +device resources, currently only memory regions. Because each memory
>> +region may have its own page size, which does not have to be equal
>> +to the system page size. the units are in bytes.
>> +
>> +DEV Interface Files
>> +~~~~~~~~~~~~~~~~~~~~
>> +
>> +  dev.region.max, dev.region.min, dev.region.low
>> +    A readwrite nested-keyed file that exists for all the cgroups
>> +    except root that describes current configured resource limit
>> +    for a device.
>> +
>> +    Lines are keyed by device name and are not ordered.
>> +    Each line contains space separated resource name and its configured
>> +    limit that can be distributed.
>> +
>> +    The following nested keys are defined.
>> +
>> +      ==========    
>> =======================================================
>> +      *         Maximum amount of bytes that allocatable in this region
>> +      ==========    
>> =======================================================
>> +
>> +    An example for xe follows::
>> +
>> +      drm/0000:03:00.0 vram0=1073741824 stolen=max
>> +
>> +    The semantics are the same as for the memory cgroup controller, 
>> and are
>> +    calculated in the same way.
>> +
>> +  dev.region.capacity
>> +    A read-only file that describes maximum region capacity.
>> +    It only exists on the root cgroup. Not all memory can be
>> +    allocated by cgroups, as the kernel reserves some for
>> +    internal use.
>> +
>> +    An example for xe follows::
>> +
>> +      drm/0000:03:00.0 vram0=8514437120 stolen=67108864
>> +
>> +  dev.region.current
>> +    A read-only file that describes current resource usage.
>> +    It exists for all the cgroup except root.
>> +
>> +    An example for xe follows::
>> +
>> +      drm/0000:03:00.0 vram0=12550144 stolen=8650752
>> +
>>   HugeTLB
>>   -------
>>
>> diff --git a/Documentation/core-api/cgroup.rst b/Documentation/core- 
>> api/cgroup.rst
>> new file mode 100644
>> index 0000000000000..475b32255bd68
>> --- /dev/null
>> +++ b/Documentation/core-api/cgroup.rst
>> @@ -0,0 +1,9 @@
>> +==================
>> +Cgroup Kernel APIs
>> +==================
>> +
>> +Device Cgroup API (devcg)
>> +=========================
>> +.. kernel-doc:: kernel/cgroup/dev.c
>> +   :export:
>> +
>> diff --git a/Documentation/core-api/index.rst b/Documentation/core- 
>> api/index.rst
>> index 6a875743dd4b7..dbd6c4f9a6313 100644
>> --- a/Documentation/core-api/index.rst
>> +++ b/Documentation/core-api/index.rst
>> @@ -108,6 +108,7 @@ more memory-management documentation in 
>> Documentation/mm/index.rst.
>>      dma-isa-lpc
>>      swiotlb
>>      mm-api
>> +   cgroup
>>      genalloc
>>      pin_user_pages
>>      boot-time-mm
>> diff --git a/Documentation/gpu/drm-compute.rst b/Documentation/gpu/ 
>> drm-compute.rst
>> new file mode 100644
>> index 0000000000000..116270976ef7a
>> --- /dev/null
>> +++ b/Documentation/gpu/drm-compute.rst
>> @@ -0,0 +1,54 @@
>> +==================================
>> +Long running workloads and compute
>> +==================================
>> +
>> +Long running workloads (compute) are workloads that will not complete 
>> in 10
>> +seconds. (The time let the user wait before he reaches for the power 
>> button).
>> +This means that other techniques need to be used to manage those 
>> workloads,
>> +that cannot use fences.
>> +
>> +Some hardware may schedule compute jobs, and have no way to pre-empt 
>> them, or
>> +have their memory swapped out from them. Or they simply want their 
>> workload
>> +not to be preempted or swapped out at all.
>> +
>> +This means that it differs from what is described in driver-api/dma- 
>> buf.rst.
>> +
>> +As with normal compute jobs, dma-fence may not be used at all. In 
>> this case,
>> +not even to force preemption. The driver with is simply forced to 
>> unmap a BO
>> +from the long compute job's address space on unbind immediately, not 
>> even
>> +waiting for the workload to complete. Effectively this terminates the 
>> workload
>> +when there is no hardware support to recover.
>> +
>> +Since this is undesirable, there need to be mitigations to prevent a 
>> workload
>> +from being terminated. There are several possible approach, all with 
>> their
>> +advantages and drawbacks.
>> +
>> +The first approach you will likely try is to pin all buffers used by 
>> compute.
>> +This guarantees that the job will run uninterrupted, but also allows 
>> a very
>> +denial of service attack by pinning as much memory as possible, 
>> hogging the
>> +all GPU memory, and possibly a huge chunk of CPU memory.
>> +
>> +A second approach that will work slightly better on its own is adding 
>> an option
>> +not to evict when creating a new job (any kind). If all of userspace 
>> opts in
>> +to this flag, it would prevent cooperating userspace from forced 
>> terminating
>> +older compute jobs to start a new one.
>> +
>> +If job preemption and recoverable pagefaults are not available, those 
>> are the
>> +only approaches possible. So even with those, you want a separate way of
>> +controlling resources. The standard kernel way of doing so is cgroups.
>> +
>> +This creates a third option, using cgroups to prevent eviction. Both 
>> GPU and
>> +driver-allocated CPU memory would be accounted to the correct cgroup, 
>> and
>> +eviction would be made cgroup aware. This allows the GPU to be 
>> partitioned
>> +into cgroups, that will allow jobs to run next to each other without
>> +interference.
>> +
>> +The interface to the cgroup would be similar to the current CPU memory
>> +interface, with similar semantics for min/low/high/max, if eviction can
>> +be made cgroup aware. For now only max is implemented.
>> +
>> +What should be noted is that each memory region (tiled memory for 
>> example)
>> +should have its own accounting, using $card key0 = value0 key1 = value1.
>> +
>> +The key is set to the regionid set by the driver, for example "tile0".
>> +For the value of $card, we use drmGetUnique().
>> diff --git a/include/linux/cgroup_dev.h b/include/linux/cgroup_dev.h
>> new file mode 100644
>> index 0000000000000..c6311d1d3ce48
>> --- /dev/null
>> +++ b/include/linux/cgroup_dev.h
>> @@ -0,0 +1,91 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2023 Intel Corporation
>> + */
>> +
>> +#ifndef _CGROUP_DEV_H
>> +#define _CGROUP_DEV_H
>> +
>> +#include <linux/types.h>
>> +#include <linux/llist.h>
>> +
>> +struct dev_cgroup_pool_state;
>> +
>> +/*
>> + * Use 8 as max, because of N^2 lookup when setting things, can be 
>> bumped if needed
>> + * Identical to TTM_NUM_MEM_TYPES to allow simplifying that code.
>> + */
>> +#define DEVICE_CGROUP_MAX_REGIONS 8
>> +
>> +/* Public definition of cgroup device, should not be modified after 
>> _register() */
>> +struct dev_cgroup_device {
>> +    struct {
>> +        u64 size;
>> +        const char *name;
>> +    } regions[DEVICE_CGROUP_MAX_REGIONS];
>> +
>> +    int num_regions;
>> +
>> +    /* used by cgroups, do not use */
>> +    void *priv;
>> +};
>> +
>> +#if IS_ENABLED(CONFIG_CGROUP_DEV)
>> +int dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
>> +                   const char *name);
>> +void dev_cgroup_unregister_device(struct dev_cgroup_device *cgdev);
>> +int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
>> +              u32 index, u64 size,
>> +              struct dev_cgroup_pool_state **ret_pool,
>> +              struct dev_cgroup_pool_state **ret_limit_pool);
>> +void dev_cgroup_uncharge(struct dev_cgroup_pool_state *pool,
>> +             u32 index, u64 size);
>> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, 
>> int index,
>> +                     struct dev_cgroup_pool_state *limit_pool,
>> +                     struct dev_cgroup_pool_state *test_pool,
>> +                     bool ignore_low, bool *ret_hit_low);
>> +
>> +void dev_cgroup_pool_state_put(struct dev_cgroup_pool_state *pool);
>> +#else
>> +static inline int
>> +dev_cgroup_register_device(struct dev_cgroup_device *cgdev,
>> +               const char *name)
>> +{
>> +    return 0;
>> +}
>> +
>> +static inline void dev_cgroup_unregister_device(struct 
>> dev_cgroup_device *cgdev)
>> +{
>> +}
>> +
>> +static int int dev_cgroup_try_charge(struct dev_cgroup_device *cgdev,
>> +                     u32 index, u64 size,
>> +                     struct dev_cgroup_pool_state **ret_pool,
>> +                     struct dev_cgroup_pool_state **ret_limit_pool);
>> +{
>> +    *ret_pool = NULL;
>> +
>> +    if (ret_limit_pool)
>> +        *ret_limit_pool = NULL;
>> +
>> +    return 0;
>> +}
>> +
>> +static inline void dev_cgroup_uncharge(struct dev_cgroup_pool_state 
>> *pool,
>> +                       u32 index, u64 size)
>> +{ }
>> +
>> +static inline
>> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, 
>> int index,
>> +                     struct dev_cgroup_pool_state *limit_pool,
>> +                     struct dev_cgroup_pool_state *test_pool,
>> +                     bool ignore_low, bool *ret_hit_low)
>> +{
>> +    return true;
>> +}
>> +
>> +static inline void dev_cgroup_pool_state_put(struct 
>> dev_cgroup_pool_state *pool)
>> +{ }
>> +
>> +#endif
>> +#endif    /* _CGROUP_DEV_H */
>> diff --git a/include/linux/cgroup_subsys.h b/include/linux/ 
>> cgroup_subsys.h
>> index 4452354872307..898340cfe5843 100644
>> --- a/include/linux/cgroup_subsys.h
>> +++ b/include/linux/cgroup_subsys.h
>> @@ -65,6 +65,10 @@ SUBSYS(rdma)
>>   SUBSYS(misc)
>>   #endif
>>
>> +#if IS_ENABLED(CONFIG_CGROUP_DEV)
>> +SUBSYS(dev)
>> +#endif
>> +
>>   /*
>>    * The following subsystems are not supported on the default hierarchy.
>>    */
>> diff --git a/include/linux/page_counter.h b/include/linux/page_counter.h
>> index 79dbd8bc35a72..d75376a1694ee 100644
>> --- a/include/linux/page_counter.h
>> +++ b/include/linux/page_counter.h
>> @@ -96,7 +96,7 @@ static inline void 
>> page_counter_reset_watermark(struct page_counter *counter)
>>       counter->watermark = usage;
>>   }
>>
>> -#ifdef CONFIG_MEMCG
>> +#if IS_ENABLED(CONFIG_MEMCG) || IS_ENABLED(CONFIG_CGROUP_DEVICE)
>>   void page_counter_calculate_protection(struct page_counter *root,
>>                          struct page_counter *counter,
>>                          bool recursive_protection);
>> diff --git a/init/Kconfig b/init/Kconfig
>> index 530a382ee0feb..2da595facd97f 100644
>> --- a/init/Kconfig
>> +++ b/init/Kconfig
>> @@ -1123,6 +1123,13 @@ config CGROUP_RDMA
>>         Attaching processes with active RDMA resources to the cgroup
>>         hierarchy is allowed even if can cross the hierarchy's limit.
>>
>> +config CGROUP_DEV
>> +    bool "Device controller"
>> +    help
>> +      Provides the device subsystem controller.
>> +
>> +      ...
>> +
>>   config CGROUP_FREEZER
>>       bool "Freezer controller"
>>       help
>> diff --git a/kernel/cgroup/Makefile b/kernel/cgroup/Makefile
>> index a5c9359d516f8..441d346fdc51f 100644
>> --- a/kernel/cgroup/Makefile
>> +++ b/kernel/cgroup/Makefile
>> @@ -7,4 +7,5 @@ obj-$(CONFIG_CGROUP_RDMA) += rdma.o
>>   obj-$(CONFIG_CPUSETS) += cpuset.o
>>   obj-$(CONFIG_CPUSETS_V1) += cpuset-v1.o
>>   obj-$(CONFIG_CGROUP_MISC) += misc.o
>> +obj-$(CONFIG_CGROUP_DEV) += dev.o
>>   obj-$(CONFIG_CGROUP_DEBUG) += debug.o
>> diff --git a/kernel/cgroup/dev.c b/kernel/cgroup/dev.c
>> new file mode 100644
>> index 0000000000000..e422ccbfbc444
>> --- /dev/null
>> +++ b/kernel/cgroup/dev.c
>> @@ -0,0 +1,893 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright 2023-2024 Intel Corporation (Maarten Lankhorst 
>> <dev@lankhorst.se>)
>> + * Copyright 2024 Red Hat (Maxime Ripard <mripard@kernel.org>)
>> + * Partially based on the rdma and misc controllers, which bear the 
>> following copyrights:
>> + *
>> + * Copyright 2020 Google LLC
>> + * Copyright (C) 2016 Parav Pandit <pandit.parav@gmail.com>
>> + */
>> +
>> +#include <linux/cgroup.h>
>> +#include <linux/cgroup_dev.h>
>> +#include <linux/list.h>
>> +#include <linux/mutex.h>
>> +#include <linux/page_counter.h>
>> +#include <linux/parser.h>
>> +#include <linux/slab.h>
>> +
>> +struct devcg_device {
>> +    /**
>> +     * @ref: References keeping the device alive.
>> +     * Keeps the device reference alive after a succesful RCU lookup.
>> +     */
>> +    struct kref ref;
>> +
>> +    /** @rcu: RCU head for freeing */
>> +    struct rcu_head rcu;
>> +
>> +    /**
>> +     * @dev_node: Linked into &devcg_devices list.
>> +     * Protected by RCU and global spinlock.
>> +     */
>> +    struct list_head dev_node;
>> +
>> +    /**
>> +     * @pools: List of pools linked to this device.
>> +     * Protected by global spinlock only
>> +     */
>> +    struct list_head pools;
>> +
>> +    /**
>> +     * @base: Copy of the struct passed on register.
>> +     * A copy is made to prevent lifetime issues. devcg_device may
>> +     * be kept alive when changing cgroups values concurrently through
>> +     * rcu lookups.
>> +     */
>> +    struct dev_cgroup_device base;
>> +
>> +    /** @name: Name describing the node, set by 
>> dev_cgroup_register_device */
>> +    const char *name;
>> +
>> +    /**
>> +     * @unregistered: Whether the device is unregistered by its caller.
>> +     * No new pools should be added to the device afterwards.
>> +     */
>> +    bool unregistered;
>> +};
>> +
>> +struct devcg_state {
>> +    struct cgroup_subsys_state css;
>> +
>> +    struct list_head pools;
>> +};
>> +
>> +struct dev_cgroup_pool_state {
>> +    struct devcg_device *device;
>> +    struct devcg_state *cs;
>> +
>> +    /* css node, RCU protected against device teardown */
>> +    struct list_head    css_node;
>> +
>> +    /* dev node, no RCU protection required */
>> +    struct list_head    dev_node;
>> +
>> +    int num_res, inited;
>> +    struct rcu_head rcu;
>> +
>> +    struct devcg_pool_res {
>> +        struct page_counter cnt;
>> +    } resources[];
>> +};
>> +
>> +/*
>> + * 3 operations require locking protection:
>> + * - Registering and unregistering device to/from list, requires 
>> global lock.
>> + * - Adding a dev_cgroup_pool_state to a CSS, removing when CSS is 
>> freed.
>> + * - Adding a dev_cgroup_pool_state to a device list.
>> + *
>> + * Since for the most common operations RCU provides enough 
>> protection, I
>> + * do not think more granular locking makes sense. Most protection is 
>> offered
>> + * by RCU and the lockless operating page_counter.
>> + */
>> +static DEFINE_SPINLOCK(devcg_lock);
>> +static LIST_HEAD(devcg_devices);
>> +
>> +static inline struct devcg_state *
>> +css_to_devcs(struct cgroup_subsys_state *css)
>> +{
>> +    return container_of(css, struct devcg_state, css);
>> +}
>> +
>> +static inline struct devcg_state *get_current_devcs(void)
>> +{
>> +    return css_to_devcs(task_get_css(current, dev_cgrp_id));
>> +}
>> +
>> +static struct devcg_state *parent_devcs(struct devcg_state *cg)
>> +{
>> +    return cg->css.parent ? css_to_devcs(cg->css.parent) : NULL;
>> +}
>> +
>> +static void free_cg_pool(struct dev_cgroup_pool_state *pool)
>> +{
>> +    list_del(&pool->dev_node);
>> +    kfree(pool);
>> +}
>> +
>> +static void
>> +set_resource_min(struct dev_cgroup_pool_state *pool, int i, u64 val)
>> +{
>> +    page_counter_set_min(&pool->resources[i].cnt, val);
>> +}
>> +
>> +static void
>> +set_resource_low(struct dev_cgroup_pool_state *pool, int i, u64 val)
>> +{
>> +    page_counter_set_low(&pool->resources[i].cnt, val);
>> +}
>> +
>> +static void
>> +set_resource_max(struct dev_cgroup_pool_state *pool, int i, u64 val)
>> +{
>> +    page_counter_set_max(&pool->resources[i].cnt, val);
>> +}
>> +
>> +static u64 get_resource_low(struct dev_cgroup_pool_state *pool, int idx)
>> +{
>> +    return pool ? READ_ONCE(pool->resources[idx].cnt.low) : 0;
>> +}
>> +
>> +static u64 get_resource_min(struct dev_cgroup_pool_state *pool, int idx)
>> +{
>> +    return pool ? READ_ONCE(pool->resources[idx].cnt.min) : 0;
>> +}
>> +
>> +static u64 get_resource_max(struct dev_cgroup_pool_state *pool, int idx)
>> +{
>> +    return pool ? READ_ONCE(pool->resources[idx].cnt.max) : 
>> PAGE_COUNTER_MAX;
>> +}
>> +
>> +static u64 get_resource_current(struct dev_cgroup_pool_state *pool, 
>> int idx)
>> +{
>> +    return pool ? page_counter_read(&pool->resources[idx].cnt) : 0;
>> +}
>> +
>> +static void reset_all_resource_limits(struct dev_cgroup_pool_state 
>> *rpool)
>> +{
>> +    int i;
>> +
>> +    for (i = 0; i < rpool->num_res; i++) {
>> +        set_resource_min(rpool, i, 0);
>> +        set_resource_low(rpool, i, 0);
>> +        set_resource_max(rpool, i, PAGE_COUNTER_MAX);
>> +    }
>> +}
>> +
>> +static void devcs_offline(struct cgroup_subsys_state *css)
>> +{
>> +    struct devcg_state *devcs = css_to_devcs(css);
>> +    struct dev_cgroup_pool_state *pool;
>> +
>> +    rcu_read_lock();
>> +    list_for_each_entry_rcu(pool, &devcs->pools, css_node)
>> +        reset_all_resource_limits(pool);
>> +    rcu_read_unlock();
>> +}
>> +
>> +static void devcs_free(struct cgroup_subsys_state *css)
>> +{
>> +    struct devcg_state *devcs = css_to_devcs(css);
>> +    struct dev_cgroup_pool_state *pool, *next;
>> +
>> +    spin_lock(&devcg_lock);
>> +    list_for_each_entry_safe(pool, next, &devcs->pools, css_node) {
>> +        /*
>> +         *The pool is dead and all references are 0,
>> +         * no need for RCU protection with list_del_rcu or freeing.
>> +         */
>> +        list_del(&pool->css_node);
>> +        free_cg_pool(pool);
>> +    }
>> +    spin_unlock(&devcg_lock);
>> +
>> +    kfree(devcs);
>> +}
>> +
>> +static struct cgroup_subsys_state *
>> +devcs_alloc(struct cgroup_subsys_state *parent_css)
>> +{
>> +    struct devcg_state *devcs = kzalloc(sizeof(*devcs), GFP_KERNEL);
>> +    if (!devcs)
>> +        return ERR_PTR(-ENOMEM);
>> +
>> +    INIT_LIST_HEAD(&devcs->pools);
>> +    return &devcs->css;
>> +}
>> +
>> +static struct dev_cgroup_pool_state *
>> +find_cg_pool_locked(struct devcg_state *devcs, struct devcg_device *dev)
>> +{
>> +    struct dev_cgroup_pool_state *pool;
>> +
>> +    list_for_each_entry_rcu(pool, &devcs->pools, css_node, 
>> spin_is_locked(&devcg_lock))
>> +        if (pool->device == dev)
>> +            return pool;
>> +
>> +    return NULL;
>> +}
>> +
>> +static struct dev_cgroup_pool_state *pool_parent(struct 
>> dev_cgroup_pool_state *pool)
>> +{
>> +    if (!pool->resources[0].cnt.parent)
>> +        return NULL;
>> +
>> +    return container_of(pool->resources[0].cnt.parent, typeof(*pool), 
>> resources[0].cnt);
>> +}
>> +
>> +/**
>> + * dev_cgroup_state_evict_valuable() - Check if we should evict from 
>> test_pool
>> + * @dev: &dev_cgroup_device
>> + * @index: The index number of the region being tested.
>> + * @limit_pool: The pool for which we hit limits
>> + * @test_pool: The pool for which to test
>> + * @ignore_low: Whether we have to respect low watermarks.
>> + * @ret_hit_low: Pointer to whether it makes sense to consider low 
>> watermark.
>> + *
>> + * This function returns true if we can evict from @test_pool, false 
>> if not.
>> + * When returning false and @ignore_low is false, @ret_hit_low may
>> + * be set to true to indicate this function can be retried with 
>> @ignore_low
>> + * set to true.
>> + *
>> + * Return: bool
>> + */
>> +bool dev_cgroup_state_evict_valuable(struct dev_cgroup_device *dev, 
>> int index,
>> +                     struct dev_cgroup_pool_state *limit_pool,
>> +                     struct dev_cgroup_pool_state *test_pool,
>> +                     bool ignore_low, bool *ret_hit_low)
>> +{
>> +    struct dev_cgroup_pool_state *pool = test_pool;
>> +    struct page_counter *climit, *ctest;
>> +    u64 used, min, low;
>> +
>> +    /* Can always evict from current pool, despite limits */
>> +    if (limit_pool == test_pool)
>> +        return true;
>> +
>> +    if (limit_pool) {
>> +        if (!parent_devcs(limit_pool->cs))
>> +            return true;
>> +
>> +        for (pool = test_pool; pool && limit_pool != pool; pool = 
>> pool_parent(pool))
>> +            {}
>> +
>> +        if (!pool)
>> +            return false;
>> +    } else {
>> +        /*
>> +         * If there is no cgroup limiting memory usage, use the root
>> +         * cgroup instead for limit calculations.
>> +         */
>> +        for (limit_pool = test_pool; pool_parent(limit_pool); 
>> limit_pool = pool_parent(limit_pool))
>> +            {}
>> +    }
>> +
>> +    climit = &limit_pool->resources[index].cnt;
>> +    ctest = &test_pool->resources[index].cnt;
>> +
>> +    page_counter_calculate_protection(climit, ctest, true);
> 
> I realized we can't do this. As the documentation for
> page_counter_calculate_protection states:
> 
>> WARNING: This function is not stateless! It can only be used as part
>>          of a top-down tree iteration, not for isolated queries.
> 
> I authored a fix with [1], though I'm not super happy with having to
> iterate through the entire (sub-)hierarchy like this every time we
> consider eviction. If anyone has a better idea, feel free to propose it.
> 
> This branch also contains another idea [2][3] I've been playing around
> with. Essentially, what I'm trying to solve is TTM preferring to use
> system memory over evicting VRAM, even if the new VRAM allocation would
> be protected from eviction by low/min memory protection. In my testing,
> it leads to a better experience to try evicting unprotected allocations
> immediately in that case. I'm fine with this being follow-up work, but
> given that the patchset is still in a rather early stage I thought I'd
> pitch this now.
Hey,

I don't know if an alternative implementation is needed here. I think 
the current code is correct. The caller ensures that limit_pool and 
test_pool are alive.

I believe it's roughly parallel to try_charge, but in 2 parts. As long 
as the caller serializes call to evict_valuable, current code should be 
fine?

Kind regards,
Maarten Lankhorst
