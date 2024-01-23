Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F8298399C2
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0607210E8A5;
	Tue, 23 Jan 2024 19:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C08710E8A5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038866; x=1737574866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=lVdsejW3IJtODk0kBe3vJmeJLCJmguS5Ym+M4fAQPMc=;
 b=B0uT4YHrDx2HDzzDbiLAx9BgunqtucbYzUD5EUEL24MibDMAv9olgZ9y
 QIePRpqzCPzliW4MFZJOMarIIEBz0f/+1t90i3GUxYSjaqIz9kmqf9WQB
 xCDMQu+muTj5NK7iJNdAXwhygIPCUMr8TNJV0a7XBc81ituC/oRgRYenu
 cwiqSuDGY8mARzXjMUXZAuUY7Bm58N6txfThns7T8t4FN8CP+Mu6ed+x2
 G4mUkNVkhVPQycxEABMzBuGYGN5M4yiKcwFHqysgdRzGh+tKNOaUIzQCl
 /GCt3Ii/gVgc4ShOQKuH9DpNrvMNsa00k/0PiFDYcXOklmdXIfiUwEfYU Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14980885"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14980885"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856433895"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="856433895"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:52 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 30/39] drm/omap/hdmi4: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:36 +0200
Message-Id: <4c9b24a399e8f305698f8fe5ebd687bfd6ce2e59.1706038510.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/omapdrm/dss/hdmi4.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi4.c b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
index a26b77d99d52..9b8747d83ee8 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi4.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi4.c
@@ -436,11 +436,11 @@ static void hdmi4_bridge_hpd_notify(struct drm_bridge *bridge,
 		hdmi4_cec_set_phys_addr(&hdmi->core, CEC_PHYS_ADDR_INVALID);
 }
 
-static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
-					  struct drm_connector *connector)
+static const struct drm_edid *hdmi4_bridge_edid_read(struct drm_bridge *bridge,
+						     struct drm_connector *connector)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
-	struct edid *edid = NULL;
+	const struct drm_edid *drm_edid = NULL;
 	unsigned int cec_addr;
 	bool need_enable;
 	int r;
@@ -461,13 +461,21 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 	if (r)
 		goto done;
 
-	edid = drm_do_get_edid(connector, hdmi4_core_ddc_read, &hdmi->core);
+	drm_edid = drm_edid_read_custom(connector, hdmi4_core_ddc_read, &hdmi->core);
 
 done:
 	hdmi_runtime_put(hdmi);
 	mutex_unlock(&hdmi->lock);
 
-	if (edid && edid->extensions) {
+	if (drm_edid) {
+		/*
+		 * FIXME: The CEC physical address should be set using
+		 * hdmi4_cec_set_phys_addr(&hdmi->core,
+		 * connector->display_info.source_physical_address) from a path
+		 * that has read the EDID and called
+		 * drm_edid_connector_update().
+		 */
+		const struct edid *edid = drm_edid_raw(drm_edid);
 		unsigned int len = (edid->extensions + 1) * EDID_LENGTH;
 
 		cec_addr = cec_get_edid_phys_addr((u8 *)edid, len, NULL);
@@ -480,7 +488,7 @@ static struct edid *hdmi4_bridge_get_edid(struct drm_bridge *bridge,
 	if (need_enable)
 		hdmi4_core_disable(&hdmi->core);
 
-	return edid;
+	return drm_edid;
 }
 
 static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
@@ -492,7 +500,7 @@ static const struct drm_bridge_funcs hdmi4_bridge_funcs = {
 	.atomic_enable = hdmi4_bridge_enable,
 	.atomic_disable = hdmi4_bridge_disable,
 	.hpd_notify = hdmi4_bridge_hpd_notify,
-	.get_edid = hdmi4_bridge_get_edid,
+	.edid_read = hdmi4_bridge_edid_read,
 };
 
 static void hdmi4_bridge_init(struct omap_hdmi *hdmi)
-- 
2.39.2

