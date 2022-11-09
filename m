Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 983A76231AD
	for <lists+dri-devel@lfdr.de>; Wed,  9 Nov 2022 18:42:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9B210E60E;
	Wed,  9 Nov 2022 17:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 383D510E60E;
 Wed,  9 Nov 2022 17:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668015761; x=1699551761;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ka11cFzMe16RU2ZwQ4lwiiTsnhndSProKM5IIk7bgrM=;
 b=cFXcdDWoUMqqK3hgftroDYEo3j1E6Qi6XIq6UHek+7JK/QZrpkaBAvkH
 5ZR7Q76W9tQti2g/c3rVU42w7KKvAkkOcOpvrCcELQLYllrdwQ3OrYDph
 7Q+fnmDgy5aCP6TiDgxwOE5LjORnSFDavxCITmVIS+itiQbllaIJ2EJCS
 0/P9NydDp5tO2hGD/t4XYOmYd6mH1+UA2kXZ/vcGHHhyEPC36rGnDkQMY
 VJWJP20n7+vveedXoNgDf97/V/3UeItvy4QcBrGsLH8sswFPALkVJK1HV
 MX906LM/0kpkj4kbgZfRb+3KTJbfF8VB1HK2GWciO5AHUKBdRWkEKCWHr Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="291439808"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="291439808"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:41:23 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10526"; a="779433197"
X-IronPort-AV: E=Sophos;i="5.96,151,1665471600"; d="scan'208";a="779433197"
Received: from dvorobye-mobl.ccr.corp.intel.com (HELO intel.com)
 ([10.252.32.169])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Nov 2022 09:41:18 -0800
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] add guard padding around i915_vma
Date: Wed,  9 Nov 2022 18:40:55 +0100
Message-Id: <20221109174058.912720-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
 Andi Shyti <andi.shyti@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, Matthew Auld <matthew.auld@intel.com>,
 Andi Shyti <andi@etezian.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

This series adds guards around vma's but setting a pages at the
beginning and at the end that work as padding.

The first user of the vma guard are scanout objects which don't
need anymore to add scratch to all the unused ggtt's and speeding
up up considerably the boot and resume by several hundreds of
milliseconds up to over a full second in slower machines.

Andi

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
 .../i915/gem/selftests/i915_gem_client_blt.c  | 23 ++++----
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
 34 files changed, 246 insertions(+), 160 deletions(-)

-- 
2.37.2

