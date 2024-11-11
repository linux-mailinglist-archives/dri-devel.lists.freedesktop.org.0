Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C479C3AD9
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 10:28:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40F410E463;
	Mon, 11 Nov 2024 09:28:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="AZZbSD1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23D0810E455;
 Mon, 11 Nov 2024 09:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731317297; x=1762853297;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=+SBAacjvUsQOBkoIHgArPsT8A8OVUexjcQWHe3IJnow=;
 b=AZZbSD1Bkyq6K8ZancJheFRNGVpxG+67b3Ar+uK5RHAS23DRt4HqKf4M
 jpMLJN79PgpzstEGatwQMQ/fTBVFnB9avD160J8xhTRFCXougn7xUjYcF
 i7UUEVgRPjEhuIAlDtpVGnxquGKcBkqpUmEMexJ9dGusIM4tyrTkJz2OQ
 7R6ReR0sVB6KnBT5w3w+MHFdBHetFwsZzc2cn6+yBAzK6ex5l5bg2MV4k
 gkLDanGBygMqH0jOn2I7M6q5Bg+5X7vQzj5vkGI/gceJNfuSo/Fs17LrA
 oXV5LcN695QACSVBcTb9GAy57USdEts7kG+jq+dLjtJ7GjuO7zfbZF8cW w==;
X-CSE-ConnectionGUID: /uONsjzzSl6rwYwX49LPRg==
X-CSE-MsgGUID: Eg+sy8ttTLye+m0Sy9I+0w==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="42213213"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="42213213"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:28:17 -0800
X-CSE-ConnectionGUID: 9XbZoz18Tn2Q4+fN1Oe4ww==
X-CSE-MsgGUID: P6Jt0NSkQg6jvR5zvXnVWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,144,1728975600"; d="scan'208";a="86583250"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO [10.245.244.88])
 ([10.245.244.88])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2024 01:28:14 -0800
Message-ID: <2ddaf010-ce31-4957-bc4f-7f4c1bfe0826@linux.intel.com>
Date: Mon, 11 Nov 2024 10:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] kernel/cgroup: Add "dev" memory accounting cgroup
To: Waiman Long <llong@redhat.com>, intel-xe@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
 Johannes Weiner <hannes@cmpxchg.org>,
 Andrew Morton <akpm@linux-foundation.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>, cgroups@vger.kernel.org,
 linux-mm@kvack.org, Maxime Ripard <mripard@kernel.org>
References: <20241023075302.27194-1-maarten.lankhorst@linux.intel.com>
 <20241023075302.27194-2-maarten.lankhorst@linux.intel.com>
 <813cc1d5-1648-4900-ae56-5405e52926df@redhat.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <813cc1d5-1648-4900-ae56-5405e52926df@redhat.com>
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



Den 2024-10-23 kl. 17:26, skrev Waiman Long:
> On 10/23/24 3:52 AM, Maarten Lankhorst wrote:
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
> 
> Just a general comment.
> 
> Cgroup v1 has a legacy device controller in security/device_cgroup.c 
> which is no longer available in cgroup v2. So if you use the name device 
> controller, the documentation must be clear that it is completely 
> different and have no relationship from the device controller in cgroup v1.
Hey,

Thanks for noticing. I didn't know there was such a controller. Seems 
weird to have one for managing access to opening devnodes instead of a
security module.

I'll update the documentation in the next version to make it more clear.

Cheers,
~Maarten
