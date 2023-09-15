Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 297EE7A2579
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:20:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47BB10E669;
	Fri, 15 Sep 2023 18:20:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44F3D10E669;
 Fri, 15 Sep 2023 18:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694802037; x=1726338037;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=STKguHkp6y044N/8efM43FRY1CREuNzhIblM0QvP9Tk=;
 b=Htphn8Ip4GrfRvyLWwPG59auAHh/PgUveItch5yfx/9wanfs/B3oE0Tk
 0Cn0Bkh2NAPIz47T31mouzS6eCzWv/LbXGpCpo+Xi5uU/ZkXXUI0AMsxm
 DFbzQ939ukLK7lfp0D6kDA/7hZBGRXY7WPJh60qBPbbuQ6uT+1J95L/CI
 aojeMqLefg0LZvNjoDK7XpiDzfZqI6B2y4bBsTb2T3BUqwxEE0Fu9Swrw
 kd6lqJezeAd3WDHsYZ1syfO/Axq/nVh8GNJ5s9H9mkxF0Dzc1Jx7GL7la
 jbkX302iicVbNVV/7/V8LtU1pE7B8k97M+Qe7MY7yBj6Jtz0j3Zakj+pz g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="378226926"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="378226926"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:20:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="748287588"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="748287588"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga007.fm.intel.com with ESMTP; 15 Sep 2023 11:20:36 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/3] drm/i915/pxp/mtl: Update gsc-heci cmd submission to
 align with fw/hw spec
Date: Fri, 15 Sep 2023 11:20:32 -0700
Message-Id: <20230915182035.1231965-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 10 ++++----
 6 files changed, 54 insertions(+), 10 deletions(-)


base-commit: cf1e91e884bb1113c653e654e9de1754fc1d4488
-- 
2.39.0

