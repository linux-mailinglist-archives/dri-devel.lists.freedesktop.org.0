Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D429E8C5651
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 617C810E3BC;
	Tue, 14 May 2024 12:55:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VxZtJinS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0178310E3BC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691332; x=1747227332;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=TtS1WG3/Q3LLAhInBIdougKJH0z4JUz7Ux33SsRa9yE=;
 b=VxZtJinSEJodO9kLIlU5wmIBtMQsbA5L1kNrqYHPuCAGmaaX++UYpOfU
 YOprIiRoi0g4P71gY5L6l5uh+IIWJ1A13Kk2Xcn2noPjmnb+Wm+XAC4Xp
 vq13AXWqb6K9Gb3dMgYGFRFSwT3zH9aXqImVgKP4+E+SBazR5+nipOBAe
 KJ19TrDJtXJB3T74Mce+frk7CCkvw82rnBbM18vgUls7m8UGBP3bQ4c/l
 T7HslSm3LNAvrvErPwSVTFfVCctXEf6PbTC2/9LRFUXr8Dj2w0y9Ph9P9
 0x3M/16yMnGFj5AYXzkuJ9KCJJXzl7vkp5vO6SuvmcFw2dY5vK5Lj5KAT Q==;
X-CSE-ConnectionGUID: x70feeWAR4GIBP57wvY12A==
X-CSE-MsgGUID: 5bSxtLhtTfWQIK645FrnIQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15458668"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15458668"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:31 -0700
X-CSE-ConnectionGUID: qFVOKpiETzCyVbCt/BdRrw==
X-CSE-MsgGUID: v/KMMABXTRSKxjdorKCPnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30507442"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:27 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Subject: [PATCH 01/11] drm/rockchip: cdn-dp: get rid of drm_edid_raw()
Date: Tue, 14 May 2024 15:55:07 +0300
Message-Id: <d0807fbde7b0bd06ebfcb5df5c3b1cdad4c4ef84.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
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

The dimensions are available in display info, so there's no need for raw
EDID access. While at it, move the debug logging to where the EDID is
actually read.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index bd7aa891b839..90913fa26aad 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -266,15 +266,6 @@ static int cdn_dp_connector_get_modes(struct drm_connector *connector)
 
 	mutex_lock(&dp->lock);
 
-	if (dp->drm_edid) {
-		/* FIXME: get rid of drm_edid_raw() */
-		const struct edid *edid = drm_edid_raw(dp->drm_edid);
-
-		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
-				  edid->width_cm, edid->height_cm);
-
-	}
-
 	ret = drm_edid_connector_add_modes(connector);
 
 	mutex_unlock(&dp->lock);
@@ -369,6 +360,7 @@ static int cdn_dp_firmware_init(struct cdn_dp_device *dp)
 
 static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 {
+	const struct drm_display_info *info = &dp->connector.display_info;
 	int ret;
 
 	if (!cdn_dp_check_sink_connection(dp))
@@ -386,7 +378,11 @@ static int cdn_dp_get_sink_capability(struct cdn_dp_device *dp)
 					    cdn_dp_get_edid_block, dp);
 	drm_edid_connector_update(&dp->connector, dp->drm_edid);
 
-	dp->sink_has_audio = dp->connector.display_info.has_audio;
+	dp->sink_has_audio = info->has_audio;
+
+	if (dp->drm_edid)
+		DRM_DEV_DEBUG_KMS(dp->dev, "got edid: width[%d] x height[%d]\n",
+				  info->width_mm / 10, info->height_mm / 10);
 
 	return 0;
 }
-- 
2.39.2

