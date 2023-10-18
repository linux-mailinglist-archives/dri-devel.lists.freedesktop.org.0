Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B78927CD365
	for <lists+dri-devel@lfdr.de>; Wed, 18 Oct 2023 07:11:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E119A10E37E;
	Wed, 18 Oct 2023 05:11:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDF1C10E37F;
 Wed, 18 Oct 2023 05:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697605864; x=1729141864;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=r5F/WiyvdrNAjPVwemI4owdYzICMknCvacYBMmUKzrY=;
 b=GXQQxtnFDxBTPFuJVOJqrhdCuS5BynYxROsOdVRQ52nffA7GxiMZtlT9
 t6UEglkgcYEMbiVrGO/6NoXHNBnTFCBfo9bKvrxCcojMa5L1wOTg8tm05
 dTo4qsoawQvnSY+8130d//5h023Uc/SRm/YsqCyBYIFFPNj2JlQF3K9il
 thI7CNgzKAVwZijhaXSB4RzR0ena4SN/OKumvFqYE5gPPo5smKmBgZliY
 abJrorny3F1eMgAk5rIKw+AaAjS9o3PfNigkbKt70Rsnw7U+ze3kNI6OI
 6f8Nc2q1O0oRUltbVcCTSra34TrpPWjm8jBT51tcHcALv/tq1oVVJ5JMd Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="389815364"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="389815364"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2023 22:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="900180605"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; d="scan'208";a="900180605"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 17 Oct 2023 22:08:56 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 9F93B17F; Wed, 18 Oct 2023 08:10:58 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] drm/i915/dsi: Replace poking of VLV GPIOs behind the
 driver's back
Date: Wed, 18 Oct 2023 08:10:52 +0300
Message-Id: <20231018051052.1328852-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
References: <20231018051052.1328852-1-andriy.shevchenko@linux.intel.com>
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
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 101 ++++++-------------
 1 file changed, 31 insertions(+), 70 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index c3c3f4df9ac4..35ab4048029d 100644
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
@@ -269,52 +232,44 @@ static void soc_exec_gpio(struct intel_connector *connector, const char *con_id,
 	}
 }
 
+static struct gpiod_lookup_table vlv_gpio_table = {
+	.dev_id = "0000:00:02.0",
+	.table = {
+		GPIO_LOOKUP_IDX("INT33FC:01", 0, "Panel NC", 0, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 1, "Panel NC", 1, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 2, "Panel NC", 2, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 3, "Panel NC", 3, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 4, "Panel NC", 4, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 5, "Panel NC", 5, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 6, "Panel NC", 6, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 7, "Panel NC", 7, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 8, "Panel NC", 8, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 9, "Panel NC", 9, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 10, "Panel NC", 10, GPIO_ACTIVE_HIGH),
+		GPIO_LOOKUP_IDX("INT33FC:01", 11, "Panel NC", 11, GPIO_ACTIVE_HIGH),
+		{ }
+	},
+};
+
 static void vlv_exec_gpio(struct intel_connector *connector,
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
+	soc_exec_gpio(connector, "Panel NC", gpio_index, value);
 }
 
 static void chv_exec_gpio(struct intel_connector *connector,
@@ -974,6 +929,9 @@ void intel_dsi_vbt_gpio_init(struct intel_dsi *intel_dsi, bool panel_is_on)
 	struct pinctrl *pinctrl;
 	int ret;
 
+	if (IS_VALLEYVIEW(dev_priv))
+		gpiod_add_lookup_table(&vlv_gpio_table);
+
 	if ((IS_VALLEYVIEW(dev_priv) || IS_CHERRYVIEW(dev_priv)) &&
 	    mipi_config->pwm_blc == PPS_BLC_PMIC) {
 		gpiod_add_lookup_table(&pmic_panel_gpio_table);
@@ -1043,4 +1001,7 @@ void intel_dsi_vbt_gpio_cleanup(struct intel_dsi *intel_dsi)
 		pinctrl_unregister_mappings(soc_pwm_pinctrl_map);
 		gpiod_remove_lookup_table(&soc_panel_gpio_table);
 	}
+
+	if (IS_VALLEYVIEW(dev_priv))
+		gpiod_remove_lookup_table(&vlv_gpio_table);
 }
-- 
2.40.0.1.gaa8946217a0b

