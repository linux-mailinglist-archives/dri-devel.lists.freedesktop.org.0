Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E9B054286A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D405C10EEA7;
	Wed,  8 Jun 2022 07:51:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A37EE10EE97;
 Wed,  8 Jun 2022 07:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674669; x=1686210669;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=W6IbeIsu765KHTG/89ijhUh5Yf/VdOAKMFTnqhYFiYU=;
 b=SYCT1TfP02nsnzFt8SXuBKyMTK8orYTn1a6sUYYwxMAl0mWaSi9f3l0X
 j+BpQ0yBlP1TmBm9N0QUOW685Lt/VmgggYw5S0E4vcskeJub83r2wEesd
 8fDoUGP0JmBajUJJzWBDVA9N50ebn+6ggMK231VObbBvWYdlxRLdZO2Iv
 +U2UWIwk1as7ZG+W83kEj7W8A06P5UNpqOEe6eDMtm+1c8qoGz2T28tXz
 I9o3t0IT12KTsprTCmCDP5NJQAkdW2qfx1/CHiMZfD7JZ5+ldckNXbiL5
 OqTdqET9AeEqA47qNYYJ/ULBfYVn8OEckgnh1RHkI+xa4ABIfaI4+f66t Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="265611311"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="265611311"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:08 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="907528327"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:06 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 04/15] drm/edid: keep track of alloc size in
 drm_do_get_edid()
Date: Wed,  8 Jun 2022 10:50:34 +0300
Message-Id: <8e4261d8c2947ea99240ea929f09a04878235f4e.1654674560.git.jani.nikula@intel.com>
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

We'll want to return the allocated buffer size in the future. Keep track
of it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index f44ada4bfa5b..2beaa48301c1 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2021,13 +2021,16 @@ bool drm_edid_is_valid(struct edid *edid)
 EXPORT_SYMBOL(drm_edid_is_valid);
 
 static struct edid *edid_filter_invalid_blocks(const struct edid *edid,
-					       int invalid_blocks)
+					       int invalid_blocks,
+					       size_t *alloc_size)
 {
 	struct edid *new, *dest_block;
 	int valid_extensions = edid->extensions - invalid_blocks;
 	int i;
 
-	new = kmalloc(edid_size_by_blocks(valid_extensions + 1), GFP_KERNEL);
+	*alloc_size = edid_size_by_blocks(valid_extensions + 1);
+
+	new = kmalloc(*alloc_size, GFP_KERNEL);
 	if (!new)
 		goto out;
 
@@ -2140,7 +2143,8 @@ static void connector_bad_edid(struct drm_connector *connector,
 }
 
 /* Get override or firmware EDID */
-static struct edid *drm_get_override_edid(struct drm_connector *connector)
+static struct edid *drm_get_override_edid(struct drm_connector *connector,
+					  size_t *alloc_size)
 {
 	struct edid *override = NULL;
 
@@ -2150,6 +2154,10 @@ static struct edid *drm_get_override_edid(struct drm_connector *connector)
 	if (!override)
 		override = drm_load_edid_firmware(connector);
 
+	/* FIXME: Get alloc size from deeper down the stack */
+	if (!IS_ERR_OR_NULL(override) && alloc_size)
+		*alloc_size = edid_size(override);
+
 	return IS_ERR(override) ? NULL : override;
 }
 
@@ -2169,7 +2177,7 @@ int drm_add_override_edid_modes(struct drm_connector *connector)
 	struct edid *override;
 	int num_modes = 0;
 
-	override = drm_get_override_edid(connector);
+	override = drm_get_override_edid(connector, NULL);
 	if (override) {
 		drm_connector_update_edid_property(connector, override);
 		num_modes = drm_add_edid_modes(connector, override);
@@ -2245,12 +2253,13 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	enum edid_block_status status;
 	int i, invalid_blocks = 0;
 	struct edid *edid, *new;
+	size_t alloc_size = EDID_LENGTH;
 
-	edid = drm_get_override_edid(connector);
+	edid = drm_get_override_edid(connector, &alloc_size);
 	if (edid)
 		goto ok;
 
-	edid = kmalloc(EDID_LENGTH, GFP_KERNEL);
+	edid = kmalloc(alloc_size, GFP_KERNEL);
 	if (!edid)
 		return NULL;
 
@@ -2278,7 +2287,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (!edid_extension_block_count(edid))
 		goto ok;
 
-	new = krealloc(edid, edid_size(edid), GFP_KERNEL);
+	alloc_size = edid_size(edid);
+	new = krealloc(edid, alloc_size, GFP_KERNEL);
 	if (!new)
 		goto fail;
 	edid = new;
@@ -2300,7 +2310,8 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	if (invalid_blocks) {
 		connector_bad_edid(connector, edid, edid_block_count(edid));
 
-		edid = edid_filter_invalid_blocks(edid, invalid_blocks);
+		edid = edid_filter_invalid_blocks(edid, invalid_blocks,
+						  &alloc_size);
 	}
 
 ok:
-- 
2.30.2

