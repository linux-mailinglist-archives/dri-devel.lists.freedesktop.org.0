Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30CC88C87A9
	for <lists+dri-devel@lfdr.de>; Fri, 17 May 2024 16:00:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7160C10EEE1;
	Fri, 17 May 2024 14:00:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="aSFIUPEJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B191D10EEDD;
 Fri, 17 May 2024 14:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715954423; x=1747490423;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=bFAXHT50ams4TC/SbEQ14VrwLZtqyLx6NKDuEkkkSv8=;
 b=aSFIUPEJtOmuhkF3Tt75+G6jgZGBJ6R9vkMIk8ZTsIcrW/rtN60xQL9Z
 rveZBXt5qTlsybXLiI+pv0pOeiUxM0Vqb3peP94dTsrOn4ALdDVBHPZE9
 GcN0TDMW1NPdgfRvAu8KZYX07ZU3ofwUoCOQntehYUY81csevwoG7M086
 uxEaoum7mSHTzj2yZ2qmPg3TsqsT+cUn1q3PJ9jZAsJZJVguCcc1wk/tP
 RSaWSZ6QoLhQCfER14bx3tDpUYW+5Y5JdSu+5Vtzd+zlYmfLgd+zvGFCB
 BWDV4TTVtxmvcHb6Sd0ZSwIsqV+8Ym4SNYu9ZxCI1+rC7EicoXE1qD96A g==;
X-CSE-ConnectionGUID: HnxJ69c+RR+aAoQi8/Hrgw==
X-CSE-MsgGUID: oaDSpWP6TBWnhPEtO1JzJw==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="29648749"
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="29648749"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:00:22 -0700
X-CSE-ConnectionGUID: 1fuTqR/nSu+kwl5h/XF4gw==
X-CSE-MsgGUID: n0upUP5DQ2eHD0aRnGp4aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,167,1712646000"; d="scan'208";a="36319712"
Received: from dneilan-mobl1.ger.corp.intel.com (HELO [10.245.244.100])
 ([10.245.244.100])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 May 2024 07:00:20 -0700
Message-ID: <24ed2c40-99e4-4d8d-9cf2-1e1c4a1560b6@intel.com>
Date: Fri, 17 May 2024 15:00:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/buddy: Fix the warn on's during force merge
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com, airlied@gmail.com
References: <20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com>
Content-Language: en-GB
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240517135015.17565-1-Arunpravin.PaneerSelvam@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 17/05/2024 14:50, Arunpravin Paneer Selvam wrote:
> Move the fallback and block incompatible checks
> above, so that we dont unnecessarily split the blocks
> and leaving the unmerged. This resolves the unnecessary
> warn on's thrown during force_merge call.
> 
> v2:(Matthew)
>    - Move the fallback and block incompatible checks above
>      the contains check.
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Fixes: 96950929eb23 ("drm/buddy: Implement tracking clear page feature")
Reviewed-by: Matthew Auld <matthew.auld@intel.com>

A follow up unit test to catch this edge case would be lovely.

> ---
>   drivers/gpu/drm/drm_buddy.c | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 1daf778cf6fa..94f8c34fc293 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -524,11 +524,11 @@ __alloc_range_bias(struct drm_buddy *mm,
>   				continue;
>   		}
>   
> +		if (!fallback && block_incompatible(block, flags))
> +			continue;
> +
>   		if (contains(start, end, block_start, block_end) &&
>   		    order == drm_buddy_block_order(block)) {
> -			if (!fallback && block_incompatible(block, flags))
> -				continue;
> -
>   			/*
>   			 * Find the free block within the range.
>   			 */
