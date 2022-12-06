Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16CE2643A90
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 02:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5835110E13C;
	Tue,  6 Dec 2022 01:15:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B45710E0E1;
 Tue,  6 Dec 2022 01:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1670289319; x=1701825319;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=hbQShNZX/rk3VUPVGk4QNY5SHehQVeHOKYMcpafhxA0=;
 b=b5siLjzFZGc6fUgvQOnXrGDmzs1mFEcPzwVmZl44KUDhX3asXeWU2mgG
 1huOs11ITPv7ter2odj/GFxQWZ2sg2MHxVlxJEIdneMzgzJIUSG/mlIM7
 f7rO2t6lu3B6ysBPbi/LXIYtHUJjZXOkhgowe61d5bPJ4Uiatb8ik0Dbc
 090YUJgkODT/fSrzWaBjWxN4WTMAuZEA3RyPtldKoy5SIUi45GkWs/bNN
 DVWSB40Lgs7sV8s52c1bZX4gGe4a3tFws8wydaiwhvBnTnb82eJt6w0Q0
 kXQF5OIEukCsfsFu5dEs6TuUs4oU/HTIkkShi0Y2te9uofIK5TDAtn9dQ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="317650456"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="317650456"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:18 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10552"; a="974890685"
X-IronPort-AV: E=Sophos;i="5.96,220,1665471600"; d="scan'208";a="974890685"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Dec 2022 17:15:18 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 0/6] drm/i915: Add support for GSC FW loading
Date: Mon,  5 Dec 2022 17:19:02 -0800
Message-Id: <20221206011908.2745508-1-daniele.ceraolospurio@intel.com>
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
Cc: John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting from MTL, the GSC FW is runtime loaded by the driver, instead
of being stored in flash memory. Loading the GSC FW is required to allow
the media GT to go into its C6 state and for content protection features
(PXP, HDCP).

The loading happens via a submission to the GSC engine. All subsequent
communication with the FW will also happen via the engine, although no
further messages are implemented as part of this series.

This series also adds the GSC engine flag to the MTL platform, with the
engine being runtime disabled if the FW is not selected, which makes the
FW definition (not included in the series) the ultimate enabler for the
whole GSC block.

Note that just loading the FW is not enough for it to be fully
functional. We'll also need to establish and handle a communication
channel between GSC and CSME (a.k.a. SW proxy). This will require a new
mei component to handle the CSME side of things, so it will be pushed as
a separate series.

v2: Use wq to load the GSC, address minor review comments.

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>

Daniele Ceraolo Spurio (5):
  drm/i915/uc: Introduce GSC FW
  drm/i915/gsc: Skip the version check when fetching the GSC FW
  drm/i915/gsc: GSC firmware loading
  drm/i915/gsc: Do a driver-FLR on unload if GSC was loaded
  drm/i915/mtl: MTL has one GSC CS on the media GT

Jonathan Cavitt (1):
  drm/i915/gsc: Disable GSC engine and power well if FW is not selected

 drivers/gpu/drm/i915/Makefile                |  11 +-
 drivers/gpu/drm/i915/gt/intel_engine.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  18 ++
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   7 +
 drivers/gpu/drm/i915/gt/intel_gt.h           |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c    | 210 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h    |  15 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c    | 137 ++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h    |  47 +++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c        |  23 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h        |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     |  78 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h     |   8 +-
 drivers/gpu/drm/i915/i915_params.c           |   3 +
 drivers/gpu/drm/i915/i915_params.h           |   1 +
 drivers/gpu/drm/i915/i915_pci.c              |   2 +-
 drivers/gpu/drm/i915/i915_reg.h              |   3 +
 drivers/gpu/drm/i915/intel_uncore.c          |  61 ++++++
 drivers/gpu/drm/i915/intel_uncore.h          |  13 ++
 19 files changed, 626 insertions(+), 21 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h

-- 
2.37.3

