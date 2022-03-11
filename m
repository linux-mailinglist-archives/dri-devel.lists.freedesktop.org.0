Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F6AE4D5729
	for <lists+dri-devel@lfdr.de>; Fri, 11 Mar 2022 02:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F2A3610E5E0;
	Fri, 11 Mar 2022 01:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3F7710E5E0;
 Fri, 11 Mar 2022 01:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646960942; x=1678496942;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=7ESHPoacAdBeDo43OsWrmX3XTZyAYNJnfBb3s52sSqQ=;
 b=Jc1z7Cl9w8l/+HBKCYN/iHm3/8ce0OYGjU2B0a53TTMuGMsHhuzx+6uL
 tkzPNq4EDdd4gV9FKi5jmeWbYSDnCYff5fk/8aGWSpInAD8rujEbnqZ5Z
 cM6AQ0skQvrAvnMDtNMmULg26nU82QC6D/2PRXIdAGyIeSGnUExV11M5F
 4b2iQoO5ngn4ep4MBwbtUJUJ3S+2fscc9eriSAqSeCJVKaLkwntfbASD7
 ARoc2iSE6kNRyDLbbQi8DUHy5gC1l3bwwB/KRkr86e77clutyEWhuk5GZ
 12lzwXXlq+CdfffNc+FDXAZ4GeQ3WgR/LcK3XiMYUUqGNYj5kNPJEoRfB w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10282"; a="255196088"
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="255196088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2022 17:08:39 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,172,1643702400"; d="scan'208";a="781701052"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga006.fm.intel.com with ESMTP; 10 Mar 2022 17:08:37 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v6 3/5] drm/edid: read HF-EEODB ext block
Date: Fri, 11 Mar 2022 09:22:16 +0800
Message-Id: <20220311012218.19025-4-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220311012218.19025-1-shawn.c.lee@intel.com>
References: <20220311012218.19025-1-shawn.c.lee@intel.com>
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
Cc: cooper.chiou@intel.com, william.tseng@intel.com, jani.nikula@intel.com,
 intel-gfx@lists.freedesktop.org, ankit.k.nautiyal@intel.com,
 Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to HDMI 2.1 spec.

"The HDMI Forum EDID Extension Override Data Block (HF-EEODB)
is utilized by Sink Devices to provide an alternate method to
indicate an EDID Extension Block count larger than 1, while
avoiding the need to present a VESA Block Map in the first
E-EDID Extension Block."

It is a mandatory for HDMI 2.1 protocol compliance as well.
This patch help to know how many HF_EEODB blocks report by sink
and read allo HF_EEODB blocks back.

v2: support to find CEA block, check EEODB block format, and return
    available block number in drm_edid_read_hf_eeodb_blk_count().

Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Ville Syrjala <ville.syrjala@linux.intel.com>
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_connector.c |  8 +++-
 drivers/gpu/drm/drm_edid.c      | 71 +++++++++++++++++++++++++++++++--
 include/drm/drm_edid.h          |  2 +-
 3 files changed, 74 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2f..16011023c12e 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2129,7 +2129,7 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 				       const struct edid *edid)
 {
 	struct drm_device *dev = connector->dev;
-	size_t size = 0;
+	size_t size = 0, hf_eeodb_blk_count;
 	int ret;
 	const struct edid *old_edid;
 
@@ -2137,8 +2137,12 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 	if (connector->override_edid)
 		return 0;
 
-	if (edid)
+	if (edid) {
 		size = EDID_LENGTH * (1 + edid->extensions);
+		hf_eeodb_blk_count = drm_edid_read_hf_eeodb_blk_count(edid);
+		if (hf_eeodb_blk_count)
+			size = EDID_LENGTH * (1 + hf_eeodb_blk_count);
+	}
 
 	/* Set the display info, using edid if available, otherwise
 	 * resetting the values to defaults. This duplicates the work
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 7717bf86c07d..9f7fcecae3a2 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1992,6 +1992,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 {
 	int i, j = 0, valid_extensions = 0;
 	u8 *edid, *new;
+	size_t hf_eeodb_blk_count;
 	struct edid *override;
 
 	override = drm_get_override_edid(connector);
@@ -2051,7 +2052,35 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		}
 
 		kfree(edid);
+		return (struct edid *)new;
+	}
+
+	hf_eeodb_blk_count = drm_edid_read_hf_eeodb_blk_count((struct edid *)edid);
+	if (hf_eeodb_blk_count >= 2) {
+		new = krealloc(edid, (hf_eeodb_blk_count + 1) * EDID_LENGTH, GFP_KERNEL);
+		if (!new)
+			goto out;
 		edid = new;
+
+		valid_extensions = hf_eeodb_blk_count - 1;
+		for (j = 2; j <= hf_eeodb_blk_count; j++) {
+			u8 *block = edid + j * EDID_LENGTH;
+
+			for (i = 0; i < 4; i++) {
+				if (get_edid_block(data, block, j, EDID_LENGTH))
+					goto out;
+				if (drm_edid_block_valid(block, j, false, NULL))
+					break;
+			}
+
+			if (i == 4)
+				valid_extensions--;
+		}
+
+		if (valid_extensions != hf_eeodb_blk_count - 1) {
+			DRM_ERROR("Not able to retrieve proper EDID contain HF-EEODB data.\n");
+			goto out;
+		}
 	}
 
 	return (struct edid *)edid;
@@ -3315,15 +3344,17 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
 #define VIDEO_BLOCK     0x02
 #define VENDOR_BLOCK    0x03
 #define SPEAKER_BLOCK	0x04
-#define HDR_STATIC_METADATA_BLOCK	0x6
-#define USE_EXTENDED_TAG 0x07
-#define EXT_VIDEO_CAPABILITY_BLOCK 0x00
+#define EXT_VIDEO_CAPABILITY_BLOCK	0x00
+#define HDR_STATIC_METADATA_BLOCK	0x06
+#define USE_EXTENDED_TAG		0x07
 #define EXT_VIDEO_DATA_BLOCK_420	0x0E
-#define EXT_VIDEO_CAP_BLOCK_Y420CMDB 0x0F
+#define EXT_VIDEO_CAP_BLOCK_Y420CMDB	0x0F
+#define EXT_VIDEO_HF_EEODB_DATA_BLOCK	0x78
 #define EDID_BASIC_AUDIO	(1 << 6)
 #define EDID_CEA_YCRCB444	(1 << 5)
 #define EDID_CEA_YCRCB422	(1 << 4)
 #define EDID_CEA_VCDB_QS	(1 << 6)
+#define HF_EEODB_LENGTH		2
 
 /*
  * Search EDID for CEA extension block.
@@ -4274,9 +4305,41 @@ static bool cea_db_is_y420vdb(const u8 *db)
 	return true;
 }
 
+static bool cea_db_is_hdmi_forum_eeodb(const u8 *db)
+{
+	if (cea_db_tag(db) != USE_EXTENDED_TAG)
+		return false;
+
+	if (cea_db_payload_len(db) != HF_EEODB_LENGTH)
+		return false;
+
+	if (cea_db_extended_tag(db) != EXT_VIDEO_HF_EEODB_DATA_BLOCK)
+		return false;
+
+	return true;
+}
+
 #define for_each_cea_db(cea, i, start, end) \
 	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
 
+size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid)
+{
+	const u8 *cea;
+	int i, start, end, ext_index = 0;
+
+	if (edid->extensions) {
+		cea = drm_find_cea_extension(edid, &ext_index);
+
+		if (cea && !cea_db_offsets(cea, &start, &end))
+			for_each_cea_db(cea, i, start, end)
+				if (cea_db_is_hdmi_forum_eeodb(&cea[i]))
+					return cea[i + 2];
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(drm_edid_read_hf_eeodb_blk_count);
+
 static void drm_parse_y420cmdb_bitmap(struct drm_connector *connector,
 				      const u8 *db)
 {
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 144c495b99c4..5549da7bd7be 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -592,6 +592,6 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 			      u8 video_code);
 const u8 *drm_find_edid_extension(const struct edid *edid,
 				  int ext_id, int *ext_index);
-
+size_t drm_edid_read_hf_eeodb_blk_count(const struct edid *edid);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.17.1

