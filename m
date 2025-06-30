Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BFC3AEDF80
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jun 2025 15:47:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FF1310E0C0;
	Mon, 30 Jun 2025 13:46:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ekHvqZO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 442D010E0C0;
 Mon, 30 Jun 2025 13:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751291219; x=1782827219;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=peqrfAgy9AoDbD1DSGmdFsDEcp3cLmSNrKrwHMFYfV4=;
 b=ekHvqZO0yVH55yALvP3XlUS2xcejnp8HvPmafqvMWi4rsOr01sRLzr0Z
 M/abnbA1TSRcvh3l7l3MbJ9SsJaUeTEWDYZrXIwjwy1aso6sXUI/uRlHd
 HfC6GDszsH03ZFR+Lr6fryQUM2uitXuIW/jT4s8HS+UBdvj+3VrkXGu0w
 cSQrAWbJCNwRyJc/xlR6B1OhY7O7eUUQ9IXU5sWYhu0vO+P0XGCMtPWKB
 GdxQCzkDBnGFvSBfDR8dWcghVjbgwmOi1lA5fMLxXRMnNzuUrO3hhefjY
 XhKtIkvaO+OwhqH3WDYZr9dlG7gNdY1qkB5NQ0KFrbM5ysSGTCaOcoLhM g==;
X-CSE-ConnectionGUID: maT4L3RHQKiQpLBxV4icAQ==
X-CSE-MsgGUID: kSAhMo4zQuGvpuu+9vvlUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="76066313"
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="76066313"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:46:58 -0700
X-CSE-ConnectionGUID: q/oC+NhZQX2j1RT+4P2WKQ==
X-CSE-MsgGUID: jkXIUIK1S8ScvxVlLcjbyg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,277,1744095600"; d="scan'208";a="177131881"
Received: from oandoniu-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.247.119.190])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 06:46:52 -0700
Date: Mon, 30 Jun 2025 15:46:49 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Nitin Gote <nitin.r.gote@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Krzysztof Karas <krzysztof.karas@intel.com>
Subject: Re: [PATCH] drm/i915/ring_submission: Fix timeline left held on VMA
 alloc error
Message-ID: <aGKVSWg-kb2e6PGa@ashyti-mobl2.lan>
References: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611104352.1014011-2-janusz.krzysztofik@linux.intel.com>
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

Hi Janusz,

merged to drm-intel-gt-next.

Thanks,
Andi

On Wed, Jun 11, 2025 at 12:42:13PM +0200, Janusz Krzysztofik wrote:
> The following error has been reported sporadically by CI when a test
> unbinds the i915 driver on a ring submission platform:
> 
> <4> [239.330153] ------------[ cut here ]------------
> <4> [239.330166] i915 0000:00:02.0: [drm] drm_WARN_ON(dev_priv->mm.shrink_count)
> <4> [239.330196] WARNING: CPU: 1 PID: 18570 at drivers/gpu/drm/i915/i915_gem.c:1309 i915_gem_cleanup_early+0x13e/0x150 [i915]
> ...
> <4> [239.330640] RIP: 0010:i915_gem_cleanup_early+0x13e/0x150 [i915]
> ...
> <4> [239.330942] Call Trace:
> <4> [239.330944]  <TASK>
> <4> [239.330949]  i915_driver_late_release+0x2b/0xa0 [i915]
> <4> [239.331202]  i915_driver_release+0x86/0xa0 [i915]
> <4> [239.331482]  devm_drm_dev_init_release+0x61/0x90
> <4> [239.331494]  devm_action_release+0x15/0x30
> <4> [239.331504]  release_nodes+0x3d/0x120
> <4> [239.331517]  devres_release_all+0x96/0xd0
> <4> [239.331533]  device_unbind_cleanup+0x12/0x80
> <4> [239.331543]  device_release_driver_internal+0x23a/0x280
> <4> [239.331550]  ? bus_find_device+0xa5/0xe0
> <4> [239.331563]  device_driver_detach+0x14/0x20
> ...
> <4> [357.719679] ---[ end trace 0000000000000000 ]---
> 
> If the test also unloads the i915 module then that's followed with:
> 
> <3> [357.787478] =============================================================================
> <3> [357.788006] BUG i915_vma (Tainted: G     U  W        N ): Objects remaining on __kmem_cache_shutdown()
> <3> [357.788031] -----------------------------------------------------------------------------
> <3> [357.788204] Object 0xffff888109e7f480 @offset=29824
> <3> [357.788670] Allocated in i915_vma_instance+0xee/0xc10 [i915] age=292729 cpu=4 pid=2244
> <4> [357.788994]  i915_vma_instance+0xee/0xc10 [i915]
> <4> [357.789290]  init_status_page+0x7b/0x420 [i915]
> <4> [357.789532]  intel_engines_init+0x1d8/0x980 [i915]
> <4> [357.789772]  intel_gt_init+0x175/0x450 [i915]
> <4> [357.790014]  i915_gem_init+0x113/0x340 [i915]
> <4> [357.790281]  i915_driver_probe+0x847/0xed0 [i915]
> <4> [357.790504]  i915_pci_probe+0xe6/0x220 [i915]
> ...
> 
> Closer analysis of CI results history has revealed a dependency of the
> error on a few IGT tests, namely:
> - igt@api_intel_allocator@fork-simple-stress-signal,
> - igt@api_intel_allocator@two-level-inception-interruptible,
> - igt@gem_linear_blits@interruptible,
> - igt@prime_mmap_coherency@ioctl-errors,
> which invisibly trigger the issue, then exhibited with first driver unbind
> attempt.
> 
> All of the above tests perform actions which are actively interrupted with
> signals.  Further debugging has allowed to narrow that scope down to
> DRM_IOCTL_I915_GEM_EXECBUFFER2, and ring_context_alloc(), specific to ring
> submission, in particular.
> 
> If successful then that function, or its execlists or GuC submission
> equivalent, is supposed to be called only once per GEM context engine,
> followed by raise of a flag that prevents the function from being called
> again.  The function is expected to unwind its internal errors itself, so
> it may be safely called once more after it returns an error.
> 
> In case of ring submission, the function first gets a reference to the
> engine's legacy timeline and then allocates a VMA.  If the VMA allocation
> fails, e.g. when i915_vma_instance() called from inside is interrupted
> with a signal, then ring_context_alloc() fails, leaving the timeline held
> referenced.  On next I915_GEM_EXECBUFFER2 IOCTL, another reference to the
> timeline is got, and only that last one is put on successful completion.
> As a consequence, the legacy timeline, with its underlying engine status
> page's VMA object, is still held and not released on driver unbind.
> 
> Get the legacy timeline only after successful allocation of the context
> engine's VMA.
> 
> v2: Add a note on other submission methods (Krzysztof Karas):
>     Both execlists and GuC submission use lrc_alloc() which seems free
>     from a similar issue.
> 
> Fixes: 75d0a7f31eec ("drm/i915: Lift timeline into intel_context")
> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12061
> Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
> Cc: Matthew Auld <matthew.auld@intel.com>
> Cc: Krzysztof Karas <krzysztof.karas@intel.com>
> Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
> Reviewed-by: Krzysztof Niemiec <krzysztof.niemiec@intel.com>
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/intel_ring_submission.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/intel_ring_submission.c b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> index a876a34455f11..2a6d79abf25b5 100644
> --- a/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_ring_submission.c
> @@ -610,7 +610,6 @@ static int ring_context_alloc(struct intel_context *ce)
>  	/* One ringbuffer to rule them all */
>  	GEM_BUG_ON(!engine->legacy.ring);
>  	ce->ring = engine->legacy.ring;
> -	ce->timeline = intel_timeline_get(engine->legacy.timeline);
>  
>  	GEM_BUG_ON(ce->state);
>  	if (engine->context_size) {
> @@ -623,6 +622,8 @@ static int ring_context_alloc(struct intel_context *ce)
>  		ce->state = vma;
>  	}
>  
> +	ce->timeline = intel_timeline_get(engine->legacy.timeline);
> +
>  	return 0;
>  }
>  
> -- 
> 2.49.0
