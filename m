Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 555DA41D9C7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 14:27:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B46E6E409;
	Thu, 30 Sep 2021 12:27:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C10B6E3F4;
 Thu, 30 Sep 2021 12:27:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10122"; a="212430963"
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="212430963"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 05:27:28 -0700
X-IronPort-AV: E=Sophos;i="5.85,336,1624345200"; d="scan'208";a="520359747"
Received: from dclinto1-mobl1.ger.corp.intel.com (HELO [10.252.21.182])
 ([10.252.21.182])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2021 05:27:27 -0700
Subject: Re: [PATCH v5 12/13] drm/i915/ttm: use cached system pages when
 evicting lmem
To: =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
References: <20210927114114.152310-1-matthew.auld@intel.com>
 <20210927114114.152310-12-matthew.auld@intel.com>
 <6372b5a3ab5b8d5b640af59c9290cbe6da21a0f9.camel@linux.intel.com>
 <c73d99e5-267b-c396-2c19-9e5938d7ab6f@daenzer.net>
From: Matthew Auld <matthew.auld@intel.com>
Message-ID: <40845c09-c219-800d-5fc8-0b2d68702142@intel.com>
Date: Thu, 30 Sep 2021 13:27:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <c73d99e5-267b-c396-2c19-9e5938d7ab6f@daenzer.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
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

On 30/09/2021 11:04, Michel Dänzer wrote:
> On 2021-09-29 13:54, Thomas Hellström wrote:
>> On Mon, 2021-09-27 at 12:41 +0100, Matthew Auld wrote:
>>> This should let us do an accelerated copy directly to the shmem pages
>>> when temporarily moving lmem-only objects, where the i915-gem
>>> shrinker
>>> can later kick in to swap out the pages, if needed.
>>>
>>> Signed-off-by: Matthew Auld <matthew.auld@intel.com>
>>> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> ---
>>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 8 ++++----
>>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 194e5f1deda8..46d57541c0b2 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -134,11 +134,11 @@ static enum ttm_caching
>>>   i915_ttm_select_tt_caching(const struct drm_i915_gem_object *obj)
>>>   {
>>>          /*
>>> -        * Objects only allowed in system get cached cpu-mappings.
>>> -        * Other objects get WC mapping for now. Even if in system.
>>> +        * Objects only allowed in system get cached cpu-mappings, or
>>> when
>>> +        * evicting lmem-only buffers to system for swapping. Other
>>> objects get
>>> +        * WC mapping for now. Even if in system.
>>>           */
>>> -       if (obj->mm.region->type == INTEL_MEMORY_SYSTEM &&
>>> -           obj->mm.n_placements <= 1)
>>> +       if (obj->mm.n_placements <= 1)
>>>                  return ttm_cached;
>>>   
>>>          return ttm_write_combined;
>>
>> We should be aware that with TTM, even evicted bos can be mapped by
>> user-space while evicted, and this will appear to user-space like the
>> WC-mapped object suddenly became WB-mapped. But it appears like mesa
>> doesn't care about this as long as the mappings are fully coherent.
> 
> FWIW, the Mesa radeonsi driver avoids surprises due to this (e.g. some path which involves CPU access suddenly goes faster if the BO was evicted from VRAM) by asking for WC mapping of BOs intended to be in VRAM even while they're evicted (via the AMDGPU_GEM_CREATE_CPU_GTT_USWC flag).
> 

Ok, so amdgpu just defaults to cached system memory, even for evicted 
VRAM, unless userspace requests USWC, in which case it will use WC?

> 
