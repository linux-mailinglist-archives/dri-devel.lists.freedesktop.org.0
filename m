Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E6704943EF
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 00:55:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4231910E2D2;
	Wed, 19 Jan 2022 23:55:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BFA410E2D2;
 Wed, 19 Jan 2022 23:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1642636543; x=1674172543;
 h=date:from:to:subject:message-id:references:mime-version:
 in-reply-to; bh=uCVZjXt17Nfv/G9qw2L3K1mqeAXwrnobzh2GWeu989k=;
 b=Xq7ZTsMM63DynNcsOqCTWO9FYusqG5qQiUuqKR0FPqhtY4icnujnFHyU
 uau5jvNDzfRG5GU0jcUokhVqOJPjGfCVFN8Ow/DgXp4QPoZKN/EZXVi1T
 BPOkrsfGNACQGfrtbbeFZOZiFIEh5pgMSvTygfEkbXrHTHiwswnj8HEju
 8t4Ps102BqAZ8uKBnuDJCrUwh0ENXwthh4immDu5DUlcvnuFMlIkvHU8T
 XLgKC9jjM38JX6E9nzbzeXOz+10IeXOlZOem5tOYS0gDG9RTq0mdofhI3
 mA4HNrE6UKdytsBONN/zKuq26tSj3gEpIna/IwwfebJSmLSog9aAHI6fl A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10231"; a="245022785"
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="245022785"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 15:55:42 -0800
X-IronPort-AV: E=Sophos;i="5.88,300,1635231600"; d="scan'208";a="477585769"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2022 15:55:42 -0800
Date: Wed, 19 Jan 2022 15:55:42 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: David Airlie <airlied@linux.ie>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org,
 Christian =?utf-8?B?S++/vW5pZw==?= <christian.koenig@amd.com>
Subject: Re: [PATCH 0/7] DRM kmap() fixes and kmap_local_page() conversions
Message-ID: <20220119235542.GF209936@iweiny-DESK2.sc.intel.com>
References: <20211210232404.4098157-1-ira.weiny@intel.com>
 <20220119165356.GD209936@iweiny-DESK2.sc.intel.com>
 <YehJRt+JngIsj+Gd@phenom.ffwll.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YehJRt+JngIsj+Gd@phenom.ffwll.local>
User-Agent: Mutt/1.11.1 (2018-12-01)
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

On Wed, Jan 19, 2022 at 06:24:22PM +0100, Daniel Vetter wrote:
> On Wed, Jan 19, 2022 at 08:53:56AM -0800, Ira Weiny wrote:
> > On Fri, Dec 10, 2021 at 03:23:57PM -0800, 'Ira Weiny' wrote:
> > > From: Ira Weiny <ira.weiny@intel.com>
> > > 
> > > This series starts by converting the last easy kmap() uses to
> > > kmap_local_page().
> > > 
> > > There is one more call to kmap() wrapped in ttm_bo_kmap_ttm().  Unfortunately,
> > > ttm_bo_kmap_ttm() is called in a number of different ways including some which
> > > are not thread local.  I have a patch to convert that call.  However, it is not
> > > straight forward so it is not included in this series.
> > > 
> > > The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
> > > conversion.
> > 
> > Gentile ping on this series?  Will it make this merge window?
> 
> I think this fell through the cracks and so no. Note that generally we
> feature-freeze drm tree around -rc6 anyway for the upcoming merge window,
> so you were cutting this all a bit close anyway.

Ok, No problem.  I just had not heard if this was picked up or not.

> Also looks like the ttm
> kmap caching question didn't get resolved?

I'm sorry I thought it was resolve for this series.  Christian said the patches
in this series were "a good bug fix" even if not strictly necessary.[1]  Beyond
this series I was discussing where to go from here, and is it possible to go
further with more changes.[2]  At the moment I don't think I will.

Christian did I misunderstand?  I can drop patch 6 and 7 if they are not proper
bug fixes or at least clarifications to the code.

Ira

[1] https://lore.kernel.org/lkml/c3b173ea-6509-ebbe-b5f9-eeb29f1ce57e@amd.com/
[2] https://lore.kernel.org/lkml/20211215210949.GW3538886@iweiny-DESK2.sc.intel.com/

> 
> Anyway if patches are stuck resend with RESEND and if people still don't
> pick them up poke me and I'll apply as fallback.
> 
> Cheers, Daniel
> 
> > 
> > Thanks,
> > Ira
> > 
> > > 
> > > 
> > > Ira Weiny (7):
> > > drm/i915: Replace kmap() with kmap_local_page()
> > > drm/amd: Replace kmap() with kmap_local_page()
> > > drm/gma: Remove calls to kmap()
> > > drm/radeon: Replace kmap() with kmap_local_page()
> > > drm/msm: Alter comment to use kmap_local_page()
> > > drm/amdgpu: Ensure kunmap is called on error
> > > drm/radeon: Ensure kunmap is called on error
> > > 
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
> > > drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> > > drivers/gpu/drm/gma500/gma_display.c | 6 ++----
> > > drivers/gpu/drm/gma500/mmu.c | 8 ++++----
> > > drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 4 ++--
> > > drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> > > drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
> > > drivers/gpu/drm/i915/gt/shmem_utils.c | 4 ++--
> > > drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
> > > drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> > > drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
> > > drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> > > drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
> > > 13 files changed, 32 insertions(+), 32 deletions(-)
> > > 
> > > --
> > > 2.31.1
> > > 
> 
> -- 
> Daniel Vetter
> Software Engineer, Intel Corporation
> http://blog.ffwll.ch
