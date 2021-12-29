Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E640481742
	for <lists+dri-devel@lfdr.de>; Wed, 29 Dec 2021 23:22:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E07B89B0D;
	Wed, 29 Dec 2021 22:22:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 27AD089ACC
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 22:22:07 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id d9so46996691wrb.0
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Dec 2021 14:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CRirTIC64zX+nVgdNaolbbIV5fTdBDvqdQlw6uamJTA=;
 b=AbrUEhOlrGgEZQTb7meP04algDvkmsmmHdBRR0/dYKxFIlZD9nEjDuZBdDuzU/C90O
 h2g8Ss+aSSW9TSz4eXJWVEPVw1osFzZGGSQLPPULEUz+7TT+QnpNHdPJhvhkNVzuCJ73
 8apLYsSi+zJOYF7cXwkpjV6oF5C6rCa4oBAHshfTaXoeRhceu2vNfJPgD8UEfOmaBe4Q
 +8aOhn9CTxgNveI4+kP6WncrFlNaxcnjFORLWqHam0JJUSPbl/r0VdnMLNM7yZV5rF+z
 0XrnQyVE25a4v6+ifwdzL2abLUGM73j6IvV3KDTjaXt/YOllX8KhwaY/La5zD8CjPw/E
 4JMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CRirTIC64zX+nVgdNaolbbIV5fTdBDvqdQlw6uamJTA=;
 b=YzQSoawcUs9i8d8xkPFQ7OVlB6izGaJ7rj0RfLZ+/nO60WtsdffFzZQ0FoQiRT0gxe
 Yyf3dEavYdDN2qvQJ4eq6OFJfUeDnCVkkvY9AkFelouQpnetUS2ro4wNtg+mpeYfwMqB
 1Ja+DWk+u7OROj1Z4lokg1jB4InhIRX29JIjqO+GiB3mCA2k0F7HZZeNIWb/Lv/Ir58p
 PfGGQrLlhSGz9LXj0l1ZDvG1nByQqMu5Wc9MvXaKIbcZT9BgvrYeIfy4wVoVltnNRox7
 M2eFTdc9BmPlnv+lEAEgpuwYXXfVfyP/gQKohS9voQ8fiMnwaZT16VQRNb/4WVbESro9
 2DyA==
X-Gm-Message-State: AOAM531HYn7Y2ORHzdKKfdI+hEZ7gUzJbbK/vMdz0HTn96Wa4XlV3Sjl
 G9RMtm0/tjfjHeVz8khSO4Wkzw==
X-Google-Smtp-Source: ABdhPJwQk+JEVFitL5M0hmrMORhutdfIUJW9+FhQNTnjrdhO9ZIVJgh3/htEOtbleucUFdp23XPovw==
X-Received: by 2002:a05:6000:23a:: with SMTP id
 l26mr21784641wrz.666.1640816525679; 
 Wed, 29 Dec 2021 14:22:05 -0800 (PST)
Received: from gpdmax.. ([2a01:e0a:28f:75b0:cf6:c90f:f3b1:89c1])
 by smtp.gmail.com with ESMTPSA id m5sm19700686wml.14.2021.12.29.14.22.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Dec 2021 14:22:05 -0800 (PST)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v5 1/2] drm/i915/opregion: add support for mailbox #5 EDID
Date: Wed, 29 Dec 2021 23:21:59 +0100
Message-Id: <20211229222200.53128-2-anisse@astier.eu>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211229222200.53128-1-anisse@astier.eu>
References: <20211229222200.53128-1-anisse@astier.eu>
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
index b5e2508db1cf..d6d8c9922feb 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -4974,6 +4974,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 
 	mutex_lock(&dev->mode_config.mutex);
 	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
+	if (!edid) {
+		/* Fallback to EDID from ACPI OpRegion, if any */
+		edid = intel_opregion_get_edid(intel_connector);
+		if (edid)
+			drm_dbg_kms(&dev_priv->drm,
+				    "[CONNECTOR:%d:%s] Using OpRegion EDID\n",
+				    connector->base.id, connector->name);
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
index 4aa68ffbd30e..82cc0ba34af7 100644
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
+struct edid *intel_opregion_get_edid(struct intel_connector *connector);
 
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
2.33.1

