Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FEAC63916D
	for <lists+dri-devel@lfdr.de>; Fri, 25 Nov 2022 23:30:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4D010E134;
	Fri, 25 Nov 2022 22:30:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC99910E134;
 Fri, 25 Nov 2022 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669415443; x=1700951443;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z8o8z3I6H87aqo6fjslU8AMvnKn2XG5c9BhfFRIHHCY=;
 b=dSFmuxpF4CzmU6kA8AjFle6ptCEOK+1QXr+5BwHZTs+2MiLN4vqVzHAi
 OaOhRnNHr64NeH74PwmI6zi5gTEFlr2S3VBQ7qUx8yoo91Ma2P7WTBH09
 jXamibJgg54yAv9ohiEl+xwvd3cEEIsiINd8wZQizKPC1TU57OqJ3u8ZN
 efm0A/6Jn5udn1h1MAtehVSMdcD84GEpbRQ0RhMFqxW57Tj/K3NAq0wCp
 il7aY5B1QCrYL19+wNEZ0JTVrRT8cSNr2PsZE/uWMPiBdNRQYcI0xab4o
 HbIVC088F7iTd07/BT6E86tBPdoNU7WZReSdYt6t4S74SAWWQP0Ngh0Ae w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="315703124"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="315703124"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 14:30:42 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10542"; a="767467358"
X-IronPort-AV: E=Sophos;i="5.96,194,1665471600"; d="scan'208";a="767467358"
Received: from ncataldi-mobl.ger.corp.intel.com (HELO intel.com)
 ([10.252.50.225])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2022 14:30:39 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v3 0/5] Add guard padding around i915_vma
Date: Fri, 25 Nov 2022 23:30:24 +0100
Message-Id: <20221125223029.323339-1-andi.shyti@linux.intel.com>
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

Thanks Tvrtko for the review.

Andi

Changelog
=========
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
  Revert "drm/i915: Improve on suspend / resume time with VT-d enabled"
  drm/i915: Limit the display memory alignment to 32 bit instead of 64

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
 drivers/gpu/drm/i915/i915_vma.c               |  66 ++++++++---
 drivers/gpu/drm/i915/i915_vma.h               |  52 ++++++++-
 drivers/gpu/drm/i915/i915_vma_resource.c      |   4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |  17 ++-
 drivers/gpu/drm/i915/i915_vma_types.h         |   3 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  20 ++--
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   8 +-
 37 files changed, 267 insertions(+), 259 deletions(-)

-- 
2.38.1

