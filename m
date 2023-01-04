Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E231D65D044
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1889610E54D;
	Wed,  4 Jan 2023 10:06:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E07610E549;
 Wed,  4 Jan 2023 10:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826791; x=1704362791;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sc26HD6X+lG4vAhvKtT9zuofmC5p/WXI2wdtRZyM2gM=;
 b=f4aEjCT+x+vr3YKMjobiM1awVN/1JEGc2XYZ09Fk140kN/MwTx3UaAsX
 hW2d/jBqyDx1R/jxbQblgaF+QaMu6JEK/PfIM/IxSsIevXRLMqa+pQT1b
 QkiYwplNtYXa6AJXjSlw/zcoUJLMOdCtKcgeeMP5llKDZCFqwerk7Yck/
 tfqeNVmepK9HMnuh5wuojUvv6aDhtabfoZZzPtp8kDj18/khzh0fYeJRy
 gP8qAsnYlt/Z34EqEEw52z/qtIBxCC4/1HodY9Hv7Mk9beSCuVaoW/bEk
 Mrr+ra/QpuBd2i1aJklSr2yEYHD123BN6+3WjNwwoaB7cCN3wxjCnjKxG A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301588839"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="301588839"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762627686"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="762627686"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:29 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 11/22] drm/edid: split HDMI VSDB info and mode parsing
Date: Wed,  4 Jan 2023 12:05:26 +0200
Message-Id: <7c912a01272a6203673c04eec13158051aafc7dd.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

Separate the parsing of display info and modes from the HDMI VSDB. This
is prerequisite work for overall better separation of the two parsing
steps.

The info parsing is about figuring out whether the sink supports HDMI
infoframes. Since they were added in HDMI 1.4, assume the sink supports
HDMI infoframes if it uses HDMI 1.4 features in HDMI VSDB. For details,
see commit f1781e9bb2dd ("drm/edid: Allow HDMI infoframe without VIC or
S3D").

The logic is not exactly the same, but since it was somewhat heuristic
to begin with, assume this is close enough.

Add cea_db_raw_size() helper to get the size of the entire data block,
including tag and length. This is helpful for checking against specs
that define indexes from the start of the entire block, like here.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 39 +++++++++++++++++++++++++++++++++++---
 1 file changed, 36 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 93067b8dd9f6..5cb1d36ce48a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4717,7 +4717,6 @@ static int hdmi_vsdb_latency_length(const u8 *db)
 static int
 do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
 {
-	struct drm_display_info *info = &connector->display_info;
 	int modes = 0, offset = 0, i, multi_present = 0, multi_len;
 	u8 vic_len, hdmi_3d_len = 0;
 	u16 mask;
@@ -4835,8 +4834,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
 	}
 
 out:
-	if (modes > 0)
-		info->has_hdmi_infoframe = true;
 	return modes;
 }
 
@@ -4893,6 +4890,7 @@ static int cea_db_tag(const struct cea_db *db)
 	return db->tag_length >> 5;
 }
 
+/* Data block payload length excluding the tag and length byte */
 static int cea_db_payload_len(const void *_db)
 {
 	/* FIXME: Transition to passing struct cea_db * everywhere. */
@@ -4901,6 +4899,12 @@ static int cea_db_payload_len(const void *_db)
 	return db->tag_length & 0x1f;
 }
 
+/* Data block raw size including the tag and length byte */
+static int cea_db_raw_size(const void *db)
+{
+	return cea_db_payload_len(db) + 1;
+}
+
 static const void *cea_db_data(const struct cea_db *db)
 {
 	return db->data;
@@ -6159,6 +6163,32 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	}
 }
 
+/*
+ * Try to infer whether the sink supports HDMI infoframes.
+ *
+ * HDMI infoframe support was first added in HDMI 1.4. Assume the sink supports
+ * infoframes if the HDMI VSDB contains HDMI 1.4 features.
+ */
+static bool hdmi_vsdb_infoframe_support(struct drm_connector *connector, const u8 *db)
+{
+	int size = cea_db_raw_size(db);
+	int offset = 8;
+
+	if (offset < size)
+		offset += hdmi_vsdb_latency_length(db);
+
+	/* 3D_present */
+	if (offset < size && db[offset++] & BIT(7))
+		return true;
+
+	/* HDMI_VIC_LEN and HDMI_3D_LEN */
+	if (offset < size && db[offset])
+		return true;
+
+	return false;
+}
+
+/* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
 drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 {
@@ -6172,6 +6202,9 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	if (len >= 7)
 		info->max_tmds_clock = db[7] * 5000;
 
+	if (hdmi_vsdb_infoframe_support(connector, db))
+		info->has_hdmi_infoframe = true;
+
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
 		    connector->base.id, connector->name,
 		    info->dvi_dual, info->max_tmds_clock);
-- 
2.34.1

