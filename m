Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DFFD4FB821
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9437C10F065;
	Mon, 11 Apr 2022 09:48:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91A5010F384;
 Mon, 11 Apr 2022 09:48:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670522; x=1681206522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=o6z3BsFYU0ylE6xz6pLSnK/qHjbLk/7K+wgGUw/oD6M=;
 b=hIs/a2PJwnOK02haW9+/t1KJzKFSq4R7Vq0g3B36GphUVXVRjaTPQwHs
 vrOfGUETj9OhXHTnWDHtqZwxKH4Hpm67cArJArTBEySVzw38otFh4Nrm0
 O+J6nv1022XLneUTIf4P4FovG92AoCRAZl/+43idcNjZ9Ev5zik8WX08T
 MSczL90I3MpDFv+HqooxrFoDwGlxJhgqHqJ5MkRH3SJeFkQnjsuPrp/jZ
 Ci5pE11dT1ftGX6UgkdXANuwDMvTnleduQeaY9dkOAGh4OwXLIYa0KUTf
 X5Clnt54RPCsN6ul4Rw8mrf9+iErQBk1uAS6VRIQ1lTZ678NOOEZAtyXH Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261822442"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="261822442"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:42 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="659984100"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 12/12] drm/edid: add EDID block count and size helpers
Date: Mon, 11 Apr 2022 12:47:33 +0300
Message-Id: <44265d5a3f64e9d7ad9984fee766f68d0b8bd473.1649670305.git.jani.nikula@intel.com>
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

Add some helpers to figure out the EDID extension block count, block
count, size, pointers to blocks.

Unfortunately, we'll need to cast away the const in a few places where
we actually need to access the data.

v2: fix s/j/i/ introduced in a rebase

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 80 +++++++++++++++++++++++++++-----------
 1 file changed, 57 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0933a5c44998..c8148e5b9969 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1568,6 +1568,38 @@ static const struct drm_display_mode edid_4k_modes[] = {
 
 /*** DDC fetch and block validation ***/
 
+static int edid_extension_block_count(const struct edid *edid)
+{
+	return edid->extensions;
+}
+
+static int edid_block_count(const struct edid *edid)
+{
+	return edid_extension_block_count(edid) + 1;
+}
+
+static int edid_size_by_blocks(int num_blocks)
+{
+	return num_blocks * EDID_LENGTH;
+}
+
+static int edid_size(const struct edid *edid)
+{
+	return edid_size_by_blocks(edid_block_count(edid));
+}
+
+static const void *edid_block_data(const struct edid *edid, int index)
+{
+	BUILD_BUG_ON(sizeof(*edid) != EDID_LENGTH);
+
+	return edid + index;
+}
+
+static const void *edid_extension_block_data(const struct edid *edid, int index)
+{
+	return edid_block_data(edid, index + 1);
+}
+
 static const u8 edid_header[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
 };
@@ -1654,8 +1686,8 @@ bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
 		return false;
 
 	if (edid1) {
-		edid1_len = EDID_LENGTH * (1 + edid1->extensions);
-		edid2_len = EDID_LENGTH * (1 + edid2->extensions);
+		edid1_len = edid_size(edid1);
+		edid2_len = edid_size(edid2);
 
 		if (edid1_len != edid2_len)
 			return false;
@@ -1865,14 +1897,16 @@ EXPORT_SYMBOL(drm_edid_block_valid);
 bool drm_edid_is_valid(struct edid *edid)
 {
 	int i;
-	u8 *raw = (u8 *)edid;
 
 	if (!edid)
 		return false;
 
-	for (i = 0; i <= edid->extensions; i++)
-		if (!drm_edid_block_valid(raw + i * EDID_LENGTH, i, true, NULL))
+	for (i = 0; i < edid_block_count(edid); i++) {
+		void *block = (void *)edid_block_data(edid, i);
+
+		if (!drm_edid_block_valid(block, i, true, NULL))
 			return false;
+	}
 
 	return true;
 }
@@ -1885,13 +1919,13 @@ static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
 	int valid_extensions = edid->extensions - invalid_blocks;
 	int i;
 
-	new = kmalloc_array(valid_extensions + 1, EDID_LENGTH, GFP_KERNEL);
+	new = kmalloc(edid_size_by_blocks(valid_extensions + 1), GFP_KERNEL);
 	if (!new)
 		goto out;
 
 	dest_block = new;
-	for (i = 0; i <= edid->extensions; i++) {
-		const void *block = edid + i;
+	for (i = 0; i < edid_block_count(edid); i++) {
+		const void *block = edid_block_data(edid, i);
 
 		if (edid_block_valid(block, i == 0))
 			memcpy(dest_block++, block, EDID_LENGTH);
@@ -2101,7 +2135,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 			     void *context)
 {
 	enum edid_block_status status;
-	int j, invalid_blocks = 0;
+	int i, invalid_blocks = 0;
 	struct edid *edid, *new;
 
 	edid = drm_get_override_edid(connector);
@@ -2133,20 +2167,20 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		goto fail;
 	}
 
-	if (edid->extensions == 0)
+	if (!edid_extension_block_count(edid) == 0)
 		goto ok;
 
-	new = krealloc(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
+	new = krealloc(edid, edid_size(edid), GFP_KERNEL);
 	if (!new)
 		goto fail;
 	edid = new;
 
-	for (j = 1; j <= edid->extensions; j++) {
-		void *block = edid + j;
+	for (i = 1; i < edid_block_count(edid); i++) {
+		void *block = (void *)edid_block_data(edid, i);
 
-		status = edid_block_read(block, j, read_block, context);
+		status = edid_block_read(block, i, read_block, context);
 
-		edid_block_status_print(status, block, j);
+		edid_block_status_print(status, block, i);
 
 		if (!edid_block_status_valid(status, edid_block_tag(block))) {
 			if (status == EDID_BLOCK_READ_FAIL)
@@ -2156,7 +2190,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	}
 
 	if (invalid_blocks) {
-		connector_bad_edid(connector, edid, edid->extensions + 1);
+		connector_bad_edid(connector, edid, edid_block_count(edid));
 
 		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
 	}
@@ -2321,7 +2355,7 @@ EXPORT_SYMBOL(drm_get_edid_switcheroo);
  */
 struct edid *drm_edid_duplicate(const struct edid *edid)
 {
-	return kmemdup(edid, (edid->extensions + 1) * EDID_LENGTH, GFP_KERNEL);
+	return kmemdup(edid, edid_size(edid), GFP_KERNEL);
 }
 EXPORT_SYMBOL(drm_edid_duplicate);
 
@@ -2505,8 +2539,8 @@ drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *clos
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
 		cb(&(edid->detailed_timings[i]), closure);
 
-	for (i = 1; i <= edid->extensions; i++) {
-		const u8 *ext = (const u8 *)edid + (i * EDID_LENGTH);
+	for (i = 0; i < edid_extension_block_count(edid); i++) {
+		const u8 *ext = edid_extension_block_data(edid, i);
 
 		switch (*ext) {
 		case CEA_EXT:
@@ -3476,17 +3510,17 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	int i;
 
 	/* No EDID or EDID extensions */
-	if (edid == NULL || edid->extensions == 0)
+	if (!edid || !edid_extension_block_count(edid))
 		return NULL;
 
 	/* Find CEA extension */
-	for (i = *ext_index; i < edid->extensions; i++) {
-		edid_ext = (const u8 *)edid + EDID_LENGTH * (i + 1);
+	for (i = *ext_index; i < edid_extension_block_count(edid); i++) {
+		edid_ext = edid_extension_block_data(edid, i);
 		if (edid_block_tag(edid_ext) == ext_id)
 			break;
 	}
 
-	if (i >= edid->extensions)
+	if (i >= edid_extension_block_count(edid))
 		return NULL;
 
 	*ext_index = i + 1;
-- 
2.30.2

