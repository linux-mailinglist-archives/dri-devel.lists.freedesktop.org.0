Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9BA4BF9CD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:50:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A928E10E799;
	Tue, 22 Feb 2022 13:50:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD2B410E796
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Feb 2022 13:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645537830; x=1677073830;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=pQquwuJ8xneAE1yX5SPHppqMCFOSihW8YPdNh1541Vo=;
 b=lBXxSqXh51vor02QL7yKazNYo3tdiZFtkoeGOlogddJaCvnxf6iEobHD
 mHe2nxqABDr9Kfeeq61kDzTanxEUAFMbDEZgTYWNWFgJVrJrqDFdA5485
 5m4wBhQy/fZF8f6l9t2hPhk/aXYxJ+nSVQejF11MFNbln+n0WphpJue4A
 lWCOR2XEPxLhf7hU4zOWSlQ95yGGCvfu/Njg22XsHRdlGtpINk7Q69+RA
 JresujwpNlyaiwO7eVwRQIz4Dy/Ky012I/bQf9RI24BOLCCjlAMR8opLj
 F8EpRZ+hCq6zB9c8y62snjeODkEI3xLz/CWyP1v2Zi6MYO/h1T8FCHjn1 Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="338138775"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="338138775"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:50:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="638907925"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga004.jf.intel.com with ESMTP; 22 Feb 2022 05:50:29 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v2 2/3] drm/edid: read HF-EEODB ext block
Date: Tue, 22 Feb 2022 22:02:35 +0800
Message-Id: <20220222140236.6751-2-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220222140236.6751-1-shawn.c.lee@intel.com>
References: <20220222063819.5279-1-shawn.c.lee@intel.com>
 <20220222140236.6751-1-shawn.c.lee@intel.com>
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Support to read HF_EEODB block that request by HDMI 2.1 specification.

Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_connector.c |  5 ++-
 drivers/gpu/drm/drm_edid.c      | 76 ++++++++++++++++++++++++++++++---
 include/drm/drm_edid.h          |  2 +
 3 files changed, 77 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index a50c82bc2b2f..0f9e3ef00be7 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2137,8 +2137,11 @@ int drm_connector_update_edid_property(struct drm_connector *connector,
 	if (connector->override_edid)
 		return 0;
 
-	if (edid)
+	if (edid) {
 		size = EDID_LENGTH * (1 + edid->extensions);
+		if (drm_edid_is_hf_eeodb_blk_available(edid))
+			size = EDID_LENGTH * (1 + drm_edid_read_hf_eeodb_blk_size(edid));
+	}
 
 	/* Set the display info, using edid if available, otherwise
 	 * resetting the values to defaults. This duplicates the work
diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c83ef23757bd..f8514783d089 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1991,7 +1991,7 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 	void *data)
 {
 	int i, j = 0, valid_extensions = 0;
-	u8 *edid, *new;
+	u8 *edid, *new, ext_eeodb_blk_size;
 	struct edid *override;
 
 	override = drm_get_override_edid(connector);
@@ -2051,7 +2051,40 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 		}
 
 		kfree(edid);
+		return (struct edid *)new;
+	}
+
+	if (drm_edid_is_hf_eeodb_blk_available((struct edid *)edid)) {
+		ext_eeodb_blk_size = drm_edid_read_hf_eeodb_blk_size((struct edid *)edid);
+
+		// no more ext blk wait for read
+		if (ext_eeodb_blk_size <= 1)
+			return (struct edid *)edid;
+
+		new = krealloc(edid, (ext_eeodb_blk_size + 1) * EDID_LENGTH, GFP_KERNEL);
+		if (!new)
+			goto out;
 		edid = new;
+
+		valid_extensions = ext_eeodb_blk_size - 1;
+		for (j = 2; j <= ext_eeodb_blk_size; j++) {
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
+		if (valid_extensions != ext_eeodb_blk_size - 1) {
+			DRM_ERROR("Not able to retrieve proper EDID contain HF-EEODB data.\n");
+			goto out;
+		}
 	}
 
 	return (struct edid *)edid;
@@ -3315,15 +3348,17 @@ add_detailed_modes(struct drm_connector *connector, struct edid *edid,
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
@@ -4220,6 +4255,20 @@ static bool cea_db_is_hdmi_forum_vsdb(const u8 *db)
 	return oui(db[3], db[2], db[1]) == HDMI_FORUM_IEEE_OUI;
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
 static bool cea_db_is_vcdb(const u8 *db)
 {
 	if (cea_db_tag(db) != USE_EXTENDED_TAG)
@@ -4262,6 +4311,23 @@ static bool cea_db_is_y420vdb(const u8 *db)
 	return true;
 }
 
+bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid)
+{
+	const u8 *eeodb_header = (u8 *)edid + EDID_LENGTH + 4;
+
+	if (!edid->extensions)
+		return false;
+
+	return cea_db_is_hdmi_forum_eeodb(eeodb_header);
+}
+EXPORT_SYMBOL_GPL(drm_edid_is_hf_eeodb_blk_available);
+
+u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid)
+{
+	return ((u8 *)edid)[EDID_LENGTH + 6];
+}
+EXPORT_SYMBOL_GPL(drm_edid_read_hf_eeodb_blk_size);
+
 #define for_each_cea_db(cea, i, start, end) \
 	for ((i) = (start); (i) < (end) && (i) + cea_db_payload_len(&(cea)[(i)]) < (end); (i) += cea_db_payload_len(&(cea)[(i)]) + 1)
 
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 18f6c700f6d0..ba2812432ead 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -593,5 +593,7 @@ drm_display_mode_from_cea_vic(struct drm_device *dev,
 const u8 *drm_find_edid_extension(const struct edid *edid,
 				  int ext_id, int *ext_index);
 
+bool drm_edid_is_hf_eeodb_blk_available(const struct edid *edid);
+u8 drm_edid_read_hf_eeodb_blk_size(const struct edid *edid);
 
 #endif /* __DRM_EDID_H__ */
-- 
2.31.1

