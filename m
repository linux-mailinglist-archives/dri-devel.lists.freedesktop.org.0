Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517155FBF5
	for <lists+dri-devel@lfdr.de>; Wed, 29 Jun 2022 11:28:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21B4611A536;
	Wed, 29 Jun 2022 09:28:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0667D11A536;
 Wed, 29 Jun 2022 09:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656494917; x=1688030917;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=uO95Fxt0aL7jQOE3BBDJjSI6EnGA06VticWHHJRkbeo=;
 b=AfhPU5qyRFtJP/Lzt+pbvQBn23LqCQUBDQ95L1naPwGAwW2SCoA+mFid
 qCnhlNTcG35gki8tG6Ag3GC8MZ79huv3HTjxDb3mzobfwlUg+8Uz91W+/
 HiRsVgXZ0518DFzbFooyTBqMbfbv7QkKPsQ2yjNOKQygc5FQnEtJ1rM4q
 eRVZryJ+3d8IavL27aolT4nwXmud7cZAY3NEwxzwwgN9c6r/n19yH+TQ8
 3ndPJZJppg+mmzR0D7rqfhiYdafMdPyuOdAlD+g0zabFfaERKDR8NTmiQ
 21Yv323MIlF8pvqXF7hRHBqqZUcOVSxuj+VRfru+Am5r6/tPZH52l05sl A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10392"; a="261785575"
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="261785575"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:36 -0700
X-IronPort-AV: E=Sophos;i="5.92,231,1650956400"; d="scan'208";a="917536595"
Received: from srdoo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.63.102])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 02:28:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI RESEND 08/10] drm/edid: do invalid block filtering in-place
Date: Wed, 29 Jun 2022 12:27:53 +0300
Message-Id: <a6ad5e4e7b91338c0d19d7be189af31094e65555.1656494768.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1656494768.git.jani.nikula@intel.com>
References: <cover.1656494768.git.jani.nikula@intel.com>
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

