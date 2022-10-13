Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F33C85FCF17
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 02:01:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6202D10E2C3;
	Thu, 13 Oct 2022 00:01:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514BE10E10C;
 Thu, 13 Oct 2022 00:01:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665619290; x=1697155290;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=JJKNQgwMR6JwUxLPr2mg4vB2mJHLGaCaQCipoOO5rKw=;
 b=k1KGPCZt9Q0T/7O3IzbRmv5o0kytg9g/9ymE04MEkwE64PcIKhNRCSQq
 gdeyABrbOzWy6RhWAB6X922sueFXyGkXmdEh+VJveDV/lwhO6ZRcyxNFs
 eOIOpq0CFTiQ3myVl1oZdYoQFJSswtb2hhux9z/mOJ2aA5aYzUSUT+i7x
 PYQhjnc+XiuxHusU25KKv+MykIe2vhgkuxdnDexiW6IWS2ClHIM+gnfSS
 wSexIvEtFIwpyQkzasrvGiTe2N+xE6XNfr67QrFbnYJrTc/4Wi0EbyakO
 hBKJ0eMX++5lxonXAQeVsTHpBryfju3MS09/5uSGdvvX8/eXW/dxqc2pz w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="292263350"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="292263350"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:29 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="802031080"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="802031080"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/7] drm/i915: prepare for uC loading on MTL
Date: Wed, 12 Oct 2022 17:03:25 -0700
Message-Id: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
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

v2: address review comments

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

 drivers/gpu/drm/i915/Makefile               |  5 ++-
 drivers/gpu/drm/i915/gt/intel_ggtt.c        |  2 +-
 drivers/gpu/drm/i915/gt/intel_gt.c          |  1 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c      | 21 +++++++--
 drivers/gpu/drm/i915/gt/intel_gt_regs.h     |  2 +
 drivers/gpu/drm/i915/gt/intel_gt_types.h    |  2 +
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c | 48 +++++++++++++++------
 drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h |  0
 drivers/gpu/drm/i915/gt/uc/intel_guc.c      | 43 ++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_guc.h      |  5 ++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h  |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c      | 29 +++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c       | 12 ++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c    | 44 +++++++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h    | 13 ++++++
 drivers/gpu/drm/i915/i915_driver.c          |  2 -
 drivers/gpu/drm/i915/i915_drv.h             | 12 +++---
 drivers/gpu/drm/i915/i915_gem.c             |  6 ++-
 drivers/gpu/drm/i915/i915_pci.c             |  1 +
 19 files changed, 189 insertions(+), 61 deletions(-)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.c (86%)
 rename drivers/gpu/drm/i915/{ => gt}/intel_wopcm.h (100%)

-- 
2.37.3

