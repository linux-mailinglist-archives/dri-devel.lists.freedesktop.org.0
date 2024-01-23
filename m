Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF178399AD
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:39:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A591F10E861;
	Tue, 23 Jan 2024 19:39:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6113C10E861
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038747; x=1737574747;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fdhGERFC02rkb+dK2SMrz68fbHDv5PCApK1v1TrSgm0=;
 b=cx8yKgFE6Co06tvK/X1QskbyF8gC5xFHnScxk8mejEfwxbaryUV4dBdI
 Qb6IRn++/DJrVubI9Uz3n6cpZo35YT3s9SpSYcTTIrlwfmb2NxB1cfapd
 wuvXVmN/qpSg5jddU89DohTjoIKmBDGiEm7FmJVTsJ/ejvrk2Qz9PH5eV
 +w7aMADxKgb+ASmvtwDtohhBmSlUPHX1IqEYXZHu3kisckHazVWnEnluy
 ZmAiZaCn5aXEY6yJDVd1nZFr+8Yp0vYK83mB559ycPAjfv2pfBhR1ak2S
 +ExT1NZkfC1JHc0QTokaqHR3pFi6Z4aEv8B2iw5ahcwuaW2FMU6yqHtMk Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14980513"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14980513"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:39:02 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="820212681"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="820212681"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:38:59 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 12/39] drm/meson: switch to drm_bridge_edid_read()
Date: Tue, 23 Jan 2024 21:37:18 +0200
Message-Id: <0a6556b4abaa341b5a3b9b466dbb23714369f7e1.1706038510.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1706038510.git.jani.nikula@intel.com>
References: <cover.1706038510.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based functions.

Not ideal, should use source physical address from connector info.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/meson/meson_encoder_hdmi.c | 20 ++++++++++++++++----
 1 file changed, 16 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/meson/meson_encoder_hdmi.c b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
index 25ea76558690..fff6ce394f98 100644
--- a/drivers/gpu/drm/meson/meson_encoder_hdmi.c
+++ b/drivers/gpu/drm/meson/meson_encoder_hdmi.c
@@ -323,19 +323,31 @@ static void meson_encoder_hdmi_hpd_notify(struct drm_bridge *bridge,
 					  enum drm_connector_status status)
 {
 	struct meson_encoder_hdmi *encoder_hdmi = bridge_to_meson_encoder_hdmi(bridge);
-	struct edid *edid;
 
 	if (!encoder_hdmi->cec_notifier)
 		return;
 
 	if (status == connector_status_connected) {
-		edid = drm_bridge_get_edid(encoder_hdmi->next_bridge, encoder_hdmi->connector);
-		if (!edid)
+		const struct drm_edid *drm_edid;
+		const struct edid *edid;
+
+		drm_edid = drm_bridge_edid_read(encoder_hdmi->next_bridge,
+						encoder_hdmi->connector);
+		if (!drm_edid)
 			return;
 
+		/*
+		 * FIXME: The CEC physical address should be set using
+		 * cec_notifier_set_phys_addr(encoder_hdmi->cec_notifier,
+		 * connector->display_info.source_physical_address) from a path
+		 * that has read the EDID and called
+		 * drm_edid_connector_update().
+		 */
+		edid = drm_edid_raw(drm_edid);
+
 		cec_notifier_set_phys_addr_from_edid(encoder_hdmi->cec_notifier, edid);
 
-		kfree(edid);
+		drm_edid_free(drm_edid);
 	} else
 		cec_notifier_phys_addr_invalidate(encoder_hdmi->cec_notifier);
 }
-- 
2.39.2

