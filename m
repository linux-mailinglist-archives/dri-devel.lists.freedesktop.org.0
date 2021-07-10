Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48B533C2C70
	for <lists+dri-devel@lfdr.de>; Sat, 10 Jul 2021 03:23:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 593376EAB0;
	Sat, 10 Jul 2021 01:23:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822FE6EAB0;
 Sat, 10 Jul 2021 01:23:40 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10040"; a="206787097"
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="206787097"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jul 2021 18:23:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,228,1620716400"; d="scan'208";a="411439914"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga006.jf.intel.com with ESMTP; 09 Jul 2021 18:23:38 -0700
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/16] drm/i915/guc/slpc: Add get max/min freq hooks
Date: Fri,  9 Jul 2021 18:20:19 -0700
Message-Id: <20210710012026.19705-10-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
References: <20210710012026.19705-1-vinay.belgaumkar@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add helpers to read the min/max frequency being used
by SLPC. This is done by send a h2g command which forces
SLPC to update the shared data struct which can then be
read.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Sundaresan Sujaritha <sujaritha.sundaresan@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c | 58 +++++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h |  2 +
 2 files changed, 60 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
index 19cb26479942..98a283d31734 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.c
@@ -278,6 +278,35 @@ int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val)
 	return ret;
 }
 
+int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val)
+{
+	struct slpc_shared_data *data;
+	intel_wakeref_t wakeref;
+	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
+	int ret = 0;
+
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	/* Force GuC to update task data */
+	if (slpc_read_task_state(slpc)) {
+		DRM_ERROR("Unable to update task data");
+		ret = -EIO;
+		goto done;
+	}
+
+	GEM_BUG_ON(!slpc->vma);
+
+	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
+	data = slpc->vaddr;
+
+	*val = DIV_ROUND_CLOSEST(data->task_state_data.max_unslice_freq *
+				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
+
+done:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	return ret;
+}
+
 /**
  * intel_guc_slpc_min_freq_set() - Set min frequency limit for SLPC.
  * @slpc: pointer to intel_guc_slpc.
@@ -312,6 +341,35 @@ int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val)
 	return ret;
 }
 
+int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val)
+{
+	struct slpc_shared_data *data;
+	intel_wakeref_t wakeref;
+	struct drm_i915_private *i915 = guc_to_gt(slpc_to_guc(slpc))->i915;
+	int ret = 0;
+
+	wakeref = intel_runtime_pm_get(&i915->runtime_pm);
+
+	/* Force GuC to update task data */
+	if (slpc_read_task_state(slpc)) {
+		DRM_ERROR("Unable to update task data");
+		ret = -EIO;
+		goto done;
+	}
+
+	GEM_BUG_ON(!slpc->vma);
+
+	drm_clflush_virt_range(slpc->vaddr, sizeof(struct slpc_shared_data));
+	data = slpc->vaddr;
+
+	*val = DIV_ROUND_CLOSEST(data->task_state_data.min_unslice_freq *
+				GT_FREQUENCY_MULTIPLIER, GEN9_FREQ_SCALER);
+
+done:
+	intel_runtime_pm_put(&i915->runtime_pm, wakeref);
+	return ret;
+}
+
 /*
  * intel_guc_slpc_enable() - Start SLPC
  * @slpc: pointer to intel_guc_slpc.
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
index a473e1ea7c10..2cb830cdacb5 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_slpc.h
@@ -36,5 +36,7 @@ int intel_guc_slpc_enable(struct intel_guc_slpc *slpc);
 void intel_guc_slpc_fini(struct intel_guc_slpc *slpc);
 int intel_guc_slpc_set_max_freq(struct intel_guc_slpc *slpc, u32 val);
 int intel_guc_slpc_set_min_freq(struct intel_guc_slpc *slpc, u32 val);
+int intel_guc_slpc_get_max_freq(struct intel_guc_slpc *slpc, u32 *val);
+int intel_guc_slpc_get_min_freq(struct intel_guc_slpc *slpc, u32 *val);
 
 #endif
-- 
2.25.0

