Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 48162206D1E
	for <lists+dri-devel@lfdr.de>; Wed, 24 Jun 2020 08:58:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA943890BD;
	Wed, 24 Jun 2020 06:58:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A100689C3F;
 Wed, 24 Jun 2020 06:58:02 +0000 (UTC)
IronPort-SDR: 37t68HRzfxbLSyVMU102/d0Fiqj4LsE0Bzz8dnKGTv78U5pocjW3rBk7wyy0KzwFH30O1FjQM7
 kgkcsimq/0ig==
X-IronPort-AV: E=McAfee;i="6000,8403,9661"; a="132782656"
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="132782656"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2020 23:58:02 -0700
IronPort-SDR: CDCf9s/yESMye4vWUvEPPdVo2l5G7EeyCVJtFlAsjUbi/cWV5Z+rjPnOatBjvVHw+jc/s3Nhz7
 6R8gUBiO0v1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,274,1589266800"; d="scan'208";a="301525052"
Received: from unknown (HELO joshikun.iind.intel.com) ([10.223.74.209])
 by fmsmga004.fm.intel.com with ESMTP; 23 Jun 2020 23:57:59 -0700
From: Kunal Joshi <kunal1.joshi@intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v6 1/3] drm: Add helper to compare edids.
Date: Wed, 24 Jun 2020 00:27:54 +0530
Message-Id: <20200623185756.19502-2-kunal1.joshi@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200623185756.19502-1-kunal1.joshi@intel.com>
References: <20200623185756.19502-1-kunal1.joshi@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, daniel.vetter@intel.com,
 arkadiusz.hiler@intel.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>

Many drivers would benefit from using
drm helper to compare edid, rather
than bothering with own implementation.

v2: Added documentation for this function.

Signed-off-by: Stanislav Lisovskiy <stanislav.lisovskiy@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 33 +++++++++++++++++++++++++++++++++
 include/drm/drm_edid.h     |  9 +++++++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index d8372d63851b..34cabfddcdd3 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1615,6 +1615,39 @@ static bool drm_edid_is_zero(const u8 *in_edid, int length)
 	return true;
 }
 
+/**
+ * drm_edid_are_equal - compare two edid blobs.
+ * @edid1: pointer to first blob
+ * @edid2: pointer to second blob
+ * This helper can be used during probing to determine if
+ * edid had changed.
+ */
+bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2)
+{
+	int edid1_len, edid2_len;
+	bool edid1_present = edid1 != NULL;
+	bool edid2_present = edid2 != NULL;
+
+	if (edid1_present != edid2_present)
+		return false;
+
+	if (edid1) {
+
+		edid1_len = EDID_LENGTH * (1 + edid1->extensions);
+		edid2_len = EDID_LENGTH * (1 + edid2->extensions);
+
+		if (edid1_len != edid2_len)
+			return false;
+
+		if (memcmp(edid1, edid2, edid1_len))
+			return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL(drm_edid_are_equal);
+
+
 /**
  * drm_edid_block_valid - Sanity check the EDID block (base or extension)
  * @raw_edid: pointer to raw EDID block
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index 34b15e3d070c..5c26cc65b786 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,6 +359,15 @@ drm_load_edid_firmware(struct drm_connector *connector)
 }
 #endif
 
+/**
+ * drm_edid_are_equal - compare two edid blobs.
+ * @edid1: pointer to first blob
+ * @edid2: pointer to second blob
+ * This helper can be used during probing to determine if
+ * edid had changed.
+ */
+bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
+
 int
 drm_hdmi_avi_infoframe_from_display_mode(struct hdmi_avi_infoframe *frame,
 					 struct drm_connector *connector,
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
