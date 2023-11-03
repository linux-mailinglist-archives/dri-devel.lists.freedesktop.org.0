Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B0C737E0A25
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 21:19:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16A6D10EAAD;
	Fri,  3 Nov 2023 20:18:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D58C610EA9C;
 Fri,  3 Nov 2023 20:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699042725; x=1730578725;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dJYH4bpZB4D6gpUDi338sRrXHssESnJCrAN+Nzo1Zug=;
 b=ABOzRS0k7Nlc0QOIvnwgCy7VbUlEY+DLOtUI4edBBXVFkviaJHW1mtRx
 wjxNaNLw5uXCv6s2M/KZPR94Q1/m4t1C0UvuUeFv475xB+2uUCUsq9ToE
 +/AEmXmGum9Z2a7Coq9Msg/2y87O/bvJbBaF0RXFgKOb6n2vvOvQtfwmX
 +P/Jn0EgS3UZJaRXiE1dds5Hk5Ahc3urJ2BUPAQkSomCXct4EQchEExGe
 PjTjzxKztVWft8AL6lbKoUW/CoBoE9HBLbe9KEVlH+goV95wlUCQ+muIG
 iGbkVf59S2CN51NCRA+YZmHE5inCzikFv/7w5Ykxk3W9NozBYKxVd1hnW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1896104"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1896104"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:18:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832131191"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="832131191"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 13:18:40 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 3442F76D; Fri,  3 Nov 2023 22:18:34 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 12/16] drm/i915/dsi: Replace poking of VLV GPIOs behind the
 driver's back
Date: Fri,  3 Nov 2023 22:18:27 +0200
Message-Id: <20231103201831.1037416-13-andriy.shevchenko@linux.intel.com>
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

It's a dirty hack in the driver that pokes GPIO registers behind
the driver's back. Moreoever it might be problematic as simultaneous
I/O may hang the system, see the commit 40ecab551232 ("pinctrl:
baytrail: Really serialize all register accesses") for the details.
Taking all this into consideration replace the hack with proper
GPIO APIs being used.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 98 ++++++--------------
 1 file changed, 28 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 9847a92fdfc3..552bc6564d79 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -55,43 +55,6 @@
 #define MIPI_VIRTUAL_CHANNEL_SHIFT	1
 #define MIPI_PORT_SHIFT			3
 
-/* base offsets for gpio pads */
-#define VLV_GPIO_NC_0_HV_DDI0_HPD	0x4130
-#define VLV_GPIO_NC_1_HV_DDI0_DDC_SDA	0x4120
-#define VLV_GPIO_NC_2_HV_DDI0_DDC_SCL	0x4110
-#define VLV_GPIO_NC_3_PANEL0_VDDEN	0x4140
-#define VLV_GPIO_NC_4_PANEL0_BKLTEN	0x4150
-#define VLV_GPIO_NC_5_PANEL0_BKLTCTL	0x4160
-#define VLV_GPIO_NC_6_HV_DDI1_HPD	0x4180
-#define VLV_GPIO_NC_7_HV_DDI1_DDC_SDA	0x4190
-#define VLV_GPIO_NC_8_HV_DDI1_DDC_SCL	0x4170
-#define VLV_GPIO_NC_9_PANEL1_VDDEN	0x4100
-#define VLV_GPIO_NC_10_PANEL1_BKLTEN	0x40E0
-#define VLV_GPIO_NC_11_PANEL1_BKLTCTL	0x40F0
-
-#define VLV_GPIO_PCONF0(base_offset)	(base_offset)
-#define VLV_GPIO_PAD_VAL(base_offset)	((base_offset) + 8)
-
-struct gpio_map {
-	u16 base_offset;
-	bool init;
-};
-
-static struct gpio_map vlv_gpio_table[] = {
-	{ VLV_GPIO_NC_0_HV_DDI0_HPD },
-	{ VLV_GPIO_NC_1_HV_DDI0_DDC_SDA },
-	{ VLV_GPIO_NC_2_HV_DDI0_DDC_SCL },
-	{ VLV_GPIO_NC_3_PANEL0_VDDEN },
-	{ VLV_GPIO_NC_4_PANEL0_BKLTEN },
-	{ VLV_GPIO_NC_5_PANEL0_BKLTCTL },
-	{ VLV_GPIO_NC_6_HV_DDI1_HPD },
-	{ VLV_GPIO_NC_7_HV_DDI1_DDC_SDA },
-	{ VLV_GPIO_NC_8_HV_DDI1_DDC_SCL },
-	{ VLV_GPIO_NC_9_PANEL1_VDDEN },
-	{ VLV_GPIO_NC_10_PANEL1_BKLTEN },
-	{ VLV_GPIO_NC_11_PANEL1_BKLTCTL },
-};
-
 struct i2c_adapter_lookup {
 	u16 slave_addr;
 	struct intel_dsi *intel_dsi;
@@ -268,52 +231,47 @@ static void soc_gpio_set_value(struct intel_connector *connector, const char *co
 	}
 }
 
+static void soc_opaque_gpio_set_value(struct intel_connector *connector,
+				      const char *chip, const char *con_id,
+				      u8 gpio_index, bool value)
+{
+	struct gpiod_lookup_table *lookup;
+
+	lookup = kzalloc(struct_size(lookup, table, 2), GFP_KERNEL);
+	if (!lookup)
+		return;
+
+	lookup->dev_id = "0000:00:02.0";
+	lookup->table[0] =
+		GPIO_LOOKUP_IDX(chip, gpio_index, con_id, gpio_index, GPIO_ACTIVE_HIGH);
+
+	gpiod_add_lookup_table(lookup);
+
+	soc_gpio_set_value(connector, con_id, gpio_index, value);
+
+	gpiod_remove_lookup_table(lookup);
+	kfree(lookup);
+}
+
 static void vlv_gpio_set_value(struct intel_connector *connector,
 			       u8 gpio_source, u8 gpio_index, bool value)
 {
 	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	struct gpio_map *map;
-	u16 pconf0, padval;
-	u32 tmp;
-	u8 port;
 
-	if (gpio_index >= ARRAY_SIZE(vlv_gpio_table)) {
-		drm_dbg_kms(&dev_priv->drm, "unknown gpio index %u\n",
-			    gpio_index);
-		return;
-	}
-
-	map = &vlv_gpio_table[gpio_index];
-
-	if (connector->panel.vbt.dsi.seq_version >= 3) {
-		/* XXX: this assumes vlv_gpio_table only has NC GPIOs. */
-		port = IOSF_PORT_GPIO_NC;
-	} else {
-		if (gpio_source == 0) {
-			port = IOSF_PORT_GPIO_NC;
-		} else if (gpio_source == 1) {
+	/* XXX: this assumes vlv_gpio_table only has NC GPIOs. */
+	if (connector->panel.vbt.dsi.seq_version < 3) {
+		if (gpio_source == 1) {
 			drm_dbg_kms(&dev_priv->drm, "SC gpio not supported\n");
 			return;
-		} else {
+		}
+		if (gpio_source > 1) {
 			drm_dbg_kms(&dev_priv->drm,
 				    "unknown gpio source %u\n", gpio_source);
 			return;
 		}
 	}
 
-	pconf0 = VLV_GPIO_PCONF0(map->base_offset);
-	padval = VLV_GPIO_PAD_VAL(map->base_offset);
-
-	vlv_iosf_sb_get(dev_priv, BIT(VLV_IOSF_SB_GPIO));
-	if (!map->init) {
-		/* FIXME: remove constant below */
-		vlv_iosf_sb_write(dev_priv, port, pconf0, 0x2000CC00);
-		map->init = true;
-	}
-
-	tmp = 0x4 | value;
-	vlv_iosf_sb_write(dev_priv, port, padval, tmp);
-	vlv_iosf_sb_put(dev_priv, BIT(VLV_IOSF_SB_GPIO));
+	soc_opaque_gpio_set_value(connector, "INT33FC:01", "Panel N", gpio_index, value);
 }
 
 static void chv_gpio_set_value(struct intel_connector *connector,
-- 
2.40.0.1.gaa8946217a0b

