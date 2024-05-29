Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 134A68D39E1
	for <lists+dri-devel@lfdr.de>; Wed, 29 May 2024 16:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C50113CCA;
	Wed, 29 May 2024 14:49:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dgcZtJ76";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 582F9113CA2;
 Wed, 29 May 2024 14:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716994196; x=1748530196;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hfcaESIUq+K1Ir52clUOBDByxjsdRKPZCin1+6wSWIo=;
 b=dgcZtJ76YyDWsXD4BJI0o5cnrqFJhUqRculSeb22qxEW3R8DWtBq+x8Z
 +2dh3bp0QeL5mOUmB5Yv8CCgNZpTyWo3loF9b07DQz2oJY6l/QEYqCRKn
 q5fAQb2OcXE4061M+0gpFEiAngAweL2gAQgL6eOSP4L5Tib/oVn/BNssB
 hot7YX/zzkf8h0KtTe6neTnuu9vx1CD5iJtMGVM6Wk4y9L+6YjKEw0xq8
 ILkg5wB6DECoxjG+kBTb/1+LiUGFrSj+7IAUAhhsP2WDEZo2i2dCmv9Lw
 m9OdrYYYATHEkfHrM893+hD2qd2GthQHinds4HS2TGy/WWwW54l3iPYeA g==;
X-CSE-ConnectionGUID: U1q6BAA9TXW9tLek/b5mwg==
X-CSE-MsgGUID: KPlCJuX3TC6Z9/j2pblZmg==
X-IronPort-AV: E=McAfee;i="6600,9927,11087"; a="24534739"
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="24534739"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:49:55 -0700
X-CSE-ConnectionGUID: xREn7QdzT7e7xdrwE7W2FA==
X-CSE-MsgGUID: vjCZHBr8RSOMHYj/Nc1Lww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,198,1712646000"; d="scan'208";a="35542691"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.20.171])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 May 2024 07:49:52 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH] drm/i915/selftest_hangcheck: Fix potential UAF after HW
 fence revoke
Date: Wed, 29 May 2024 16:49:50 +0200
Message-ID: <2325099.ElGaqSPkdT@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <20240529113809.145084-2-janusz.krzysztofik@linux.intel.com>
References: <20240529113809.145084-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

On Wednesday, 29 May 2024 13:37:23 GMT+2 Janusz Krzysztofik wrote:
> CI is sporadically reporting the following issue triggered by
> igt@i915_selftest@live@hangcheck test case:
> 
> <6> [414.049203] i915: Running intel_hangcheck_live_selftests/igt_reset_evict_fence
> ...
> <6> [414.068804] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
> <6> [414.068812] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
> <3> [414.070354] Unable to pin Y-tiled fence; err:-4
> <3> [414.071282] i915_vma_revoke_fence:301 GEM_BUG_ON(!i915_active_is_idle(&fence->active))
> ...
> <4>[  609.603992] ------------[ cut here ]------------
> <2>[  609.603995] kernel BUG at drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c:301!
> <4>[  609.604003] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> <4>[  609.604006] CPU: 0 PID: 268 Comm: kworker/u64:3 Tainted: G     U  W          6.9.0-CI_DRM_14785-g1ba62f8cea9c+ #1
> <4>[  609.604008] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
> <4>[  609.604010] Workqueue: i915 __i915_gem_free_work [i915]
> <4>[  609.604149] RIP: 0010:i915_vma_revoke_fence+0x187/0x1f0 [i915]
> ...
> <4>[  609.604271] Call Trace:
> <4>[  609.604273]  <TASK>
> ...
> <4>[  609.604716]  __i915_vma_evict+0x2e9/0x550 [i915]
> <4>[  609.604852]  __i915_vma_unbind+0x7c/0x160 [i915]
> <4>[  609.604977]  force_unbind+0x24/0xa0 [i915]
> <4>[  609.605098]  i915_vma_destroy+0x2f/0xa0 [i915]
> <4>[  609.605210]  __i915_gem_object_pages_fini+0x51/0x2f0 [i915]
> <4>[  609.605330]  __i915_gem_free_objects.isra.0+0x6a/0xc0 [i915]
> <4>[  609.605440]  process_scheduled_works+0x351/0x690
> 
> Since no other tests nor users report that issue, 

I was wrong, there were similar CI reports from other tests, not within last 3 
months but still looking the same.  Please ignore this patch, I need to try 
again to identify a common root cause of all those occurrences.

Thanks,
Janusz

> I believe it is specific
> to that test case, which should just wait after reset it triggers for
> actual completion of a request that it forced to claim using a hardware
> fence before it releases allocated resources.  Fix it.
> 
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> ---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> index 9ce8ff1c04fe5..b47c99f38a525 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_hangcheck.c
> @@ -1568,6 +1568,8 @@ static int __igt_reset_evict_vma(struct intel_gt *gt,
>  
>  out_rq:
>  	i915_request_put(rq);
> +	if (flags & EXEC_OBJECT_NEEDS_FENCE)
> +		i915_active_wait(&arg.vma->fence->active);
>  out_obj:
>  	i915_gem_object_put(obj);
>  fini:
> 




