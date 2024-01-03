Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5528B822AF3
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:09:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6B10E281;
	Wed,  3 Jan 2024 10:09:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90E310E281
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276590; x=1735812590;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=NgWyXguOEYEwBHSYUCWVBoNBM+7Kwh6qItxadn0JsJk=;
 b=FvXdNit7wfG+ULAu3oVdsmxW1qBKlwAwj+6mIm9ByVNWWo62skHUAosx
 Lbmj+TZTwwamnXCtcxMTcZZ9CBkXy7taJsq52zagG1wiafBhOiIJvGl+/
 icshK7e1Kw7TOaGUfNBC9sOI74JQMdyPRqh5AlcT9+IBM/6NFI3bruVx+
 WB7LzV04wfzqv/LKBZWMw9zUiz/Qf2C6FUL4lRk2pRZ7ehBmZ6oKhp2yG
 sYeJlwp7hEP2j5+bGuggo9y/GckT7NG8n+JOyB9atIZb4NccAOrzmO65I
 BrhFceOwPJqRDqZCKJcxj6aDFjVMasWpWz+ACxKiqAXPksi62bZnYNXu2 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10384067"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="10384067"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870531582"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="870531582"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:46 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 06/39] drm/bridge: lt8912b: use ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:20 +0200
Message-Id: <c1ab82b711ab7b5ee5855fed2ce96afd4f22ab7c.1704276309.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <cover.1704276309.git.jani.nikula@intel.com>
References: <cover.1704276309.git.jani.nikula@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>,
 Adrien Grassein <adrien.grassein@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Prefer using the struct drm_edid based functions.

Cc: Adrien Grassein <adrien.grassein@gmail.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/lontium-lt8912b.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lontium-lt8912b.c b/drivers/gpu/drm/bridge/lontium-lt8912b.c
index 9c0ffc1c6fac..e7c4bef74aa4 100644
--- a/drivers/gpu/drm/bridge/lontium-lt8912b.c
+++ b/drivers/gpu/drm/bridge/lontium-lt8912b.c
@@ -620,8 +620,8 @@ lt8912_bridge_detect(struct drm_bridge *bridge)
 	return lt8912_check_cable_status(lt);
 }
 
-static struct edid *lt8912_bridge_get_edid(struct drm_bridge *bridge,
-					   struct drm_connector *connector)
+static const struct drm_edid *lt8912_bridge_edid_read(struct drm_bridge *bridge,
+						      struct drm_connector *connector)
 {
 	struct lt8912 *lt = bridge_to_lt8912(bridge);
 
@@ -630,7 +630,7 @@ static struct edid *lt8912_bridge_get_edid(struct drm_bridge *bridge,
 	 * given to the hdmi connector node.
 	 */
 	if (lt->hdmi_port->ops & DRM_BRIDGE_OP_EDID)
-		return drm_bridge_get_edid(lt->hdmi_port, connector);
+		return drm_bridge_edid_read(lt->hdmi_port, connector);
 
 	dev_warn(lt->dev, "The connected bridge does not supports DRM_BRIDGE_OP_EDID\n");
 	return NULL;
@@ -642,7 +642,7 @@ static const struct drm_bridge_funcs lt8912_bridge_funcs = {
 	.mode_set = lt8912_bridge_mode_set,
 	.enable = lt8912_bridge_enable,
 	.detect = lt8912_bridge_detect,
-	.get_edid = lt8912_bridge_get_edid,
+	.edid_read = lt8912_bridge_edid_read,
 };
 
 static int lt8912_bridge_resume(struct device *dev)
-- 
2.39.2

