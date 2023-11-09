Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DC617E6CA2
	for <lists+dri-devel@lfdr.de>; Thu,  9 Nov 2023 15:48:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A3A10E8C1;
	Thu,  9 Nov 2023 14:47:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90CF910E8BA;
 Thu,  9 Nov 2023 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699541273; x=1731077273;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=pMCoir8lhajIvq9ksZxeg9xETGP9/e+PhBR2qqVkxjs=;
 b=EW3OYeVsQel+gIXUQ4o/gF8sj8TKJg0wG3dBYtr8PLxOMLI40yONMtqg
 D4DnsMK+gTHuJGKTzYa1as4aSDEjyBahhxxJlQ2DY7/zSyyh4jYY1pIeJ
 aFG4W6PCV23EB1S+ss+O0FOlt/z3oz10il1UC81jFkx2CGxK33Bs1Rgt7
 NTT4f3ipSqCqSar1WTMs/s6o884XJNzecrrGyBGrXZPu9/qL17r1hpxAD
 f6t2OKPSmSmIXCKzKJ9uhFQFUfzCrwz0pMWBvkScjL7D9Q3KNEJOastww
 Qf128kV25xvlj2kIo/Q20zL0oRmGx/YqQJO1zFyyCrQywks7NT/YfxAfr A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="11544207"
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; d="scan'208";a="11544207"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:47:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,289,1694761200"; 
   d="scan'208";a="4732983"
Received: from aheinala-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.251.217.174])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2023 06:47:48 -0800
Date: Thu, 9 Nov 2023 15:47:45 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v2] drm/i915/vma: Fix potential UAF on multi-tile platforms
Message-ID: <ZUzxEQF-PDspWWbS@ashyti-mobl2.lan>
References: <20231108162905.77602-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231108162905.77602-2-janusz.krzysztofik@linux.intel.com>
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
 Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Andi Shyti <andi.shyti@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Wed, Nov 08, 2023 at 05:29:06PM +0100, Janusz Krzysztofik wrote:
> Object debugging tools were sporadically reporting illegal attempts to
> free a still active i915 VMA object from when parking a GPU tile believed
> to be idle.
> 
> [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 debug_print_object+0x80/0xb0
> ...
> [161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-CI_DRM_13375-g003f860e5577+ #1
> [161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
> [161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
> [161.360592] RIP: 0010:debug_print_object+0x80/0xb0
> ...
> [161.361347] debug_object_free+0xeb/0x110
> [161.361362] i915_active_fini+0x14/0x130 [i915]
> [161.361866] release_references+0xfe/0x1f0 [i915]
> [161.362543] i915_vma_parked+0x1db/0x380 [i915]
> [161.363129] __gt_park+0x121/0x230 [i915]
> [161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]
> 
> That has been tracked down to be happening when another thread was
> deactivating the VMA inside __active_retire() helper, after the VMA's
> active counter was already decremented to 0, but before deactivation of
> the VMA's object was reported to the object debugging tools.  Root cause
> has been identified as premature release of last wakeref for the GPU tile
> to which the active VMA belonged.
> 
> In case of single-tile platforms, an engine associated with a request that
> uses the VMA is usually keeping the tile's wakeref long enough for that
> VMA to be deactivated on time, before it is going to be freed on last put
> of that wakeref.  However, on multi-tile platforms, a request may use a
> VMA from a tile other than the one that hosts the request's engine, then,
> not protected with the engine's wakeref.
> 
> Get an extra wakeref for the VMA's tile when activating it, and put that
> wakeref only after the VMA is deactivated.  However, exclude GGTT from
> that processing path, otherwise the GPU never goes idle.  Since
> __i915_vma_retire() may be called from atomic contexts, use async variant
> of wakeref put.
> 
> CI reports indicate that single-tile platforms also suffer sporadically
> from the same race, however, unlike in case of multi-tile, exact scenario
> when that happens hasn't been discovered yet.  Then, while I submit this
> patch as fix for multi-tile cases, and in hope it also addresses single-
> tile, I'm not able to blame any particular commit for that issue.
> However, I'm going to ask i915 maintainers to include this fix, if
> accepted, in the current rc cycle (6.7-rc) as important for the first
> supported multi-tile platform -- Meteor Lake.
> 
> v2: Get the wakeref before vm mutex to avoid circular locking dependency,
>   - drop questionable Fixes: tag.
> 
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>

Can it be:

Fixes: 12c255b5dad1 ("drm/i915: Provide an i915_active.acquire callback")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: <stable@vger.kernel.org> # v5.4+

It's not exactly the one fix we need for as this patch is fixing
something on its own but not explicitely stated (maybe it was a
precautionary measure).

But if the fix has to be applied, it has to date back to that
period, I guess.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Andi
