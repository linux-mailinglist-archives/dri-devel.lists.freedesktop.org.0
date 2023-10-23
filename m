Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 378EF7D372F
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 14:49:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63A0510E1D5;
	Mon, 23 Oct 2023 12:49:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F2B10E0E7;
 Mon, 23 Oct 2023 12:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698065389; x=1729601389;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=/06vn1FESH5ehRnRfIJp0ycCvwF0E4N5zV1BYkmcMd4=;
 b=CJJVLVyjaTpj4HilA1vY97URbnmZ4YaCpmzNmvqBHGPtzwFbJ1DQGa9v
 jX9bBWiZmUhsM90fNB+SgcutaUeNU59GNtR/0OMDSCTPP1MlY/+8xxB8W
 9/1O3tgjK7lnr+peywHmLoAn5Kcw+QyJekhc4qMKwNrusHcwlGCzdB3t7
 D6rvcTlqI/TN2aRNtUs8GgVvA5ZWrfMIZuxpv0eEo761LlahrGNVfJyc+
 N14GwjeXOzXsWsgiZcPRDhvwz/D+OT6r4SCMb5wIy7QSAGHBX0BJhJQMa
 byeCrrqFohpVz42TEy/x/xfPwj4bTKuesIkyZBjHa0OyVCU3dEfkqhqrR w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="385715731"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="385715731"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 05:49:49 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10872"; a="761731237"
X-IronPort-AV: E=Sophos;i="6.03,244,1694761200"; d="scan'208";a="761731237"
Received: from evlad-mobl.ger.corp.intel.com (HELO localhost) ([10.252.47.180])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2023 05:49:44 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Arnd Bergmann <arnd@kernel.org>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, Badal Nilawar
 <badal.nilawar@intel.com>, Ashutosh Dixit <ashutosh.dixit@intel.com>
Subject: Re: [PATCH] drm/i915/mtl: avoid stringop-overflow warning
In-Reply-To: <20231016201012.1022812-1-arnd@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20231016201012.1022812-1-arnd@kernel.org>
Date: Mon, 23 Oct 2023 15:49:41 +0300
Message-ID: <87edhlbj16.fsf@intel.com>
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
Cc: Arnd Bergmann <arnd@arndb.de>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Matt Roper <matthew.d.roper@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 16 Oct 2023, Arnd Bergmann <arnd@kernel.org> wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> The newly added memset() causes a warning for some reason I could not figure out:
>
> In file included from arch/x86/include/asm/string.h:3,
>                  from drivers/gpu/drm/i915/gt/intel_rc6.c:6:
> In function 'rc6_res_reg_init',
>     inlined from 'intel_rc6_init' at drivers/gpu/drm/i915/gt/intel_rc6.c:610:2:
> arch/x86/include/asm/string_32.h:195:29: error: '__builtin_memset' writing 16 bytes into a region of size 0 overflows the destination [-Werror=stringop-overflow=]
>   195 | #define memset(s, c, count) __builtin_memset(s, c, count)
>       |                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/i915/gt/intel_rc6.c:584:9: note: in expansion of macro 'memset'
>   584 |         memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));
>       |         ^~~~~~
> In function 'intel_rc6_init':
>
> Change it to an normal initializer and an added memcpy() that does not have
> this problem.
>
> Fixes: 4bb9ca7ee0745 ("drm/i915/mtl: C6 residency and C state type for MTL SAMedia")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/gt/intel_rc6.c | 16 ++++++++++------
>  1 file changed, 10 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_rc6.c b/drivers/gpu/drm/i915/gt/intel_rc6.c
> index 8b67abd720be8..7090e4be29cb6 100644
> --- a/drivers/gpu/drm/i915/gt/intel_rc6.c
> +++ b/drivers/gpu/drm/i915/gt/intel_rc6.c
> @@ -581,19 +581,23 @@ static void __intel_rc6_disable(struct intel_rc6 *rc6)
>  
>  static void rc6_res_reg_init(struct intel_rc6 *rc6)
>  {
> -	memset(rc6->res_reg, INVALID_MMIO_REG.reg, sizeof(rc6->res_reg));

That's just bollocks. memset() is byte granularity, while
INVALID_MMIO_REG.reg is u32. If the value was anything other than 0,
this would break.

And you're not supposed to look at the guts of i915_reg_t to begin with,
that's why it's a typedef. Basically any code that accesses the members
of i915_reg_t outside of its implementation are doing it wrong.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


> +	i915_reg_t res_reg[INTEL_RC6_RES_MAX] = {
> +		[0 ... INTEL_RC6_RES_MAX - 1] = INVALID_MMIO_REG,
> +	};
>  
>  	switch (rc6_to_gt(rc6)->type) {
>  	case GT_MEDIA:
> -		rc6->res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
> +		res_reg[INTEL_RC6_RES_RC6] = MTL_MEDIA_MC6;
>  		break;
>  	default:
> -		rc6->res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> -		rc6->res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> -		rc6->res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> -		rc6->res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
> +		res_reg[INTEL_RC6_RES_RC6_LOCKED] = GEN6_GT_GFX_RC6_LOCKED;
> +		res_reg[INTEL_RC6_RES_RC6] = GEN6_GT_GFX_RC6;
> +		res_reg[INTEL_RC6_RES_RC6p] = GEN6_GT_GFX_RC6p;
> +		res_reg[INTEL_RC6_RES_RC6pp] = GEN6_GT_GFX_RC6pp;
>  		break;
>  	}
> +
> +	memcpy(rc6->res_reg, res_reg, sizeof(res_reg));
>  }
>  
>  void intel_rc6_init(struct intel_rc6 *rc6)

-- 
Jani Nikula, Intel
