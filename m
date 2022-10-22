Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8630E6082B4
	for <lists+dri-devel@lfdr.de>; Sat, 22 Oct 2022 02:08:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45AB910E298;
	Sat, 22 Oct 2022 00:07:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236E410E30B;
 Sat, 22 Oct 2022 00:07:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666397265; x=1697933265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=/bdPB5uiZtNYI8N2XHemcivjgD8CajWvhlkcVy7rtnI=;
 b=W6nnwtwlMSUobDovEWrQ7ZnguFeU2woLYFXZn3S+P8P/3OehKn+HoMeb
 xA34CB2C3Zj/9qg4748VwK++dwczh/L0gW1mPgo6EEHXOEfcWQ86BUlRh
 Eq4t0yoXvl57Ia4SoKdKavxHgtdGqYPBjFNfTQYRv6jURTnolE664yA0x
 la/bWOsZNkxi0yeg0/a55CJGr2DfZjmbwTEhOssvHy0JV08ZInD9WjXvV
 8fE8iztPjl+BYBw3Hn3z8w/DfLHvlFF1OoXH4P22flNCGh81PuCT+m5rh
 EoPfF+0xZtTy7fB2htxHkjWa1EEmufDvi7gIdsiMlmIK74joEuzW0uWSd g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="371354913"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="371354913"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:44 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10507"; a="693917180"
X-IronPort-AV: E=Sophos;i="5.95,203,1661842800"; d="scan'208";a="693917180"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Oct 2022 17:07:43 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 0/7] drm/i915: prepare for uC loading on MTL
Date: Fri, 21 Oct 2022 17:10:01 -0700
Message-Id: <20221022001008.2340224-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
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
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Aravind Iddamsetty <aravind.iddamsetty@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The introduction of the media GT brings a few changes for GuC/HuC. The
main difference between the 2 GTs is that only the media one has the
HuC, while both have the GuC. Also, the fact that both GTs use the same
G-unit and GGTT means we now have parallel interrupt/communication
paths. Lastly, WOPCM is divided between the two GTs, with each having
their own private chunk.

v2: address review comments.
v3: comment improvements, minor clean-up.

Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>

Aravind Iddamsetty (1):
  drm/i915/mtl: Handle wopcm per-GT and limit calculations.

Daniele Ceraolo Spurio (5):
  drm/i915/huc: only load HuC on GTs that have VCS engines
  drm/i915/uc: fetch uc firmwares for each GT
  drm/i915/uc: use different ggtt pin offsets for uc loads
  drm/i915/guc: define media GT GuC send regs
  drm/i915/guc: handle interrupts from media GuC

Stuart Summers (1):
  drm/i915/guc: Add GuC deprivilege feature to MTL

 Documentation/gpu/i915.rst                  |  2 +-
 drivers/gpu/drm/i915/Makefile               |  5 ++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c      | 21 ++++++++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 44 ++++++++++++++------
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 43 +++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  5 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h  |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c      | 29 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       | 12 ++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 46 +++++++++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h    | 14 +++++++
 drivers/gpu/drm/i915/i915_driver.c          |  2 -
 drivers/gpu/drm/i915/i915_drv.h             | 12 +++---
 drivers/gpu/drm/i915/i915_gem.c             |  6 ++-
 drivers/gpu/drm/i915/i915_pci.c             |  1 +
 20 files changed, 189 insertions(+), 62 deletions(-)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (87%)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)

-- 
2.37.3

