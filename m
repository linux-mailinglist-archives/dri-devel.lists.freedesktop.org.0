Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 193E4822AF7
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:10:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4BF10E294;
	Wed,  3 Jan 2024 10:10:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB3F210E294
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:10:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276613; x=1735812613;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hNy0pKVRv70YqECovDKkS3TvgsZJFQ7hgoAw19wxH/o=;
 b=IymOQhYUeFrk7O9rVs5LE/Cq2TtWQNU3KGu9Sj3vbegM9LKmZ+tNDbY9
 QglL/Z5qP0dzwHZ6/44/1gzQL0QZuDo1DrO1PdZ/DQzWvRv4UP9ECzC/n
 5ec7GL8yr2iv35X/SsT85myzbuncjxB2LCoorL09Tjo9ynkWHf3F+MpWK
 Y+3I8dyyM9aRRr5tWciHEpqy0RDmpvVauiEGEGZnT215IkRPFMVeICvq0
 xvr5OkeMsK++DyVAnZ5uiZmoXGtWhTRPq/fjDMyIBU8VegywScmPcHJ/f
 4Tf9ARG99G+KO7XPF+Gd4b+Nc63Udp6SAaRj9Mbf3oVqwvrlOU1NqOQYE Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="4341692"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; 
   d="scan'208";a="4341692"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:13 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="953184895"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="953184895"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:10:09 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 10/39] drm/bridge: tfp410: use drm_bridge_edid_read()
Date: Wed,  3 Jan 2024 12:08:24 +0200
Message-Id: <4b079f31d87c72d6eb0f26554ed2027b041bbacc.1704276309.git.jani.nikula@intel.com>
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

