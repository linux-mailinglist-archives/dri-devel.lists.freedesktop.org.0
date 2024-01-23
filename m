Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C1858399A6
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBCCF10E865;
	Tue, 23 Jan 2024 19:38:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C744010E861
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038730; x=1737574730;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNy0pKVRv70YqECovDKkS3TvgsZJFQ7hgoAw19wxH/o=;
 b=AGFmdFw9zSFrusNBppTiBseg1pn7iEXeuPBbsu5EnreBOM4nDTNlLJjm
 hVX2eL5oapUQXyBHmp4q4CHtCrjzeYOYJQ2+JKRHCdL7JwFs8V0XcpNqO
 AmU+ve59LTewRCusepXvd1OqQxYZfCveTHpBfkpmeJxhGLc4xbXJ5lTgR
 dHu8X0HtuUl/UPlQFsDcWag5G56u2oOhrU8j3Ali2M3nbSup/i7hQHRZ0
 64M6JS8Q/HQMShhHEJZZ9coWj8bIgOGXKICIatvFJkIoYcYL57c97YuUV
 8T2P6JSaBXQsdkawHgET0oi1BEi9JBF72/KGupxUo0bLA2JPmV0aQdJ6N Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="405387263"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="405387263"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:38:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="27861652"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:38:47 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 10/39] drm/bridge: tfp410: use drm_bridge_edid_read()
Date: Tue, 23 Jan 2024 21:37:16 +0200
Message-Id: <f857bb36a78c57dc6a07b7b6cc90312fc3139ca8.1706038510.git.jani.nikula@intel.com>
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

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/ti-tfp410.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-tfp410.c b/drivers/gpu/drm/bridge/ti-tfp410.c
index 28848a8eb42e..dd14731eb03e 100644
--- a/drivers/gpu/drm/bridge/ti-tfp410.c
+++ b/drivers/gpu/drm/bridge/ti-tfp410.c
@@ -50,18 +50,18 @@ drm_connector_to_tfp410(struct drm_connector *connector)
 static int tfp410_get_modes(struct drm_connector *connector)
 {
 	struct tfp410 *dvi = drm_connector_to_tfp410(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	if (dvi->next_bridge->ops & DRM_BRIDGE_OP_EDID) {
-		edid = drm_bridge_get_edid(dvi->next_bridge, connector);
-		if (!edid)
+		drm_edid = drm_bridge_edid_read(dvi->next_bridge, connector);
+		if (!drm_edid)
 			DRM_INFO("EDID read failed. Fallback to standard modes\n");
 	} else {
-		edid = NULL;
+		drm_edid = NULL;
 	}
 
-	if (!edid) {
+	if (!drm_edid) {
 		/*
 		 * No EDID, fallback on the XGA standard modes and prefer a mode
 		 * pretty much anything can handle.
@@ -71,11 +71,11 @@ static int tfp410_get_modes(struct drm_connector *connector)
 		return ret;
 	}
 
-	drm_connector_update_edid_property(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
 
-	ret = drm_add_edid_modes(connector, edid);
+	ret = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return ret;
 }
-- 
2.39.2

