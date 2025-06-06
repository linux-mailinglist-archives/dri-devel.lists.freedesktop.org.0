Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADF5CACFEC2
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:06:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365E810EA1B;
	Fri,  6 Jun 2025 09:06:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DsrdomjM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B838C10EA11;
 Fri,  6 Jun 2025 09:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749200785; x=1780736785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eFFinFcoy16T8mOE2ovGBj3GmBqs1LUknKz1OjJyefA=;
 b=DsrdomjMcunCwq/23K3olk9tjaPYOsMOkpKA9CHcc5qdlvD9EdjRaeh2
 tMXSbE92ECDR75MJgQHeMJ+zvedS46Y65Kiua73Vos5hsDlikPAyN40uT
 6bXlyW2GrR3+Zax15OMB8df2Brv42sB8My+cJATe1P5QgUSHi4ZJ9QoEn
 /FCo6WCUK9PnY9VpmPStQsQfbn0POa3qA4P0tAHxntCRYuv8ZHWDKjW6W
 tRiK+I6SjzIcO6lS1qsShF9yYa5XGnJMtaUaLp8bLN7bjc3z+HY8wk2Vf
 /epv58OKo2S5Utmn1clvDRcddtnhcNA1ZoUS/lvpaDgNn3Wl+IifLqTCi g==;
X-CSE-ConnectionGUID: 79FoXkz1QC68Y2eSWAx/YA==
X-CSE-MsgGUID: EoPKsw5sRfGQh0ovOlKmZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68785054"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="68785054"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:21 -0700
X-CSE-ConnectionGUID: cHH32zgnTMWRuSPYpHW9WQ==
X-CSE-MsgGUID: k2iegnr4RSOYJD04ntJUqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146289481"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:17 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, simon1.yang@intel.com,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 1/4] drm/panel: use fwnode based lookups for panel followers
Date: Fri,  6 Jun 2025 12:05:09 +0300
Message-Id: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <cover.1749199013.git.jani.nikula@intel.com>
References: <cover.1749199013.git.jani.nikula@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use firmware node based lookups for panel followers, to make the code
independent of OF and device tree, and make it work also for ACPI with
an appropriate _DSD.

ASL example:

	Package (0x02)
	{
		"panel", \_SB.PCI0.GFX0.LCD0
	}

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_panel.c | 39 +++++++++++++++++++++++++++++--------
 1 file changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index fee65dc65979..3eb0a615f7a9 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
-static struct drm_panel *of_find_panel(struct device *follower_dev)
+/* Find panel by fwnode */
+static struct drm_panel *find_panel_by_fwnode(const struct fwnode_handle *fwnode)
 {
-	struct device_node *panel_np;
 	struct drm_panel *panel;
 
-	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
-	if (!panel_np)
+	if (!fwnode_device_is_available(fwnode))
 		return ERR_PTR(-ENODEV);
 
-	panel = of_drm_find_panel(panel_np);
-	of_node_put(panel_np);
+	mutex_lock(&panel_lock);
+
+	list_for_each_entry(panel, &panel_list, list) {
+		if (dev_fwnode(panel->dev) == fwnode) {
+			mutex_unlock(&panel_lock);
+			return panel;
+		}
+	}
+
+	mutex_unlock(&panel_lock);
+
+	return ERR_PTR(-EPROBE_DEFER);
+}
+
+/* Find panel by follower device */
+static struct drm_panel *find_panel_by_dev(struct device *follower_dev)
+{
+	struct fwnode_handle *fwnode;
+	struct drm_panel *panel;
+
+	fwnode = fwnode_find_reference(dev_fwnode(follower_dev), "panel", 0);
+	if (IS_ERR_OR_NULL(fwnode))
+		return ERR_PTR(-ENODEV);
+
+	panel = find_panel_by_fwnode(fwnode);
+	fwnode_handle_put(fwnode);
 
 	return panel;
 }
@@ -506,7 +529,7 @@ bool drm_is_panel_follower(struct device *dev)
 	 * don't bother trying to parse it here. We just need to know if the
 	 * property is there.
 	 */
-	return of_property_present(dev->of_node, "panel");
+	return device_property_present(dev, "panel");
 }
 EXPORT_SYMBOL(drm_is_panel_follower);
 
@@ -536,7 +559,7 @@ int drm_panel_add_follower(struct device *follower_dev,
 	struct drm_panel *panel;
 	int ret;
 
-	panel = of_find_panel(follower_dev);
+	panel = find_panel_by_dev(follower_dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
-- 
2.39.5

