Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68FAF7D5712
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 17:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C84A310E0D1;
	Tue, 24 Oct 2023 15:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9F7510E0D1;
 Tue, 24 Oct 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163067; x=1729699067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wMAwZJV3JScd0HFc2FZs453eK1PNONybSnww0CEKj2E=;
 b=m7IpDyIZ/BRc0vJjBcGDbpsnuObnEYeIi80s3fRXrryACFDnjJC92h8n
 FUSrKvUKSkj6FyZCp6I/mDuJLeY1/IXZ2y3byp7jmnpIlC35ClhjOglmd
 g8SEof4Q6Qlx7FRNZxn+lKoq73WZdQ0OOVaKxptXRkLky2VxH6hno7YIV
 8fOuCL76NkoVzhOxBHBg0m3z3QPvwAoALYxh/ThqDOqHy7KtikBl+w44l
 AQF9tfHiT4GGhxOeAlxt5donsYbaYZG+Hq3TZ/FCSsXC7JClsDgmqmpBm
 2jaJTHtuI8HXGI4VXS3ec5NactA15jOpPvwFPnGm0nSJgUiEKo63Lu4K3 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="8649788"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="8649788"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 08:57:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902233849"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="902233849"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2023 08:55:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 431799CE; Tue, 24 Oct 2023 18:57:42 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/7] drm/i915/dsi: Extract common soc_gpio_exec() helper
Date: Tue, 24 Oct 2023 18:57:36 +0300
Message-Id: <20231024155739.3861342-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
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

Extract a common soc_gpio_exec() helper that may be used by a few SoCs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 49 +++++++++++---------
 1 file changed, 27 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 1014051a6866..3fb85b6d320e 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -243,6 +243,32 @@ static const u8 *mipi_exec_delay(struct intel_dsi *intel_dsi, const u8 *data)
 	return data;
 }
 
+static void soc_exec_gpio(struct intel_connector *connector, const char *con_id,
+			  u8 gpio_index, bool value)
+{
+	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
+	/* XXX: this table is a quick ugly hack. */
+	static struct gpio_desc *soc_gpio_table[U8_MAX + 1];
+	struct gpio_desc *gpio_desc = soc_gpio_table[gpio_index];
+
+	if (gpio_desc) {
+		gpiod_set_value(gpio_desc, value);
+	} else {
+		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
+						 con_id, gpio_index,
+						 value ? GPIOD_OUT_LOW :
+						 GPIOD_OUT_HIGH);
+		if (IS_ERR(gpio_desc)) {
+			drm_err(&dev_priv->drm,
+				"GPIO index %u request failed (%pe)\n",
+				gpio_index, gpio_desc);
+			return;
+		}
+
+		soc_gpio_table[gpio_index] = gpio_desc;
+	}
+}
+
 static void vlv_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
@@ -348,28 +374,7 @@ static void chv_exec_gpio(struct intel_connector *connector,
 static void bxt_exec_gpio(struct intel_connector *connector,
 			  u8 gpio_source, u8 gpio_index, bool value)
 {
-	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
-	/* XXX: this table is a quick ugly hack. */
-	static struct gpio_desc *bxt_gpio_table[U8_MAX + 1];
-	struct gpio_desc *gpio_desc = bxt_gpio_table[gpio_index];
-
-	if (!gpio_desc) {
-		gpio_desc = devm_gpiod_get_index(dev_priv->drm.dev,
-						 NULL, gpio_index,
-						 value ? GPIOD_OUT_LOW :
-						 GPIOD_OUT_HIGH);
-
-		if (IS_ERR_OR_NULL(gpio_desc)) {
-			drm_err(&dev_priv->drm,
-				"GPIO index %u request failed (%ld)\n",
-				gpio_index, PTR_ERR(gpio_desc));
-			return;
-		}
-
-		bxt_gpio_table[gpio_index] = gpio_desc;
-	}
-
-	gpiod_set_value(gpio_desc, value);
+	soc_exec_gpio(connector, NULL, gpio_index, value);
 }
 
 static void icl_exec_gpio(struct intel_connector *connector,
-- 
2.40.0.1.gaa8946217a0b

