Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAD464E488D
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2B7310E5BB;
	Tue, 22 Mar 2022 21:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E906610E5BB;
 Tue, 22 Mar 2022 21:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985351; x=1679521351;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8hIKi79ccuLZ8nZqSaqYgq9+xnpKQSB7LLQJwKuSquI=;
 b=PZaU675OAKLoMxNd793mUTGmePKpt6r7+vVpFhoVdiCc/0tGXCNugeup
 dcwtF0FU2GYFD3XBzqoB863OqTs+9wC97+EGuZDjQtUWn9Ir5Bz5KxsX1
 PA+5sDTxK6y93nW80jP/7Eij4sGnxHGx1CVfQvkrrh1S2pTGxIExeidl1
 4MEccy3onK2PLrxr8CaT2tjxNkR+bLigmiSXTi0yTTDcLLQSYG70uufMi
 ZRkkch3mHj/T375TS6qX2MED3l69mn9U+Ov/zOZQ6VeacMZkWQTHU656f
 Yx+ZFwHCghCilbXENxtO2g+wmKkthI2Owg/28dP0W+OjEA31hZ/Dz1Da8 w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="344385886"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="344385886"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:24 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="717136076"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:42:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 19/19] drm/edid: sunset drm_find_cea_extension()
Date: Tue, 22 Mar 2022 23:40:48 +0200
Message-Id: <091dcecb74a14b2cb618f2fc494fd0b52bf535b2.1647985054.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1647985054.git.jani.nikula@intel.com>
References: <cover.1647985054.git.jani.nikula@intel.com>
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

Convert drm_find_cea_extension() to a predicate function to check if the
EDID has a CEA extension or a DisplayID CTA data block. This is mainly
to avoid adding new users that only find the first CEA extension.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index dfaa21f00941..84314b65b75b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3422,30 +3422,29 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+/* Return true if the EDID has a CEA extension or a DisplayID CTA data block */
+static bool drm_edid_has_cea_extension(const struct edid *edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
-	const u8 *cea;
 	int ext_index = 0;
+	bool found = false;
 
 	/* Look for a top level CEA extension block */
-	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
-	if (cea)
-		return cea;
+	if (drm_find_edid_extension(edid, CEA_EXT, &ext_index))
+		return true;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
 	displayid_iter_edid_begin(edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_CTA) {
-			cea = (const u8 *)block;
+			found = true;
 			break;
 		}
 	}
 	displayid_iter_end(&iter);
 
-	return cea;
+	return found;
 }
 
 static __always_inline const struct drm_display_mode *cea_mode_for_vic(u8 vic)
@@ -3715,7 +3714,7 @@ add_alternate_cea_modes(struct drm_connector *connector, struct edid *edid)
 	int modes = 0;
 
 	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	if (!drm_edid_has_cea_extension(edid))
 		return 0;
 
 	/*
-- 
2.30.2

