Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D6E87227D0
	for <lists+dri-devel@lfdr.de>; Mon,  5 Jun 2023 15:47:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 892A410E29F;
	Mon,  5 Jun 2023 13:47:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F0B510E29F;
 Mon,  5 Jun 2023 13:47:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685972869; x=1717508869;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pc0PP/0VU8hPz88rgPCZHCe9veRH3TDuhBiQ70XwYp8=;
 b=YI/WWjULw54GZx8ThJJ3ACi9yVJZxF+gIPIBsU6isijr3WtGSOhzVrQy
 /MItIXA0CtT+QbqgzbzZMg6US5Gkr19OBvY4DIebs+yu1w8V+7Z/yPhTm
 pAy3DETdImFd3iZIxvZQMpfJUbdQpWckvDiSWdphLYNGP/mVB73VRRveD
 nccRXSU5nN0dVynp4/TN9K5fuaDKd1KaVZtxW6INnRKvpA6RlPhBdlgtq
 DoeiBIZ2w1HyayZhSqCtYvSBJ6ZLZhvAi4dKGjWy3Z+RjuKCsTvPUwEbP
 368HDD48BkCIrRVWmvdHydv2mYWhWj6VsQw0CaEaKU+YL6HQtG7NoBHBU g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="355224252"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="355224252"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 06:47:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="702757821"
X-IronPort-AV: E=Sophos;i="6.00,217,1681196400"; d="scan'208";a="702757821"
Received: from twgeistx-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.249.42.176])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 06:47:45 -0700
Date: Mon, 5 Jun 2023 15:47:30 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftests: Add some missing error propagation
Message-ID: <ZH3ncqduEdlMRh98@ashyti-mobl2.lan>
References: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605131135.396854-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>, Intel-gfx@lists.freedesktop.org,
 Dan Carpenter <dan.carpenter@linaro.org>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tvrtko,

> Add some missing error propagation in live_parallel_switch.
> 
> To avoid needlessly burdening the various backport processes, note I am
> not marking it as a fix against any patches and not copying stable since
> it is debug/selftests only code.

which I did :/

But I guess you are right and it's not necessary.

> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> ---
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 ++++++++++----
>  1 file changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index ad6a3b2fb387..7021b6e9b219 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -348,8 +348,10 @@ static int live_parallel_switch(void *arg)
>  				continue;
>  
>  			ce = intel_context_create(data[m].ce[0]->engine);
> -			if (IS_ERR(ce))
> +			if (IS_ERR(ce)) {
> +				err = PTR_ERR(ce);
>  				goto out;
> +			}
>  
>  			err = intel_context_pin(ce);
>  			if (err) {
> @@ -369,8 +371,10 @@ static int live_parallel_switch(void *arg)
>  
>  		worker = kthread_create_worker(0, "igt/parallel:%s",
>  					       data[n].ce[0]->engine->name);
> -		if (IS_ERR(worker))
> +		if (IS_ERR(worker)) {
> +			err = PTR_ERR(worker);
>  			goto out;
> +		}
>  
>  		data[n].worker = worker;
>  	}
> @@ -399,8 +403,10 @@ static int live_parallel_switch(void *arg)
>  			}
>  		}
>  
> -		if (igt_live_test_end(&t))
> -			err = -EIO;
> +		if (igt_live_test_end(&t)) {
> +			err = err ?: -EIO;

Nice catch!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com> 

Andi

> +			break;
> +		}
>  	}
>  
>  out:
> -- 
> 2.39.2
