Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A11E4448D8
	for <lists+dri-devel@lfdr.de>; Wed,  3 Nov 2021 20:18:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44FEF7A2C2;
	Wed,  3 Nov 2021 19:18:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E70F7A2C2;
 Wed,  3 Nov 2021 19:18:17 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="229027619"
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="229027619"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 12:18:16 -0700
X-IronPort-AV: E=Sophos;i="5.87,206,1631602800"; d="scan'208";a="729747463"
Received: from badunne-mobl5.ger.corp.intel.com (HELO [10.252.16.100])
 ([10.252.16.100])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2021 12:18:14 -0700
Message-ID: <7f2e05dd-eca4-0b4c-0239-b6f46f87a38f@intel.com>
Date: Wed, 3 Nov 2021 19:18:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 6/8] drm/i915: add free_unused_pages support to i915
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20211025130033.1547667-1-Arunpravin.PaneerSelvam@amd.com>
 <20211025130033.1547667-4-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20211025130033.1547667-4-Arunpravin.PaneerSelvam@amd.com>
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

On 25/10/2021 14:00, Arunpravin wrote:
> add drm_buddy_free_unused_pages() support on
> contiguous allocation
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> index 963468228392..162947af8e04 100644
> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
> @@ -98,6 +98,14 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>   	if (unlikely(err))
>   		goto err_free_blocks;
>   
> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
> +		err = drm_buddy_free_unused_pages(mm, (uint64_t)n_pages << PAGE_SHIFT,
> +						       &bman_res->blocks);
> +
> +		if (unlikely(err))
> +			goto err_free_blocks;

That needs some locking, mark_free/mark_split are all globally visible. 
Some concurrent user might steal the block, or worse.

> +	}
> +
>   	*res = &bman_res->base;
>   	return 0;
>   
> 
