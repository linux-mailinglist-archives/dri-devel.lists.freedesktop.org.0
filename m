Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 539694879E4
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jan 2022 16:49:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4B011A474;
	Fri,  7 Jan 2022 15:49:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4921311A485;
 Fri,  7 Jan 2022 15:49:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641570553; x=1673106553;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=rpY8dm206bP+VvXOMlV0d8Udd2pR25e83QEWUpJWmM4=;
 b=UspQlhtth56D61Z4DbbqEn8jkni0N2CLeML09AQB3Of1tOD1DWdGnV41
 vgswCmnpAnk0xG6boLEdH/y42DRrochLEirs2WjrSkSv9LR61f4iF3a4r
 +UuAQo2jGawqm/o980J4X3ye1imZE6G37giQqSohFJrjX+iwGOXYmLWAV
 OERr5JuPUYFoQ62s5lFE4Ug6V7vvy9b89I7XhMYiMpOWc7WZNX24qLUam
 T7QLOqy0jWAF3nK2LOl2+7dKO1Dg1hzYLeWwRJMu8FWRDxKdimhnLTF2R
 u3UgvXyOGLZUSV8XmTO+nGBYh/hLqVg2drG2tMy6IiEJ1DTaAmmwlxmlj A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10219"; a="243083844"
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="243083844"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 07:49:12 -0800
X-IronPort-AV: E=Sophos;i="5.88,270,1635231600"; d="scan'208";a="473351018"
Received: from yasmohd-mobl1.gar.corp.intel.com (HELO [10.249.64.131])
 ([10.249.64.131])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 07:49:07 -0800
Message-ID: <1d1a4278-5aee-20d5-b536-7ca199e85e93@intel.com>
Date: Fri, 7 Jan 2022 15:49:01 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v6 1/6] drm: move the buddy allocator from i915 into
 common drm
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211226222425.544863-1-Arunpravin.PaneerSelvam@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 26/12/2021 22:24, Arunpravin wrote:
> Move the base i915 buddy allocator code into drm
> - Move i915_buddy.h to include/drm
> - Move i915_buddy.c to drm root folder
> - Rename "i915" string with "drm" string wherever applicable
> - Rename "I915" string with "DRM" string wherever applicable
> - Fix header file dependencies
> - Fix alignment issues
> - add Makefile support for drm buddy
> - export functions and write kerneldoc description
> - Remove i915 selftest config check condition as buddy selftest
>    will be moved to drm selftest folder
> 
> cleanup i915 buddy references in i915 driver module
> and replace with drm buddy
> 
> v2:
>    - include header file in alphabetical order(Thomas)
>    - merged changes listed in the body section into a single patch
>      to keep the build intact(Christian, Jani)
> 
> v3:
>    - make drm buddy a separate module(Thomas, Christian)
> 
> v4:
>    - Fix build error reported by kernel test robot <lkp@intel.com>
>    - removed i915 buddy selftest from i915_mock_selftests.h to
>      avoid build error
>    - removed selftests/i915_buddy.c file as we create a new set of
>      buddy test cases in drm/selftests folder
> 
> v5:
>    - Fix merge conflict issue
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

<snip>

> +int drm_buddy_init(struct drm_buddy_mm *mm, u64 size, u64 chunk_size)
> +{
> +	unsigned int i;
> +	u64 offset;
> +
> +	if (size < chunk_size)
> +		return -EINVAL;
> +
> +	if (chunk_size < PAGE_SIZE)
> +		return -EINVAL;
> +
> +	if (!is_power_of_2(chunk_size))
> +		return -EINVAL;
> +
> +	size = round_down(size, chunk_size);
> +
> +	mm->size = size;
> +	mm->avail = size;
> +	mm->chunk_size = chunk_size;
> +	mm->max_order = ilog2(size) - ilog2(chunk_size);
> +
> +	BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
> +
> +	mm->slab_blocks = KMEM_CACHE(drm_buddy_block, 0);
> +	if (!mm->slab_blocks)
> +		return -ENOMEM;

It looks like every KMEM_CACHE() also creates a debugfs entry? See the 
error here[1]. I guess because we end with multiple instances in i915. 
If so, is it possible to have a single KMEM_CACHE() as part of the buddy 
module, similar to what i915 was doing previously?

[1] 
https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_8217/shard-skl4/igt@i915_selftest@mock@memory_region.html
