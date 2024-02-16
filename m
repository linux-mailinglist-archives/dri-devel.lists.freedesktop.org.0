Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 784A6857B3F
	for <lists+dri-devel@lfdr.de>; Fri, 16 Feb 2024 12:11:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F3C10E5C7;
	Fri, 16 Feb 2024 11:11:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="V1aXSv9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68D3810E56E;
 Fri, 16 Feb 2024 11:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708081892; x=1739617892;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=fuakVQ+w5J5dRCD3xndm2lf2GT+CZM+1xiGreXTQAl4=;
 b=V1aXSv9navUiYZl/Re8edZ/cgICuDxhtXtj3okSQrptOqZgueCKMJ9QI
 w4dS+CUVyE+wgrNknK4vzaMvs9EreBwn4VM91tZxYc34gXq0+oCY/U/qo
 +gYTUo10gHtYaPYCl+wt2dbXDYZ3dRoq/mWBkx0LeFPazz8uuvIjhnltQ
 hY0qxhj64pKf26+fGY21XkTiNBfQboaEbsSA9Pwnm1TiC6GhX3+jdCx+O
 tFE+AZlAWyPy8RNNOVZy9+D4uNt9UcPB8YUbdvW2Y6VJ/GSNKiYWFP3rj
 adIIhVE2fOWLBndBcpti9vsvXdxcOefNc4aAnJh1PqqqKe5H2Rg6HGRDu w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10985"; a="13310601"
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; d="scan'208";a="13310601"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 03:11:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,164,1705392000"; 
   d="scan'208";a="4105486"
Received: from fcrowe-mobl2.ger.corp.intel.com (HELO [10.252.21.243])
 ([10.252.21.243])
 by fmviesa006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2024 03:11:28 -0800
Message-ID: <bb158180-c354-458b-8aab-bb224bcb3fbc@intel.com>
Date: Fri, 16 Feb 2024 11:11:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Modify duplicate list_splice_tail call
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com, spasswolf@web.de, stable@vger.kernel.org
References: <20240216100048.4101-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240216100048.4101-1-Arunpravin.PaneerSelvam@amd.com>
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

On 16/02/2024 10:00, Arunpravin Paneer Selvam wrote:
> Remove the duplicate list_splice_tail call when the
> total_allocated < size condition is true.
> 
> Cc: <stable@vger.kernel.org> # 6.7+
> Fixes: 8746c6c9dfa3 ("drm/buddy: Fix alloc_range() error handling code")
> Reported-by: Bert Karwatzki <spasswolf@web.de>
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index c1a99bf4dffd..c4222b886db7 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -538,13 +538,13 @@ static int __alloc_range(struct drm_buddy *mm,
>   		list_add(&block->left->tmp_link, dfs);
>   	} while (1);
>   
> -	list_splice_tail(&allocated, blocks);
> -
>   	if (total_allocated < size) {
>   		err = -ENOSPC;
>   		goto err_free;
>   	}
>   
> +	list_splice_tail(&allocated, blocks);

Sigh. Can we extend the unit test(s) to catch this?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>

> +
>   	return 0;
>   
>   err_undo:
> 
> base-commit: a64056bb5a3215bd31c8ce17d609ba0f4d5c55ea
