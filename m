Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABB9469717
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 14:32:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E0D8734F9;
	Mon,  6 Dec 2021 13:32:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ADA46FA9F;
 Mon,  6 Dec 2021 13:32:26 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10189"; a="237537369"
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="237537369"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 05:32:25 -0800
X-IronPort-AV: E=Sophos;i="5.87,291,1631602800"; d="scan'208";a="514737350"
Received: from bgodonne-mobl1.amr.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.17.226])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Dec 2021 05:32:23 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/8] DG2 accelerated migration/clearing support
Date: Mon,  6 Dec 2021 13:31:32 +0000
Message-Id: <20211206133140.3166205-1-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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

Matthew Auld (8):
  drm/i915/migrate: don't check the scratch page
  drm/i915/migrate: fix offset calculation
  drm/i915/migrate: fix length calculation
  drm/i915/selftests: handle object rounding
  drm/i915/gtt: allow overriding the pt alignment
  drm/i915/gtt: add xehpsdv_ppgtt_insert_entry
  drm/i915/migrate: add acceleration support for DG2
  drm/i915/migrate: turn on acceleration for DG2

 drivers/gpu/drm/i915/gt/gen8_ppgtt.c       |  50 +++++-
 drivers/gpu/drm/i915/gt/intel_gtt.h        |  10 +-
 drivers/gpu/drm/i915/gt/intel_migrate.c    | 195 ++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_ppgtt.c      |  16 +-
 drivers/gpu/drm/i915/gt/selftest_migrate.c |   1 +
 5 files changed, 221 insertions(+), 51 deletions(-)

-- 
2.31.1

