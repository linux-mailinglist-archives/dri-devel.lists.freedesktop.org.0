Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2856784E1FD
	for <lists+dri-devel@lfdr.de>; Thu,  8 Feb 2024 14:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5775D10E764;
	Thu,  8 Feb 2024 13:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="M9kWlUnj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19D6210E733;
 Thu,  8 Feb 2024 13:30:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707399049; x=1738935049;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=YWeI1A9Im4huIrBy0LBA6kj4V3hbKIAlawfmey53Ys0=;
 b=M9kWlUnjoBzTzQO4qR3FAhcwtBPyGjU9DGhYVvjurT/ppgq8lfY19EFk
 PkI8BYWaI5Wj2dHsVHAYqyBWm6djrsHIIZC6u20FPTEYame/a06lv5M1o
 scTJlPv4ODm4MfN4WAHO/msZoHDc63tZ2iSmjHNHRyxY3EH2A2YleR8D6
 VpY46/x3VlMqNoF22zOoCMkWoNDyeib8JkAwA4hHVY0aoVKQhkpxrZ/Tf
 YCGdS2OZUol2dYZBFGY6YjLrw3wrUOOv2vRhC3zvoZhVc+dLAB/PjXb1i
 bASmYMx5nDUnQzU6gGP3Ns65cVY1lShmbxLd76QtyP8GwZr1zYmbAnyRD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10977"; a="395628941"
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; d="scan'208";a="395628941"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:30:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,253,1701158400"; 
   d="scan'208";a="1987738"
Received: from pkawa-mobl.ger.corp.intel.com (HELO [10.252.20.188])
 ([10.252.20.188])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Feb 2024 05:30:47 -0800
Message-ID: <c5d75c40-7fb4-44a4-8ea5-327385f88004@intel.com>
Date: Thu, 8 Feb 2024 13:30:44 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/buddy: Fix alloc_range() error handling code
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org
Cc: christian.koenig@amd.com, alexander.deucher@amd.com,
 mario.limonciello@amd.com
References: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20240207174456.341121-1-Arunpravin.PaneerSelvam@amd.com>
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

On 07/02/2024 17:44, Arunpravin Paneer Selvam wrote:
> Few users have observed display corruption when they boot
> the machine to KDE Plasma or playing games. We have root
> caused the problem that whenever alloc_range() couldn't
> find the required memory blocks the function was returning
> SUCCESS in some of the corner cases.

Can you please give an example here?

> 
> The right approach would be if the total allocated size
> is less than the required size, the function should
> return -ENOSPC.
> 
> Gitlab ticket link - https://gitlab.freedesktop.org/drm/amd/-/issues/3097
> Fixes: 0a1844bf0b53 ("drm/buddy: Improve contiguous memory allocation")
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> Tested-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index f57e6d74fb0e..c1a99bf4dffd 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -539,6 +539,12 @@ static int __alloc_range(struct drm_buddy *mm,
>   	} while (1);
>   
>   	list_splice_tail(&allocated, blocks);
> +
> +	if (total_allocated < size) {
> +		err = -ENOSPC;
> +		goto err_free;
> +	}
> +
>   	return 0;
>   
>   err_undo:
