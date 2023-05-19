Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 967D870A150
	for <lists+dri-devel@lfdr.de>; Fri, 19 May 2023 23:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE2C510E584;
	Fri, 19 May 2023 21:09:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A407610E584;
 Fri, 19 May 2023 21:09:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id EA7DB6181A;
 Fri, 19 May 2023 21:09:48 +0000 (UTC)
Received: from rdvivi-mobl4 (unknown [192.55.55.52])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by smtp.kernel.org (Postfix) with ESMTPSA id D1892C433D2;
 Fri, 19 May 2023 21:09:45 +0000 (UTC)
Date: Fri, 19 May 2023 17:09:43 -0400
From: Rodrigo Vivi <rodrigo.vivi@kernel.org>
To: Cong Liu <liucong2@kylinos.cn>
Subject: Re: [PATCH v2] drm/i915: Fix memory leaks in function live_nop_switch
Message-ID: <ZGfll+nLPL2L6Zyz@rdvivi-mobl4>
References: <20230508085016.437836-1-liucong2@kylinos.cn>
 <20230517050204.4111874-1-liucong2@kylinos.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230517050204.4111874-1-liucong2@kylinos.cn>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, May 17, 2023 at 01:02:03PM +0800, Cong Liu wrote:
> Be sure to properly free the allocated memory before exiting
> the live_nop_switch function.
> 
> Signed-off-by: Cong Liu <liucong2@kylinos.cn>
> Suggested-by: Rodrigo Vivi <rodrigo.vivi@intel.com>

pushed, thanks for the patch

> ---
>  .../gpu/drm/i915/gem/selftests/i915_gem_context.c  | 14 ++++++++------
>  1 file changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> index a81fa6a20f5a..2fb125d0cb5e 100644
> --- a/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> +++ b/drivers/gpu/drm/i915/gem/selftests/i915_gem_context.c
> @@ -66,7 +66,7 @@ static int live_nop_switch(void *arg)
>  		ctx[n] = live_context(i915, file);
>  		if (IS_ERR(ctx[n])) {
>  			err = PTR_ERR(ctx[n]);
> -			goto out_file;
> +			goto out_ctx;
>  		}
>  	}
>  
> @@ -82,7 +82,7 @@ static int live_nop_switch(void *arg)
>  			this = igt_request_alloc(ctx[n], engine);
>  			if (IS_ERR(this)) {
>  				err = PTR_ERR(this);
> -				goto out_file;
> +				goto out_ctx;
>  			}
>  			if (rq) {
>  				i915_request_await_dma_fence(this, &rq->fence);
> @@ -96,7 +96,7 @@ static int live_nop_switch(void *arg)
>  			intel_gt_set_wedged(to_gt(i915));
>  			i915_request_put(rq);
>  			err = -EIO;
> -			goto out_file;
> +			goto out_ctx;
>  		}
>  		i915_request_put(rq);
>  
> @@ -107,7 +107,7 @@ static int live_nop_switch(void *arg)
>  
>  		err = igt_live_test_begin(&t, i915, __func__, engine->name);
>  		if (err)
> -			goto out_file;
> +			goto out_ctx;
>  
>  		end_time = jiffies + i915_selftest.timeout_jiffies;
>  		for_each_prime_number_from(prime, 2, 8192) {
> @@ -120,7 +120,7 @@ static int live_nop_switch(void *arg)
>  				this = igt_request_alloc(ctx[n % nctx], engine);
>  				if (IS_ERR(this)) {
>  					err = PTR_ERR(this);
> -					goto out_file;
> +					goto out_ctx;
>  				}
>  
>  				if (rq) { /* Force submission order */
> @@ -165,7 +165,7 @@ static int live_nop_switch(void *arg)
>  
>  		err = igt_live_test_end(&t);
>  		if (err)
> -			goto out_file;
> +			goto out_ctx;
>  
>  		pr_info("Switch latencies on %s: 1 = %lluns, %lu = %lluns\n",
>  			engine->name,
> @@ -173,6 +173,8 @@ static int live_nop_switch(void *arg)
>  			prime - 1, div64_u64(ktime_to_ns(times[1]), prime - 1));
>  	}
>  
> +out_ctx:
> +	kfree(ctx);
>  out_file:
>  	fput(file);
>  	return err;
> -- 
> 2.34.1
> 
> 
> No virus found
> 		Checked by Hillstone Network AntiVirus
