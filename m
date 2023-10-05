Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F4AF7B9C79
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 12:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE56D10E1D5;
	Thu,  5 Oct 2023 10:22:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FD9610E1D5;
 Thu,  5 Oct 2023 10:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1696501341; x=1728037341;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=7cLwqKiXl9KfzXnflp8oVp0nz4eFfG4OmGWuM2JBzIs=;
 b=dmflbgwEiQCTOcP3+jnhAPVHTur+HAMJSbQfFfSC1/H/eAY/Y5KAczW3
 1cQJFTJ1HMc00vToiaE3TAw31coWTdOTaT2UCtsWys0qEIzVHrmkDFYWK
 qpScE8i9BPZS2y8KFX+tmYqom18UHduLSWpDi5vMtBRlX5FxO8P2eljXH
 ZTgKboCMCpeJn3cXMk0Ehi1ziltbH2o/GXQzVvqDislV9CaJWtsJyQ+6K
 ex/2ZERfsTvftfpqeuusTVPCogdkIWRDYniwm+fbhM+F+eHEH9J2H7IOr
 /hSJ+nXsiEI94Iv8+mm5H7vyBecXGiLQTKP/07PqRySx3wJudLn8/baOO g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="368534709"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="368534709"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 03:22:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10853"; a="822066068"
X-IronPort-AV: E=Sophos;i="6.03,202,1694761200"; d="scan'208";a="822066068"
Received: from icoveix-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.55.203])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Oct 2023 03:22:17 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/pmu: Use local64_try_cmpxchg in
 i915_pmu_event_read
In-Reply-To: <20230703150859.6176-1-ubizjak@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230703150859.6176-1-ubizjak@gmail.com>
Date: Thu, 05 Oct 2023 13:22:15 +0300
Message-ID: <87ttr5cqso.fsf@intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Uros Bizjak <ubizjak@gmail.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 03 Jul 2023, Uros Bizjak <ubizjak@gmail.com> wrote:
> Use local64_try_cmpxchg instead of local64_cmpxchg (*ptr, old, new) == old
> in i915_pmu_event_read.  x86 CMPXCHG instruction returns success in ZF flag,
> so this change saves a compare after cmpxchg (and related move instruction
> in front of cmpxchg).
>
> Also, try_cmpxchg implicitly assigns old *ptr value to "old" when cmpxchg
> fails. There is no need to re-read the value in the loop.
>
> No functional change intended.
>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Daniel Vetter <daniel@ffwll.ch>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> ---
>  drivers/gpu/drm/i915/i915_pmu.c | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_pmu.c b/drivers/gpu/drm/i915/i915_pmu.c
> index d35973b41186..108b675088ba 100644
> --- a/drivers/gpu/drm/i915/i915_pmu.c
> +++ b/drivers/gpu/drm/i915/i915_pmu.c
> @@ -696,12 +696,11 @@ static void i915_pmu_event_read(struct perf_event *event)
>  		event->hw.state = PERF_HES_STOPPED;
>  		return;
>  	}
> -again:
> -	prev = local64_read(&hwc->prev_count);
> -	new = __i915_pmu_event_read(event);
>  
> -	if (local64_cmpxchg(&hwc->prev_count, prev, new) != prev)
> -		goto again;
> +	prev = local64_read(&hwc->prev_count);
> +	do {
> +		new = __i915_pmu_event_read(event);
> +	} while (!local64_try_cmpxchg(&hwc->prev_count, &prev, new));

Chased through the documentation again, and pushed to drm-intel-next.

Thanks for the patch.

BR,
Jani.

>  
>  	local64_add(new - prev, &event->count);
>  }

-- 
Jani Nikula, Intel
