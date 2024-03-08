Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A50B8767F7
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 17:04:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 52DD210FB21;
	Fri,  8 Mar 2024 16:04:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Ch+woEEY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0ED1E10FB21;
 Fri,  8 Mar 2024 16:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709913857; x=1741449857;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5ACKWBOnYZXB8L9TEhtkoXnFKFcLS6B6Kj7MamCUiO0=;
 b=Ch+woEEYiuJP/iqxRwI91nN8iQmVF7OGeG5GL5FG1IxhspXEjDXaX/Aq
 5kFysDm8LFb3oI+b8MSbYZjFi3sDypI+YKzXKB9wTPK6b5sai8UgCWuGn
 L3rY3SqDnlN/McE7ykOu0b7mzLy3s0U5F1FNwLmvXq8hCPvGNI6QqmFPf
 kilrr1rKdTf/EqTsQRwDKTTITTvz5w0otebNiF2+NCQIiN5NFb7b6Zjyi
 GIX0fEMd/72avp9iagUc9DF4xsXwNed9AiewvvvhOD5ynqipl5c1RQD1X
 vTF/m8uKT/GUOJAXnNbqIVUc7X9ZYDpzjkDsFyE24R8gUJeWKhSqs1kWF g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11006"; a="4522249"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4522249"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:04:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; d="scan'208";a="15172853"
Received: from unknown (HELO localhost) ([10.252.34.187])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2024 08:04:14 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, jani.nikula@intel.com,
 Adrien Grassein <adrien.grassein@gmail.com>, stable@vger.kernel.org
Subject: [PATCH 4/8] drm/bridge: lt8912b: do not return negative values from
 .get_modes()
Date: Fri,  8 Mar 2024 18:03:42 +0200
Message-Id: <dcdddcbcb64b6f6cdc55022ee50c10dee8ddbc3d.1709913674.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1709913674.git.jani.nikula@intel.com>
References: <cover.1709913674.git.jani.nikula@intel.com>
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

The .get_modes() hooks aren't supposed to return negative error
codes. Return 0 for no modes, whatever the reason.

Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: stable@vger.kernel.org
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 16 +++++++---------
 1 file changed, 7 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index e7c4bef74aa4..4b2ae27f0a57 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -441,23 +441,21 @@ lt8912_connector_mode_valid(struct drm_connector *connector,
 static int lt8912_connector_get_modes(struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	int ret = -1;
-	int num = 0;
 	struct lt8912 *lt = connector_to_lt8912(connector);
 	u32 bus_format = MEDIA_BUS_FMT_RGB888_1X24;
+	int ret, num;
 
 	drm_edid = drm_bridge_edid_read(lt->hdmi_port, connector);
 	drm_edid_connector_update(connector, drm_edid);
-	if (drm_edid) {
-		num = drm_edid_connector_add_modes(connector);
-	} else {
-		return ret;
-	}
+	if (!drm_edid)
+		return 0;
+
+	num = drm_edid_connector_add_modes(connector);
 
 	ret = drm_display_info_set_bus_formats(&connector->display_info,
 					       &bus_format, 1);
-	if (ret)
-		num = ret;
+	if (ret < 0)
+		num = 0;
 
 	drm_edid_free(drm_edid);
 	return num;
-- 
2.39.2

