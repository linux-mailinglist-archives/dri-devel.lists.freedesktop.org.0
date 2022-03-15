Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A5F4D9A67
	for <lists+dri-devel@lfdr.de>; Tue, 15 Mar 2022 12:31:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4FF310E3B5;
	Tue, 15 Mar 2022 11:31:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5814F10E3B5;
 Tue, 15 Mar 2022 11:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647343875; x=1678879875;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=iCs162XcE1/cnIipmN5m0bOdvbMF1WgSBo898ixy8XY=;
 b=jDpc4xOWB2tddrZbNVkd3G1ghy0lx2yW4i+Y3zkm436kY47qfNewR+pk
 5SrIv3+tUuQO4KZq0mWURTzJ/+4JpolsEntqkgzX1ZbyPCeckkTk+N8Y2
 6HVlVG/mP9EU2DZTjh/Jwh3rdVQ9HegNpLS9SQFM4WSmRumqzNAUMQIOy
 D1bJeZ+5UBOQM+IBO8hdRPHwK9wxKGtquCgsY6x6owu01PuC/VpLaBF5R
 vE5xpdVlDQswkuchxHp/BYprhAtdANpweO4iW1JtU7r02Nke8hdo2fyFx
 PtemvAf7hNqHJbS55J67k+fampFBhvp2xIiGPdeZ1qP2dDUbIMR/tjn8h w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10286"; a="319495739"
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="319495739"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 04:31:14 -0700
X-IronPort-AV: E=Sophos;i="5.90,183,1643702400"; d="scan'208";a="556883345"
Received: from sobyrne-mobl.ger.corp.intel.com (HELO [10.252.31.219])
 ([10.252.31.219])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2022 04:31:12 -0700
Message-ID: <01c75d44-80b1-3368-e568-0e38072138d6@intel.com>
Date: Tue, 15 Mar 2022 11:31:10 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] drm: Fix a infinite loop condition when order becomes 0
Content-Language: en-GB
To: Arunpravin <Arunpravin.PaneerSelvam@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
From: Matthew Auld <matthew.auld@intel.com>
In-Reply-To: <20220314194049.534471-1-Arunpravin.PaneerSelvam@amd.com>
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

On 14/03/2022 19:40, Arunpravin wrote:
> handle a situation in the condition order-- == min_order,
> when order = 0, leading to order = -1, it now won't exit
> the loop. To avoid this problem, added a order check in
> the same condition, (i.e) when order is 0, we return
> -ENOSPC
> 
> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>

Hmm, it sounded like we were instead going to go with the round_up(size, 
min_page_size), or check and bail if the size is misaligned, in which 
case we don't need this, AFAICT.

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
>   				err = -ENOSPC;
>   				goto err_free;
>   			}
