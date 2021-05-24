Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB40F38FB6C
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 09:09:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C916089F2A;
	Tue, 25 May 2021 07:09:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41D456E8CF
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 16:47:51 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id
 l18-20020a1ced120000b029014c1adff1edso11781412wmh.4
 for <dri-devel@lists.freedesktop.org>; Mon, 24 May 2021 09:47:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=astier-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3I2ZNni0vuGSlO6ssnI4sarfm4yS8wntgI1aAqSqACQ=;
 b=SDBJengL6q3RuEk8yFkhQQAyBndB8O5xUNi+lIRqH2Z5RNNGppwhFVWnDp59uvmKSa
 Ot3u8zmyU0MgNwlQFWRS1Qhgl69Gyez+WlrNlvqNfYwRyNn5iJ56E5tsoFGF7vzanv0r
 kCOjbri25MtpRGsY2/bXLhTUTnPREGrqZkVnFAajLEMFvGsbAr5hQrBjWhuj0EwYGSjo
 GQ+EIUgs2DXBDImB8Q/UWncBZ6K9bGklcv6yxzAN5YbkRDJ+nOrLcHIElDA9VSXK8Mt2
 fOhC9B8Mpbxpex3rqVUMBchRudCkvZjrVvw8w8Xgc/3WGxfHhnpMnd5NQ0ENO62DH0Qn
 MtJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3I2ZNni0vuGSlO6ssnI4sarfm4yS8wntgI1aAqSqACQ=;
 b=Hha6izJ2WGT6/LM2XPQ+KxCzQN35ERNHlZpkpz4LeYDNuTDoKoFp93jSMnBQRYnZuL
 XPSM5GyK4c+oIrcND/KNTC6Aq6NNVXgtF9LpwKMCFCWjvs7j7TPl4q6PcuPgiD/L47bw
 fAG9flx6OAqH3P02YLXipqyURPdG9fswVpyoJyH9KXeyXeIo8hfXsoJI3rhRNbfTle8L
 QycUVtY1j5lOUIrq/LHYaqEgQ89h/i/oS1XbNDMAjd40qvxbIKvZ4q+LqlYJWvtUhZNA
 5KnCUVpJagXmx3RGPS/z+Lo/tBjde3+g3VNYCO/U2p9zd9jP6NaQY0vEeFtRnvSIhlT5
 1QDA==
X-Gm-Message-State: AOAM5334GHWroNHMs2/bn+flnv72th0GY+BymFCz+wTaMDMNJJaYKPpv
 Z5pMrakOCJFbAeNS38jxBxQPRg==
X-Google-Smtp-Source: ABdhPJyMHBrdDa68SqLdo3dfQi174VSuakv9CY6fYIyHTnTRflkuLKlqpd5OZmFfr+a+4I3CLuboKQ==
X-Received: by 2002:a1c:4601:: with SMTP id t1mr20329186wma.27.1621874869848; 
 Mon, 24 May 2021 09:47:49 -0700 (PDT)
Received: from localhost.localdomain ([2a01:e0a:806:8950:61f0:1b3d:bc7a:1d60])
 by smtp.gmail.com with ESMTPSA id
 b10sm15226358wrr.27.2021.05.24.09.47.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 09:47:49 -0700 (PDT)
From: Anisse Astier <anisse@astier.eu>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 1/3] drm/i915/opregion: add support for mailbox #5 EDID
Date: Mon, 24 May 2021 18:47:17 +0200
Message-Id: <20210524164719.6588-2-anisse@astier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210524164719.6588-1-anisse@astier.eu>
References: <20210524164719.6588-1-anisse@astier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 May 2021 07:09:22 +0000
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
the EDID to the list of available modes on the connector.

Based on original patch by: Jani Nikula <jani.nikula@intel.com>

Changes:
 - EDID is copied and validated with drm_edid_is_valid
 - Mode is now added via drm_add_edid_modes instead of using override
   mechanism

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Anisse Astier <anisse@astier.eu>
---
 drivers/gpu/drm/i915/display/intel_opregion.c | 69 ++++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_opregion.h |  8 +++
 2 files changed, 76 insertions(+), 1 deletion(-)

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

