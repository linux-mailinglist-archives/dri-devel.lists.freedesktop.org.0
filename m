Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4E0E55458C
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DC2910EB53;
	Wed, 22 Jun 2022 11:00:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DECE10EB53;
 Wed, 22 Jun 2022 11:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895613; x=1687431613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uO95Fxt0aL7jQOE3BBDJjSI6EnGA06VticWHHJRkbeo=;
 b=Bd/ABxGS0BPpny0o2noAN0FQRHhcKbpP31nQpD2slmqHx4ENDThekkm9
 a3vddZ5OwbdPdkkxVJs302vfabtUZtRFoP/d6kpEOUfQhIvakSPf0xuiv
 txuCdqAXEQULhs74yoaTOv1f6LmAAl4K5VKVa7szmLaZPlrXDD6a7Rz2p
 QWUEcaKTpSvIvEJr36FYbCIB2w22FlpnZazH95aTLm+TdoRdhWbSVrfML
 uUIByMt0tkkY8OrLxyUp232UmM/YVtE3yBOaVhoQuUBX7M7BnTAFk7khd
 muknonBIZ8L+8Lq7PJLSatfwbGNaGeWOv4AxTboVcYVDTIrGyzP6VErHM Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="305837513"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="305837513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:12 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="690444741"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:11 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 10/13] drm/edid: do invalid block filtering in-place
Date: Wed, 22 Jun 2022 13:59:24 +0300
Message-Id: <6cfed9a89bcaabf0d09cc6697d5c8cac9cc24202.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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

Rewrite edid_filter_invalid_blocks() to filter invalid blocks
in-place. The main motivation is to not rely on passed in information on
invalid block count or the allocation size, which will be helpful in
follow-up work on HF-EEODB.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 43 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1c761e12820e..a80ea0aa7b32 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2020,33 +2020,37 @@ bool drm_edid_is_valid(struct edid *edid)
 }
 EXPORT_SYMBOL(drm_edid_is_valid);
 
-static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
-					       int invalid_blocks,
+static struct edid *edid_filter_invalid_blocks(struct edid *edid,
 					       size_t *alloc_size)
 {
-	struct edid *new, *dest_block;
-	int valid_extensions = edid->extensions - invalid_blocks;
-	int i;
+	struct edid *new;
+	int i, valid_blocks = 0;
 
-	*alloc_size = edid_size_by_blocks(valid_extensions + 1);
+	for (i = 0; i < edid_block_count(edid); i++) {
+		const void *src_block = edid_block_data(edid, i);
 
-	new = kmalloc(*alloc_size, GFP_KERNEL);
-	if (!new)
-		goto out;
+		if (edid_block_valid(src_block, i == 0)) {
+			void *dst_block = (void *)edid_block_data(edid, valid_blocks);
 
-	dest_block = new;
-	for (i = 0; i < edid_block_count(edid); i++) {
-		const void *block = edid_block_data(edid, i);
+			memmove(dst_block, src_block, EDID_LENGTH);
+			valid_blocks++;
+		}
+	}
 
-		if (edid_block_valid(block, i == 0))
-			memcpy(dest_block++, block, EDID_LENGTH);
+	/* We already trusted the base block to be valid here... */
+	if (WARN_ON(!valid_blocks)) {
+		kfree(edid);
+		return NULL;
 	}
 
-	new->extensions = valid_extensions;
-	new->checksum = edid_block_compute_checksum(new);
+	edid->extensions = valid_blocks - 1;
+	edid->checksum = edid_block_compute_checksum(edid);
 
-out:
-	kfree(edid);
+	*alloc_size = edid_size_by_blocks(valid_blocks);
+
+	new = krealloc(edid, *alloc_size, GFP_KERNEL);
+	if (!new)
+		kfree(edid);
 
 	return new;
 }
@@ -2316,8 +2320,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	if (invalid_blocks) {
 		connector_bad_edid(connector, edid, edid_block_count(edid));
 
-		edid = edid_filter_invalid_blocks(edid, invalid_blocks,
-						  &alloc_size);
+		edid = edid_filter_invalid_blocks(edid, &alloc_size);
 	}
 
 ok:
-- 
2.30.2

