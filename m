Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2714F532800
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD04010F52D;
	Tue, 24 May 2022 10:40:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B0D5310F51C;
 Tue, 24 May 2022 10:40:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388854; x=1684924854;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DepJzAs6X8IEokDH72LsTxV3T0gaS0kmjA/sIBuSqTg=;
 b=itRvRKfkob1yrfTyhc5n6NJkcSYplBWJhwYkS22r+JgVt8Wa2Dor3lop
 DJspijXpTNda7aTLEhGx45w6xdyPCe/ZhDtJXn/Xp/vzXVjzAkoPdsKmt
 JYG10EhnI7Vy02V/uYFivIFyGQ9wxfjsWmRSjfLMZcV6wCdCKTzeta6Kj
 afTeZPBpHaYW7J6YOmQwFpNABeTSY6cveTIP1dLCCyNM0etI9J4XbUruq
 bNEFv1rFu7+6gHiTG8sutvEH0YmXbM8bq8AdnL0lWOWHms+a7hcwCvM/B
 flkLn2MZLtBku/nCUvLuPbjFHYYQ2qmjV+KDH19HvF4p7ESTyPVxnhCCQ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="255557757"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="255557757"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:54 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="559072477"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:52 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 10/13] drm/edid: do invalid block filtering in-place
Date: Tue, 24 May 2022 13:39:32 +0300
Message-Id: <dad2511a01355638145567e935c7969c7d1e462d.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Rewrite edid_filter_invalid_blocks() to filter invalid blocks
in-place. The main motivation is to not rely on passed in information on
invalid block count or the allocation size, which will be helpful in
follow-up work on HF-EEODB.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 43 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 6617ea70ae5c..5e0a91da565e 100644
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
@@ -2290,8 +2294,7 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 	if (invalid_blocks) {
 		connector_bad_edid(connector, edid, edid_block_count(edid));
 
-		edid = edid_filter_invalid_blocks(edid, invalid_blocks,
-						  &alloc_size);
+		edid = edid_filter_invalid_blocks(edid, &alloc_size);
 	}
 
 ok:
-- 
2.30.2

