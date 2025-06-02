Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD95ACBD2E
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 00:17:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F9510E073;
	Mon,  2 Jun 2025 22:17:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="CLRTi+tX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7076710E073;
 Mon,  2 Jun 2025 22:17:01 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 2330A49F6E;
 Mon,  2 Jun 2025 22:17:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4C34C4CEEB;
 Mon,  2 Jun 2025 22:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1748902621;
 bh=Cqg9rII/gsP90FW+z744Frr63XWLwQaWqwqr56GPE9k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CLRTi+tXpqM7V4L3vxzuOCCNgeyJwH0Tn5aOpdmWDUyqsxiHl5kMRoQ80LS8wHC5y
 KzluctgBwvmxyL3DuYnOz98oc7PpA5E2IIdvWHrkP+FAjaLSpvzuzGBnw2H+0RSUe/
 m/+mE3yBY+agE9CJzWUljP6vGEx4s6pK1PQXW+hx7hc41joP9m/6WVbJQRF3R2Zyme
 6aL/HfhH+k2rTXpcE0IAcFTdV3M9KnIQyAS2Zq62qUio0M0DwIc6HbC4WVvQGr5m0b
 zteeqGdpnAR+NRDHlcRCnglB4c1+CqdEEZK4686A9ZAd1CByWZ3FWhyvtD+LKyGQHv
 794PyAUVT+Zxg==
Date: Mon, 2 Jun 2025 15:16:56 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tursulin@ursulin.net, airlied@gmail.com,
 simona@ffwll.ch, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/i915/pmu: Fix build error with GCOV and AutoFDO
 enabled
Message-ID: <20250602221656.GC924363@ax162>
References: <20250529042910.2436330-1-tzungbi@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250529042910.2436330-1-tzungbi@kernel.org>
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

On Thu, May 29, 2025 at 04:29:10AM +0000, Tzung-Bi Shih wrote:
> i915_pmu.c may fail to build with GCOV and AutoFDO enabled.
> 
> ../drivers/gpu/drm/i915/i915_pmu.c:116:3: error: call to '__compiletime_assert_487' declared with 'error' attribute: BUILD_BUG_ON failed: bit > BITS_PER_TYPE(typeof_member(struct i915_pmu, enable)) - 1
>   116 |                 BUILD_BUG_ON(bit >
>       |                 ^
> 
> Here is a way to reproduce the issue:
> $ git checkout v6.15
> $ mkdir build
> $ ./scripts/kconfig/merge_config.sh -O build -n -m <(cat <<EOF
> CONFIG_DRM=y
> CONFIG_PCI=y
> CONFIG_DRM_I915=y
> 
> CONFIG_PERF_EVENTS=y
> 
> CONFIG_DEBUG_FS=y
> CONFIG_GCOV_KERNEL=y
> CONFIG_GCOV_PROFILE_ALL=y
> 
> CONFIG_AUTOFDO_CLANG=y
> EOF
> )
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>        olddefconfig
> $ PATH=${PATH}:${HOME}/llvm-20.1.5-x86_64/bin make LLVM=1 O=build \
>        CLANG_AUTOFDO_PROFILE=...PATH_TO_SOME_AFDO_PROFILE... \
>        drivers/gpu/drm/i915/i915_pmu.o
> 
> Although not super sure what happened, by reviewing the code, it should
> depend on `__builtin_constant_p(bit)` directly instead of assuming
> `__builtin_constant_p(config)` makes `bit` a builtin constant.
> 
> Also fix a nit, to reuse the `bit` local variable.
> 
> Fixes: a644fde77ff7 ("drm/i915/pmu: Change bitmask of enabled events to u32")
> Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>

This seems like a reasonable fix, as it is likely that these
configurations cause config_bit() not to be inlined due to
instrumentation being added. If config_bit() is not inlined, bit will
not be known at compile time, triggering the compiletime error because
the condition cannot be proven false at that point.

Marking config_bit(), is_engine_config(), engine_config_sample(),
other_bit(), config_counter(), and config_gt_id() all as __always_inline
might resolve this as well but I cannot say if that is worth it. I guess
it depends on how often this check is likely to fire.

Reviewed-by: Nathan Chancellor <nathan@kernel.org>

> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index e5a188ce3185..990bfaba3ce4 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -112,7 +112,7 @@ static u32 config_mask(const u64 config)
>  {
>  	unsigned int bit = config_bit(config);
>  
> -	if (__builtin_constant_p(config))
> +	if (__builtin_constant_p(bit))
>  		BUILD_BUG_ON(bit >
>  			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>  							 enable)) - 1);
> @@ -121,7 +121,7 @@ static u32 config_mask(const u64 config)
>  			     BITS_PER_TYPE(typeof_member(struct i915_pmu,
>  							 enable)) - 1);
>  
> -	return BIT(config_bit(config));
> +	return BIT(bit);
>  }
>  
>  static bool is_engine_event(struct perf_event *event)
> -- 
> 2.49.0.1266.g31b7d2e469-goog
> 
> 
