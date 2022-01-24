Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E09498850
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jan 2022 19:27:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E3A010E7CD;
	Mon, 24 Jan 2022 18:27:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5083710E7CD;
 Mon, 24 Jan 2022 18:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643048862; x=1674584862;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:content-transfer-encoding:in-reply-to;
 bh=QYEAybRwP0jTcU3cihM+fGC4MwyHH67iS4J4O/RWUsE=;
 b=aTVpXun8YP4g4591uQvIc7RnSiJgpbHpwdTSyjoThbjhq59NUTEpA7/L
 t8Z8KkVSrDfHHh0XC0e3Foxm8MFrEcBhP5Zm+eg5kBelFGOlDgRsd8AU2
 j8YwDeEzz+OOgW+iM4cP++ffUPB2JJbrrQVWtfm91LJSNvxUs5NI25A25
 CCqvrGYNKB5f/hMPvP/DX16u0UWqmghpIuD3QWyazyMeA+IlidFsJ/5Nr
 tQSL/+eaUfdvXE73t7oN9Ot+UyqeJrDLdUHgUHl39iGN4SM7ok7ZyySJo
 ICHoKiKq1hbbBlBKL3Z1wkaT+DIppe4clM7IEMnM1JAefX3RZ/wXHLzdd A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="306829355"
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="306829355"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:27:41 -0800
X-IronPort-AV: E=Sophos;i="5.88,311,1635231600"; d="scan'208";a="479182936"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2022 10:27:41 -0800
Date: Mon, 24 Jan 2022 10:27:41 -0800
From: Ira Weiny <ira.weiny@intel.com>
To: Christian =?iso-8859-1?Q?K=F6nig?= <ckoenig.leichtzumerken@gmail.com>
Subject: Re: [PATCH V2 0/7] DRM kmap() fixes and kmap_local_page() conversions
Message-ID: <20220124182741.GC785175@iweiny-DESK2.sc.intel.com>
References: <20220124015409.807587-1-ira.weiny@intel.com>
 <a56344b6-b1bd-6749-5ed2-5f38bf79dcee@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a56344b6-b1bd-6749-5ed2-5f38bf79dcee@gmail.com>
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
Cc: amd-gfx@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sean Paul <sean@poorly.run>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jan 24, 2022 at 01:08:26PM +0100, Christian König wrote:
> Am 24.01.22 um 02:54 schrieb ira.weiny@intel.com:
> > From: Ira Weiny <ira.weiny@intel.com>
> > 
> > Changes from V1:
> > 	Use memcpy_to_page() where appropriate
> > 	Rebased to latest
> > 
> > The kmap() call may cause issues with work being done with persistent memory.
> > For this and other reasons it is being deprecated.
> 
> I'm really wondering how we should be able to implement the kernel mapping
> without kmap in TTM.
> 
> > This series starts by converting the last easy kmap() uses in the drm tree to
> > kmap_local_page().
> > 
> > The final 2 patches fix bugs found while working on the ttm_bo_kmap_ttm()
> > conversion.  They are valid fixes but were found via code inspection not
> > because of any actual bug so don't require a stable tag.[1]
> > 
> > There is one more call to kmap() used in ttm_bo_kmap_ttm().  Unfortunately,
> > fixing this is not straight forward so it is left to future work.[2]
> 
> Patches #2, #4, #6 and #7 are Reviewed-by: Christian König
> <christian.koenig@amd.com>

Christian,

Would you prefer I send those 4 to you as a separate series?

> 
> How to you now want to push those upstream? I can pick them up for the AMD
> tree like Daniel suggested or you can push them through something else.

You picking them up from this series is ok as well.

Daniel will you take #1, #3, and #5?

Thanks,
Ira

> 
> Regards,
> Christian.
> 
> > 
> > [1] https://lore.kernel.org/lkml/fb71af05-a889-8f6e-031b-426b58a64f00@amd.com/
> > [2] https://lore.kernel.org/lkml/20211215210949.GW3538886@iweiny-DESK2.sc.intel.com/
> > 
> > 
> > Ira Weiny (7):
> > drm/i915: Replace kmap() with kmap_local_page()
> > drm/amd: Replace kmap() with kmap_local_page()
> > drm/gma: Remove calls to kmap()
> > drm/radeon: Replace kmap() with kmap_local_page()
> > drm/msm: Alter comment to use kmap_local_page()
> > drm/amdgpu: Ensure kunmap is called on error
> > drm/radeon: Ensure kunmap is called on error
> > 
> > drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 8 ++++----
> > drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c | 1 +
> > drivers/gpu/drm/gma500/gma_display.c | 6 ++----
> > drivers/gpu/drm/gma500/mmu.c | 8 ++++----
> > drivers/gpu/drm/i915/gem/i915_gem_shmem.c | 6 ++----
> > drivers/gpu/drm/i915/gem/selftests/i915_gem_mman.c | 8 ++++----
> > drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c | 4 ++--
> > drivers/gpu/drm/i915/gt/shmem_utils.c | 7 ++-----
> > drivers/gpu/drm/i915/i915_gem.c | 8 ++++----
> > drivers/gpu/drm/i915/i915_gpu_error.c | 4 ++--
> > drivers/gpu/drm/msm/msm_gem_submit.c | 4 ++--
> > drivers/gpu/drm/radeon/radeon_ttm.c | 4 ++--
> > drivers/gpu/drm/radeon/radeon_uvd.c | 1 +
> > 13 files changed, 32 insertions(+), 37 deletions(-)
> > 
> > --
> > 2.31.1
> > 
> 
