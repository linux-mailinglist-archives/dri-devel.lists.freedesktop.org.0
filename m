Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8E9E676185
	for <lists+dri-devel@lfdr.de>; Sat, 21 Jan 2023 00:29:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 564AC10EB23;
	Fri, 20 Jan 2023 23:28:52 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79FC10EB18;
 Fri, 20 Jan 2023 23:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674257329; x=1705793329;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=tGpmEBwL/m/7VuG0h3WlxIVx1zoVSejS4FxSnruKnpo=;
 b=RWO2/Sk1Z0gGX1jPfb6tz3DyZjhkBIxp6IxxcdpzGds8Ybu4ScO/RNZq
 sOvQCC8/MNeFs/Te2EC4yRHfIVqhhAyueuk1km0y1U5hP147bQa4P496k
 KGCfOypxBtkAgoYUAWKRCBmx74mONZWicnn9MV5TBLiNhvqYvYDmyTHUI
 X97C77WRLCFD+4LqNoA1RdDjEi/chujQz1yRSwCANyiVUes/LNXqVShEm
 iJNnD8eRbfpn3xnoCG+O9MrxR/GRYhpvNGyBMof7VfcG76msLD7ixlr9A
 QXxbzfEczcRtBV8liFD3rKRhfpXabtBjsoic27aWVeR0HoCLSEnlN6Shv w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="324413558"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="324413558"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jan 2023 15:28:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10596"; a="693021604"
X-IronPort-AV: E=Sophos;i="5.97,233,1669104000"; d="scan'208";a="693021604"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 20 Jan 2023 15:28:48 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 0/7] Allow error capture without a request & fix locking
 issues
Date: Fri, 20 Jan 2023 15:28:24 -0800
Message-Id: <20230120232831.28177-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.39.0
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (7):
  drm/i915: Fix request locking during error capture & debugfs dump
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
2.39.0

