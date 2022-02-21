Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 184AD4BEDD0
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 00:25:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5996689DC1;
	Mon, 21 Feb 2022 23:25:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CF6089DC1;
 Mon, 21 Feb 2022 23:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645485955; x=1677021955;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TXFKi+FO7tpuHFgos+IuWF/gtek8UCE3SDD93kgS1+Q=;
 b=XPuGCmcbyTix7vx9Bc7n6Tl0R09RuOJS1o7yzCk+DXrwtTw0OxDAJNC2
 azwvX8BkvrnTx6LT/QVeZyv1Daw9OUlB7pQfyrh85XkVVI0+dOdHsyIvd
 OxaA20lwLD96UZYB5K0L7XA1fmQTg5++Y1xYlytkrCxb/y3qdvmx0329l
 idDoIJt2j0fH1dvUeazTppE3WACdmxcMFtZVb+bpAXu5s5Cq7afkmA5Fi
 ywE97ezVzsG1b9TmA+unWngIHpN8SuGSVdRzo0lhUMXcXrF5rhtore1yg
 GPU/9PCpHMIXZMn8BUJLb8SPVTaj5miekJ5KmhkWbMj4oM+A1IOwtbLSt g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="235119372"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="235119372"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:25:54 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; d="scan'208";a="706396966"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Feb 2022 15:25:51 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, netdev <netdev@vger.kernel.org>
Subject: [PATCH v3 00/11] drm/i915: use ref_tracker library for tracking
 wakerefs
Date: Tue, 22 Feb 2022 00:25:31 +0100
Message-Id: <20220221232542.1481315-1-andrzej.hajda@intel.com>
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Chris Wilson <chris.p.wilson@intel.com>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Appearance of ref_tracker library allows to drop custom solution for wakeref
tracking used in i915 and reuse the library.
For this few adjustements has been made to ref_tracker, details in patches.
I hope changes are OK for original author.

The patchset has been rebased on top of drm-tip to allow test changes by CI.
Patches marked "[DO NOT MERGE]" are cherry-picked from linux-next (they are
not yet in drm-tip), to allow build and run CI on the patchset (it works only
on drm-tip tree).

Added CC to netdev as the only user of the library atm.

v2:
  - replaced list_sort with ref_tracker_dir_stats, to avoid potentially
    extensive sorting, if number of reports is expected to be big enough (???)
    we can replace linear search in ref_tracker_dir_stats.stacks with binary
    heap (min_heap),
  - refactored gfp flags,
  - fixed i915 handling of no-tracking flag.
v3:
  - fixed mess with duplicated mails

Regards
Andrzej


Andrzej Hajda (6):
  lib/ref_tracker: add unlocked leak print helper
  lib/ref_tracker: __ref_tracker_dir_print improve printing
  lib/ref_tracker: add printing to memory buffer
  lib/ref_tracker: remove warnings in case of allocation failure
  drm/i915: Correct type of wakeref variable
  drm/i915: replace Intel internal tracker with kernel core ref_tracker

Chris Wilson (2):
  drm/i915: Separate wakeref tracking
  drm/i915: Track leaked gt->wakerefs

Eric Dumazet (3):
  [DO NOT MERGE] ref_tracker: implement use-after-free detection
  [DO NOT MERGE] ref_tracker: add a count of untracked references
  [DO NOT MERGE] ref_tracker: remove filter_irq_stacks() call

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
 include/linux/ref_tracker.h                   |  35 ++-
 lib/ref_tracker.c                             | 198 ++++++++++++---
 27 files changed, 480 insertions(+), 344 deletions(-)

-- 
2.25.1

