Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D68B48083A
	for <lists+dri-devel@lfdr.de>; Tue, 28 Dec 2021 11:11:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A709310E18F;
	Tue, 28 Dec 2021 10:10:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3B3C10E18F
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Dec 2021 10:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1640686257; x=1672222257;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvGPUKmcaKi/6QqV3VTsFm+BnJ0Xt2B1mxa3E/obEmA=;
 b=eygz8qHNlPeE5IZMh+42l4nbsB03mPs1xpfMQTzEJWckb007L2Te7v85
 txZhuhiV6+1QlZVb62pLjxAUOiGtHR5Yo+SeGNeqzOS5LZ0XUuYyRXLYb
 VxAewB+7SpmzZpF6wRtntXurv1Ncje/RUhHAgRcX8XGCV3gjx8H3zSVmO
 /SKrN0xoN7UcUdZAjZwCXoUVl/7P8UVHWZqA4BBHljlUL64ijEbhnQM49
 LJOtfbzC442qqgNdcNq1rxpXB4ZZytaowN4LyBh7UF9EQDaRxqS/r1iTJ
 cJT0ebUlq+Fm1UylsCIFO95E8Y7v3XCor0Mz42zHGEEXLYpT91J7jXf4j g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10210"; a="241147681"
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="241147681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 02:10:57 -0800
X-IronPort-AV: E=Sophos;i="5.88,242,1635231600"; d="scan'208";a="618709652"
Received: from bbrady-mobl4.ger.corp.intel.com (HELO localhost)
 ([10.252.10.48])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Dec 2021 02:10:55 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Philipp Zabel <philipp.zabel@gmail.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: improve non-desktop quirk logging
Date: Tue, 28 Dec 2021 12:10:51 +0200
Message-Id: <20211228101051.317989-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211213184706.5776-1-philipp.zabel@gmail.com>
References: <20211213184706.5776-1-philipp.zabel@gmail.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Jakob Bornecrantz <jakob@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Improve non-desktop quirk logging if the EDID indicates non-desktop. If
both are set, note about redundant quirk. If there's no quirk but the
EDID indicates non-desktop, don't log non-desktop is set to 0.

Cc: Philipp Zabel <philipp.zabel@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..017c8598e84c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5333,17 +5333,13 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 	info->width_mm = edid->width_cm * 10;
 	info->height_mm = edid->height_cm * 10;
 
-	info->non_desktop = !!(quirks & EDID_QUIRK_NON_DESKTOP);
-
 	drm_get_monitor_range(connector, edid);
 
-	DRM_DEBUG_KMS("non_desktop set to %d\n", info->non_desktop);
-
 	if (edid->revision < 3)
-		return quirks;
+		goto out;
 
 	if (!(edid->input & DRM_EDID_INPUT_DIGITAL))
-		return quirks;
+		goto out;
 
 	drm_parse_cea_ext(connector, edid);
 
@@ -5363,7 +5359,7 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 
 	/* Only defined for 1.4 with digital displays */
 	if (edid->revision < 4)
-		return quirks;
+		goto out;
 
 	switch (edid->input & DRM_EDID_DIGITAL_DEPTH_MASK) {
 	case DRM_EDID_DIGITAL_DEPTH_6:
@@ -5401,6 +5397,13 @@ u32 drm_add_display_info(struct drm_connector *connector, const struct edid *edi
 
 	drm_update_mso(connector, edid);
 
+out:
+	if (quirks & EDID_QUIRK_NON_DESKTOP) {
+		drm_dbg_kms(connector->dev, "Non-desktop display%s\n",
+			    info->non_desktop ? " (redundant quirk)" : "");
+		info->non_desktop = true;
+	}
+
 	return quirks;
 }
 
-- 
2.30.2

