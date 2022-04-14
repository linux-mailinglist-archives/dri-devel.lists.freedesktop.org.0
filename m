Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58DBE50128A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:08:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C311410FD6B;
	Thu, 14 Apr 2022 15:08:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E329310FD49;
 Thu, 14 Apr 2022 15:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948935; x=1681484935;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PSmCGpI4V2XUEzVPKSZ/AeQaowaL4fYKgovF4licUd0=;
 b=SCFtQUk9Vqgga9yOk9fzsMzt/o0b3bkLCW2m3jrOwnLp1kBMGG2CfskM
 BVEqSqVEKgqDAxb4cfhKXKYoGAG/fdqJKHYsO4Et2AGpkPV2qqKi9F9uR
 mJzoeuBL6MZGqFFkAIJen0UPXSwQeWbX91A3Nvl0WvHB2X/7DOXLEN05V
 IM+YhVU7gZw800QABtXgJgHZejVOVfBVj4hXVPlJaauIIQwHF3aflS901
 hG9n0lGaci6QAjbcNYdM9vij6FT5wu6p0G74ML8Quwk3pZXKjAG1HMjuZ
 wn9bvxt+MsXkr5xeu/Lhn/6D3eW8MxEUlhtn1Ms774MG85dc68RFDvT9D A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="288007217"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="288007217"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:54 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="612365657"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:08:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 19/19] drm/edid: sunset drm_find_cea_extension()
Date: Thu, 14 Apr 2022 18:07:02 +0300
Message-Id: <f1ed69ad142d6dcf26d8715de4ea8a6e97a9484d.1649948563.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649948562.git.jani.nikula@intel.com>
References: <cover.1649948562.git.jani.nikula@intel.com>
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

Convert drm_find_cea_extension() to a predicate function to check if the
EDID has a CTA extension or a DisplayID CTA data block. This is mainly
to avoid adding new users that only find the first CTA extension.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ccd7d075eeb8..4eeea4212f3a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3582,30 +3582,29 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+/* Return true if the EDID has a CTA extension or a DisplayID CTA data block */
+static bool drm_edid_has_cta_extension(const struct edid *edid)
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
@@ -3878,8 +3877,8 @@ add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid
 	LIST_HEAD(list);
 	int modes = 0;
 
-	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	/* Don't add CTA modes if the CTA extension block is missing */
+	if (!drm_edid_has_cta_extension(edid))
 		return 0;
 
 	/*
-- 
2.30.2

