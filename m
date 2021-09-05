Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF6BF4011B6
	for <lists+dri-devel@lfdr.de>; Sun,  5 Sep 2021 23:12:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA3A589A20;
	Sun,  5 Sep 2021 21:12:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF4B89A14
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Sep 2021 21:12:31 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 c8-20020a7bc008000000b002e6e462e95fso3555309wmb.2
 for <dri-devel@lists.freedesktop.org>; Sun, 05 Sep 2021 14:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/0WeNE18ObVnT66q3KmAsGbsWgFIPzUq78ow2ME+dY=;
 b=w6E2FkcFzoXAO/ev2mGKAscLgljcNjxhT1VsCAY88Svw4qx6kNDQCoOEGSHjcHROQ7
 q8prZ9NGn6Iw9UpIb/MUIjn5Ir1CZeOr7e00Ji7XBpulMvxV/Xt2LY/yTeDpJ6HOLZjp
 SlMe4xt9SJq5USo1zufJrPOaND8VoupYn7tquY6wv/dngqON1LvWTG4vvfyS+qyorRXa
 WNSJK7vdO2McUkKfenA/amuIdqEwQtsFhDcy9N82MMmotrlSKiT8FHRIcAMxhHzRjEVO
 OnYDNj9KmaOheZf0A4IXQTJxO2X4330o3PrnjKh1qzEUaUHwVfvOJ/woDluCad7gjfsX
 GHWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/0WeNE18ObVnT66q3KmAsGbsWgFIPzUq78ow2ME+dY=;
 b=cuAZWX+EYjFuES30oBPygTKdkhGcp3eu2o4UdxgAQteXjprYc1vU0HKesN/4g62hzg
 E9eif8VJG0zI6ARYLsjgd/LA3EdT0+yCVdmpXKP6DdmNqL548l5OCif5GiK1IfTxlmHP
 Ds4Pw3lBKyWvzBsWB5BhzbVOtQyXt7ZHfQH1cDzSKmhSgQyrq/Jo4NpXR1lSVCsN7lC5
 HsdVMWonKmD+moahD1HBsJCfpYBEN1eYBghAPfTFUSpZ2N3Cafccq7Mcjikj5w8NPqpJ
 Bmct357WXAcNOnsKDyilBJi3CCwEpu2O7vTJGgfWYbDNQmmXM5WapIWJ9L+gmVs+W6Tp
 NTiQ==
X-Gm-Message-State: AOAM530EYNaOj1neMO9Cz87VaubpPKbyJmOryPvuNQzofiDF20j2Gz2t
 0R7VMjouDoqipAcvE1hKzj1TJw==
X-Google-Smtp-Source: ABdhPJxeadLcAppPgO7OcR19SwmC/ZtZMNKHCj86rbDtpdbMTOJjGRSXTJOVd/dklcDdELx3Cw3lBw==
X-Received: by 2002:a1c:43c5:: with SMTP id q188mr8047695wma.175.1630876350324; 
 Sun, 05 Sep 2021 14:12:30 -0700 (PDT)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:2488:d453:b017:99a])
 by smtp.gmail.com with ESMTPSA id m3sm7210512wrg.45.2021.09.05.14.12.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Sep 2021 14:12:29 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>,
 Anisse Astier <anisse@astier.eu>
Subject: [PATCH v4 1/2] drm/i915/opregion: add support for mailbox #5 EDID
Date: Sun,  5 Sep 2021 23:12:25 +0200
Message-Id: <20210905211226.3525-2-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210905211226.3525-1-anisse@astier.eu>
References: <20210905211226.3525-1-anisse@astier.eu>
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
index d28bd8c4a8a5..836a98d9e5c3 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4820,6 +4820,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
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

