Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A4167DACD
	for <lists+dri-devel@lfdr.de>; Fri, 27 Jan 2023 01:29:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C7810E3D5;
	Fri, 27 Jan 2023 00:29:10 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5807410E146;
 Fri, 27 Jan 2023 00:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674779340; x=1706315340;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=EeEPF2hIz5rRdug74+zbZ/tWGVUSyl6VLPDwwjINot0=;
 b=msoO4JzSlnR11kB1ywq5+H9TVopPM3mKrcRZmWdHlr5KGcdNegDendGf
 YN+IqWo0bEVxfMGxFGWSlWwRpNupbBJeEujbAdxeM+YtgI1CQARlA2OD0
 9QVhwTlhrgy6VTKu7HzddJgECEq+ktRNfPmPKDXAij7uvIV1ld4iTOE8x
 BN7VG5IT2ZGBWMY2kAlAlOub31suLDXoEp4tu9U617xYN2INv/BP01+AM
 VbrtMkKuTY1Ti6Ly0zYKSnfP/qbsYbzK2unntHuaKgDamw3qIDLLepkVE
 1PGILxCozw3tnXlzrFFgbXWX6bqBTgkj/KX81VdRiqHGPTRBitFHhKjDI A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="324687295"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="324687295"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2023 16:28:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10602"; a="805621874"
X-IronPort-AV: E=Sophos;i="5.97,249,1669104000"; d="scan'208";a="805621874"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga001.fm.intel.com with ESMTP; 26 Jan 2023 16:28:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v6 0/8] Allow error capture without a request & fix locking
 issues
Date: Thu, 26 Jan 2023 16:28:34 -0800
Message-Id: <20230127002842.3169194-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

It is technically possible to get a hung context without a valid
request. In such a situation, try to provide as much information in
the error capture as possible rather than just aborting and capturing
nothing.

Similarly, in the case of an engine reset failure the GuC is not able
to report the guilty context. So try a manual search instead of
reporting nothing.

While doing all this, it was noticed that the locking was broken in a
number of places when searching for hung requests and dumping request
info. So fix all that up as well.

v2: Tidy up code flow in error capture. Reword some comments/messages.
(review feedback from Tvrtko)
Also fix up request locking issues from earlier changes noticed during
code review of this change.
v3: Fix some potential null pointer derefs and a reference leak.
Add new patch to refactor the duplicated hung request search code into
a common backend agnostic wrapper function and use the correct
spinlocks for the correct lists. Also tweak some of the patch
descriptions for better accuracy.
v4: Shuffle some code around to more appropriate source files. Fix
potential leak of GuC capture object after code flow re-org and pull
improved info message earlier (Daniele). Also rename the GuC capture
object to be more consistent.
v5: Split one self contained locking fix out into a separate patch
and rename a function to be shorter (Tvrtko).
v6: s/locking/reference counting/ in message of patch #2 (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (8):
  drm/i915/guc: Fix locking when searching for a hung request
  drm/i915: Fix request ref counting during error capture & debugfs dump
  drm/i915: Fix up locking around dumping requests lists
  drm/i915: Allow error capture without a request
  drm/i915: Allow error capture of a pending request
  drm/i915/guc: Look for a guilty context when an engine reset fails
  drm/i915/guc: Add a debug print on GuC triggered reset
  drm/i915/guc: Rename GuC register state capture node to be more
    obvious

 drivers/gpu/drm/i915/gt/intel_context.c       |  4 +-
 drivers/gpu/drm/i915/gt/intel_context.h       |  3 +-
 drivers/gpu/drm/i915/gt/intel_engine.h        |  4 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     | 74 ++++++++-------
 .../drm/i915/gt/intel_execlists_submission.c  | 27 ++++++
 .../drm/i915/gt/intel_execlists_submission.h  |  4 +
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  8 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 35 ++++++-
 drivers/gpu/drm/i915/i915_gpu_error.c         | 92 ++++++++++---------
 drivers/gpu/drm/i915/i915_gpu_error.h         |  2 +-
 10 files changed, 160 insertions(+), 93 deletions(-)

-- 
2.39.1

