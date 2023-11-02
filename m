Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 997D17DF5F1
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF59310E902;
	Thu,  2 Nov 2023 15:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C371610E8EF;
 Thu,  2 Nov 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937956; x=1730473956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aU19ThGhUQIWXfbukrzCcpY3j2hr2UFUIRy/UhZ9hVU=;
 b=hZdXG55OcjUBu5mllZps5OMUtPFOCNS4zoCyqQqgphWOiCwYnF8RiGJz
 9EYXECHr2IVm75WQ3bkruDWrup9Bd0n1dXrvze5ytOqUSDsgLIAhUTBvY
 nSVqakLDTZnglPtCsbBcMaaZ39Ikxn3HNLvBATL61k3j9SpAmhaFJ2ki9
 UqZZ9E9ETzjkHnV9HDuZ5DlQJZjlUOFdzNnWIeg69AtvXzHiOL4tjnziJ
 jCp32RWVrZdUfc+DZqKfaVqFCYjnza18OfunJUvcJe7q+VM4jWer3Ex0x
 4cfoQAQhe5LaIblCZkciLubpXrJ3BqWu8vHeK4a0GVkOS89e0eXfN+gzj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773440"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773440"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711173932"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711173932"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9CBCF5E2; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/15] drm/i915/dsi: switch mipi_exec_gpio() from dev_priv
 to i915
Date: Thu,  2 Nov 2023 17:12:15 +0200
Message-Id: <20231102151228.668842-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jani Nikula <jani.nikula@intel.com>

Follow the contemporary conventions.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index b2c0cc11f8c1..8b962f2ac475 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -454,11 +454,11 @@ static void icl_native_gpio_set_value(struct drm_i915_private *dev_priv,
 static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 {
 	struct drm_device *dev = intel_dsi->base.base.dev;
-	struct drm_i915_private *dev_priv = to_i915(dev);
+	struct drm_i915_private *i915 = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
 	u8 gpio_source, gpio_index = 0, gpio_number;
 	bool value;
-	bool native = DISPLAY_VER(dev_priv) >= 11;
+	bool native = DISPLAY_VER(i915) >= 11;
 
 	if (connector->panel.vbt.dsi.seq_version >= 3)
 		gpio_index = *data++;
@@ -477,16 +477,16 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	/* pull up/down */
 	value = *data++ & 1;
 
-	drm_dbg_kms(&dev_priv->drm, "GPIO index %u, number %u, source %u, native %s, set to %s\n",
+	drm_dbg_kms(&i915->drm, "GPIO index %u, number %u, source %u, native %s, set to %s\n",
 		    gpio_index, gpio_number, gpio_source, str_yes_no(native), str_on_off(value));
 
 	if (native)
-		icl_native_gpio_set_value(dev_priv, gpio_number, value);
-	else if (DISPLAY_VER(dev_priv) >= 11)
+		icl_native_gpio_set_value(i915, gpio_number, value);
+	else if (DISPLAY_VER(i915) >= 11)
 		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
-	else if (IS_VALLEYVIEW(dev_priv))
+	else if (IS_VALLEYVIEW(i915))
 		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
-	else if (IS_CHERRYVIEW(dev_priv))
+	else if (IS_CHERRYVIEW(i915))
 		chv_exec_gpio(connector, gpio_source, gpio_number, value);
 	else
 		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
-- 
2.40.0.1.gaa8946217a0b

