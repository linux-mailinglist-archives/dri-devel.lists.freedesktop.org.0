Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1E6A14A61
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 08:47:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5FA1510EA7B;
	Fri, 17 Jan 2025 07:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkNh/K7l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0471D10EA76;
 Fri, 17 Jan 2025 07:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737100021; x=1768636021;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=DcCXZiNEOOx4OX58TA4PvstFtJZzuF5EjE4UegB7kkk=;
 b=bkNh/K7lpsiI2mt4dlm1WnOqU48ETQajWpfAKSHXr9sBtRvn2uKKqDb5
 k7Mf0Oe2F8v8VeNnkWVrn5p9+ACrLvR5lrSCFRYRwIIUEBL1mKqz50F/d
 f4GFg8UVQ2YStu7RwgwgmDjz2ezIqcLJplrVeGKvlkn1J5Mge9pOvqnMB
 R5vrPAVFmQ4Cjr2GF7AERIJs0EDB52ySCQZKtOZeayCqugvSF5hFI1JQc
 zwhaDJNFg6F66dNZ6dVNaYFUeI9L5AjRAiEqNoKWFJoZ/Ry0bPAwosQkN
 gDvNc0kmOcTMvhsKkfrp6ATZqwGfmlR80QI0m88UYWeclR9OHxLy3L+S8 w==;
X-CSE-ConnectionGUID: Ws/PS8qXRB+LsP1E2YRa6A==
X-CSE-MsgGUID: hwWgBQ1KQpGQk8FIf0eQjg==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="37639840"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="37639840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:47:01 -0800
X-CSE-ConnectionGUID: 4DHApm+0SfyOa7sErlRfpA==
X-CSE-MsgGUID: ZBDbQbpGQuiPayUollKbVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105575949"
Received: from hrotuna-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2025 23:46:57 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Ingyu Jang <ingyujang25@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Ingyu Jang <ingyujang25@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/i915/gt: Handle INTEL_WAKEREF_DEF return value in
 gen8_ggtt_bind_get_ce
In-Reply-To: <20250116193528.2297487-1-ingyujang25@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20250116193528.2297487-1-ingyujang25@gmail.com>
Date: Fri, 17 Jan 2025 09:46:53 +0200
Message-ID: <87cyglg9w2.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 17 Jan 2025, Ingyu Jang <ingyujang25@gmail.com> wrote:
> The function 'gen8_ggtt_bind_get_ce' previously did not handle the case
> where 'intel_gt_pm_get_if_awake()' returns 'INTEL_WAKEREF_DEF'.
> This value is returned when the 'intel_ref_tracker_alloc()' call within
> 'intel_gt_pm_get_if_awake()' fails to allocate due
> to memory pressure or other constraints.
>
> 'intel_ref_tracker_alloc()' uses 'ref_tracker_alloc()' with the
> 'GFP_NOWAIT' flag, which can return 'NULL' if allocation fails.
> In this case, the function explicitly returns 'INTEL_WAKEREF_DEF'.
>
> This patch adds a check for 'INTEL_WAKEREF_DEF' in
> 'gen8_ggtt_bind_get_ce' to ensure that such errors are properly handled.
> If 'INTEL_WAKEREF_DEF' is returned, the function returns 'NULL' .

No.

The callers should only handle NULL vs. non-NULL, and never make any
other assumptions about the value.

If intel_ref_tracker_alloc() fails, we'll only lose the wakeref tracking
debug aid, but everything else goes fine. The patch at hand conflates
the returned "asleep" (NULL) with "ref tracker fail", and that's wrong.

See how intel_ref_tracker_free() handles INTEL_WAKEREF_DEF.

BR,
Jani.


>
> Signed-off-by: Ingyu Jang <ingyujang25@gmail.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ggtt.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> index d60a6ca0cae5..8d22d8f2243d 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
> @@ -311,7 +311,7 @@ static struct intel_context *gen8_ggtt_bind_get_ce(struct i915_ggtt *ggtt, intel
>  	 * doing rpm_resume().
>  	 */
>  	*wakeref = intel_gt_pm_get_if_awake(gt);
> -	if (!*wakeref)
> +	if (!*wakeref || *wakeref == INTEL_WAKEREF_DEF)
>  		return NULL;
>  
>  	intel_engine_pm_get(ce->engine);

-- 
Jani Nikula, Intel
