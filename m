Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27C344DAEEB
	for <lists+dri-devel@lfdr.de>; Wed, 16 Mar 2022 12:31:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5EA310E63E;
	Wed, 16 Mar 2022 11:31:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F0410E63E;
 Wed, 16 Mar 2022 11:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647430292; x=1678966292;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=5ulDPJh4He2dr0MKS4KyL5wIdLimF0wHrLul+ZUoWlE=;
 b=TPOV4m4GvqIcgtKEtqKdrtr1sIUgSiAKDFT0rqosbLeGWzrz92/J8yv5
 JqUXMjWNQjjSi0UWCCHh0IPx+RDjnh3xH32gaILq9Sho82/Z66O6u5ZRp
 iqGUeaiSmBM79/by+J5qkOCgUrf/0tia2UUplx3Qw0IP2fw5FK+MjmEca
 4k7ad3yxuxF6UwEZDhxjpkGbVppa3ApIP+9FoiPosowfnB57hPKv9IR0r
 PJZr66wmty5cUSkmZyhwvwoSqrteRP7DYJ8tmuE6Ex5G772IB4cBwkznC
 7+O3SnYPuxd7TGTDX4ncgdMu3VsYzeaT76CemanHD+maHUW6gdWGaoKR9 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="256281435"
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="256281435"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 04:31:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,186,1643702400"; d="scan'208";a="498398533"
Received: from ckrammel-mobl.ger.corp.intel.com (HELO [10.252.7.167])
 ([10.252.7.167])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Mar 2022 04:31:30 -0700
Message-ID: <7545037d-a60e-7935-67c7-f25a1b00b501@intel.com>
Date: Wed, 16 Mar 2022 11:31:27 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v2] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-GB
To: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220316063416.3051-1-Arunpravin.PaneerSelvam@amd.com>
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
Cc: alexander.deucher@amd.com, pmenzel@molgen.mpg.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 16/03/2022 06:34, Arunpravin Paneer Selvam wrote:
> handle a situation in the condition order-- == min_order,
> when order = 0 and min_order = 0, leading to order = -1,
> it now won't exit the loop. To avoid this problem,
> added a order check in the same condition, (i.e)
> when order is 0, we return -ENOSPC
> 
> v2: use full name in email program and in Signed-off tag
> 
> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
> ---
>   drivers/gpu/drm/drm_buddy.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
> index 72f52f293249..5ab66aaf2bbd 100644
> --- a/drivers/gpu/drm/drm_buddy.c
> +++ b/drivers/gpu/drm/drm_buddy.c
> @@ -685,7 +685,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>   			if (!IS_ERR(block))
>   				break;
>   
> -			if (order-- == min_order) {
> +			if (!order || order-- == min_order) {

It shouldn't be possible to enter an infinite loop here, without first 
tripping up the BUG_ON(order < min_order) further up, and for that, as 
we discussed here[1], it sounded like the conclusion was to rather add a 
simple check somewhere in drm_buddy_alloc_blocks() to reject any size 
not aligned to the min_page_size?

[1] https://patchwork.freedesktop.org/patch/477414/?series=101108&rev=1

>   				err = -ENOSPC;
>   				goto err_free;
>   			}
> 
> base-commit: 3bd60c0259406c5ca3ce5cdc958fb910ad4b8175
