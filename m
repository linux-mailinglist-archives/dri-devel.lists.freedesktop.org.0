Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D928C5655
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:55:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAC6110E5CC;
	Tue, 14 May 2024 12:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MAt8yKQ1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E385810E5CC
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:55:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691345; x=1747227345;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fqmhO3wAvGOr+Ed4Ge08sneB6jFgcpp+F7cJwrcjgA8=;
 b=MAt8yKQ1TOqcJQ+JUhCbF3XbnS02Wgu0QLC21RyXGN3h74rqtIAAUxhN
 URAlOf0pKcaovLfGKCjEZdn6fNfHwZufulUQDURt/kUfHhemokzqLN4wq
 KTg9BYiutvPG0OafbQp+0oz1EClXHVl4+rjA3dJt73ZyVbpZxDAo/TVZJ
 yo0a+DgVa78FQsSGuZUa31oqBZKgN30iBUUNqijQHvrpo08HnkIB/ndzF
 EANz3Cp3cZbv0t/iOY6yTjifTOOkxF/swvZbwYzMINEtApUWJ2skB9HQL
 Suwh78kfBtaySZpCUDGdPEg/m+mvVrk6yj3XTEmSBSvshzCnqHUQydfvx w==;
X-CSE-ConnectionGUID: wmwrDHttRE67zqqoNFrNLQ==
X-CSE-MsgGUID: Dn9eRyRFSOSSL/rwRdgijg==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15458715"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15458715"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:45 -0700
X-CSE-ConnectionGUID: 2GTEnCgRRKaO1AjjKzarkw==
X-CSE-MsgGUID: E4EvIwMvSc2tg1wP9PwESw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30507466"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:41 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 03/11] drm/bridge: analogix_dp: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:09 +0300
Message-Id: <6f3bd1233a0922551761666f0c96c3766e3c5f96.1715691257.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1715691257.git.jani.nikula@intel.com>
References: <cover.1715691257.git.jani.nikula@intel.com>
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

Prefer the struct drm_edid based functions for reading the EDID and
updating the connector.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 .../gpu/drm/bridge/analogix/analogix_dp_core.c    | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
index 7b841232321f..9360b63ad37c 100644
--- a/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
+++ b/drivers/gpu/drm/bridge/analogix/analogix_dp_core.c
@@ -1108,7 +1108,7 @@ static int analogix_dp_prepare_panel(struct analogix_dp_device *dp,
 static int analogix_dp_get_modes(struct drm_connector *connector)
 {
 	struct analogix_dp_device *dp = to_dp(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret, num_modes = 0;
 
 	if (dp->plat_data->panel) {
@@ -1120,12 +1120,13 @@ static int analogix_dp_get_modes(struct drm_connector *connector)
 			return 0;
 		}
 
-		edid = drm_get_edid(connector, &dp->aux.ddc);
-		if (edid) {
-			drm_connector_update_edid_property(&dp->connector,
-							   edid);
-			num_modes += drm_add_edid_modes(&dp->connector, edid);
-			kfree(edid);
+		drm_edid = drm_edid_read_ddc(connector, &dp->aux.ddc);
+
+		drm_edid_connector_update(&dp->connector, drm_edid);
+
+		if (drm_edid) {
+			num_modes += drm_edid_connector_add_modes(&dp->connector);
+			drm_edid_free(drm_edid);
 		}
 
 		ret = analogix_dp_prepare_panel(dp, false, false);
-- 
2.39.2

