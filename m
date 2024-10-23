Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A6239ACA9A
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 14:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92F710E7CC;
	Wed, 23 Oct 2024 12:53:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="f5SWrEH2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3500310E7CC;
 Wed, 23 Oct 2024 12:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729688032; x=1761224032;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=s/ijLkvgmNSIDW3lP3xx7kywtJiOOd1nWwIXo6qDPpU=;
 b=f5SWrEH2Y1Y3XwqBtWiKZSo9ksjH17JI0pYI+uHHmDXzbAyWhUpDX69P
 JyIIHvuOC/Ov+N6P/h/FvroRcUGupCre4qNmhBcmJOcdG1XFoSAPcD+fO
 Iy/tOmnDTlxmiyOSCW0p307xJMG7ZFC2UqfD0Y5UR7W7b2SNW7gfXFMh1
 Ndi6KIRSp6xGkMk0vDC94ULfu+LXVkecjWsKwvTmpQ3K3SHE6TCafOl4k
 2mbGyFIMRrE6XZLu5XomGdT/U/vf42BAgibqoI7yviLdtQeMgM7WGaw2S
 RyOhEwtOqkP08Ldd5XOn01vHt7aysEas/Lay0UNbMs45U7IdYwbvqqBjk g==;
X-CSE-ConnectionGUID: MasKS5S+S6aDQMDa9riWzg==
X-CSE-MsgGUID: 7spdOK+mSuy2gwmfzr9dwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="39820796"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="39820796"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 05:53:52 -0700
X-CSE-ConnectionGUID: FTXxJjn7SVSm7c7cxdb7qg==
X-CSE-MsgGUID: 3LglOoHNTba2rgHa1ro+ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; d="scan'208";a="79859858"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.84])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2024 05:53:48 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Uros Bizjak <ubizjak@gmail.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Subject: Re: [PATCH] drm/i915/active: Use try_cmpxchg() in active_fence_cb()
In-Reply-To: <20241003084533.871524-1-ubizjak@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241003084533.871524-1-ubizjak@gmail.com>
Date: Wed, 23 Oct 2024 15:53:46 +0300
Message-ID: <87ttd3t1yd.fsf@intel.com>
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

On Thu, 03 Oct 2024, Uros Bizjak <ubizjak@gmail.com> wrote:
> Replace this pattern in active_fence_cb():
>
>     cmpxchg(*ptr, old, new) == old
>
> ... with the simpler and faster:
>
>     try_cmpxchg(*ptr, &old, new)
>
> The x86 CMPXCHG instruction returns success in the ZF flag,
> so this change saves a compare after the CMPXCHG.
>
> Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
> Cc: Jani Nikula <jani.nikula@linux.intel.com>
> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Cc: Tvrtko Ursulin <tursulin@ursulin.net>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Simona Vetter <simona@ffwll.ch>

Pushed to drm-intel-next, thanks for the patch.

BR,
Jani.

> ---
>  drivers/gpu/drm/i915/i915_active.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/i915/i915_active.c b/drivers/gpu/drm/i915/i915_active.c
> index 5ec293011d99..35319228bc51 100644
> --- a/drivers/gpu/drm/i915/i915_active.c
> +++ b/drivers/gpu/drm/i915/i915_active.c
> @@ -212,7 +212,7 @@ active_fence_cb(struct dma_fence *fence, struct dma_fence_cb *cb)
>  	struct i915_active_fence *active =
>  		container_of(cb, typeof(*active), cb);
>  
> -	return cmpxchg(__active_fence_slot(active), fence, NULL) == fence;
> +	return try_cmpxchg(__active_fence_slot(active), &fence, NULL);
>  }
>  
>  static void

-- 
Jani Nikula, Intel
