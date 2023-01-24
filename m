Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A256967945C
	for <lists+dri-devel@lfdr.de>; Tue, 24 Jan 2023 10:42:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB87A10E243;
	Tue, 24 Jan 2023 09:42:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9747410E243;
 Tue, 24 Jan 2023 09:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1674553322; x=1706089322;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Twda73utHl39097F/6+syz4RFqg+yCCIhqXfvdLJlAs=;
 b=NjtXtWQQE5xeD+N//2Ej7Wg3vdw/8g7D6WXNOEZ8gXH6jWEB2+FxHypm
 Gn5OBCO/z3QD7Co+1lLgTSh8E5kaKADA/TYNrXVrO9i31AMhSHFR5xi6+
 2uuelNrhBvc6Z6ZXkcLYAjBe/37D0Bj+PlAHNCEoR8tCCsLm6x9bybqZ2
 UXgEA6MVqCllvFzavYjU0Xui3fJX3rC/CNPJ126XP+vyNFKBKIwiEQ99N
 4gQ+rdkcF1En8ZarA1Z8kdJ0NLHjwTPsfxSo+b0ZS7WZyQ439K141gGWg
 C5jkaAz+SDkZ3HpOjJ1wREvjxLLWHfjCtnhW3aBhzSSaskckwK/8QS0HH g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="324934303"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="324934303"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 01:42:01 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10599"; a="655362387"
X-IronPort-AV: E=Sophos;i="5.97,242,1669104000"; d="scan'208";a="655362387"
Received: from pesir-mobl.ger.corp.intel.com (HELO localhost) ([10.252.57.197])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Jan 2023 01:41:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/edid: reverse display info preserve/clear logic,
 defaulting to clear
Date: Tue, 24 Jan 2023 11:41:52 +0200
Message-Id: <20230124094154.2282778-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of explicitly clearing individual struct drm_display_info
members manually, default to clearing everything and preserving the
members that currently do need to be preserved manually. The goal is to
avoid adding new members while forgetting to clear them.

Use a little bit of macro magic to avoid duplicating the types. There
should be no functional changes.

The long term goal is to move the members that are modified by drivers
and need to be preserved out of display info.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 50 ++++++++++++++++++--------------------
 1 file changed, 23 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3d0a4da661bc..6dc4591da0bc 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6401,36 +6401,32 @@ static void drm_update_mso(struct drm_connector *connector,
 static void drm_reset_display_info(struct drm_connector *connector)
 {
 	struct drm_display_info *info = &connector->display_info;
-
-	info->width_mm = 0;
-	info->height_mm = 0;
-
-	info->bpc = 0;
-	info->color_formats = 0;
-	info->cea_rev = 0;
-	info->max_tmds_clock = 0;
-	info->dvi_dual = false;
-	info->is_hdmi = false;
-	info->has_hdmi_infoframe = false;
-	info->rgb_quant_range_selectable = false;
-	memset(&info->hdmi, 0, sizeof(info->hdmi));
-
-	info->edid_hdmi_rgb444_dc_modes = 0;
-	info->edid_hdmi_ycbcr444_dc_modes = 0;
-
-	info->non_desktop = 0;
-	memset(&info->monitor_range, 0, sizeof(info->monitor_range));
-	memset(&info->luminance_range, 0, sizeof(info->luminance_range));
-
-	info->mso_stream_count = 0;
-	info->mso_pixel_overlap = 0;
-	info->max_dsc_bpp = 0;
+#define COPY_MEMBER(__member) __auto_type __member = info->__member
+	COPY_MEMBER(subpixel_order);
+	COPY_MEMBER(panel_orientation);
+	COPY_MEMBER(bus_formats);
+	COPY_MEMBER(num_bus_formats);
+	COPY_MEMBER(bus_flags);
+#undef COPY_MEMBER
 
 	kfree(info->vics);
-	info->vics = NULL;
-	info->vics_len = 0;
 
-	info->quirks = 0;
+	memset(info, 0, sizeof(*info));
+
+	/*
+	 * Preserve certain members across display info resets. These are
+	 * modified by drivers, and do not originate from the EDID. Please try
+	 * to avoid adding more.
+	 *
+	 * FIXME: Move all of these to a separate drm_connector sub-struct, and
+	 * make struct drm_display_info purely about info originating from the
+	 * EDID.
+	 */
+	info->subpixel_order = subpixel_order;
+	info->panel_orientation = panel_orientation;
+	info->bus_formats = bus_formats; /* Note: pointer copy! */
+	info->num_bus_formats = num_bus_formats;
+	info->bus_flags = bus_flags;
 }
 
 static void update_display_info(struct drm_connector *connector,
-- 
2.34.1

