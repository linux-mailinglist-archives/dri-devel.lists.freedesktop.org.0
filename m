Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F4C49B9B0
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jan 2022 18:08:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 697CC10E36F;
	Tue, 25 Jan 2022 17:08:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8597010E2CE;
 Tue, 25 Jan 2022 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643130522; x=1674666522;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=nsu/JQr//oh4VSTEYeX2Ad9CZ+JS4W7tbuGc31KhRF8=;
 b=edM/ly6wDt/RUGZC9IQ1PZijrmzqfBVLQVRVIXb5wX+oOIphYSZzuwPN
 Xb72jLl5AQY5lbVwXuJG1jEGFxR/UbonuUB6H6ElY9Qx1ppoUI4DjsAP0
 Paq/yfATeIeNduU9FreV6Zt66rVaWa+FNfAAisZPxHkg1ePRdWR96jVQ9
 qMBhpJ4PSVdJ7fZzYYrWfaQ+3LhHldUelo7n2/BOMdm4yWoaUE49NPGjA
 RMRe6zR4Nu2zXZM6KSetSP7o+uyGtdMgygCPSQ3AjcgxnlbQymef94LE0
 1GMmhwPQRoPntUGgn66tXFcanT7kNQcHVEQ3FSkIgddFwTOZ1eQ36BIlu w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10237"; a="245185412"
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="245185412"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:07 -0800
X-IronPort-AV: E=Sophos;i="5.88,315,1635231600"; d="scan'208";a="534809960"
Received: from skirillo-mobl1.ccr.corp.intel.com (HELO localhost)
 ([10.252.32.77])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jan 2022 09:04:02 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] drm/dp, drm/i915: 128b/132b updates
Date: Tue, 25 Jan 2022 19:03:38 +0200
Message-Id: <cover.1643130139.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, uma.shankar@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

128b/132b updates to reflect DP 2.0 errata changes, plus some other DP
updates.

Jani Nikula (8):
  drm/dp: add drm_dp_128b132b_read_aux_rd_interval()
  drm/dp: add 128b/132b link status helpers from DP 2.0 E11
  drm/dp: add some new DPCD macros from DP 2.0 E11
  drm/i915/dp: move intel_dp_prepare_link_train() call
  drm/i915/dp: rewrite DP 2.0 128b/132b link training based on errata
  drm/i915/dp: add 128b/132b support to link status checks
  drm/i915/dp: give more time for CDS
  drm/i915/mst: update slot information for 128b/132b

 drivers/gpu/drm/dp/drm_dp.c                   |  83 ++++++
 drivers/gpu/drm/i915/display/intel_dp.c       |  39 ++-
 .../drm/i915/display/intel_dp_link_training.c | 262 +++++++++++++++++-
 .../drm/i915/display/intel_dp_link_training.h |   4 +
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |  29 +-
 include/drm/dp/drm_dp_helper.h                |  24 +-
 6 files changed, 420 insertions(+), 21 deletions(-)

-- 
2.30.2

