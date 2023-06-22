Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DA7173A0CB
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 14:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AD8E10E553;
	Thu, 22 Jun 2023 12:25:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 495D510E54F;
 Thu, 22 Jun 2023 12:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687436713; x=1718972713;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=VFIhXIMBVxone3gWtsN0Ctk34JSxSUHhD8XO85Zqc1I=;
 b=GXshRkI4uhp6AzWebiug5rLk6WzRjwsEqe1+p0b03Stg2Tk6C885zFAa
 jnT2pknAyGGGAsEKiO/OVLNCcOPKGdGKSR0m1jMP1G6TvTblkcBPsURxS
 GqbpoGVqozxClTEBpOTe/MgDjMo85WvAwiHllXbszFUuid8FgY6Hh4KOF
 E6VN/QglqnDyZ0MpGfdt0kCU5COaRSI2R9sAXYQYGaytdoXdGJwvDQNFj
 crw7yS3Hg2vddyXRPFpQXhXenxZP5LHpsYtMXCS7O+5aoqh1npjmcwmQg
 t237xOekYXObGNYDk2mlLNBGehByTnVO8f85Rnl+ocYUyMu3WKLKNMcCx A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360489512"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="360489512"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:25:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="839028264"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="839028264"
Received: from nirmoyda-mobl.ger.corp.intel.com (HELO [10.249.46.93])
 ([10.249.46.93])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 05:25:09 -0700
Message-ID: <206f92ee-ed18-a503-6119-bc03779cd516@linux.intel.com>
Date: Thu, 22 Jun 2023 14:25:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 3/4] drm/ttm: Don't leak a resource on eviction error
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
 <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
From: Nirmoy Das <nirmoy.das@linux.intel.com>
In-Reply-To: <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
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
Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Huang Rui <ray.huang@amd.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 6/22/2023 12:14 PM, Thomas Hellström wrote:
> On eviction errors other than -EMULTIHOP we were leaking a resource.
> Fix.
>
> Fixes: 403797925768 ("drm/ttm: Fix multihop assert on eviction.")
> Cc: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Christian Koenig <christian.koenig@amd.com>
> Cc: Huang Rui <ray.huang@amd.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.15+
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>

> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++++++--------
>   1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 615d30c4262d..89530f2a027f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -462,14 +462,14 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>   	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>   	if (ret == -EMULTIHOP) {
>   		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
> -		if (ret) {
> -			if (ret != -ERESTARTSYS && ret != -EINTR)
> -				pr_err("Buffer eviction failed\n");
> -			ttm_resource_free(bo, &evict_mem);
> -			goto out;
> -		}
> -		/* try and move to final place now. */
> -		goto bounce;
> +		if (!ret)
> +			/* try and move to final place now. */
> +			goto bounce;
> +	}
> +	if (ret) {
> +		ttm_resource_free(bo, &evict_mem);
> +		if (ret != -ERESTARTSYS && ret != -EINTR)
> +			pr_err("Buffer eviction failed\n");
>   	}
>   out:
>   	return ret;
