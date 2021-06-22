Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 311CC3B022C
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 13:00:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60C8C6E499;
	Tue, 22 Jun 2021 11:00:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6583E6E499;
 Tue, 22 Jun 2021 11:00:45 +0000 (UTC)
IronPort-SDR: Szqwv/mNpOap/pobqKqvWS5w7rEjGKvSju+JY1OlwYgjbUXfBtSloIhWyIIB8F2ZknndHTyGs2
 OPnzAX/pOlpA==
X-IronPort-AV: E=McAfee;i="6200,9189,10022"; a="194170832"
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="194170832"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 04:00:43 -0700
IronPort-SDR: 7xTR7/OMbHV//Rxd+Reh5Vj6pOzQdki2c+81IKh3uu6+zHSZt8WaHO6QavXYSQDb6QkODMuO4p
 RJquB3TLXeIQ==
X-IronPort-AV: E=Sophos;i="5.83,291,1616482800"; d="scan'208";a="454217316"
Received: from clanggaa-mobl1.ger.corp.intel.com (HELO [10.249.254.95])
 ([10.249.254.95])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2021 04:00:41 -0700
Subject: Re: [PATCH v7 3/3] drm/i915/ttm: Use TTM for system memory
To: Matthew Auld <matthew.william.auld@gmail.com>
References: <20210622093418.153400-1-thomas.hellstrom@linux.intel.com>
 <20210622093418.153400-4-thomas.hellstrom@linux.intel.com>
 <CAM0jSHOZKGZ_yGyV0HC8FNSX2yQWF95jirihMKhXE353jr-a2w@mail.gmail.com>
From: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <ae1badcc-9ff3-6648-9eba-a0cf312e0487@linux.intel.com>
Date: Tue, 22 Jun 2021 13:00:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAM0jSHOZKGZ_yGyV0HC8FNSX2yQWF95jirihMKhXE353jr-a2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Matthew Auld <matthew.auld@intel.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/21 12:55 PM, Matthew Auld wrote:
> On Tue, 22 Jun 2021 at 10:34, Thomas Hellström
> <thomas.hellstrom@linux.intel.com> wrote:
>> For discrete, use TTM for both cached and WC system memory. That means
>> we currently rely on the TTM memory accounting / shrinker. For cached
>> system memory we should consider remaining shmem-backed, which can be
>> implemented from our ttm_tt_populate callback. We can then also reuse our
>> own very elaborate shrinker for that memory.
>>
>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> ---
>> v2:
>> - Fix IS_ERR_OR_NULL() check to IS_ERR() (Reported by Matthew Auld)
>> v3:
>> - Commit message typo fix
>> v6:
>> - Fix TODO:s for supporting system memory with TTM.
>> - Update the object GEM region after a TTM move if compatible.
>> - Add a couple of warnings for shmem on DGFX.
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_shmem.c  |  3 ++
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c    | 51 +++++++++++++++++-----
>>   drivers/gpu/drm/i915/i915_drv.h            |  3 --
>>   drivers/gpu/drm/i915/intel_memory_region.c |  7 ++-
>>   drivers/gpu/drm/i915/intel_memory_region.h |  8 ++++
>>   5 files changed, 58 insertions(+), 14 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> index 7aa1c95c7b7d..3648ae1d6628 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_shmem.c
>> @@ -284,6 +284,7 @@ __i915_gem_object_release_shmem(struct drm_i915_gem_object *obj,
>>                                  bool needs_clflush)
>>   {
>>          GEM_BUG_ON(obj->mm.madv == __I915_MADV_PURGED);
>> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>>
>>          if (obj->mm.madv == I915_MADV_DONTNEED)
>>                  obj->mm.dirty = false;
>> @@ -302,6 +303,7 @@ void i915_gem_object_put_pages_shmem(struct drm_i915_gem_object *obj, struct sg_
>>          struct pagevec pvec;
>>          struct page *page;
>>
>> +       GEM_WARN_ON(IS_DGFX(to_i915(obj->base.dev)));
>>          __i915_gem_object_release_shmem(obj, pages, true);
>>
>>          i915_gem_gtt_finish_pages(obj, pages);
>> @@ -560,6 +562,7 @@ i915_gem_object_create_shmem_from_data(struct drm_i915_private *dev_priv,
>>          resource_size_t offset;
>>          int err;
>>
>> +       GEM_WARN_ON(IS_DGFX(dev_priv));
>>          obj = i915_gem_object_create_shmem(dev_priv, round_up(size, PAGE_SIZE));
>>          if (IS_ERR(obj))
>>                  return obj;
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index 966b292d07da..07097f150065 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -286,6 +286,25 @@ static void i915_ttm_adjust_gem_after_move(struct drm_i915_gem_object *obj)
>>   {
>>          struct ttm_buffer_object *bo = i915_gem_to_ttm(obj);
>>          unsigned int cache_level;
>> +       unsigned int i;
>> +
>> +       /*
>> +        * If object was moved to an allowable region, update the object
>> +        * region to consider it migrated. Note that if it's currently not
>> +        * in an allowable region, it's evicted and we don't update the
>> +        * object region.
>> +        */
>> +       if (intel_region_to_ttm_type(obj->mm.region) != bo->resource->mem_type) {
>> +               for (i = 0; i < obj->mm.n_placements; ++i) {
>> +                       struct intel_memory_region *mr = obj->mm.placements[i];
>> +
>> +                       if (intel_region_to_ttm_type(mr) == bo->resource->mem_type &&
>> +                           mr != obj->mm.region) {
>> +                               intel_memory_region_put(obj->mm.region);
>> +                               obj->mm.region = intel_memory_region_get(mr);
> break;?
>
> i915_gem_object_{init, release}_memory_region?
>
> There is also the region_link stuff, but I guess we can nuke that?

Ah, yes, I'll fix that up. I think we will actually need that for 
suspend/resume, as the TTM LRU lists aren't sufficient...

Thanks for reviewing!

/Thomas


