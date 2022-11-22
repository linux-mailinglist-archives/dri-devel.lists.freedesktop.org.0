Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3C1963441B
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 19:57:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F43610E43B;
	Tue, 22 Nov 2022 18:57:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1515910E43B;
 Tue, 22 Nov 2022 18:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669143469; x=1700679469;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nVxdc1EHcgRU+BJnTfJAE7FbDIo04dklBg/Vo24XIb4=;
 b=HgSgY9PbrVidhkGmflVIqIA68cn5fXpos65D9IkqpFniszDyjK9NbBRr
 X+a946x8OINb6BC33CiC6sUqN5u/l3EJbbxr6bBdibVvTClEmfsvnLnwV
 oASMeFFqpANjjspAnWyFlQMwRcDcUCc883zyi/yS0IBMdlBssFhMS5k1m
 rnUGqnyp9y64NbUkmcHaAbhADppA/n7nB8HuV7sZCieMZG5V/qcTL5ML2
 nEJ+IRTFdNjJJoyeeHbO5Rzu25QZy3iNvXVOX73D7TxzObW1VD/7qdjQm
 X8btBHv131Z1HoQgtDkI/gOtC7jDYRcHJgMZnQ98YhBlM4V1hMtlnHUdA A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="293598561"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="293598561"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:57:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10539"; a="641517987"
X-IronPort-AV: E=Sophos;i="5.96,184,1665471600"; d="scan'208";a="641517987"
Received: from fuhrberg-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.251.209.136])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Nov 2022 10:57:44 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/4] Add guard padding around i915_vma 
Date: Tue, 22 Nov 2022 19:57:33 +0100
Message-Id: <20221122185737.96459-1-andi.shyti@linux.intel.com>
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

Changelog
=========
v1 -> v2:
 - Revert 2ef6efa79fec ("drm/i915: Improve on suspend / resume
   time with VT-d enabled") 

Andi

Andi Shyti (1):
  Revert "drm/i915: Improve on suspend / resume time with VT-d enabled"

Chris Wilson (3):
  drm/i915: Wrap all access to i915_vma.node.start|size
  drm/i915: Introduce guard pages to i915_vma
  drm/i915: Refine VT-d scanout workaround

 drivers/gpu/drm/i915/display/intel_fbdev.c    |   2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c    |  13 +++
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
 drivers/gpu/drm/i915/i915_vma.c               |  59 +++++++---
 drivers/gpu/drm/i915/i915_vma.h               |  52 ++++++++-
 drivers/gpu/drm/i915/i915_vma_resource.c      |   4 +-
 drivers/gpu/drm/i915/i915_vma_resource.h      |  17 ++-
 drivers/gpu/drm/i915/i915_vma_types.h         |   3 +-
 drivers/gpu/drm/i915/selftests/i915_request.c |  20 ++--
 drivers/gpu/drm/i915/selftests/igt_spinner.c  |   8 +-
 36 files changed, 259 insertions(+), 256 deletions(-)

-- 
2.38.1

