Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46717144D3E
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jan 2020 09:21:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 344FC6F3E2;
	Wed, 22 Jan 2020 08:21:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53236FADE;
 Tue, 21 Jan 2020 14:32:19 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q6so3409580wro.9;
 Tue, 21 Jan 2020 06:32:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references;
 bh=eX5dN8pc5/AqQ+ewdF/FEabxhls400zFnN0NLpFFaDA=;
 b=eAL75MWRemE56AlCJlVhLsDsLrAhVKygtm+5/hGMVxCEXNkFiVxDLRV3+hMFoBOOm9
 FGkX6TldQegc/uHiCibQlmjspUHMEclyuYSICDEiy7Nhx3mDa1QPutYrXB6JWdJ74s5b
 0uWxKGzNeEX6hqzHjQdD5F6vPbr35ztd0wfMr1MgGFcqkbjg3KVSOcP762Mc1vgo2EcN
 qTkwMngOtDLYsZVUo9v4z15wloxFnMl6g0600hofW2buiBgfoqUTsrRq/RfiG/FFb45O
 3tiOS1kmzbw8iPsA09jIsmIZr8rugBA0WvqjG0TCCA1bAu5GUhVgzDBZ2BK+/X3uRMDK
 ftww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references;
 bh=eX5dN8pc5/AqQ+ewdF/FEabxhls400zFnN0NLpFFaDA=;
 b=YbZamyE81p1az2yVWkHWrK5ON555Qnj9QjnCfI+rKgnDH1sh4eT7hLtoafyOrmeEwT
 WO6Gc1sz8HuMQsSJD7nZ5Ey3V6awqlbnOGa7rxcWv5Nuv6JocLl0cIQJhuqRhDBpolZF
 RoYzfK7229llEcLO479iXwabqch+c35OZjEfAh9uO06MaJN7EmdDboEyUgMVcuhh8PwN
 3I24CtN58ZphCquHLSgWziOtNSvLdToHKLqleukKpNrhL/EnCmcp2ayF2Iq4zrO9miJ9
 C684UQAM2AT2ul5lSJVxQxMFV0LXcz7JNDB5hT0r/R7b7bSBNk9JOa54RHW/BlQg4yy7
 uPEg==
X-Gm-Message-State: APjAAAWxY/e3sOFbx1M0q3s8K24OzYywO2J0OEHCKWwIfib/biIQ57ys
 POtaRh2ZanqJ0+zKHlnxheA=
X-Google-Smtp-Source: APXvYqz6InHDLh7rzauyvAAYGvJ6r9cK9ZIPHHmBGJEtEFBxO7YIdkD7pi+SR+8X9zP9jIRVa5jb8w==
X-Received: by 2002:a5d:6344:: with SMTP id b4mr5496384wrw.414.1579617138212; 
 Tue, 21 Jan 2020 06:32:18 -0800 (PST)
Received: from localhost.localdomain ([197.254.95.38])
 by smtp.googlemail.com with ESMTPSA id g2sm52781284wrw.76.2020.01.21.06.32.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jan 2020 06:32:17 -0800 (PST)
From: Wambui Karuga <wambui.karugax@gmail.com>
To: jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 rodrigo.vivi@intel.com, airlied@linux.ie, daniel@ffwll.ch,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/6] drm/i915/opregion: conversion to struct drm_device
 logging macros.
Date: Tue, 21 Jan 2020 17:31:54 +0300
Message-Id: <20200121143155.20856-6-wambui.karugax@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200121143155.20856-1-wambui.karugax@gmail.com>
References: <20200121143155.20856-1-wambui.karugax@gmail.com>
X-Mailman-Approved-At: Wed, 22 Jan 2020 08:21:10 +0000
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This converts various instances of the printk based logging macros in
i915/display/intel_opregion.c with the new struct drm_device based
logging macros using the following coccinelle script:
@rule1@
identifier fn, T;
@@

fn(...,struct drm_i915_private *T,...) {
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

@rule2@
identifier fn, T;
@@

fn(...) {
...
struct drm_i915_private *T = ...;
<+...
(
-DRM_INFO(
+drm_info(&T->drm,
...)
|
-DRM_ERROR(
+drm_err(&T->drm,
...)
|
-DRM_WARN(
+drm_warn(&T->drm,
...)
|
-DRM_DEBUG(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_KMS(
+drm_dbg_kms(&T->drm,
...)
|
-DRM_DEBUG_DRIVER(
+drm_dbg(&T->drm,
...)
|
-DRM_DEBUG_ATOMIC(
+drm_dbg_atomic(&T->drm,
...)
)
...+>
}

Checkpatch warnings were addressed manually.

Signed-off-by: Wambui Karuga <wambui.karugax@gmail.com>
---
 drivers/gpu/drm/i915/display/intel_opregion.c | 134 +++++++++++-------
 1 file changed, 80 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_opregion.c b/drivers/gpu/drm/i915/display/intel_opregion.c
index e59b4992ba1b..b54fe4dc0423 100644
--- a/drivers/gpu/drm/i915/display/intel_opregion.c
+++ b/drivers/gpu/drm/i915/display/intel_opregion.c
@@ -311,7 +311,7 @@ static int swsci(struct drm_i915_private *dev_priv,
 	/* The spec tells us to do this, but we are the only user... */
 	scic = swsci->scic;
 	if (scic & SWSCI_SCIC_INDICATOR) {
-		DRM_DEBUG_DRIVER("SWSCI request already in progress\n");
+		drm_dbg(&dev_priv->drm, "SWSCI request already in progress\n");
 		return -EBUSY;
 	}
 
@@ -335,7 +335,7 @@ static int swsci(struct drm_i915_private *dev_priv,
 	/* Poll for the result. */
 #define C (((scic = swsci->scic) & SWSCI_SCIC_INDICATOR) == 0)
 	if (wait_for(C, dslp)) {
-		DRM_DEBUG_DRIVER("SWSCI request timed out\n");
+		drm_dbg(&dev_priv->drm, "SWSCI request timed out\n");
 		return -ETIMEDOUT;
 	}
 
@@ -344,7 +344,7 @@ static int swsci(struct drm_i915_private *dev_priv,
 
 	/* Note: scic == 0 is an error! */
 	if (scic != SWSCI_SCIC_EXIT_STATUS_SUCCESS) {
-		DRM_DEBUG_DRIVER("SWSCI request error %u\n", scic);
+		drm_dbg(&dev_priv->drm, "SWSCI request error %u\n", scic);
 		return -EIO;
 	}
 
@@ -448,10 +448,11 @@ static u32 asle_set_backlight(struct drm_i915_private *dev_priv, u32 bclp)
 	struct opregion_asle *asle = dev_priv->opregion.asle;
 	struct drm_device *dev = &dev_priv->drm;
 
-	DRM_DEBUG_DRIVER("bclp = 0x%08x\n", bclp);
+	drm_dbg(&dev_priv->drm, "bclp = 0x%08x\n", bclp);
 
 	if (acpi_video_get_backlight_type() == acpi_backlight_native) {
-		DRM_DEBUG_KMS("opregion backlight request ignored\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "opregion backlight request ignored\n");
 		return 0;
 	}
 
@@ -468,7 +469,8 @@ static u32 asle_set_backlight(struct drm_i915_private *dev_priv, u32 bclp)
 	 * Update backlight on all connectors that support backlight (usually
 	 * only one).
 	 */
-	DRM_DEBUG_KMS("updating opregion backlight %d/255\n", bclp);
+	drm_dbg_kms(&dev_priv->drm, "updating opregion backlight %d/255\n",
+		    bclp);
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	for_each_intel_connector_iter(connector, &conn_iter)
 		intel_panel_set_backlight_acpi(connector->base.state, bclp, 255);
@@ -485,13 +487,13 @@ static u32 asle_set_als_illum(struct drm_i915_private *dev_priv, u32 alsi)
 {
 	/* alsi is the current ALS reading in lux. 0 indicates below sensor
 	   range, 0xffff indicates above sensor range. 1-0xfffe are valid */
-	DRM_DEBUG_DRIVER("Illum is not supported\n");
+	drm_dbg(&dev_priv->drm, "Illum is not supported\n");
 	return ASLC_ALS_ILLUM_FAILED;
 }
 
 static u32 asle_set_pwm_freq(struct drm_i915_private *dev_priv, u32 pfmb)
 {
-	DRM_DEBUG_DRIVER("PWM freq is not supported\n");
+	drm_dbg(&dev_priv->drm, "PWM freq is not supported\n");
 	return ASLC_PWM_FREQ_FAILED;
 }
 
@@ -499,30 +501,36 @@ static u32 asle_set_pfit(struct drm_i915_private *dev_priv, u32 pfit)
 {
 	/* Panel fitting is currently controlled by the X code, so this is a
 	   noop until modesetting support works fully */
-	DRM_DEBUG_DRIVER("Pfit is not supported\n");
+	drm_dbg(&dev_priv->drm, "Pfit is not supported\n");
 	return ASLC_PFIT_FAILED;
 }
 
 static u32 asle_set_supported_rotation_angles(struct drm_i915_private *dev_priv, u32 srot)
 {
-	DRM_DEBUG_DRIVER("SROT is not supported\n");
+	drm_dbg(&dev_priv->drm, "SROT is not supported\n");
 	return ASLC_ROTATION_ANGLES_FAILED;
 }
 
 static u32 asle_set_button_array(struct drm_i915_private *dev_priv, u32 iuer)
 {
 	if (!iuer)
-		DRM_DEBUG_DRIVER("Button array event is not supported (nothing)\n");
+		drm_dbg(&dev_priv->drm,
+			"Button array event is not supported (nothing)\n");
 	if (iuer & ASLE_IUER_ROTATION_LOCK_BTN)
-		DRM_DEBUG_DRIVER("Button array event is not supported (rotation lock)\n");
+		drm_dbg(&dev_priv->drm,
+			"Button array event is not supported (rotation lock)\n");
 	if (iuer & ASLE_IUER_VOLUME_DOWN_BTN)
-		DRM_DEBUG_DRIVER("Button array event is not supported (volume down)\n");
+		drm_dbg(&dev_priv->drm,
+			"Button array event is not supported (volume down)\n");
 	if (iuer & ASLE_IUER_VOLUME_UP_BTN)
-		DRM_DEBUG_DRIVER("Button array event is not supported (volume up)\n");
+		drm_dbg(&dev_priv->drm,
+			"Button array event is not supported (volume up)\n");
 	if (iuer & ASLE_IUER_WINDOWS_BTN)
-		DRM_DEBUG_DRIVER("Button array event is not supported (windows)\n");
+		drm_dbg(&dev_priv->drm,
+			"Button array event is not supported (windows)\n");
 	if (iuer & ASLE_IUER_POWER_BTN)
-		DRM_DEBUG_DRIVER("Button array event is not supported (power)\n");
+		drm_dbg(&dev_priv->drm,
+			"Button array event is not supported (power)\n");
 
 	return ASLC_BUTTON_ARRAY_FAILED;
 }
@@ -530,9 +538,11 @@ static u32 asle_set_button_array(struct drm_i915_private *dev_priv, u32 iuer)
 static u32 asle_set_convertible(struct drm_i915_private *dev_priv, u32 iuer)
 {
 	if (iuer & ASLE_IUER_CONVERTIBLE)
-		DRM_DEBUG_DRIVER("Convertible is not supported (clamshell)\n");
+		drm_dbg(&dev_priv->drm,
+			"Convertible is not supported (clamshell)\n");
 	else
-		DRM_DEBUG_DRIVER("Convertible is not supported (slate)\n");
+		drm_dbg(&dev_priv->drm,
+			"Convertible is not supported (slate)\n");
 
 	return ASLC_CONVERTIBLE_FAILED;
 }
@@ -540,16 +550,17 @@ static u32 asle_set_convertible(struct drm_i915_private *dev_priv, u32 iuer)
 static u32 asle_set_docking(struct drm_i915_private *dev_priv, u32 iuer)
 {
 	if (iuer & ASLE_IUER_DOCKING)
-		DRM_DEBUG_DRIVER("Docking is not supported (docked)\n");
+		drm_dbg(&dev_priv->drm, "Docking is not supported (docked)\n");
 	else
-		DRM_DEBUG_DRIVER("Docking is not supported (undocked)\n");
+		drm_dbg(&dev_priv->drm,
+			"Docking is not supported (undocked)\n");
 
 	return ASLC_DOCKING_FAILED;
 }
 
 static u32 asle_isct_state(struct drm_i915_private *dev_priv)
 {
-	DRM_DEBUG_DRIVER("ISCT is not supported\n");
+	drm_dbg(&dev_priv->drm, "ISCT is not supported\n");
 	return ASLC_ISCT_STATE_FAILED;
 }
 
@@ -569,8 +580,8 @@ static void asle_work(struct work_struct *work)
 	aslc_req = asle->aslc;
 
 	if (!(aslc_req & ASLC_REQ_MSK)) {
-		DRM_DEBUG_DRIVER("No request on ASLC interrupt 0x%08x\n",
-				 aslc_req);
+		drm_dbg(&dev_priv->drm,
+			"No request on ASLC interrupt 0x%08x\n", aslc_req);
 		return;
 	}
 
@@ -739,11 +750,12 @@ static void intel_didl_outputs(struct drm_i915_private *dev_priv)
 	}
 	drm_connector_list_iter_end(&conn_iter);
 
-	DRM_DEBUG_KMS("%d outputs detected\n", i);
+	drm_dbg_kms(&dev_priv->drm, "%d outputs detected\n", i);
 
 	if (i > max_outputs)
-		DRM_ERROR("More than %d outputs in connector list\n",
-			  max_outputs);
+		drm_err(&dev_priv->drm,
+			"More than %d outputs in connector list\n",
+			max_outputs);
 
 	/* If fewer than max outputs, the list must be null terminated */
 	if (i < max_outputs)
@@ -823,7 +835,9 @@ static void swsci_setup(struct drm_i915_private *dev_priv)
 		if (requested_callbacks) {
 			u32 req = opregion->swsci_sbcb_sub_functions;
 			if ((req & tmp) != req)
-				DRM_DEBUG_DRIVER("SWSCI BIOS requested (%08x) SBCB callbacks that are not supported (%08x)\n", req, tmp);
+				drm_dbg(&dev_priv->drm,
+					"SWSCI BIOS requested (%08x) SBCB callbacks that are not supported (%08x)\n",
+					req, tmp);
 			/* XXX: for now, trust the requested callbacks */
 			/* opregion->swsci_sbcb_sub_functions &= tmp; */
 		} else {
@@ -831,9 +845,10 @@ static void swsci_setup(struct drm_i915_private *dev_priv)
 		}
 	}
 
-	DRM_DEBUG_DRIVER("SWSCI GBDA callbacks %08x, SBCB callbacks %08x\n",
-			 opregion->swsci_gbda_sub_functions,
-			 opregion->swsci_sbcb_sub_functions);
+	drm_dbg(&dev_priv->drm,
+		"SWSCI GBDA callbacks %08x, SBCB callbacks %08x\n",
+		opregion->swsci_gbda_sub_functions,
+		opregion->swsci_sbcb_sub_functions);
 }
 
 static int intel_no_opregion_vbt_callback(const struct dmi_system_id *id)
@@ -867,15 +882,17 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 
 	ret = request_firmware(&fw, name, &dev_priv->drm.pdev->dev);
 	if (ret) {
-		DRM_ERROR("Requesting VBT firmware \"%s\" failed (%d)\n",
-			  name, ret);
+		drm_err(&dev_priv->drm,
+			"Requesting VBT firmware \"%s\" failed (%d)\n",
+			name, ret);
 		return ret;
 	}
 
 	if (intel_bios_is_valid_vbt(fw->data, fw->size)) {
 		opregion->vbt_firmware = kmemdup(fw->data, fw->size, GFP_KERNEL);
 		if (opregion->vbt_firmware) {
-			DRM_DEBUG_KMS("Found valid VBT firmware \"%s\"\n", name);
+			drm_dbg_kms(&dev_priv->drm,
+				    "Found valid VBT firmware \"%s\"\n", name);
 			opregion->vbt = opregion->vbt_firmware;
 			opregion->vbt_size = fw->size;
 			ret = 0;
@@ -883,7 +900,8 @@ static int intel_load_vbt_firmware(struct drm_i915_private *dev_priv)
 			ret = -ENOMEM;
 		}
 	} else {
-		DRM_DEBUG_KMS("Invalid VBT firmware \"%s\"\n", name);
+		drm_dbg_kms(&dev_priv->drm, "Invalid VBT firmware \"%s\"\n",
+			    name);
 		ret = -EINVAL;
 	}
 
@@ -910,9 +928,10 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 	BUILD_BUG_ON(sizeof(struct opregion_asle_ext) != 0x400);
 
 	pci_read_config_dword(pdev, ASLS, &asls);
-	DRM_DEBUG_DRIVER("graphic opregion physical addr: 0x%x\n", asls);
+	drm_dbg(&dev_priv->drm, "graphic opregion physical addr: 0x%x\n",
+		asls);
 	if (asls == 0) {
-		DRM_DEBUG_DRIVER("ACPI OpRegion not supported!\n");
+		drm_dbg(&dev_priv->drm, "ACPI OpRegion not supported!\n");
 		return -ENOTSUPP;
 	}
 
@@ -925,21 +944,21 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 	memcpy(buf, base, sizeof(buf));
 
 	if (memcmp(buf, OPREGION_SIGNATURE, 16)) {
-		DRM_DEBUG_DRIVER("opregion signature mismatch\n");
+		drm_dbg(&dev_priv->drm, "opregion signature mismatch\n");
 		err = -EINVAL;
 		goto err_out;
 	}
 	opregion->header = base;
 	opregion->lid_state = base + ACPI_CLID;
 
-	DRM_DEBUG_DRIVER("ACPI OpRegion version %u.%u.%u\n",
-			 opregion->header->over.major,
-			 opregion->header->over.minor,
-			 opregion->header->over.revision);
+	drm_dbg(&dev_priv->drm, "ACPI OpRegion version %u.%u.%u\n",
+		opregion->header->over.major,
+		opregion->header->over.minor,
+		opregion->header->over.revision);
 
 	mboxes = opregion->header->mboxes;
 	if (mboxes & MBOX_ACPI) {
-		DRM_DEBUG_DRIVER("Public ACPI methods supported\n");
+		drm_dbg(&dev_priv->drm, "Public ACPI methods supported\n");
 		opregion->acpi = base + OPREGION_ACPI_OFFSET;
 		/*
 		 * Indicate we handle monitor hotplug events ourselves so we do
@@ -951,20 +970,20 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 	}
 
 	if (mboxes & MBOX_SWSCI) {
-		DRM_DEBUG_DRIVER("SWSCI supported\n");
+		drm_dbg(&dev_priv->drm, "SWSCI supported\n");
 		opregion->swsci = base + OPREGION_SWSCI_OFFSET;
 		swsci_setup(dev_priv);
 	}
 
 	if (mboxes & MBOX_ASLE) {
-		DRM_DEBUG_DRIVER("ASLE supported\n");
+		drm_dbg(&dev_priv->drm, "ASLE supported\n");
 		opregion->asle = base + OPREGION_ASLE_OFFSET;
 
 		opregion->asle->ardy = ASLE_ARDY_NOT_READY;
 	}
 
 	if (mboxes & MBOX_ASLE_EXT)
-		DRM_DEBUG_DRIVER("ASLE extension supported\n");
+		drm_dbg(&dev_priv->drm, "ASLE extension supported\n");
 
 	if (intel_load_vbt_firmware(dev_priv) == 0)
 		goto out;
@@ -995,12 +1014,14 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		vbt = opregion->rvda;
 		vbt_size = opregion->asle->rvds;
 		if (intel_bios_is_valid_vbt(vbt, vbt_size)) {
-			DRM_DEBUG_KMS("Found valid VBT in ACPI OpRegion (RVDA)\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Found valid VBT in ACPI OpRegion (RVDA)\n");
 			opregion->vbt = vbt;
 			opregion->vbt_size = vbt_size;
 			goto out;
 		} else {
-			DRM_DEBUG_KMS("Invalid VBT in ACPI OpRegion (RVDA)\n");
+			drm_dbg_kms(&dev_priv->drm,
+				    "Invalid VBT in ACPI OpRegion (RVDA)\n");
 			memunmap(opregion->rvda);
 			opregion->rvda = NULL;
 		}
@@ -1018,11 +1039,13 @@ int intel_opregion_setup(struct drm_i915_private *dev_priv)
 		OPREGION_ASLE_EXT_OFFSET : OPREGION_SIZE;
 	vbt_size -= OPREGION_VBT_OFFSET;
 	if (intel_bios_is_valid_vbt(vbt, vbt_size)) {
-		DRM_DEBUG_KMS("Found valid VBT in ACPI OpRegion (Mailbox #4)\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Found valid VBT in ACPI OpRegion (Mailbox #4)\n");
 		opregion->vbt = vbt;
 		opregion->vbt_size = vbt_size;
 	} else {
-		DRM_DEBUG_KMS("Invalid VBT in ACPI OpRegion (Mailbox #4)\n");
+		drm_dbg_kms(&dev_priv->drm,
+			    "Invalid VBT in ACPI OpRegion (Mailbox #4)\n");
 	}
 
 out:
@@ -1058,20 +1081,22 @@ intel_opregion_get_panel_type(struct drm_i915_private *dev_priv)
 
 	ret = swsci(dev_priv, SWSCI_GBDA_PANEL_DETAILS, 0x0, &panel_details);
 	if (ret) {
-		DRM_DEBUG_KMS("Failed to get panel details from OpRegion (%d)\n",
-			      ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Failed to get panel details from OpRegion (%d)\n",
+			    ret);
 		return ret;
 	}
 
 	ret = (panel_details >> 8) & 0xff;
 	if (ret > 0x10) {
-		DRM_DEBUG_KMS("Invalid OpRegion panel type 0x%x\n", ret);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Invalid OpRegion panel type 0x%x\n", ret);
 		return -EINVAL;
 	}
 
 	/* fall back to VBT panel type? */
 	if (ret == 0x0) {
-		DRM_DEBUG_KMS("No panel type in OpRegion\n");
+		drm_dbg_kms(&dev_priv->drm, "No panel type in OpRegion\n");
 		return -ENODEV;
 	}
 
@@ -1081,7 +1106,8 @@ intel_opregion_get_panel_type(struct drm_i915_private *dev_priv)
 	 * via a quirk list :(
 	 */
 	if (!dmi_check_system(intel_use_opregion_panel_type)) {
-		DRM_DEBUG_KMS("Ignoring OpRegion panel type (%d)\n", ret - 1);
+		drm_dbg_kms(&dev_priv->drm,
+			    "Ignoring OpRegion panel type (%d)\n", ret - 1);
 		return -ENODEV;
 	}
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
