Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5160845916D
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 16:31:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9DD89C53;
	Mon, 22 Nov 2021 15:31:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F4A89C48;
 Mon, 22 Nov 2021 15:31:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10175"; a="215518138"
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="215518138"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 07:31:28 -0800
X-IronPort-AV: E=Sophos;i="5.87,255,1631602800"; d="scan'208";a="537908199"
Received: from aalazizi-mobl1.amr.corp.intel.com (HELO [10.213.249.159])
 ([10.213.249.159])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2021 07:31:25 -0800
Message-ID: <f22a03fe-e48c-fda9-034e-6ac3433a1935@linux.intel.com>
Date: Mon, 22 Nov 2021 15:31:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.1
Subject: Re: [PATCH] Revert "drm/i915/dmabuf: fix broken build"
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, Intel-gfx@lists.freedesktop.org
References: <20211122135758.85444-1-tvrtko.ursulin@linux.intel.com>
 <c95fe70e-1ce0-5f86-4248-39571c2b0782@intel.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <c95fe70e-1ce0-5f86-4248-39571c2b0782@intel.com>
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
Cc: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, Jani Nikula <jani.nikula@intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 22/11/2021 14:04, Matthew Auld wrote:
> On 22/11/2021 13:57, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>>
>> This reverts commit 777226dac058d119286b4081953cb5aa2cb7394b.
>>
>> Approach taken in the patch was rejected by Linus and the upstream tree
>> now already contains the required include directive via 304ac8032d3f
>> ("Merge tag 'drm-next-2021-11-12' of 
>> git://anongit.freedesktop.org/drm/drm").
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Fixes: 777226dac058 ("drm/i915/dmabuf: fix broken build")
>> Cc: Matthew Auld <matthew.auld@intel.com>
>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Jani Nikula <jani.nikula@intel.com>
> 
> Acked-by: Matthew Auld <matthew.auld@intel.com>
> 
> This was copy-paste from gem/i915_gem_pm.c, does that need a similar patch?

Personally I don't think we need to act immediately and can wait until 
the !x86 build efforts crystalize things for us a bit.

At least the commentary and commit in i915_gem_pm.c give rationale on 
pros and cons of clflush vs wbinvd. And commentary in i915_gem_dmabuf.c 
makes it sound we cannot simply go to clflush there in all cases.

Regards,

Tvrtko

> 
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c | 7 -------
>>   1 file changed, 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> index f291cf4c3886..1b526039a60d 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_dmabuf.c
>> @@ -17,13 +17,6 @@
>>   MODULE_IMPORT_NS(DMA_BUF);
>> -#if defined(CONFIG_X86)
>> -#include <asm/smp.h>
>> -#else
>> -#define wbinvd_on_all_cpus() \
>> -    pr_warn(DRIVER_NAME ": Missing cache flush in %s\n", __func__)
>> -#endif
>> -
>>   I915_SELFTEST_DECLARE(static bool force_different_devices;)
>>   static struct drm_i915_gem_object *dma_buf_to_obj(struct dma_buf *buf)
>>
