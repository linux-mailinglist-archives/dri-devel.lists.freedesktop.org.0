Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 438A88FB702
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jun 2024 17:27:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF88B10E4E4;
	Tue,  4 Jun 2024 15:27:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PzQ61p9W";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB0D10E4E5;
 Tue,  4 Jun 2024 15:27:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717514851; x=1749050851;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=j95w59CIYJ4xyAPtZLHyBsR8EnLY7Kn9kP4QR9DUP5E=;
 b=PzQ61p9WDbAuzoXtWG6zKr2GqkTnTmKC/teyaqveBQGjn/yWI03rDZso
 N5GhFoFogGo3yInqJN67mk0OvBFKdbeEHCTvuG6p/HAej18Hizlx88mwT
 VfOn5G/KJU6xQ0zViO0a4ppCYa+rXbNpXOmOQ0TjBxH1AvznuhqvgzcjE
 QJRWPFEVEeMisku/MvdL6eoMDya4jusd5web1PDpWaMuHyH8hVtv5V4CI
 vwlgxrTYPVoDvsD9hWjayDIohRTHRdpDosAbWTdw1kjg7iSFWtDBk18z+
 05b/9WrsVcN0UssXnvEFPzX/OfReTXA1+OT3E8MLAhCZ/QeX01uvvvifB w==;
X-CSE-ConnectionGUID: 4XvKEchCRG+D2Kv2aICnxw==
X-CSE-MsgGUID: Z4eHy5rXS9uFwm7jxXTF8g==
X-IronPort-AV: E=McAfee;i="6600,9927,11093"; a="17908930"
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="17908930"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:27:31 -0700
X-CSE-ConnectionGUID: N4nlaNsdTJyiHWcA0fMm5A==
X-CSE-MsgGUID: M1fZKl0gTBaE1edn5QA2Lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,214,1712646000"; d="scan'208";a="42231605"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.251.212.221])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jun 2024 08:27:28 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, 
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Nirmoy Das <nirmoy.das@intel.com>,
 Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH] drm/i915/gt: Fix potential UAF by revoke of fence
 registers
Date: Tue, 04 Jun 2024 17:27:24 +0200
Message-ID: <3565005.iIbC2pHGDl@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <Zl5ka7WSVAv3THW6@ashyti-mobl2.lan>
References: <20240603195446.297690-2-janusz.krzysztofik@linux.intel.com>
 <Zl5ka7WSVAv3THW6@ashyti-mobl2.lan>
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

Hi Andi,

Thanks for review.

On Tuesday, 4 June 2024 02:48:43 GMT+2 Andi Shyti wrote:
> Hi Janusz,
> 
> On Mon, Jun 03, 2024 at 09:54:45PM +0200, Janusz Krzysztofik wrote:
> > CI has been sporadically reporting the following issue triggered by
> > igt@i915_selftest@live@hangcheck on ADL-P and similar machines:
> > 
> > <6> [414.049203] i915: Running intel_hangcheck_live_selftests/igt_reset_evict_fence
> > ...
> > <6> [414.068804] i915 0000:00:02.0: [drm] GT0: GUC: submission enabled
> > <6> [414.068812] i915 0000:00:02.0: [drm] GT0: GUC: SLPC enabled
> > <3> [414.070354] Unable to pin Y-tiled fence; err:-4
> > <3> [414.071282] i915_vma_revoke_fence:301 GEM_BUG_ON(!i915_active_is_idle(&fence->active))
> > ...
> > <4>[  609.603992] ------------[ cut here ]------------
> > <2>[  609.603995] kernel BUG at drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c:301!
> > <4>[  609.604003] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
> > <4>[  609.604006] CPU: 0 PID: 268 Comm: kworker/u64:3 Tainted: G     U  W          6.9.0-CI_DRM_14785-g1ba62f8cea9c+ #1
> > <4>[  609.604008] Hardware name: Intel Corporation Alder Lake Client Platform/AlderLake-P DDR4 RVP, BIOS RPLPFWI1.R00.4035.A00.2301200723 01/20/2023
> > <4>[  609.604010] Workqueue: i915 __i915_gem_free_work [i915]
> > <4>[  609.604149] RIP: 0010:i915_vma_revoke_fence+0x187/0x1f0 [i915]
> > ...
> > <4>[  609.604271] Call Trace:
> > <4>[  609.604273]  <TASK>
> > ...
> > <4>[  609.604716]  __i915_vma_evict+0x2e9/0x550 [i915]
> > <4>[  609.604852]  __i915_vma_unbind+0x7c/0x160 [i915]
> > <4>[  609.604977]  force_unbind+0x24/0xa0 [i915]
> > <4>[  609.605098]  i915_vma_destroy+0x2f/0xa0 [i915]
> > <4>[  609.605210]  __i915_gem_object_pages_fini+0x51/0x2f0 [i915]
> > <4>[  609.605330]  __i915_gem_free_objects.isra.0+0x6a/0xc0 [i915]
> > <4>[  609.605440]  process_scheduled_works+0x351/0x690
> > ...
> > 
> > In the past, there were similar failures reported by CI from other IGT
> > tests, observed on other platforms.
> > 
> > Before commit 63baf4f3d587 ("drm/i915/gt: Only wait for GPU activity
> > before unbinding a GGTT fence"), i915_vma_revoke_fence() was waiting for
> > idleness of vma->active via fence_update().   That commit introduced
> > vma->fence->active in order for the fence_update() to be able to wait
> > selectively on that one instead of vma->active since only idleness of
> > fence registers was needed.  But then, another commit 0d86ee35097a
> > ("drm/i915/gt: Make fence revocation unequivocal") replaced the call to
> > fence_update() in i915_vma_revoke_fence() with only fence_write(), and
> > also added that GEM_BUG_ON(!i915_active_is_idle(&fence->active)) in front.
> > No justification was provided on why we might then expect idleness of
> > vma->fence->active without first waiting on it.
> > 
> > The issue can be potentially caused by a race among revocation of fence
> > registers on one side and sequential execution of signal callbacks invoked
> > on completion of a request that was using them on the other, still
> > processed in parallel to revocation of those fence registers.  Fix it by
> > waiting for idleness of vma->fence->active in i915_vma_revoke_fence().
> > 
> > Fixes: 0d86ee35097a ("drm/i915/gt: Make fence revocation unequivocal")
> > Closes: https://gitlab.freedesktop.org/drm/intel/issues/10021
> > Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> > Cc: stable@vger.kernel.org # v5.8+
> 
> Just wondering whether we really need the stable kernel here.
> 
> We have just an alleged failure reported on a selftest. I think
> we can drop the stable requirement.

Please note there were similar failures from other tests reported by CI in the 
past, e.g., https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/8846, 
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/10638.  Would you like 
me to mention them in commit description.

OTOH, stable will probably pick this patch up themselves, based on the Fixes: 
commit ID, even if we drop the Cc: stable.

Anyway, please feel free to drop Cc: stable, you or anyone who will be 
pushing.

Thanks,
Janusz

> 
> Otherwise,
> 
> Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
> 
> Thanks,
> Andi
> 




