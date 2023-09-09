Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52C08799BED
	for <lists+dri-devel@lfdr.de>; Sun, 10 Sep 2023 00:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87E0310E2B6;
	Sat,  9 Sep 2023 22:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4EA7510E14C;
 Sat,  9 Sep 2023 22:38:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694299131; x=1725835131;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4XVxmMKb64KDczJcUWUtwoxeRn7jZD6DAXEn9wDVHvU=;
 b=Ey36JqVf8foY8gj/FZJwkY/kuVuKwFb3RsLftBgQ5jJTGsJqz/BuhE6B
 43ncDAKtSQ034j7HE2xC+UdHXGhKMen7xgqNuRt433cpG2zAr3QUdKMn+
 dPh38hMAagdou1Y6mLL9oZvEZCUv0Hnmjb/ba0S8vcDHfx40YGKrSi2Bt
 VI/tKTHxjVcr+mxrw9ikQM7TUspNxrS0nnmxvaaS8IOn74Eh1F3kJTCWj
 N6UXul1NKwxWBmRZtdLUki8osnCPY/Ti/iUIpvFzfUEj1eI6QdKlWkgWx
 c6RuKyeLqhsC7IC2TuojlkwkoZqz5zUONtLYyQlkALRHanONB+b7BMLSv A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="377767891"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; d="scan'208";a="377767891"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Sep 2023 15:38:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10827"; a="719532026"
X-IronPort-AV: E=Sophos;i="6.02,240,1688454000"; d="scan'208";a="719532026"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by orsmga006.jf.intel.com with ESMTP; 09 Sep 2023 15:38:49 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/3] drm/i915/pxp/mtl: Update gsc-heci cmd submission to
 align with fw/hw spec
Date: Sat,  9 Sep 2023 15:38:45 -0700
Message-Id: <20230909223848.427849-1-alan.previn.teres.alexis@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For MTL, update the GSC-HECI packet size and the max firmware
response timeout to match internal fw specs. Enforce setting
run-alone bit in LRC for protected contexts.

Changes from prio revs:
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

 drivers/gpu/drm/i915/gt/intel_lrc.c           | 23 +++++++++++++++++++
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c | 20 ++++++++++++++--
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |  6 +++++
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  4 ++--
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.h    | 11 +++++----
 5 files changed, 56 insertions(+), 8 deletions(-)


base-commit: f8d21cb17a99b75862196036bb4bb93ee9637b74
-- 
2.39.0

