Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 904C54E4870
	for <lists+dri-devel@lfdr.de>; Tue, 22 Mar 2022 22:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63BEF10E57E;
	Tue, 22 Mar 2022 21:41:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C92E10E57B;
 Tue, 22 Mar 2022 21:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1647985284; x=1679521284;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=E4yfPeQvo/91r1fscfCUWgVtmixB/w/w2Q4c2qqvAgA=;
 b=aeTSkxJDHX6mak+5o8hfjsdLHsDmxrQ4hr9dzrrhZAexkX2/4OnR4MSp
 k+IRpXUZeFuBi8oiwpITMAsja9ySno0KJ8rwjNZ3BonebTd3tiWyIkPg+
 Wds+uwggGuCEVrQajPqqOCrzxy98kXE4RrHdXRH7EKbbnNVHR1i5X6kCv
 Y7Rjqr8bb054myCv7JnGFtIkOtCv3U6BCVrYKyAIqDxxCIbUg9jaxX/9J
 6buacd4ngohtMsVmWL2IRP07sLyaiYgcs2DMy8IigBRfzA/P1oJ9dSKZ+
 eWt7ZZLTb+v4bnxldRBs/AwYREYag2euspTT4wXIP3EUlAuk4kEeFrsws Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="238559568"
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="238559568"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:23 -0700
X-IronPort-AV: E=Sophos;i="5.90,202,1643702400"; d="scan'208";a="500758143"
Received: from sburacze-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.58.237])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 14:41:22 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 05/19] drm/edid: add iterator for CEA data blocks
Date: Tue, 22 Mar 2022 23:40:34 +0200
Message-Id: <6da67bfcb883daf80910a49dbc1bd112ca51345d.1647985054.git.jani.nikula@intel.com>
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

Add an iterator for CEA Data Blocks across CEA extensions and CTA
DisplayID Data Blocks.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 198 ++++++++++++++++++++++++++++++++++---
 1 file changed, 186 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 31d132fcd0ca..c12c3cbab274 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4196,24 +4196,12 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
 	return modes;
 }
 
-static int
-cea_db_payload_len(const u8 *db)
-{
-	return db[0] & 0x1f;
-}
-
 static int
 cea_db_extended_tag(const u8 *db)
 {
 	return db[1];
 }
 
-static int
-cea_db_tag(const u8 *db)
-{
-	return db[0] >> 5;
-}
-
 static int
 cea_revision(const u8 *cea)
 {
@@ -4269,6 +4257,192 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 	return 0;
 }
 
+/*
+ * CEA Data Block iterator.
+ *
+ * Iterate through all CEA Data Blocks in both EDID CEA extensions and CTA Data
+ * Blocks in DisplayID extension blocks.
+ *
+ * struct cea_db *db:
+ * struct cea_db_iter iter;
+ *
+ * cea_db_iter_edid_begin(edid, &iter);
+ * cea_db_iter_for_each(db, &iter) {
+ *         // do stuff with db
+ * }
+ * cea_db_iter_end(&iter);
+ */
+struct cea_db_iter {
+	struct drm_edid_iter edid_iter;
+	struct displayid_iter displayid_iter;
+
+	/* Current Data Block Collection. */
+	const u8 *collection;
+
+	/* Current Data Block index in current collection. */
+	int index;
+
+	/* End index in current collection. */
+	int end;
+};
+
+/* CEA-861-F section 7.5 CEA Extension Version 3 and Table 43 */
+struct cea_db {
+	u8 tag_length;
+	u8 data[];
+} __packed;
+
+static int cea_db_tag(const void *_db)
+{
+	/* FIXME: Transition to passing struct cea_db * everywhere. */
+	const struct cea_db *db = _db;
+
+	return db->tag_length >> 5;
+}
+
+static int cea_db_payload_len(const void *_db)
+{
+	/* FIXME: Transition to passing struct cea_db * everywhere. */
+	const struct cea_db *db = _db;
+
+	return db->tag_length & 0x1f;
+}
+
+static const void *cea_db_data(const struct cea_db *db)
+{
+	return db->data;
+}
+
+static void cea_db_iter_edid_begin(const struct edid *edid, struct cea_db_iter *iter)
+{
+	memset(iter, 0, sizeof(*iter));
+
+	drm_edid_iter_begin(edid, &iter->edid_iter);
+	displayid_iter_edid_begin(edid, &iter->displayid_iter);
+}
+
+static const struct cea_db *
+__cea_db_iter_current_block(const struct cea_db_iter *iter)
+{
+	const struct cea_db *db;
+
+	if (!iter->collection)
+		return NULL;
+
+	db = (const struct cea_db *)&iter->collection[iter->index];
+
+	if (iter->index + sizeof(*db) <= iter->end &&
+	    iter->index + sizeof(*db) + cea_db_payload_len(db) <= iter->end)
+		return db;
+
+	return NULL;
+}
+
+/*
+ * References:
+ * - VESA E-EDID v1.4
+ * - CEA-861-F section 7.5 CEA Extension Version 3
+ */
+static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
+{
+	const u8 *ext;
+
+	drm_edid_iter_for_each(ext, &iter->edid_iter) {
+		/* Only support CEA extension revision 3+ */
+		if (ext[0] != CEA_EXT || cea_revision(ext) < 3)
+			continue;
+
+		iter->index = 4;
+		iter->end = ext[2];
+		if (iter->end == 0)
+			iter->end = 127;
+		if (iter->end < 4 || iter->end > 127)
+			continue;
+
+		return ext;
+	}
+
+	return NULL;
+}
+
+/*
+ * References:
+ * - DisplayID v1.3 Appendix C: CEA Data Block within a DisplayID Data Block
+ * - DisplayID v2.0 section 4.10 CTA DisplayID Data Block
+ *
+ * Note that the above do not specify any connection between DisplayID Data
+ * Block revision and CEA Extension versions.
+ */
+static const void *__cea_db_iter_displayid_next(struct cea_db_iter *iter)
+{
+	const struct displayid_block *block;
+
+	displayid_iter_for_each(block, &iter->displayid_iter) {
+		if (block->tag != DATA_BLOCK_CTA)
+			continue;
+
+		iter->index = sizeof(*block);
+		iter->end = iter->index + block->num_bytes;
+
+		return block;
+	}
+
+	return NULL;
+}
+
+static const struct cea_db *__cea_db_iter_next(struct cea_db_iter *iter)
+{
+	const struct cea_db *db;
+
+	if (iter->collection) {
+		/* Current collection should always be valid. */
+		db = __cea_db_iter_current_block(iter);
+		if (WARN_ON(!db)) {
+			iter->collection = NULL;
+			return NULL;
+		}
+
+		/* Next block in CEA Data Block Collection */
+		iter->index += sizeof(*db) + cea_db_payload_len(db);
+
+		db = __cea_db_iter_current_block(iter);
+		if (db)
+			return db;
+	}
+
+	for (;;) {
+		/*
+		 * Find the next CEA Data Block Collection. First iterate all
+		 * the EDID CEA extensions, then all the DisplayID CTA blocks.
+		 *
+		 * Per DisplayID v1.3 Appendix B: DisplayID as an EDID
+		 * Extension, it's recommended that DisplayID extensions are
+		 * exposed after all of the CEA extensions.
+		 */
+		iter->collection = __cea_db_iter_edid_next(iter);
+		if (!iter->collection)
+			iter->collection = __cea_db_iter_displayid_next(iter);
+
+		if (!iter->collection)
+			return NULL;
+
+		db = __cea_db_iter_current_block(iter);
+		if (db)
+			return db;
+	}
+}
+
+#define cea_db_iter_for_each(__db, __iter) \
+	while (((__db) = __cea_db_iter_next(__iter)))
+
+static void cea_db_iter_end(struct cea_db_iter *iter)
+{
+	displayid_iter_end(&iter->displayid_iter);
+	drm_edid_iter_end(&iter->edid_iter);
+
+	memset(iter, 0, sizeof(*iter));
+}
+
 static bool cea_db_is_hdmi_vsdb(const u8 *db)
 {
 	if (cea_db_tag(db) != CEA_DB_VENDOR)
-- 
2.30.2

