Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE7F6FF69D
	for <lists+dri-devel@lfdr.de>; Thu, 11 May 2023 17:59:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0AA610E4F7;
	Thu, 11 May 2023 15:59:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7A8810E073;
 Thu, 11 May 2023 15:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683820765; x=1715356765;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=cI1JkXQDUbxFZfrfncHOooNoQ1tHGsPYm1ODLNyHOO4=;
 b=lea9qFKwupK71xNjN9zOM1fYjmCUuC9p3ndnMbIyoyHx0HDuyW39CtZt
 aF06RayI0kUUB4gMwGr38IsV2eZzERGBD1vWwAV8zQ0fcJDDUHG6MIRRu
 fVA41Ta98buLxapeq99RCr6sirzGQCC7GPtFiuVmHvd1uXsz1KN2bSnAl
 hzq3Z+TDYOIyHLUOdqrxLM70nGqMFI6jKsjOD93skzDA30NYxy3Nx8h9w
 vLQXLcBiKjaRJb1XMk+PjTQ8uhEfx/TyCq73xOouNHOVeC7MSu9scFX1T
 hEn3YV5etd2LkOukFk1nOptNlHdeBEsTalra6xEfPFWRFqhfbjbkvUOEd w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="378668422"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="378668422"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 08:59:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10707"; a="677290111"
X-IronPort-AV: E=Sophos;i="5.99,266,1677571200"; d="scan'208";a="677290111"
Received: from aaltazin-mobl1.amr.corp.intel.com (HELO intel.com)
 ([10.252.63.104])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2023 08:59:22 -0700
Date: Thu, 11 May 2023 17:59:19 +0200
From: Andi Shyti <andi.shyti@linux.intel.com>
To: fei.yang@intel.com
Subject: Re: [Intel-gfx] [PATCH v8 0/2] drm/i915: use pat_index instead of
 cache_level
Message-ID: <ZF0Q1zGJtWr4OvQt@ashyti-mobl2.lan>
References: <20230509165200.1740-1-fei.yang@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230509165200.1740-1-fei.yang@intel.com>
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
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Fei,

Pushed to drm-intel-gt-next.

There was a "pinky" promise that Tvrtko asked you (and I feel
involved, as well) to make. Let's make sure to follow up on that.

Andi

On Tue, May 09, 2023 at 09:51:58AM -0700, fei.yang@intel.com wrote:
> From: Fei Yang <fei.yang@intel.com>
> 
> This patch set was posted at
> https://patchwork.freedesktop.org/series/116868/
> Change title since the PTE patch was merged separately.
> 
> These patches are extracted from series
> https://patchwork.freedesktop.org/series/115980/
> 
> This series refactor the cache policy programming so that the PTE
> encode functions can be unified across all GEN12 platforms. This
> refactor is also important in implementing the design which allows
> uerspace to directly set cache policy for each Buffer Object.
> 
> v2: drop one patch that was merged separately
>     341ad0e8e254 drm/i915/mtl: Add PTE encode function
> v3: disable {get, set}_caching ioctl
> v4: fix missing unlock introduced in v3, and
>     solve a rebase conflict
> v5: replace obj->cache_level with pat_set_by_user,
>     fix i915_cache_level_str() for legacy platforms.
> v6: squash the pte_encode patch because separating them causes
>     bisect probelm. Also addressing some review comments from
>     Tvrtko and Matt.
> v7: fix checkpatch errors and warnings.
> v8: BUILD_BUG_ON instead of WARN_ON_ONCE. Some updates in
>     comments.
> 
> Fei Yang (2):
>   drm/i915: preparation for using PAT index
>   drm/i915: use pat_index instead of cache_level
> 
>  drivers/gpu/drm/i915/display/intel_dpt.c      | 12 +--
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 58 +++++++++-----
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 15 +++-
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      | 11 ++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.c    | 60 +++++++++++++-
>  drivers/gpu/drm/i915/gem/i915_gem_object.h    |  8 ++
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  | 53 ++++++++++++-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 -
>  drivers/gpu/drm/i915/gem/i915_gem_stolen.c    |  4 +-
>  drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  8 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_migrate.c |  2 +-
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          | 10 ++-
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          | 78 +++++++++---------
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |  3 +-
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 76 +++++++++---------
>  drivers/gpu/drm/i915/gt/intel_gtt.h           | 18 ++---
>  drivers/gpu/drm/i915/gt/intel_migrate.c       | 47 ++++++-----
>  drivers/gpu/drm/i915/gt/intel_migrate.h       | 13 ++-
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  4 +-
>  drivers/gpu/drm/i915/gt/selftest_migrate.c    | 47 +++++------
>  drivers/gpu/drm/i915/gt/selftest_reset.c      |  8 +-
>  drivers/gpu/drm/i915/gt/selftest_timeline.c   |  2 +-
>  drivers/gpu/drm/i915/gt/selftest_tlb.c        |  4 +-
>  drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 10 ++-
>  drivers/gpu/drm/i915/i915_debugfs.c           | 53 ++++++++++---
>  drivers/gpu/drm/i915/i915_gem.c               | 27 ++++++-
>  drivers/gpu/drm/i915/i915_gpu_error.c         |  8 +-
>  drivers/gpu/drm/i915/i915_pci.c               | 79 ++++++++++++++++---
>  drivers/gpu/drm/i915/i915_vma.c               | 16 ++--
>  drivers/gpu/drm/i915/i915_vma.h               |  2 +-
>  drivers/gpu/drm/i915/i915_vma_types.h         |  2 -
>  drivers/gpu/drm/i915/intel_device_info.h      |  5 ++
>  drivers/gpu/drm/i915/selftests/i915_gem.c     |  5 +-
>  .../gpu/drm/i915/selftests/i915_gem_evict.c   |  4 +-
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 15 ++--
>  .../drm/i915/selftests/intel_memory_region.c  |  4 +-
>  .../gpu/drm/i915/selftests/mock_gem_device.c  |  9 +++
>  drivers/gpu/drm/i915/selftests/mock_gtt.c     |  8 +-
>  40 files changed, 557 insertions(+), 237 deletions(-)
> 
> -- 
> 2.25.1
