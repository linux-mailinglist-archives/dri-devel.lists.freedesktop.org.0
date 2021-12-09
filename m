Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7A3246F65B
	for <lists+dri-devel@lfdr.de>; Thu,  9 Dec 2021 23:01:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DFBB10E3A0;
	Thu,  9 Dec 2021 22:01:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CB7A10E384
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Dec 2021 22:00:58 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id i5so12091060wrb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 09 Dec 2021 14:00:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tv97wjKw0Y8ehSCnX1x5EJHKbZ3kV1xxY26ROlCSsJc=;
 b=E51l3n8mz8vT9trm4JWzXXQ1S/pZlnP4ywxZrBSk/qbcexWSNwzP4hM6m5VcSGhkdA
 IcJsKXGFO7aXLd36bY1urLg3JNWAn00+tb4TzEwwZ4g9qLvUNRQoghIoZH+KiYnYuxiq
 awCkpdCYMfBwdfzFVczU2O75keW5LoYG4Ldc5QVOWpRNCOQPkbXEK7WJqp/7ui1GTXCF
 PipQ4HF3r2erc6CU6WMNaOAAG/SWnCx95MdW2C2UNTzAogOsQXFWXtVEAy7mLxWmc4lM
 Ws8xHGYrDL+/dhmRW6wTBl9q5r2JiV56h8qo2/XmFQwFx0SN8PCqnB/PpfmLJOnSCjXM
 ovNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tv97wjKw0Y8ehSCnX1x5EJHKbZ3kV1xxY26ROlCSsJc=;
 b=G6+1qf6nVMI3zNyfbD5Cl/wJxaXG2gVIw6tYbkvf1l1AVqv/xqEqfeO6oZicL5vg/D
 EOoZp1TSKoNJ+BubPIPIR8kn6lEXHH7yyOAiJwMMmd7APGxujQVaHs9o35F0FhwGY7Lv
 aNyX/CvIW/o3Lq9E9Q83DZytAzDYJuU+4nStShBCVcHybGt1fK0aZqpbBhlMfOmg+uyM
 +RYr+uIZeEhyTviC5SiikH37cU4P53yfXwqD16FR6tT3jSNnreyp2R+WAhm/IlpDqJCd
 VDKZGR8pYDNKzy1BhMIPnVJ6lD1OfercEI3mtsIgFZtQU5/WjklQwwnAHm/taPnt/8ce
 2DqA==
X-Gm-Message-State: AOAM532fE6EBKE4mgwBiX9tD99I1sl4FvTzN6vlMDgsqWs6eVFp/5mEG
 eNqZtsIHMPvhBqrhxlA3M/QPTA==
X-Google-Smtp-Source: ABdhPJysc/476tOkL/fANXiCgW1sFdzNgBVcB8JWFD4ZjzfGY93j1tSzWW4tqGDu5vKLR+f6vvUdbQ==
X-Received: by 2002:adf:e702:: with SMTP id c2mr9663987wrm.586.1639087256984; 
 Thu, 09 Dec 2021 14:00:56 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id f7sm1061524wri.74.2021.12.09.14.00.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 14:00:56 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v4 RESEND 1/2] drm/i915/opregion: add support for mailbox #5
 EDID
Date: Thu,  9 Dec 2021 23:00:41 +0100
Message-Id: <20211209220042.310848-2-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211209220042.310848-1-anisse@astier.eu>
References: <20211209220042.310848-1-anisse@astier.eu>
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
Cc: Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 Anisse Astier <anisse@astier.eu>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ACPI OpRegion Mailbox #5 ASLE extension may contain an EDID to be
used for the embedded display. Add support for using it via by adding
the EDID to the list of available modes on the connector, and use it for
eDP when available.

If a panel's EDID is broken, there may be an override EDID set in the
ACPI OpRegion mailbox #5. Use it if available.

Fixes the GPD Win Max display.

Based on original patch series by: Jani Nikula <jani.nikula@intel.com>
https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051-1-jani.nikula@intel.com/

Changes:
 - EDID is copied and validated with drm_edid_is_valid
 - EDID is now only used as a fallback.
 - squashed the two patches

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Co-developed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/gpu/drm/i915/display/intel_dp.c       |  8 +++
 drivers/gpu/drm/i915/display/intel_opregion.c | 55 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h | 10 ++++
 3 files changed, 72 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 0a424bf69396..a3c64125405e 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4962,6 +4962,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	mutex_lock(&dev->mode_config.mutex);
 	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
+	if (!edid) {
+		/* Fallback to EDID from ACPI OpRegion, if any */
+		edid = intel_opregion_get_edid(intel_connector);
+		if (edid)
+			drm_dbg_kms(&dev_priv->drm,
+			            "[CONNECTOR:%d:%s] Using OpRegion EDID\n",
+			            connector->base.id, connector->name);
+	}
 	if (edid) {
 		if (drm_add_edid_modes(connector, edid)) {
 			drm_connector_update_edid_property(connector, edid);
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 0065111593a6..985790a66a4d 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -195,6 +195,8 @@ struct opregion_asle_ext {
 #define ASLE_IUER_WINDOWS_BTN		(1 << 1)
 #define ASLE_IUER_POWER_BTN		(1 << 0)
 
+#define ASLE_PHED_EDID_VALID_MASK	0x3
+
 /* Software System Control Interrupt (SWSCI) */
 #define SWSCI_SCIC_INDICATOR		(1 << 0)
 #define SWSCI_SCIC_MAIN_FUNCTION_SHIFT	1
@@ -908,8 +910,10 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		opregion->asle->ardy = ASLE_ARDY_NOT_READY;
 	}
 
-	if (mboxes & MBOX_ASLE_EXT)
+	if (mboxes & MBOX_ASLE_EXT) {
 		drm_dbg(&dev_priv->drm, "ASLE extension supported\n");
+		opregion->asle_ext = base + OPREGION_ASLE_EXT_OFFSET;
+	}
 
 	if (intel_load_vbt_firmware(dev_priv) == 0)
 		goto out;
@@ -1036,6 +1040,54 @@ intel_opregion_get_panel_type(struct drm_i915_private *dev_priv)
 	return ret - 1;
 }
 
+/**
+ * intel_opregion_get_edid - Fetch EDID from ACPI OpRegion mailbox #5
+ * @intel_connector: eDP connector
+ *
+ * This reads the ACPI Opregion mailbox #5 to extract the EDID that is passed
+ * to it.
+ *
+ * Returns:
+ * The EDID in the OpRegion, or NULL if there is none or it's invalid.
+ *
+ */
+struct edid *intel_opregion_get_edid(struct intel_connector *intel_connector)
+{
+	struct drm_connector *connector = &intel_connector->base;
+	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct intel_opregion *opregion = &i915->opregion;
+	const void *in_edid;
+	const struct edid *edid;
+	struct edid *new_edid;
+	int len;
+
+	if (!opregion->asle_ext)
+		return NULL;
+
+	in_edid = opregion->asle_ext->bddc;
+
+	/* Validity corresponds to number of 128-byte blocks */
+	len = (opregion->asle_ext->phed & ASLE_PHED_EDID_VALID_MASK) * 128;
+	if (!len || !memchr_inv(in_edid, 0, len))
+		return NULL;
+
+	edid = in_edid;
+
+	if (len < EDID_LENGTH * (1 + edid->extensions)) {
+		drm_dbg_kms(&i915->drm, "Invalid EDID in ACPI OpRegion (Mailbox #5): too short\n");
+		return NULL;
+	}
+	new_edid = drm_edid_duplicate(edid);
+	if (!new_edid)
+		return NULL;
+	if (!drm_edid_is_valid(new_edid)) {
+		kfree(new_edid);
+		drm_dbg_kms(&i915->drm, "Invalid EDID in ACPI OpRegion (Mailbox #5)\n");
+		return NULL;
+	}
+	return new_edid;
+}
+
 void intel_opregion_register(struct drm_i915_private *i915)
 {
 	struct intel_opregion *opregion = &i915->opregion;
@@ -1129,6 +1181,7 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
 	opregion->acpi = NULL;
 	opregion->swsci = NULL;
 	opregion->asle = NULL;
+	opregion->asle_ext = NULL;
 	opregion->vbt = NULL;
 	opregion->lid_state = NULL;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 4aa68ffbd30e..7ebf99b89822 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.h
+++ b/drivers/gpu/drm/i915/display/intel_opregion.h
@@ -29,12 +29,14 @@
 #include <linux/pci.h>
 
 struct drm_i915_private;
+struct intel_connector;
 struct intel_encoder;
 
 struct opregion_header;
 struct opregion_acpi;
 struct opregion_swsci;
 struct opregion_asle;
+struct opregion_asle_ext;
 
 struct intel_opregion {
 	struct opregion_header *header;
@@ -43,6 +45,7 @@ struct intel_opregion {
 	u32 swsci_gbda_sub_functions;
 	u32 swsci_sbcb_sub_functions;
 	struct opregion_asle *asle;
+	struct opregion_asle_ext *asle_ext;
 	void *rvda;
 	void *vbt_firmware;
 	const void *vbt;
@@ -71,6 +74,7 @@ int intel_opregion_notify_encoder(struct intel_encoder *intel_encoder,
 int intel_opregion_notify_adapter(struct drm_i915_private *dev_priv,
 				  pci_power_t state);
 int intel_opregion_get_panel_type(struct drm_i915_private *dev_priv);
+struct edid * intel_opregion_get_edid(struct intel_connector *connector);
 
 #else /* CONFIG_ACPI*/
 
@@ -117,6 +121,12 @@ static inline int intel_opregion_get_panel_type(struct drm_i915_private *dev)
 	return -ENODEV;
 }
 
+static inline struct edid *
+intel_opregion_get_edid(struct intel_connector *connector)
+{
+	return NULL;
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif
-- 
2.31.1

