Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 382434F7B4B
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DF7110E77A;
	Thu,  7 Apr 2022 09:15:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5886110E77A;
 Thu,  7 Apr 2022 09:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322911; x=1680858911;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Ok0Ew230q5uGIOJPVdfa/ehnWedVE0i+xeWGSuqTsiE=;
 b=lBl6PcmiNNgVS6kklv0RK/AQx1OShgelrrZK4jH1hhGfp3NWfFpb3pWP
 iaHmbIywI7M1q5tlcThBi2O2W4aYOHfSJPt76Wy8VTCIPyLSVxF+Zx7u5
 jW4Rc6BfoqBUWML0jabDhUl6gNvp8q3X/qBkpbqPfN/03jhxRjI1+Mzn4
 BlfNM8cFPiftLGNXJSMifMNRxi6ynz+99/NkyFi+a9qtxI0e87VfIVPwT
 KM/WYcAe84VI1agtgwZWsjjG1HXfWWbW1CWXcrYY5iYqamKS/dH5y/HMF
 beCpkhX0mvZfoxXTikyjzcRt+3j9TDrlHXdlYW9bH3CnahSgVeZqj8KaJ w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="248795150"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="248795150"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:10 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="658991491"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:08 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] drm/edid: pass struct edid to connector_bad_edid()
Date: Thu,  7 Apr 2022 12:14:31 +0300
Message-Id: <13320766ab44588fa27755619fa3b9dc81e91836.1649322799.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Avoid casting here and there, and make it const.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8638e54e0879..ba54701f91f6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1967,7 +1967,7 @@ drm_do_probe_ddc_edid(void *data, u8 *buf, unsigned int block, size_t len)
 }
 
 static void connector_bad_edid(struct drm_connector *connector,
-			       u8 *edid, int num_blocks)
+			       const struct edid *edid, int num_blocks)
 {
 	int i;
 	u8 last_block;
@@ -1978,22 +1978,19 @@ static void connector_bad_edid(struct drm_connector *connector,
 	 * of 0x7e in the EDID of the _index_ of the last block in the
 	 * combined chunk of memory.
 	 */
-	last_block = edid[0x7e];
+	last_block = edid->extensions;
 
 	/* Calculate real checksum for the last edid extension block data */
 	if (last_block < num_blocks)
 		connector->real_edid_checksum =
-			edid_block_compute_checksum(edid + last_block * EDID_LENGTH);
+			edid_block_compute_checksum(edid + last_block);
 
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
 
 	drm_dbg_kms(connector->dev, "%s: EDID is invalid:\n", connector->name);
-	for (i = 0; i < num_blocks; i++) {
-		u8 *block = edid + i * EDID_LENGTH;
-
-		edid_block_dump(KERN_DEBUG, block, i);
-	}
+	for (i = 0; i < num_blocks; i++)
+		edid_block_dump(KERN_DEBUG, edid + i, i);
 }
 
 /* Get override or firmware EDID */
@@ -2139,7 +2136,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	}
 
 	if (invalid_blocks) {
-		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
+		connector_bad_edid(connector, edid, edid->extensions + 1);
 
 		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
 	}
-- 
2.30.2

