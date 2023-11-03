Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 655FB7E0A2D
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 21:19:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FD3810EAA0;
	Fri,  3 Nov 2023 20:18:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A63610EA97;
 Fri,  3 Nov 2023 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699042723; x=1730578723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Zmln3yyzcVM/LYPj/mpbDMzt1pG2aWEjj+ZbDI0Y7xM=;
 b=P8EHmTeMCZ5vnDVTzFfR3S8jDEsxBopduXaHrOWax6UgbU0mviKfbR42
 eR12kwVnI6DQ6oUJ5s73kblf3eenbqFoFA1BSITdF9gMcT27GTMQVO2tZ
 P2sw/1noqs95H/RIMGNTZJC/Y06ciGEsC94HQzc8Q6SPlPlTIeS6whGg1
 qCXeTflkW7Cdg0DY8cbk0cUsNOcaGhKbRdHPQ9Bwq0B0sF6LmKm/eZL0T
 pLfau1h9103lxPGtotDHnPV6Po4xUB+6G3G5I6p1L6ONxhYNdIyRJxpNY
 WD1HGgMEyIcJpYW5C4ryFt3IQtCgFwLDctfAmPQtvbgCL7VT/lDOnmbN+ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1896068"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1896068"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:18:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832131147"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="832131147"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 13:18:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 194B0706; Fri,  3 Nov 2023 22:18:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 10/16] drm/i915/dsi: Fix wrong initial value for GPIOs in
 bxt_gpio_set_value()
Date: Fri,  3 Nov 2023 22:18:25 +0200
Message-Id: <20231103201831.1037416-11-andriy.shevchenko@linux.intel.com>
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

From: Hans de Goede <hdegoede@redhat.com>

Fix wrong initial value for GPIOs in bxt_gpio_set_value().

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 8e6beef90e5e..0f9da0168a7b 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -356,9 +356,7 @@ static void bxt_gpio_set_value(struct intel_connector *connector,
 	if (!gpio_desc) {
 		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
 						 NULL, gpio_index,
-						 value ? GPIOD_OUT_LOW :
-						 GPIOD_OUT_HIGH);
-
+						 value ? GPIOD_OUT_HIGH : GPIOD_OUT_LOW);
 		if (IS_ERR_OR_NULL(gpio_desc)) {
 			drm_err(&dev_priv->drm,
 				"GPIO index %u request failed (%ld)\n",
-- 
2.40.0.1.gaa8946217a0b

