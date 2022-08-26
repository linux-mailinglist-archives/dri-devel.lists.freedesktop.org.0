Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 678CC5A3121
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 23:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4B4110E78B;
	Fri, 26 Aug 2022 21:35:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E467110E721;
 Fri, 26 Aug 2022 21:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661549740; x=1693085740;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rB93n2Ea1l4UxNRRSWAKvyQF1xIZBsxiWS36+TpFFVM=;
 b=L87GtEPCFs/oybjSw9wekjy9MBDYgeCB3mYtsDQHYJT9dvPT/3xjvjvk
 Ua3zUlq9h6/uWa2D41m3k0Nnz7DJlnFR6XQzZemQk0f7SjygTNxyNTGux
 9d89X9aqz5fAn8knb0DtSVAFJFwabzCb3eTs1xn0eljykgpfxEO5xB1p5
 OaY+xiVMppUER72ys0Sw1UjiDJrlpWHJxITS3cBgn3D6NTsSQN03L3VgD
 atfxBR+l+0C7oUlniXiYpBPO2N/TVPALKFozI5gc/KtTnu+vnjZJZiowL
 5SrmCKS9D46VPvBM3qUbNN0k/14XdxmCgwOiLqNHcGAcEhAQveIH2aAUZ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10451"; a="295375999"
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="295375999"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Aug 2022 14:35:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,266,1654585200"; d="scan'208";a="714115536"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga002.fm.intel.com with SMTP; 26 Aug 2022 14:35:36 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 00:35:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 10/11] drm/edid: Make version checks less convoluted
Date: Sat, 27 Aug 2022 00:35:00 +0300
Message-Id: <20220826213501.31490-11-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
References: <20220826213501.31490-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Get rid of the confusing version_greater() stuff and
simply compare edid->revision directly everwhere. Half
the places already did it this way, and since we actually
reject any EDID with edid->version!=1 it's a perfectly
sane thing to do.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 ++++++++-----------------
 1 file changed, 8 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0fe06e5fd6e0..e7f46260dfe7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1572,15 +1572,6 @@ struct drm_edid {
 	const struct edid *edid;
 };
 
-static bool version_greater(const struct drm_edid *drm_edid,
-			    u8 version, u8 revision)
-{
-	const struct edid *edid = drm_edid->edid;
-
-	return edid->version > version ||
-		(edid->version == version && edid->revision > revision);
-}
-
 static int edid_hfeeodb_extension_block_count(const struct edid *edid);
 
 static int edid_hfeeodb_block_count(const struct edid *edid)
@@ -3652,7 +3643,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 						  closure->drm_edid,
 						  timing);
 
-	if (!version_greater(closure->drm_edid, 1, 1))
+	if (closure->drm_edid->edid->revision < 2)
 		return; /* GTF not defined yet */
 
 	switch (range->flags) {
@@ -3667,7 +3658,7 @@ do_inferred_modes(const struct detailed_timing *timing, void *c)
 							  timing);
 		break;
 	case DRM_EDID_CVT_SUPPORT_FLAG:
-		if (!version_greater(closure->drm_edid, 1, 3))
+		if (closure->drm_edid->edid->revision < 4)
 			break;
 
 		closure->modes += drm_cvt_modes_for_range(closure->connector,
@@ -3688,7 +3679,7 @@ static int add_inferred_modes(struct drm_connector *connector,
 		.drm_edid = drm_edid,
 	};
 
-	if (version_greater(drm_edid, 1, 0))
+	if (drm_edid->edid->revision >= 1)
 		drm_for_each_detailed_block(drm_edid, do_inferred_modes, &closure);
 
 	return closure.modes;
@@ -3765,7 +3756,7 @@ static int add_established_modes(struct drm_connector *connector,
 		}
 	}
 
-	if (version_greater(drm_edid, 1, 0))
+	if (edid->revision >= 1)
 		drm_for_each_detailed_block(drm_edid, do_established_modes,
 					    &closure);
 
@@ -3820,7 +3811,7 @@ static int add_standard_modes(struct drm_connector *connector,
 		}
 	}
 
-	if (version_greater(drm_edid, 1, 0))
+	if (drm_edid->edid->revision >= 1)
 		drm_for_each_detailed_block(drm_edid, do_standard_modes,
 					    &closure);
 
@@ -3900,7 +3891,7 @@ add_cvt_modes(struct drm_connector *connector, const struct drm_edid *drm_edid)
 		.drm_edid = drm_edid,
 	};
 
-	if (version_greater(drm_edid, 1, 2))
+	if (drm_edid->edid->revision >= 3)
 		drm_for_each_detailed_block(drm_edid, do_cvt_mode, &closure);
 
 	/* XXX should also look for CVT codes in VTB blocks */
@@ -3955,7 +3946,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 		.quirks = quirks,
 	};
 
-	if (version_greater(drm_edid, 1, 3))
+	if (drm_edid->edid->revision >= 4)
 		closure.preferred = true; /* first detailed timing is always preferred */
 	else
 		closure.preferred =
@@ -6144,7 +6135,7 @@ static void drm_get_vrr_range(struct drm_connector *connector,
 		.drm_edid = drm_edid,
 	};
 
-	if (!version_greater(drm_edid, 1, 3))
+	if (drm_edid->edid->revision < 4)
 		return;
 
 	if (!(drm_edid->edid->features & DRM_EDID_FEATURE_CONTINUOUS_FREQ))
-- 
2.35.1

