Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08A19542868
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4730B10EE8B;
	Wed,  8 Jun 2022 07:51:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E5410EE8B;
 Wed,  8 Jun 2022 07:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674665; x=1686210665;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=3JQEegJscKLQ9puxBz4jqFm2U2w5qsN3TvPIE/I7ezU=;
 b=YzPbrw/3heafPgNBaU8EPImaHKt1RKwB2NnwkRfi0tN2giZtiYk5HKv1
 xn45CXG4s32rQ1H+HRnaARLuRX9M82mk1MDhdj2+1mlZx8lDdQHABEpz8
 A9D20nt46tD0N3Wea6hJmEER/yjw87nDQtHQkh19dzPx4ZsOodXbmS2Sn
 HJO6meRRCyGmp3Kn+LPm9OWy7LHHSqt2OKIkb6hf2A1QEyuLkiB62Qe4c
 IK2urBCogrPT9SvuHiYrbZTrtnfedJLx8UNxgib7L46sX5j32phWB0XhY
 syWZlJ94LMhxxdbhyveuF5RFVhiEJyW4Ic6ZwiJ1E72AMhQkIAwgQrLAQ Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="338595940"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="338595940"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="636656954"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:01 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 03/15] drm/edid: add block count and data helper functions
 for drm_edid
Date: Wed,  8 Jun 2022 10:50:33 +0300
Message-Id: <1a68c8667a88e7c451b001ad8bd86c8badb57fb8.1654674560.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add drm_edid based block count and data access helper functions that
take the EDID allocated size into account.

At the moment, the allocated size should always match the EDID size
indicated by the extension count, but this will change in the future.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 42 +++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 002816509fc8..f44ada4bfa5b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1613,6 +1613,35 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
 	return edid_block_data(edid, index + 1);
 }
 
+static int drm_edid_block_count(const struct drm_edid *drm_edid)
+{
+	int num_blocks;
+
+	/* Starting point */
+	num_blocks = edid_block_count(drm_edid->edid);
+
+	/* Limit by allocated size */
+	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
+
+	return num_blocks;
+}
+
+static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
+{
+	return drm_edid_block_count(drm_edid) - 1;
+}
+
+static const void *drm_edid_block_data(const struct drm_edid *drm_edid, int index)
+{
+	return edid_block_data(drm_edid->edid, index);
+}
+
+static const void *drm_edid_extension_block_data(const struct drm_edid *drm_edid,
+						 int index)
+{
+	return edid_extension_block_data(drm_edid->edid, index);
+}
+
 /*
  * Initializer helper for legacy interfaces, where we have no choice but to
  * trust edid size. Not for general purpose use.
@@ -1665,8 +1694,8 @@ static const void *__drm_edid_iter_next(struct drm_edid_iter *iter)
 	if (!iter->drm_edid)
 		return NULL;
 
-	if (iter->index < edid_block_count(iter->drm_edid->edid))
-		block = edid_block_data(iter->drm_edid->edid, iter->index++);
+	if (iter->index < drm_edid_block_count(iter->drm_edid))
+		block = drm_edid_block_data(iter->drm_edid, iter->index++);
 
 	return block;
 }
@@ -3574,22 +3603,21 @@ static int add_detailed_modes(struct drm_connector *connector,
 const u8 *drm_find_edid_extension(const struct drm_edid *drm_edid,
 				  int ext_id, int *ext_index)
 {
-	const struct edid *edid = drm_edid ? drm_edid->edid : NULL;
 	const u8 *edid_ext = NULL;
 	int i;
 
 	/* No EDID or EDID extensions */
-	if (!edid || !edid_extension_block_count(edid))
+	if (!drm_edid || !drm_edid_extension_block_count(drm_edid))
 		return NULL;
 
 	/* Find CEA extension */
-	for (i = *ext_index; i < edid_extension_block_count(edid); i++) {
-		edid_ext = edid_extension_block_data(edid, i);
+	for (i = *ext_index; i < drm_edid_extension_block_count(drm_edid); i++) {
+		edid_ext = drm_edid_extension_block_data(drm_edid, i);
 		if (edid_block_tag(edid_ext) == ext_id)
 			break;
 	}
 
-	if (i >= edid_extension_block_count(edid))
+	if (i >= drm_edid_extension_block_count(drm_edid))
 		return NULL;
 
 	*ext_index = i + 1;
-- 
2.30.2

