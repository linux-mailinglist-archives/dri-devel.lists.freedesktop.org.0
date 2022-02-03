Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0D064A80D9
	for <lists+dri-devel@lfdr.de>; Thu,  3 Feb 2022 10:04:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C51A10E9AE;
	Thu,  3 Feb 2022 09:04:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1395C10E99E;
 Thu,  3 Feb 2022 09:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643879046; x=1675415046;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dhtsGwxWDEANKIGYwl8mov6HRNRYlU++DrHNB80zS+E=;
 b=Nt+nk/pqaBwBdDaF9bSET09OOjMMWJp2noVdeqTuGH4q8JRdRupPyoMR
 yCmcZ9lNOSqs0BqAmmpb4+uO2G3Z20yTPuH6RBgVECsXiegAnbgmdf9To
 u/WjXYa/E5OrzEaQS/ZF26cjYxC6cMeTUZBbiUXmon66EX5+Vbz5ha0Q3
 6cvhgLULIbtmhHBbrrVJMx7UOT/P14+BdLj8e8x61WbaXYfTT9mgG+/NL
 v10xDocx88wMCYW3/BLFx5MKNTyIg50663J4H2GmpzwtBJFKZk2oXmmkc
 QEey6ib4urxNS2BD7PkaAsn4KHP4C033GF4IsUxw/kEtFYrY0m6NMbMgv g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10246"; a="235504692"
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="235504692"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:05 -0800
X-IronPort-AV: E=Sophos;i="5.88,339,1635231600"; d="scan'208";a="771723941"
Received: from cbrady-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.6.65])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2022 01:04:03 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm/dp, drm/i915: 128b/132b updates
Date: Thu,  3 Feb 2022 11:03:49 +0200
Message-Id: <cover.1643878928.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

v2 of https://patchwork.freedesktop.org/series/99324/

BR,
Jani.

Jani Nikula (8):
  drm/dp: add drm_dp_128b132b_read_aux_rd_interval()
  drm/dp: add 128b/132b link status helpers from DP 2.0 E11
  drm/dp: add some new DPCD macros from DP 2.0 E11
  drm/i915/dp: move intel_dp_prepare_link_train() call
  drm/i915/dp: rewrite DP 2.0 128b/132b link training based on errata
  drm/i915/dp: add 128b/132b support to link status checks
  drm/i915/mst: update slot information for 128b/132b
  HACK: drm/i915/dp: give more time for CDS

 drivers/gpu/drm/dp/drm_dp.c                   |  83 +++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  39 ++-
 .../drm/i915/display/intel_dp_link_training.c | 288 +++++++++++++++++-
 .../drm/i915/display/intel_dp_link_training.h |   4 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  29 +-
 include/drm/dp/drm_dp_helper.h                |  24 +-
 6 files changed, 446 insertions(+), 21 deletions(-)

-- 
2.30.2

