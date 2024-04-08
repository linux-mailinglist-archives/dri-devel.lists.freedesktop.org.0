Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AC8389BB06
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 10:56:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EF01122FE;
	Mon,  8 Apr 2024 08:56:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="nCMu5e0Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C12E5112304;
 Mon,  8 Apr 2024 08:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712566609; x=1744102609;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lXBq1nfGZPGeUC6reR+4rVR0wMMhreGWv4waRh0Cjz8=;
 b=nCMu5e0ZjXCmMvmI2AZoEG6KbCxdIv9gugbg3vxcHY3R2P/CrnF2vp+h
 11MRLIVdHMdfJmsBBWt42uyg8x1XvdbnPu4n4vCWlzyCopKqphgBu2qns
 m8L8LreN0UWlDFqf68ch8mdVIOWS8PBY32vabjIfWqO3+7lsx+m2d87b2
 dDLeXPL8kFSqMuS/eVBj5gyEXQ0DAp5K3eLcZEoRVx3XhXFHEZhm9jVlS
 osfq9bK+lteu1W6791kizmedsfXIVOt0DGP8IpaJygBiyFk2ZrvprRDuC
 vpJegpqlybht9kusqsmP2/aX+Y1AfQx4ORqGlu6x1RMwDehypoJfJpeZm w==;
X-CSE-ConnectionGUID: lC/djkOQRS6hV59jwkP1Yw==
X-CSE-MsgGUID: gpTP/v77QK+Wezea8YaL9g==
X-IronPort-AV: E=McAfee;i="6600,9927,11037"; a="25279207"
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="25279207"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:49 -0700
X-CSE-ConnectionGUID: SgP0SDUqRT+rAhzhkX49kw==
X-CSE-MsgGUID: 6LTNVQSVQxOIgsuDp71I7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,186,1708416000"; d="scan'208";a="19732939"
Received: from bauinger-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.42.71])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 01:56:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com
Subject: [PATCH 7/7] drm/edid: make drm_edid_are_equal() more convenient for
 its single user
Date: Mon,  8 Apr 2024 11:56:08 +0300
Message-Id: <9d12c1aa3fafe19c48b36da863702d8cd7b3668b.1712565984.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1712565984.git.jani.nikula@intel.com>
References: <cover.1712565984.git.jani.nikula@intel.com>
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

Repurpose drm_edid_are_equal() to be more helpful for its single user,
and rename drm_edid_eq(). Functionally deduce the length from the blob
size, not the blob data, making it more robust against any errors.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 41 ++++++++++++++------------------------
 1 file changed, 15 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c11421d43b4b..1d715634a988 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1818,30 +1818,20 @@ static bool edid_block_is_zero(const void *edid)
 	return !memchr_inv(edid, 0, EDID_LENGTH);
 }
 
-/**
- * drm_edid_are_equal - compare two edid blobs.
- * @edid1: pointer to first blob
- * @edid2: pointer to second blob
- * This helper can be used during probing to determine if
- * edid had changed.
- */
-static bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
+static bool drm_edid_eq(const struct drm_edid *drm_edid,
+			const void *raw_edid, size_t raw_edid_size)
 {
-	int edid1_len, edid2_len;
-	bool edid1_present = edid1 != NULL;
-	bool edid2_present = edid2 != NULL;
+	bool edid1_present = drm_edid && drm_edid->edid && drm_edid->size;
+	bool edid2_present = raw_edid && raw_edid_size;
 
 	if (edid1_present != edid2_present)
 		return false;
 
-	if (edid1) {
-		edid1_len = edid_size(edid1);
-		edid2_len = edid_size(edid2);
-
-		if (edid1_len != edid2_len)
+	if (edid1_present) {
+		if (drm_edid->size != raw_edid_size)
 			return false;
 
-		if (memcmp(edid1, edid2, edid1_len))
+		if (memcmp(drm_edid->edid, raw_edid, drm_edid->size))
 			return false;
 	}
 
@@ -6877,15 +6867,14 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
 	int ret;
 
 	if (connector->edid_blob_ptr) {
-		const struct edid *old_edid = connector->edid_blob_ptr->data;
-
-		if (old_edid) {
-			if (!drm_edid_are_equal(drm_edid ? drm_edid->edid : NULL, old_edid)) {
-				connector->epoch_counter++;
-				drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
-					    connector->base.id, connector->name,
-					    connector->epoch_counter);
-			}
+		const void *old_edid = connector->edid_blob_ptr->data;
+		size_t old_edid_size = connector->edid_blob_ptr->length;
+
+		if (old_edid && !drm_edid_eq(drm_edid, old_edid, old_edid_size)) {
+			connector->epoch_counter++;
+			drm_dbg_kms(dev, "[CONNECTOR:%d:%s] EDID changed, epoch counter %llu\n",
+				    connector->base.id, connector->name,
+				    connector->epoch_counter);
 		}
 	}
 
-- 
2.39.2

