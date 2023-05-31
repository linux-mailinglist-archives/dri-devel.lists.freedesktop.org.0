Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A80718F33
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 01:54:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A8BB10E0E7;
	Wed, 31 May 2023 23:54:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FCDD10E0DB;
 Wed, 31 May 2023 23:54:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577265; x=1717113265;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=je+y7zH0d8j7u5ZD/IhYRRQ887pYB1qyvr/a/3WrsCc=;
 b=YIBI90+AFYhZNgo70X8BFdozn9/gHE9dj0LVZ513NTkEM+YTzGMvrbiS
 3YsiYT81DQOPmBOE+MlXEOu980xC1x5XkgyEk/5KzvjUVoZxv25b/FinK
 ywvmxR+OmHVas8p+Guer10/RnqxnxY2lI/vUeZwm8Y3TDkut+bgRuFyP2
 9fLoNGX3Uzaq9A5LvWwMCo9g9WUDfS628+E/O57yxtHxEeQp+QHFGult9
 jEj5smtefV5sypexMbVItkO0PkLkPNb0QdGIV9Ft0fUruc/dDjiwWt6UM
 MpilvovDXCv79Lw6eU5hyBSktpnIGFm97bslYCcA3yrT+NNy3SDRjzu+U A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335747017"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="335747017"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707109897"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="707109897"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:23 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/7] drm/i915: HuC loading and authentication for MTL
Date: Wed, 31 May 2023 16:54:08 -0700
Message-Id: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
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
Cc: Tony Ye <tony.ye@intel.com>, John Harrison <John.C.Harrison@Intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HuC loading and authentication flow is once again changing and a new
"clear-media only" authentication step is introduced. The flow is as
follows:

1) The HuC is loaded via DMA - same as all non-GSC HuC binaries.

2) The HuC is authenticated by the GuC - this is the same step as
performed for all non-GSC HuC binaries and re-uses the same code, but
it is now resulting in a partial authentication that only allows
clear-media workloads.

3) The HuC is fully authenticated for all workloads by the GSC - this
is done via a new PXP command, submitted via the GSCCS.

The advantage of this new flow is that we can start processing
clear-media workloads without having to wait for the GSC to be ready,
which can take several seconds.

As part of this change, the HuC status getparam has been updated with a
new value to indicate a partial authentication. Note tha the media
driver is checking for value > 0 for clear media workloads, so no
changes are required in userspace for that to work.

v2: fix HuC auth status check for DG2.

v3: addrss review feedback, stop using the "meu" tag for the naming of
    the headers, better comments

v4: fix rebase on new PXP code

v5: better comments/logs/defines, fix checkpatch issues

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Acked-by: Tony Ye <tony.ye@intel.com>

Daniele Ceraolo Spurio (7):
  drm/i915/uc: perma-pin firmwares
  drm/i915/huc: Parse the GSC-enabled HuC binary
  drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the fuse says so
  drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
  drm/i915/mtl/huc: auth HuC via GSC
  drm/i915/mtl/huc: Use the media gt for the HuC getparam
  drm/i915/huc: define HuC FW version for MTL

 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
 .../drm/i915/gt/uc/intel_gsc_binary_headers.h |  74 ++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  34 ++-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 224 ++++++++++++-----
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 235 +++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 ++
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 133 +++++-----
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   6 -
 drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
 drivers/gpu/drm/i915/i915_reg.h               |   3 +
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  17 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |   2 +-
 include/uapi/drm/i915_drm.h                   |   3 +-
 21 files changed, 682 insertions(+), 155 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_binary_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h

-- 
2.40.0

