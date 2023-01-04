Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8B965D03D
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F066410E548;
	Wed,  4 Jan 2023 10:06:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4D4A10E543;
 Wed,  4 Jan 2023 10:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826782; x=1704362782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aadkRcBHyWHFQ+8c3xBPCiqF5r0KK7uXEUe0XYqr30U=;
 b=F5fX1m4GD4VjszywAUtA19SODebdpOh+l2bbco1UKWdI7vldXx122/0R
 Yn5e7UQI0Psp/lPgOX4hgmZVF3m1YplMtTVbyu35ultdpBKMW3adIvT+U
 I14XC4d0o2vuz65h6zCnshiVdadeM1bKQ/LZWD2aFA4kFWjE5ooxyTI6w
 zFZdCXsdst/Zt1RFskQnf98k5/3oI0VbwGZ1eetIOlxUS3B3ugNSVhafd
 NU9tZbIfPvGz9DIixtexaX73lNKnI3VXPPMj4xkCg7shGKgjY/akp7hEA
 0covaxADHYx0oP3Jg2VaebCRDPV7Lp9FvBpemJEplq8yNC3EtQnnK2ZQ/ Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301588795"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="301588795"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:22 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762627641"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="762627641"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 09/22] drm/edid: fix and clarify HDMI VSDB audio latency
 parsing
Date: Wed,  4 Jan 2023 12:05:24 +0200
Message-Id: <80426772a2d2e17bebf6f58d99b7d0cf6260c2d6.1672826282.git.jani.nikula@intel.com>
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

Add helpers for Latency_Fields_Present and I_Latency_Fields_Present
bits, and fix the parsing:

- Respect specification regarding "I_Latency_Fields_Present shall be
  zero if Latency_Fields_Present is zero".

- Don't claim latency fields are present if the data block isn't big
  enough to hold them.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 27 +++++++++++++++++++--------
 1 file changed, 19 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 076ba125c38d..847076b29594 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4685,6 +4685,16 @@ static int add_3d_struct_modes(struct drm_connector *connector, u16 structure,
 	return modes;
 }
 
+static bool hdmi_vsdb_latency_present(const u8 *db)
+{
+	return db[8] & BIT(7);
+}
+
+static bool hdmi_vsdb_i_latency_present(const u8 *db)
+{
+	return hdmi_vsdb_latency_present(db) && db[8] & BIT(6);
+}
+
 /*
  * do_hdmi_vsdb_modes - Parse the HDMI Vendor Specific data block
  * @connector: connector corresponding to the HDMI sink
@@ -5357,6 +5367,7 @@ drm_parse_hdr_metadata_block(struct drm_connector *connector, const u8 *db)
 	}
 }
 
+/* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
 drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 {
@@ -5364,18 +5375,18 @@ drm_parse_hdmi_vsdb_audio(struct drm_connector *connector, const u8 *db)
 
 	if (len >= 6 && (db[6] & (1 << 7)))
 		connector->eld[DRM_ELD_SAD_COUNT_CONN_TYPE] |= DRM_ELD_SUPPORTS_AI;
-	if (len >= 8) {
-		connector->latency_present[0] = db[8] >> 7;
-		connector->latency_present[1] = (db[8] >> 6) & 1;
-	}
-	if (len >= 9)
+
+	if (len >= 10 && hdmi_vsdb_latency_present(db)) {
+		connector->latency_present[0] = true;
 		connector->video_latency[0] = db[9];
-	if (len >= 10)
 		connector->audio_latency[0] = db[10];
-	if (len >= 11)
+	}
+
+	if (len >= 12 && hdmi_vsdb_i_latency_present(db)) {
+		connector->latency_present[1] = true;
 		connector->video_latency[1] = db[11];
-	if (len >= 12)
 		connector->audio_latency[1] = db[12];
+	}
 
 	drm_dbg_kms(connector->dev,
 		    "[CONNECTOR:%d:%s] HDMI: latency present %d %d, video latency %d %d, audio latency %d %d\n",
-- 
2.34.1

