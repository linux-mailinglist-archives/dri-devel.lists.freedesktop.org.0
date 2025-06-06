Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3FC7ACFEC3
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jun 2025 11:06:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDD210EA26;
	Fri,  6 Jun 2025 09:06:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K78PUQgi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2F9410EA26;
 Fri,  6 Jun 2025 09:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749200792; x=1780736792;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z7efIuXLuMIXka5vNF/IzvVuwawr3KlFI4d/EEF9UUs=;
 b=K78PUQgiMksc94xb3JFWIfxOSGmEHvGx7+5Z2FFbb0Nb4NLjS+6i/Lk1
 mSxXZcXE6M9zLATSs+Eun7qE5A0qCj8ZM4hMEEitbWNFZQZWzeuhiC3ff
 ZHl/LrKCviwwZHq8v5WgvbbUIzfAkZ4d0m7jJZ12S7OPqdomCXKd/igNI
 cv8ngyUu3NgdL+qOV1gvuATUXqT7jxfUjQ3yUXteMk40iP25LMxFc7adK
 h26LoLDkhpuTE7CtC4BCZVaviT7puCBEll/hK165TKye4cxbSSNvR8PEv
 SUmThE2jQwfaB0jmBF0llpVsFjed5JqhNF8osDajOLdMJfyMsCuyqWoh0 w==;
X-CSE-ConnectionGUID: htz4V10URCmPJ3t/Ir2XyA==
X-CSE-MsgGUID: avVWGCVzShmqm6y7atuIkA==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="68785074"
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="68785074"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:32 -0700
X-CSE-ConnectionGUID: Ffo43bgFT0+6BR1hlqNPKw==
X-CSE-MsgGUID: PabNXpdrTV26FQbvlYynyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,214,1744095600"; d="scan'208";a="146289571"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.245.33])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jun 2025 02:06:23 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Wysocki Rafael J <rafael.j.wysocki@intel.com>,
 Lee Shawn C <shawn.c.lee@intel.com>, simon1.yang@intel.com,
 Doug Anderson <dianders@chromium.org>, Maxime Ripard <mripard@kernel.org>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 2/4] drm/i915/panel: add panel register/unregister
Date: Fri,  6 Jun 2025 12:05:10 +0300
Message-Id: <b737d4bc8b91df630cd4db4648f3a3571989cfd8.1749199013.git.jani.nikula@intel.com>
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

Add panel register/unregister functions, and handle backlight
register/unregister from there. This is in preparation for adding more
panel specific register/unregister functionality.

Cc: Lee Shawn C <shawn.c.lee@intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 .../gpu/drm/i915/display/intel_connector.c    | 23 +++++++++----------
 drivers/gpu/drm/i915/display/intel_panel.c    | 10 ++++++++
 drivers/gpu/drm/i915/display/intel_panel.h    |  2 ++
 3 files changed, 23 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 9a61c972dce9..2867d76d1a5e 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -32,7 +32,6 @@
 
 #include "i915_drv.h"
 #include "i915_utils.h"
-#include "intel_backlight.h"
 #include "intel_connector.h"
 #include "intel_display_core.h"
 #include "intel_display_debugfs.h"
@@ -153,36 +152,36 @@ void intel_connector_destroy(struct drm_connector *connector)
 	kfree(connector);
 }
 
-int intel_connector_register(struct drm_connector *connector)
+int intel_connector_register(struct drm_connector *_connector)
 {
-	struct intel_connector *intel_connector = to_intel_connector(connector);
-	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct intel_connector *connector = to_intel_connector(_connector);
+	struct drm_i915_private *i915 = to_i915(_connector->dev);
 	int ret;
 
-	ret = intel_backlight_device_register(intel_connector);
+	ret = intel_panel_register(connector);
 	if (ret)
 		goto err;
 
 	if (i915_inject_probe_failure(i915)) {
 		ret = -EFAULT;
-		goto err_backlight;
+		goto err_panel;
 	}
 
-	intel_connector_debugfs_add(intel_connector);
+	intel_connector_debugfs_add(connector);
 
 	return 0;
 
-err_backlight:
-	intel_backlight_device_unregister(intel_connector);
+err_panel:
+	intel_panel_unregister(connector);
 err:
 	return ret;
 }
 
-void intel_connector_unregister(struct drm_connector *connector)
+void intel_connector_unregister(struct drm_connector *_connector)
 {
-	struct intel_connector *intel_connector = to_intel_connector(connector);
+	struct intel_connector *connector = to_intel_connector(_connector);
 
-	intel_backlight_device_unregister(intel_connector);
+	intel_panel_unregister(connector);
 }
 
 void intel_connector_attach_encoder(struct intel_connector *connector,
diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
index f5c972880391..5ae302bee191 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.c
+++ b/drivers/gpu/drm/i915/display/intel_panel.c
@@ -462,3 +462,13 @@ void intel_panel_fini(struct intel_connector *connector)
 		drm_mode_destroy(connector->base.dev, fixed_mode);
 	}
 }
+
+int intel_panel_register(struct intel_connector *connector)
+{
+	return intel_backlight_device_register(connector);
+}
+
+void intel_panel_unregister(struct intel_connector *connector)
+{
+	intel_backlight_device_unregister(connector);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_panel.h b/drivers/gpu/drm/i915/display/intel_panel.h
index b60d12322e5d..3d592a4404f3 100644
--- a/drivers/gpu/drm/i915/display/intel_panel.h
+++ b/drivers/gpu/drm/i915/display/intel_panel.h
@@ -23,6 +23,8 @@ void intel_panel_init_alloc(struct intel_connector *connector);
 int intel_panel_init(struct intel_connector *connector,
 		     const struct drm_edid *fixed_edid);
 void intel_panel_fini(struct intel_connector *connector);
+int intel_panel_register(struct intel_connector *connector);
+void intel_panel_unregister(struct intel_connector *connector);
 enum drm_connector_status
 intel_panel_detect(struct drm_connector *connector, bool force);
 bool intel_panel_use_ssc(struct intel_display *display);
-- 
2.39.5

