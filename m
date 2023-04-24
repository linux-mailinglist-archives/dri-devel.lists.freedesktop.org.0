Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E9E136D09EF
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:40:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0C7010EEDF;
	Thu, 30 Mar 2023 15:40:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE74410EEDE;
 Thu, 30 Mar 2023 15:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190826; x=1711726826;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V0kGArqC6sg6/LpD4tfBM6qpSA9zuWWvJU9RuLFuH44=;
 b=UYGusATTVow4uU3uBbiD0YLjRWpp3elMHiw5qe8Cf6XrgdRSLRlV1umQ
 7fw0yoD4vfQNjlRD4hkKTgMqNQAuvYlQCV6NcId1BStub1VaffiOpeiiK
 +MLRj7QID9AElmmhDBIJ4x/FZeGMLCLP1UUlaHnBjAuIuND1435P17jEu
 tZ2PKPimEuKM1YDNNMcRA30a/0+4i3MTKXvyFkSLBzz3RQV6zEtjcV8uY
 SuzmOVySUx1FpkZDCLU9va0vPdLbbHTFoxyTb7vTTltd6byTLw4LHzFMG
 yP1W5OrN2BYDz9uT6ealUZtfIvKkFDZMU/UTKWardtx2J3md6H5MQCcNE g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="427480513"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="427480513"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="795702251"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="795702251"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] drm/edid: parse display info has_audio similar to
 is_hdmi
Date: Thu, 30 Mar 2023 18:39:38 +0300
Message-Id: <cfcb90eb4d7ba383ee4550013bd12404d978c850.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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

Since we already iterate everything that's needed for determining audio,
reduce the need to call drm_detect_monitor_audio() by storing has_audio
to connector info.

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
index 7b5048516185..c8be6a343589 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -653,6 +653,14 @@ struct drm_display_info {
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

