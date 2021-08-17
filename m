Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 990813EF39A
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 22:43:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88CF76E24D;
	Tue, 17 Aug 2021 20:43:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BD1A6E243
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 20:43:39 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 x2-20020a1c7c02000000b002e6f1f69a1eso2792600wmc.5
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 13:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=wulDCW40+eujYtVE3EW8ngUGl1XuQzCLybo7cD2V2G8=;
 b=AzxXYWss1KM4UU9XAerGOtcN06tsW9ihQFCyidQsicJPe8vh7XBpMti2gyVbKHqGVl
 ZwTqAODtPXO3QObG9RqQ9QGo3kLu5wR9LW/Ufw8BhWV/uf045GzthmYp+aWk6IXn0Y5K
 izGIU5fiX6SvEHCyuHRCtopYikzvY3KxMnp24K9/zyPeE5Vo7OkLQErhdgU1nOttFOIc
 PqDqkbZcbKZqroVOKtJSgFB13Ph085Dng5XFbJ1VoAtOB8D+4BUKiztHX62LEbtWOb92
 WXJXyPfBxKgmIHWmjMmuakSAqwLgbunT4LLPOl8eVKumwoq8dODzyUoq4MSX5tnW4clH
 RfgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=wulDCW40+eujYtVE3EW8ngUGl1XuQzCLybo7cD2V2G8=;
 b=CfevIqDLHvn0alkerzhvAT0wPZunHvhLNqKJGBECQUwHL+h7++eygg2qG+9Pj1cRHr
 tWIwcQvuAdgSybGBzmybDkyfVneu6PzhId6lX+uQdjpAoIMo91JSudmEiQTLrFN1CsBu
 8HWsoitL/INvLbt96g2/wVZ289JPUziBa6pGZJNVYuVOSAzC6+m7yslTZJPq87UpnyVb
 aa+9SRcu6cf8IWaE09B2F5PDh8E3MO4NVnUQcDcMhSnTaDZmPh5RUC3PP6pXP6hMLmVP
 vP/ZHibCCiH47UnMxEWr+senfU+C23xntoOQLe2aIJvNZtXHfRHj/VCLkEJ4tNWaNvix
 de9g==
X-Gm-Message-State: AOAM531aGG4VgIKBJbSAgC0Ei7vZh0HUFcUgeWmaY8VTaM6MLi30tIh1
 JJwYge1x3ZuX0a3hC4y4jYKfSQ==
X-Google-Smtp-Source: ABdhPJwznvtSThPL617GkKFYBurU3JfpC26VfrK+gmWxICcUPv3vVSOQosAURQkBiZXvn52Q4MYe8A==
X-Received: by 2002:a1c:2904:: with SMTP id p4mr5022291wmp.178.1629233017806; 
 Tue, 17 Aug 2021 13:43:37 -0700 (PDT)
Received: from gpdmax.. ([2a0d:e487:15f:f479:6202:d4f7:9ddb:b07c])
 by smtp.gmail.com with ESMTPSA id e10sm3540332wrt.82.2021.08.17.13.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Aug 2021 13:43:37 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Hans de Goede <hdegoede@redhat.com>, Uma Shankar <uma.shankar@intel.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Dadap <ddadap@nvidia.com>,
 Anisse Astier <anisse@astier.eu>
Subject: [PATCH v3 1/2] drm/i915/opregion: add support for mailbox #5 EDID
Date: Tue, 17 Aug 2021 22:43:28 +0200
Message-Id: <20210817204329.5457-2-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210817204329.5457-1-anisse@astier.eu>
References: <20210817204329.5457-1-anisse@astier.eu>
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

Fixes the GPD Win Max laptop display, which seems to only use this
mechanism to provide a proper EDID for its eDP screen. It would have
been better to provide the EDID through the ACPI _DDC method instead, to
have a more generic solution, but it seems the designers of this system
did not consider it, and shipped the firmware without it.

Based on original patch series by: Jani Nikula <jani.nikula@intel.com>
https://patchwork.kernel.org/project/intel-gfx/patch/20200828061941.17051-1-jani.nikula@intel.com/

Changes since Jani Nikula's series:
 - EDID is copied and validated with drm_edid_is_valid
 - Mode is now added via drm_add_edid_modes instead of using override
   mechanism
 - squashed the two patches

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/gpu/drm/i915/display/intel_dp.c       |  3 +
 drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
 3 files changed, 79 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 75d4ebc66941..f9254c0df1a2 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5183,6 +5183,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		goto out_vdd_off;
 	}
 
+	/* Set up override EDID, if any, from ACPI OpRegion */
+	intel_opregion_edid_probe(intel_connector);
+
 	mutex_lock(&dev->mode_config.mutex);
 	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
 	if (edid) {
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index 3855fba70980..b1b87ed758ba 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -196,6 +196,8 @@ struct opregion_asle_ext {
 #define ASLE_IUER_WINDOWS_BTN		(1 << 1)
 #define ASLE_IUER_POWER_BTN		(1 << 0)
 
+#define ASLE_PHED_EDID_VALID_MASK	0x3
+
 /* Software System Control Interrupt (SWSCI) */
 #define SWSCI_SCIC_INDICATOR		(1 << 0)
 #define SWSCI_SCIC_MAIN_FUNCTION_SHIFT	1
@@ -909,8 +911,10 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		opregion->asle->ardy = ASLE_ARDY_NOT_READY;
 	}
 
-	if (mboxes & MBOX_ASLE_EXT)
+	if (mboxes & MBOX_ASLE_EXT) {
 		drm_dbg(&dev_priv->drm, "ASLE extension supported\n");
+		opregion->asle_ext = base + OPREGION_ASLE_EXT_OFFSET;
+	}
 
 	if (intel_load_vbt_firmware(dev_priv) == 0)
 		goto out;
@@ -1037,6 +1041,68 @@ intel_opregion_get_panel_type(struct drm_i915_private *dev_priv)
 	return ret - 1;
 }
 
+/**
+ * intel_opregion_edid_probe - Add EDID from ACPI OpRegion mailbox #5
+ * @intel_connector: eDP connector
+ *
+ * This reads the ACPI Opregion mailbox #5 to extract the EDID that is passed
+ * to it.
+ *
+ * Will take a lock on the DRM mode_config to add the EDID; make sure it isn't
+ * called with lock taken.
+ *
+ */
+void intel_opregion_edid_probe(struct intel_connector *intel_connector)
+{
+	struct drm_connector *connector = &intel_connector->base;
+	struct drm_i915_private *i915 = to_i915(connector->dev);
+	struct intel_opregion *opregion = &i915->opregion;
+	const void *in_edid;
+	const struct edid *edid;
+	struct edid *new_edid;
+	int len, ret, num;
+
+	if (!opregion->asle_ext || connector->override_edid)
+		return;
+
+	in_edid = opregion->asle_ext->bddc;
+
+	/* Validity corresponds to number of 128-byte blocks */
+	len = (opregion->asle_ext->phed & ASLE_PHED_EDID_VALID_MASK) * 128;
+	if (!len || !memchr_inv(in_edid, 0, len))
+		return;
+
+	edid = in_edid;
+
+	if (len < EDID_LENGTH * (1 + edid->extensions)) {
+		drm_dbg_kms(&i915->drm, "Invalid EDID in ACPI OpRegion (Mailbox #5)\n");
+		return;
+	}
+	new_edid = drm_edid_duplicate(edid);
+	if (!new_edid) {
+		drm_err(&i915->drm, "Cannot duplicate EDID\n");
+		return;
+	}
+	if (!drm_edid_is_valid(new_edid)) {
+		kfree(new_edid);
+		drm_dbg_kms(&i915->drm, "Cannot validate EDID in ACPI OpRegion (Mailbox #5)\n");
+		return;
+	}
+
+	ret = drm_connector_update_edid_property(connector, new_edid);
+	if (ret) {
+		kfree(new_edid);
+		return;
+	}
+
+	mutex_lock(&connector->dev->mode_config.mutex);
+	num = drm_add_edid_modes(connector, new_edid);
+	mutex_unlock(&connector->dev->mode_config.mutex);
+
+	drm_dbg_kms(&i915->drm, "Using OpRegion EDID for [CONNECTOR:%d:%s], added %d mode(s)\n",
+		    connector->base.id, connector->name, num);
+}
+
 void intel_opregion_register(struct drm_i915_private *i915)
 {
 	struct intel_opregion *opregion = &i915->opregion;
@@ -1130,6 +1196,7 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
 	opregion->acpi = NULL;
 	opregion->swsci = NULL;
 	opregion->asle = NULL;
+	opregion->asle_ext = NULL;
 	opregion->vbt = NULL;
 	opregion->lid_state = NULL;
 }
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.h b/drivers/gpu/drm/i915/display/intel_opregion.h
index 4aa68ffbd30e..c1ecfcbb6f55 100644
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
+void intel_opregion_edid_probe(struct intel_connector *connector);
 
 #else /* CONFIG_ACPI*/
 
@@ -117,6 +121,10 @@ static inline int intel_opregion_get_panel_type(struct drm_i915_private *dev)
 	return -ENODEV;
 }
 
+void intel_opregion_edid_probe(struct intel_connector *connector)
+{
+}
+
 #endif /* CONFIG_ACPI */
 
 #endif
-- 
2.31.1

