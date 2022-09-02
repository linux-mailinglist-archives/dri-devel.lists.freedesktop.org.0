Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B17795AA49A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 02:48:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11EB510E3D6;
	Fri,  2 Sep 2022 00:47:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EF4C10E3CB;
 Fri,  2 Sep 2022 00:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662079671; x=1693615671;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wmqWD3O42jTWAXVNa9JC4Ch535OBhOpJ7eyKubIMBXM=;
 b=Qnu9Lf+IsP2Tuka9N0GPMazim7aGB6yeuu1qmdEeYo64hSXCQ3b8GusL
 B3O8bkCPUvQdgi1QuVs0hofxNlbcgLsIpYVxO/AzDzdLuFWSat/y8/3lt
 CU4f61ys9aGR3ZPqrGG/OEx8blTmF1EkRIlUf9ym0/4Qv7IlmTsIGsZGi
 UANKWZOq+q2So2wqqqTiysyqSDxu9yN+hQp5XXT5Dr6wXOQXIQsKwK1nm
 I0CxcjjpdeSKIXMQ4SSdaXJ8izcgjBuoWtIwGfWMcZy7i3X46V9etWcCj
 odm6UwCfqyOzik/xcuY+Du4sk3FWcBBIgnn4eeXYATvxx7VmhdiunRAxv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="295868547"
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="295868547"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:47:49 -0700
X-IronPort-AV: E=Sophos;i="5.93,281,1654585200"; d="scan'208";a="642641232"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 17:47:49 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/7] i915: Prep work for explicit MCR handling
Date: Thu,  1 Sep 2022 17:47:33 -0700
Message-Id: <20220902004740.2849371-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Steering of multicast/replicated registers becomes a bit more
complicated on Meteor Lake.  Whereas previously the control register we
used to manage the steering was only used by our driver[*], software's
control of steering has now been consolidated with the controls for
various other hardware/firmware agents into a single register.  We can
no longer utilize pre-programmed implicit steering since other firmware
agents may change the steering target and not restore it afterward;
we'll need to explicitly steer all types of MCR registers (including the
GSLICE/COMPUTE/DSS ranges that have been handled implicitly in the
past).  Furthermore, since multiple agents will now be sharing a single
steering control register, races are possible.  To address this, the
hardware adds a new MCR semaphore register which is supposed to be used
to temporarily lock the steering while performing MCR operations.

It's going to become important for us to handle accesses of multicast
registers very explicitly going forward.  This series provides some prep
work for that by updating our register definitions to clearly define
registers as either MCR or non-MCR and ensure that we're using the
intel_gt_mcr_*() functions rather than intel_uncore_*() when operating
on MCR registers.  In a future series we plan to change the MCR_REG()
register definitions to actually declare MCR registers as a new C type
(i.e., not an i915_reg_t) so that the compiler will be able to help us
find any mistakes where non-MCR functions are used on MCR registers and
vice-versa.  Introduction of the MTL steering tables and introduction of
the steering semaphore support will also arrive in future patch series.


[*] This is a bit of an oversimplification; there are some hardware and
software debug tools that use the same MCR_SELECTOR register that i915
does and which could potentially re-steer MCR accesses behind our back.
E.g., simply using IGT's "intel_reg" tool to write the MCR_SELECTOR
register at the wrong time could interfere with driver operation.  But
given that these debug facilities require root privileges to run and are
only used by people intentionally debugging the driver or hardware, we
can ignore such races for real-world usage.


Matt Roper (7):
  drm/i915/gen8: Create separate reg definitions for new MCR registers
  drm/i915/xehp: Create separate reg definitions for new MCR registers
  drm/i915/gt: Drop a few unused register definitions
  drm/i915/gt: Correct prefix on a few registers
  drm/i915: Define MCR registers explicitly
  drm/i915/gt: Always use MCR functions on multicast registers
  drm/i915/gt: Add MCR-specific workaround initializers

 drivers/gpu/drm/i915/gt/intel_engine_cs.c     |   4 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   4 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       | 138 +++---
 drivers/gpu/drm/i915/gt/intel_gtt.c           |  44 +-
 drivers/gpu/drm/i915/gt/intel_gtt.h           |   2 +-
 drivers/gpu/drm/i915/gt/intel_mocs.c          |  12 +-
 drivers/gpu/drm/i915/gt/intel_workarounds.c   | 426 +++++++++++-------
 .../gpu/drm/i915/gt/intel_workarounds_types.h |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    |   7 +-
 .../gpu/drm/i915/gt/uc/intel_guc_capture.c    |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  12 +-
 drivers/gpu/drm/i915/gvt/handlers.c           |   2 +-
 drivers/gpu/drm/i915/gvt/mmio_context.c       |   2 +-
 drivers/gpu/drm/i915/intel_gvt_mmio_table.c   |   2 +-
 drivers/gpu/drm/i915/intel_pm.c               |  20 +-
 15 files changed, 397 insertions(+), 286 deletions(-)

-- 
2.37.2

