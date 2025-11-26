Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB04C8AB31
	for <lists+dri-devel@lfdr.de>; Wed, 26 Nov 2025 16:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D12810E0B0;
	Wed, 26 Nov 2025 15:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l72X4SaL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C883E10E046
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Nov 2025 15:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764171605; x=1795707605;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=eiOyf4PPCC5BPzh21IyIWJ2IEXjl5NsUns4X8e/v5V0=;
 b=l72X4SaL12D1V29CSdkWKqKDG58gh+LP+whMdI69tJjV2TAw1QnO6oZa
 hWW8bGZaODJ71XbvHO4KvDS0D/jl6zh6QQOdldwPh7dq0KhBg/HZAvXOf
 /rQ9KJVCUvfSNDUBlQijfAm1It41e20uddX4EMnR+L9lXYBV+JnCre27w
 iHP6iLCS70WX4LpgihK1P1oIMfu21UmVPMOGRihjV5GHHgE+RaK1rCYI4
 5C4lCEBof8D/htFowYXVFaMe351KkwxdVpbRAZlImmlG/47jmDooJM5Wo
 tcY3iczCzF4RpOc5mKnFvQ0XuWW2QaeBtYtc5gLxz92H+ZOPckGj5wNkC w==;
X-CSE-ConnectionGUID: 0acPdFyqT5G7YTZ07CIM5g==
X-CSE-MsgGUID: NUA7F72EQeeSp11CLIpwvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11625"; a="76840489"
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="76840489"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:40:05 -0800
X-CSE-ConnectionGUID: KGSGpFdFQomTJy7tMtg9oA==
X-CSE-MsgGUID: QYRJHGmORaC+kHZXBk8FHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,228,1758610800"; d="scan'208";a="193065802"
Received: from klitkey1-mobl1.ger.corp.intel.com (HELO [10.245.245.178])
 ([10.245.245.178])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2025 07:40:02 -0800
Message-ID: <847eb5a7-7464-40f2-81ea-7bf2ff009a31@linux.intel.com>
Date: Wed, 26 Nov 2025 16:39:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 19/28] drm/ttm: rework pipelined eviction fence handling
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Huang Rui <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
References: <20251121101315.3585-1-pierre-eric.pelloux-prayer@amd.com>
 <20251121101315.3585-20-pierre-eric.pelloux-prayer@amd.com>
 <414584f0-3fdb-41e2-aa26-3776dc514184@amd.com>
 <7346d42b-3ad7-4170-900f-73d8ed356f71@linux.intel.com>
 <cc43a512-b979-4c11-a413-ab5108dab466@amd.com>
Content-Language: en-US
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
In-Reply-To: <cc43a512-b979-4c11-a413-ab5108dab466@amd.com>
Content-Type: text/plain; charset=UTF-8
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

Hey,

Den 2025-11-26 kl. 16:36, skrev Christian König:
> On 11/26/25 16:34, Maarten Lankhorst wrote:
>> Hey,
>>
>> Den 2025-11-21 kl. 16:12, skrev Christian König:
>>> On 11/21/25 11:12, Pierre-Eric Pelloux-Prayer wrote:
>>>> Until now ttm stored a single pipelined eviction fence which means
>>>> drivers had to use a single entity for these evictions.
>>>>
>>>> To lift this requirement, this commit allows up to 8 entities to
>>>> be used.
>>>>
>>>> Ideally a dma_resv object would have been used as a container of
>>>> the eviction fences, but the locking rules makes it complex.
>>>> dma_resv all have the same ww_class, which means "Attempting to
>>>> lock more mutexes after ww_acquire_done." is an error.
>>>>
>>>> One alternative considered was to introduced a 2nd ww_class for
>>>> specific resv to hold a single "transient" lock (= the resv lock
>>>> would only be held for a short period, without taking any other
>>>> locks).
>>>>
>>>> The other option, is to statically reserve a fence array, and
>>>> extend the existing code to deal with N fences, instead of 1.
>>>>
>>>> The driver is still responsible to reserve the correct number
>>>> of fence slots.
>>>>
>>>> ---
>>>> v2:
>>>> - simplified code
>>>> - dropped n_fences
>>>> - name changes
>>>> v3: use ttm_resource_manager_cleanup
>>>> ---
>>>>
>>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>>
>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>
>>> Going to push separately to drm-misc-next on Monday.
>>>
>> Pushing this broke drm-tip, the amd driver fails to build, as it's not using the eviction_fences array.
> 
> Thanks for the note! But hui? We changed amdgpu to not touch the move fence.
> 
> Give me a second.commit 13bec21f5f4cdabdf06725e5a8dee0b9b56ff671 (HEAD -> drm-tip, drm-tip/drm-tip, drm-tip/HEAD)

Author: Christian König <christian.koenig@amd.com>
Date:   Wed Nov 26 13:13:03 2025 +0100

    drm-tip: 2025y-11m-26d-12h-12m-41s UTC integration manifest

drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2188:34: error: ‘struct ttm_resource_manager’ has no member named ‘move’
 2188 |                 dma_fence_put(man->move);
      |                                  ^~
drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c:2189:20: error: ‘struct ttm_resource_manager’ has no member named ‘move’
 2189 |                 man->move = NULL;
      |                    ^~

Is what I see.

Kind regards,
~Maarten Lankhorst
