Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36DD54B631F
	for <lists+dri-devel@lfdr.de>; Tue, 15 Feb 2022 06:51:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C073910E2B4;
	Tue, 15 Feb 2022 05:51:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFA0A10E193;
 Tue, 15 Feb 2022 05:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644904305; x=1676440305;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=cYDH/KfeA/y0oCbd/WO1KBur8RrD+p0xUoa0K/psO2E=;
 b=UThXu23XjKRK8Uo8VX8dt6UZTWM51rcobFhIrM4DpY8b3gZN7X6XAf/D
 sBVz2zM/7n6zIt83Mp1kAL/8evykwL8qm68kfwAV3++q6lTJtAc4qQH1L
 6+lhyvVNeqrES0KdPqQgS650Msdj/Wwm+nJi2sAZSZBjDhuRuWBA0c3YP
 Wuivl+wVJ/Nwi/Pdx+zYoSMF+fB1wSzjqVS9YOD4gqvWuaF1lWRrF2kWM
 oxkUtbtUkRH8/ZSgBcomobAnALQ7UBf40Kmw+yi2t6M1xmDBJhzxi6J/q
 qr640fhyCDajkBFDJD434XZuhALKNPKl8Ue/9wJT3wJchSOaaKV6wbPoq w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10258"; a="233802220"
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="233802220"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 21:51:45 -0800
X-IronPort-AV: E=Sophos;i="5.88,370,1635231600"; d="scan'208";a="544109285"
Received: from ramaling-i9x.iind.intel.com ([10.203.144.108])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Feb 2022 21:51:42 -0800
From: Ramalingam C <ramalingam.c@intel.com>
To: intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Subject: [PATCH 1/3] drm/i915/dg2: Enable 5th display
Date: Tue, 15 Feb 2022 11:21:52 +0530
Message-Id: <20220215055154.15363-2-ramalingam.c@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220215055154.15363-1-ramalingam.c@intel.com>
References: <20220215055154.15363-1-ramalingam.c@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 Shankar Uma <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

DG2 supports a 5th display output which the hardware refers to as "TC1,"
even though it isn't a Type-C output.  This behaves similarly to the TC1
on past platforms with just a couple minor differences:

 * DG2's TC1 bit in SDEISR is at bit 25 rather than 24 as it is on
   ICP/TGP/ADP.
 * DG2 doesn't need the hpd inversion setting that we had to use on DG1

Cc: Swathi Dhanavanthri <swathi.dhanavanthri@intel.com>
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Ramalingam C <ramalingam.c@intel.com>
---
 drivers/gpu/drm/i915/display/intel_gmbus.c | 16 ++++++++++++++--
 drivers/gpu/drm/i915/i915_irq.c            |  5 ++++-
 drivers/gpu/drm/i915/i915_reg.h            |  1 +
 3 files changed, 19 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_gmbus.c b/drivers/gpu/drm/i915/display/intel_gmbus.c
index 6ce8c10fe975..2fad03250661 100644
--- a/drivers/gpu/drm/i915/display/intel_gmbus.c
+++ b/drivers/gpu/drm/i915/display/intel_gmbus.c
@@ -98,11 +98,21 @@ static const struct gmbus_pin gmbus_pins_dg1[] = {
 	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
 };
 
+static const struct gmbus_pin gmbus_pins_dg2[] = {
+	[GMBUS_PIN_1_BXT] = { "dpa", GPIOB },
+	[GMBUS_PIN_2_BXT] = { "dpb", GPIOC },
+	[GMBUS_PIN_3_BXT] = { "dpc", GPIOD },
+	[GMBUS_PIN_4_CNP] = { "dpd", GPIOE },
+	[GMBUS_PIN_9_TC1_ICP] = { "tc1", GPIOJ },
+};
+
 /* pin is expected to be valid */
 static const struct gmbus_pin *get_gmbus_pin(struct drm_i915_private *dev_priv,
 					     unsigned int pin)
 {
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
+	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG2)
+		return &gmbus_pins_dg2[pin];
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
 		return &gmbus_pins_dg1[pin];
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		return &gmbus_pins_icp[pin];
@@ -123,7 +133,9 @@ bool intel_gmbus_is_valid_pin(struct drm_i915_private *dev_priv,
 {
 	unsigned int size;
 
-	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
+	if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG2)
+		size = ARRAY_SIZE(gmbus_pins_dg2);
+	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_DG1)
 		size = ARRAY_SIZE(gmbus_pins_dg1);
 	else if (INTEL_PCH_TYPE(dev_priv) >= PCH_ICP)
 		size = ARRAY_SIZE(gmbus_pins_icp);
diff --git a/drivers/gpu/drm/i915/i915_irq.c b/drivers/gpu/drm/i915/i915_irq.c
index fdd568ba4a16..4d81063b128c 100644
--- a/drivers/gpu/drm/i915/i915_irq.c
+++ b/drivers/gpu/drm/i915/i915_irq.c
@@ -179,6 +179,7 @@ static const u32 hpd_sde_dg1[HPD_NUM_PINS] = {
 	[HPD_PORT_B] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_B),
 	[HPD_PORT_C] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_C),
 	[HPD_PORT_D] = SDE_DDI_HOTPLUG_ICP(HPD_PORT_D),
+	[HPD_PORT_TC1] = SDE_TC_HOTPLUG_DG2(HPD_PORT_TC1),
 };
 
 static void intel_hpd_init_pins(struct drm_i915_private *dev_priv)
@@ -4424,7 +4425,9 @@ void intel_irq_init(struct drm_i915_private *dev_priv)
 		if (I915_HAS_HOTPLUG(dev_priv))
 			dev_priv->hotplug_funcs = &i915_hpd_funcs;
 	} else {
-		if (HAS_PCH_DG1(dev_priv))
+		if (HAS_PCH_DG2(dev_priv))
+			dev_priv->hotplug_funcs = &icp_hpd_funcs;
+		else if (HAS_PCH_DG1(dev_priv))
 			dev_priv->hotplug_funcs = &dg1_hpd_funcs;
 		else if (DISPLAY_VER(dev_priv) >= 11)
 			dev_priv->hotplug_funcs = &gen11_hpd_funcs;
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 4ea1713e6b60..4d12abb2d7ff 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -6182,6 +6182,7 @@
 /* south display engine interrupt: ICP/TGP */
 #define SDE_GMBUS_ICP			(1 << 23)
 #define SDE_TC_HOTPLUG_ICP(hpd_pin)	REG_BIT(24 + _HPD_PIN_TC(hpd_pin))
+#define SDE_TC_HOTPLUG_DG2(hpd_pin)	REG_BIT(25 + _HPD_PIN_TC(hpd_pin)) /* sigh */
 #define SDE_DDI_HOTPLUG_ICP(hpd_pin)	REG_BIT(16 + _HPD_PIN_DDI(hpd_pin))
 #define SDE_DDI_HOTPLUG_MASK_ICP	(SDE_DDI_HOTPLUG_ICP(HPD_PORT_D) | \
 					 SDE_DDI_HOTPLUG_ICP(HPD_PORT_C) | \
-- 
2.20.1

