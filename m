Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E4A9CBFB76
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:18:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0201810E506;
	Mon, 15 Dec 2025 20:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="OcGtzMhB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57A4110E506;
 Mon, 15 Dec 2025 20:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765829917; x=1797365917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+JD3CqlL97zFsAYMfE0V7de4Hikn2Q+AgS1VY3YPO3k=;
 b=OcGtzMhBLCZ6XQc8moGIxpq3qyRi6aVPcb550vN7opMO+DgcjHQaq+b7
 XmxbfHaLofAM6zayY8ztZocc6kWRn82Pj27N6RP0YhWetvYLyCtgoJCC2
 mR2qUVNNGnKRCULzcibidBvoTjmIwZmveml5v4Jb+n606VXAO8mrylyS7
 c+Mwl5KEDaZjlp6o/GDSMXjDVg+Rouc2cKVhw+AFflpsIth0aQVAABOKw
 csB+WkrPEEGfA/LYE29AMHQc2ITwM0wlGe1E0uDHkmXoZOHllJcqv0yt/
 TzFu5Ext8DblY5QdhR+qHNuXoPFTIFpT01szy5ae5Jbp2Fu1Dkk3/PS9j Q==;
X-CSE-ConnectionGUID: boOc7q1XTjWxQ2et9OQxSQ==
X-CSE-MsgGUID: GDnmK2nWRCyhN46OqTrjjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85154311"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85154311"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 12:18:37 -0800
X-CSE-ConnectionGUID: 6DolgBdsTj+rkt+Mv76bbA==
X-CSE-MsgGUID: LWDn2xFdSGiXHgTErCTftw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228895893"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 12:18:35 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Michal Wajdeczko <michal.wajdeczko@intel.com>
Subject: [CI 4/4] drm/xe/pf: Add handling for MLRC adverse event threshold
Date: Mon, 15 Dec 2025 21:18:04 +0100
Message-ID: <20251215201806.196514-5-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251215201806.196514-1-michal.wajdeczko@intel.com>
References: <20251215201806.196514-1-michal.wajdeczko@intel.com>
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

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Since it is illegal to register a MLRC context when scheduler groups are
enabled, the GuC consider the VF doing so as an adverse event. Like for
other adverse event, there is a threshold for how many times the event
can happen before the GuC throws an error, which we need to add support
for.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
Reviewed-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
---
 drivers/gpu/drm/xe/abi/guc_klvs_abi.h                | 9 +++++++++
 drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
index 265a135e7061..89a4f8c504e6 100644
--- a/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
+++ b/drivers/gpu/drm/xe/abi/guc_klvs_abi.h
@@ -352,6 +352,12 @@ enum  {
  *      :1: NORMAL = schedule VF always, irrespective of whether it has work or not
  *      :2: HIGH = schedule VF in the next time-slice after current active
  *          time-slice completes if it has active work
+ *
+ * _`GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT` : 0x8A0D
+ *      Given that multi-LRC contexts are incompatible with SRIOV scheduler
+ *      groups and cause the latter to be turned off when registered with the
+ *      GuC, this config allows the PF to set a threshold for multi-LRC context
+ *      registrations by VFs to monitor their behavior.
  */
 
 #define GUC_KLV_VF_CFG_GGTT_START_KEY		0x0001
@@ -410,6 +416,9 @@ enum  {
 #define   GUC_SCHED_PRIORITY_NORMAL		1u
 #define   GUC_SCHED_PRIORITY_HIGH		2u
 
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_KEY	0x8a0d
+#define GUC_KLV_VF_CFG_THRESHOLD_MULTI_LRC_COUNT_LEN	1u
+
 /*
  * Workaround keys:
  */
diff --git a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
index 5f84da3d10d3..45ab5a3b5218 100644
--- a/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
+++ b/drivers/gpu/drm/xe/xe_guc_klv_thresholds_set_types.h
@@ -37,6 +37,7 @@
 	define(H2G_STORM, guc_time_us)			\
 	define(IRQ_STORM, irq_time_us)			\
 	define(DOORBELL_STORM, doorbell_time_us)	\
+	define(MULTI_LRC_COUNT, multi_lrc_count, 70, 53)\
 	/* end */
 
 /**
-- 
2.47.1

