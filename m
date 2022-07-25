Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D504657FEB1
	for <lists+dri-devel@lfdr.de>; Mon, 25 Jul 2022 14:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0FFA22E5;
	Mon, 25 Jul 2022 12:01:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76EABA22B0;
 Mon, 25 Jul 2022 12:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1658750495; x=1690286495;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=2Skp37xHfYn6Qtbnx2d7XyT4fHY9duDNucwQqz6MclA=;
 b=ld1p0n/BkouQ1Algwoqs2CWXyvnRqGzAnaulzBewnkBH37XJnkc5Sd7u
 iDoK6M/Z13DzhqQoP/40Crj477RA/r4Savdr+O/T6YCOJGyyHLRqKXabT
 2nA4+lXqcgRuAP/rRK35u6sYfa2fB9ajrfa4ZTHehhER84wCQZSrT8fYk
 3ie4VzWDYTS3+5osWVRli+IsALUe6IXLLgt9Rl0MAlpOPTqImovuChGd2
 bcPVXJ+9REIDBHaS1wlXbVBuvsjE2kSAnTkXzYKR07JSGR79RTBKJn7cA
 fqd4acIgYOIuZNpyRXrL4+Gu84zhwHEkXE1QNQwL8leUOZc2JavT7p4F3 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10418"; a="267453050"
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="267453050"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 05:01:34 -0700
X-IronPort-AV: E=Sophos;i="5.93,192,1654585200"; d="scan'208";a="632333406"
Received: from ahajda-mobl.ger.corp.intel.com (HELO [10.213.13.24])
 ([10.213.13.24])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jul 2022 05:01:29 -0700
Message-ID: <4539a508-0340-fcd1-f28c-bafaf91a5c32@intel.com>
Date: Mon, 25 Jul 2022 14:01:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.11.0
Subject: Re: [Intel-gfx] [PATCH v5 6/7] drm/i915: Use error code as -E2BIG
 when the size of gem ttm object is too large
Content-Language: en-US
To: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>,
 intel-gfx@lists.freedesktop.org
References: <20220725092528.1281487-1-gwan-gyeong.mun@intel.com>
 <20220725092528.1281487-7-gwan-gyeong.mun@intel.com>
From: Andrzej Hajda <andrzej.hajda@intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298
 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20220725092528.1281487-7-gwan-gyeong.mun@intel.com>
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
Cc: thomas.hellstrom@linux.intel.com, jani.nikula@intel.com,
 dri-devel@lists.freedesktop.org, chris@chris-wilson.co.uk, airlied@linux.ie,
 matthew.auld@intel.com, mchehab@kernel.org, nirmoy.das@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 25.07.2022 11:25, Gwan-gyeong Mun wrote:
> The ttm_bo_init_reserved() functions returns -ENOSPC if the size is too big
> to add vma. The direct function that returns -ENOSPC is drm_mm_insert_node_in_range().
> To handle the same error as other code returning -E2BIG when the size is
> too large, it converts return value to -E2BIG.
> 
> Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
> Cc: Chris Wilson <chris@chris-wilson.co.uk>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
> Reviewed-by: Mauro Carvalho Chehab <mchehab@kernel.org>

Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>

Regards
Andrzej
> ---
>   drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 88f2887627dc..4d478bf325be 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -1249,6 +1249,17 @@ int __i915_gem_ttm_object_init(struct intel_memory_region *mem,
>   	ret = ttm_bo_init_reserved(&i915->bdev, i915_gem_to_ttm(obj), bo_type,
>   				   &i915_sys_placement, page_size >> PAGE_SHIFT,
>   				   &ctx, NULL, NULL, i915_ttm_bo_destroy);
> +
> +	/*
> +	 * XXX: The ttm_bo_init_reserved() functions returns -ENOSPC if the size
> +	 * is too big to add vma. The direct function that returns -ENOSPC is
> +	 * drm_mm_insert_node_in_range(). To handle the same error as other code
> +	 * that returns -E2BIG when the size is too large, it converts -ENOSPC to
> +	 * -E2BIG.
> +	 */
> +	if (size >> PAGE_SHIFT > INT_MAX && ret == -ENOSPC)
> +		ret = -E2BIG;
> +
>   	if (ret)
>   		return i915_ttm_err_to_gem(ret);
>   

