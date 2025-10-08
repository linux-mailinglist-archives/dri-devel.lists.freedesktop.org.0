Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24859BC570C
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 16:34:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E096610E3A6;
	Wed,  8 Oct 2025 14:34:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Hplfqz1T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEE0410E143;
 Wed,  8 Oct 2025 14:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759934089; x=1791470089;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iLuyFQG2Afb+xt6uL7qrGHtrCZf4OyE7GAQI/NQO9V4=;
 b=Hplfqz1TPEta0LVnHMsP34b+tbkOcgalGtzmSr8a9+XaLU4df+GNZRWN
 Q4wN0upHdjRxJJBZLwydTufLNafLyaCZ091bjIZ1+Ms46zM3i7xB2gGcu
 bm4n6BX5G0OsXLXQ/4CT62vnkjr678Ohujpqwgpjs2qqeeeYoawtjRSIR
 Y1WGcdxfASHX+briKt+TV+Y7XYT8P6tJjrmWiLMnsYGs2t2ivnm1lBfP2
 sFnUpdkSzIevTItzBvZ/gWxaaMJs0u/sD3FGSHCtooZzs16TUOof9JVut
 9BXxb7xKDBtyzSoSPa+/JkflBBvSsWiY6pOt7yvGnZLgwrdxpy6chVPbU Q==;
X-CSE-ConnectionGUID: 1T8tI6tES4yIAEJE+ByTxQ==
X-CSE-MsgGUID: 9VVjcPeSS2qbdLfEpHBGrQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="62046431"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="62046431"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:34:48 -0700
X-CSE-ConnectionGUID: IOx6BZseTAC/y5Y8B3bl0Q==
X-CSE-MsgGUID: Cuixql9wTmWtWQAIz+FAfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="217561598"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO [10.245.244.136])
 ([10.245.244.136])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 07:34:44 -0700
Message-ID: <fe98edc2-cc18-4c44-a4cb-5c41b60834e6@intel.com>
Date: Wed, 8 Oct 2025 15:34:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/5] Improving the worst case TTM large allocation
 latency
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 amd-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lyude Paul <lyude@redhat.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Sui Jingfeng <suijingfeng@loongson.cn>,
 Thadeu Lima de Souza Cascardo <cascardo@igalia.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, Zack Rusin <zack.rusin@broadcom.com>
References: <20251008115314.55438-1-tvrtko.ursulin@igalia.com>
 <6bba6d25-91f3-49a6-81fc-7a03d891cd1d@amd.com>
 <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <22228578-a03c-4fc1-85b2-d281525a2b6f@igalia.com>
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

On 08/10/2025 14:50, Tvrtko Ursulin wrote:
> 
> On 08/10/2025 13:35, Christian König wrote:
>> On 08.10.25 13:53, Tvrtko Ursulin wrote:
>>> Disclaimer:
>>> Please note that as this series includes a patch which touches a good 
>>> number of
>>> drivers I will only copy everyone in the cover letter and the 
>>> respective patch.
>>> Assumption is people are subscribed to dri-devel so can look at the 
>>> whole series
>>> there. I know someone is bound to complain for both the case when 
>>> everyone is
>>> copied on everything for getting too much email, and also for this 
>>> other case.
>>> So please be flexible.
>>>
>>> Description:
>>>
>>> All drivers which use the TTM pool allocator end up requesting large 
>>> order
>>> allocations when allocating large buffers. Those can be slow due 
>>> memory pressure
>>> and so add latency to buffer creation. But there is often also a size 
>>> limit
>>> above which contiguous blocks do not bring any performance benefits. 
>>> This series
>>> allows drivers to say when it is okay for the TTM to try a bit less 
>>> hard.
>>>
>>> We do this by allowing drivers to specify this cut off point when 
>>> creating the
>>> TTM device and pools. Allocations above this size will skip direct 
>>> reclaim so
>>> under memory pressure worst case latency will improve. Background 
>>> reclaim is
>>> still kicked off and both before and after the memory pressure all 
>>> the TTM pool
>>> buckets remain to be used as they are today.
>>>
>>> This is especially interesting if someone has configured 
>>> MAX_PAGE_ORDER to
>>> higher than the default. And even with the default, with amdgpu for 
>>> example,
>>> the last patch in the series makes use of the new feature by telling 
>>> TTM that
>>> above 2MiB we do not expect performance benefits. Which makes TTM not 
>>> try direct
>>> reclaim for the top bucket (4MiB).
>>>
>>> End result is TTM drivers become a tiny bit nicer mm citizens and 
>>> users benefit
>>> from better worst case buffer creation latencies. As a side benefit 
>>> we get rid
>>> of two instances of those often very unreadable mutliple nameless 
>>> booleans
>>> function signatures.
>>>
>>> If this sounds interesting and gets merge the invidual drivers can 
>>> follow up
>>> with patches configuring their thresholds.
>>>
>>> v2:
>>>   * Christian suggested to pass in the new data by changing the 
>>> function signatures.
>>>
>>> v3:
>>>   * Moved ttm pool helpers into new ttm_pool_internal.h. (Christian)
>>
>> Patch #3 is Acked-by: Christian König <christian.koenig@amd.com>.
>>
>> The rest is Reviewed-by: Christian König <christian.koenig@amd.com>
> 
> Thank you!
> 
> So I think now I need acks to merge via drm-misc for all the drivers 
> which have their own trees. Which seems to be just xe.
> 
> Also interesting for other drivers is that when this lands folks can 
> start passing in their "max size which leads to performance gains" via 
> TTM_POOL_BENEFICIAL_ORDER and get the worst case allocation latency 
> improvements.
> 
> I am thinking xe also maxes out at 2MiB pages, for others I don't know.

Yeah, next level up from 2M GTT page is still 1G GTT page. I think we 
especially need 64K/2M system memory pages on igpu to get some perf back 
when enabling iommu on some platforms IIRC. Not aware of really needing 
 > 2M so sounds like we might also benefit by maxing out at 2M, if it 
reduces allocation latency in some cases.

> 
> Regards,
> 
> Tvrtko
> 
>>> v1 thread:
>>> https://lore.kernel.org/dri-devel/20250919131127.90932-1- 
>>> tvrtko.ursulin@igalia.com/
>>>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@kernel.org>
>>> Cc: Dave Airlie <airlied@redhat.com>
>>> Cc: Gerd Hoffmann <kraxel@redhat.com>
>>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>> Cc: Lyude Paul <lyude@redhat.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <mripard@kernel.org>
>>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>> Cc: Sui Jingfeng <suijingfeng@loongson.cn>
>>> Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Zack Rusin <zack.rusin@broadcom.com>
>>>
>>> Tvrtko Ursulin (5):
>>>    drm/ttm: Add getter for some pool properties
>>>    drm/ttm: Replace multiple booleans with flags in pool init
>>>    drm/ttm: Replace multiple booleans with flags in device init
>>>    drm/ttm: Allow drivers to specify maximum beneficial TTM pool size
>>>    drm/amdgpu: Configure max beneficial TTM pool allocation order
>>>
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  7 +--
>>>   drivers/gpu/drm/drm_gem_vram_helper.c         |  2 +-
>>>   drivers/gpu/drm/i915/intel_region_ttm.c       |  2 +-
>>>   drivers/gpu/drm/loongson/lsdc_ttm.c           |  2 +-
>>>   drivers/gpu/drm/nouveau/nouveau_ttm.c         |  4 +-
>>>   drivers/gpu/drm/qxl/qxl_ttm.c                 |  2 +-
>>>   drivers/gpu/drm/radeon/radeon_ttm.c           |  4 +-
>>>   drivers/gpu/drm/ttm/tests/ttm_bo_test.c       | 16 +++----
>>>   .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |  2 +-
>>>   drivers/gpu/drm/ttm/tests/ttm_device_test.c   | 31 +++++--------
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.c | 22 ++++-----
>>>   drivers/gpu/drm/ttm/tests/ttm_kunit_helpers.h |  7 +--
>>>   drivers/gpu/drm/ttm/tests/ttm_pool_test.c     | 23 +++++-----
>>>   drivers/gpu/drm/ttm/ttm_device.c              |  7 ++-
>>>   drivers/gpu/drm/ttm/ttm_pool.c                | 45 +++++++++++--------
>>>   drivers/gpu/drm/ttm/ttm_pool_internal.h       | 24 ++++++++++
>>>   drivers/gpu/drm/ttm/ttm_tt.c                  | 10 +++--
>>>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.c           |  4 +-
>>>   drivers/gpu/drm/xe/xe_device.c                |  2 +-
>>>   include/drm/ttm/ttm_device.h                  |  2 +-
>>>   include/drm/ttm/ttm_pool.h                    | 13 +++---
>>>   21 files changed, 125 insertions(+), 106 deletions(-)
>>>   create mode 100644 drivers/gpu/drm/ttm/ttm_pool_internal.h
>>>
>>
> 

