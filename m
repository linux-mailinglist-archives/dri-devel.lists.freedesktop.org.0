Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAAB3327CE
	for <lists+dri-devel@lfdr.de>; Tue,  9 Mar 2021 14:54:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 252866E8FE;
	Tue,  9 Mar 2021 13:54:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1A1D6E8F2;
 Tue,  9 Mar 2021 13:54:45 +0000 (UTC)
IronPort-SDR: 3RX+TKsb3VnoJMWPlbZQ0JZwWLmvV5rAfjwft5s46qYOf1QNOznzjXXmfRrk+b61KylkRGwwVA
 KFMflK3cPzrw==
X-IronPort-AV: E=McAfee;i="6000,8403,9917"; a="168151560"
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="168151560"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:45 -0800
IronPort-SDR: SCNYyowuXyU8nEYBaxCa9bvNhj9pYkVnnsLn/UmNWjPMQJou18fcC1/Jbz69jU2w3340RdwZQT
 5YpfDJNjhhPA==
X-IronPort-AV: E=Sophos;i="5.81,234,1610438400"; d="scan'208";a="509293330"
Received: from kjwindec-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.48.180])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Mar 2021 05:54:43 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC v1 3/6] drm/displayid: add new displayid section/block iterators
Date: Tue,  9 Mar 2021 15:54:11 +0200
Message-Id: <d0fd3a830b0ebc082250fb6c1381bb8383715263.1615297748.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1615297748.git.jani.nikula@intel.com>
References: <cover.1615297748.git.jani.nikula@intel.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Iterating DisplayID blocks across sections (in EDID extensions) is
unnecessarily complicated for the caller. Implement DisplayID iterators
to go through all blocks in all sections.

Usage example:

	const struct displayid_block *block;
	struct displayid_iter iter;

	displayid_iter_edid_begin(edid, &iter);
	displayid_iter_for_each(block, &iter) {
		/* operate on block */
	}
	displayid_iter_end(&iter);

When DisplayID is stored in EDID extensions, the DisplayID sections map
to extensions as described in VESA DisplayID v1.3 Appendix B: DisplayID
as an EDID Extension. This is implemented here.

When DisplayID is stored in its dedicated DDC device 0xA4, according to
VESA E-DDC v1.3, different rules apply for the structure. This is not
implemented here, as we don't currently use it, but the idea is you'd
have a different call for beginning the iteration, for example simply:

	displayid_iter_begin(displayid, &iter);

instead of displayid_iter_edid_begin(), and everything else would be
hidden away in the iterator functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 74 +++++++++++++++++++++++++++++++++
 include/drm/drm_displayid.h     | 18 ++++++++
 2 files changed, 92 insertions(+)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 908bbe6feb61..88070267aac9 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -57,3 +57,77 @@ const u8 *drm_find_displayid_extension(const struct edid *edid,
 
 	return displayid;
 }
+
+void displayid_iter_edid_begin(const struct edid *edid,
+			       struct displayid_iter *iter)
+{
+	memset(iter, 0, sizeof(*iter));
+
+	iter->edid = edid;
+}
+
+static const struct displayid_block *
+__displayid_iter_block(const struct displayid_iter *iter)
+{
+	const struct displayid_block *block;
+
+	if (!iter->section)
+		return NULL;
+
+	block = (const struct displayid_block *)&iter->section[iter->idx];
+
+	if (iter->idx + sizeof(struct displayid_block) <= iter->length &&
+	    iter->idx + sizeof(struct displayid_block) + block->num_bytes <= iter->length &&
+	    block->num_bytes > 0)
+		return block;
+
+	return NULL;
+}
+
+const struct displayid_block *
+__displayid_iter_next(struct displayid_iter *iter)
+{
+	const struct displayid_block *block;
+
+	if (!iter->edid)
+		return NULL;
+
+	if (iter->section) {
+		/* current block should always be valid */
+		block = __displayid_iter_block(iter);
+		if (WARN_ON(!block)) {
+			iter->section = NULL;
+			iter->edid = NULL;
+			return NULL;
+		}
+
+		/* next block in section */
+		iter->idx += sizeof(struct displayid_block) + block->num_bytes;
+
+		block = __displayid_iter_block(iter);
+		if (block)
+			return block;
+	}
+
+	for (;;) {
+		iter->section = drm_find_displayid_extension(iter->edid,
+							     &iter->length,
+							     &iter->idx,
+							     &iter->ext_index);
+		if (!iter->section) {
+			iter->edid = NULL;
+			return NULL;
+		}
+
+		iter->idx += sizeof(struct displayid_hdr);
+
+		block = __displayid_iter_block(iter);
+		if (block)
+			return block;
+	}
+}
+
+void displayid_iter_end(struct displayid_iter *iter)
+{
+	memset(iter, 0, sizeof(*iter));
+}
diff --git a/include/drm/drm_displayid.h b/include/drm/drm_displayid.h
index 3c6db22a518a..27e06c98db17 100644
--- a/include/drm/drm_displayid.h
+++ b/include/drm/drm_displayid.h
@@ -108,4 +108,22 @@ const u8 *drm_find_displayid_extension(const struct edid *edid,
 				       int *length, int *idx,
 				       int *ext_index);
 
+/* DisplayID iteration */
+struct displayid_iter {
+	const struct edid *edid;
+
+	const u8 *section;
+	int length;
+	int idx;
+	int ext_index;
+};
+
+void displayid_iter_edid_begin(const struct edid *edid,
+			       struct displayid_iter *iter);
+const struct displayid_block *
+__displayid_iter_next(struct displayid_iter *iter);
+#define displayid_iter_for_each(__block, __iter) \
+	while (((__block) = __displayid_iter_next(__iter)))
+void displayid_iter_end(struct displayid_iter *iter);
+
 #endif
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
