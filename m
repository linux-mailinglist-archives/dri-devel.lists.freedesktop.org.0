Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F3C7699E22
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:45:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F01810EE9B;
	Thu, 16 Feb 2023 20:45:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D21F10EE9B;
 Thu, 16 Feb 2023 20:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676580331; x=1708116331;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fWQLM36xFe/f8V265Ntfscn/gUeqxgkD8nK1sBPooxY=;
 b=SrUihztvp+Jj6SfxStiK4Byvhkw56/s+uLOCIdp4wEaC+HjGhYn5y46R
 yziAKFFEJApcqLkMZ/4kU4beqpsVFLPzvBG2Ehv7ByvkyZljiaF4k4mFo
 16uym/famkIIbr/oBqRuSigxpjr4hvcu+Iry+/0N1p539satb/Owz/F2Y
 +wyYHeYEVj0mib4ylJvmlxRKyIRDYDqJEIsheEzaYXP/0G1QNAmsem1OY
 pyu2NG3PUEz0eJTulzMmr9bqttcaawvDUVkivozxjHymZCsByeHtvLpFF
 4/mIG9jWs6pHqzEb+/Sxe0WiqJG9Yj1faZQ96lutlEV7979TOOe5SpDLK Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394308504"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394308504"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 12:45:31 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670312111"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="670312111"
Received: from uwah-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.106])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:45:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/4] drm/edid: update non-desktop use also from DisplayID
Date: Thu, 16 Feb 2023 22:45:01 +0200
Message-Id: <de75b2edddd7d30216e4dd5699a064dc737688f5.1676580180.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676580180.git.jani.nikula@intel.com>
References: <cover.1676580180.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Iaroslav Boliukin <iam@lach.pw>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use the DisplayID 2.0 primary use case information to deduce whether
this is a head-mounted display, and should not be used for desktop.

Cc: Iaroslav Boliukin <iam@lach.pw>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 3d0a4da661bc..03ad53a1ba82 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -6433,6 +6433,29 @@ static void drm_reset_display_info(struct drm_connector *connector)
 	info->quirks = 0;
 }
 
+static void update_displayid_info(struct drm_connector *connector,
+				  const struct drm_edid *drm_edid)
+{
+	struct drm_display_info *info = &connector->display_info;
+	const struct displayid_block *block;
+	struct displayid_iter iter;
+
+	displayid_iter_edid_begin(drm_edid, &iter);
+	displayid_iter_for_each(block, &iter) {
+		if (displayid_version(&iter) == DISPLAY_ID_STRUCTURE_VER_20 &&
+		    (displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_VR ||
+		     displayid_primary_use(&iter) == PRIMARY_USE_HEAD_MOUNTED_AR))
+			info->non_desktop = true;
+
+		/*
+		 * We're only interested in the base section here, no need to
+		 * iterate further.
+		 */
+		break;
+	}
+	displayid_iter_end(&iter);
+}
+
 static void update_display_info(struct drm_connector *connector,
 				const struct drm_edid *drm_edid)
 {
@@ -6463,6 +6486,8 @@ static void update_display_info(struct drm_connector *connector,
 	info->color_formats |= DRM_COLOR_FORMAT_RGB444;
 	drm_parse_cea_ext(connector, drm_edid);
 
+	update_displayid_info(connector, drm_edid);
+
 	/*
 	 * Digital sink with "DFP 1.x compliant TMDS" according to EDID 1.3?
 	 *
-- 
2.34.1

