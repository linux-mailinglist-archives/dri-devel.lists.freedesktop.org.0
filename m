Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAEE6636A23
	for <lists+dri-devel@lfdr.de>; Wed, 23 Nov 2022 20:51:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 257DE10E60B;
	Wed, 23 Nov 2022 19:51:35 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 162CF10E244;
 Wed, 23 Nov 2022 19:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669233090; x=1700769090;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ioKuNI4lP1bRNgjbzlysbqDmvindd0nuPnoRC7ctSto=;
 b=Z/oHlnWmbfI9KRt8yR+q33nxwEXEKfH7nPopl2GpabYdPQQU3H8a+JGh
 jfVMG5C97O7loxMdeDaucKvrD+sRfT4/MS+wbyCyAtGYiim2nnm0udBh2
 lClMJhCS9tbLEx6KtcSCv9gNYA4TUSNbLp165GcYANCGFWsydYq+ZklsS
 7FLfWvtcSJXslxBYhtioNNtzNIBDIQpKUo0oN+T1gKaUVHs3RRcgz7UoH
 /aONH8Qs4MiiTt+MN+D8IoQMzqkdBPE+FL1tUSpPsMGXq5LlGfn87eVrO
 JPp2Vz2o8S7W4j3uEbWxuEaxadaOobJ/SeJAWJChWYzpOeBzPUebQmBxB g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="312846850"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="312846850"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Nov 2022 11:51:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10540"; a="816597785"
X-IronPort-AV: E=Sophos;i="5.96,187,1665471600"; d="scan'208";a="816597785"
Received: from relo-linux-5.jf.intel.com ([10.165.21.144])
 by orsmga005.jf.intel.com with ESMTP; 23 Nov 2022 11:51:28 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/5] Add module oriented dmesg output
Date: Wed, 23 Nov 2022 11:51:18 -0800
Message-Id: <20221123195123.1525100-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.3
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

When trying to analyse bug reports from CI, customers, etc. it can be
difficult to work out exactly what is happening on which GT in a
multi-GT system. So add GT oriented debug/error message wrappers. If
used instead of the drm_ equivalents, you get the same output but with
a GT# prefix on it.

It was also requested to extend this further to submodules in order to
factor out the repeated structure accessing constructs and common
string prefixes. So, add versions for GuC, HuC and GuC CTB as well.

This patch set updates all the gt/uc files to use the new helpers as a
first step. The intention would be to convert all output messages that
have access to a GT structure.

v2: Go back to using lower case names, add more wrapper sets (combined
review feedback). Also, wrap up probe injection and WARN entries.
v3: Split definitions out to separate header files. Tweak some
messages. Wrap a couple more functions. (review feedback from Jani and
Michal W).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (5):
  drm/i915/gt: Start adding module oriented dmesg output
  drm/i915/huc: Add HuC specific debug print wrappers
  drm/i915/guc: Add GuC specific debug print wrappers
  drm/i915/guc: Add GuC CT specific debug print wrappers
  drm/i915/uc: Update the gt/uc code to use gt_err and friends

 drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
 drivers/gpu/drm/i915/gt/intel_gt_print.h      |  51 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  33 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   9 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  49 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 218 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  28 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  38 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h  |  42 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  56 ++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  63 +++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  32 ++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  30 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 110 +++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  99 ++++----
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
 19 files changed, 549 insertions(+), 479 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_guc_print.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

-- 
2.37.3

