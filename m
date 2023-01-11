Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A83666645B
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 21:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96DF010E7FF;
	Wed, 11 Jan 2023 20:05:02 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB04010E7FF;
 Wed, 11 Jan 2023 20:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673467501; x=1705003501;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ocfx/0JEeIPE+RuLixgmbBr3UJzKdp12keH9kfiTdg0=;
 b=SbakiqNxYB0NkHExMCpMmgQaPdi0DgH3qVfFsZlmlCYH9jrxTVLdoRm0
 JGQOS3SQ6xZiCFG+U9jzxaekw3mj1IxzSXqj6lLaVJveJoWiDFFIv6rpS
 lFXOrYRE8TRGcZ8ePwX553wKgdH9FkfW5IxjZVzRyDrWezbgsiKoK6DX3
 2TlZmkj6gy1xpiHtHvoQRxsg15h9cUvc9BZeHrF3Y5uZ4CYrubXfxgSFC
 3wTAZ9x5c5OnHeUQ+HdgX8ioAPon1FqCjUT82Vg4SralOAGuVgGZBUfbC
 AW1Qn6NkbOMzdBqaBM1Xn+oc4krtJV1JldIQ6lBBpHtbRTFFPvWjilnQB A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="307047470"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="307047470"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jan 2023 12:05:00 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="689878681"
X-IronPort-AV: E=Sophos;i="5.96,317,1665471600"; d="scan'208";a="689878681"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 11 Jan 2023 12:05:00 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v4 0/1] Add module oriented dmesg output
Date: Wed, 11 Jan 2023 12:04:28 -0800
Message-Id: <20230111200429.2139084-1-John.C.Harrison@Intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

When trying to analyse bug reports from CI, customers, etc. it can be
difficult to work out exactly what is happening on which GT in a
multi-GT system. So add GT oriented debug/error message wrappers. If
used instead of the drm_ equivalents, you get the same output but with
a GT# prefix on it.

This patch set updates the gt/intel_gt*.c files to use the new helpers
as a first step. The intention would be to convert all output messages
throughout the driver as long as they have access to a GT structure.

v2: Go back to using lower case names, add more wrapper sets (combined
review feedback). Also, wrap up probe injection and WARN entries.
v3: Split definitions out to separate header files. Tweak some
messages. Wrap a couple more functions. (review feedback from Jani and
Michal W).
Convert all gt/intel_gt*.c but drop the GuC/HuC/CT files as too much
bikeshedding about formatting.
v4: Re-order some macro definitions (Andi S), update (c) date (Tvrtko)

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>


John Harrison (1):
  drm/i915/gt: Start adding module oriented dmesg output

 drivers/gpu/drm/i915/gt/intel_gt.c            | 96 +++++++++----------
 .../gpu/drm/i915/gt/intel_gt_clock_utils.c    |  8 +-
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_mcr.c        |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_pm.c         |  9 +-
 drivers/gpu/drm/i915/gt/intel_gt_print.h      | 51 ++++++++++
 drivers/gpu/drm/i915/gt/intel_gt_sysfs.c      |  4 +-
 drivers/gpu/drm/i915/gt/intel_gt_sysfs_pm.c   | 34 ++-----
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  7 +-
 9 files changed, 129 insertions(+), 98 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/intel_gt_print.h

-- 
2.39.0

