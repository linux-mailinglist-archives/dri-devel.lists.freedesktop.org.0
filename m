Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE46D54287B
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7DDD710EF40;
	Wed,  8 Jun 2022 07:51:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70B9D10EF18;
 Wed,  8 Jun 2022 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674708; x=1686210708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=B6m7OoF3WbEnoiqkAp5nvcfcOkKVdkD2lG99+LvXeKA=;
 b=c2uVY/PgM5F9mUR4L2ni4/Ltq9TucjvdfIFnAH1Yw5P+BPHdtd7/Wgrp
 pTzeF7i0K0/NtlsgKDgRWGLhQdbuNiKAcWLDky62ScvxPcUhfAdmapzRG
 WgnTxYXmIiGAM8mjMJOWVjNMtG8LrFVu74hJ/LHfRQBXcQWvBJL3EtB8x
 DMBtaQJ7I+AzxeZqB1rGky9FY3581scj8DgavNQ1U5Cz1s1MXX6EK+WFN
 2q3O5sLDZQVXGHvecMYBVd9ousiJGfzUTY3w5TA+Gf/wECA6z+x7dnKRc
 iKYLIKzsn9jmvqb9M4+i+LRAcXms/1YhFxYcXxgMyvEBfkvu//ptAHbwE A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277646111"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="277646111"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:46 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="636657441"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 13/15] drm/edid: add HF-EEODB support to EDID read and
 allocation
Date: Wed,  8 Jun 2022 10:50:43 +0300
Message-Id: <2416de28e7e2161f818a750eb1b69b83a4d6e7af.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
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

HDMI 2.1 section 10.3.6 defines an HDMI Forum EDID Extension Override
Data Block, which may contain a different extension count than the base
block claims. Add support for reading more EDID data if available. The
extra blocks aren't parsed yet, though.

Hard-coding the EEODB parsing instead of using the iterators we have is
a bit of a bummer, but we have to be able to do this on a partially
allocated EDID while reading it.

v2:
- Check for CEA Data Block Collection size (Ville)
- Amend commit message and comment about hard-coded parsing

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 89 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 86 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 77ec5b0e436d..5cac357e50b0 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1581,6 +1581,15 @@ static bool version_greater(const struct drm_edid *drm_edid,
 		(edid->version == version && edid->revision > revision);
 }
 
+static int edid_hfeeodb_extension_block_count(const struct edid *edid);
+
+static int edid_hfeeodb_block_count(const struct edid *edid)
+{
+	int eeodb = edid_hfeeodb_extension_block_count(edid);
+
+	return eeodb ? eeodb + 1 : 0;
+}
+
 static int edid_extension_block_count(const struct edid *edid)
 {
 	return edid->extensions;
@@ -2026,6 +2035,11 @@ static struct edid *edid_filter_invalid_blocks(struct edid *edid,
 	struct edid *new;
 	int i, valid_blocks = 0;
 
+	/*
+	 * Note: If the EDID uses HF-EEODB, but has invalid blocks, we'll revert
+	 * back to regular extension count here. We don't want to start
+	 * modifying the HF-EEODB extension too.
+	 */
 	for (i = 0; i < edid_block_count(edid); i++) {
 		const void *src_block = edid_block_data(edid, i);
 
@@ -2235,7 +2249,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 				     size_t *size)
 {
 	enum edid_block_status status;
-	int i, invalid_blocks = 0;
+	int i, num_blocks, invalid_blocks = 0;
 	struct edid *edid, *new;
 	size_t alloc_size = EDID_LENGTH;
 
@@ -2277,7 +2291,8 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 		goto fail;
 	edid = new;
 
-	for (i = 1; i < edid_block_count(edid); i++) {
+	num_blocks = edid_block_count(edid);
+	for (i = 1; i < num_blocks; i++) {
 		void *block = (void *)edid_block_data(edid, i);
 
 		status = edid_block_read(block, i, read_block, context);
@@ -2288,11 +2303,31 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 			if (status == EDID_BLOCK_READ_FAIL)
 				goto fail;
 			invalid_blocks++;
+		} else if (i == 1) {
+			/*
+			 * If the first EDID extension is a CTA extension, and
+			 * the first Data Block is HF-EEODB, override the
+			 * extension block count.
+			 *
+			 * Note: HF-EEODB could specify a smaller extension
+			 * count too, but we can't risk allocating a smaller
+			 * amount.
+			 */
+			int eeodb = edid_hfeeodb_block_count(edid);
+
+			if (eeodb > num_blocks) {
+				num_blocks = eeodb;
+				alloc_size = edid_size_by_blocks(num_blocks);
+				new = krealloc(edid, alloc_size, GFP_KERNEL);
+				if (!new)
+					goto fail;
+				edid = new;
+			}
 		}
 	}
 
 	if (invalid_blocks) {
-		connector_bad_edid(connector, edid, edid_block_count(edid));
+		connector_bad_edid(connector, edid, num_blocks);
 
 		edid = edid_filter_invalid_blocks(edid, &alloc_size);
 	}
@@ -3825,6 +3860,7 @@ static int add_detailed_modes(struct drm_connector *connector,
 #define CTA_EXT_DB_HDR_STATIC_METADATA	6
 #define CTA_EXT_DB_420_VIDEO_DATA	14
 #define CTA_EXT_DB_420_VIDEO_CAP_MAP	15
+#define CTA_EXT_DB_HF_EEODB		0x78
 #define CTA_EXT_DB_HF_SCDB		0x79
 
 #define EDID_BASIC_AUDIO	(1 << 6)
@@ -4884,6 +4920,12 @@ static bool cea_db_is_hdmi_forum_vsdb(const struct cea_db *db)
 		cea_db_payload_len(db) >= 7;
 }
 
+static bool cea_db_is_hdmi_forum_eeodb(const void *db)
+{
+	return cea_db_is_extended_tag(db, CTA_EXT_DB_HF_EEODB) &&
+		cea_db_payload_len(db) >= 2;
+}
+
 static bool cea_db_is_microsoft_vsdb(const struct cea_db *db)
 {
 	return cea_db_is_vendor(db, MICROSOFT_IEEE_OUI) &&
@@ -4918,6 +4960,47 @@ static bool cea_db_is_hdmi_hdr_metadata_block(const struct cea_db *db)
 		cea_db_payload_len(db) >= 3;
 }
 
+/*
+ * Get the HF-EEODB override extension block count from EDID.
+ *
+ * The passed in EDID may be partially read, as long as it has at least two
+ * blocks (base block and one extension block) if EDID extension count is > 0.
+ *
+ * Note that this is *not* how you should parse CTA Data Blocks in general; this
+ * is only to handle partially read EDIDs. Normally, use the CTA Data Block
+ * iterators instead.
+ *
+ * References:
+ * - HDMI 2.1 section 10.3.6 HDMI Forum EDID Extension Override Data Block
+ */
+static int edid_hfeeodb_extension_block_count(const struct edid *edid)
+{
+	const u8 *cta;
+
+	/* No extensions according to base block, no HF-EEODB. */
+	if (!edid_extension_block_count(edid))
+		return 0;
+
+	/* HF-EEODB is always in the first EDID extension block only */
+	cta = edid_extension_block_data(edid, 0);
+	if (edid_block_tag(cta) != CEA_EXT || cea_revision(cta) < 3)
+		return 0;
+
+	/* Need to have the data block collection, and at least 3 bytes. */
+	if (cea_db_collection_size(cta) < 3)
+		return 0;
+
+	/*
+	 * Sinks that include the HF-EEODB in their E-EDID shall include one and
+	 * only one instance of the HF-EEODB in the E-EDID, occupying bytes 4
+	 * through 6 of Block 1 of the E-EDID.
+	 */
+	if (!cea_db_is_hdmi_forum_eeodb(&cta[4]))
+		return 0;
+
+	return cta[4 + 2];
+}
+
 static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 				      const u8 *db)
 {
-- 
2.30.2

