Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CCD9B501243
	for <lists+dri-devel@lfdr.de>; Thu, 14 Apr 2022 17:07:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50B0C10FF45;
	Thu, 14 Apr 2022 15:07:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B665C10FF39;
 Thu, 14 Apr 2022 15:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649948856; x=1681484856;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Q+SFgt4sJgZnphzYaMYLDXM9JgSnIVAdJb8XgRa3Ni8=;
 b=Bz29Ryq/ro2eAOetMrKcNjpMMBwEutPKcq8BjJbwDLM1F/MZX5CuSgrd
 Kg6QIk08ATsHq0d57jc1PKPpYbxNNv3eYa2k4Z/6QnaxPWF4kQRlYyOMc
 JAE9cGAb3CE+RanWm2EX0itjffLgbQ2T+Bbwg3EeBtP4u3p0YgWlDOhrq
 0WbADHZ8Cv0eIMyeKvhAYCNzaKYsxr4MvYIeaGGp4/ib8SrHyKarO/1SR
 Dfc0Q+HNMTSVzohAoJ1zWqxeSrMbTZgTCV9/vWvY2/W3BeA83kuDiOM5L
 vLS8j1wQgdCNga+A+wDe341Xp4JQrUjL5Wcvt3HnrkNjHJxRHyZVIckhK A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10317"; a="262394437"
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="262394437"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:36 -0700
X-IronPort-AV: E=Sophos;i="5.90,260,1643702400"; d="scan'208";a="725393619"
Received: from nplaweck-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.149.236])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Apr 2022 08:07:33 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/19] drm/edid: add iterator for CTA data blocks
Date: Thu, 14 Apr 2022 18:06:48 +0300
Message-Id: <b5d8de71d81dc3a3cacdb66557f1773c4ecdd9ba.1649948562.git.jani.nikula@intel.com>
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

Add an iterator for CTA Data Blocks across EDID CTA Extensions and
DisplayID CTA Data Blocks.

v2: Update references, note why we can trust displayid ranges (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 202 ++++++++++++++++++++++++++++++++++---
 1 file changed, 190 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 40ffd7aba157..43d9e04f8fb9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4360,24 +4360,12 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len,
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
@@ -4433,6 +4421,196 @@ cea_db_offsets(const u8 *cea, int *start, int *end)
 	return 0;
 }
 
+/*
+ * CTA Data Block iterator.
+ *
+ * Iterate through all CTA Data Blocks in both EDID CTA Extensions and DisplayID
+ * CTA Data Blocks.
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
+/* CTA-861-H section 7.4 CTA Data BLock Collection */
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
+ * - CTA-861-H section 7.3.3 CTA Extension Version 3
+ */
+static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
+{
+	const u8 *ext;
+
+	drm_edid_iter_for_each(ext, &iter->edid_iter) {
+		/* Only support CTA Extension revision 3+ */
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
+ * Block revision and CTA Extension versions.
+ */
+static const void *__cea_db_iter_displayid_next(struct cea_db_iter *iter)
+{
+	const struct displayid_block *block;
+
+	displayid_iter_for_each(block, &iter->displayid_iter) {
+		if (block->tag != DATA_BLOCK_CTA)
+			continue;
+
+		/*
+		 * The displayid iterator has already verified the block bounds
+		 * in displayid_iter_block().
+		 */
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
+		/* Next block in CTA Data Block Collection */
+		iter->index += sizeof(*db) + cea_db_payload_len(db);
+
+		db = __cea_db_iter_current_block(iter);
+		if (db)
+			return db;
+	}
+
+	for (;;) {
+		/*
+		 * Find the next CTA Data Block Collection. First iterate all
+		 * the EDID CTA Extensions, then all the DisplayID CTA blocks.
+		 *
+		 * Per DisplayID v1.3 Appendix B: DisplayID as an EDID
+		 * Extension, it's recommended that DisplayID extensions are
+		 * exposed after all of the CTA Extensions.
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
 	if (cea_db_tag(db) != CTA_DB_VENDOR)
-- 
2.30.2

