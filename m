Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA32146773D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 13:25:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B94DE73F39;
	Fri,  3 Dec 2021 12:25:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E5273F39;
 Fri,  3 Dec 2021 12:24:58 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10186"; a="297761383"
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="297761383"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:24:58 -0800
X-IronPort-AV: E=Sophos;i="5.87,284,1631602800"; d="scan'208";a="746699381"
Received: from ashunt-mobl2.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.106])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2021 04:24:56 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/8] DG2 accelerated migration/clearing support
Date: Fri,  3 Dec 2021 12:24:18 +0000
Message-Id: <20211203122426.2859679-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
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
Cc: bob.beckett@collabora.com, adrian.larumbe@collabora.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable accelerated moves and clearing on DG2. On such HW we have minimum page
size restrictions when accessing LMEM from the GTT, where we now have to use 64K
GTT pages or larger. With the ppGTT the page-table also has a slightly different
layout from past generations when using the 64K GTT mode(which is still enabled
on via some PDE bit), where it is now compacted down to 32 qword entries. Note
that on discrete the paging structures must also be placed in LMEM, and we need
to able to modify them via the GTT itself(see patch 7), which is one of the
complications here.

The series needs to be applied on top of the DG2 enabling branch:
https://cgit.freedesktop.org/~ramaling/linux/log/?h=dg2_enabling_ww49.3

Patches 2, 7 and 8 have a dependency on patches in that branch, but the rest can
likely already land if the direction makes sense.

Matthew Auld (8):
  drm/i915/migrate: don't check the scratch page
  drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
  drm/i915/gtt: add gtt mappable plumbing
  drm/i915/migrate: fix offset calculation
  drm/i915/migrate: fix length calculation
  drm/i915/selftests: handle object rounding
  drm/i915/migrate: add acceleration support for DG2
  drm/i915/migrate: turn on acceleration for DG2

 drivers/gpu/drm/i915/gem/i915_gem_context.c   |   4 +-
 .../gpu/drm/i915/gem/selftests/huge_pages.c   |   2 +-
 drivers/gpu/drm/i915/gt/gen6_ppgtt.c          |   2 +-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c          |  53 ++++-
 drivers/gpu/drm/i915/gt/gen8_ppgtt.h          |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c            |   2 +-
 drivers/gpu/drm/i915/gt/intel_gtt.c           |   7 +
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   9 +
 drivers/gpu/drm/i915/gt/intel_migrate.c       | 196 ++++++++++++++----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c         |  17 +-
 drivers/gpu/drm/i915/gt/selftest_hangcheck.c  |   2 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c    |   1 +
 drivers/gpu/drm/i915/gvt/scheduler.c          |   2 +-
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |   4 +-
 15 files changed, 241 insertions(+), 63 deletions(-)

-- 
2.31.1

