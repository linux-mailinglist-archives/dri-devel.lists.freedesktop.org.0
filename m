Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E942772353D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Jun 2023 04:24:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2C9710E1EE;
	Tue,  6 Jun 2023 02:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67FA610E175;
 Tue,  6 Jun 2023 02:24:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686018253; x=1717554253;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=FTWncKnlRLRcK32V85Z+JxPpR5DuL0AcRtfD8h3vBus=;
 b=MkjmiV/FaQrn8h5tuEO30CUss4BEO4wzdFEGc0Kq3ZuWZQrF/37oMvPf
 llzD3Zt1atTqoWn0k7WE+HvGLX/P7kCnvOXqNtxv/8NfudImB/OWFT+0w
 6icqq67clJmzbynBMWCZZ9+LAZskeJn/1QyhH1h8WlqZZ/pWhi+7lJTNo
 M6JeMTi49QsaaK8pNdsiH32rn7a8AfnbER41FvMImNjLUGtJd29ALOhuG
 io9ItXqWW+w37SkWr1GVZB7FwV7jMBfTJ39twB1apVBPEJW4VlVn0wlK+
 hWXtxvzQvsqj/e/qfbJ6giUGdNZPqmPTQZk493xRS3CgVoUypyrSalax+ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="358995773"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="358995773"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10732"; a="712019536"
X-IronPort-AV: E=Sophos;i="6.00,219,1681196400"; d="scan'208";a="712019536"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2023 19:24:11 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/5] drm/i915: GSC FW support for MTL
Date: Mon,  5 Jun 2023 19:23:57 -0700
Message-Id: <20230606022402.2048235-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Suraj Kandpal <suraj.kandpal@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Last chunk of the required support for the GSC FW. This includes some
fixes to the GSC memory allocation, FW idefinition and version
management, plus a new debugfs for debug information.

Adding the FW definition will enable all the features that are dependent
on the GSC being loaded (Media C6, HuC loading, SW proxy, PXP, HDCP).

NOTE: the FW team has asked to not send the current FW blob to
linux-firmware yet, as they're planning some updates. Therefore, the
FW definition patch will have to be merged to the topic/core-for-CI
branch for now and moved to gt-next once the FW is ready.

v2: fix header parsing, address other minor review comments.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Suraj Kandpal <suraj.kandpal@intel.com>

Daniele Ceraolo Spurio (5):
  drm/i915/gsc: fixes and updates for GSC memory allocation
  drm/i915/mtl/gsc: extract release and security versions from the gsc
    binary
  drm/i915/mtl/gsc: query the GSC FW for its compatibility version
  drm/i915/mtl/gsc: Add a gsc_info debugfs
  drm/i915/gsc: define gsc fw

 drivers/gpu/drm/i915/Makefile                 |   3 +-
 .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  76 ++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c     | 309 +++++++++++++++---
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h     |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     | 125 ++++++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  21 ++
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c |  38 +++
 .../gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h |  14 +
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  13 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_debugfs.c |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 112 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   4 +
 drivers/gpu/drm/i915/i915_reg.h               |  26 +-
 15 files changed, 641 insertions(+), 111 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_debugfs.h

-- 
2.40.0

