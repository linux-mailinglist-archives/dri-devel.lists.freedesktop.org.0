Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF5D4EE0F8
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:46:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B43210F483;
	Thu, 31 Mar 2022 18:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E67410F47F;
 Thu, 31 Mar 2022 18:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752365; x=1680288365;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oNB+rFH2a4nQLOujdW956cFCjgoPEESTeQWyM8nFN7M=;
 b=eLesIu6FjRHyQJf5Xd30/stxk0fQLehETVhLPtGcr6RvAa9wh6+m1VZB
 Ox0aomjvhU/UpzOk/br4BNd5/5aQd67w3vVxCSTLwS1BZ8bveaWAvl/2h
 jfzpDTF+/PrXxbzmdm/vui0wSlxLW7/fTFm8pvka0C23sfQRHSBvMeGN9
 2idQ+dghH9oJTEXiqnDn2a/N7H81M2UtXhUg5Em0g5ddPplOLD9PAI1UJ
 kJS2PqFGefQPfxgbvay0HsAlacM4/nlgOGdim70g+gN5RnbhaqKU73GTJ
 ZzzHsuJTcLp7Y7n8ny0gEE5tCRlUiDIEnGhwNyBWJ4Y20d4zOXqI5hIwU Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="284846399"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="284846399"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:46:04 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="503865326"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:46:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 11/12] drm/edid: track invalid blocks in drm_do_get_edid()
Date: Thu, 31 Mar 2022 21:45:08 +0300
Message-Id: <6215f85b01c579a44c66129d2b5f41e1ab9294de.1648752228.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
References: <cover.1648752228.git.jani.nikula@intel.com>
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

Track invalid blocks instead of valid extensions to minimize impact on
the happy day scenario, and hide the details in the separate function.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 73bb2c4a7014..8bf0ae72fd2c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1824,9 +1824,10 @@ bool drm_edid_is_valid(struct edid *edid)
 EXPORT_SYMBOL(drm_edid_is_valid);
 
 static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
-					       int valid_extensions)
+					       int invalid_blocks)
 {
 	struct edid *new, *dest_block;
+	int valid_extensions = edid->extensions - invalid_blocks;
 	int i;
 
 	new = kmalloc_array(valid_extensions + 1, EDID_LENGTH, GFP_KERNEL);
@@ -2062,7 +2063,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			      size_t len),
 	void *data)
 {
-	int j, valid_extensions = 0;
+	int j, invalid_blocks = 0;
 	struct edid *edid, *new, *override;
 
 	override = drm_get_override_edid(connector);
@@ -2073,12 +2074,10 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (!edid)
 		return NULL;
 
-	/* if there's no extensions or no connector, we're done */
-	valid_extensions = edid->extensions;
-	if (valid_extensions == 0)
+	if (edid->extensions == 0)
 		return edid;
 
-	new = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH, GFP_KERNEL);
+	new = krealloc(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
 	if (!new)
 		goto out;
 	edid = new;
@@ -2095,13 +2094,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		}
 
 		if (try == 4)
-			valid_extensions--;
+			invalid_blocks++;
 	}
 
-	if (valid_extensions != edid->extensions) {
+	if (invalid_blocks) {
 		connector_bad_edid(connector, (u8 *)edid, edid->extensions + 1);
 
-		edid = edid_filter_invalid_blocks(edid, valid_extensions);
+		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
 	}
 
 	return edid;
-- 
2.30.2

