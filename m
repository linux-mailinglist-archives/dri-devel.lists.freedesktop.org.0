Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DBC74FBE12
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:01:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7A10F28E;
	Mon, 11 Apr 2022 14:01:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C1710F28D;
 Mon, 11 Apr 2022 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685668; x=1681221668;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4N7SdD5vrLJmW6Mc38Xu8tuY6dNq4Byj6zyttM9gCCU=;
 b=XRIEUEFc0BGk2JHaDnVNHUKQLRz3KihPK3oStu9v+JvpPCUA1JCg0OeP
 OuculAWbL2txdG8GikK3NffHK7TePvD8cegsRXtXp3CaVJNwwEWnSqhRN
 qdmjH44uhLGNnX479JcLl5nBpJK9u8KQ3X4n18rpS9lhCTTfAK3RnyIml
 tMZa1YCC+snZZCVOLj4j+etmU72s4y3tgcHtq7U7bE/biMa5GpmKOiwo7
 O91tiu5k9g+olCBCFCAYOW1g928lIUvdmm1A3zaYygNgiNLw/MRw0y6I9
 4TaWo5XMSdoPiywFmdhaog68uNDlZR8+KLXFXT5yHwVYQYZH6uEksAMlF A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="325033879"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="325033879"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:07 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="572174987"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:05 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 05/12] drm/edid: pass struct edid to connector_bad_edid()
Date: Mon, 11 Apr 2022 17:00:28 +0300
Message-Id: <4f9fdc961dfd9b36f4649e8ba57d05e43375fc92.1649685475.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649685475.git.jani.nikula@intel.com>
References: <cover.1649685475.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0b8098e34236..e1afd6a55a8c 100644
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

