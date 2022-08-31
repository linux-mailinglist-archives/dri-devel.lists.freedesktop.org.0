Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E035A8875
	for <lists+dri-devel@lfdr.de>; Wed, 31 Aug 2022 23:51:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E99410E48F;
	Wed, 31 Aug 2022 21:50:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF58710E48F;
 Wed, 31 Aug 2022 21:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661982632; x=1693518632;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=k1yP/E508kITbvAToBGHC9Y3wzWp3DgTxVjqFqp8mwE=;
 b=oG7OIm+o68tXLnd8m7bQ4Mxp7Yopef7KMCyOpNHJPTt7SV69LrHbHgUU
 RE91XyT9jyYryH5AMLeH8prFGLFoIgRdv8sOMXjaz9Qjo7zHodEON4/Mu
 n822RR8F8w2hEJjpDlq/H23kQjYUTm42QXj1lmZHppKOsaGMZTw7T5gjd
 4IIkX9gZjuJJWi5PlbJXD6k0xXd+96m7/C1drY9XMAm33ivEg8bDblRFn
 RVmj76Tx3QJIzPzRIeTZLYgj82QkjAwYM+303YKdE146VieSvOEq+w3Ne
 c4XHMlvE9BmKtpVLU+53lYdpB0xS9BYT7SXoISmz+dQP6Lig9ElZGF1w+ w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="357270162"
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="357270162"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:31 -0700
X-IronPort-AV: E=Sophos;i="5.93,279,1654585200"; d="scan'208";a="940586226"
Received: from invictus.jf.intel.com ([10.165.21.206])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 14:50:31 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 05/11] drm/i915/mtl: Add gmbus and gpio support
Date: Wed, 31 Aug 2022 14:49:52 -0700
Message-Id: <20220831214958.109753-6-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
References: <20220831214958.109753-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add tables to map the GMBUS pin pairs to GPIO registers and port to DDC.
From spec we have registers GPIO_CTL[1-5] mapped to native display phys and
GPIO_CTL[9-12] are mapped to TC ports.

v2:
 - Drop unused GPIO pins(MattR)

BSpec: 49306

Cc: Matt Roper <matthew.d.roper@intel.com>
Original Author: Brian J Lovin
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 15 +++++++++++++++
 drivers/gpu/drm/i915/display/intel_gmbus.h |  1 +
 2 files changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 6f6cfccad477..74443f57f62d 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -117,6 +117,18 @@ static const struct gmbus_pin gmbus_pins_dg2[] = {
 	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
 };
 
+static const struct gmbus_pin gmbus_pins_mtp[] = {
+	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
+	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
+	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
+	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
+	[GMBUS_PIN_5_MTP] = { "dpe", GPIOF },
+	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
+	[GMBUS_PIN_10_TC2_ICP] = { "tc2", GPIOK },
+	[GMBUS_PIN_11_TC3_ICP] = { "tc3", GPIOL },
+	[GMBUS_PIN_12_TC4_ICP] = { "tc4", GPIOM },
+};
+
 static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *i915,
 					     unsigned int pin)
 {
@@ -129,6 +141,9 @@ static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *i915,
 	} else if (INTEL_PCH_TYPE(i915) >= PCH_DG1) {
 		pins = gmbus_pins_dg1;
 		size = ARRAY_SIZE(gmbus_pins_dg1);
+	} else if (INTEL_PCH_TYPE(i915) >= PCH_MTP) {
+		pins = gmbus_pins_mtp;
+		size = ARRAY_SIZE(gmbus_pins_mtp);
 	} else if (INTEL_PCH_TYPE(i915) >= PCH_ICP) {
 		pins = gmbus_pins_icp;
 		size = ARRAY_SIZE(gmbus_pins_icp);
diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.h b/drivers/gpu/drm/i915/display/intel_gmbus.h
index 8edc2e99cf53..20f704bd4e70 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.h
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.h
@@ -24,6 +24,7 @@ struct i2c_adapter;
 #define GMBUS_PIN_2_BXT		2
 #define GMBUS_PIN_3_BXT		3
 #define GMBUS_PIN_4_CNP		4
+#define GMBUS_PIN_5_MTP		5
 #define GMBUS_PIN_9_TC1_ICP	9
 #define GMBUS_PIN_10_TC2_ICP	10
 #define GMBUS_PIN_11_TC3_ICP	11
-- 
2.25.1

