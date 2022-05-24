Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B60C5327EB
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 639E710F1D5;
	Tue, 24 May 2022 10:40:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27F810F1D5;
 Tue, 24 May 2022 10:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388801; x=1684924801;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b09OSaw9usYVG2aGiJ/35hsfsU+7OxZNof28tt1YsOg=;
 b=Mrrn7KtwzEjtR2LzfX/mFybPfVijp8oUiamaXW1NTSEVZgm85P5bBU7h
 txn06YixSlxdE48fFQ+tDdtizrptLn6/+mCd7q/uZmR+2+E8d35IFE6Em
 Jorxzi7yT2sQ51LNpwrnQEINo/H/4s1B61b0zvsicjnfMpd6S6HYNQFs6
 eSozZa4QEX6hV6j6qaZX7sQq7tpxJE5BhblIC3BMRH/B72EOHHp+/0Iju
 QG3iXPx5foquUeRYiUhBTH/EliHQ7PErlFomWznJo+oBHb/xve3VyEaBQ
 JZfP1CigM15UBwqWhATXr/MYYh9hlIsgRKNiumP4iTih0O/2CyFSTk4mw Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="273490280"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="273490280"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:01 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="572561981"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:39:58 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 01/13] drm/edid: add block count and data helper functions
 for drm_edid
Date: Tue, 24 May 2022 13:39:23 +0300
Message-Id: <a08352924ad49a32213d8979d43d480f3f7b4a11.1653381821.git.jani.nikula@intel.com>
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

Add drm_edid based block count and data access helper functions that
take the EDID allocated size into account.

At the moment, the allocated size should always match the EDID size
indicated by the extension count, but this will change in the future.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 42 +++++++++++++++++++++++++++++++-------
 1 file changed, 35 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 929fc0e46751..682d954a9e42 100644
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

