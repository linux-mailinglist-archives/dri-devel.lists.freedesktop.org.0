Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DB08399C8
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32FA710E8A8;
	Tue, 23 Jan 2024 19:41:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80CE510E8A5
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038866; x=1737574866;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OAOJVIPn6o4km+cNoynO4sjDJt7nIhyKQmckIeJLuUU=;
 b=Zo5to5C8yWGS3XfL44I7hRdrMC9xBnPXZw9LhIXduS6M+jSJU+vX00rv
 P9y5J7C7EzQGzYLJz+/92XbJpUxXTXNl3phvKpOcJ9nCn+5RuOBwcq7Xb
 u7bakEhehQFaU5AIUirrt2eAF0+OR0yukXkzZ3/6+Ic3OR2xGzI1JopCX
 QEED6h/5cwGcAX5rZWQoXSFnwApgom+fpBj/k/dBi34bt+qnDRWVxl+M4
 di8eGEFPUTzinU1wEcclUMRUW4eyD8Smb1QsZ2JshpEf7sVvrxZTj2bzU
 3Q6ATcJtVXRffAjbS+vzDLNbKv0mYsO0x7k6l16IHrrEOhi7j5s7U0AnF A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14980901"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14980901"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856433926"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="856433926"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:58 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 31/39] drm/omap/hdmi5: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:37 +0200
Message-Id: <da96653c111a7f989c7c804923968fa5f47c6b5a.1706038510.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/omapdrm/dss/hdmi5.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/dss/hdmi5.c b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
index e6611c683857..c7ae2235ae99 100644
--- a/drivers/gpu/drm/omapdrm/dss/hdmi5.c
+++ b/drivers/gpu/drm/omapdrm/dss/hdmi5.c
@@ -425,11 +425,11 @@ static void hdmi5_bridge_disable(struct drm_bridge *bridge,
 	mutex_unlock(&hdmi->lock);
 }
 
-static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
-					  struct drm_connector *connector)
+static const struct drm_edid *hdmi5_bridge_edid_read(struct drm_bridge *bridge,
+						     struct drm_connector *connector)
 {
 	struct omap_hdmi *hdmi = drm_bridge_to_hdmi(bridge);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	bool need_enable;
 	int idlemode;
 	int r;
@@ -452,7 +452,7 @@ static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
 
 	hdmi5_core_ddc_init(&hdmi->core);
 
-	edid = drm_do_get_edid(connector, hdmi5_core_ddc_read, &hdmi->core);
+	drm_edid = drm_edid_read_custom(connector, hdmi5_core_ddc_read, &hdmi->core);
 
 	hdmi5_core_ddc_uninit(&hdmi->core);
 
@@ -464,7 +464,7 @@ static struct edid *hdmi5_bridge_get_edid(struct drm_bridge *bridge,
 	if (need_enable)
 		hdmi_core_disable(hdmi);
 
-	return (struct edid *)edid;
+	return drm_edid;
 }
 
 static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
@@ -475,7 +475,7 @@ static const struct drm_bridge_funcs hdmi5_bridge_funcs = {
 	.atomic_reset = drm_atomic_helper_bridge_reset,
 	.atomic_enable = hdmi5_bridge_enable,
 	.atomic_disable = hdmi5_bridge_disable,
-	.get_edid = hdmi5_bridge_get_edid,
+	.edid_read = hdmi5_bridge_edid_read,
 };
 
 static void hdmi5_bridge_init(struct omap_hdmi *hdmi)
-- 
2.39.2

