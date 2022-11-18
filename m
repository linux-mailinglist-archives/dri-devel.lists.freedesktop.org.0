Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 602FD62EB7C
	for <lists+dri-devel@lfdr.de>; Fri, 18 Nov 2022 02:59:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D660E10E6D7;
	Fri, 18 Nov 2022 01:59:18 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1012D10E6D7;
 Fri, 18 Nov 2022 01:59:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736755; x=1700272755;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ChZ2kpyYxQNwBlrGQM/5l8potdmZPG9r088A3AOdrh8=;
 b=XrPwJYrr1wdUspee6vLvirr3BcBEqC5zHrPyJBH2hYWIZDMZMANv4CFO
 m2hhIzOT28XkkN/iqchTgOZxlVd5JmkyKidTLfSEg1cGi7de4Gbum8rxX
 ARGXFZpT8NDI8/RDCN9+gVfsjjkemMDdNwqzvi1bFGSnYT06vwoHiGS99
 J8a8RfBZc4z0uYsaeJFO21+QgYf4B8jZC3cCoGASUiUzw6HMHMhtRCKXj
 9BYFURn1nIm/nuyOXgPv5qKGLRf5AOW7gsNHndS1fqvT1e0LlONTZT59V
 zlq9lz7ZiOuLeSJRsIe/TrDzvAZOiO0xvMfV3B+MYwzu34qRWUPn8ERRR Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="300565825"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="300565825"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 17:59:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="703563410"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="703563410"
Received: from relo-linux-5.jf.intel.com ([10.165.21.143])
 by fmsmga008.fm.intel.com with ESMTP; 17 Nov 2022 17:59:13 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/5] Add module oriented dmesg output
Date: Thu, 17 Nov 2022 17:58:53 -0800
Message-Id: <20221118015858.2548106-1-John.C.Harrison@Intel.com>
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (5):
  drm/i915/gt: Start adding module oriented dmesg output
  drm/i915/huc: Add HuC specific debug print wrappers
  drm/i915/guc: Add GuC specific debug print wrappers
  drm/i915/guc: Add GuC CT specific debug print wrappers
  drm/i915/uc: Update the gt/uc code to use gt_err and friends

 drivers/gpu/drm/i915/gt/intel_gt.c            |  96 ++++----
 drivers/gpu/drm/i915/gt/intel_gt.h            |  35 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  32 +--
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  35 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   8 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |  48 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c     | 222 +++++++++---------
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  19 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_log.c    |  37 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_rc.c     |   7 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c   |  55 ++---
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  62 +++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |  31 +--
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  23 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         | 108 ++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  98 ++++----
 drivers/gpu/drm/i915/gt/uc/selftest_guc.c     |  34 +--
 .../drm/i915/gt/uc/selftest_guc_hangcheck.c   |  22 +-
 .../drm/i915/gt/uc/selftest_guc_multi_lrc.c   |  10 +-
 19 files changed, 507 insertions(+), 475 deletions(-)

-- 
2.37.3

