Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BF58399C4
	for <lists+dri-devel@lfdr.de>; Tue, 23 Jan 2024 20:41:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38D310E87C;
	Tue, 23 Jan 2024 19:41:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1B4F10E87C
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Jan 2024 19:41:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1706038875; x=1737574875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=QSDnOow4qodsKv3l7t1qTQMxkDIDWFVplpFS3xR2aMk=;
 b=cm3QzHZNX5sYbml4OUJ9rBnOLWHarVuOU4gAuoHQaenIAuG9of0VD94s
 c3eUQF5HCjuH5kUfD5Gmax8VBA+B7P1vclYrVtq1l7s1ODX3HqueGQhDO
 xsVAvZsC4VgyYydTge9PVCpH8kkHEffx9tL7guGjT30vYPASXIxh8Emtk
 BprsaDlDHzdbDjROBLbFSbkEGqatzkfdOxMEH4sPLL90O9ovk03CkuJ6N
 wYqD81qIAbfXHygMslTcIZMWbd4YF2IimkV+/4ETruA5/wnVgxmylkHhI
 4EU03n3TCXGs85bmrFLcER+pDZHq6xkcNkLOSl/J2EV9ast/UtXFUi8JX w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="14980940"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="14980940"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10962"; a="856434042"
X-IronPort-AV: E=Sophos;i="6.05,215,1701158400"; d="scan'208";a="856434042"
Received: from pzsolt-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2024 11:41:10 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: [PATCH v3 33/39] drm: adv7511: switch to ->edid_read callback
Date: Tue, 23 Jan 2024 21:37:39 +0200
Message-Id: <d38a3ad5dc964c11967219e41efe02297514f1c2.1706038510.git.jani.nikula@intel.com>
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
 drivers/gpu/drm/bridge/adv7511/adv7511_drv.c | 47 +++++++++++++-------
 1 file changed, 30 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
index 8be235144f6d..1e40d451ce8c 100644
--- a/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
+++ b/drivers/gpu/drm/bridge/adv7511/adv7511_drv.c
@@ -604,10 +604,10 @@ static int adv7511_get_edid_block(void *data, u8 *buf, unsigned int block,
  * ADV75xx helpers
  */
 
-static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
-				     struct drm_connector *connector)
+static const struct drm_edid *adv7511_edid_read(struct adv7511 *adv7511,
+						struct drm_connector *connector)
 {
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	/* Reading the EDID only works if the device is powered */
 	if (!adv7511->powered) {
@@ -621,31 +621,44 @@ static struct edid *adv7511_get_edid(struct adv7511 *adv7511,
 			     edid_i2c_addr);
 	}
 
-	edid = drm_do_get_edid(connector, adv7511_get_edid_block, adv7511);
+	drm_edid = drm_edid_read_custom(connector, adv7511_get_edid_block, adv7511);
 
 	if (!adv7511->powered)
 		__adv7511_power_off(adv7511);
 
-	adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
-			       drm_detect_hdmi_monitor(edid));
+	if (drm_edid) {
+		/*
+		 * FIXME: The CEC physical address should be set using
+		 * cec_s_phys_addr(adap,
+		 * connector->display_info.source_physical_address, false) from
+		 * a path that has read the EDID and called
+		 * drm_edid_connector_update().
+		 */
+		const struct edid *edid = drm_edid_raw(drm_edid);
+
+		adv7511_set_config_csc(adv7511, connector, adv7511->rgb,
+				       drm_detect_hdmi_monitor(edid));
 
-	cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
+		cec_s_phys_addr_from_edid(adv7511->cec_adap, edid);
+	} else {
+		cec_s_phys_addr_from_edid(adv7511->cec_adap, NULL);
+	}
 
-	return edid;
+	return drm_edid;
 }
 
 static int adv7511_get_modes(struct adv7511 *adv7511,
 			     struct drm_connector *connector)
 {
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 	unsigned int count;
 
-	edid = adv7511_get_edid(adv7511, connector);
+	drm_edid = adv7511_edid_read(adv7511, connector);
 
-	drm_connector_update_edid_property(connector, edid);
-	count = drm_add_edid_modes(connector, edid);
+	drm_edid_connector_update(connector, drm_edid);
+	count = drm_edid_connector_add_modes(connector);
 
-	kfree(edid);
+	drm_edid_free(drm_edid);
 
 	return count;
 }
@@ -953,12 +966,12 @@ static enum drm_connector_status adv7511_bridge_detect(struct drm_bridge *bridge
 	return adv7511_detect(adv, NULL);
 }
 
-static struct edid *adv7511_bridge_get_edid(struct drm_bridge *bridge,
-					    struct drm_connector *connector)
+static const struct drm_edid *adv7511_bridge_edid_read(struct drm_bridge *bridge,
+						       struct drm_connector *connector)
 {
 	struct adv7511 *adv = bridge_to_adv7511(bridge);
 
-	return adv7511_get_edid(adv, connector);
+	return adv7511_edid_read(adv, connector);
 }
 
 static void adv7511_bridge_hpd_notify(struct drm_bridge *bridge,
@@ -977,7 +990,7 @@ static const struct drm_bridge_funcs adv7511_bridge_funcs = {
 	.mode_valid = adv7511_bridge_mode_valid,
 	.attach = adv7511_bridge_attach,
 	.detect = adv7511_bridge_detect,
-	.get_edid = adv7511_bridge_get_edid,
+	.edid_read = adv7511_bridge_edid_read,
 	.hpd_notify = adv7511_bridge_hpd_notify,
 };
 
-- 
2.39.2

