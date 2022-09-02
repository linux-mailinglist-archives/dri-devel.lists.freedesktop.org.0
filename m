Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B567A5AA7AC
	for <lists+dri-devel@lfdr.de>; Fri,  2 Sep 2022 08:05:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 456F310E75A;
	Fri,  2 Sep 2022 06:04:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B297F10E751;
 Fri,  2 Sep 2022 06:04:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662098666; x=1693634666;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YsK7nfUez2ZCdCIoFuV2Su0HjWFflRwvQ8D9w9GchbA=;
 b=EkPGkbBEU9ejcRw/OhdIWmpd4YIpeGMxvy11n8e/JoYccyYntOcm/ahz
 VW1OKOBfWl4yKpXINtMvTa9l+dmKZzW6eKP3QLDReLTV3X/YEjNEu2Xuy
 +S+5HHmbeOtF4UT+sO7Hjrlej235X3DPxNOjnufyrjhmFPZRjUABKZU2o
 +P3YKBmVEKhn/5TrG/cRbvzCniudGDQ9ApSuLN31OlxvaR1t6jViOvSQ5
 yu39jR0Mg1H8KU8agR1xNWItYktwqbXQ4PG49KwYkYWqTHpyXyv41Gb6h
 aZKlfiGv1WUqa2mo4RsN8YFVs6OYrIvrmLysU7EITeGNdjtkyYhI5uLIh w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10457"; a="359861285"
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="359861285"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:25 -0700
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; d="scan'208";a="755144597"
Received: from invictus.jf.intel.com ([10.165.21.188])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 23:04:24 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 05/11] drm/i915/mtl: Add gmbus and gpio support
Date: Thu,  1 Sep 2022 23:03:36 -0700
Message-Id: <20220902060342.151824-6-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
References: <20220902060342.151824-1-radhakrishna.sripada@intel.com>
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
2.34.1

