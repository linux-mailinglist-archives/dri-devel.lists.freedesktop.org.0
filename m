Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8187ABBB3
	for <lists+dri-devel@lfdr.de>; Sat, 23 Sep 2023 00:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0058410E71B;
	Fri, 22 Sep 2023 22:26:11 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E2AB10E19F;
 Fri, 22 Sep 2023 22:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695421568; x=1726957568;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S3/agmtnX62hNsyTKMAsvrQ7vek3USJyCWWMexcQ9FQ=;
 b=JezkgyeGiRjBSic2+5ujpwX2KTUaGpEhu+cw8E+GzwhS805uT3QV5RuZ
 wYpDNVUaOK0S9jojTXj2JDX2F2qaD9vBJ25FhlI9oFoME5btD3bX/J8RT
 NK8hRiFGq9l0NmQc3c8fBXg4bWHJa0FGnjQE5TOzr5goLPvpZCJS71JFA
 NPsFPUiYSLB2IjMRzNTMDEdgZMulR0wrNauzbwu7eXCoHxBffMBKZDWih
 r2+gZqoYZl1SwCieEMjd68NbyCs0SDAe1+q23FhmgJ3tRVJnakpk0DC0z
 2621bBTod80iUJFKydIvCXaYTJnbFEA4y105a5i2CFKVTdLZ7W1ZXsb2K Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="379836615"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="379836615"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Sep 2023 15:25:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10841"; a="1078549550"
X-IronPort-AV: E=Sophos;i="6.03,169,1694761200"; d="scan'208";a="1078549550"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga005.fm.intel.com with ESMTP; 22 Sep 2023 15:25:56 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/3] Engine busyness v2
Date: Fri, 22 Sep 2023 15:25:07 -0700
Message-ID: <20230922222510.2235213-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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

The latest GuC implements a new and improved scheme for tracking
engine busyness. So make use of it.

Note that this change comes along with a new set of PMU counters. The
old counters have a fundamental problem that they are defined in terms
of wall time but the sampling is now all done by the GPU in terms of
clock ticks. This leads to issues with timebase conversion, some of
which are non-trivial.

For existing platforms, the old counters will still be updated by the
new scheme and will still suffer all the same issues. For newer
platforms (MTL onwards), the old counters are no longer supported.

Instead, there is a new set of tick based counters. These include the
actual busyness count per engine plus a total ticks count. The
intention is that they should be queried as an atomic pair and used
together to determine a busyness percentage. No assumptions may be made
about tick frequencies or relations to wall time.

Test-with: 20230922215233.2438200-1-umesh.nerlige.ramappa@intel.com
Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (1):
  drm/i915/guc: Support new and improved engine busyness

Umesh Nerlige Ramappa (2):
  drm/i915/mtl: Add a PMU counter for total active ticks
  drm/i915/mtl: Add counters for engine busyness ticks

 drivers/gpu/drm/i915/gt/intel_engine.h        |   1 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |  16 +
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  16 +-
 drivers/gpu/drm/i915/gt/intel_engine_user.c   |   1 +
 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  82 ++--
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |  55 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   9 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  23 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 460 ++++++++++++++----
 .../gpu/drm/i915/gt/uc/intel_guc_submission.h |   1 +
 drivers/gpu/drm/i915/i915_pmu.c               |  31 +-
 drivers/gpu/drm/i915/i915_pmu.h               |   2 +-
 include/uapi/drm/i915_drm.h                   |  15 +-
 14 files changed, 570 insertions(+), 146 deletions(-)

-- 
2.41.0

