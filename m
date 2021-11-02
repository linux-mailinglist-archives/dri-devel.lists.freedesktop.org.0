Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 755C74434EB
	for <lists+dri-devel@lfdr.de>; Tue,  2 Nov 2021 18:55:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9682D734F7;
	Tue,  2 Nov 2021 17:55:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BE52734F7;
 Tue,  2 Nov 2021 17:55:15 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10156"; a="317533438"
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="317533438"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 10:55:14 -0700
X-IronPort-AV: E=Sophos;i="5.87,203,1631602800"; d="scan'208";a="467828374"
Received: from vanderss-mobl.ger.corp.intel.com (HELO [10.249.254.234])
 ([10.249.254.234])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2021 10:55:13 -0700
Message-ID: <d9c63560-86fa-9efd-c962-eddb8cf76757@linux.intel.com>
Date: Tue, 2 Nov 2021 18:55:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v3 2/2] drm/i915/ttm: Failsafe migration blits
Content-Language: en-US
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20211102163425.505732-1-thomas.hellstrom@linux.intel.com>
 <20211102163425.505732-3-thomas.hellstrom@linux.intel.com>
 <CAM0jSHO-ZUP39Rw=Nm=wUrNEhCzhVG_ve+3we8gWzSkoisn4yQ@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <CAM0jSHO-ZUP39Rw=Nm=wUrNEhCzhVG_ve+3we8gWzSkoisn4yQ@mail.gmail.com>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 11/2/21 18:40, Matthew Auld wrote:
> On Tue, 2 Nov 2021 at 16:39, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> If the initial fill blit or copy blit of an object fails, the old
>> content of the data might be exposed and read as soon as either CPU- or
>> GPU PTEs are set up to point at the pages.
>>
>> Intercept the blit fence with an async callback that checks the
>> blit fence for errors and if there are errors performs an async cpu blit
>> instead. If there is a failure to allocate the async dma_fence_work,
>> allocate it on the stack and sync wait for the blit to complete.
>>
>> Add selftests that simulate gpu blit failures and failure to allocate
>> the async dma_fence_work.
>>
>> A previous version of this pach used dma_fence_work, now that's
>> opencoded which adds more code but might lower the latency
>> somewhat in the common non-error case.
>>
>> v3:
>> - Style fixes (Matthew Auld)
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  | 322 +++++++++++++++---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.h  |   5 +
>>   .../drm/i915/gem/selftests/i915_gem_migrate.c |  24 +-
>>   3 files changed, 295 insertions(+), 56 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> index 0ed6b7f2b95f..b89672c547f8 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -18,6 +18,29 @@
>>   #include "gt/intel_gt.h"
>>   #include "gt/intel_migrate.h"
>>
>> +/**
>> + * DOC: Selftest failure modes for failsafe migration:
>> + *
>> + * For fail_gpu_migration, the gpu blit scheduled is always a clear blit
>> + * rather than a copy blit, and then we force the failure paths as if
>> + * the blit fence returned an error.
>> + *
>> + * For fail_work_allocation we fail the kmalloc of the async worker, we
>> + * sync the gpu blit. If it then fails, or fail_gpu_migration is set to
>> + * true, then a memcpy operation is performed sync.
>> + */
>> +#ifdef CONFIG_DRM_I915_SELFTEST
> When pushing maybe make this:
>
> #if IS_ENABLED(CONFIG_DRM_I915_SELFTEST)
>
> Which seems to be consistent with most of the other places.

Hmm,

I noticed that i915 is doing that, although I thought these macros were 
primarily intended for C expressions?

/Thomas


>
>> +static bool fail_gpu_migration;
>> +static bool fail_work_allocation;
>> +
>> +void i915_ttm_migrate_set_failure_modes(bool gpu_migration,
>> +                                       bool work_allocation)
>> +{
>> +       fail_gpu_migration = gpu_migration;
>> +       fail_work_allocation = work_allocation;
>> +}
>> +#endif
>> +
