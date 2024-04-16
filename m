Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 133A38A6C1B
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 15:23:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711BD10F07C;
	Tue, 16 Apr 2024 13:23:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FROBPTi6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2E0A10EE86
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 13:23:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1713273782; x=1744809782;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=h3mr/JBZVXgf3FJm/3U0By1+74lqOPO/O5jKmd/b9Ec=;
 b=FROBPTi6H/S1u9KQj81Icc3xp7WI3imGm6e0b39I1csrKYoN8H1M1g11
 v6/d/A0J0uiqt/x11ekyev5HM5yPY13tPdp9uc/lGqYQHhP4A/sHht+1n
 3PkydljjB/eiaP11ApB7f/PgZ+QZUJn3W02DImwOkVAEqSIbhszQ4cSUX
 Rx7ZW/a7jam6FxZYN3b2wVP1oP7zDMl7EuoQzA++VHL4q1M9HhKvkGY0X
 k3DmEJp1cgCLN68uIMPybIbR8Ri1FwqFV/sBLteTLhgMYu9Lm0QgRORmX
 xcaRgBuQ/ksbdRdvgVo0b/KVnmZfasJE4PRHfJeNv5IuGVpNWyFMubOwO w==;
X-CSE-ConnectionGUID: z3A7FY9KSeWlKu0fsSdSnQ==
X-CSE-MsgGUID: nbS0oNEPRyKEYOf/536w3A==
X-IronPort-AV: E=McAfee;i="6600,9927,11046"; a="26169383"
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26169383"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:23:02 -0700
X-CSE-ConnectionGUID: Tq/bTwdtQx2PPNPmK2t2Hg==
X-CSE-MsgGUID: fRZFHgHxQBaf34ZDhtlsyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,206,1708416000"; d="scan'208";a="26929184"
Received: from martakit-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.44.100])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Apr 2024 06:22:59 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@intel.com>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH 05/15] drm/bridge/analogix/anx78xx: switch to struct drm_edid
Date: Tue, 16 Apr 2024 16:22:19 +0300
Message-Id: <d05db9dec2970969f71862910dc3f006817e7223.1713273659.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1713273659.git.jani.nikula@intel.com>
References: <cover.1713273659.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer struct drm_edid based functions over struct edid.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 .../drm/bridge/analogix/analogix-anx78xx.c    | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
index 5748a8581af4..ae79bcd8fa55 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx78xx.c
@@ -67,7 +67,7 @@ struct anx78xx {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
 	struct i2c_client *client;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	struct drm_connector connector;
 	struct anx78xx_platform_data pdata;
 	struct mutex lock;
@@ -830,8 +830,8 @@ static int anx78xx_get_modes(struct drm_connector *connector)
 	if (WARN_ON(!anx78xx->powered))
 		return 0;
 
-	if (anx78xx->edid)
-		return drm_add_edid_modes(connector, anx78xx->edid);
+	if (anx78xx->drm_edid)
+		return drm_edid_connector_add_modes(connector);
 
 	mutex_lock(&anx78xx->lock);
 
@@ -841,20 +841,21 @@ static int anx78xx_get_modes(struct drm_connector *connector)
 		goto unlock;
 	}
 
-	anx78xx->edid = drm_get_edid(connector, &anx78xx->aux.ddc);
-	if (!anx78xx->edid) {
+	anx78xx->drm_edid = drm_edid_read_ddc(connector, &anx78xx->aux.ddc);
+
+	err = drm_edid_connector_update(connector, anx78xx->drm_edid);
+
+	if (!anx78xx->drm_edid) {
 		DRM_ERROR("Failed to read EDID\n");
 		goto unlock;
 	}
 
-	err = drm_connector_update_edid_property(connector,
-						 anx78xx->edid);
 	if (err) {
 		DRM_ERROR("Failed to update EDID property: %d\n", err);
 		goto unlock;
 	}
 
-	num_modes = drm_add_edid_modes(connector, anx78xx->edid);
+	num_modes = drm_edid_connector_add_modes(connector);
 
 unlock:
 	mutex_unlock(&anx78xx->lock);
@@ -1091,8 +1092,8 @@ static bool anx78xx_handle_common_int_4(struct anx78xx *anx78xx, u8 irq)
 		event = true;
 		anx78xx_poweroff(anx78xx);
 		/* Free cached EDID */
-		kfree(anx78xx->edid);
-		anx78xx->edid = NULL;
+		drm_edid_free(anx78xx->drm_edid);
+		anx78xx->drm_edid = NULL;
 	} else if (irq & SP_HPD_PLUG) {
 		DRM_DEBUG_KMS("IRQ: Hot plug detect - cable plug\n");
 		event = true;
@@ -1363,7 +1364,7 @@ static void anx78xx_i2c_remove(struct i2c_client *client)
 
 	unregister_i2c_dummy_clients(anx78xx);
 
-	kfree(anx78xx->edid);
+	drm_edid_free(anx78xx->drm_edid);
 }
 
 static const struct of_device_id anx78xx_match_table[] = {
-- 
2.39.2

