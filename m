Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D7667C204
	for <lists+dri-devel@lfdr.de>; Thu, 26 Jan 2023 01:54:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 194D510E129;
	Thu, 26 Jan 2023 00:54:32 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2A0A10E129;
 Thu, 26 Jan 2023 00:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674694470; x=1706230470;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LQununLEUtF6V+l0D47YzD7ruI0qoHGbRKK2Rz3s2zk=;
 b=ZoWzId0wCe60KVk7uqx2ydSbHkvLFzPGz6hTvE1dg+wTRc4sdABUbUhj
 p3yNO4fNj7zENRUAf+92z3RDdSraYrpiWPUiJ3xR1s9GfqbC1DvY787Lt
 8thfXNB30Ua+lPrVbu244u2yw6LIQZ+znkEVXSr1yctczCiRrHBVoS2HZ
 b4vQopL6Gxq9qi5asJH2/0XdbyeANpla+nEy79tobvTWd2XalhsiUgA9K
 pQs8cEkCTTE+PuOn8nWMPSSj1YW1gJWROerGs1Rq3IQsN+LUFQq2iBCuV
 M2KSQNphMzW0lpGg2EGzF7vqAdeeVA411R0Z+JMUnmkeygV64I7ZxJPf0 w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="389064419"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="389064419"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2023 16:54:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10601"; a="751404265"
X-IronPort-AV: E=Sophos;i="5.97,246,1669104000"; d="scan'208";a="751404265"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by FMSMGA003.fm.intel.com with ESMTP; 25 Jan 2023 16:54:29 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v5 0/8] Allow error capture without a request & fix locking
 issues
Date: Wed, 25 Jan 2023 16:54:12 -0800
Message-Id: <20230126005420.160070-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (8):
  drm/i915/guc: Fix locking when searching for a hung request
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
2.39.1

