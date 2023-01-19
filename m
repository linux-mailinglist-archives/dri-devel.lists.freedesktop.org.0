Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D12673DD7
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 16:46:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 834BA10E990;
	Thu, 19 Jan 2023 15:46:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 668CD10E990;
 Thu, 19 Jan 2023 15:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674143197; x=1705679197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=P8EZTaglYNl9iHhKLUXYvrIHXSliZpOQLa33fyK/Uj4=;
 b=lptUjfeH4SSjponDajDi+AnvQdd48yOiBxli+pg2xhbHc9WAiwCttqq8
 Zm/mH8b37c1fs2JztcxeTb1Biu2IGJAgwQ/dIKPWudXvigoTPdwNuV3KU
 aPO6pWCkRZA7G+p5jpG6vWpVSWS5AZQBdM41JhojnRHIA/oRKMS7aODKG
 zn0HAnZmPZMrBo0b6+M8UPlIYtT61fFJRwPnMOHMStTtUVLxrV33Vg6da
 c6i6C5RWXlpTmXAtn2o3gFlGCXO+TzqsGFe5VtW+FyB0A3gw9l7/A8R81
 8Mg4qVHnE4uNofVOqxB7SfCjRF6kiYBUIzkk6qL+XDW/Q9mqSy34jvEYv A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="326599838"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="326599838"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 07:46:36 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10595"; a="660242626"
X-IronPort-AV: E=Sophos;i="5.97,229,1669104000"; d="scan'208";a="660242626"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.157])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jan 2023 07:46:34 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: split HDMI VSDB info and mode parsing
Date: Thu, 19 Jan 2023 17:46:28 +0200
Message-Id: <20230119154628.953419-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <7c912a01272a6203673c04eec13158051aafc7dd.1672826282.git.jani.nikula@intel.com>
References: <7c912a01272a6203673c04eec13158051aafc7dd.1672826282.git.jani.nikula@intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
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

