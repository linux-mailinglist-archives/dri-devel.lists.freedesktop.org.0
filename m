Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9837378C913
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 18:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2B8110E3F7;
	Tue, 29 Aug 2023 15:59:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3E2510E3ED;
 Tue, 29 Aug 2023 15:59:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324751; x=1724860751;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T3vQHOSAHPTdfeM/4aa9QybDRm/IqOzI/j2qZNVaHds=;
 b=H2SsZUgOVWN6xB16H8vq9QyBcv/RCY9PnhLC2HCJqkXfed6x/i5XBc0i
 pkvq5Qr4QOh/EfzNjHhg4gxI42fDilIw5G4mWJ09viip5gpbab2KFMmNN
 VQK3h3sl1kBR7lkh6wwG6bcfYPAc5KlCJYU8PPyOBweCCU1un5/UKAKmR
 EHtgr4wv1MVR1yyv25JrGGacZThtP5TfeZH2sWuLoaOLEUh3eXDPbcR19
 BekQ7jof5MvpLeT2WEzAEit5tQyDkEpjlJdesWKsIKUqokbAQsx2YbbGu
 eLa3Xb4dZIOHuBQXrm0z++EnDE5vBvPctqU7QldaOLrXg2nT12O9rlnZb A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769329"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769329"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688555022"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688555022"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:08 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 13/33] drm: Reset plane color state on pipeline switch request
Date: Tue, 29 Aug 2023 21:34:02 +0530
Message-ID: <20230829160422.1251087-14-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

When a pipeline switch is requested by user, driver resets
blobs for all the hardware blocks to get to clean state. These
are then populated with the new blob id's as programmed by user.
For the already enabled hardware blocks, if the user does not
add entry in the new switch request, the blob id's will remain
NULL eventually resulting in disabling of that hardware block.

Co-developed-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic_uapi.c | 52 ++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 259cd4f5f520..9e0fb36d1f47 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -362,6 +362,38 @@ static s32 __user *get_out_fence_for_connector(struct drm_atomic_state *state,
 	return fence_ptr;
 }
 
+static
+bool color_pipeline_change_requested(struct drm_device *dev,
+				     struct drm_property_blob *plane_cp_set_blob,
+				     uint64_t blob_id)
+{
+	bool is_change_requested = false;
+	struct drm_property_blob *new_blob = NULL;
+	struct drm_color_pipeline *old_cp, *new_cp;
+
+	/*
+	 * User is setting the pipeline for the first time
+	 */
+	if (!plane_cp_set_blob)
+		goto out;
+
+	old_cp = plane_cp_set_blob->data;
+
+	if (blob_id != 0) {
+		new_blob = drm_property_lookup_blob(dev, blob_id);
+		if (!new_blob)
+			goto out;
+
+		new_cp = new_blob->data;
+
+		if (old_cp->num != new_cp->num)
+			is_change_requested = true;
+	}
+	drm_property_blob_put(new_blob);
+out:
+	return is_change_requested;
+}
+
 static int
 drm_atomic_replace_property_blob_from_id(struct drm_device *dev,
 					 struct drm_property_blob **blob,
@@ -727,6 +759,12 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 	} else if (property == plane->scaling_filter_property) {
 		state->scaling_filter = val;
 	} else if (property == plane->set_color_pipeline_prop) {
+		bool cp_change_requested;
+
+		cp_change_requested = color_pipeline_change_requested(dev,
+						state->set_color_pipeline_data,
+						val);
+
 		ret = drm_atomic_replace_property_blob_from_id(dev,
 					&state->set_color_pipeline_data,
 					val,
@@ -736,12 +774,18 @@ static int drm_atomic_plane_set_property(struct drm_plane *plane,
 		if (replaced) {
 			/* Consider actual color parameter change only when
 			 * individual color blobs are replaced. Hence, reset
-			 * the replaced boolean.
+			 * the replaced boolean but first reset all color
+			 * blobs if color pipeline change is requested.
 			 */
+			if (val && cp_change_requested)
+				ret = drm_plane_reset_color_op_blobs(plane,
+								state, &replaced);
 			replaced = false;
-			ret = drm_plane_replace_color_op_blobs(plane, state,
-							       val,
-							       &replaced);
+			if (!ret) {
+				ret = drm_plane_replace_color_op_blobs(plane, state,
+								       val,
+								       &replaced);
+			}
 		}
 
 		state->color_mgmt_changed |= replaced;
-- 
2.38.1

