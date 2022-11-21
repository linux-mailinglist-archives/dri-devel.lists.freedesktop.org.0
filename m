Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32CF7633088
	for <lists+dri-devel@lfdr.de>; Tue, 22 Nov 2022 00:13:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE17410E342;
	Mon, 21 Nov 2022 23:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 938B410E342;
 Mon, 21 Nov 2022 23:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1669072382; x=1700608382;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qW1DA/Siq32AI9LV60F7pQiEJQWc4Kxi8ciTegXP1xU=;
 b=MBR6Evhafiy6Cn8gqirY5w2bXqwGcxx5+Fi576LHo4u40CZ/5YfUKswv
 UFo85uZtmTq4FHdPmVVBWqTI9pG/gRKm4Ls9zBkd2O1PKinkEihpBvFIO
 cm20RJ8JedTAZ9XT4R90k/8mtPIo8pFGolFOz6ymidnpFl2DrgYGGoZ+t
 AzNfPiYTPw7WGq45cq8juINIdBQ0pTDscQfd0twB3eU+YaJZQSDFUSMM/
 a+WqmsgwvBJqSzDZZNnDM7bAjSLqrXgbKPmt6pYu+LQzTgoH6VSVLMyjR
 CtV/2sNnJbjAbWxn947jsRGAJhFyLaiDfyHgwlrFOvBaD7/+7saQznDNM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="315503465"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="315503465"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:12:46 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10538"; a="618993330"
X-IronPort-AV: E=Sophos;i="5.96,182,1665471600"; d="scan'208";a="618993330"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2022 15:12:45 -0800
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/6] drm/i915: Add support for GSC FW loading
Date: Mon, 21 Nov 2022 15:16:11 -0800
Message-Id: <20221121231617.1110329-1-daniele.ceraolospurio@intel.com>
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
further messages are implemented as part of this series. The loading is
currently done serially as part of driver init/resume, but the plan is
to move it to a worker thread in the future to allow non-CP submission
to go through while we wait for GSC FW load to complete. This will be
done once all the pieces required for GSC to fully function are in place
(see further below).

This series also adds the GSC engine flag to the MTL platform, with the
engine being runtime disabled if the FW is not selected, which makes the
FW definition (not included in the series) the ultimate enabler for the
whole GSC block.

Note that just loading the FW is not enough for it to be fully
functional. We'll also need to establish and handle a communication
channel between GSC and CSME (a.k.a. SW proxy). This will require a new
mei component to handle the CSME side of things, so it will be pushed as
a separate series.

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

 drivers/gpu/drm/i915/Makefile                |   4 +-
 drivers/gpu/drm/i915/gem/i915_gem_pm.c       |  14 +-
 drivers/gpu/drm/i915/gt/intel_engine.h       |   2 +
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    |  18 ++
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h |   7 +
 drivers/gpu/drm/i915/gt/intel_gt.c           |  11 ++
 drivers/gpu/drm/i915/gt/intel_gt.h           |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c    | 195 +++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h    |  13 ++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c    | 103 ++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h    |  43 ++++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c        |  32 +++
 drivers/gpu/drm/i915/gt/uc/intel_uc.h        |   5 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     |  74 +++++--
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h     |   8 +-
 drivers/gpu/drm/i915/i915_params.c           |   3 +
 drivers/gpu/drm/i915/i915_params.h           |   1 +
 drivers/gpu/drm/i915/i915_pci.c              |   2 +-
 drivers/gpu/drm/i915/i915_reg.h              |   3 +
 drivers/gpu/drm/i915/intel_uncore.c          |  48 +++++
 drivers/gpu/drm/i915/intel_uncore.h          |  13 ++
 21 files changed, 585 insertions(+), 19 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_fw.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h

-- 
2.37.3

