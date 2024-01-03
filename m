Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDD822B03
	for <lists+dri-devel@lfdr.de>; Wed,  3 Jan 2024 11:11:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 075F010E2A3;
	Wed,  3 Jan 2024 10:11:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C62B510E2A3
 for <dri-devel@lists.freedesktop.org>; Wed,  3 Jan 2024 10:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704276686; x=1735812686;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XI6T4BvHliw/HdRn7Xf4nbmt3Pnt9gll14pXQajKxQE=;
 b=Zfc53VDSk4GnSQPRJkWwgLFXOikUK4YIIOFH0GTIXNVMNhfEb2qXuYdV
 ofxf7xJpxGzOQMGqzYm1PDoJmIv46KegWkgSEUKrMmUG8uq1Y7/o2kHfu
 UOAydyS8T6BKLA3alvgQ8P2ELj5sXvJWJSwD+3/U+Vz8e2UhMpw5/xrbU
 YgJ2C7CczWzszQlYUF8yc0v3Tkxx61kHmP8veJpz62oPeRBoO2aRDTcDs
 3N6sNFmvVbBj/GSvKjIOzXIsB/Izjrb3RGyrHVAjLSbR+lv1bK+2sqE3Q
 Cp1zl/s59x6otD01F6cbrdhlEjkMHcSRU9gT/zzmiob+usiQbA/Yerglj w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="396721166"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="396721166"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10941"; a="756172540"
X-IronPort-AV: E=Sophos;i="6.04,327,1695711600"; d="scan'208";a="756172540"
Received: from lwenners-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.35.39])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jan 2024 02:11:22 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v2 22/39] drm/bridge: megachips: switch to ->edid_read callback
Date: Wed,  3 Jan 2024 12:08:36 +0200
Message-Id: <d1c86c7bac30851c9bce6af3991912a5771230f1.1704276309.git.jani.nikula@intel.com>
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

