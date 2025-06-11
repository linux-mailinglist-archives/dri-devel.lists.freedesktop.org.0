Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DF91AD6063
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 22:53:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 440DA10E716;
	Wed, 11 Jun 2025 20:53:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ABoaEuIx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ED0D10E080;
 Wed, 11 Jun 2025 20:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749675191; x=1781211191;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=zpoH5C4gPM9XMTjOSrFU15U3mFfH2uLO4+rbpalZ+XM=;
 b=ABoaEuIxIlWHzIweXHEr1+vZCEBJFro67b2AAqeZHDOqIEhQVGFau+hJ
 jdirK+Z1e2Zufkt0/eeGNNXfPhJgwkVkWbx7jENNmOktWm0Nd8OJLOsog
 7DpHcwwk1TeS3EQHjKlqOfwK7U15PVtLuAFWI/d+RM8c9a6zyFdSz5Acr
 IYnbLtG47wYv9Ep1CPU8HQJHmuisBNalaJvjVoPaPBOZnz6IwGtAlGVpD
 qGGQ6LtTgmegqqnjvcHN6Kz2TkB3PQuj1qqK6Nr0Ny7aJdxMi0akDKFey
 0n2tKlHq7OOxgkKRuRmtJIc0g/FDI/Ykl25ITjXq8eEJ9xZDu3DAhqcrn g==;
X-CSE-ConnectionGUID: A64iJyYSTreCPsdmkvZBpw==
X-CSE-MsgGUID: KSC9Fp/tRyijNdwP8jciZw==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="51931127"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="51931127"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:53:10 -0700
X-CSE-ConnectionGUID: VL+NpxjTTm6viQj73Rc9Og==
X-CSE-MsgGUID: vRzpQ5iESb23tgmAHTAErQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; d="scan'208";a="147177950"
Received: from smoticic-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.195])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jun 2025 13:53:07 -0700
Date: Wed, 11 Jun 2025 22:53:03 +0200
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
Message-ID: <aEnsrzx_7IuvgSxJ@ashyti-mobl2.lan>
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

Yeah, it basically needed a cleanup before returning error.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

You are still missing

Cc: <stable@vger.kernel.org> # v5.4+

Thanks,
Andi
