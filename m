Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6EC37EF4DB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Nov 2023 16:01:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B027610E149;
	Fri, 17 Nov 2023 15:01:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C39410E143;
 Fri, 17 Nov 2023 15:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700233301; x=1731769301;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=RC2qRfgRWV3Qbl0MbQTPzYvryrYtGLkdDeonHjqd1sU=;
 b=OD86Nqh1dsjtDiITtxOEUrxasA/LL2MkCNZcAPuWLFpELzPYnaUkxrkD
 0M6RY6HpcnRi3Zkcxn510cvSSifUGKIDpVsDLO8qAl0lgC8jEbY84YEY9
 KlQ1vbTCXPiqYhysAGfgsInzbS7+SG2qLckQoT2GyxyP/sfJe1AM9KK1t
 ziA1tIV0KttDfihJzUScDYR/bCKAbGpAnFuOxjeisRkTohe3qHn82v6X8
 DWVglJypiRyZVHZXmWhL1lQJSQnxjU+XRM0UCxhvfjY0lJWsYHXeXuIwa
 ekZBAKBAi4ZICvLZFPMUZmp7g101dSxg0B7F9a6g710J8BqmbXLiUmw2I g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="371489465"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="371489465"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10897"; a="883148966"
X-IronPort-AV: E=Sophos;i="6.04,206,1695711600"; d="scan'208";a="883148966"
Received: from kmreisi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.39.130])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2023 07:01:33 -0800
Date: Fri, 17 Nov 2023 16:01:26 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: Re: [PATCH v3] drm/i915/vma: Fix VMA UAF on destroy against
 deactivate race
Message-ID: <ZVeARowjkzIIZgjK@ashyti-mobl2.lan>
References: <20231116140719.1046040-2-janusz.krzysztofik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-15
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231116140719.1046040-2-janusz.krzysztofik@linux.intel.com>
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
 Thomas =?iso-8859-15?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Janusz,

On Thu, Nov 16, 2023 at 03:07:20PM +0100, Janusz Krzysztofik wrote:
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
> That has been tracked down to be happening when another thread is
> deactivating the VMA inside __active_retire() helper, after the VMA's
> active counter has been already decremented to 0, but before deactivation
> of the VMA's object is reported to the object debugging tool.
> 
> We could prevent from that race by serializing i915_active_fini() with
> __active_retire() via ref->tree_lock, but that wouldn't stop the VMA from
> being used, e.g. from __i915_vma_retire() called at the end of
> __active_retire(), after that VMA has been already freed by a concurrent
> i915_vma_destroy() on return from the i915_active_fini().  Then, we should
> rather fix the issue at the VMA level, not in i915_active.
> 
> Since __i915_vma_parked() is called from __gt_park() on last put of the
> GT's wakeref, the issue could be addressed by holding the GT wakeref long
> enough for __active_retire() to complete before that wakeref is released
> and the GT parked.
> 
> A VMA associated with a request doesn't acquire a GT wakeref by itself.
> Instead, it depends on a wakeref held directly by the request's active
> intel_context for a GT associated with its VM, and indirectly on that
> intel_context's engine wakeref if the engine belongs to the same GT as the
> VMA's VM.  In case of single-tile platforms, at least one of those
> wakerefs is usually held long enough for the request's VMA to be
> deactivated on time, before it is destroyed on last put of its VM GT
> wakeref.  However, on multi-tile platforms, a request may use a VMA from a
> tile other than the one that hosts the request's engine, then it is
> protected only with the intel_context's VM GT wakeref.
> 
> There was an attempt to fix this issue on 2-tile Meteor Lake by acquiring
> an extra wakeref for a Primary GT from i915_gem_do_execbuffer() -- see
> commit f56fe3e91787 ("drm/i915: Fix a VMA UAF for multi-gt platform").
> However, it occurred insufficient -- the issue was still reported by CI.
> That wakeref was released on exit from i915_gem_do_execbuffer(), then
> potentially before completion of the request and deactivation of its
> associated VMAs.
> 
> OTOH, CI reports indicate that single-tile platforms also suffer
> sporadically from the same race.
> 
> I believe the issue was introduced by commit d93939730347 ("drm/i915:
> Remove the vma refcount") which moved a call to i915_active_fini() from
> a dropped i915_vma_release(), called on last put of the removed VMA kref,
> to i915_vma_parked() processing path called on last put of a GT wakeref.
> However, its visibility to the object debugging tool was suppressed by a
> bug in i915_active that was fixed two weeks later with commit e92eb246feb9
> ("drm/i915/active: Fix missing debug object activation").
> 
> Fix the issue by getting a wakeref for the VMA's tile when activating it,
> and putting that wakeref only after the VMA is deactivated.  However,
> exclude global GTT from that processing path, otherwise the GPU never goes
> idle.  Since __i915_vma_retire() may be called from atomic contexts, use
> async variant of wakeref put.
> 
> Having that fixed, stop explicitly acquiring the extra GT0 wakeref from
> inside i915_gem_do_execbuffer(), and also drop an extra call to
> i915_active_wait(), introduced by commit 7a2280e8dcd2 ("drm/i915: Wait for
> active retire before i915_active_fini()") as another insufficient fix for
> this UAF race.
> 
> v3: Identify root cause more precisely, and a commit to blame,
>   - identify and drop former workarounds,
>   - update commit message and description.
> v2: Get the wakeref before VM mutex to avoid circular locking dependency,
>   - drop questionable Fixes: tag.
> 
> Fixes: d93939730347 ("drm/i915: Remove the vma refcount")
> Closes: https://gitlab.freedesktop.org/drm/intel/issues/8875
> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
> Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> Cc: Nirmoy Das <nirmoy.das@intel.com>
> Cc: Andi Shyti <andi.shyti@linux.intel.com>
> Cc: stable@vger.kernel.org # v5.19+

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>

Thanks,
Andi
