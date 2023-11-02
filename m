Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1189F7DF609
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5212010E913;
	Thu,  2 Nov 2023 15:12:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE7D10E915;
 Thu,  2 Nov 2023 15:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937962; x=1730473962;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9aluI6zbH8D/Sjkz7dz1700dHJd2ex1h5F6FMyNEQM8=;
 b=ZOnrt2UbwrYyAtoK/sYSwgSBWeqxCSzRte8bK7cr/16eKaqLqawA1sdl
 kMBVDQMOXEkfc1XcdXZgyngARbKyqiAsxOWuCeJByphYhd2ijBtxa6rFj
 XIUzYU5ay/mol3+YKEKR7tfcYvKmLeB+BdPKzOrgHzcPrmcXOIDqF4DKR
 DtwOU1G6fx7ZSZsBwbGYwdARywUhr9mqxwCfFAHE1BjpQIhKcY8c6I9Q4
 3giy2to2P+Of3UsN1qMz0fDTgepAM/WzGnZdD9miXrTrox7hLmzFtEUZo
 4MiHJoQ6Xpre8EGk5G1gb4+/uHQHTsFD8ekK0YB8MohgoziYVmYbnevbh A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="1660181"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; 
   d="scan'208";a="1660181"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="737784572"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="737784572"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga006.jf.intel.com with ESMTP; 02 Nov 2023 08:12:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 384F1591; Thu,  2 Nov 2023 17:12:31 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 14/15] drm/i915/dsi: Replace poking of CHV GPIOs behind the
 driver's back
Date: Thu,  2 Nov 2023 17:12:27 +0200
Message-Id: <20231102151228.668842-15-andriy.shevchenko@linux.intel.com>
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

It's a dirty hack in the driver that pokes GPIO registers behind
the driver's back. Moreoever it might be problematic as simultaneous
I/O may hang the system, see the commit 0bd50d719b00 ("pinctrl:
cherryview: prevent concurrent access to GPIO controllers") for
the details. Taking all this into consideration replace the hack
with proper GPIO APIs being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 47 +++++---------------
 1 file changed, 10 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index b1736c1301ea..ffc65c943b11 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -66,19 +66,6 @@ struct i2c_adapter_lookup {
 #define CHV_GPIO_IDX_START_SW		100
 #define CHV_GPIO_IDX_START_SE		198
 
-#define CHV_VBT_MAX_PINS_PER_FMLY	15
-
-#define CHV_GPIO_PAD_CFG0(f, i)		(0x4400 + (f) * 0x400 + (i) * 8)
-#define  CHV_GPIO_GPIOEN		(1 << 15)
-#define  CHV_GPIO_GPIOCFG_GPIO		(0 << 8)
-#define  CHV_GPIO_GPIOCFG_GPO		(1 << 8)
-#define  CHV_GPIO_GPIOCFG_GPI		(2 << 8)
-#define  CHV_GPIO_GPIOCFG_HIZ		(3 << 8)
-#define  CHV_GPIO_GPIOTXSTATE(state)	((!!(state)) << 1)
-
-#define CHV_GPIO_PAD_CFG1(f, i)		(0x4400 + (f) * 0x400 + (i) * 8 + 4)
-#define  CHV_GPIO_CFGLOCK		(1 << 31)
-
 /* ICL DSI Display GPIO Pins */
 #define  ICL_GPIO_DDSP_HPD_A		0
 #define  ICL_GPIO_L_VDDEN_1		1
@@ -278,23 +265,21 @@ static void chv_gpio_set_value(struct intel_connector *connector,
 			       u8 gpio_source, u8 gpio_index, bool value)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	u16 cfg0, cfg1;
-	u16 family_num;
-	u8 port;
 
 	if (connector->panel.vbt.dsi.seq_version >= 3) {
 		if (gpio_index >= CHV_GPIO_IDX_START_SE) {
 			/* XXX: it's unclear whether 255->57 is part of SE. */
-			gpio_index -= CHV_GPIO_IDX_START_SE;
-			port = CHV_IOSF_PORT_GPIO_SE;
+			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:03", "Panel SE",
+					     gpio_index - CHV_GPIO_IDX_START_SW, value);
 		} else if (gpio_index >= CHV_GPIO_IDX_START_SW) {
-			gpio_index -= CHV_GPIO_IDX_START_SW;
-			port = CHV_IOSF_PORT_GPIO_SW;
+			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:00", "Panel SW",
+					     gpio_index - CHV_GPIO_IDX_START_SW, value);
 		} else if (gpio_index >= CHV_GPIO_IDX_START_E) {
-			gpio_index -= CHV_GPIO_IDX_START_E;
-			port = CHV_IOSF_PORT_GPIO_E;
+			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:02", "Panel E",
+					     gpio_index - CHV_GPIO_IDX_START_E, value);
 		} else {
-			port = CHV_IOSF_PORT_GPIO_N;
+			soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
+					     gpio_index - CHV_GPIO_IDX_START_N, value);
 		}
 	} else {
 		/* XXX: The spec is unclear about CHV GPIO on seq v2 */
@@ -311,21 +296,9 @@ static void chv_gpio_set_value(struct intel_connector *connector,
 			return;
 		}
 
-		port = CHV_IOSF_PORT_GPIO_N;
+		soc_exec_opaque_gpio(connector, gpio_index, "INT33FF:01", "Panel N",
+				     gpio_index - CHV_GPIO_IDX_START_N, value);
 	}
-
-	family_num = gpio_index / CHV_VBT_MAX_PINS_PER_FMLY;
-	gpio_index = gpio_index % CHV_VBT_MAX_PINS_PER_FMLY;
-
-	cfg0 = CHV_GPIO_PAD_CFG0(family_num, gpio_index);
-	cfg1 = CHV_GPIO_PAD_CFG1(family_num, gpio_index);
-
-	vlv_iosf_sb_get(dev_priv, BIT(VLV_IOSF_SB_GPIO));
-	vlv_iosf_sb_write(dev_priv, port, cfg1, 0);
-	vlv_iosf_sb_write(dev_priv, port, cfg0,
-			  CHV_GPIO_GPIOEN | CHV_GPIO_GPIOCFG_GPO |
-			  CHV_GPIO_GPIOTXSTATE(value));
-	vlv_iosf_sb_put(dev_priv, BIT(VLV_IOSF_SB_GPIO));
 }
 
 static void bxt_gpio_set_value(struct intel_connector *connector,
-- 
2.40.0.1.gaa8946217a0b

