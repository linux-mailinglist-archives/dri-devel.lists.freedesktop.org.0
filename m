Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 556627DF5EE
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F8310E8EF;
	Thu,  2 Nov 2023 15:12:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 71AEA10E8EF;
 Thu,  2 Nov 2023 15:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937956; x=1730473956;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=sOlXPhm2EWggWgC9auNPoDBOg8jjBU+Gm+8lS7rVTqE=;
 b=FX4cQlRwZI3suHj6Y+6qJhbhDtmXJ9coD4dX+d/0tR9yvLLYcPw6W+Fn
 ttkeX58j+uXfFI/O6pLNeZyp16hDH/k/T4+Wm6JMcNnFKxodD9yV0kEnb
 WCeXCISToH9DfBTkDNp19DmiKn45KktcWBPCHrURvLNfUjmDdZhtjx2+A
 q5i8+Dlnu8SP5pNs3aOj6hqYtbUYBgOJOrWhj3jOyfV65TZAHlhRzf3Ax
 6tmcctEB0onaFz7/UJ3f4oXg36kqvlF3v4ses2hXLHU5YQ4IyfkIBSgKX
 /vjU1uTWnHIHB+S/YS+ecDXYSLiNtizBFi6fxYfWsZtSStJ2UobDxz1jB w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773430"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773430"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711173922"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711173922"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:32 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id A7C3E5E5; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/15] drm/i915/dsi: clarify GPIO exec sequence
Date: Thu,  2 Nov 2023 17:12:16 +0200
Message-Id: <20231102151228.668842-4-andriy.shevchenko@linux.intel.com>
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

With the various sequence versions and pointer increments interleaved,
it's a bit hard to decipher what's going on. Add separate paths for
different sequence versions.

Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 31 +++++++++++---------
 1 file changed, 17 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 8b962f2ac475..11073efe26c0 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -456,26 +456,29 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	struct drm_device *dev = intel_dsi->base.base.dev;
 	struct drm_i915_private *i915 = to_i915(dev);
 	struct intel_connector *connector = intel_dsi->attached_connector;
-	u8 gpio_source, gpio_index = 0, gpio_number;
+	u8 gpio_source = 0, gpio_index = 0, gpio_number;
 	bool value;
+	int size;
 	bool native = DISPLAY_VER(i915) >= 11;
 
-	if (connector->panel.vbt.dsi.seq_version >= 3)
-		gpio_index = *data++;
+	if (connector->panel.vbt.dsi.seq_version >= 3) {
+		size = 3;
 
-	gpio_number = *data++;
+		gpio_index = data[0];
+		gpio_number = data[1];
+		value = data[2] & BIT(0);
 
-	/* gpio source in sequence v2 only */
-	if (connector->panel.vbt.dsi.seq_version == 2)
-		gpio_source = (*data >> 1) & 3;
-	else
-		gpio_source = 0;
+		if (connector->panel.vbt.dsi.seq_version >= 4 && data[2] & BIT(1))
+			native = false;
+	} else {
+		size = 2;
 
-	if (connector->panel.vbt.dsi.seq_version >= 4 && *data & BIT(1))
-		native = false;
+		gpio_number = data[0];
+		value = data[1] & BIT(0);
 
-	/* pull up/down */
-	value = *data++ & 1;
+		if (connector->panel.vbt.dsi.seq_version == 2)
+			gpio_source = (data[1] >> 1) & 3;
+	}
 
 	drm_dbg_kms(&i915->drm, "GPIO index %u, number %u, source %u, native %s, set to %s\n",
 		    gpio_index, gpio_number, gpio_source, str_yes_no(native), str_on_off(value));
@@ -491,7 +494,7 @@ static const u8 *mipi_exec_gpio(struct intel_dsi *intel_dsi, const u8 *data)
 	else
 		bxt_exec_gpio(connector, gpio_source, gpio_index, value);
 
-	return data;
+	return data + size;
 }
 
 #ifdef CONFIG_ACPI
-- 
2.40.0.1.gaa8946217a0b

