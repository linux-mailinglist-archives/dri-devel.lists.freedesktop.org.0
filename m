Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A35AD325D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jun 2025 11:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 885B410E4CE;
	Tue, 10 Jun 2025 09:41:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="GQPvB65X";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84FF310E4CE;
 Tue, 10 Jun 2025 09:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749548501; x=1781084501;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=oYcNccTBZO1tr731LePJjxtby07GN8B0aReD7WSsoiw=;
 b=GQPvB65Xm5B8RzxxfgTYuqwJAYtNLKsJsNcK2B3t/2A6VgZ7oyDfcgN6
 v0Rn0eLpUFU6xH+PbiMgO1JeURM6BGBPpgdIIpptEikqU8VZMpQeZj35A
 EIXbmQALcDG4d6ZfVpFUstdFK5+ebm2hRJhuDgZ/X2Uv7NXWE4xTiabHc
 HjcpwVnVDIL05QtPMdfKrtdHarlPXfRbqIcT0M0xCRCEDWsdyHeuj5whx
 NcFtEl3K13ydLp14D+3e+Jebn4ZNd16CPNJPK4nZnw9PBFj8cifXjcgk2
 jNXjEOuWc7sxgrUrXZxAEAZpMf0p6y32QscFu9fyXp1KI0mTXooLuX+dy Q==;
X-CSE-ConnectionGUID: CsFfgft3Q5SVsE5mdxUHFA==
X-CSE-MsgGUID: g5xfevspR2K0TDGrU8P6ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="55443651"
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="55443651"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:41:41 -0700
X-CSE-ConnectionGUID: LsGn8wT1RyarhApQkruqlw==
X-CSE-MsgGUID: Py6RmqENRZeWJVcJNvBHpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,224,1744095600"; d="scan'208";a="146695119"
Received: from fdefranc-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.174])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2025 02:41:37 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
	dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, simon1.yang@intel.com,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH v2] drm/panel: use fwnode based lookups for panel followers
Date: Tue, 10 Jun 2025 12:41:32 +0300
Message-Id: <20250610094132.3240567-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
References: <1ed7cfca02f8cf14347dadfe027197dc15791383.1749199013.git.jani.nikula@intel.com>
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

v2:
- Update comments (Doug, Arun)
- s/IS_ERR_OR_NULL/IS_ERR/ (Doug)

Suggested-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Doug Anderson <dianders@chromium.org>
Cc: Lee Shawn C <shawn.c.lee@intel.com>
Tested-by: Lee Shawn C <shawn.c.lee@intel.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Tested-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Arun R Murthy <arun.r.murthy@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_panel.c | 42 ++++++++++++++++++++++++++++---------
 1 file changed, 32 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index fee65dc65979..805b4151ccef 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -473,17 +473,40 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
-static struct drm_panel *of_find_panel(struct device *follower_dev)
+/* Find panel by fwnode. This should be identical to of_drm_find_panel(). */
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
+	if (IS_ERR(fwnode))
+		return ERR_PTR(-ENODEV);
+
+	panel = find_panel_by_fwnode(fwnode);
+	fwnode_handle_put(fwnode);
 
 	return panel;
 }
@@ -494,7 +517,7 @@ static struct drm_panel *of_find_panel(struct device *follower_dev)
  *
  * This checks to see if a device needs to be power sequenced together with
  * a panel using the panel follower API.
- * At the moment panels can only be followed on device tree enabled systems.
+ *
  * The "panel" property of the follower points to the panel to be followed.
  *
  * Return: true if we should be power sequenced with a panel; false otherwise.
@@ -506,7 +529,7 @@ bool drm_is_panel_follower(struct device *dev)
 	 * don't bother trying to parse it here. We just need to know if the
 	 * property is there.
 	 */
-	return of_property_present(dev->of_node, "panel");
+	return device_property_present(dev, "panel");
 }
 EXPORT_SYMBOL(drm_is_panel_follower);
 
@@ -523,7 +546,6 @@ EXPORT_SYMBOL(drm_is_panel_follower);
  * If a follower is added to a panel that's already been turned on, the
  * follower's prepare callback is called right away.
  *
- * At the moment panels can only be followed on device tree enabled systems.
  * The "panel" property of the follower points to the panel to be followed.
  *
  * Return: 0 or an error code. Note that -ENODEV means that we detected that
@@ -536,7 +558,7 @@ int drm_panel_add_follower(struct device *follower_dev,
 	struct drm_panel *panel;
 	int ret;
 
-	panel = of_find_panel(follower_dev);
+	panel = find_panel_by_dev(follower_dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
-- 
2.39.5

