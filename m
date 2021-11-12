Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4750844E243
	for <lists+dri-devel@lfdr.de>; Fri, 12 Nov 2021 08:10:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9453B6E978;
	Fri, 12 Nov 2021 07:10:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F0466E8E5;
 Fri, 12 Nov 2021 07:10:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10165"; a="219978627"
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800"; d="scan'208";a="219978627"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2021 23:10:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,228,1631602800"; d="scan'208";a="643433172"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by fmsmga001.fm.intel.com with ESMTP; 11 Nov 2021 23:10:40 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc/slpc: Check GuC status before freq boost
Date: Thu, 11 Nov 2021 23:10:16 -0800
Message-Id: <20211112071016.9640-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
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
Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>,
 Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It's possible that i915 might get wedged between a boost
and un-boost. Validate the i915-GuC connection before trying
to send a H2G to change the min frequency.

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/4464

Cc: Ashutosh Dixit <ashutosh.dixit@intel.com>
Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 4e1d3cd29164..22c1c12369f2 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -183,11 +183,15 @@ static int slpc_unset_param(struct intel_guc_slpc *slpc,
 static int slpc_force_min_freq(struct intel_guc_slpc *slpc, u32 freq)
 {
 	struct drm_i915_private *i915 = slpc_to_i915(slpc);
+	struct intel_guc *guc = slpc_to_guc(slpc);
 	intel_wakeref_t wakeref;
 	int ret = 0;
 
 	lockdep_assert_held(&slpc->lock);
 
+	if (!intel_guc_is_ready(guc))
+		return -ENODEV;
+
 	/*
 	 * This function is a little different as compared to
 	 * intel_guc_slpc_set_min_freq(). Softlimit will not be updated
-- 
2.25.0

