Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B45B53327D3
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:54:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BAAE36E903;
	Tue,  9 Mar 2021 13:54:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C8A86E902;
 Tue,  9 Mar 2021 13:54:56 +0000 (UTC)
IronPort-SDR: nVdSHGw7gW5+UiUOmmjNBMKBHLKGVh1vfLQMoWae4iR22lJThr1PvLW/z8vhg87djpjIqXjpPd
 b7rJ2Gp1uAdA==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="175842805"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="175842805"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:55 -0800
IronPort-SDR: d6kOvt9EDTzIZE6lZsnPEM+U4HbKWdHjCHqfXv0leKlKWmuESysUDU66gC1KqgUdSD7DKTuFgO
 Unc24HwDxPEw==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="437656492"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:53 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 5/6] drm/edid: use the new displayid iterator for finding CEA
 extension
Date: Tue,  9 Mar 2021 15:54:13 +0200
Message-Id: <8a527f66b856d6c099313046e028a18f9257baa8.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Neatly reduce displayid boilerplate in code. No functional changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++----------------
 1 file changed, 9 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fbaa7d679cb2..4526e2557dca 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3266,35 +3266,28 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 
 static const u8 *drm_find_cea_extension(const struct edid *edid)
 {
-	int length, idx;
 	const struct displayid_block *block;
+	struct displayid_iter iter;
 	const u8 *cea;
-	const u8 *displayid;
-	int ext_index;
+	int ext_index = 0;
 
 	/* Look for a top level CEA extension block */
 	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	ext_index = 0;
 	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
 	if (cea)
 		return cea;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
-	ext_index = 0;
-	for (;;) {
-		displayid = drm_find_displayid_extension(edid, &length, &idx,
-							 &ext_index);
-		if (!displayid)
-			return NULL;
-
-		idx += sizeof(struct displayid_hdr);
-		for_each_displayid_db(displayid, block, idx, length) {
-			if (block->tag == DATA_BLOCK_CTA)
-				return (const u8 *)block;
+	displayid_iter_edid_begin(edid, &iter);
+	displayid_iter_for_each(block, &iter) {
+		if (block->tag == DATA_BLOCK_CTA) {
+			cea = (const u8 *)block;
+			break;
 		}
 	}
+	displayid_iter_end(&iter);
 
-	return NULL;
+	return cea;
 }
 
 static __always_inline const struct drm_display_mode *cea_mode_for_vic(u8 vic)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
