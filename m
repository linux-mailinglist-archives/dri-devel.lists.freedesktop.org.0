Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EE1B71596E
	for <lists+dri-devel@lfdr.de>; Tue, 30 May 2023 11:08:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7331810E30F;
	Tue, 30 May 2023 09:08:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A33410E30F;
 Tue, 30 May 2023 09:08:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685437717; x=1716973717;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cuhS04zF2ukyVE1jEsJShUL5OMXe2hKkH9nqpjh2DiQ=;
 b=RQBijGhNOBG9h9qyuMZ7gNEhp1uEFjRv4/yYhcLSMLeOJu5+INnhKY7N
 GwCTv8HVexISWFzSj+IVbu88g4v05Zx4kFaz0d7Upp7hND7086uukSXrk
 XbZ/5+ZCQ0maxvPHeVbEyiHL87L0V3V5U7Qa0qXewkM8fAd1spA6mi8zm
 lmk0HZnRXdopjJ+PwDGDa3RYSJtoNcbqiF6Ud74WMO019ytJt5On3qPSe
 S9kaZt93yYLa+pMFerI7A3FRo9UKPsD4vYaPLdMsB/ZyfJrIAgOebsFc9
 mONaGryBRj0DUv/qCf38vDEA0jFsCSjbj/KExIZxbJG9thOW2SLFyT5Fb w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="441218549"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="441218549"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2023 02:08:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10725"; a="1036516293"
X-IronPort-AV: E=Sophos;i="6.00,203,1681196400"; d="scan'208";a="1036516293"
Received: from kleve-mobl1.ger.corp.intel.com (HELO localhost) ([10.252.47.8])
 by fmsmga005-auth.fm.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2023 02:08:34 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 01/13] drm/edid: parse display info has_audio similar to
 is_hdmi
Date: Tue, 30 May 2023 12:08:13 +0300
Message-Id: <391a93b25c6bcbb39854aaa2813570cfb1580ed9.1685437500.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1685437500.git.jani.nikula@intel.com>
References: <cover.1685437500.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, Ankit Nautiyal <ankit.k.nautiyal@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we already iterate everything that's needed for determining audio,
reduce the need to call drm_detect_monitor_audio() by storing has_audio
to connector info.

Reviewed-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c  | 6 ++++++
 include/drm/drm_connector.h | 8 ++++++++
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 0454da505687..813ce00a106a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6243,6 +6243,9 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR444;
 		if (edid_ext[3] & EDID_CEA_YCRCB422)
 			info->color_formats |= DRM_COLOR_FORMAT_YCBCR422;
+		if (edid_ext[3] & EDID_BASIC_AUDIO)
+			info->has_audio = true;
+
 	}
 	drm_edid_iter_end(&edid_iter);
 
@@ -6268,6 +6271,8 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 			drm_parse_hdr_metadata_block(connector, data);
 		else if (cea_db_tag(db) == CTA_DB_VIDEO)
 			parse_cta_vdb(connector, db);
+		else if (cea_db_tag(db) == CTA_DB_AUDIO)
+			info->has_audio = true;
 	}
 	cea_db_iter_end(&iter);
 
@@ -6424,6 +6429,7 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->max_tmds_clock = 0;
 	info->dvi_dual = false;
 	info->is_hdmi = false;
+	info->has_audio = false;
 	info->has_hdmi_infoframe = false;
 	info->rgb_quant_range_selectable = false;
 	memset(&info->hdmi, 0, sizeof(info->hdmi));
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index e6478fafa6b0..e143fef07de9 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -658,6 +658,14 @@ struct drm_display_info {
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
2.39.2

