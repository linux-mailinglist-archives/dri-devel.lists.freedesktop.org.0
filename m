Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622B58399CC
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:42:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69DDE10E0BD;
	Tue, 23 Jan 2024 19:41:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DE3710E0BD
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038902; x=1737574902;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1AjcD+fVHi2r3HFt3IF7QnmxpmsFGmx8uWBCUF/3xq8=;
 b=DMJ2a/0oWcbZwou0tUamhZlpRIjcsnxL1uEnuidmx0HGAs5f2/+sVhbR
 MT5C85nHdCpkRVe40IMr+v6qFmtSO6Rvq83nE9ovnhsILpHoFjoNTzxp6
 WGnPvUPAKSPaVy1vPmBYu0dIu2YYu1g/v6gXIBdkzqWMjVmzxg5JYKKZJ
 MtJrPGCCWhuwV/6wR8swx/gYLX11Xa4k44kaypOwTYu9h+X7bABvqllGc
 ceBkRAVyNwCjW8neP4U8o9uikBdF/NM8w/baiCC4ZfwwRCG9x9OBAwby4
 FE4EXqFs7Euzv0oGnfkcmw8f67xbxOdMzZc9SxERItpkDakZ+z2gheoGu Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="392050438"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="392050438"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="909409068"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="909409068"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:38 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 38/39] drm/bridge: ti-sn65dsi86: switch to ->edid_read
 callback
Date: Tue, 23 Jan 2024 21:37:44 +0200
Message-Id: <9e54fb12c950486fb1b928b57da7bace8458ca2c.1706038510.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/ti-sn65dsi86.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi86.c b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
index 62cc3893dca5..61dc6f063fb4 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi86.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi86.c
@@ -1207,19 +1207,19 @@ static enum drm_connector_status ti_sn_bridge_detect(struct drm_bridge *bridge)
 					 : connector_status_disconnected;
 }
 
-static struct edid *ti_sn_bridge_get_edid(struct drm_bridge *bridge,
-					  struct drm_connector *connector)
+static const struct drm_edid *ti_sn_bridge_edid_read(struct drm_bridge *bridge,
+						     struct drm_connector *connector)
 {
 	struct ti_sn65dsi86 *pdata = bridge_to_ti_sn65dsi86(bridge);
 
-	return drm_get_edid(connector, &pdata->aux.ddc);
+	return drm_edid_read_ddc(connector, &pdata->aux.ddc);
 }
 
 static const struct drm_bridge_funcs ti_sn_bridge_funcs = {
 	.attach = ti_sn_bridge_attach,
 	.detach = ti_sn_bridge_detach,
 	.mode_valid = ti_sn_bridge_mode_valid,
-	.get_edid = ti_sn_bridge_get_edid,
+	.edid_read = ti_sn_bridge_edid_read,
 	.detect = ti_sn_bridge_detect,
 	.atomic_pre_enable = ti_sn_bridge_atomic_pre_enable,
 	.atomic_enable = ti_sn_bridge_atomic_enable,
-- 
2.39.2

