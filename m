Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5AE4FB811
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEDE110FA0F;
	Mon, 11 Apr 2022 09:48:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351D710FA0D;
 Mon, 11 Apr 2022 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670492; x=1681206492;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jabrUGXuKhZTX0fUStcWz547nRNVXCV/fPdQAGmQDRM=;
 b=WmcTZwqo2aPvGxx076dlG1O34P1RUgv8vV4sB3FETCjCoZUV8Nx+b+MD
 kbdKu8L/0Ahj/NuewwEuYzwH+4GTBHMEyvX0c1IR8Fdh4yWk5fKukWRxn
 qHqlGfAKTNYfABtxWU8JU2gn9ZnSC8UMRuTf+YsvmL+vwywetWb8Ysevj
 Dkto2GLCqN5+Z+6lYaO8+qvEFYQXrNnwBXiliC94vBjIZFacHP4Rify1+
 mta2yowKg0cdBID8KD75qdDcKeo6thRlk6Bx8/0NYkoeWrYPeVEsxOcTw
 SW0pTD5bkRG+/pxPdoesTwbwDjWP8vHzHwVwSz2VM8ntifvfx6W5571/e A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="249359715"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="249359715"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:12 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="572053489"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:10 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 06/12] drm/edid: add typedef for block read function
Date: Mon, 11 Apr 2022 12:47:27 +0300
Message-Id: <2282c320bbf3327bfdb2af85d09625b13fd00eb1.1649670305.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649670305.git.jani.nikula@intel.com>
References: <cover.1649670305.git.jani.nikula@intel.com>
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

