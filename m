Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE8865A9732
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 14:47:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 491A410E6F8;
	Thu,  1 Sep 2022 12:47:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B23B10E6F4;
 Thu,  1 Sep 2022 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662036458; x=1693572458;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cAnN00Irypgvt5T5PdIJoLjXtK163P34CCZW+84vROA=;
 b=cj+nTGBPEMSnZMJltjFnD+3DnN6bQdE86lQGJ7+i2WgG/Yris6sgpJrk
 9Y4JwmxH42dbVARV3AXqghFTSHbl28QnXgRj/ebs0sps3wH4sVV9zYNAB
 Fmk0ohf3hRYe2dgtFBbpN9eit9uZyI6ix2FklYAsnHe8QJF3LzoMJWF2L
 fKgnZeA4qgYJgOXOPJ+E/QtDsxVujDSzaqrjr00JNcPu4VkaTb37aNFwq
 jeb2Tq6yRq2CN4bRdUYVrwmvFSw2HUm+bVhOrVhsutd+GYIL5ZbRZtsOl
 hx8MwJtq3zM6qGbt6SzQEiZogCqXa1VtC5/cMePxt2HBwrbacZxGz9UxD g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="278720838"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="278720838"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="589485362"
Received: from jnikula-mobl4.fi.intel.com (HELO localhost) ([10.237.66.142])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 05:47:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/9] drm/edid: parse display info has_audio similar to is_hdmi
Date: Thu,  1 Sep 2022 15:47:03 +0300
Message-Id: <59682553399bacfbbfaf61faa5f29646570681c7.1662036058.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1662036058.git.jani.nikula@intel.com>
References: <cover.1662036058.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we already iterate everything that's needed for determining audio,
reduce the need to call drm_detect_monitor_audio() by storing has_audio
to connector info.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 6 ++++++
 include/drm/drm_connector.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 90a5e26eafa8..fe34ff98e5e9 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5994,6 +5994,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
 		if (edid_ext[3] & EDID_CEA_YCRCB422)
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+		if (edid_ext[3] & EDID_BASIC_AUDIO)
+			info->has_audio = true;
+
 	}
 	drm_edid_iter_end(&edid_iter);
 
@@ -6015,6 +6018,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_vcdb(connector, data);
 		else if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, data);
+		else if (cea_db_tag(db) == CTA_DB_AUDIO)
+			info->has_audio = true;
 	}
 	cea_db_iter_end(&iter);
 }
@@ -6141,6 +6146,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->max_tmds_clock = 0;
 	info->dvi_dual = false;
 	info->is_hdmi = false;
+	info->has_audio = false;
 	info->has_hdmi_infoframe = false;
 	info->rgb_quant_range_selectable = false;
 	memset(&info->hdmi, 0, sizeof(info->hdmi));
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 248206bbd975..a9f714612b44 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -597,6 +597,14 @@ struct drm_display_info {
 	 */
 	bool is_hdmi;
 
+	/**
+	 * @has_audio: True if the sink supports audio.
+	 *
+	 * This field shall be used instead of calling
+	 * drm_detect_monitor_audio() when possible.
+	 */
+	bool has_audio;
+
 	/**
 	 * @has_hdmi_infoframe: Does the sink support the HDMI infoframe?
 	 */
-- 
2.34.1

