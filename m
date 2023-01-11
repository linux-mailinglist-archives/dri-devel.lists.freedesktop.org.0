Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5BD6650C4
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 01:57:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F4610E6C3;
	Wed, 11 Jan 2023 00:57:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8086C10E065;
 Wed, 11 Jan 2023 00:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1673398610; x=1704934610;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=uucyHCL4IQO4y0w+TroMjka64wmO4UCyI95kJ5j6FKg=;
 b=T35NaNeMpxaIAl7xnP/eOYnMCxb+GgXsOVHJMbpdAmJkbPqmKq4GhilD
 cG+aDTlLUxS8KQDolh5f4Wd73kFM7QO2JtzDYDqmdslKt2o57bEHS0YXk
 B68i/HFI+FJsWVJ2MVTNMP3QEkHV2cJjsduDc8m4ogK6hlXU9lLcXe+zq
 cni86/ig05ptVp8vVC0l1lbN/4V2BRejJpY+48b0MApWMh4XrInfemTjt
 bI9TALcLaOqE5ux4rf/VjbbZL+GI05wHF4vkqdmaBVYzNW8s4ojyyohI5
 pCENJYeHi+iyciWbZePNb7IPJOjiwM5LFKMi3dyQYrZEBIpuSN+YPlMER Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="325307075"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="325307075"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jan 2023 16:56:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10586"; a="831175633"
X-IronPort-AV: E=Sophos;i="5.96,315,1665471600"; d="scan'208";a="831175633"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga005.jf.intel.com with ESMTP; 10 Jan 2023 16:56:49 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/9] drm/i915/pxp: Add MTL PXP Support
Date: Tue, 10 Jan 2023 16:56:30 -0800
Message-Id: <20230111005642.300761-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
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
Cc: Juston Li <justonli@chromium.org>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series enables PXP on MTL. On ADL/TGL platforms, we rely on
the mei driver via the i915-mei PXP component interface to establish
a connection to the security firmware via the HECI device interface.
That interface is used to create and teardown the PXP ARB session.
PXP ARB session is created when protected contexts are created.

In this series, the front end behaviors and interfaces (uapi) remain
the same. We add backend support for MTL but with MTL we directly use
the GSC-CS engine on the MTL GPU device to send messages to the PXP
(a.k.a. GSC a.k.a graphics-security) firmware. With MTL, the format
of the message is slightly different with a 2-layer packetization
that is explained in detail in Patch #4. Also, the second layer
which is the actual PXP firmware packet is now rev'd to version 4.3
for MTL that is defined in Patch #6.

Alan Previn (9):
  drm/i915/pxp: Add MTL PXP GSC-CS back-end skeleton
  drm/i915/pxp: Add GSC-CS back-end resource init and cleanup
  drm/i915/pxp: Add MTL hw-plumbing enabling for KCR operation
  drm/i915/pxp: Add MTL helpers to submit Heci-Cmd-Packet to GSC
  drm/i915/pxp: Add GSC-CS backend to send GSC fw messages
  drm/i915/pxp: Add ARB session creation with new PXP API Ver4.3
  drm/i915/pxp: MTL-KCR interrupt ctrl's are in GT-0
  drm/i915/pxp: On MTL, KCR enabling doesn't wait on tee component
  drm/i915/pxp: Enable PXP with MTL-GSC-CS

 drivers/gpu/drm/i915/Makefile                 |   2 +
 drivers/gpu/drm/i915/gt/intel_gpu_commands.h  |   2 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |   3 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 128 ++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  74 ++++
 drivers/gpu/drm/i915/i915_pci.c               |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  92 ++++-
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |   4 +-
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  27 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_debugfs.c  |   2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    | 379 ++++++++++++++++++
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    |  18 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.c      |  23 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_pm.c       |  10 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h     |  26 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |  37 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      |  13 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |  11 +
 19 files changed, 804 insertions(+), 56 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_regs.h


base-commit: cc44a1e87ea6b788868878295119398966f98a81
-- 
2.39.0

