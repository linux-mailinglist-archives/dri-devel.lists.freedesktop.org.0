Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB94B8399B4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:40:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 561FF10E876;
	Tue, 23 Jan 2024 19:40:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F85E10E880
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038808; x=1737574808;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XI6T4BvHliw/HdRn7Xf4nbmt3Pnt9gll14pXQajKxQE=;
 b=NipUmZI4h+hwnxyKqpqOHru2fBg+aIL4PqIaIEOPDpT5ar/rVtSA1ceC
 jOV/R0si4tR3n3mcYthwOuFpw/QLamnWbORFMm9TuLPQOAGE/oG4MpTpd
 F1xzWJpQDN89L0YXEfng1e5JujP+DW0Pwu7ZF+QpZWodJOb8KZk8LHHLz
 laa+n8p8728xwhmjXvHN4fc3x+3jxGlqhO7HioNfcgPjY35TgEOQzbaE3
 K062fBHJx+/TWyZMvv4DohNXerR/qO+LrgsMZ+v39k8uGZ2ZDyp12a3oq
 1BVvslYx9eOB/8Ih9TrVBpnMJUJ4jFlSZr7pEVjxVGDiX33t5ziPVAIAL A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="15150457"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="15150457"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:07 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="959260026"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="959260026"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:40:04 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 22/39] drm/bridge: megachips: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:28 +0200
Message-Id: <f1e3fa51de1625f9f361b7cdb81fd74d51fb9dba.1706038510.git.jani.nikula@intel.com>
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
 .../bridge/megachips-stdpxxxx-ge-b850v3-fw.c   | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
index e93083bbec9d..4480523244e4 100644
--- a/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
+++ b/drivers/gpu/drm/bridge/megachips-stdpxxxx-ge-b850v3-fw.c
@@ -91,26 +91,26 @@ static int stdp2690_read_block(void *context, u8 *buf, unsigned int block, size_
 	return 0;
 }
 
-static struct edid *ge_b850v3_lvds_get_edid(struct drm_bridge *bridge,
-					    struct drm_connector *connector)
+static const struct drm_edid *ge_b850v3_lvds_edid_read(struct drm_bridge *bridge,
+						       struct drm_connector *connector)
 {
 	struct i2c_client *client;
 
 	client = ge_b850v3_lvds_ptr->stdp2690_i2c;
 
-	return drm_do_get_edid(connector, stdp2690_read_block, client);
+	return drm_edid_read_custom(connector, stdp2690_read_block, client);
 }
 
 static int ge_b850v3_lvds_get_modes(struct drm_connector *connector)
 {
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int num_modes;
 
-	edid = ge_b850v3_lvds_get_edid(&ge_b850v3_lvds_ptr->bridge, connector);
+	drm_edid = ge_b850v3_lvds_edid_read(&ge_b850v3_lvds_ptr->bridge, connector);
 
-	drm_connector_update_edid_property(connector, edid);
-	num_modes = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid_connector_update(connector, drm_edid);
+	num_modes = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return num_modes;
 }
@@ -226,7 +226,7 @@ static int ge_b850v3_lvds_attach(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs ge_b850v3_lvds_funcs = {
 	.attach = ge_b850v3_lvds_attach,
 	.detect = ge_b850v3_lvds_bridge_detect,
-	.get_edid = ge_b850v3_lvds_get_edid,
+	.edid_read = ge_b850v3_lvds_edid_read,
 };
 
 static int ge_b850v3_lvds_init(struct device *dev)
-- 
2.39.2

