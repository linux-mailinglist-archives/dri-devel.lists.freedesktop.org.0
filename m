Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B368C5652
	for <lists+dri-devel@lfdr.de>; Tue, 14 May 2024 14:55:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5857F10E4E8;
	Tue, 14 May 2024 12:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SZY+3Gdy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5197110E4E8
 for <dri-devel@lists.freedesktop.org>; Tue, 14 May 2024 12:55:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715691338; x=1747227338;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/ahx7M+4VUMPs/kFYvhryNMXSLkP8io89Li24iuXTng=;
 b=SZY+3GdyS6VBPoZp6ch3wtuZcX7b8/WjTlklPBvWZ5cBGDDf1LYfK7+V
 g8m0/kbq+QiIctBLJ34d5oVpLKE6dBXLIpGapeDt+q6MYOY687svM+V7b
 9xZ7u/l9ELXxcN45+AWqDPL0MEEDmxzzO1RhM/241aJFDJw9Qdroof64W
 /X/5cqwu51e2IMbvWMMDHHaWqs1qlxRG1G0a+d3f20DHVwOoX2Wjx+vxv
 K0runi9lOweJyjqPS5numLf2FTATcU5iot9rSTCwMif1IVclpkOEZIq49
 paJSq22mpDC5QO3vHGMQCMwBgP9d4odwBxu542lPz3THqC45HBa/ssxo+ A==;
X-CSE-ConnectionGUID: 6J25RTQmS0ey42Na96LFUg==
X-CSE-MsgGUID: NzK/822MSlCwgtxUg1TEnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11073"; a="15458698"
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="15458698"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:38 -0700
X-CSE-ConnectionGUID: AIoGnxrgQaqBynRAa1DWHA==
X-CSE-MsgGUID: fcT6ZPIQQeubsGVmqzS+Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,159,1712646000"; d="scan'208";a="30507458"
Received: from mjarzebo-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.91])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 May 2024 05:55:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, Alain Volmat <alain.volmat@foss.st.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 02/11] drm/sti/sti_hdmi: convert to struct drm_edid
Date: Tue, 14 May 2024 15:55:08 +0300
Message-Id: <dd1c232cb85d5e0815af73c918953fa3b852baa2.1715691257.git.jani.nikula@intel.com>
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

The functional change is that the CEC physical address gets invalidated
when the EDID could not be read.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/sti/sti_hdmi.c | 24 ++++++++++++++----------
 1 file changed, 14 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/sti/sti_hdmi.c b/drivers/gpu/drm/sti/sti_hdmi.c
index 500936d5743c..3b62ec2d742f 100644
--- a/drivers/gpu/drm/sti/sti_hdmi.c
+++ b/drivers/gpu/drm/sti/sti_hdmi.c
@@ -974,28 +974,32 @@ static const struct drm_bridge_funcs sti_hdmi_bridge_funcs = {
 
 static int sti_hdmi_connector_get_modes(struct drm_connector *connector)
 {
+	const struct drm_display_info *info = &connector->display_info;
 	struct sti_hdmi_connector *hdmi_connector
 		= to_sti_hdmi_connector(connector);
 	struct sti_hdmi *hdmi = hdmi_connector->hdmi;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int count;
 
 	DRM_DEBUG_DRIVER("\n");
 
-	edid = drm_get_edid(connector, hdmi->ddc_adapt);
-	if (!edid)
-		goto fail;
+	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc_adapt);
+
+	drm_edid_connector_update(connector, drm_edid);
 
-	cec_notifier_set_phys_addr_from_edid(hdmi->notifier, edid);
+	cec_notifier_set_phys_addr(hdmi->notifier,
+				   connector->display_info.source_physical_address);
+
+	if (!drm_edid)
+		goto fail;
 
-	count = drm_add_edid_modes(connector, edid);
-	drm_connector_update_edid_property(connector, edid);
+	count = drm_edid_connector_add_modes(connector);
 
 	DRM_DEBUG_KMS("%s : %dx%d cm\n",
-		      (connector->display_info.is_hdmi ? "hdmi monitor" : "dvi monitor"),
-		      edid->width_cm, edid->height_cm);
+		      info->is_hdmi ? "hdmi monitor" : "dvi monitor",
+		      info->width_mm / 10, info->height_mm / 10);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 	return count;
 
 fail:
-- 
2.39.2

