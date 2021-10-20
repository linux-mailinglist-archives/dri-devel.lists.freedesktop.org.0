Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38DDF43541D
	for <lists+dri-devel@lfdr.de>; Wed, 20 Oct 2021 21:52:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2262A6E3AC;
	Wed, 20 Oct 2021 19:52:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBEB6E3AC;
 Wed, 20 Oct 2021 19:52:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10143"; a="289715861"
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="289715861"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Oct 2021 12:52:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,167,1631602800"; d="scan'208";a="445056192"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga003.jf.intel.com with ESMTP; 20 Oct 2021 12:52:39 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Subject: [PATCH 1/3] drm/i915/guc/slpc: Define and initialize boost frequency
Date: Wed, 20 Oct 2021 12:52:14 -0700
Message-Id: <20211020195216.36173-2-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
References: <20211020195216.36173-1-vinay.belgaumkar@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Boost frequency is initialized at RP0. Also define num_waiters
which can track the pending boost requests. This is set to 0 when
we enable SLPC.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c       | 10 ++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h |  3 +++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 65a3e7fdb2b2..4a2acb8f2cc7 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -522,6 +522,14 @@ static void slpc_get_rp_values(struct intel_guc_slpc *slpc)
 					GT_FREQUENCY_MULTIPLIER;
 	slpc->min_freq = REG_FIELD_GET(RPN_CAP_MASK, rp_state_cap) *
 					GT_FREQUENCY_MULTIPLIER;
+
+	slpc->boost_freq = slpc->rp0_freq;
+}
+
+static void slpc_reset_waiters(struct intel_guc_slpc *slpc)
+{
+	/* min, max and boost frequencies have all been reset */
+	slpc->num_waiters = 0;
 }
 
 /*
@@ -585,6 +593,8 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc)
 		return ret;
 	}
 
+	slpc_reset_waiters(slpc);
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
index 41d13527666f..558247d1f3ad 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc_types.h
@@ -20,10 +20,13 @@ struct intel_guc_slpc {
 	u32 min_freq;
 	u32 rp0_freq;
 	u32 rp1_freq;
+	u32 boost_freq;
 
 	/* frequency softlimits */
 	u32 min_freq_softlimit;
 	u32 max_freq_softlimit;
+
+	u32 num_waiters;
 };
 
 #endif
-- 
2.25.0

