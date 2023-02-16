Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CAC699E20
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:45:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22F9710EEC1;
	Thu, 16 Feb 2023 20:45:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB11B10EEBF;
 Thu, 16 Feb 2023 20:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676580326; x=1708116326;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KdmrXOQWPiUD5GTaSPQeRMz6QqIKf/6FB8eRwdwrwJw=;
 b=fJ0Hxv1Dlw0NI2fdmHf/VgBK+JgbbucNsfFEq4FxDCrZBD87YMRDYANN
 DtN7fV8c3ltEuB+cCuXg016W2UPlHzF6MGrjWWDjDSpfEHPAYIqRHhAfh
 eYNnShuSwOjCoLn/ucoNwcu805zZyYBIrMk9p5gytLTW61hZ0UpDAFSAp
 l3is3S+BRsv/OL5hX9pIBRGU+kIs3qJYvhoHh1DnZfAZyvQWOCT+lDA0/
 5Vte8yPmfO9LhgQZAYPLnKyIJdS0lCSv3019XtgO8ujkvJZkMBzZgHWFQ
 aN6XVxVIT5+G9Y7Os1xKjF6L3golhxYJvZ43MJyq7kefG2izyNRJ4YuW6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394308460"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394308460"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 12:45:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670312066"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="670312066"
Received: from uwah-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.106])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:45:23 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/displayid: provide access to DisplayID version and
 primary use case
Date: Thu, 16 Feb 2023 22:45:00 +0200
Message-Id: <ad8a35c109f97ffe115e6b18e4a132b592f11089.1676580180.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676580180.git.jani.nikula@intel.com>
References: <cover.1676580180.git.jani.nikula@intel.com>
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
 Iaroslav Boliukin <iam@lach.pw>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The DisplayID structure version and primary use case are stored in the
DisplayID Base Section. We should be checking them in a number of places
when parsing the DisplayID blocks. Currently, we completely ignore the
primary use case, and just look at the block tags without cross-checking
against structure version.

Store the version and primary use case in the DisplayID iterator, and
provide accessors to them. In general, the information is needed when
iterating the blocks, and this is a convenient place to both store and
retrieve the information during parsing.

Promote using accessors rather than users poking at the iterator
directly.

Cc: Iaroslav Boliukin <iam@lach.pw>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 30 ++++++++++++++++++++++++++++++
 include/drm/drm_displayid.h     | 12 +++++++++++-
 2 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 0de9b5530393..9edc111be7ee 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -123,6 +123,9 @@ __displayid_iter_next(struct displayid_iter *iter)
 	}
 
 	for (;;) {
+		/* The first section we encounter is the base section */
+		bool base_section = !iter->section;
+
 		iter->section = drm_find_displayid_extension(iter->drm_edid,
 							     &iter->length,
 							     &iter->idx,
@@ -132,6 +135,18 @@ __displayid_iter_next(struct displayid_iter *iter)
 			return NULL;
 		}
 
+		/* Save the structure version and primary use case. */
+		if (base_section) {
+			const struct displayid_header *base;
+
+			base = displayid_get_header(iter->section, iter->length,
+						    iter->idx);
+			if (!IS_ERR(base)) {
+				iter->version = base->rev;
+				iter->primary_use = base->prod_id;
+			}
+		}
+
 		iter->idx += sizeof(struct displayid_header);
 
 		block = displayid_iter_block(iter);
@@ -144,3 +159,18 @@ void displayid_iter_end(struct displayid_iter *iter)
 {
 	memset(iter, 0, sizeof(*iter));
 }
+
+/* DisplayID Structure Version/Revision from the Base Section. */
+u8 displayid_version(const struct displayid_iter *iter)
+{
+	return iter->version;
+}
+
+/*
+ * DisplayID Primary Use Case (2.0+) or Product Type Identifier (1.0-1.3) from
+ * the Base Section.
+ */
+u8 displayid_primary_use(const struct displayid_iter *iter)
+{
+	return iter->primary_use;
+}
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 49649eb8447e..566497eeb3b8 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -139,7 +139,11 @@ struct displayid_vesa_vendor_specific_block {
 	u8 mso;
 } __packed;
 
-/* DisplayID iteration */
+/*
+ * DisplayID iteration.
+ *
+ * Do not access directly, this is private.
+ */
 struct displayid_iter {
 	const struct drm_edid *drm_edid;
 
@@ -147,6 +151,9 @@ struct displayid_iter {
 	int length;
 	int idx;
 	int ext_index;
+
+	u8 version;
+	u8 primary_use;
 };
 
 void displayid_iter_edid_begin(const struct drm_edid *drm_edid,
@@ -157,4 +164,7 @@ __displayid_iter_next(struct displayid_iter *iter);
 	while (((__block) = __displayid_iter_next(__iter)))
 void displayid_iter_end(struct displayid_iter *iter);
 
+u8 displayid_version(const struct displayid_iter *iter);
+u8 displayid_primary_use(const struct displayid_iter *iter);
+
 #endif
-- 
2.34.1

