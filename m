Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A9D94FBE13
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:01:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95D7510F2BA;
	Mon, 11 Apr 2022 14:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F30310F299;
 Mon, 11 Apr 2022 14:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685676; x=1681221676;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jabrUGXuKhZTX0fUStcWz547nRNVXCV/fPdQAGmQDRM=;
 b=LVCcECof7fwOSY5s0JnXR0HsTuygk/jGszWIHfbiXnGu0x84Nwyvso56
 P+kvj/jP69NUqAeNvjLSg/Ekw1DxBRVrKw8HXhRyiHYYxEc82fOAyZ+AU
 5n6OvmJeS5I2e/lK/wH73+OYXiAd2fMlPg/n+eSt2sYvgAKv7ZWGtP+Xi
 4xUTvec2dod4DCGE+1tDdzqHjTOduurDZlJnFKrJu7KKf3DS4i6dgHt1Z
 ZEZvZww/+ZMqOyFs0XH+adp/JT8GQzS+lnznqDs2MRw1MamSNzeiBGh6T
 TR2oHQFwflRc59Lk1fgd03FuB0Eo48HKb9ukdFdOtPec9YvVba+BJ+n6O g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="322565661"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="322565661"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551151277"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:01:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 06/12] drm/edid: add typedef for block read function
Date: Mon, 11 Apr 2022 17:00:29 +0300
Message-Id: <10b8721bb7ea8c7df1fd0c1d97c5d446905abbf4.1649685475.git.jani.nikula@intel.com>
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

Make the callback a bit easier on the eye.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e1afd6a55a8c..5b450bad018e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2037,10 +2037,11 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 }
 EXPORT_SYMBOL(drm_add_override_edid_modes);
 
+typedef int read_block_fn(void *context, u8 *buf, unsigned int block, size_t len);
+
 static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
-	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-			      size_t len),
-	void *data)
+					       read_block_fn read_block,
+					       void *context)
 {
 	int *null_edid_counter = connector ? &connector->null_edid_counter : NULL;
 	bool *edid_corrupt = connector ? &connector->edid_corrupt : NULL;
@@ -2053,7 +2054,7 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 
 	/* base block fetch */
 	for (try = 0; try < 4; try++) {
-		if (get_edid_block(data, edid, 0, EDID_LENGTH))
+		if (read_block(context, edid, 0, EDID_LENGTH))
 			goto out;
 		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
 			break;
@@ -2097,9 +2098,8 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
  * Return: Pointer to valid EDID or NULL if we couldn't find any.
  */
 struct edid *drm_do_get_edid(struct drm_connector *connector,
-	int (*get_edid_block)(void *data, u8 *buf, unsigned int block,
-			      size_t len),
-	void *data)
+			     read_block_fn read_block,
+			     void *context)
 {
 	int j, invalid_blocks = 0;
 	struct edid *edid, *new, *override;
@@ -2108,7 +2108,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (override)
 		return override;
 
-	edid = drm_do_get_edid_base_block(connector, get_edid_block, data);
+	edid = drm_do_get_edid_base_block(connector, read_block, context);
 	if (!edid)
 		return NULL;
 
@@ -2125,7 +2125,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		int try;
 
 		for (try = 0; try < 4; try++) {
-			if (get_edid_block(data, block, j, EDID_LENGTH))
+			if (read_block(context, block, j, EDID_LENGTH))
 				goto out;
 			if (drm_edid_block_valid(block, j, false, NULL))
 				break;
-- 
2.30.2

