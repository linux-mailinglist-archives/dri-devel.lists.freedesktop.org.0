Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35EE84BD9BA
	for <lists+dri-devel@lfdr.de>; Mon, 21 Feb 2022 13:42:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BF7410E452;
	Mon, 21 Feb 2022 12:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D653710E4A0;
 Mon, 21 Feb 2022 12:42:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645447349; x=1676983349;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=ni247NRKHH8WSd14TeSlrjTV8KZbMh3G2fl3wLtHxWc=;
 b=lrXMFksFvySFqTeiAJaIdPy/IngvTgrqWKh1opnXUSWNsLN1BGXc10Zp
 RFnYJZ8fvYQYnby1KSx3hS6Gz/cw93z4ELG8SjiFee3x5aZYexJQ6FLs2
 n3ZKwOQaBin+Tdo03Im0K8bHb7cFUte73oisT7SF6fN2xpGEm9aXQBo88
 n8tSPbIIEEUj+wmntzRswOFKbN9LgCvuGsHUDupfnTArXhsOFOzUXG5yt
 aMfVfoXwjONgwkGdTylaw315yGkcudngni0TGxuxincCQqUJAyB13WLMe
 v+iMlIF4yvCo777F3JOPJO3ZyBW5rJp2/NntpyH3XfMw4JcajOsYKt+1p A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10264"; a="251450421"
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="251450421"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:42:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,385,1635231600"; d="scan'208";a="531843889"
Received: from mkilleen-mobl1.ger.corp.intel.com (HELO [10.213.218.216])
 ([10.213.218.216])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 04:42:20 -0800
Message-ID: <c7baae46-765a-e2e4-b200-576ee54c1b6e@linux.intel.com>
Date: Mon, 21 Feb 2022 12:42:18 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 1/2] drm/mm: Add an iterator to optimally walk over holes
 for an allocation (v3)
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <30de1989-6fee-d94a-7d99-6a3a8c59659d@amd.com>
 <20220215222352.867195-1-vivek.kasireddy@intel.com>
 <11828cdd-8d7b-b9a2-5a8c-ee0eac2f8aa8@amd.com>
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Organization: Intel Corporation UK Plc
In-Reply-To: <11828cdd-8d7b-b9a2-5a8c-ee0eac2f8aa8@amd.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 16/02/2022 10:36, Christian König wrote:
> Am 15.02.22 um 23:23 schrieb Vivek Kasireddy:
>> This iterator relies on drm_mm_first_hole() and drm_mm_next_hole()
>> functions to identify suitable holes for an allocation of a given
>> size by efficiently traversing the rbtree associated with the given
>> allocator.
>>
>> It replaces the for loop in drm_mm_insert_node_in_range() and can
>> also be used by drm drivers to quickly identify holes of a certain
>> size within a given range.
>>
>> v2: (Tvrtko)
>> - Prepend a double underscore for the newly exported first/next_hole
>> - s/each_best_hole/each_suitable_hole/g
>> - Mask out DRM_MM_INSERT_ONCE from the mode before calling
>>    first/next_hole and elsewhere.
>>
>> v3: (Tvrtko)
>> - Reduce the number of hunks by retaining the "mode" variable name
>>
>> Cc: Christian König <christian.koenig@amd.com>
>> Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
>> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
>> Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
> 
> Of hand it looks like it does what the description says without any 
> functional change, but I don't know the internals of drm_mm so well either.
> 
> Feel free to add an Acked-by: Christian König <christian.koenig@amd.com>.

Thanks!

Can we merge this via the Intel tree as one series (one drm core plus 
one i915 patch)? Daniel?

Regards,

Tvrtko
