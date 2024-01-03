Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F1624822B04
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C9D10E2E7;
	Wed,  3 Jan 2024 10:11:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE5DE10E2C5
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276692; x=1735812692;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XS0AtFug9LBvd/6uNTlwETzESLc7y3br5r1/NY2qpqI=;
 b=UDulcNFZKarqgo+XmDWegVlzkztyQlO2xRAa7zrsG1kbiouOUYGmSLOW
 XFJ02kDx+i6ZQDHhKNvbyyBZOYd7J76SUMZ25pshKvIGcyLRryto2C9Yr
 9Y2zR+l/cC5d2qaUxYF7rSxhocrpajaZZnddKPbKrGb1OkQSYxUgz1xfh
 B/2mHTMD3dkSSNd2iMTuyMPacnAVl9Og2sxAVDLRdu0DR692CuaKuEcnV
 D/SaTQ2tNYlTUrwXeBs1v8m7RONYEpgjf2xJkomLNIAMZ3vT2D2roIe6S
 HTg/IrV7FWMQEiF3F1CKqhtkiway7yt6VCphPnDGPipBV38wWuJNjy2gD Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721190"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721190"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756172545"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756172545"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:28 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 23/39] drm/bridge: nxp-ptn3460: switch to ->edid_read
 callback
Date: Wed,  3 Jan 2024 12:08:37 +0200
Message-Id: <87fb7fd52d087dd9a15b7194f3915b6b1c4146d6.1704276309.git.jani.nikula@intel.com>
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

Prefer using the struct drm_edid based callback and functions.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/bridge/nxp-ptn3460.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/bridge/nxp-ptn3460.c b/drivers/gpu/drm/bridge/nxp-ptn3460.c
index 7c0076e49953..4af3af5662cc 100644
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
+	const struct drm_edid *drm_edid;
 	bool power_off;
 	u8 *edid;
 	int ret;
@@ -175,27 +176,29 @@ static struct edid *ptn3460_get_edid(struct drm_bridge *bridge,
 				 EDID_LENGTH);
 	if (ret) {
 		kfree(edid);
-		edid = NULL;
+		drm_edid = NULL;
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
@@ -254,7 +257,7 @@ static const struct drm_bridge_funcs ptn3460_bridge_funcs = {
 	.pre_enable = ptn3460_pre_enable,
 	.disable = ptn3460_disable,
 	.attach = ptn3460_bridge_attach,
-	.get_edid = ptn3460_get_edid,
+	.edid_read = ptn3460_edid_read,
 };
 
 static int ptn3460_probe(struct i2c_client *client)
-- 
2.39.2

