Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1B22851495
	for <lists+dri-devel@lfdr.de>; Mon, 12 Feb 2024 14:16:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD01810ED73;
	Mon, 12 Feb 2024 13:16:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MUkunyN2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 137A110ED6B;
 Mon, 12 Feb 2024 13:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707743764; x=1739279764;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=PP6/AXI8N1ZB7uTahkyJ97Bokj8Vg9DEe3iPYyte3eE=;
 b=MUkunyN2sOSRhhjrc2mxlMgL/ET8FzZBx1ZGFI8prOAZeQ7IvcfYURAt
 /IBBjXuZ5EUFvfL7K0V8nGXcsHpFgMhMOfRhy0SiRTT1SYnu2FOQcAiaq
 5JGm8SeOjb5qbjE3kNKl7VNWdpmJbdl8frMDJaDi6HXcaAW+c8GkeW4Bu
 36CIj395WZOycWgPBFMrvMmADuviH6X3kuPwe0jDnLyC83LYSc0BLQBWY
 vqIis7hiRLV01XlSQnD/JCthDYbXoEEGjgh77VE19EHNDi04P0DgV3oCk
 JV7EZTN0Alkb89SMNyBO1NMv6dLmc93OjvAnwk8Z4SK2D8ZKRptTn6UsD A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10981"; a="13092583"
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; d="scan'208";a="13092583"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 05:16:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,263,1705392000"; 
   d="scan'208";a="2561132"
Received: from belyakov-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.63.91])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 05:15:59 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Stephen Rothwell <sfr@canb.auug.org.au>, Daniel Vetter
 <daniel.vetter@ffwll.ch>
Cc: Christian =?utf-8?Q?K=C3=B6nig?= <christian.koenig@amd.com>, Somalapuram
 Amaranath <Amaranath.Somalapuram@amd.com>, Intel Graphics
 <intel-gfx@lists.freedesktop.org>, DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Next
 Mailing List <linux-next@vger.kernel.org>, zack.rusin@broadcom.com,
 tzimmermann@suse.de, thomas.hellstrom@linux.intel.com, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@linux.intel.com>
Subject: Re: linux-next: build failure after merge of the drm-misc tree
In-Reply-To: <20240206152850.333f620d@canb.auug.org.au>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20240206152850.333f620d@canb.auug.org.au>
Date: Mon, 12 Feb 2024 15:15:54 +0200
Message-ID: <87y1bp962d.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 06 Feb 2024, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (i386 defconfig)
> failed like this:
>
> In function 'i915_ttm_placement_from_obj',
>     inlined from 'i915_ttm_get_pages' at drivers/gpu/drm/i915/gem/i915_gem_ttm.c:847:2:
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:165:18: error: 'places[0].flags' is used uninitialized [-Werror=uninitialized]
>   165 |         places[0].flags |= TTM_PL_FLAG_DESIRED;
>       |         ~~~~~~~~~^~~~~~
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c: In function 'i915_ttm_get_pages':
> drivers/gpu/drm/i915/gem/i915_gem_ttm.c:837:26: note: 'places' declared here
>   837 |         struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
>       |                          ^~~~~~
>
> Caused by commit
>
>   a78a8da51b36 ("drm/ttm: replace busy placement with flags v6")

Cc: more people.

>
> I applied the following hack for today:
>
> From: Stephen Rothwell <sfr@canb.auug.org.au>
> Date: Tue, 6 Feb 2024 15:17:54 +1100
> Subject: [PATCH] drm/ttm: initialise places
>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>
> ---
>  drivers/gpu/drm/i915/gem/i915_gem_ttm.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> index 80c6cafc8887..34e699e67c25 100644
> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
> @@ -834,7 +834,7 @@ static int __i915_ttm_get_pages(struct drm_i915_gem_object *obj,
>  
>  static int i915_ttm_get_pages(struct drm_i915_gem_object *obj)
>  {
> -	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1];
> +	struct ttm_place places[I915_TTM_MAX_PLACEMENTS + 1] = {};
>  	struct ttm_placement placement;
>  
>  	/* restricted by sg_alloc_table */
> -- 
> 2.43.0

-- 
Jani Nikula, Intel
