Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B0E63E5E6
	for <lists+dri-devel@lfdr.de>; Thu,  1 Dec 2022 00:58:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FCDA10E4FC;
	Wed, 30 Nov 2022 23:58:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6322F10E4EF;
 Wed, 30 Nov 2022 23:58:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669852701; x=1701388701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=41Wrxk8UzvTLELSs5DUU+9OB23hZ8sImbkY1GkPTSoI=;
 b=XIqbaU3ub8867CoPd2RnN0RrSaC4v8kX9aGwtOxiIoMSm5ikamzqKwOU
 Y6AOM+gIkP20IpWvvIo0Oq+5OOkfJoaBQjaR8/ky5dbbhifOYh/n51jwV
 CuLEzCMlYyuMVJwDBSkSSzbkLluq4V5Lu+sDkVE2WDME/c/uWN6ThpR0/
 tw/avy4ByjBYjJGFwYS7JEoupmGP83Rt4L3ZhPSBe4F9WcGxMtwccDexj
 C4I8QylNYErc7LDqudcG2oafSav2y+PDag6/nBx9VSjHfb2ajYty9c4PY
 AozUVmi8Wk8BWL/5HrRXrrQlveeWy84ADpY5Sb+O17TdAUmc0/vGH3fzY Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="303144156"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="303144156"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 15:58:20 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10547"; a="889492866"
X-IronPort-AV: E=Sophos;i="5.96,207,1665471600"; d="scan'208";a="889492866"
Received: from freibold-ivm1.ger.corp.intel.com (HELO intel.com)
 ([10.252.52.161])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2022 15:58:15 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 0/5] Add guard padding around i915_vma
Date: Thu,  1 Dec 2022 00:58:00 +0100
Message-Id: <20221130235805.221010-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.38.1
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
 Andi Shyti <andi@etezian.org>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Shawn Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds guards around vma's but setting a pages at the
beginning and at the end that work as padding.

The first user of the vma guard are scanout objects which don't
need anymore to add scratch to all the unused ggtt's and speeding
up up considerably the boot and resume by several hundreds of
milliseconds up to over a full second in slower machines.

Because of this we don't need anymore 2ef6efa79fec ("drm/i915:
Improve on suspend / resume time with VT-d enabled") which gets
reverted.

Thanks Tvrtko and Chris for the review.

Andi

Changelog
=========
v3 -> v4:
 - change the order of the patches: the 64->32 bit change of the
   memory alignment goes as first (Tvrtko).
 - Use roundup instead of ALIGN to round up the guard padding
   (Chris).
 - Restore the GEM_BUG_ON(2 * guard > end) as a paranoiac check
   and as mean of documentation (Chris).

v2 -> v3:
 - fix Tvrtko's comments: explain in a comment why the guard is
   is alligned as the vma and remove a GEM_BUG_ON() in case the
   the total padding was exceeding the size of the va.
 - the display_alignment is declared as u32 instead of a u64 in
   a separate patch.

v1 -> v2:
 - Revert 2ef6efa79fec ("drm/i915: Improve on suspend / resume
   time with VT-d enabled")

Andi Shyti (2):
  drm/i915: Limit the display memory alignment to 32 bit instead of 64
  Revert "drm/i915: Improve on suspend / resume time with VT-d enabled"

Chris Wilson (3):
  drm/i915: Wrap all access to i915_vma.node.start|size
  drm/i915: Introduce guard pages to i915_vma
  drm/i915: Refine VT-d scanout workaround

 drivers/gpu/drm/i915/display/intel_fb_pin.c   |   2 +-
 drivers/gpu/drm/i915/display/intel_fbdev.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  15 ++-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  33 +++---
 drivers/gpu/drm/i915/gem/i915_gem_mman.c      |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_shrinker.c  |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_tiling.c    |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 .../i915/gem/selftests/i915_gem_client_blt.c  |  23 ++--
 .../drm/i915/gem/selftests/i915_gem_context.c |  15 ++-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |   2 +-
 .../drm/i915/gem/selftests/igt_gem_utils.c    |   7 +-
 drivers/gpu/drm/i915/gt/gen7_renderclear.c    |   2 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          | 108 ++++--------------
 drivers/gpu/drm/i915/gt/intel_ggtt_fencing.c  |   3 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |  24 ----
 drivers/gpu/drm/i915/gt/intel_renderstate.c   |   2 +-
 .../gpu/drm/i915/gt/intel_ring_submission.c   |   2 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |   8 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  18 +--
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  15 +--
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  16 +--
 .../drm/i915/gt/selftest_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |  12 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |   8 +-
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   4 +-
 drivers/gpu/drm/i915/i915_debugfs.c           |   2 +-
 drivers/gpu/drm/i915/i915_driver.c            |  16 ---
 drivers/gpu/drm/i915/i915_gem_gtt.h           |   3 +-
 drivers/gpu/drm/i915/i915_perf.c              |   2 +-
 drivers/gpu/drm/i915/i915_vma.c               |  63 +++++++---
 drivers/gpu/drm/i915/i915_vma.h               |  52 ++++++++-
 drivers/gpu/drm/i915/i915_vma_resource.c      |   4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |  17 ++-
 drivers/gpu/drm/i915/i915_vma_types.h         |   3 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  20 ++--
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   8 +-
 37 files changed, 264 insertions(+), 259 deletions(-)

-- 
2.38.1

