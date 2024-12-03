Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 148169E21D1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 16:17:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7473C10EA65;
	Tue,  3 Dec 2024 15:17:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hvNYS0S2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C4E510EA64;
 Tue,  3 Dec 2024 15:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733239054; x=1764775054;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=0OopfP+KRDpy6dyV6mcf3NsNvkKjOAClcLnOmrbZ37s=;
 b=hvNYS0S2nYZMj5kV6ohkNzOUg7O1A/JHYjIotoDT4zk0uznzYZmw62pK
 d2js8mvxmAGJbvTg7gca2y6eKpSMQUnd9PZFsZ0XNz5CS/33qpDgLIK++
 Ax7SJku8vz7DHErA0X9SNQuU5acqVU72BIFS/egk2CuVAEIJmtO6O/5AP
 8WvSRKSf1Fk76EECMtZSO3/JmDg2+k567vjTr1jeZ2m+JC4QZ0iZ6lG/4
 g6RXjlUh1svHKOLeRnVDLepdJztRk1aXKRX/0RWjztsav8lTpd/6ZAhyc
 OYMdJB6rtBxXEz02jbCBTrXGeM1dMBKa8Ivf7A+s26rBTj7V4ZTfoNzqw A==;
X-CSE-ConnectionGUID: hfe3wjnrQxarW3wRYeVKFg==
X-CSE-MsgGUID: UyWgkjP2QtGVGPq2VYc4pA==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33708783"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33708783"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:34 -0800
X-CSE-ConnectionGUID: bDUvC+e1SWeoOOLDXud+zQ==
X-CSE-MsgGUID: KffNOO8AR1Gv2au5/EMn4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="97526292"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.135])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 07:17:31 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: jani.nikula@intel.com, imre.deak@intel.com, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v2 3/3] drm/dp: extract drm_dp_dpcd_clear_payload()
Date: Tue,  3 Dec 2024 17:17:10 +0200
Message-Id: <904fa73ea9ea976185062eeb493a08ffc43ed27e.1733238941.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1733238940.git.jani.nikula@intel.com>
References: <cover.1733238940.git.jani.nikula@intel.com>
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

Cc: Lyude Paul <lyude@redhat.com>
Reviewed-by: Imre Deak <imre.deak@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/display/drm_dp_helper.c       | 14 ++++++++++++++
 drivers/gpu/drm/display/drm_dp_mst_topology.c |  2 +-
 include/drm/display/drm_dp_helper.h           |  1 +
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_dp_helper.c b/drivers/gpu/drm/display/drm_dp_helper.c
index 55eca899ce18..da3c8521a7fa 100644
--- a/drivers/gpu/drm/display/drm_dp_helper.c
+++ b/drivers/gpu/drm/display/drm_dp_helper.c
@@ -849,6 +849,20 @@ int drm_dp_dpcd_write_payload(struct drm_dp_aux *aux,
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
  * drm_dp_dpcd_poll_act_handled() - Poll for ACT handled status
  * @aux: DisplayPort AUX channel
diff --git a/drivers/gpu/drm/display/drm_dp_mst_topology.c b/drivers/gpu/drm/display/drm_dp_mst_topology.c
index 8da39b060f13..5d873bb19dc2 100644
--- a/drivers/gpu/drm/display/drm_dp_mst_topology.c
+++ b/drivers/gpu/drm/display/drm_dp_mst_topology.c
@@ -3682,7 +3682,7 @@ int drm_dp_mst_topology_mgr_set_mst(struct drm_dp_mst_topology_mgr *mgr, bool ms
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

