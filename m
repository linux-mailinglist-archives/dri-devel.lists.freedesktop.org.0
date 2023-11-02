Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FECA7DF5F3
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD26E10E90E;
	Thu,  2 Nov 2023 15:12:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D90510E8E9;
 Thu,  2 Nov 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937956; x=1730473956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+d2Ama+P0okGNCcoxtJKk+xZsdc9UC+/3+lzRqHrSJs=;
 b=dAPltvualjxT6Z8KtfAsGjNCzGY8iMo7YFDcxnkDLl34S6k2xj6rIQtI
 Y2YTi+kjRTcpnwZ7irib0+eT2+wcoItNtvQmA3jHbeSd3fMzBuWclPLVP
 0FBXFHEssrLeM2B1vFG4bo4TIQ4OUOjNq3GME1LBkkGrbTfv0zLZO4m5q
 1H+4xCIqiq/bgUcytKnhSXAwf9KMTHEUlVGbWb5ZtcN7xmKDWfk3jYTt7
 iH0C2ucGjIXgxXMyW1yQRi+cJt7e0Nkv1jRhQUgjqNMaHeKyhrPJW6D4D
 ozGEdkQhChDpVa/HqZTVilVajet0TNwhD7ZrL/tZKfSCf4IQ83vWhJba/ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773434"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773434"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711173926"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711173926"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id B761B5E8; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/15] drm/i915/dsi: rename platform specific *_exec_gpio()
 to *_gpio_set_value()
Date: Thu,  2 Nov 2023 17:12:17 +0200
Message-Id: <20231102151228.668842-5-andriy.shevchenko@linux.intel.com>
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

The lowest level functions are about setting GPIO values, not about
executing any sequences anymore.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 11073efe26c0..f977d63a0ad4 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -243,8 +243,8 @@ static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 	return data;
 }
 
-static void vlv_exec_gpio(struct intel_connector *connector,
-			  u8 gpio_source, u8 gpio_index, bool value)
+static void vlv_gpio_set_value(struct intel_connector *connector,
+			       u8 gpio_source, u8 gpio_index, bool value)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	struct gpio_map *map;
@@ -291,8 +291,8 @@ static void vlv_exec_gpio(struct intel_connector *connector,
 	vlv_iosf_sb_put(dev_priv, BIT(VLV_IOSF_SB_GPIO));
 }
 
-static void chv_exec_gpio(struct intel_connector *connector,
-			  u8 gpio_source, u8 gpio_index, bool value)
+static void chv_gpio_set_value(struct intel_connector *connector,
+			       u8 gpio_source, u8 gpio_index, bool value)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	u16 cfg0, cfg1;
@@ -345,8 +345,8 @@ static void chv_exec_gpio(struct intel_connector *connector,
 	vlv_iosf_sb_put(dev_priv, BIT(VLV_IOSF_SB_GPIO));
 }
 
-static void bxt_exec_gpio(struct intel_connector *connector,
-			  u8 gpio_source, u8 gpio_index, bool value)
+static void bxt_gpio_set_value(struct intel_connector *connector,
+			       u8 gpio_source, u8 gpio_index, bool value)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
 	/* XXX: this table is a quick ugly hack. */
@@ -486,13 +486,13 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	if (native)
 		icl_native_gpio_set_value(i915, gpio_number, value);
 	else if (DISPLAY_VER(i915) >= 11)
-		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
+		bxt_gpio_set_value(connector, gpio_source, gpio_index, value);
 	else if (IS_VALLEYVIEW(i915))
-		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
+		vlv_gpio_set_value(connector, gpio_source, gpio_number, value);
 	else if (IS_CHERRYVIEW(i915))
-		chv_exec_gpio(connector, gpio_source, gpio_number, value);
+		chv_gpio_set_value(connector, gpio_source, gpio_number, value);
 	else
-		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
+		bxt_gpio_set_value(connector, gpio_source, gpio_index, value);
 
 	return data + size;
 }
-- 
2.40.0.1.gaa8946217a0b

