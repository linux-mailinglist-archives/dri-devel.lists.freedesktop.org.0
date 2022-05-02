Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E96B5174CA
	for <lists+dri-devel@lfdr.de>; Mon,  2 May 2022 18:45:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EF9D10F124;
	Mon,  2 May 2022 16:45:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 261C910F12D;
 Mon,  2 May 2022 16:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651509941; x=1683045941;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=urEYlcJWHthvNZxMK8DIFey3lc2i6h8I94/72RJ3Cts=;
 b=adDkxFln8xC4wXaQbDBdueSlLwxSTRLufTIuZ+LsC7QqyBc7RNC4oGr/
 0r1XrUsCnqW/gpLCol4lA8NYc4RuZIJNgTmKmpPU4QZibEZ4WkjYtzkr1
 L8nPLkOXRSuoh4PC38A/VjzBgxGh1xmN1cLPdE2kpMEt74/0H35RuOvwq
 c+W8k7akuSJun+WTyKeIiuCvP/3ARaXDL42dWRdu0OUWefVvwT0eq74PG
 jKD7WK3m5OvvJIiv4YCwzjzysNwWMnX6k+iQNWnCH9LAZGB7Y6c9OFsN9
 o6HgI1bAYZ5iX9h/dQBOTJ0Jnhdea5UMMh8eIiMaJR43YUxdqrjtEiEFX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10335"; a="267135257"
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="267135257"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:45:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,192,1647327600"; d="scan'208";a="561813232"
Received: from wagoleb-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.155.30])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2022 09:45:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ramalingam C <ramalingam.c@intel.com>, intel-gfx
 <intel-gfx@lists.freedesktop.org>, dri-devel
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH v3 1/3] drm/i915/gt: BUG_ON unexpected NULL at
 scatterlist walking
In-Reply-To: <20220502142618.2704-2-ramalingam.c@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220502142618.2704-1-ramalingam.c@intel.com>
 <20220502142618.2704-2-ramalingam.c@intel.com>
Date: Mon, 02 May 2022 19:45:35 +0300
Message-ID: <87v8unrihc.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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
Cc: Matthew Auld <matthew.auld@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 02 May 2022, Ramalingam C <ramalingam.c@intel.com> wrote:
> While locating the start of ccs scatterlist in smem scatterlist, that has
> to be the size of lmem obj size + corresponding ccs data size, report bug
> if scatterlist terminate before that length.
>
> v2:
>   s/GEM_BUG_ON/BUG_ON with more commenting [Matt]
> v3:
>   Converted GEM_BUG_ON into BUG_ON with more documentation [Matt]
>
> Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
> Reviewed-by: Matthew Auld <matthew.auld@intel.com> (v1)
> ---
>  drivers/gpu/drm/i915/gt/intel_migrate.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_migrate.c b/drivers/gpu/drm/i915/gt/intel_migrate.c
> index 9d552f30b627..168d17b6f48a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_migrate.c
> +++ b/drivers/gpu/drm/i915/gt/intel_migrate.c
> @@ -687,6 +687,16 @@ static void get_ccs_sg_sgt(struct sgt_dma *it, u32 bytes_to_cpy)
>  		bytes_to_cpy -= len;
>  
>  		it->sg = __sg_next(it->sg);
> +
> +		/*
> +		 * On Flat-CCS capable platform when we back the lmem pages with
> +		 * smem pages we add extra pages at the end of the smem
> +		 * scatterlist, to store the ccs data corresponding to the lmem
> +		 * pages. get_ccs_sg_sgt() is called to get the pointer for the
> +		 * start of the extra pages added at the end of smem scatterlist.
> +		 * So scatterlist can't end at or before bytes_to_cpy.
> +		 */
> +		BUG_ON(!it->sg);

Why would you have to bring the entire kernel down in this case? Why not
just let it oops on the NULL pointer dereference?

I'd prefer nuking *all* of the current BUG/BUG_ON in the driver, and not
add any single one back.


BR,
Jani.


>  		it->dma = sg_dma_address(it->sg);
>  		it->max = it->dma + sg_dma_len(it->sg);
>  	} while (bytes_to_cpy);
> @@ -748,8 +758,10 @@ intel_context_migrate_copy(struct intel_context *ce,
>  		 * Need to fix it.
>  		 */
>  		ccs_bytes_to_cpy = src_sz != dst_sz ? GET_CCS_BYTES(i915, bytes_to_cpy) : 0;
> -		if (ccs_bytes_to_cpy)
> +		if (ccs_bytes_to_cpy) {
> +			WARN_ON(abs(src_sz - dst_sz) < ccs_bytes_to_cpy);
>  			get_ccs_sg_sgt(&it_ccs, bytes_to_cpy);
> +		}
>  	}
>  
>  	src_offset = 0;

-- 
Jani Nikula, Intel Open Source Graphics Center
