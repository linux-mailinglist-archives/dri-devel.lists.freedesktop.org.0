Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 783DA9D143A
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 16:15:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C73110E50C;
	Mon, 18 Nov 2024 15:15:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bwtR0dM6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D9A310E4F8;
 Mon, 18 Nov 2024 15:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731942918; x=1763478918;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ysZ2rAgNl94Jr8/IgUF/XGU6I1i4iCrbTSjsYJD+Qi0=;
 b=bwtR0dM6pdIMnBlqFUDTvrUnORqIAnXBPe6Eagr1HIZFeQgD9raXBWwD
 j4JG1U7LDCUEwfb/4bvZUyBaJXEsdAPTk2mFqd8rRG2cS7MLlLHNwCVpN
 8HoehX9BQATTzwAvuxtqhayq8Wps6ftPnZ/j2b0d+ugbxBldpCtp+qmaU
 loO59TPfbs7LsP/a+/N/oDcSVIEfLtPS18HZ1bPlOUDuTliQ1P6UZ2/Wp
 WKWw6Sw2vsU7ROL1mZORhWBt4ZmUcG8yg48kalZZL3Iv24mjiMsA+Ufd5
 4hp9zIUsLbP4+6UlGjr+VXiXztxTWrnTtpVHEq1wo7/xljZRAnILUwZ7Q w==;
X-CSE-ConnectionGUID: rhjuM5GuSO+xuY1OLaWkyw==
X-CSE-MsgGUID: pYiquwUpRgyHrgMRa3JmDQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32139270"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="32139270"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:18 -0800
X-CSE-ConnectionGUID: c0RjT5s2TH6BlJ6CXcg9kQ==
X-CSE-MsgGUID: P4+fSoafRDOnx+fSb+0m6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; d="scan'208";a="89040868"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.148])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2024 07:15:16 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, imre.deak@intel.com
Subject: [PATCH 3/3] drm/dp: extract drm_dp_dpcd_clear_payload()
Date: Mon, 18 Nov 2024 17:14:54 +0200
Message-Id: <a873b0e3c59b92ba447a0f750b17dc21c38a586c.1731942780.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1731942780.git.jani.nikula@intel.com>
References: <cover.1731942780.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

SST with 128b/132b channel coding needs this too. Extract to a separate
helper, independent of MST.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 14 ++++++++++++++
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +-
 include/drm/display/drm_dp_helper.h           |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 0c9230f3f994..9b7f8393440d 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -848,6 +848,20 @@ int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
 }
 EXPORT_SYMBOL(drm_dp_dpcd_write_payload);
 
+/**
+ * drm_dp_dpcd_clear_payload() - Clear the entire VC Payload ID table
+ * @aux: DisplayPort AUX channel
+ *
+ * Clear the entire VC Payload ID table.
+ *
+ * Returns: 0 on success, negative error code on errors.
+ */
+int drm_dp_dpcd_clear_payload(struct drm_dp_aux *aux)
+{
+	return drm_dp_dpcd_write_payload(aux, 0, 0, 0x3f);
+}
+EXPORT_SYMBOL(drm_dp_dpcd_clear_payload);
+
 /**
  * drm_dp_dpcd_poll_act_handled() - Polls for ACT handled status.
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index a426d13a7a36..307ce0981e2c 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3679,7 +3679,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
 			goto out_unlock;
 
 		/* Write reset payload */
-		drm_dp_dpcd_write_payload(mgr->aux, 0, 0, 0x3f);
+		drm_dp_dpcd_clear_payload(mgr->aux);
 
 		drm_dp_mst_queue_probe_work(mgr);
 
diff --git a/include/drm/display/drm_dp_helper.h b/include/drm/display/drm_dp_helper.h
index 69793815aa82..8f4054a56039 100644
--- a/include/drm/display/drm_dp_helper.h
+++ b/include/drm/display/drm_dp_helper.h
@@ -569,6 +569,7 @@ int drm_dp_dpcd_read_phy_link_status(struct drm_dp_aux *aux,
 
 int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
 			      int vcpid, u8 start_time_slot, u8 time_slot_count);
+int drm_dp_dpcd_clear_payload(struct drm_dp_aux *aux);
 int drm_dp_dpcd_poll_act_handled(struct drm_dp_aux *aux, int timeout_ms);
 
 bool drm_dp_send_real_edid_checksum(struct drm_dp_aux *aux,
-- 
2.39.5

