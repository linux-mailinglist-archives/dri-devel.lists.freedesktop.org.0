Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B473439691E
	for <lists+dri-devel@lfdr.de>; Mon, 31 May 2021 22:47:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE376E461;
	Mon, 31 May 2021 20:47:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE6FD6E077
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 20:47:15 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id j14so12026741wrq.5
 for <dri-devel@lists.freedesktop.org>; Mon, 31 May 2021 13:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CY9SEtpjOosPn7y/KYqbLFK4fiHB7OI6n/R3eOJ0cQg=;
 b=lP0tSTkGnLEslCQBr7S3iTpz9oV4TCtqF6+Os58w2/h/nU/haDb6XvuXSK3QdyO5qS
 QpG9va/LN3E2TZfFPizXK9dOEY1oGELpof5skqboYf7ERsFbrT3hUFTkdvf43rpu1ctP
 8y43ccVFbhuZDDVwRnbg+rB7N3DhfPDiM8u6WGWSAN/zq2A3buvinNvG8THfe2fglxNq
 tW1XeMBrWpfrWn4KpeML2mt7JjZZFQ6pZyz+lHhb2qQz9pC0BHw6J2Z6o8denLdNhtxU
 frp329pFG1HusDRM3O2JdLEQE+9nM3NlAIgz32nKU78KdYzkeC5WPwySFPmOacSsRlhk
 dEsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CY9SEtpjOosPn7y/KYqbLFK4fiHB7OI6n/R3eOJ0cQg=;
 b=p2W4bOvAtjBsKzCQ3QijcOxDXSWNRs6CyB7CnDK1pYVJMpfrnGH/EMmO09zarVKl/K
 6Gmjo3ZzF1FnFsl8wTwhB5O92wpeca3BksXeuWOqBT1KDkU7L7p3gKkx94t6AhRUqXXm
 LRMP1gjbLx3iWbYWh/QR59lGAGhW3P38dYt7CaCCysrJO4LlTXaskEGZojDYY66Dle6X
 imqKIx0LxPfiZEFtEZ+zYIrb23UR0d93GBjs2mkg62q1rENEbTCvSvwDlYfP9D7avXfi
 DUF95HY0GygnZoUKAsJ2KcE3aL+F29oU7RpRnFbLwvn2XxqSX9KdxoOg8eXGCXBC+aEL
 05aw==
X-Gm-Message-State: AOAM532dgaXXkWmynX5sJCTq+NlXpN4bsO6vZKgekiQ23F8sAhS0h+YA
 oJS2d/SkFH1i5ZBtfoiJMrm3QA==
X-Google-Smtp-Source: ABdhPJzfPMnhez+DHDeQqhR2GHz2ItUCJvdVTMipQkXdR/OIa+P0BQGCLqNt9zTIZALR+tc84QOLXA==
X-Received: by 2002:adf:e54f:: with SMTP id z15mr6708368wrm.141.1622494034479; 
 Mon, 31 May 2021 13:47:14 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 m7sm874240wrv.35.2021.05.31.13.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 13:47:13 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/2] drm/i915/opregion: add support for mailbox #5 EDID
Date: Mon, 31 May 2021 22:46:41 +0200
Message-Id: <20210531204642.4907-2-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210531204642.4907-1-anisse@astier.eu>
References: <20210531204642.4907-1-anisse@astier.eu>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Uma Shankar <uma.shankar@intel.com>, Anisse Astier <anisse@astier.eu>
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
index 5c9222283044..43fb485c0e02 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -5191,6 +5191,9 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
 		goto out_vdd_off;
 	}
 
+	/* Set up override EDID, if any, from ACPI OpRegion */
+	intel_opregion_edid_probe(intel_connector);
+
 	mutex_lock(&dev->mode_config.mutex);
 	edid = drm_get_edid(connector, &intel_dp->aux.ddc);
 	if (edid) {
diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index dfd724e506b5..ef8d38f041eb 100644
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
@@ -1127,6 +1193,7 @@ void intel_opregion_unregister(struct drm_i915_private *i915)
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

