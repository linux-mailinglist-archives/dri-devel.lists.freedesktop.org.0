Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A10CF623121
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:11:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE93F10E603;
	Wed,  9 Nov 2022 17:11:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDA1F10E602;
 Wed,  9 Nov 2022 17:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668013895; x=1699549895;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=FIog7AzEc5hdUCsLwJ/ZqVDxZSSR4Jaxm46oyaUB/30=;
 b=OYgxgzoDu4g7E8JrfUahsgOFhIe0iZlG6R/rD39s2+34m+rBxxfRm0HO
 +Rs+XKd5qCABQ5i34NtQDIY66y87jAp1pXwMU0lYqAReq2OzsGPK8/IVW
 F1yoHemDmwaCivJ8u/reVapX9L9eEIPSTSAubHW1KQpOZss48fIFy6Y3j
 K8tkawInDUgveRo9zZ/mt0FG3YwyFJVf3ZF0bhfXj70KHt1U525FUafDX
 snY8CX2P52cgLi34xtRAxsE1lwF83irl8H9rDcwkXjFO6ICdBRIDmYFco
 t4FArUwPdVcRNSKzN/Vdthd11u/l3EfwRdlIxaPAqkxzO7PVe7fwZleic A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="397331805"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="397331805"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:11:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="587833877"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="587833877"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:11:03 -0800
Date: Wed, 9 Nov 2022 18:10:58 +0100
From: Andi Shyti <andi.shyti@linux.intel.com>
To: Andi Shyti <andi.shyti@linux.intel.com>
Subject: Re: [PATCH 0/3] add guard patting around i915_vma
Message-ID: <Y2vfIpfQ1fLVurvM@ashyti-mobl2.lan>
References: <20221109164913.909323-1-andi.shyti@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221109164913.909323-1-andi.shyti@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Matthew Auld <matthew.auld@intel.com>, Andi Shyti <andi@etezian.org>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Please ignore, this series is rebased on the wrong branch.

Andi

On Wed, Nov 09, 2022 at 05:49:10PM +0100, Andi Shyti wrote:
> Hi,
> 
> This patch series adds a padding around i915_vma's reducing
> consequently the need to add scratch to the unused GGTT.
> 
> This speeds up considerably the boot and resume by several
> hundreds of milliseconds up to over a full second in slower
> machines.
> 
> Andi
> 
> Chris Wilson (3):
>   drm/i915: Wrap all access to i915_vma.node.start|size
>   drm/i915: Introduce guard pages to i915_vma
>   drm/i915: Refine VT-d scanout workaround
> 
>  drivers/gpu/drm/i915/display/intel_dpt.c      |  4 +-
>  drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 13 +++++
>  .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 37 ++++++------
>  drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
>  drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
>  .../i915/gem/selftests/i915_gem_client_blt.c  | 15 ++---
>  .../drm/i915/gem/selftests/i915_gem_context.c | 19 ++++--
>  .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
>  .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 ++-
>  drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
>  drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
>  drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  8 +--
>  drivers/gpu/drm/i915/gt/intel_ggtt.c          | 39 ++++---------
>  drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
>  drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  7 ++-
>  drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
>  .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
>  drivers/gpu/drm/i915/gt/selftest_engine_cs.c  | 12 ++--
>  drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 +++---
>  drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 17 +++---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 ++---
>  .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
>  drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 ++--
>  .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
>  drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
>  drivers/gpu/drm/i915/i915_debugfs.c           |  3 +-
>  drivers/gpu/drm/i915/i915_gem_gtt.h           |  1 +
>  drivers/gpu/drm/i915/i915_gpu_error.c         |  4 +-
>  drivers/gpu/drm/i915/i915_perf.c              |  2 +-
>  drivers/gpu/drm/i915/i915_vma.c               | 58 ++++++++++++++-----
>  drivers/gpu/drm/i915/i915_vma.h               | 24 +++++++-
>  drivers/gpu/drm/i915/i915_vma_types.h         |  3 +-
>  drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 12 +++-
>  drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++----
>  drivers/gpu/drm/i915/selftests/igt_spinner.c  | 11 ++--
>  38 files changed, 238 insertions(+), 163 deletions(-)
> 
> -- 
> 2.37.2
