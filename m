Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E80603E8791
	for <lists+dri-devel@lfdr.de>; Wed, 11 Aug 2021 03:16:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B784D6E07F;
	Wed, 11 Aug 2021 01:16:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECAFA89D77
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Aug 2021 01:16:29 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10072"; a="202211825"
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="202211825"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:28 -0700
X-IronPort-AV: E=Sophos;i="5.84,311,1620716400"; d="scan'208";a="675603975"
Received: from dut151-iclu.fm.intel.com ([10.105.23.69])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2021 18:16:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <gfx-internal-devel@eclists.intel.com>, <dri-devel@lists.freedesktop.org>
Subject: [PATCH 0/9] Clean up some CI failures for GuC submission
Date: Wed, 11 Aug 2021 01:16:13 +0000
Message-Id: <20210811011622.255784-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.32.0
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

Resets are notoriously hard to get fully working and notoriously racey,
especially with selftests / IGTs that do all sorts of wild things that
would be near impossible to hit during normal use cases. Even though
likely impossible to hit, anything selftests / IGTs uncover needs to be
fixed. This series addresses 7 such issues, adds a workaround to a
selftest, and add another selftest to prove scrubbing of G2H during a
reset works. 

v2:
 (Daniel Vetter)
  - Split fixes into individual patches
  - A kernel doc
  - A VLK ref for selftest workaround
 (Checkpatch)
  - Fix warnings

Signed-off-by: Matthew Brost <matthew.brost@intel.com>

Matthew Brost (9):
  drm/i915/guc: Fix blocked context accounting
  drm/i915/guc: outstanding G2H accounting
  drm/i915/guc: Unwind context requests in reverse order
  drm/i915/guc: Don't drop ce->guc_active.lock when unwinding context
  drm/i915/guc: Flush the work queue for GuC generated G2H
  drm/i915/guc: Do not clear enable during reset in an enable is
    inflight
  drm/i915/guc: Don't enable scheduling on a banned context
  drm/i915/selftests: Fix memory corruption in live_lrc_isolation
  drm/i915/selftests: Add initial GuC selftest for scrubbing lost G2H

 drivers/gpu/drm/i915/gt/intel_context_types.h |  18 +++
 drivers/gpu/drm/i915/gt/selftest_lrc.c        |  29 +++-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  69 +++++++---
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     | 126 ++++++++++++++++++
 .../drm/i915/selftests/i915_live_selftests.h  |   1 +
 .../i915/selftests/intel_scheduler_helpers.c  |  12 ++
 .../i915/selftests/intel_scheduler_helpers.h  |   2 +
 7 files changed, 239 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/selftest_guc.c

-- 
2.32.0

