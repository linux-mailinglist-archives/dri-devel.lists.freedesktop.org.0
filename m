Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D3014BA260
	for <lists+dri-devel@lfdr.de>; Thu, 17 Feb 2022 15:05:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D4B010EB6B;
	Thu, 17 Feb 2022 14:05:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA6F910EB69;
 Thu, 17 Feb 2022 14:04:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645106698; x=1676642698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=W9cusu0H41I9fgzaSsAcBFWP8L7H5DGUPWYmNsEav2c=;
 b=Hf/jhx6lb5mZm5a3Bbs/Rx35MYxRIjJD1jc/5Q3oC9nKNEXShN73ahCJ
 Ir5T8ucfXi24d8MvIDOlR3eE9mMQMH+3O6E9T8L2odGs8N7bbOXSSJSSZ
 BdvmN1/f23F4cqWjtKjQo0TuZef/NwejdvvzF2B0lDO1pyKwZ/tjRRSo6
 miPsses0SPkS8FEgeBe9quiJxppGlUj/EQ7F6nm3CwIZUilz8g8dM7kU5
 AmUQhzlHIs2TZWVWBs+3du1PYt9/Z50dhYmxGmdehz6p2BSlX37dasAWd
 DtrPDrNGoEZdobF2towSlVWDGqU7NR/ciGlFz+sxTcICWCf7vg6esmtvw Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10260"; a="230840794"
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="230840794"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:04:56 -0800
X-IronPort-AV: E=Sophos;i="5.88,376,1635231600"; d="scan'208";a="530241067"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2022 06:04:54 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH 0/9] drm/i915: use ref_tracker library for tracking wakerefs
Date: Thu, 17 Feb 2022 15:04:32 +0100
Message-Id: <20220217140441.1218045-1-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173,
 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Appearance of ref_tracker library allows to drop custom solution for wakeref
tracking used in i915 and reuse the library.
For this few adjustements has been made to ref_tracker, details in patches.
I hope changes are OK for original author.

The patchset has been rebased on top of drm-tip to allow test changes by CI.

Added CC to netdev as the only user of the library atm.

Regards
Andrzej


Andrzej Hajda (7):
  lib/ref_tracker: add unlocked leak print helper
  lib/ref_tracker: compact stacktraces before printing
  lib/ref_tracker: __ref_tracker_dir_print improve printing
  lib/ref_tracker: add printing to memory buffer
  lib/ref_tracker: improve allocation flags
  drm/i915: Correct type of wakeref variable
  drm/i915: replace Intel internal tracker with kernel core ref_tracker

Chris Wilson (2):
  drm/i915: Separate wakeref tracking
  drm/i915: Track leaked gt->wakerefs

 drivers/gpu/drm/i915/Kconfig.debug            |  19 ++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 .../drm/i915/display/intel_display_power.c    |   2 +-
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |   7 +-
 .../i915/gem/selftests/i915_gem_coherency.c   |  10 +-
 .../drm/i915/gem/selftests/i915_gem_mman.c    |  14 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c   |  13 +-
 .../gpu/drm/i915/gt/intel_breadcrumbs_types.h |   3 +-
 drivers/gpu/drm/i915/gt/intel_engine_pm.c     |   6 +-
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   2 +
 .../drm/i915/gt/intel_execlists_submission.c  |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  12 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.h         |  36 ++-
 drivers/gpu/drm/i915/gt/intel_gt_pm_debugfs.c |   4 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |  20 +-
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |   5 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |  10 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |  17 +-
 drivers/gpu/drm/i915/gt/selftest_slpc.c       |  10 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  11 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  16 +-
 drivers/gpu/drm/i915/intel_runtime_pm.c       | 239 ++----------------
 drivers/gpu/drm/i915/intel_runtime_pm.h       |  10 +-
 drivers/gpu/drm/i915/intel_wakeref.c          |  10 +-
 drivers/gpu/drm/i915/intel_wakeref.h          | 112 +++++++-
 include/linux/ref_tracker.h                   |  31 ++-
 lib/ref_tracker.c                             | 150 ++++++++---
 27 files changed, 429 insertions(+), 343 deletions(-)

-- 
2.25.1

