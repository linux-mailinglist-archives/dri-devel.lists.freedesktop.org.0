Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 912976D0A0B
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 17:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCC9210EEF1;
	Thu, 30 Mar 2023 15:41:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CF810EF01;
 Thu, 30 Mar 2023 15:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1680190865; x=1711726865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+odI9wSatmFudV/H+g3iH+5eySvOA5p/7nmzWIxTPdA=;
 b=XM7jBojV0acZSAI18GJ6A7Z/SgI5BnGaX28RQLbWSFXjdOxy0FkxQkY0
 C/NG6Sf5Ue4W7CT1o8YI/4blMR4pwQxWJB1fAU27FAu4CTNPibHNTiQi3
 PafjHOBccOIBccWWyXk5KQq0LQC2RvQ4nlo93r41H7mhrZLPrul1NeJF/
 YVRq5rQSqlS9nFU6ej202rZCAXyfmkEU20dMVk/4lMA1rHfhKQ0iH2tGq
 eALN2LT5CGzLpURoB4AIJlptZhgw8EtP42hL/W9NJryxSPXvZMMIXSmH3
 MRaQ/TkZ5W71Go4qK2pv0zfIojBr1ZSzwRYPx2iilLRRT65D8Lerkbhdu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="329722307"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="329722307"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10665"; a="687294954"
X-IronPort-AV: E=Sophos;i="5.98,305,1673942400"; d="scan'208";a="687294954"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2023 08:40:45 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 11/12] drm/rockchip: convert to using has_audio from
 display_info
Date: Thu, 30 Mar 2023 18:39:48 +0300
Message-Id: <a7eba2b4d00765b668937cb2430fd23057e6a873.1680190534.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1680190534.git.jani.nikula@intel.com>
References: <cover.1680190534.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Sandy Huang <hjc@rock-chips.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer the parsed results for has_audio in display info over calling
drm_detect_monitor_audio().

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: Heiko Stübner <heiko@sntech.de>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 4 ++--
 drivers/gpu/drm/rockchip/inno_hdmi.c   | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index b6afe3786b74..4a4cf4354e27 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -272,10 +272,10 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
 				  edid->width_cm, edid->height_cm);
 
-		dp->sink_has_audio = drm_detect_monitor_audio(edid);
-
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
+
+		dp->sink_has_audio = connector->display_info.has_audio;
 	}
 	mutex_unlock(&dp->lock);
 
diff --git a/drivers/gpu/drm/rockchip/inno_hdmi.c b/drivers/gpu/drm/rockchip/inno_hdmi.c
index f51774866f41..98691aef1be5 100644
--- a/drivers/gpu/drm/rockchip/inno_hdmi.c
+++ b/drivers/gpu/drm/rockchip/inno_hdmi.c
@@ -564,10 +564,11 @@ static int inno_hdmi_connector_get_modes(struct drm_connector *connector)
 
 	edid = drm_get_edid(connector, hdmi->ddc);
 	if (edid) {
-		hdmi->hdmi_data.sink_has_audio = drm_detect_monitor_audio(edid);
 		drm_connector_update_edid_property(connector, edid);
 		ret = drm_add_edid_modes(connector, edid);
 		kfree(edid);
+
+		hdmi->hdmi_data.sink_has_audio = connector->display_info.has_audio;
 	}
 
 	return ret;
-- 
2.39.2

