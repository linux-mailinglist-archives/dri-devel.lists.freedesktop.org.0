Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AB54959C22
	for <lists+dri-devel@lfdr.de>; Wed, 21 Aug 2024 14:44:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACADA10E4E7;
	Wed, 21 Aug 2024 12:44:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zwgo+Z9D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC3B10E4E7;
 Wed, 21 Aug 2024 12:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724244255; x=1755780255;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ow/TkFiP1R1TDO+3EXUJkvao7qwpbV6PFiGGUFrET7s=;
 b=Zwgo+Z9Dz18SJjSSxnTIWw446kMVmUe0SMIJKu5Jtumqy3MuFfSXZHdp
 mUPxVcayYc6DMhrd8QIOJv4VdheY+8sO/N69TMte/Q3fFT3NYFyfdRmeg
 ZXgllsl72u4De93UjmLNCPme3o9Lfpl8+znNbfJ6zQlC1VMiUwVXXtBmE
 OAArRyabtniiXpEjWrM4XUHRfkDYH22Q6yJneXQhqW5fy77Ef+CY2FlFJ
 YJEXS2iKiCcaXAsNeTzwBg9muK4vWyUMIWhEpNzr4/h5Dj5r3z9XvQk4B
 ryJ6nZWwd8Ej12qPvW+NcNHihxMbOFWFuQ0Dm2s1+T86KaHSX1XBza9br A==;
X-CSE-ConnectionGUID: ILX6nW1mTF+1kglBNbpKVA==
X-CSE-MsgGUID: 44yGab23SjKb7vHM0vAOAw==
X-IronPort-AV: E=McAfee;i="6700,10204,11171"; a="33754090"
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="33754090"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:14 -0700
X-CSE-ConnectionGUID: NXo6E/qGTsC4D9gJE1dHXA==
X-CSE-MsgGUID: b65GMFpfT/Cs9P/ilamOcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,164,1719903600"; d="scan'208";a="98554570"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO intel.com)
 ([10.245.246.24])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Aug 2024 05:44:12 -0700
From: Andi Shyti <andi.shyti@linux.intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 Andi Shyti <andi.shyti@linux.intel.com>
Subject: [PATCH v1 00/14] CCS static load balance
Date: Wed, 21 Aug 2024 14:43:35 +0200
Message-ID: <20240821124349.295259-1-andi.shyti@linux.intel.com>
X-Mailer: git-send-email 2.45.2
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

Time to promote this series from RFCv2 to PATCHv1 as I think it's
already in a decent working condition.

This patch series introduces static load balancing for GPUs with
multiple compute engines. It's a lengthy series, and some
challenging aspects still need to be resolved.

I have tried to split the work as much as possible to facilitate
the review process.

To summarize, in patches 1 to 13, no functional changes occur
except for the addition of the num_cslices interface. The
significant changes happen in patch 14, which is the core part of
the CCS mode setting, utilizing the groundwork laid in the
earlier patches.

In this updated approach, the focus is now on managing the UABI
engine list, which controls the engines exposed to userspace.
Instead of manipulating phuscal engines and their memory, we now
handle engine exposure through this list.

I would greatly appreciate further input from all reviewers who
have already assisted with the previous work.

IGT tests have also been developed, but I haven't sent them yet.

Thank you Chris for the offline reviews.

Changelog:
==========
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

Andi Shyti (14):
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
  drm/i915/gt: Isolate single sysfs engine file creation
  drm/i915/gt: Implement creation and removal routines for CCS engines
  drm/i915/gt: Allow the user to change the CCS mode through sysfs

 .../gpu/drm/i915/gem/i915_gem_execbuffer.c    |  28 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  23 --
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |   7 +
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |  57 ++-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   3 +
 drivers/gpu/drm/i915/gt/intel_gt.h            |  12 +
 drivers/gpu/drm/i915/gt/intel_gt_ccs_mode.c   | 324 +++++++++++++++++-
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
 drivers/gpu/drm/i915/gt/sysfs_engines.c       |  76 ++--
 drivers/gpu/drm/i915/gt/sysfs_engines.h       |   2 +
 drivers/gpu/drm/i915/i915_drv.h               |   1 +
 30 files changed, 562 insertions(+), 185 deletions(-)

-- 
2.45.2

