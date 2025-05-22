Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E43EAC0935
	for <lists+dri-devel@lfdr.de>; Thu, 22 May 2025 12:00:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DC5C10EEA0;
	Thu, 22 May 2025 10:00:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FYphbf87";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1224310EF42
 for <dri-devel@lists.freedesktop.org>; Thu, 22 May 2025 10:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747908044; x=1779444044;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=S12YheCSkq+DKmTNKV6ToCXs0urpO2w7ZbcxGOhN+ho=;
 b=FYphbf87ys1Te0Y5mbDSYTLX4aVtKPEc5uQwaLOQdKlf0wAD1mN6zc9Q
 D8myioXPANzUK/p3lNuXQgNueXpavnF7HoXNOomjaNevpSpcQ3DmT8KjZ
 s2LxRfLnr7UoutVHOiCF7lozhV7/VyRytiePtRzeT/PgJL+D1ONneFLsj
 DVB+NPCMc7FT6zLyec2i8g3O+G5AXPFhtam97ACLC6YWk0Jpof9D8bWRG
 AOTz4Nu/D3PuSoTW9ywQMSbqJZLZ/ApS1/rpxZZhocfrwU6n/tkoMXCuE
 iDm8/C/qXOnrc5r9K/W4+c+BcPygX0xca86OlrhtTm1OZD5kskTc/E1oh A==;
X-CSE-ConnectionGUID: EGntYhwTSqGtyvd4hnM/pw==
X-CSE-MsgGUID: EcGW1/3uS1C2vNHWni70UQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11440"; a="49911509"
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="49911509"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 03:00:43 -0700
X-CSE-ConnectionGUID: CJyEKUixQUyWPRr2nLS+mg==
X-CSE-MsgGUID: OabwQQq0QPyK4YN/wOAsog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,305,1739865600"; d="scan'208";a="140928205"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.112])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2025 03:00:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH] drm/panel: abstract of_panel_find()
Date: Thu, 22 May 2025 13:00:36 +0300
Message-Id: <20250522100036.2529624-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.5
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

Add a helper to wrap OF-specific calls in drm_panel_add_follower() in
preparation for adding an ACPI equivalent in the future. No functional
changes.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_panel.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_panel.c b/drivers/gpu/drm/drm_panel.c
index 650de4da0853..fee65dc65979 100644
--- a/drivers/gpu/drm/drm_panel.c
+++ b/drivers/gpu/drm/drm_panel.c
@@ -473,6 +473,21 @@ int of_drm_get_panel_orientation(const struct device_node *np,
 EXPORT_SYMBOL(of_drm_get_panel_orientation);
 #endif
 
+static struct drm_panel *of_find_panel(struct device *follower_dev)
+{
+	struct device_node *panel_np;
+	struct drm_panel *panel;
+
+	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
+	if (!panel_np)
+		return ERR_PTR(-ENODEV);
+
+	panel = of_drm_find_panel(panel_np);
+	of_node_put(panel_np);
+
+	return panel;
+}
+
 /**
  * drm_is_panel_follower() - Check if the device is a panel follower
  * @dev: The 'struct device' to check
@@ -518,16 +533,10 @@ EXPORT_SYMBOL(drm_is_panel_follower);
 int drm_panel_add_follower(struct device *follower_dev,
 			   struct drm_panel_follower *follower)
 {
-	struct device_node *panel_np;
 	struct drm_panel *panel;
 	int ret;
 
-	panel_np = of_parse_phandle(follower_dev->of_node, "panel", 0);
-	if (!panel_np)
-		return -ENODEV;
-
-	panel = of_drm_find_panel(panel_np);
-	of_node_put(panel_np);
+	panel = of_find_panel(follower_dev);
 	if (IS_ERR(panel))
 		return PTR_ERR(panel);
 
-- 
2.39.5

