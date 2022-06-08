Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB4654287A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AAE410EF1F;
	Wed,  8 Jun 2022 07:51:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514BB10EEF6;
 Wed,  8 Jun 2022 07:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674708; x=1686210708;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DySzS/MONJyUCVNfWmuzh63nAXVR7QOosaIBQM9Ie4s=;
 b=mewEDA8YOpwJo8HURV6jyIi2hLRYF5QlNCkLVPCycmzyTZvdAwjdjHEv
 1k9vPo2Ad7LXq9wu7bfWmiH+HZiG4aJM6suW6YDSyFE+FpIC9eT4aoyMD
 /ECgozOajLtvRtX9ooSaVITwDaUKvuZnMumnkMuCcBCliyQ1N43PeJgy+
 4nn4w0CQp5gLJIhIhErimxbCr52vPSWZET7ZeQ8RjQrBtNXIUkNMAcGsn
 TXo//KVJTs/s/UzgMhb6KM/Wal0nn0OUv2g1G0A/XDVSjp6k3N31dx2+J
 jFHXCASIzol7QEew5kB5wjldJtxM6lDM1GaCDFIu5pW5T/XUWS2DGQzEY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277982587"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="277982587"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:42 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="683187960"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/15] drm/edid: do invalid block filtering in-place
Date: Wed,  8 Jun 2022 10:50:42 +0300
Message-Id: <42b16188052ac66868dcb68e08973d1e6912f325.1654674560.git.jani.nikula@intel.com>
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

Rewrite edid_filter_invalid_blocks() to filter invalid blocks
in-place. The main motivation is to not rely on passed in information on
invalid block count or the allocation size, which will be helpful in
follow-up work on HF-EEODB.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 43 ++++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 4e788c5cbf25..77ec5b0e436d 100644
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

