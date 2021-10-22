Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ADAD54373E8
	for <lists+dri-devel@lfdr.de>; Fri, 22 Oct 2021 10:48:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30B146E906;
	Fri, 22 Oct 2021 08:48:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3B4F6E906;
 Fri, 22 Oct 2021 08:48:36 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10144"; a="226714897"
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="226714897"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 01:48:36 -0700
X-IronPort-AV: E=Sophos;i="5.87,172,1631602800"; d="scan'208";a="484599634"
Received: from dkarner-mobl.ger.corp.intel.com (HELO [10.252.48.154])
 ([10.252.48.154])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Oct 2021 01:48:35 -0700
Subject: Re: [PATCH 03/28] drm/i915: Remove dma_resv_prune
To: Matthew Auld <matthew.william.auld@gmail.com>
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
References: <20211021103605.735002-1-maarten.lankhorst@linux.intel.com>
 <20211021103605.735002-3-maarten.lankhorst@linux.intel.com>
 <CAM0jSHNWC9zUJiqErU_Xt-=UDeEedpgYt2PeF1Ww65E9TZMD0g@mail.gmail.com>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <42550da5-1898-1df8-37be-c414308ccbfb@linux.intel.com>
Date: Fri, 22 Oct 2021 10:48:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CAM0jSHNWC9zUJiqErU_Xt-=UDeEedpgYt2PeF1Ww65E9TZMD0g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 21-10-2021 om 16:43 schreef Matthew Auld:
> On Thu, 21 Oct 2021 at 11:36, Maarten Lankhorst
> <maarten.lankhorst@linux.intel.com> wrote:
>> The signaled bit is already used for quick testing if a fence is signaled.
> Why do we need this change? Can you add some more details to the commit please?

It's a terrible abuse of dma-fence api, and in the common case where the object is already locked by the caller, the trylock will fail.

If it were useful, the core dma-api would have exposed the same functionality.

On top of that, the fact that i915 has a dma_resv_utils.c file should be a warning that the functionality either belongs in core, or is not very useful at all. In this case the latter.

>> Signed-off-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>> ---
>>  drivers/gpu/drm/i915/Makefile                |  1 -
>>  drivers/gpu/drm/i915/dma_resv_utils.c        | 17 -----------------
>>  drivers/gpu/drm/i915/dma_resv_utils.h        | 13 -------------
>>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c |  3 ---
>>  drivers/gpu/drm/i915/gem/i915_gem_wait.c     |  8 --------
>>  5 files changed, 42 deletions(-)
>>  delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.c
>>  delete mode 100644 drivers/gpu/drm/i915/dma_resv_utils.h
>>
>> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
>> index 467872cca027..b87e3ed10d86 100644
>> --- a/drivers/gpu/drm/i915/Makefile
>> +++ b/drivers/gpu/drm/i915/Makefile
>> @@ -60,7 +60,6 @@ i915-y += i915_drv.o \
>>
>>  # core library code
>>  i915-y += \
>> -       dma_resv_utils.o \
>>         i915_memcpy.o \
>>         i915_mm.o \
>>         i915_sw_fence.o \
>> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.c b/drivers/gpu/drm/i915/dma_resv_utils.c
>> deleted file mode 100644
>> index 7df91b7e4ca8..000000000000
>> --- a/drivers/gpu/drm/i915/dma_resv_utils.c
>> +++ /dev/null
>> @@ -1,17 +0,0 @@
>> -// SPDX-License-Identifier: MIT
>> -/*
>> - * Copyright © 2020 Intel Corporation
>> - */
>> -
>> -#include <linux/dma-resv.h>
>> -
>> -#include "dma_resv_utils.h"
>> -
>> -void dma_resv_prune(struct dma_resv *resv)
>> -{
>> -       if (dma_resv_trylock(resv)) {
>> -               if (dma_resv_test_signaled(resv, true))
>> -                       dma_resv_add_excl_fence(resv, NULL);
>> -               dma_resv_unlock(resv);
>> -       }
>> -}
>> diff --git a/drivers/gpu/drm/i915/dma_resv_utils.h b/drivers/gpu/drm/i915/dma_resv_utils.h
>> deleted file mode 100644
>> index b9d8fb5f8367..000000000000
>> --- a/drivers/gpu/drm/i915/dma_resv_utils.h
>> +++ /dev/null
>> @@ -1,13 +0,0 @@
>> -/* SPDX-License-Identifier: MIT */
>> -/*
>> - * Copyright © 2020 Intel Corporation
>> - */
>> -
>> -#ifndef DMA_RESV_UTILS_H
>> -#define DMA_RESV_UTILS_H
>> -
>> -struct dma_resv;
>> -
>> -void dma_resv_prune(struct dma_resv *resv);
>> -
>> -#endif /* DMA_RESV_UTILS_H */
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> index 5ab136ffdeb2..af3eb7fd951d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shrinker.c
>> @@ -15,7 +15,6 @@
>>
>>  #include "gt/intel_gt_requests.h"
>>
>> -#include "dma_resv_utils.h"
>>  #include "i915_trace.h"
>>
>>  static bool swap_available(void)
>> @@ -229,8 +228,6 @@ i915_gem_shrink(struct i915_gem_ww_ctx *ww,
>>                                         i915_gem_object_unlock(obj);
>>                         }
>>
>> -                       dma_resv_prune(obj->base.resv);
> Like here, why do we want to drop this? Later in the series it looks
> like it gets added back, just in a slightly different form.
>
>> -
>>                         scanned += obj->base.size >> PAGE_SHIFT;
>>  skip:
>>                         i915_gem_object_put(obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_wait.c b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> index 840c13706999..1592d95c3ead 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_wait.c
>> @@ -10,7 +10,6 @@
>>
>>  #include "gt/intel_engine.h"
>>
>> -#include "dma_resv_utils.h"
>>  #include "i915_gem_ioctls.h"
>>  #include "i915_gem_object.h"
>>
>> @@ -52,13 +51,6 @@ i915_gem_object_wait_reservation(struct dma_resv *resv,
>>         }
>>         dma_resv_iter_end(&cursor);
>>
>> -       /*
>> -        * Opportunistically prune the fences iff we know they have *all* been
>> -        * signaled.
>> -        */
>> -       if (timeout > 0)
>> -               dma_resv_prune(resv);
>> -
>>         return ret;
>>  }
>>
>> --
>> 2.33.0
>>

