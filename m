Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1015A94B3FE
	for <lists+dri-devel@lfdr.de>; Thu,  8 Aug 2024 02:13:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2FE610E61F;
	Thu,  8 Aug 2024 00:13:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Mqp6K595";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E171610E61D;
 Thu,  8 Aug 2024 00:13:06 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 8AB51CE0B30;
 Thu,  8 Aug 2024 00:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D625CC32781;
 Thu,  8 Aug 2024 00:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1723075983;
 bh=KLGC7VU7LlmH2ADsLTAQz65NnOT9hUCfF7S/ygvlLFk=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Mqp6K595nySnR/dJnmFf9Rlz0UOfVFwpxSbjNxVv5oE+CvYGw7/P9OSl3L32d1kym
 JcDCzk768Sot6aSZGU6d5i9b4WhkBwg0ofEqQO8066mjJIFCKM7ZRrl26uMtgRpSle
 1l2brOz1MMzmgChs7UBq7OTCaMyCAUV5w285vM+3wnsDXl6I+qmT+N986xrFYcYuWz
 y7T7GglDAOGGidA1O42jhCzhG5m8MSa09Bk5yNadsW762NM0/8ciPTvymONVCjPz3X
 FV4XdezDsy3hN3K2bSUusmpNW9c8qFNyJxP9rUCzjkwqRdJp17rkiLPpt/2F8Q1lPd
 uUqTcIUDrZ7QA==
Date: Thu, 8 Aug 2024 01:12:58 +0100
From: Andi Shyti <andi.shyti@kernel.org>
To: Thorsten Blum <thorsten.blum@toblux.com>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com, 
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 daniel@ffwll.ch, jonathan.cavitt@intel.com, andi.shyti@linux.intel.com,
 intel-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] drm/i915: Explicitly cast divisor and use div_u64()
Message-ID: <akqf5n7hzrfr2lvsiyxbnbznzydvplhyi2phaavb3e6ak6z5fp@okyjnsi5xgey>
References: <20240807202040.54796-2-thorsten.blum@toblux.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240807202040.54796-2-thorsten.blum@toblux.com>
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

Hi Thorsten,

> diff --git a/drivers/gpu/drm/i915/i915_perf.c b/drivers/gpu/drm/i915/i915_perf.c
> index 025a79fe5920..6ff905d2b78f 100644
> --- a/drivers/gpu/drm/i915/i915_perf.c
> +++ b/drivers/gpu/drm/i915/i915_perf.c
> @@ -4063,17 +4063,13 @@ static int read_properties_unlocked(struct i915_perf *perf,
>  			oa_period = oa_exponent_to_ns(perf, value);
>  
>  			/* This check is primarily to ensure that oa_period <=
> -			 * UINT32_MAX (before passing to do_div which only
> +			 * UINT32_MAX (before passing it to div_u64 which only
>  			 * accepts a u32 denominator), but we can also skip
>  			 * checking anything < 1Hz which implicitly can't be
>  			 * limited via an integer oa_max_sample_rate.
>  			 */
> -			if (oa_period <= NSEC_PER_SEC) {
> -				u64 tmp = NSEC_PER_SEC;
> -				do_div(tmp, oa_period);
> -				oa_freq_hz = tmp;
> -			} else
> -				oa_freq_hz = 0;
> +			oa_freq_hz = oa_period > NSEC_PER_SEC ? 0 :
> +				div_u64(NSEC_PER_SEC, (u32)oa_period);

Thanks for the follow up!

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
