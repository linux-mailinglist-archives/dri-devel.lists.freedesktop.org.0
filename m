Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9B5D73A241
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 15:55:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B18410E56A;
	Thu, 22 Jun 2023 13:55:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD04810E568;
 Thu, 22 Jun 2023 13:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687442131; x=1718978131;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RpQccSlwUHCOmo04t2dBa0xz+CX4hYUabFawymK3Ink=;
 b=DKHR9OMnauQcf0e1De+RXhMDyiYTz07xNarJm3LZvC57QlvMfCgvGPEs
 NnuIhPveiT6mFqf+BzvBlnv6WjYsHz+rVBhBhenpP6xDZ0DfKf/mNiVwD
 lIu3zg5u72cbOU8P1tK4SIuCn6dmT2U+T4N1ho361yZGyp+Gr3AzbOgAT
 zwisqPYm6wGkOxdD/JoOf9lRLOQgvE+5ZylrNQvTS4meSYJBevr3cHARl
 nFKXDRX4yIauWITL2inbECNJ6uZ+nRSbSfDtk32NXzpdIVfWANZCC13tQ
 4HZ6NcItAj3XB7XRyl+1qzzrMytExL0Am4i4S1kVQpH1U491OoYr44qzb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="360510745"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="360510745"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 06:55:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="714921765"
X-IronPort-AV: E=Sophos;i="6.01,263,1684825200"; d="scan'208";a="714921765"
Received: from akivisil-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.215.96])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 06:55:26 -0700
Date: Thu, 22 Jun 2023 15:55:22 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>
Subject: Re: [Intel-gfx] [PATCH 3/4] drm/ttm: Don't leak a resource on
 eviction error
Message-ID: <ZJRSyp7fT6VXpow7@ashyti-mobl2.lan>
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
 <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230622101412.78426-4-thomas.hellstrom@linux.intel.com>
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
 Christian =?iso-8859-15?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 Huang Rui <ray.huang@amd.com>, dri-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Thu, Jun 22, 2023 at 12:14:11PM +0200, Thomas Hellström wrote:
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
> ---
>  drivers/gpu/drm/ttm/ttm_bo.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index 615d30c4262d..89530f2a027f 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -462,14 +462,14 @@ static int ttm_bo_evict(struct ttm_buffer_object *bo,
>  	ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
>  	if (ret == -EMULTIHOP) {
>  		ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem, ctx, &hop);
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

As we are at this, can't we replace this with a while()? Goto's
used instead of a while loop are a fist in the eye...

It looks even better:

	while (1) {
		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, ctx, &hop);
		if (!ret)
			break;

		if (ret == -EMULTIHOP)
			ret = ttm_bo_bounce_temp_buffer(bo, &evict_mem,
							ctx, &hop);

		/* try again */
		if (!ret)
			continue;

		ttm_resource_free(bo, &evict_mem);
		if (ret != -ERESTARTSYS && ret != -EINTR)
			pr_err("Buffer eviction failed\n");

		break;
	}

Andi

> +	}
> +	if (ret) {
> +		ttm_resource_free(bo, &evict_mem);
> +		if (ret != -ERESTARTSYS && ret != -EINTR)
> +			pr_err("Buffer eviction failed\n");
>  	}
>  out:
>  	return ret;
> -- 
> 2.40.1
