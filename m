Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D295C4D0455
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 17:42:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9A6610E087;
	Mon,  7 Mar 2022 16:42:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B9210E086;
 Mon,  7 Mar 2022 16:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646671347; x=1678207347;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=s0NoDX1VtPJKAdo+1GksrlvYVNf+UImED0itv2byKcM=;
 b=nqpyli8xqEPfqInjq5awl/7V7xSWVAdpBil8kKTNN0l8ktMCGy7hZ62T
 nFXW3MoW3odzTaCJDQZS5W/GLUEU8rTzpjSf7KOmNd4/R5AxiUzRk5JPo
 CnQMj9epbTbz8t/ph8/IiH6ffA/5jC0Q5VB6vr+jLpquVL/neqy9LDuk8
 mWkxUP9M7C3iuVHUD8Bi4kLdI5iZKIdV6rv7i+lKt7bNjUQHNpGQCGQ2G
 shgBZt+BXCHgI5egA9mc3sp0VlJTbm3WBYGU/MltFIweJKjk9gNifznp+
 alhsNAiSZl2Q1EaLGurNMraGhHCNq5zCwZAv4WCkKN7G65DeneYZunjxd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10279"; a="241873520"
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="241873520"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:41:46 -0800
X-IronPort-AV: E=Sophos;i="5.90,162,1643702400"; d="scan'208";a="780382147"
Received: from aaronmux-mobl.ger.corp.intel.com (HELO [10.252.2.25])
 ([10.252.2.25])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2022 08:41:44 -0800
Message-ID: <78232c15-0d0c-3594-ab59-63560e63eb4e@intel.com>
Date: Mon, 7 Mar 2022 16:41:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: remove min_order BUG_ON check
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
References: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220307143707.3687-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 07/03/2022 14:37, Arunpravin wrote:
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
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..ed94c56b720f 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -669,10 +669,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   	order = fls(pages) - 1;
>   	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>   
> +	BUG_ON(order < min_order);

Isn't the issue that we are allowing a size that is not aligned to the 
requested min_page_size? Should we not fix the caller(and throw a normal 
error here), or perhaps add the round_up() here instead?

i.e if someone does:

alloc_blocks(mm, 0, end, 4096, 1<<16, &blocks, flags);

This will still trigger the BUG_ON() even if we move it out of the loop, 
AFAICT.

> +
>   	do {
>   		order = min(order, (unsigned int)fls(pages) - 1);
>   		BUG_ON(order > mm->max_order);
> -		BUG_ON(order < min_order);
>   
>   		do {
>   			if (flags & DRM_BUDDY_RANGE_ALLOCATION)
> 
> base-commit: 8025c79350b90e5a8029234d433578f12abbae2b
