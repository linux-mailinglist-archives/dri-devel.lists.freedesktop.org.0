Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 552154CDF9D
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 22:12:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 297FD11398A;
	Fri,  4 Mar 2022 21:12:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AD50113989;
 Fri,  4 Mar 2022 21:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646428322; x=1677964322;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=ykWgWP/GD+9Jm+IbipK2/JYt9vytoc4D+hbYU5DMUts=;
 b=OAUW3v77eFOtx/VbEwwIfxzpFpM4oxNfOhoxzD2sHb7iDfLjwwktOKVp
 aOzPRybm503swIu0ZSynhszesmSn2QHjZdHHf5t272Du+DC1PPRcVFn19
 oL2hd+VENcyQNMSu0ZgdQrh1kTObTiqH3dtu07L9Iw9nzIcSODD3uCFzR
 tiI9KGl99VsHceS+Xe4Vzr/kOKqZRLqJ/o2TOMud4Y/v1KgVQx5Yl+u7A
 MFVF0kXzEYqbjvGnTftVJt4PHkkjK9duCF53k+IibhqLSnViRgpwla8cm
 viXvSWzta+tqnCEiXqtPjN2DL5SzM6mfe+8JaUVvoS0HbN2XhCpwkvk8S A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10276"; a="251639952"
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="251639952"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2022 13:12:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,156,1643702400"; d="scan'208";a="552369587"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by orsmga008.jf.intel.com with SMTP; 04 Mar 2022 13:11:54 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 04 Mar 2022 23:11:54 +0200
Date: Fri, 4 Mar 2022 23:11:54 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: trix@redhat.com
Subject: Re: [PATCH] drm/i915: rework the error handling in *_dpll_params
Message-ID: <YiKAmhXEye0fpAyF@intel.com>
References: <20220304210355.608898-1-trix@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220304210355.608898-1-trix@redhat.com>
X-Patchwork-Hint: comment
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
Cc: tvrtko.ursulin@linux.intel.com, llvm@lists.linux.dev, airlied@linux.ie,
 lucas.demarchi@intel.com, ndesaulniers@google.com,
 linux-kernel@vger.kernel.org, nathan@kernel.org,
 dri-devel@lists.freedesktop.org, rodrigo.vivi@intel.com, airlied@redhat.com,
 intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Mar 04, 2022 at 01:03:55PM -0800, trix@redhat.com wrote:
> From: Tom Rix <trix@redhat.com>
> 
> Clang static analysis reports this issue
> intel_dpll.c:472:31: warning: The left operand of '-'
>   is a garbage value [core.UndefinedBinaryOperatorResult]
>   this_err = abs(clock.dot - target);
>                  ~~~~~~~~~ ^
> 
> In a loop clock.dot is set on successful call to
> i9xx_calc_dpll_params().  If the call fails, the later
> *is_valid() will use the previous loop's clock.dot.

I don't think this can happen. intel_pll_is_valid() validates
all the dividers first and bails out if they are junk.

> 
> The *_dpll_params functions return an arithmetic statement
> with the clock.dot as the variable.  Change the error handler
> to set clock.dot to 0 and jump to the return statement.
> 
> Fixes: dccbea3b0704 ("drm/i915: calculate the port clock rate along with other PLL params")
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/i915/display/intel_dpll.c | 32 ++++++++++++++---------
>  1 file changed, 20 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/display/intel_dpll.c b/drivers/gpu/drm/i915/display/intel_dpll.c
> index 0ae37fdbf2a5b..ba7cada704288 100644
> --- a/drivers/gpu/drm/i915/display/intel_dpll.c
> +++ b/drivers/gpu/drm/i915/display/intel_dpll.c
> @@ -309,11 +309,13 @@ int pnv_calc_dpll_params(int refclk, struct dpll *clock)
>  {
>  	clock->m = clock->m2 + 2;
>  	clock->p = clock->p1 * clock->p2;
> -	if (WARN_ON(clock->n == 0 || clock->p == 0))
> -		return 0;
> +	if (WARN_ON(clock->n == 0 || clock->p == 0)) {
> +		clock->dot = 0;
> +		goto end;
> +	}
>  	clock->vco = DIV_ROUND_CLOSEST(refclk * clock->m, clock->n);
>  	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
> -
> +end:
>  	return clock->dot;
>  }
>  
> @@ -326,11 +328,13 @@ int i9xx_calc_dpll_params(int refclk, struct dpll *clock)
>  {
>  	clock->m = i9xx_dpll_compute_m(clock);
>  	clock->p = clock->p1 * clock->p2;
> -	if (WARN_ON(clock->n + 2 == 0 || clock->p == 0))
> -		return 0;
> +	if (WARN_ON(clock->n + 2 == 0 || clock->p == 0)) {
> +		clock->dot = 0;
> +		goto end;
> +	}
>  	clock->vco = DIV_ROUND_CLOSEST(refclk * clock->m, clock->n + 2);
>  	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
> -
> +end:
>  	return clock->dot;
>  }
>  
> @@ -338,11 +342,13 @@ int vlv_calc_dpll_params(int refclk, struct dpll *clock)
>  {
>  	clock->m = clock->m1 * clock->m2;
>  	clock->p = clock->p1 * clock->p2;
> -	if (WARN_ON(clock->n == 0 || clock->p == 0))
> -		return 0;
> +	if (WARN_ON(clock->n == 0 || clock->p == 0)) {
> +		clock->dot = 0;
> +		goto end;
> +	}
>  	clock->vco = DIV_ROUND_CLOSEST(refclk * clock->m, clock->n);
>  	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
> -
> +end:
>  	return clock->dot / 5;
>  }
>  
> @@ -350,12 +356,14 @@ int chv_calc_dpll_params(int refclk, struct dpll *clock)
>  {
>  	clock->m = clock->m1 * clock->m2;
>  	clock->p = clock->p1 * clock->p2;
> -	if (WARN_ON(clock->n == 0 || clock->p == 0))
> -		return 0;
> +	if (WARN_ON(clock->n == 0 || clock->p == 0)) {
> +		clock->dot = 0;
> +		goto end;
> +	}
>  	clock->vco = DIV_ROUND_CLOSEST_ULL(mul_u32_u32(refclk, clock->m),
>  					   clock->n << 22);
>  	clock->dot = DIV_ROUND_CLOSEST(clock->vco, clock->p);
> -
> +end:
>  	return clock->dot / 5;
>  }
>  
> -- 
> 2.26.3

-- 
Ville Syrjälä
Intel
