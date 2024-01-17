Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3F14830367
	for <lists+dri-devel@lfdr.de>; Wed, 17 Jan 2024 11:19:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A7E410E69C;
	Wed, 17 Jan 2024 10:19:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB93610E67F;
 Wed, 17 Jan 2024 10:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705486749; x=1737022749;
 h=message-id:date:mime-version:subject:to:references:from:
 in-reply-to:content-transfer-encoding;
 bh=J9e0vLSPrHRF568dbLk8a5ROSRYupcGI6XoVeFLTwlY=;
 b=bLvcZi9M5wlF7QItKnJpZAWyqfNGH7GN6vtOXl2FywY1uO3ZQswKtDbZ
 7o83pYvhDXW3M7jYnjwEHhlUvO/E1h0Z84cowtkKbcPUa1kA/Ou+HwEtN
 eONekWKvYKXIgnAKkvpqJ/vODeJn63y6U3haVZLLWAP+LlWjZfwBphNHi
 DvIjO4Ujhx8VCI/FDUnzgkshRsosDBIDQpHZn6peOPI+ojfU6QQ7v8xtg
 n3Uu7MTg4gGQiyN3n4TNU3lqDOfKFuxQXccv3rdCdUwe6CeGC+HxuXFAx
 bQ+4m/fyoltB9lnosYPZ3QjvKidQNDABzopp/P5gRSqve8uFA4f/VxjF5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="390581281"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="390581281"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:19:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10955"; a="1031310006"
X-IronPort-AV: E=Sophos;i="6.05,200,1701158400"; d="scan'208";a="1031310006"
Received: from clanggaa-mobl.ger.corp.intel.com (HELO [10.249.254.57])
 ([10.249.254.57])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2024 02:19:06 -0800
Message-ID: <07a6552a-19e7-404d-8711-aff0cea8a36c@linux.intel.com>
Date: Wed, 17 Jan 2024 11:18:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] drm/ttm: return ENOSPC from ttm_bo_mem_space
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, jani.nikula@linux.intel.com,
 kherbst@redhat.com, lyude@redhat.com, zackr@vmware.com,
 michel.daenzer@mailbox.org
References: <20240112125158.2748-1-christian.koenig@amd.com>
 <20240112125158.2748-3-christian.koenig@amd.com>
From: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240112125158.2748-3-christian.koenig@amd.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On 1/12/24 13:51, Christian König wrote:
> Only convert it to ENOMEM in ttm_bo_validate.
>
> This allows ttm_bo_validate to distinct between an out of memory
NIT: s/distinct/distinguish/
> situation and just out of space in a placement domain.

In fact it would be nice if this could be propagated back to drivers as 
well at some point, but then perhaps guarded with a flag in the 
operation context.

In any case

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>

>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index edf10618fe2b..8c1eaa74fa21 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -830,7 +830,7 @@ int ttm_bo_mem_space(struct ttm_buffer_object *bo,
>   			goto error;
>   	}
>   
> -	ret = -ENOMEM;
> +	ret = -ENOSPC;
>   	if (!type_found) {
>   		pr_err(TTM_PFX "No compatible memory type found\n");
>   		ret = -EINVAL;
> @@ -916,6 +916,9 @@ int ttm_bo_validate(struct ttm_buffer_object *bo,
>   		return -EINVAL;
>   
>   	ret = ttm_bo_move_buffer(bo, placement, ctx);
> +	/* For backward compatibility with userspace */
> +	if (ret == -ENOSPC)
> +		return -ENOMEM;
>   	if (ret)
>   		return ret;
>   
