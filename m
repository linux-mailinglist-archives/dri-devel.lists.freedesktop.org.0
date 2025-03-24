Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE464A6DB7B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Mar 2025 14:30:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12F7510E3F0;
	Mon, 24 Mar 2025 13:30:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gXimCvRT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D56410E3F0;
 Mon, 24 Mar 2025 13:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1742823021; x=1774359021;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=csZ5yOiRMzfgGVK4I6FjQlXGnzHbr/QRn/m6FY5qCRw=;
 b=gXimCvRT1CtHUQTYZTdRvaJd373OYxZxJ9DuVvl02aLg5EdmQC0X6z0g
 QF0WJ8NuwgZj44ftgsUI4SySaAvucu5i8I1f+C/21uhy3YUWTRJUa4Mfs
 p5GrP31b+AL4tJFdqY3S1hh69d7EGHwapOMytBAWW3Pxptih4kaLxpCcN
 NfgcZQxIh9fnYvJLY3BMHfF81bA9i9P15cGO523K7+RV7xN7MpUHXJTss
 PkSfeAY+cRbhHhYKuI6fjOn0zITigfL6U5gqqVOCt6FUWUkP7eKWi0PAV
 F3XdxIUNrZXh51UFy1+MW1JiwKvcCPiEXwkEKHbU+veNyZFKTlb3Z5XAz Q==;
X-CSE-ConnectionGUID: uYtbafyYTVmjGTvmSZ6ZuQ==
X-CSE-MsgGUID: chdeNzM5SPi/XknZw+mFCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11383"; a="47682931"
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="47682931"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:30:21 -0700
X-CSE-ConnectionGUID: dxiOMgqRRmiqMhXGBiNd1g==
X-CSE-MsgGUID: 1EHusWSKTYqW+3235g8kXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,272,1736841600"; d="scan'208";a="124061669"
Received: from slindbla-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.252])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Mar 2025 06:30:17 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Simona Vetter <simona.vetter@ffwll.ch>,
 Arshad Mehmood <arshad.mehmood@intel.com>,
 Michal Mrozek <michal.mrozek@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Andi Shyti <andi.shyti@kernel.org>
Subject: [PATCH v4 00/15] CCS static load balance
Date: Mon, 24 Mar 2025 14:29:36 +0100
Message-ID: <20250324132952.1075209-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.47.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

Back in v3, this patch series was turned down due to community
policies regarding i915 GEM development. Since then, I have
received several requests from userspace developers, which I
initially declined in order to respect those policies.

However, with the latest request from UMD users, I decided to
give this series another chance. I believe that when a feature
is genuinely needed, our goal should be to support it, not to
dismiss user and customer needs blindly.

Here is the link to the userspace counterpart, which depends on
this series to function properly[*].

I've been refreshing and testing the series together with Arshad.

This patchset introduces static load balancing for GPUs with
multiple compute engines. It's a relatively long series.

To help with review, I've broken the work down as much as
possible in multiple patches.

To summarise:
- Patches 1 to 14 introduce no functional changes, aside from
  adding the 'num_cslices' interface.
- Patch 15 contains the core of the CCS mode setting, building
  on the earlier groundwork.

The updated approach focuses on managing the UABI engine list,
which controls which engines are exposed to userspace. Instead
of manipulating physical engines and their memory directly, we
now control exposure via this list.

Since v3, I've kept the changes in v4 to a minimum because there
wasn't a real technical review on the previous posting. I would
really appreciate it if this time all technical concerns could be
raised and discussed on the mailing list.

IGT tests for this work exist but haven't been submitted yet.

Thanks to Chris for the reviews, to Arshad for the work we've
done together over the past few weeks, and to Michal for his
invaluable input from the userspace side.

Thanks,  
Andi

[*] https://github.com/intel/compute-runtime

Changelog:
==========
PATCHv3 -> PATCHv4
------------------
 - Rebase on top of the latest drm-tip
 - Do not call functions inside GEM_BUG_ONs, but call them
   explicitly (thanks Arshad).

PATCHv2 -> PATCHv3
------------------
 - Fix a NULL pointer dereference during module unload.
   In i915_gem_driver_remove() I was accessing the gt after the
   gt was removed. Use the dev_priv, instead (obviously!).
 - Fix a lockdep issue: Some of the uabi_engines_mutex unlocks
   were not correctly placed in the exit paths.
 - Fix a checkpatch error for spaces after and before parenthesis
   in the for_each_enabled_engine() definition.

PATCHv1 -> PATCHv2
------------------
 - Use uabi_mutex to protect the uabi_engines, not the engine
   itself. Rename it to uabi_engines_mutex.
 - Use kobject_add/kobject_del for adding and removing
   interfaces, this way we don't need to destroy and recreate the
   engines, anymore. Refactor intel_engine_add_single_sysfs() to
   reflect this scenario.
 - After adding engines to the rb_tree check that they have been
   added correctly.
 - Fix rb_find_add() compare function to take into accoung also
   the class, not just the instance.

RFCv2 -> PATCHv1
----------------
 - Removed gt->ccs.mutex
 - Rename m -> width, ccs_id -> engine in
   intel_gt_apply_ccs_mode().
 - In the CCS register value calculation
   (intel_gt_apply_ccs_mode()) the engine (ccs_id) needs to move
   along the ccs_mask (set by the user) instead of the
   cslice_mask.
 - Add GEM_BUG_ON after calculating the new ccs_mask
   (update_ccs_mask()) to make sure all angines have been
   evaluated (i.e. ccs_mask must be '0' at the end of the
   algorithm).
 - move wakeref lock before evaluating intel_gt_pm_is_awake() and
   fix exit path accordingly.
 - Use a more compact form in intel_gt_sysfs_ccs_init() and
   add_uabi_ccs_engines() when evaluating sysfs_create_file(): no
   need to store the return value to the err variable which is
   unused. Get rid of err.
 - Print a warnging instead of a debug message if we fail to
   create the sysfs files.
 - If engine files creation fails in
   intel_engine_add_single_sysfs(), print a warning, not an
   error.
 - Rename gt->ccs.ccs_mask to gt->ccs.id_mask and add a comment
   to explain its purpose.
 - During uabi engine creation, in
   intel_engines_driver_register(), the uabi_ccs_instance is
   redundant because the ccs_instances is already tracked in
   engine->uabi_instance.
 - Mark add_uabi_ccs_engines() and remove_uabi_ccs_engines() as
   __maybe_unused not to break bisectability. They wouldn't
   compile in their own commit. They will be used in the next
   patch and the __maybe_unused is removed.
 - Update engine's workaround every time a new mode is set in
   update_ccs_mask().
 - Mark engines as valid or invalid using their status as
   rb_node. Invalid engines are marked as invalid using
   RB_CLEAR_NODE(). Execbufs will check for their validity when
   selecting the engine to be combined to a context.
 - Create for_each_enabled_engine() which skips the non valid
   engines and use it in selftests.

RFCv1 -> RFCv2
--------------
Compared to the first version I've taken a completely different
approach to adding and removing engines. in v1 physical engines
were directly added and removed, along with the memory allocated
to them, each time the user changed the CCS mode (from the
previous cover letter).

Andi Shyti (15):
  drm/i915/gt: Avoid using masked workaround for CCS_MODE setting
  drm/i915/gt: Move the CCS mode variable to a global position
  drm/i915/gt: Allow the creation of multi-mode CCS masks
  drm/i915/gt: Refactor uabi engine class/instance list creation
  drm/i915/gem: Mark and verify UABI engine validity
  drm/i915/gt: Introduce for_each_enabled_engine() and apply it in
    selftests
  drm/i915/gt: Manage CCS engine creation within UABI exposure
  drm/i915/gt: Remove cslices mask value from the CCS structure
  drm/i915/gt: Expose the number of total CCS slices
  drm/i915/gt: Store engine-related sysfs kobjects
  drm/i915/gt: Store active CCS mask
  drm/i915: Protect access to the UABI engines list with a mutex
  drm/i915/gt: Isolate single sysfs engine file creation
  drm/i915/gt: Implement creation and removal routines for CCS engines
  drm/i915/gt: Allow the user to change the CCS mode through sysfs

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   3 +
 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  28 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  23 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  62 ++-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |  12 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c   | 357 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.h   |   5 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h      |  19 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   |   8 +-
 drivers/gpu/drm/i915/gt/selftest_context.c    |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_cs.c  |   4 +-
 .../drm/i915/gt/selftest_engine_heartbeat.c   |   6 +-
 drivers/gpu/drm/i915/gt/selftest_engine_pm.c  |   6 +-
 drivers/gpu/drm/i915/gt/selftest_execlists.c  |  52 +--
 drivers/gpu/drm/i915/gt/selftest_gt_pm.c      |   2 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |  22 +-
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  18 +-
 drivers/gpu/drm/i915/gt/selftest_mocs.c       |   6 +-
 drivers/gpu/drm/i915/gt/selftest_rc6.c        |   4 +-
 drivers/gpu/drm/i915/gt/selftest_reset.c      |   8 +-
 .../drm/i915/gt/selftest_ring_submission.c    |   2 +-
 drivers/gpu/drm/i915/gt/selftest_rps.c        |  14 +-
 drivers/gpu/drm/i915/gt/selftest_timeline.c   |  14 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c        |   2 +-
 .../gpu/drm/i915/gt/selftest_workarounds.c    |  14 +-
 drivers/gpu/drm/i915/gt/sysfs_engines.c       |  80 ++--
 drivers/gpu/drm/i915/gt/sysfs_engines.h       |   2 +
 drivers/gpu/drm/i915/i915_cmd_parser.c        |   2 +
 drivers/gpu/drm/i915/i915_debugfs.c           |   4 +
 drivers/gpu/drm/i915/i915_drv.h               |   5 +
 drivers/gpu/drm/i915/i915_gem.c               |   4 +
 drivers/gpu/drm/i915/i915_perf.c              |   8 +-
 drivers/gpu/drm/i915/i915_pmu.c               |  11 +-
 drivers/gpu/drm/i915/i915_query.c             |  21 +-
 37 files changed, 648 insertions(+), 193 deletions(-)

-- 
2.47.2

