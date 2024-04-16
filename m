Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 538AA8A6C2C
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7694F112C8E;
	Tue, 16 Apr 2024 13:23:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bbk3X60R";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D406112C8D
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273825; x=1744809825;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oG2GtV3nt+5QkO7h/AQtyjTIPvu8JRijgCsInOXsQmY=;
 b=bbk3X60RDIlFKh+jaBTx6pcSL+nj8u1MDFBWzcYZTIiW7TpbmA6k5LPJ
 u5VqqSrtGhOCsJQ8Min1CcfmuniIFtT90t2Kaf7Hlou6XkhHk03IB0AZR
 jvETlCybrHnY2MPPVgf3ofNSUPw2/Bmuvp42l7xb3XbMqJnVlO1Bh1BLJ
 AGDXiTvfli4DGym1dvJJK2H+xqFQQeCXSz1erxPW+6kfN/2D5MtaASJdq
 hKEeWNUvmZtunWGU9DP2W0Tx+IeXGIwSyXTKu0/+uwFfQJuRz/WgsrLf3
 J/iv4ePlNk2HLbPSR0kVjd7shNwtPBSKvfc6rj8MWHdKxzA8StsId2EAF Q==;
X-CSE-ConnectionGUID: 4p6RYq0KSoGc4ifSHdfxIA==
X-CSE-MsgGUID: Jxl0nMIzSEWxhkNf40Fjbw==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="20131399"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="20131399"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:43 -0700
X-CSE-ConnectionGUID: N7hGG/BORvyEuSp7FzE8Ig==
X-CSE-MsgGUID: KQolT1WkSp6IgVi/HsO/bg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="27055466"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:40 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
Subject: [PATCH 13/15] drm/rockchip: cdn-dp: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:27 +0300
Message-Id: <59d2feb9f8b28d1a1cf49077a35941aa9b3d36af.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 33 +++++++++++++++-----------
 drivers/gpu/drm/rockchip/cdn-dp-core.h |  2 +-
 2 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a855c45ae7f3..9e3d7cb84c5d 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -262,20 +262,21 @@ static const struct drm_connector_funcs cdn_dp_atomic_connector_funcs = {
 static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 {
 	struct cdn_dp_device *dp = connector_to_dp(connector);
-	struct edid *edid;
 	int ret = 0;
 
 	mutex_lock(&dp->lock);
-	edid = dp->edid;
-	if (edid) {
+
+	if (dp->drm_edid) {
+		/* FIXME: get rid of drm_edid_raw() */
+		const struct edid *edid = drm_edid_raw(dp->drm_edid);
+
 		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
 				  edid->width_cm, edid->height_cm);
 
-		dp->sink_has_audio = drm_detect_monitor_audio(edid);
-
-		drm_connector_update_edid_property(connector, edid);
-		ret = drm_add_edid_modes(connector, edid);
 	}
+
+	ret = drm_edid_connector_add_modes(connector);
+
 	mutex_unlock(&dp->lock);
 
 	return ret;
@@ -380,9 +381,13 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 		return ret;
 	}
 
-	kfree(dp->edid);
-	dp->edid = drm_do_get_edid(&dp->connector,
-				   cdn_dp_get_edid_block, dp);
+	drm_edid_free(dp->drm_edid);
+	dp->drm_edid = drm_edid_read_custom(&dp->connector,
+					    cdn_dp_get_edid_block, dp);
+	drm_edid_connector_update(&dp->connector, dp->drm_edid);
+
+	dp->sink_has_audio = dp->connector.display_info.has_audio;
+
 	return 0;
 }
 
@@ -488,8 +493,8 @@ static int cdn_dp_disable(struct cdn_dp_device *dp)
 	dp->max_lanes = 0;
 	dp->max_rate = 0;
 	if (!dp->connected) {
-		kfree(dp->edid);
-		dp->edid = NULL;
+		drm_edid_free(dp->drm_edid);
+		dp->drm_edid = NULL;
 	}
 
 	return 0;
@@ -1131,8 +1136,8 @@ static void cdn_dp_unbind(struct device *dev, struct device *master, void *data)
 	pm_runtime_disable(dev);
 	if (dp->fw_loaded)
 		release_firmware(dp->fw);
-	kfree(dp->edid);
-	dp->edid = NULL;
+	drm_edid_free(dp->drm_edid);
+	dp->drm_edid = NULL;
 }
 
 static const struct component_ops cdn_dp_component_ops = {
diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.h b/drivers/gpu/drm/rockchip/cdn-dp-core.h
index 5b2fed1f5f55..8e6e95d269da 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.h
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.h
@@ -70,7 +70,7 @@ struct cdn_dp_device {
 	struct drm_display_mode mode;
 	struct platform_device *audio_pdev;
 	struct work_struct event_work;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	struct mutex lock;
 	bool connected;
-- 
2.39.2

