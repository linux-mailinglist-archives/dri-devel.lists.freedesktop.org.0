Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01C088C25A3
	for <lists+dri-devel@lfdr.de>; Fri, 10 May 2024 15:26:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B80410EB2B;
	Fri, 10 May 2024 13:26:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bwx4jAm6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8B9510EA28
 for <dri-devel@lists.freedesktop.org>; Fri, 10 May 2024 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715347579; x=1746883579;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M6ZKM8u7DtskOFzSDAOgeL6kei6j/SZiuBbFDJIzcUc=;
 b=Bwx4jAm6NuxjmlpLy2HOptNisJwDGGVVPef0xwJAj+hRr1+0Y1IhMCq5
 PbhjAk+24wQYUt6tqp/Bs8/VdPCDiJ9uCNSThB7nxuayYkQODthIfrrbB
 DIfS3+H0aeVoWBAizdMLrad5ajQ8yEhX1zcTcwtOI98z27rM3AkzF46ef
 jnGEm8UlRGFvLJP7oZat50+ZhIU/L6/ynfQnRhlPqAz357Tld6QheMqZf
 FoPFd5P6nJ6B1buakFPomHngDkzoSwnJ7CxVP9gTbdjV5T5LKqlcDFxrZ
 OTG8dqvukr1yWMLHqdJ6rx0ssdWkaMtCgKedIs8KuU3A8QHDFiAt1PlRs Q==;
X-CSE-ConnectionGUID: Y5z8QdQySVSInQU/SI0w5A==
X-CSE-MsgGUID: dHo7m5IdRTSzUZ/G7+++Uw==
X-IronPort-AV: E=McAfee;i="6600,9927,11068"; a="11489927"
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="11489927"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:19 -0700
X-CSE-ConnectionGUID: 6TdG9BNzQTqTEy/Ojc8tJw==
X-CSE-MsgGUID: pXcx1/ZXQbyD3lIW8YXGFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,151,1712646000"; d="scan'208";a="30168769"
Received: from ettammin-desk.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by orviesa008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2024 06:26:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [RESEND 1/6] drm/bridge/analogix/anx6345: switch to struct drm_edid
Date: Fri, 10 May 2024 16:26:04 +0300
Message-Id: <74b2f00e17b2614b44955cf0cbae270f3c31d91a.1715347488.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715347488.git.jani.nikula@intel.com>
References: <cover.1715347488.git.jani.nikula@intel.com>
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
 .../gpu/drm/bridge/analogix/analogix-anx6345.c    | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
index c9e35731e6a1..42ab6014fe12 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix-anx6345.c
@@ -47,7 +47,7 @@ struct anx6345 {
 	struct drm_dp_aux aux;
 	struct drm_bridge bridge;
 	struct i2c_client *client;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	struct drm_connector connector;
 	struct drm_panel *panel;
 	struct regulator *dvdd12;
@@ -458,7 +458,7 @@ static int anx6345_get_modes(struct drm_connector *connector)
 
 	mutex_lock(&anx6345->lock);
 
-	if (!anx6345->edid) {
+	if (!anx6345->drm_edid) {
 		if (!anx6345->powered) {
 			anx6345_poweron(anx6345);
 			power_off = true;
@@ -470,19 +470,18 @@ static int anx6345_get_modes(struct drm_connector *connector)
 			goto unlock;
 		}
 
-		anx6345->edid = drm_get_edid(connector, &anx6345->aux.ddc);
-		if (!anx6345->edid)
+		anx6345->drm_edid = drm_edid_read_ddc(connector, &anx6345->aux.ddc);
+		if (!anx6345->drm_edid)
 			DRM_ERROR("Failed to read EDID from panel\n");
 
-		err = drm_connector_update_edid_property(connector,
-							 anx6345->edid);
+		err = drm_edid_connector_update(connector, anx6345->drm_edid);
 		if (err) {
 			DRM_ERROR("Failed to update EDID property: %d\n", err);
 			goto unlock;
 		}
 	}
 
-	num_modes += drm_add_edid_modes(connector, anx6345->edid);
+	num_modes += drm_edid_connector_add_modes(connector);
 
 	/* Driver currently supports only 6bpc */
 	connector->display_info.bpc = 6;
@@ -793,7 +792,7 @@ static void anx6345_i2c_remove(struct i2c_client *client)
 
 	unregister_i2c_dummy_clients(anx6345);
 
-	kfree(anx6345->edid);
+	drm_edid_free(anx6345->drm_edid);
 
 	mutex_destroy(&anx6345->lock);
 }
-- 
2.39.2

