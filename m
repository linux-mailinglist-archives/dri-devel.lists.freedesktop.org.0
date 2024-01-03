Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B97C822AF0
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:09:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A6B610E26C;
	Wed,  3 Jan 2024 10:09:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6617710E26C
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:09:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276572; x=1735812572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=T7GMpre8EsGHdJoSALkKVEwv0VlV55UK24ycs4Xs/9Q=;
 b=EJ3rGtg4IHtH0X3L0bvL2m5jhCD+J/CMMZAzMDR0iQJwc+5D9cVWPTG6
 ZdYKZDerMwpqOBsO235ODGLO66b9MJFPKrL/oP08bNk1dyQ0ykVZWoczS
 Vwll/xYujs6igE6PhrKZ8jQ/I2tlIkDAN2dqqfT/Dyz7B6GUbVJ8dGZxA
 C6I50MUa8oiMfYOujvzntFcrvHOcHj4ex0d/Bs/MQ4NrdiHjz74Dkq9Al
 5Uf56uvkfAwTJEuy1oQpi08bD+y8N7Zk6JCxa30OVp6OmOeEx2GyF8l+k
 p9TL4wk0RVfbhqRZCUSFiQdCbbH2DN42X/9lnDkgRjmSMbt3WXETbIh0R Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="10383974"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="10383974"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:31 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="870531446"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="870531446"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:09:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 03/39] drm/bridge: chrontel-ch7033: switch to
 drm_bridge_read_edid()
Date: Wed,  3 Jan 2024 12:08:17 +0200
Message-Id: <96893c7896522e694b282f0bd6ce4d57e581772d.1704276309.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/chrontel-ch7033.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/chrontel-ch7033.c b/drivers/gpu/drm/bridge/chrontel-ch7033.c
index 483c28c7fc99..c83486cf6b15 100644
--- a/drivers/gpu/drm/bridge/chrontel-ch7033.c
+++ b/drivers/gpu/drm/bridge/chrontel-ch7033.c
@@ -230,14 +230,14 @@ static const struct drm_connector_funcs ch7033_connector_funcs = {
 static int ch7033_connector_get_modes(struct drm_connector *connector)
 {
 	struct ch7033_priv *priv = conn_to_ch7033_priv(connector);
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
-	edid = drm_bridge_get_edid(priv->next_bridge, connector);
-	drm_connector_update_edid_property(connector, edid);
-	if (edid) {
-		ret = drm_add_edid_modes(connector, edid);
-		kfree(edid);
+	drm_edid = drm_bridge_edid_read(priv->next_bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	if (drm_edid) {
+		ret = drm_edid_connector_add_modes(connector);
+		drm_edid_free(drm_edid);
 	} else {
 		ret = drm_add_modes_noedid(connector, 1920, 1080);
 		drm_set_preferred_mode(connector, 1024, 768);
-- 
2.39.2

