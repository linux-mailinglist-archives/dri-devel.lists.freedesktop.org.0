Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7016C7A3DCF
	for <lists+dri-devel@lfdr.de>; Sun, 17 Sep 2023 23:19:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66B1A10E102;
	Sun, 17 Sep 2023 21:19:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AF5710E102;
 Sun, 17 Sep 2023 21:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694985577; x=1726521577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2SkqyqxyrBl0WpxBD5/sSA3jqfuMpbrEe5bfVY0JinY=;
 b=e1A7KSMU56UoUluxeWnLuk4PmWds9WL6HhFSILrxkqk1V1GUY+V3XSPa
 9kOvOoytuV6+9RGUAz1dXa7az4/3bvrZsOZXLVDhgxDQKF7YtZtxcUk4L
 uX57uoHnTp+Jo7illaiXjkBigY77iJ6hs+FOGXabOqqGyEp/CF0+NO1OP
 EtFBpipmf5uZsXu16OUOScKb1IUYQSeuMSJzdN2uUaI6SxYDZ9YAmMX89
 U31/OyQKZ1xFkHYAbBjCPjqxCO5VM+0rkmTdhLDFK5vj0Bq50GPREt55W
 fHM8gsdVLMW2D8zMeRdBVFVlUrxqRr7h+8jfhuiLjagGFNfvCV+Ixml7o w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="410487904"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="410487904"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2023 14:19:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10836"; a="860825084"
X-IronPort-AV: E=Sophos;i="6.02,155,1688454000"; d="scan'208";a="860825084"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga002.fm.intel.com with ESMTP; 17 Sep 2023 14:19:36 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 0/3] drm/i915/pxp/mtl: Update gsc-heci cmd submission to
 align with fw/hw spec
Date: Sun, 17 Sep 2023 14:19:30 -0700
Message-Id: <20230917211933.1407559-1-alan.previn.teres.alexis@intel.com>
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
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, update the GSC-HECI packet size and the max firmware
response timeout to match internal fw specs. Enforce setting
run-alone bit in LRC for protected contexts.

Changes from prio revs:
   v6: - fix build error with PXP config (Alan)
   v5: - PAGE_ALIGN typo fix (Alan).
       - Use macro for runalone bit (Vivaik)
       - Spec alignment with system overhead,
         increase fw timeout to 500ms (Alan)
   v4: - PAGE_ALIGN the max heci packet size (Alan).
   v3: - Patch #1. Only start counting the request completion
         timeout from after the request has started (Daniele).
   v2: - Patch #3: fix sparse warning reported by kernel test robot.
   v1: - N/A (Re-test)

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>

Alan Previn (3):
  drm/i915/pxp/mtl: Update pxp-firmware response timeout
  drm/i915/pxp/mtl: Update pxp-firmware packet size
  drm/i915/lrc: User PXP contexts requires runalone bit in lrc

 drivers/gpu/drm/i915/gt/intel_engine_regs.h   |  1 +
 drivers/gpu/drm/i915/gt/intel_lrc.c           | 23 +++++++++++++++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 20 ++++++++++++++--
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  6 +++++
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c    |  2 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 10 ++++----
 7 files changed, 55 insertions(+), 11 deletions(-)


base-commit: dc4cd6e4e53d46211952fe7c0e408fce3e212993
-- 
2.39.0

