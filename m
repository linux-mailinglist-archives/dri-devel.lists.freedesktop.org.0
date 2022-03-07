Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362694D01B3
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 15:45:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BB1110E146;
	Mon,  7 Mar 2022 14:45:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F8AC10E13C;
 Mon,  7 Mar 2022 14:45:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646664348; x=1678200348;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=KYdedZKsN/8uGL6jG2r23x2DKqGVvfmm8ZNk9lQLr4c=;
 b=aHP3P0PjjPqwklhnENNdh0drIaGj2q3pxxql9uNCfUUdhc/d5E/zwh8W
 g1tPLhxfi6QsQbz1nCSdqH/gty/DudfYlXAmilYjPzofwf3MWog6WxEKi
 kLM2fHISit/5p7eU1192TonjZLv4E9lBQiORAqKlPYh/KrOmMGYeHvNNv
 ZBkm4R0SYeEQoX1OyGAfHgmURYqvKAc5/3AvuI4j9brVbgsOmqmrx2YBH
 CpggIkMiLCRmUgEzVqwxfgFjx2c6u13c1gAi+C0L7GZr+6r3OC/+bMkk5
 vJkLhvH5EPdzF55rdXy7wpy5DJhWD6nlmUtr6kNmigL/wQTkLDZzVUoDZ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10278"; a="254596046"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="254596046"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:45:47 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="643270081"
Received: from hazimham-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.27.252])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 06:45:44 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Subject: Re: [Intel-gfx] [PATCH] drm: remove min_order BUG_ON check
In-Reply-To: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
Date: Mon, 07 Mar 2022 16:45:37 +0200
Message-ID: <874k493jou.fsf@intel.com>
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com, christian.koenig@amd.com,
 Arunpravin <Arunpravin.PaneerSelvam@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 07 Mar 2022, Arunpravin <Arunpravin.PaneerSelvam@amd.com> wrote:
> place BUG_ON(order < min_order) outside do..while
> loop as it fails Unigine Heaven benchmark.
>
> Unigine Heaven has buffer allocation requests for
> example required pages are 161 and alignment request
> is 128. To allocate the remaining 33 pages, continues
> the iteration to find the order value which is 5 and
> when it compares with min_order = 7, enables the
> BUG_ON(). To avoid this problem, placed the BUG_ON
> check outside of do..while loop.

How about turning these BUG_ON()s to WARN_ON()s with an error return?
What's the point in oopsing?

BR,
Jani.


>
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>  drivers/gpu/drm/drm_buddy.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..ed94c56b720f 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>  	order = fls(pages) - 1;
>  	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>  
> +	BUG_ON(order < min_order);
> +
>  	do {
>  		order = min(order, (unsigned int)fls(pages) - 1);
>  		BUG_ON(order > mm->max_order);
> -		BUG_ON(order < min_order);
>  
>  		do {
>  			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
>
> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b

-- 
Jani Nikula, Intel Open Source Graphics Center
