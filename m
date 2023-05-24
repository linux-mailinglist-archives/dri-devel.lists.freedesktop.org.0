Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E72A70FAF5
	for <lists+dri-devel@lfdr.de>; Wed, 24 May 2023 17:58:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 796AA10E47E;
	Wed, 24 May 2023 15:57:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85D9F10E45F;
 Wed, 24 May 2023 15:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684943877; x=1716479877;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=V0ppXZqwuxAU/Bg5FfSiFhkz0C7dZFMzhNEHqaFV3kc=;
 b=kD6bAILyVW/TqijsdwqRr941SHB9YeX5aLtESd3A5j2gOpTjSmjPfn/v
 JVtCK8ytljKW23z5/HwJYmu/6a3StCyrTvmDoB8veTSmwBb2+i5EYMECI
 zYsmx6yzuzBmZxX8G5B6CLtIJJnIiXrtiy/4cUMxcT4C8JwG75Xu3plET
 yjBpuzQqClV6YYuAkusx22EttZU2JjfME8paHnix636m7ojsS2aJBLtr+
 iRJZkCkeuyWBC/1ec9wOxdbId4ePi9LSFJuvl7ZAJpFeQ1riR6jduBq6f
 ezdC7jP4ZyTUWOsLvaNhPQgjb0d3RX8lTmOy4nk04gpfMszXKFbCj2ke0 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="343073507"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="343073507"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 08:57:56 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10720"; a="737375787"
X-IronPort-AV: E=Sophos;i="6.00,189,1681196400"; d="scan'208";a="737375787"
Received: from davidbel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.5])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2023 08:57:52 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Nathan Chancellor <nathan@kernel.org>, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, tvrtko.ursulin@linux.intel.com
Subject: Re: [PATCH] drm/i915: Fix clang -Wimplicit-fallthrough in
 intel_async_flip_check_hw()
In-Reply-To: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230524-intel_async_flip_check_hw-implicit-fallthrough-v1-1-83de89e376a1@kernel.org>
Date: Wed, 24 May 2023 18:57:49 +0300
Message-ID: <87mt1tk9he.fsf@intel.com>
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
Cc: kernel test robot <lkp@intel.com>, Tom Rix <trix@redhat.com>,
 intel-gfx@lists.freedesktop.org, llvm@lists.linux.dev, ndesaulniers@google.com,
 patches@lists.linux.dev, dri-devel@lists.freedesktop.org,
 Nathan Chancellor <nathan@kernel.org>,
 Naresh Kamboju <naresh.kamboju@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 24 May 2023, Nathan Chancellor <nathan@kernel.org> wrote:
> Clang warns:
>
>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>                   case I915_FORMAT_MOD_X_TILED:
>                   ^
>   drivers/gpu/drm/i915/display/intel_display.c:6012:3: note: insert 'break;' to avoid fall-through
>                   case I915_FORMAT_MOD_X_TILED:
>                   ^
>                   break;
>   1 error generated.
>
> Clang is a little more pedantic than GCC, which does not warn when
> falling through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst, which
> states that all switch/case blocks must end in either break,
> fallthrough, continue, goto, or return. Add the missing break to silence
> the warning.
>
> Fixes: 937859485aef ("drm/i915: Support Async Flip on Linear buffers")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/202305241902.UvHtMoxa-lkp@intel.com/
> Reported-by: Naresh Kamboju <naresh.kamboju@linaro.org>
> Closes: https://lore.kernel.org/CA+G9fYv68V3ewK0Qj-syQj7qX-hQr0H1MFL=QFNuDoE_J2Zu-g@mail.gmail.com/
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Yeah, I think this is the right quick fix. See also [1].

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

[1] https://lore.kernel.org/r/874jo3kwl6.fsf@intel.com


> ---
>  drivers/gpu/drm/i915/display/intel_display.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
> index 0490c6412ab5..6d49e0ab3e85 100644
> --- a/drivers/gpu/drm/i915/display/intel_display.c
> +++ b/drivers/gpu/drm/i915/display/intel_display.c
> @@ -6008,6 +6008,7 @@ static int intel_async_flip_check_hw(struct intel_atomic_state *state, struct in
>  					    plane->base.base.id, plane->base.name);
>  				return -EINVAL;
>  			}
> +			break;
>  
>  		case I915_FORMAT_MOD_X_TILED:
>  		case I915_FORMAT_MOD_Y_TILED:
>
> ---
> base-commit: 9a2cb1b31c040e2f1b313e2f7921f0f5e6b66d82
> change-id: 20230524-intel_async_flip_check_hw-implicit-fallthrough-c4c40b03802f
>
> Best regards,

-- 
Jani Nikula, Intel Open Source Graphics Center
