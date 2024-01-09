Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3EF88283BA
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 11:11:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 427D110E3B4;
	Tue,  9 Jan 2024 10:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A06EF10E3B4
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 10:11:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704795114; x=1736331114;
 h=from:to:subject:date:message-id:in-reply-to:references:
 mime-version:content-transfer-encoding;
 bh=8P6aflufPCMhIyTaLu6arMeOCboF+eOfwbCMSZAQZnc=;
 b=OZWUxC5qOnWKkRzNOlY3wqJVGC9mE8H2yxQ+g3w+ZnJgJSmFMsaKvL+o
 QKe4N/o7IfL+3LIOHOmPtif1LYz7sAtUrWZfhgeT6/58ChNqBYNE88hT7
 fPlVAMdO2VC1z3UwXLezglXNSN/JpYLQy1HOlIBYmpIEL5UaqQnjd6PAU
 pGw7BWDBCN355JFJYYuJIm7USyi0bsUNqAna/xB/YD8s4eR/aLwa+zUw2
 /ybVkV2FsTu2CAY5MnnD3fbbLdzrN0sJsTTQHqzeyaZCZ7yWGOo77zVAy
 fa220z+y2IDgEoz8YrsMfv8MJHQtYb6xlONmxvw/yK+YjEYqo1411SVz1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="397849356"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="397849356"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:11:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10947"; a="731424665"
X-IronPort-AV: E=Sophos;i="6.04,182,1695711600"; d="scan'208";a="731424665"
Received: from aakinrin-mobl2.amr.corp.intel.com (HELO localhost)
 ([10.252.36.188])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jan 2024 02:11:50 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2] drm/bridge: nxp-ptn3460: switch to ->edid_read callback
Date: Tue,  9 Jan 2024 12:11:46 +0200
Message-Id: <20240109101146.2425952-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
References: <a8f71940221fb085b8767f8123f496c9b36b22cc.1704276309.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based callback and functions.

v2: Fix -Wsometimes-uninitialized (kernel test robot)

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 7c0076e49953..ed93fd4c3265 100644
--- a/drivers/gpu/drm/bridge/nxp-ptn3460.c
+++ b/drivers/gpu/drm/bridge/nxp-ptn3460.c
@@ -154,10 +154,11 @@ static void ptn3460_disable(struct drm_bridge *bridge)
 }
 
 
-static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
-				     struct drm_connector *connector)
+static const struct drm_edid *ptn3460_edid_read(struct drm_bridge *bridge,
+						struct drm_connector *connector)
 {
 	struct ptn3460_bridge *ptn_bridge = bridge_to_ptn3460(bridge);
+	const struct drm_edid *drm_edid = NULL;
 	bool power_off;
 	u8 *edid;
 	int ret;
@@ -175,27 +176,28 @@ static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
 				 EDID_LENGTH);
 	if (ret) {
 		kfree(edid);
-		edid = NULL;
 		goto out;
 	}
 
+	drm_edid = drm_edid_alloc(edid, EDID_LENGTH);
+
 out:
 	if (power_off)
 		ptn3460_disable(&ptn_bridge->bridge);
 
-	return (struct edid *)edid;
+	return drm_edid;
 }
 
 static int ptn3460_connector_get_modes(struct drm_connector *connector)
 {
 	struct ptn3460_bridge *ptn_bridge = connector_to_ptn3460(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int num_modes;
 
-	edid = ptn3460_get_edid(&ptn_bridge->bridge, connector);
-	drm_connector_update_edid_property(connector, edid);
-	num_modes = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid = ptn3460_edid_read(&ptn_bridge->bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	num_modes = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return num_modes;
 }
@@ -254,7 +256,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
 	.disable = ptn3460_disable,
 	.attach = ptn3460_bridge_attach,
-	.get_edid = ptn3460_get_edid,
+	.edid_read = ptn3460_edid_read,
 };
 
 static int ptn3460_probe(struct i2c_client *client)
-- 
2.39.2

