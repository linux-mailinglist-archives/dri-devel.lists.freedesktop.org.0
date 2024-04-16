Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 465918A66F9
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 11:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B36E8112B43;
	Tue, 16 Apr 2024 09:20:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BnEwwEso";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C68B3112B3C;
 Tue, 16 Apr 2024 09:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713259240; x=1744795240;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wqwHx2DgMq+qxtiYW2zTmzgBuGc+m/hES+pbVyfkWiA=;
 b=BnEwwEsopd+k1zbIIGbBsfL3uOG+5Je+44vRfz1crm3cWjxS4yjWEmja
 wiiIYnFGhxMMfSNpvUY3qwyRJyv6ivB+nUUfv/6Zf2IWrZW5xJnxvqBtN
 rDiT0WK81EhD2Lkj/XRRjYNcNPnLT0hhr2Yg0XwAHHmSyouVHaJHihiRY
 JWprG95Fb2cWbSgA5ssAJigT65NnWrkxNGgzt+BTs5zm4K4aW9EnQNRkD
 JGGUPMCYF3GbgPert7iFbG36z+J03msmS459DG3FX4GI1wMKRkWuieLqn
 S5p/0ezIOg6GDBpUok3RTEe3ev3mveMRnuSOdO+JoJmhCNDHNbt7EeXqg Q==;
X-CSE-ConnectionGUID: BqIAItEbR0KPTtLXGwCtKg==
X-CSE-MsgGUID: /hXQuM0DSJu8fDKy3s4eEQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11045"; a="8548800"
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; 
   d="scan'208";a="8548800"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:39 -0700
X-CSE-ConnectionGUID: eQ2JX/6VRG+amI8DqjL5OA==
X-CSE-MsgGUID: QKXTnHD3TGWUAVIS2SDv7Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,205,1708416000"; d="scan'208";a="22274759"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 02:20:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@intel.com>
Subject: [REBASE 7/7] drm/edid: make drm_edid_are_equal() more convenient for
 its single user
Date: Tue, 16 Apr 2024 12:20:00 +0300
Message-Id: <1011a285d30babce3aabd8218abb7ece7dcf58a2.1713259151.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713259151.git.jani.nikula@intel.com>
References: <cover.1713259151.git.jani.nikula@intel.com>
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
index 463fbad85d90..513590931cc5 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1820,30 +1820,20 @@ static bool edid_block_is_zero(const void *edid)
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
 
@@ -6936,15 +6926,14 @@ static int _drm_edid_connector_property_update(struct drm_connector *connector,
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

