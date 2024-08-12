Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AAB794ECDF
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 14:23:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A132A10E1D6;
	Mon, 12 Aug 2024 12:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hkSjk2/e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 89D6610E1D6;
 Mon, 12 Aug 2024 12:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723465409; x=1755001409;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aVHvjTpIssJ72L5NxqjtS65+lURA4xTmrt9kjaVuFYA=;
 b=hkSjk2/eNBAB4G/QsTzOjuRbTCwVO1EMcsLa7ATbSfltOiNoGFAq7gej
 gaKgSpB4rk2QXBZJyao2FppaVKl8JNbpc6Ve+5W+I8pu2YUS3d7kPS53C
 kVtWRN3UdQWVmQfTovZMgFj19fm9ONO1vdCPrEnLqR38qM0B2ss/dEfIT
 Ed/vdV4nllo8WD4GtDe9X6W+mhQPdsztESRPyMgU0E2UbRLtrnoNWbZBh
 DZa27o5e0PMurVJM4xYs+WHeT//+yZd3Rsdouc1bgEDzmRpUN+aG42t2q
 IritOXHAuMDlYXOyU+ZKxWZ2im6rMlFunLT9K6KpKJkFfFv4yuude/rw+ g==;
X-CSE-ConnectionGUID: ZQ6s4q+uTkKy8i04oU+NnQ==
X-CSE-MsgGUID: XrAGSO4/T6OZ7L3TqljlSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="44088451"
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="44088451"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:23:29 -0700
X-CSE-ConnectionGUID: YmXPjcMSQsGYp0aaKwy4Ew==
X-CSE-MsgGUID: b7+/tf5lQgCvNAD3u4lPzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,282,1716274800"; d="scan'208";a="58326985"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 05:23:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	jani.nikula@intel.com
Subject: [RESEND 3/3] drm/amd/display: switch to guid_gen() to generate valid
 GUIDs
Date: Mon, 12 Aug 2024 15:23:12 +0300
Message-Id: <20240812122312.1567046-3-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240812122312.1567046-1-jani.nikula@intel.com>
References: <20240812122312.1567046-1-jani.nikula@intel.com>
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

Instead of just smashing jiffies into a GUID, use guid_gen() to generate
RFC 4122 compliant GUIDs.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Side note, it baffles me why amdgpu has a copy of this instead of
plumbing it into drm mst code.
---
 .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 72c10fc2c890..ce05e7e2a383 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2568,9 +2568,9 @@ static int dm_late_init(void *handle)
 
 static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
 {
+	u8 buf[UUID_SIZE];
+	guid_t guid;
 	int ret;
-	u8 guid[16];
-	u64 tmp64;
 
 	mutex_lock(&mgr->lock);
 	if (!mgr->mst_primary)
@@ -2591,26 +2591,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
 	}
 
 	/* Some hubs forget their guids after they resume */
-	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, guid, 16);
-	if (ret != 16) {
+	ret = drm_dp_dpcd_read(mgr->aux, DP_GUID, buf, sizeof(buf));
+	if (ret != sizeof(buf)) {
 		drm_dbg_kms(mgr->dev, "dpcd read failed - undocked during suspend?\n");
 		goto out_fail;
 	}
 
-	if (memchr_inv(guid, 0, 16) == NULL) {
-		tmp64 = get_jiffies_64();
-		memcpy(&guid[0], &tmp64, sizeof(u64));
-		memcpy(&guid[8], &tmp64, sizeof(u64));
+	import_guid(&guid, buf);
 
-		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, guid, 16);
+	if (guid_is_null(&guid)) {
+		guid_gen(&guid);
+		export_guid(buf, &guid);
 
-		if (ret != 16) {
+		ret = drm_dp_dpcd_write(mgr->aux, DP_GUID, buf, sizeof(buf));
+
+		if (ret != sizeof(buf)) {
 			drm_dbg_kms(mgr->dev, "check mstb guid failed - undocked during suspend?\n");
 			goto out_fail;
 		}
 	}
 
-	import_guid(&mgr->mst_primary->guid, guid);
+	guid_copy(&mgr->mst_primary->guid, &guid);
 
 out_fail:
 	mutex_unlock(&mgr->lock);
-- 
2.39.2

