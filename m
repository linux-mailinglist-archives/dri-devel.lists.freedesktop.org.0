Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 913DF5A6102
	for <lists+dri-devel@lfdr.de>; Tue, 30 Aug 2022 12:45:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BA4510E054;
	Tue, 30 Aug 2022 10:45:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C65510E05B;
 Tue, 30 Aug 2022 10:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661856313; x=1693392313;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=gXYRs/ovnag3IIKvnoC1UDC/d7uALKm8ZRa4pU5Xshw=;
 b=g9yTYfRVz8wPFJQHGYsmYt3abk7SyN4is3vVEYwqNp0RYoJA+wipfERn
 7qamQgz7ih3k/VgQBkbnF6Ckos4qr48J5iWnDbD4fGjVu07G0ZPlhEwFn
 k2//w+gYFeoKHbqCdmgQDmZFsFTaHqhLbTlsyPAsvzediOwKu4x7Wz/wh
 vlQVbgdRBTwRx4bzmEwbxtQM2cx/4Y0NsNdmKkNcZtd2hhPPTcv/zV42Y
 iOCN3Ddke02G78lSJgs3sO8dIbo5yWoi10ae8dN0lCunMSTtV5BEUFViV
 NexI9o+OH3mQvzw3qtWFUaamysIQ+xChgQuaQ+p5C3ANq89Z9F1KFyAp6 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10454"; a="275542694"
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="275542694"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 03:45:12 -0700
X-IronPort-AV: E=Sophos;i="5.93,274,1654585200"; d="scan'208";a="787452746"
Received: from harshmex-mobl.gar.corp.intel.com (HELO [10.214.157.209])
 ([10.214.157.209])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Aug 2022 03:45:09 -0700
Message-ID: <cc4c59ad-5d69-b174-5464-bd9896459169@intel.com>
Date: Tue, 30 Aug 2022 11:45:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Firefox/102.0 Thunderbird/102.2.0
Subject: Re: [PATCH 1/3] drm/i915: audit bo->resource usage
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>
References: <20220824142353.10293-1-luben.tuikov@amd.com>
 <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <1de21f6e-4b11-ee9b-1b54-fd67728766ad@amd.com>
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
Cc: Luben Tuikov <luben.tuikov@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 30/08/2022 08:33, Christian König wrote:
> Hi guys,
> 
> can we get an rb/acked-by for this i915 change?
> 
> Basically we are just making sure that the driver doesn't crash when 
> bo->resource is NULL and a bo doesn't have any backing store assigned to 
> it.
> 
> The Intel CI seems to be happy with this change, so I'm pretty sure it 
> is correct.

It looks like DG2/DG1 (which happen to use TTM here) are no longer 
loading the module:
https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_107680v1/index.html?

According to the logs the firmware is failing to load, so perhaps 
related to I915_BO_ALLOC_CPU_CLEAR, since that is one of the rare users. 
See below.

> 
> Thanks,
> Christian.
> 
> Am 24.08.22 um 16:23 schrieb Luben Tuikov:
>> From: Christian König <christian.koenig@amd.com>
>>
>> Make sure we can at least move and alloc TT objects without backing 
>> store.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c      | 6 ++----
>>   drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c | 2 +-
>>   2 files changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> index bc9c432edffe03..45ce2d1f754cc4 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>> @@ -271,8 +271,6 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>> ttm_buffer_object *bo,
>>   {
>>       struct drm_i915_private *i915 = container_of(bo->bdev, 
>> typeof(*i915),
>>                                bdev);
>> -    struct ttm_resource_manager *man =
>> -        ttm_manager_type(bo->bdev, bo->resource->mem_type);
>>       struct drm_i915_gem_object *obj = i915_ttm_to_gem(bo);
>>       unsigned long ccs_pages = 0;
>>       enum ttm_caching caching;
>> @@ -286,8 +284,8 @@ static struct ttm_tt *i915_ttm_tt_create(struct 
>> ttm_buffer_object *bo,
>>       if (!i915_tt)
>>           return NULL;
>> -    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR &&
>> -        man->use_tt)
>> +    if (obj->flags & I915_BO_ALLOC_CPU_CLEAR && bo->resource &&
>> +        ttm_manager_type(bo->bdev, bo->resource->mem_type)->use_tt)
>>           page_flags |= TTM_TT_FLAG_ZERO_ALLOC;

AFAICT i915 was massively relying on everything starting out in a 
"dummy" system memory resource (ttm_tt), where it then later 
"transitions" to the real resource. And if we need to clear the memory 
we rely on ZERO_ALLOC being set before calling into the i915_ttm_move() 
callback (even when allocating local-memory).

For ttm_bo_type_device objects (userspace stuff) it looks like this was 
previously handled by ttm_bo_validate() always doing:

   ret = ttm_tt_create(bo, true); /* clear = true */

Which we would always hit since the resource was always "compatible" for 
the dummy case. But it looks like this is no longer even called, since 
we can now call into ttm_move with bo->resource == NULL, which still 
calls tt_create eventually, which not always with clear = true.

All other objects are then ttm_bo_type_kernel so we don't care about 
clearing, except in the rare case of ALLOC_CPU_CLEAR, which was handled 
as per above in i915_ttm_tt_create(). But I think here bo->resource is 
NULL at the start when first creating the object, which will skip 
setting ZERO_ALLOC, which might explain the CI failure.

The other possible concern (not sure since CI didn't get that far) is 
around ttm_bo_pipeline_gutting(), which now leaves bo->resource = NULL. 
It looks like i915_ttm_shrink() was relying on that to unpopulate the 
ttm_tt. When later calling ttm_bo_validate(), i915_ttm_move() would see 
the SWAPPED flag set on the ttm_tt , re-populate it and then potentially 
move it back to local-memory.

What are your thoughts here? Also sorry if i915 is making a bit of mess 
here.

>>       caching = i915_ttm_select_tt_caching(obj);
>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c 
>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> index 9a7e50534b84bb..c420d1ab605b6f 100644
>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>> @@ -560,7 +560,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo, 
>> bool evict,
>>       bool clear;
>>       int ret;
>> -    if (GEM_WARN_ON(!obj)) {
>> +    if (GEM_WARN_ON(!obj) || !bo->resource) {
>>           ttm_bo_move_null(bo, dst_mem);
>>           return 0;
>>       }
> 
