Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD30C5327EC
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:40:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3AEF10F218;
	Tue, 24 May 2022 10:40:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5EA8A10F218;
 Tue, 24 May 2022 10:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388807; x=1684924807;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+ZgdrbUhW1g8W6pTc3k5nQ/iibckZZD9a2v+xIkM5Lw=;
 b=jX0+ew5NSNkAAjhg+5wQZdrPtIvXFqTqG0OxWi704J+72a1aCcAtWZ4d
 1YHTWfJQ/dNQSRmhWjuuM2DRiBbmsrkNVlDj9mLQBY9MH9P71mwx9ipkQ
 LhMw8y5uRfdJKkAr8DB5q5nSA0EkbTj0B1x+ZHsWTbFRjrwODl40z7c8l
 4v0HpajqYiyfdbzB0R0S+olspqOUcpuXptKdfTgyaaTiDA5+FlzA8Nszu
 OA7I5eSVCgbLGo+Pd8Xw7phf71xY3kdXqzJ3KVsYmXMhxWsIGb77OpnM0
 eAdF6xpfIWzYbztNRckWZ6vcLzITa2lHDV0K5a1mh7WJXwAGA5G4FlW9c g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336548015"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="336548015"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:06 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="548411974"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:40:04 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 02/13] drm/edid: keep track of alloc size in
 drm_do_get_edid()
Date: Tue, 24 May 2022 13:39:24 +0300
Message-Id: <b58566bceb950420acf1eade236f7fc6f2253f67.1653381821.git.jani.nikula@intel.com>
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

We'll want to return the allocated buffer size in the future. Keep track
of it.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 682d954a9e42..2132a38ed701 100644
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

