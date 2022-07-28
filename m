Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 973C9583E56
	for <lists+dri-devel@lfdr.de>; Thu, 28 Jul 2022 14:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F91B99C15;
	Thu, 28 Jul 2022 12:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CC899BB3;
 Thu, 28 Jul 2022 12:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1659010098; x=1690546098;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=3jiLtV59Oj63tPBciYjw2M2P/yqHMni/unx6284Merw=;
 b=kSh36Zs83g9DJk7LxqnstCu3Rz5Z3pmeu26cS9dgdpjoljKAIjtttT/f
 h49s1LKvpjAYTOn8U1aUqvxkzvnqgL3ZU2DxNYJ/bnaHPVlapYSTAAYw+
 UUlsj9FjZxQDj2kZRLZ1hSpXkn8G7AR/eeynrSa3harZ+AZT4eKl7JJ0Q
 sb0xESR5yJpr2mQ66ITx5MjtcmAKmVmaV09/QC+OQ750Qli+DUkldu5iv
 pRFZlPusY+B5q6XMvESi2zCD0gVUSfBUkXaFuKDEH5BUQC9HpSAsJXpvk
 dUTUkzAj9sbPuHJ5GTF+SiR/HGd39fOj8LBUXiBhdim73+3gwQyoi3eqG w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10421"; a="288507494"
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="288507494"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 05:08:17 -0700
X-IronPort-AV: E=Sophos;i="5.93,198,1654585200"; d="scan'208";a="659698817"
Received: from dgonsal1-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.252.46.97])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jul 2022 05:08:14 -0700
Date: Thu, 28 Jul 2022 14:08:11 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: Re: [Intel-gfx] [PATCH v3 0/6] drm/i915: reduce TLB performance
 regressions
Message-ID: <YuJ8K7W50VeHNAGX@alfio.lan>
References: <cover.1658924372.git.mchehab@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1658924372.git.mchehab@kernel.org>
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
 David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Christian =?iso-8859-15?Q?K=F6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Mauro,

Pushed in drm-intel-gt-next.

Thanks,
Andi

On Wed, Jul 27, 2022 at 02:29:50PM +0200, Mauro Carvalho Chehab wrote:
> Doing TLB invalidation cause performance regressions, like:
> 	[424.370996] i915 0000:00:02.0: [drm] *ERROR* rcs0 TLB invalidation did not complete in 4ms!
> 
> As reported at:
> 	https://gitlab.freedesktop.org/drm/intel/-/issues/6424
> 
> as this is an expensive operation. So, reduce the need of it by:
>   - checking if the engine is awake;
>   - checking if the engine is not wedged;
>   - batching operations.
> 
> Additionally, add a workaround for a known hardware issue on some GPUs.
> 
> In order to double-check that this series won't be introducing any regressions,
> I used this new IGT test:
> 
> https://patchwork.freedesktop.org/patch/495684/?series=106757&rev=1
> 
> Checking the results for 3 different patchsets, on Broadwell:
> 
> 1) On the top of drm-tip (2022y-07m-14d-08h-35m-36) - e. g. with TLB
> invalidation and serialization patches:
> 
> 	$ sudo build/tests/gem_exec_tlb|grep Subtest
> 	Subtest close-clear: SUCCESS (10.490s)
> 	Subtest madv-clear: SUCCESS (10.484s)
> 	Subtest u-unmap-clear: SUCCESS (10.527s)
> 	Subtest u-shrink-clear: SUCCESS (10.506s)
> 	Subtest close-dumb: SUCCESS (10.165s)
> 	Subtest madv-dumb: SUCCESS (10.177s)
> 	Subtest u-unmap-dumb: SUCCESS (10.172s)
> 	Subtest u-shrink-dumb: SUCCESS (10.172s)
> 
> 2) With the new version of the batch TLB invalidation patches from this series:
> 
> 	$ sudo build/tests/gem_exec_tlb|grep Subtest
> 	Subtest close-clear: SUCCESS (10.483s)
> 	Subtest madv-clear: SUCCESS (10.495s)
> 	Subtest u-unmap-clear: SUCCESS (10.545s)
> 	Subtest u-shrink-clear: SUCCESS (10.508s)
> 	Subtest close-dumb: SUCCESS (10.172s)
> 	Subtest madv-dumb: SUCCESS (10.169s)
> 	Subtest u-unmap-dumb: SUCCESS (10.174s)
> 	Subtest u-shrink-dumb: SUCCESS (10.176s)
> 
> 3) Changing the TLB invalidation routine to do nothing[1]:
> 
> 	$ sudo ~/freedesktop-igt/build/tests/gem_exec_tlb|grep Subtest
> 	(gem_exec_tlb:1958) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1958) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1958) CRITICAL: Found deadbeef in a new (clear) buffer after 3 tries!
> 	(gem_exec_tlb:1956) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1956) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1956) CRITICAL: Found deadbeef in a new (clear) buffer after 89 tries!
> 	(gem_exec_tlb:1957) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1957) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1957) CRITICAL: Found deadbeef in a new (clear) buffer after 256 tries!
> 	(gem_exec_tlb:1960) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1960) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1960) CRITICAL: Found deadbeef in a new (clear) buffer after 845 tries!
> 	(gem_exec_tlb:1961) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1961) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1961) CRITICAL: Found deadbeef in a new (clear) buffer after 1138 tries!
> 	(gem_exec_tlb:1954) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1954) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1954) CRITICAL: Found deadbeef in a new (clear) buffer after 1359 tries!
> 	(gem_exec_tlb:1955) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1955) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1955) CRITICAL: Found deadbeef in a new (clear) buffer after 1794 tries!
> 	(gem_exec_tlb:1959) CRITICAL: Test assertion failure function check_bo, file ../tests/i915/gem_exec_tlb.c:384:
> 	(gem_exec_tlb:1959) CRITICAL: Failed assertion: !sq
> 	(gem_exec_tlb:1959) CRITICAL: Found deadbeef in a new (clear) buffer after 2139 tries!
> 	Dynamic subtest smem0 failed.
> 	**** DEBUG ****
> 	(gem_exec_tlb:1944) DEBUG: 2M hole:200000 contains poison:6b6b6b6b
> 	(gem_exec_tlb:1944) DEBUG: Running writer for 200000 at 300000 on bcs0
> 	(gem_exec_tlb:1944) DEBUG: Closing hole:200000 on rcs0, sample:deadbeef
> 	(gem_exec_tlb:1944) DEBUG: Rechecking hole:200000, sample:6b6b6b6b
> 	****  END  ****
> 	Subtest close-clear: FAIL (10.434s)
> 	Subtest madv-clear: SUCCESS (10.479s)
> 	Subtest u-unmap-clear: SUCCESS (10.512s)
> 
> In summary, the test does properly detect fail when TLB cache invalidation doesn't happen,
> as shown at result (3). It also shows that both current drm-tip and drm-tip with this series
> applied don't have TLB invalidation cache issues.
> 
> [1] I applied this patch on the top of drm-tip:
> 
> 	diff --git a/drivers/gpu/drm/i915/gt/intel_gt.c b/drivers/gpu/drm/i915/gt/intel_gt.c
> 	index 68c2b0d8f187..0aefcd7be5e9 100644
> 	--- a/drivers/gpu/drm/i915/gt/intel_gt.c
> 	+++ b/drivers/gpu/drm/i915/gt/intel_gt.c
> 	@@ -930,0 +931,3 @@ void intel_gt_invalidate_tlbs(struct intel_gt *gt)
> 	+	// HACK: don't do TLB invalidations!!!
> 	+	return;
> 	+
> 
> Regards,
> Mauro
> 
> Chris Wilson (4):
>   drm/i915/gt: Ignore TLB invalidations on idle engines
>   drm/i915/gt: Invalidate TLB of the OA unit at TLB invalidations
>   drm/i915/gt: Skip TLB invalidations once wedged
>   drm/i915/gt: Batch TLB invalidations
> 
> Mauro Carvalho Chehab (2):
>   drm/i915/gt: document with_intel_gt_pm_if_awake()
>   drm/i915/gt: describe the new tlb parameter at i915_vma_resource
> 
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |  3 +-
>  drivers/gpu/drm/i915/gem/i915_gem_pages.c     | 25 +++---
>  drivers/gpu/drm/i915/gt/intel_gt.c            | 77 +++++++++++++++----
>  drivers/gpu/drm/i915/gt/intel_gt.h            | 12 ++-
>  drivers/gpu/drm/i915/gt/intel_gt_pm.h         | 11 +++
>  drivers/gpu/drm/i915/gt/intel_gt_types.h      | 18 ++++-
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  8 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 33 ++++++--
>  drivers/gpu/drm/i915/i915_vma.h               |  1 +
>  drivers/gpu/drm/i915/i915_vma_resource.c      |  9 ++-
>  drivers/gpu/drm/i915/i915_vma_resource.h      |  6 +-
>  11 files changed, 163 insertions(+), 40 deletions(-)
> 
> -- 
> 2.36.1
> 
