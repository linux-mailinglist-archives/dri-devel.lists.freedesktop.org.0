Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9583F673E7A
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 17:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E0A210E9A3;
	Thu, 19 Jan 2023 16:19:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2615F10E996;
 Thu, 19 Jan 2023 16:19:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674145168; x=1705681168;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pOhFRmgeq5MOBaiVkEN73ObeOaNacMiPrY94Br9vTiI=;
 b=IY6JJAyq4ITk/+R/1mOL4FoiTMZwAmWdYKp5fxwT/1kQtv/ZYOz12M0z
 odxNjj3QrnWcTHfOZK4l+MIF7Rln0QtMDreR90UhMUn1xXchQs8u364J3
 m3jr8Vju5eLj/vM05oKlkGaRXYcuA2SQcLpquO8ULIyZKVMDFFzW5/unM
 f1Bbkjh+8HOQIHqNeqqS31g2OJODO9dgleRVDOUPzBySitzOgZN+F1lvH
 dyVK17jsUdXbO90F2BtoIMi2uaBsAwSF6+PdBAPfxeLMY9MMqju5bMBgn
 YPMMuQ2fkV8y0p5sNOCcqXlvVKbBY49d9siI8JSJ8sz+ddtpJmNN1SGtQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="325372809"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="325372809"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:13 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660256738"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="660256738"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 08:19:11 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v8 1/8] drm/edid: split HDMI VSDB info and mode parsing
Date: Thu, 19 Jan 2023 18:18:54 +0200
Message-Id: <238e15f7ab15a86f7fd1812271dcaec9bc6e1506.1674144945.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1674144945.git.jani.nikula@intel.com>
References: <cover.1674144945.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Separate the parsing of display info and modes from the HDMI VSDB. This
is prerequisite work for overall better separation of the two parsing
steps.

The info parsing is about figuring out whether the sink supports HDMI
infoframes. Since they were added in HDMI 1.4, assume the sink supports
HDMI infoframes if it has the HDMI_Video_present bit set (introduced in
HDMI 1.4). For details, see commit f1781e9bb2dd ("drm/edid: Allow HDMI
infoframe without VIC or S3D").

The logic is not exactly the same, but since it was somewhat heuristic
to begin with, assume this is close enough.

v2:
- Simplify to only check HDMI_Video_present bit (Ville)
- Drop cea_db_raw_size() helper (Ville)

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index e8b67f3f5c91..ee453e39562a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4713,7 +4713,6 @@ static int hdmi_vsdb_latency_length(const u8 *db)
 static int
 do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
 {
-	struct drm_display_info *info = &connector->display_info;
 	int modes = 0, offset = 0, i, multi_present = 0, multi_len;
 	u8 vic_len, hdmi_3d_len = 0;
 	u16 mask;
@@ -4831,8 +4830,6 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
 	}
 
 out:
-	if (modes > 0)
-		info->has_hdmi_infoframe = true;
 	return modes;
 }
 
@@ -6153,6 +6150,7 @@ static void drm_parse_hdmi_deep_color_info(struct drm_connector *connector,
 	}
 }
 
+/* HDMI Vendor-Specific Data Block (HDMI VSDB, H14b-VSDB) */
 static void
 drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 {
@@ -6166,6 +6164,15 @@ drm_parse_hdmi_vsdb_video(struct drm_connector *connector, const u8 *db)
 	if (len >= 7)
 		info->max_tmds_clock = db[7] * 5000;
 
+	/*
+	 * Try to infer whether the sink supports HDMI infoframes.
+	 *
+	 * HDMI infoframe support was first added in HDMI 1.4. Assume the sink
+	 * supports infoframes if HDMI_Video_present is set.
+	 */
+	if (len >= 8 && db[8] & BIT(5))
+		info->has_hdmi_infoframe = true;
+
 	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] HDMI: DVI dual %d, max TMDS clock %d kHz\n",
 		    connector->base.id, connector->name,
 		    info->dvi_dual, info->max_tmds_clock);
-- 
2.34.1

