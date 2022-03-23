Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD34E4E4F
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 09:36:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3958810E64A;
	Wed, 23 Mar 2022 08:36:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D33010E648;
 Wed, 23 Mar 2022 08:36:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648024575; x=1679560575;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Sx9BxcvoaSWGAdk7zbGwHQ4DOLHhGuWwXanZ0qD8Vvo=;
 b=KOfQ43/tdHZQa7pRYXo2Q2DMFBcyXOrGgLQ8dNBw807rAqJhN2FhW7n4
 YtmxKGoG01Kt8XX0hxyGQwLBRgLpkcPrxNKzu0YwZFdBeQNhzp2HOgncQ
 /BAeq6JfqzPb/Jq6QadpXkdN7iwqsrwzxrWOpCF/oLHg3h4b0dN1rqmDH
 RnK9/a05rEXUBos4/0v2C9W3AfCXmxVme9HxSiHhsu11355sgB4OSZ0dN
 6wf8GHJF5aZJBnBUm4m4Ugi2EoRjczW/Mka9sYUidCl1LGkcAxoz6zhUS
 pehL5I6opU5vUClaNVdgAMhxdUnoK3hPMsQYQFjh0cKywMpxWyu2w0M46 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="318765322"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="318765322"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:36:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560800223"
Received: from aryba-mobl.ger.corp.intel.com (HELO thellstr-mobl1.intel.com)
 ([10.249.254.31])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 01:36:09 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 0/3] Improve on resume time with VT-d enabled
Date: Wed, 23 Mar 2022 09:35:53 +0100
Message-Id: <20220323083556.510360-1-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 matthew.auld@intel.com, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

When DMAR / VT-d is enabled, the display engine uses overfetching, presumably
to deal with the increased latency. To avoid display engine errors and DMAR
faults, as a workaround the GGTT is populated with scatch PTEs when VT-d
is enabled. However starting with gen10, Write-combined writing of scratch
PTES is no longer possible and as a result, populating the full GGTT with
scratch PTEs like on resume becomes very slow as uncached access is needed.

Therefore, replace filling the GGTT entirely with scratch pages with only
filling surrounding scanout vma with guard pages. This eliminates the 100+ms
delay in resume where we have to repopulate the GGTT with scratch.

While 100+ms might appear like a short time it's 10% to 20% of total resume
time and important in some applications.

Additional considerations:

Since GPUs where VT-d might be present should have at least 2GiB worth of
GGTT space, the extra guard pages should not really have a significant
impact on GGTT contention.

Neither should there be a problem with not populating GGTT with scratch
PTEs on unbind since that's typically not done when VT-d is not enabled
either.

Finally, discrete GPUs should ideally not overfetch even with VT-d enabled,
but removing the workaround for discrete GPUs needs thorough testing and
will be done, if needed, as a follow up.

Patch 1 introduces accessors for vma.node.start and vma.node.size. While
this patch is the most invasive, the end result is actually something
we might want event without the introduced guard pages.

Patch 2 introduces the concept of guard pages to i915_vma and wraps the
needed arithmetic in the accessors.

Patch 3 uses the guard pages to replace the old VT-d workaround.

v4: Completely rebase on drm-tip:
- Avoid vmas in the binding backends
- Make sure vma PIN flags don't clash
- Add some kernedoc and rewrite cover-letter.

Chris Wilson (3):
  drm/i915: Wrap all access to i915_vma.node.start|size
  drm/i915: Introduce guard pages to i915_vma
  drm/i915: Refine VT-d scanout workaround

 drivers/gpu/drm/i915/display/intel_fbdev.c    |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    | 13 ++++
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    | 33 ++++++-----
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |  4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |  2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  | 15 ++---
 .../drm/i915/gem/selftests/i915_gem_context.c | 15 +++--
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  2 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |  7 ++-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c    |  2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 39 ++++--------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |  3 +-
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |  2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |  2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  8 +--
 drivers/gpu/drm/i915/gt/selftest_execlists.c  | 18 +++---
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  | 15 ++---
 drivers/gpu/drm/i915/gt/selftest_lrc.c        | 16 ++---
 .../drm/i915/gt/selftest_ring_submission.c    |  2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        | 12 ++--
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  8 +--
 drivers/gpu/drm/i915/i915_cmd_parser.c        |  4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |  2 +-
 drivers/gpu/drm/i915/i915_gem_gtt.h           |  3 +-
 drivers/gpu/drm/i915/i915_perf.c              |  2 +-
 drivers/gpu/drm/i915/i915_vma.c               | 59 +++++++++++++------
 drivers/gpu/drm/i915/i915_vma.h               | 52 +++++++++++++++-
 drivers/gpu/drm/i915/i915_vma_resource.c      |  4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      | 17 ++++--
 drivers/gpu/drm/i915/i915_vma_types.h         |  3 +-
 drivers/gpu/drm/i915/selftests/i915_request.c | 20 +++----
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |  8 +--
 34 files changed, 242 insertions(+), 156 deletions(-)

-- 
2.34.1

