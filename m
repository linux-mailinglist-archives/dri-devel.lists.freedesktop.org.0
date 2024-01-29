Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C548584036B
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jan 2024 12:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87EFD1128AF;
	Mon, 29 Jan 2024 11:03:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7C41128A9;
 Mon, 29 Jan 2024 11:03:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706526218; x=1738062218;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PuraoPBQ8SVvGrq76AP7UIstFjNOEGx414LouYE8oig=;
 b=bgKkAyWP7aLtgXX1WXUzg/9nO836sXbkP4C2D9c/UDjYLRUnPqtXg63V
 mywuyGeZopLCdTlTC4RO2t3WPzgkZRuaAlK2J6BmO4+8EglpI505R63G1
 OsKvvHSFtBx5HRGxyvVxd8rV+ItOnuoDHRh3YoUBa6wZ2y8hmrBSjTGH4
 MrU5Dy3BgsQnD9/mRjQJDAv8OXGyYtD14r3UEt0q9ChkPwiSVOaxL5M9R
 iDjvigsmH+skBjRL5RuwQMQCWuJD2QZGYHftB12SJXH+fDMHKu0Ypend1
 +2szsLWDO2f8p33RPIMpRdQHa4ZGkolhfgbKc/p5gtxM1nZbIKBAhf+AD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10967"; a="401785089"
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="401785089"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:03:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,227,1701158400"; d="scan'208";a="22069605"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.213.1.213])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jan 2024 03:03:35 -0800
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org, Nirmoy Das <nirmoy.das@intel.com>
Subject: Re: [PATCH v5 0/3] drm/i915: Fix VMA UAF on destroy against
 deactivate race
Date: Mon, 29 Jan 2024 12:03:33 +0100
Message-ID: <3602918.R56niFO833@jkrzyszt-mobl2.ger.corp.intel.com>
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
In-Reply-To: <7c180429-4d1c-4e7e-a769-088271508760@intel.com>
References: <20240124125643.590072-5-janusz.krzysztofik@linux.intel.com>
 <7c180429-4d1c-4e7e-a769-088271508760@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Thomas =?ISO-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 David Airlie <airlied@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Nirmoy,

On Monday, 29 January 2024 10:24:07 CET Nirmoy Das wrote:
> Hi Janusz,
> 
> There seems to be a regression in CI related to this:
> 
> https://intel-gfx-ci.01.org/tree/drm-tip/Patchwork_129026v2/bat-dg1-7/
igt@gem_lmem_swapping@random-engines@lmem0.html#dmesg-warnings1053
> 
> Please have a look.

Yes, that's a problem, the series can't be merged in its current shape.  
However, I'm not sure if that's really a regression, or rather an exposure of 
another, already existing issue.  It looks like a race among two concurrent 
calls to our __active_retire() used in DMA fence callbacks.  I'm going to 
verify some ideas for a fix on trybot.

Thanks,
Janusz

> 
> 
> Regards,
> 
> Nirmoy
> 
> On 1/24/2024 6:13 PM, Janusz Krzysztofik wrote:
> > Object debugging tools were sporadically reporting illegal attempts to
> > free a still active i915 VMA object when parking a GT believed to be idle.
> >
> > [161.359441] ODEBUG: free active (active state 0) object: ffff88811643b958 
object type: i915_active hint: __i915_vma_active+0x0/0x50 [i915]
> > [161.360082] WARNING: CPU: 5 PID: 276 at lib/debugobjects.c:514 
debug_print_object+0x80/0xb0
> > ...
> > [161.360304] CPU: 5 PID: 276 Comm: kworker/5:2 Not tainted 6.5.0-rc1-
CI_DRM_13375-g003f860e5577+ #1
> > [161.360314] Hardware name: Intel Corporation Rocket Lake Client Platform/
RocketLake S UDIMM 6L RVP, BIOS RKLSFWI1.R00.3173.A03.2204210138 04/21/2022
> > [161.360322] Workqueue: i915-unordered __intel_wakeref_put_work [i915]
> > [161.360592] RIP: 0010:debug_print_object+0x80/0xb0
> > ...
> > [161.361347] debug_object_free+0xeb/0x110
> > [161.361362] i915_active_fini+0x14/0x130 [i915]
> > [161.361866] release_references+0xfe/0x1f0 [i915]
> > [161.362543] i915_vma_parked+0x1db/0x380 [i915]
> > [161.363129] __gt_park+0x121/0x230 [i915]
> > [161.363515] ____intel_wakeref_put_last+0x1f/0x70 [i915]
> >
> > That has been tracked down to be happening when another thread is
> > deactivating the VMA inside __active_retire() helper, after the VMA's
> > active counter has been already decremented to 0, but before deactivation
> > of the VMA's object is reported to the object debugging tool.
> >
> > We could prevent from that race by serializing i915_active_fini() with
> > __active_retire() via ref->tree_lock, but that wouldn't stop the VMA from
> > being used, e.g. from __i915_vma_retire() called at the end of
> > __active_retire(), after that VMA has been already freed by a concurrent
> > i915_vma_destroy() on return from the i915_active_fini().  Then, we should
> > rather fix the issue at the VMA level, not in i915_active.
> >
> > Since __i915_vma_parked() is called from __gt_park() on last put of the
> > GT's wakeref, the issue could be addressed by holding the GT wakeref long
> > enough for __active_retire() to complete before that wakeref is released
> > and the GT parked.
> >
> > A VMA associated with a request doesn't acquire a GT wakeref by itself.
> > Instead, it depends on a wakeref held directly by the request's active
> > intel_context for a GT associated with its VM, and indirectly on that
> > intel_context's engine wakeref if the engine belongs to the same GT as the
> > VMA's VM.  Those wakerefs are released asynchronously to VMA deactivation.
> >
> > In case of single-GT platforms, at least one of those wakerefs is usually
> > held long enough for the request's VMA to be deactivated on time, before
> > it is destroyed on last put of its VM GT wakeref.  However, on multi-GT
> > platforms, a request may use a VMA from a GT other than the one that hosts
> > the request's engine, then it is protected only with the intel_context's
> > VM GT wakeref.
> >
> > There was an attempt to fix the issue on 2-GT Meteor Lake by acquiring an
> > extra wakeref for a Primary GT from i915_gem_do_execbuffer() -- see commit
> > f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").  However,
> > that fix occurred insufficient -- the issue was still reported by CI.
> > That wakeref was released on exit from i915_gem_do_execbuffer(), then
> > potentially before completion of the request and deactivation of its
> > associated VMAs.  Moreover, CI reports indicated that single-GT platforms
> > also suffered sporadically from the same race.
> >
> > I believe the issue was introduced by commit d93939730347 ("drm/i915:
> > Remove the vma refcount") which moved a call to i915_active_fini() from
> > a dropped i915_vma_release(), called on last put of the removed VMA kref,
> > to i915_vma_parked() processing path called on last put of a GT wakeref.
> > However, its visibility to the object debugging tool was suppressed by a
> > bug in i915_active that was fixed two weeks later with commit e92eb246feb9
> > ("drm/i915/active: Fix missing debug object activation").
> >
> > Fix the issue by getting a wakeref for the VMA's GT when activating it,
> > and putting that wakeref only after the VMA is deactivated.  However,
> > exclude global GTT from that processing path, otherwise the GPU never goes
> > idle.  Since __i915_vma_retire() may be called from atomic contexts, use
> > async variant of wakeref put.  Also, to avoid circular locking dependency,
> > take care of acquiring the wakeref before VM mutex when both are needed.
> >
> > Having that fixed, stop explicitly acquiring the extra GT0 wakeref from
> > inside i915_gem_do_execbuffer(), and also drop an extra call to
> > i915_active_wait(), introduced by commit 7a2280e8dcd2 ("drm/i915: Wait for
> > active retire before i915_active_fini()") as another insufficient fix for
> > this UAF race.
> >
> > v5: Replace "tile" with "GT" across commit descriptions (Rodrigo),
> >    - reword commit message and description of patch 2 reusing relevant
> >      chunks moved there from commit description of patch 1 (Rodrigo),
> >    - explain why we take a temporary wakeref unconditionally inside
> >      i915_vma_pin_ww() (Rodrigo).
> > v4: Refresh on top of commit 5e4e06e4087e ("drm/i915: Track gt pm
> >      wakerefs") (Andi),
> >    - for more easy backporting, split out removal of former insufficient
> >      workarounds and move them to separate patches (Nirmoy).
> >    - clean up commit message and description a bit.
> > v3: Identify root cause more precisely, and a commit to blame,
> >    - identify and drop former workarounds,
> >    - update commit message and description.
> > v2: Get the wakeref before VM mutex to avoid circular locking dependency,
> >    - drop questionable Fixes: tag.
> >
> > Janusz Krzysztofik (3):
> >    drm/i915/vma: Fix UAF on destroy against retire race
> >    drm/i915: Remove extra multi-gt pm-references
> >    Revert "drm/i915: Wait for active retire before i915_active_fini()"
> >
> >   .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 17 -----------
> >   drivers/gpu/drm/i915/i915_vma.c               | 28 +++++++++++++------
> >   drivers/gpu/drm/i915/i915_vma_types.h         |  1 +
> >   3 files changed, 20 insertions(+), 26 deletions(-)
> >
> 




