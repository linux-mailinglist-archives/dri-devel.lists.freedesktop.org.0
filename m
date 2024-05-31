Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C16098D6121
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 14:01:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F34310E671;
	Fri, 31 May 2024 12:01:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JUb8fw6w";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FA9B10E5FB;
 Fri, 31 May 2024 12:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717156859; x=1748692859;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lDcs9Jm2G2+qFaU8M6G4gKlFJEEMAh2YAbmNmj2oa6E=;
 b=JUb8fw6wlNcvEbyRPcaxngmwjbvnQH5JKAgtRclbidbdMtO4p2pqsPQs
 tZGWC6PBfs5/AxiJnZfUfLUTBSgbQ+w7l7aAV4lvbjLg7wFLsDkzCjiKR
 x85Ts0nCX1wJiyehYoU07aqW9PxC2IyqSGifI7vTEMxF+QV4WPME6TsJO
 PcL8kPsJHP5CXoeC6XRzD0zwFWh6uGmA9oiSHAYWQHgiZY6SbwORMtUgo
 gqJTfm1HGvi1TjeIBy4YnJpyysEME48RpbAEJ6HvMwnXPN6ur7z3zuZ17
 eahumR1tXL0QdyBvOuXzsi6Pl/dyzOoKF14RM6IROOw4I7SOasATnR0bc g==;
X-CSE-ConnectionGUID: 5Ax9KE1bT06o9ckLpRJp4g==
X-CSE-MsgGUID: b2XJJ1eSRGqrKn2wnvqLRg==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="31223876"
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="31223876"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:00:59 -0700
X-CSE-ConnectionGUID: 7TFy1CyUT6KcBQYl5mWsmw==
X-CSE-MsgGUID: ZU7afWMFS+idfHnOP81gfg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,204,1712646000"; d="scan'208";a="36076213"
Received: from bergbenj-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.190])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2024 05:00:55 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Pan Xinhui <Xinhui.Pan@amd.com>, jani.nikula@intel.com
Subject: [PATCH 3/3] drm/amd/display: switch to guid_gen() to generate valid
 GUIDs
Date: Fri, 31 May 2024 15:00:33 +0300
Message-Id: <4ef8a2a1985599389b89ee5828df029e5e9725d8.1717156602.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1717156601.git.jani.nikula@intel.com>
References: <cover.1717156601.git.jani.nikula@intel.com>
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
index 65ebc01dc90f..a1bd847857b8 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -2403,9 +2403,9 @@ static int dm_late_init(void *handle)
 
 static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
 {
+	u8 buf[UUID_SIZE];
+	guid_t guid;
 	int ret;
-	u8 guid[16];
-	u64 tmp64;
 
 	mutex_lock(&mgr->lock);
 	if (!mgr->mst_primary)
@@ -2426,26 +2426,27 @@ static void resume_mst_branch_status(struct drm_dp_mst_topology_mgr *mgr)
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

