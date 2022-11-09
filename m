Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA414623071
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 17:49:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A9CE8911A;
	Wed,  9 Nov 2022 16:49:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D4128911A;
 Wed,  9 Nov 2022 16:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668012570; x=1699548570;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7fDwnVBx1JZrz1nglN5EEYycDxc+yHs8kd652bxR5e8=;
 b=Sbld57bGrvgbKwRspUUY9WwjKFY/YarNiRD6P1fFAmUUCG9fPN8CADwP
 uGBZ3UFEMPvHnY35au+mNlOORb8jlRzLz8PfmBIh/G5+WWwpTwk8q/m+9
 pvWdwC4KJELOziGzTIBXWdmRzoNG7HE61P8J+b258COoxmr9fAp3eueFX
 ckfV207d7KT8Emd0D48S67MXpO4P8O6UmpLTssRhTjqRgvhiFB2ABsZFl
 4ywA+rCBInwWwE3Uy9M68a8TXU8AzwH/esWcwn4Nr+O/wud7FSvjVjPwV
 XTL1mX35OOqN5byJl/28FE7tjtxCLk0ONgYDxvBcJlUrRegjXF2JefGuT g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="375306266"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="375306266"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:49:29 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="639257007"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="639257007"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 08:49:26 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] add guard patting around i915_vma
Date: Wed,  9 Nov 2022 17:49:10 +0100
Message-Id: <20221109164913.909323-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>,
 Tejas Upadhyay <tejaskumarx.surendrakumar.upadhyay@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This patch series adds a padding around i915_vma's reducing
consequently the need to add scratch to the unused GGTT.

This speeds up considerably the boot and resume by several
hundreds of milliseconds up to over a full second in slower
machines.

Andi

Chris Wilson (3):
  drm/i915: Wrap all access to i915_vma.node.start|size
  drm/i915: Introduce guard pages to i915_vma
  drm/i915: Refine VT-d scanout workaround

 drivers/gpu/drm/i915/display/intel_dpt.c      |  4 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 13 +++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 37 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  | 15 ++---
 .../drm/i915/gem/selftests/i915_gem_context.c | 19 ++++--
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 ++-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |  2 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  8 +--
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 39 ++++---------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  7 ++-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  | 12 ++--
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 +++---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 17 +++---
 drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 ++---
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 ++--
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
 drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  3 +-
 drivers/gpu/drm/i915/i915_gem_gtt.h           |  1 +
 drivers/gpu/drm/i915/i915_gpu_error.c         |  4 +-
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 58 ++++++++++++++-----
 drivers/gpu/drm/i915/i915_vma.h               | 24 +++++++-
 drivers/gpu/drm/i915/i915_vma_types.h         |  3 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 12 +++-
 drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++----
 drivers/gpu/drm/i915/selftests/igt_spinner.c  | 11 ++--
 38 files changed, 238 insertions(+), 163 deletions(-)

-- 
2.37.2

