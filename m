Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DCF574EB381
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD02610E5E4;
	Tue, 29 Mar 2022 18:42:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1D1010E4F3;
 Tue, 29 Mar 2022 18:42:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579355; x=1680115355;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3RycmE4ovr1EMVNZ7h6DnLoZWXhNpYoq038PSWS3H6Q=;
 b=ApqLUauJiC6yz2jfL65/DgsftjaYJFP5nSeKxbTzQyyGRuLkI4zs8yBQ
 IU5x+3Zbk2o9Tup75nVWTXuEdAtdqZu1SIHUdarLl+eQlVhfW4HhyjPwI
 aDKgY3TIkrAH1QOaRnj/z53w+tb9zCe2zERpBzvGViZNBrQf+/SERt89W
 WVGvbskWLB3Mnv3eiLAPwMwhRFHLGg+6ChH0CLNJstfbnaT1FEO0Y2tXt
 B/YiFep0Wo/0lzClI0W4o9f5tuxGZs70LI8aL0L/Dbc72wHyFmUWmVvuU
 7YcsBK21a2090Ul7XQUZiJ2t/sNJiNpFEkJNo2wHALC3xB2nYouih6wDk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="259521529"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="259521529"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:35 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="546510268"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/12] drm/edid: clean up EDID block checksum functions
Date: Tue, 29 Mar 2022 21:42:09 +0300
Message-Id: <91f2f89454a3c4220dd2afcea2f7455bfe70ada9.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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

Have two clear functions, one to compute the checksum over the EDID, and
another to get the checksum from the EDID. Throw away the diff function.

Ditch the drm_ prefix for static functions, and accept const void * to
help transition to struct edid * usage.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0650b9217aa2..73f05e0363c0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1597,25 +1597,25 @@ module_param_named(edid_fixup, edid_fixup, int, 0400);
 MODULE_PARM_DESC(edid_fixup,
 		 "Minimum number of valid EDID header bytes (0-8, default 6)");
 
-static int drm_edid_block_checksum(const u8 *raw_edid)
+static int edid_block_compute_checksum(const void *_block)
 {
+	const u8 *block = _block;
 	int i;
 	u8 csum = 0, crc = 0;
 
 	for (i = 0; i < EDID_LENGTH - 1; i++)
-		csum += raw_edid[i];
+		csum += block[i];
 
 	crc = 0x100 - csum;
 
 	return crc;
 }
 
-static bool drm_edid_block_checksum_diff(const u8 *raw_edid, u8 real_checksum)
+static int edid_block_get_checksum(const void *_block)
 {
-	if (raw_edid[EDID_LENGTH - 1] != real_checksum)
-		return true;
-	else
-		return false;
+	const struct edid *block = _block;
+
+	return block->checksum;
 }
 
 static bool drm_edid_is_zero(const u8 *in_edid, int length)
@@ -1704,8 +1704,8 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 		}
 	}
 
-	csum = drm_edid_block_checksum(raw_edid);
-	if (drm_edid_block_checksum_diff(raw_edid, csum)) {
+	csum = edid_block_compute_checksum(raw_edid);
+	if (csum != edid_block_get_checksum(raw_edid)) {
 		if (edid_corrupt)
 			*edid_corrupt = true;
 
@@ -1859,7 +1859,7 @@ static void connector_bad_edid(struct drm_connector *connector,
 	/* Calculate real checksum for the last edid extension block data */
 	if (last_block < num_blocks)
 		connector->real_edid_checksum =
-			drm_edid_block_checksum(edid + last_block * EDID_LENGTH);
+			edid_block_compute_checksum(edid + last_block * EDID_LENGTH);
 
 	if (connector->bad_edid_counter++ && !drm_debug_enabled(DRM_UT_KMS))
 		return;
-- 
2.30.2

