Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F37228399BB
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FD1B10E882;
	Tue, 23 Jan 2024 19:40:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 183F110E882
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038815; x=1737574815;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8P6aflufPCMhIyTaLu6arMeOCboF+eOfwbCMSZAQZnc=;
 b=nhOPVCPwRVwoeWTtqeP5Z+f436TSOY9yEVUCzSy6TzjTgmAEyCkhUBV6
 NLRAUfikQBn4kqGZgyT0pQXb6k9TjMAQgb/Bp1OM8qMObhB0iabeua8bv
 zVmnQSdmabQ58+Myfu5mUlnlDfQnBQCalXlO8WTy9s/x9Sa61BLvkkFVY
 Mlkvwc9kk5Q0GGbaVSY0cJgJHN8VCwRjHYRPrPp+QrUvB5wyG1rccT1Jv
 97063iAB1OhlcRq/rHbZbvHX7R6EtHQE/Mu+9AFDzRfK/0HuRH/CyAAl5
 8YvLjoCx39cN2giEhO1vJSQ/bd4m25VdZbxWOtJiKPux7E6IvSQmq1wPe g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15150493"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15150493"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959260100"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="959260100"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 23/39] drm/bridge: nxp-ptn3460: switch to ->edid_read
 callback
Date: Tue, 23 Jan 2024 21:37:29 +0200
Message-Id: <6f4e48af3bf4d7782e8dfad703b6f22a69e94bf8.1706038510.git.jani.nikula@intel.com>
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

