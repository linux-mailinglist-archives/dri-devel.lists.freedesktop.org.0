Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A1E8399C7
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B4010E0AA;
	Tue, 23 Jan 2024 19:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AB1210E8A9
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038896; x=1737574896;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=kSPLNnGXzY6NSynQt4Shy3jPayQx4XsmBOCowPPdoPg=;
 b=dupiFQSrZSZ7isYSPnLeYLLUQmEZlfCq6Ox1jhX102Enl1op7TqE3Ik9
 0ncyM0IxpzSTzCpZYo1eH6G/JjT52OphqqNSvomesLrEN6BGPUFYQ2ANc
 5V0nz6OvdRgKqESXOBz4zAaCFTY4/w/SpgK66xnZCJfUd1AlgvP6j6oEA
 qNJkjdSOEUPhlPYpZPp2du65t1RonXe/iYnNpB5YnZJ6GbMvFHPQ3Ptb3
 5Ed0eg9LRWh4Rqi/Q9mbSiomN4Z1lhqaqMqvoLk3xqNp4FpeIvNz6vtfT
 T9xiKjG+/KTlnmEPxxJn1512Dxp/tmWCUF+shMcIV8wxqCmTKFXKghj1a w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="9022658"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; 
   d="scan'208";a="9022658"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="929435977"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="929435977"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 37/39] drm/bridge: tc358767: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:43 +0200
Message-Id: <978100cf8915b580ce66d34d27ed48858d9c161a.1706038510.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/tc358767.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/bridge/tc358767.c b/drivers/gpu/drm/bridge/tc358767.c
index 37b1353cf2e3..166f9a3e9622 100644
--- a/drivers/gpu/drm/bridge/tc358767.c
+++ b/drivers/gpu/drm/bridge/tc358767.c
@@ -1651,19 +1651,19 @@ static void tc_bridge_mode_set(struct drm_bridge *bridge,
 	drm_mode_copy(&tc->mode, mode);
 }
 
-static struct edid *tc_get_edid(struct drm_bridge *bridge,
-				struct drm_connector *connector)
+static const struct drm_edid *tc_edid_read(struct drm_bridge *bridge,
+					   struct drm_connector *connector)
 {
 	struct tc_data *tc = bridge_to_tc(bridge);
 
-	return drm_get_edid(connector, &tc->aux.ddc);
+	return drm_edid_read_ddc(connector, &tc->aux.ddc);
 }
 
 static int tc_connector_get_modes(struct drm_connector *connector)
 {
 	struct tc_data *tc = connector_to_tc(connector);
 	int num_modes;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	int ret;
 
 	ret = tc_get_display_props(tc);
@@ -1678,10 +1678,10 @@ static int tc_connector_get_modes(struct drm_connector *connector)
 			return num_modes;
 	}
 
-	edid = tc_get_edid(&tc->bridge, connector);
-	drm_connector_update_edid_property(connector, edid);
-	num_modes = drm_add_edid_modes(connector, edid);
-	kfree(edid);
+	drm_edid = tc_edid_read(&tc->bridge, connector);
+	drm_edid_connector_update(connector, drm_edid);
+	num_modes = drm_edid_connector_add_modes(connector);
+	drm_edid_free(drm_edid);
 
 	return num_modes;
 }
@@ -1850,7 +1850,7 @@ static const struct drm_bridge_funcs tc_edp_bridge_funcs = {
 	.atomic_enable = tc_edp_bridge_atomic_enable,
 	.atomic_disable = tc_edp_bridge_atomic_disable,
 	.detect = tc_bridge_detect,
-	.get_edid = tc_get_edid,
+	.edid_read = tc_edid_read,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,
-- 
2.39.2

