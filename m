Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F36A7DF5EC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:12:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FC5510E8FC;
	Thu,  2 Nov 2023 15:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4424A10E8E9;
 Thu,  2 Nov 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937956; x=1730473956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zPRCzYNN16HwjO3RHBcn1H7M4PO+1uvgVko+eIKdfwQ=;
 b=OyXdTJRANKn/Wso0a1rLf7IX2QCBhptlJUJDD5T4icbkotY1i9HiYDgW
 DwHVtLTFTYQ0vrAF/ec2mtZ/NZfPJeufuUH5i+TQe8VrDvpNgd62XeoHV
 K+9q0sM4faDTkaEWpjL6cWjIfnC081xs+ua/uYvZ/ZZb20SvC1tTiRPJV
 TLqoBgo+b2hI4CJoxAemsfiuCjDEDD/j1olFbHIg5CFYyahVC9KbMz0FT
 jwegnCF5U4nWYSM74vuJMtXjVodiF9xl/TXaQjuzQ/CLG60zVH8CEKcC3
 apN1A+E7kIXiBlxgbDBmOahOWR22wrd4OU4zWYS5IPaECazQcHGmGf1uz w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773422"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773422"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711173920"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711173920"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 8757154A; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 01/15] drm/i915/dsi: assume BXT gpio works for non-native
 GPIO
Date: Thu,  2 Nov 2023 17:12:14 +0200
Message-Id: <20231102151228.668842-2-andriy.shevchenko@linux.intel.com>
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

