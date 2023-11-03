Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A0857E0A18
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 21:19:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C112E10EA97;
	Fri,  3 Nov 2023 20:18:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F389210EA8C;
 Fri,  3 Nov 2023 20:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699042721; x=1730578721;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPRCzYNN16HwjO3RHBcn1H7M4PO+1uvgVko+eIKdfwQ=;
 b=OqptCPVIepR4G405OUb0ZU+CAqne/L7h3VQj4A4KE9UPrWKvJm1FYZpJ
 DcSghLnpE6k1OJTbzpxR++BBmacDTLvGAhIJ0cmzowoxuY0U3h5FoqR4J
 aulzXpFxAYDbGLagReBsyyb8KXhdmfnQuXQp6j4BgEOROuWKJxr2kUwoR
 BFl+gsEx4aZRLHuaAp5lRnjDQay94wP1YmuKMl4URjPcTo3QO4zli2tUZ
 9yyeV9YTBixI8dJ5B48Fkc5gr+LrfjP2VWd/XXblpa81XX3m8E55lH+vz
 1X2CVnMtK8VCRyipyRQdDxnEpnG7q9B3lUMjEzKZ7FdV5Cpr+Kvp+yX4t g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="387904498"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="387904498"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:18:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="885303644"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="885303644"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga004.jf.intel.com with ESMTP; 03 Nov 2023 13:18:34 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9BEB42A6; Fri,  3 Nov 2023 22:18:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 01/16] drm/i915/dsi: assume BXT gpio works for non-native
 GPIO
Date: Fri,  3 Nov 2023 22:18:16 +0200
Message-Id: <20231103201831.1037416-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
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

Purely a guess. Drop the nop function.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 24b2cbcfc1ef..b2c0cc11f8c1 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -372,14 +372,6 @@ static void bxt_exec_gpio(struct intel_connector *connector,
 	gpiod_set_value(gpio_desc, value);
 }
 
-static void icl_exec_gpio(struct intel_connector *connector,
-			  u8 gpio_source, u8 gpio_index, bool value)
-{
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-
-	drm_dbg_kms(&dev_priv->drm, "Skipping ICL GPIO element execution\n");
-}
-
 enum {
 	MIPI_RESET_1 = 0,
 	MIPI_AVDD_EN_1,
@@ -491,7 +483,7 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	if (native)
 		icl_native_gpio_set_value(dev_priv, gpio_number, value);
 	else if (DISPLAY_VER(dev_priv) >= 11)
-		icl_exec_gpio(connector, gpio_source, gpio_index, value);
+		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
 	else if (IS_VALLEYVIEW(dev_priv))
 		vlv_exec_gpio(connector, gpio_source, gpio_number, value);
 	else if (IS_CHERRYVIEW(dev_priv))
-- 
2.40.0.1.gaa8946217a0b

