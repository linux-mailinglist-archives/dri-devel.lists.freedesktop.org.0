Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493CF60A668
	for <lists+dri-devel@lfdr.de>; Mon, 24 Oct 2022 14:35:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3C4A10E522;
	Mon, 24 Oct 2022 12:35:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D7A810E51A;
 Mon, 24 Oct 2022 12:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1666614885; x=1698150885;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WMf64Gbw55Bkai6/4GywXAPr2eifw9IGLUBCQJLeFxE=;
 b=IZzbEWH+Lijx7kGqY7pP6JetAnHtMHsLMYrD+Pz63WW7gHcBA49E9Yy/
 GO1fK7Qi9QMdazvh5SRWn7Su1ZEsExNOCD0hneWI7DUpI2ubzk3Velwdg
 KJMSh6+Iejaa4cyKnTeUaKhiCLhF0IpVuZc0N25w5r5arDazaGeM1gh3x
 KyGX1jBbQ4LxnEW8wJyENsFO5HBrs8RzS06IRazrmVzhIyB314mLtcs5G
 xayoA6odVcj6PdMWbMPizfYvey69VQa7vr4l39LqkF/NAn4ydSmtYy4n1
 yPb4T/joR/3w4rRw+bXCPQI5NBPAA9EJ37j30IRJafBJlCP1Vw+NYWRQp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="309091524"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="309091524"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:45 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10509"; a="626055742"
X-IronPort-AV: E=Sophos;i="5.95,209,1661842800"; d="scan'208";a="626055742"
Received: from emontau-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.252.52.221])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2022 05:34:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 12/16] drm/edid: use struct drm_edid for override/firmware
 EDID
Date: Mon, 24 Oct 2022 15:33:40 +0300
Message-Id: <e64267c28eca483e83c802bc06ddd149bdcdfc66.1666614699.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1666614699.git.jani.nikula@intel.com>
References: <cover.1666614699.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

There's a lot going on here, but the main thing is switching the
firmware EDID loader to use struct drm_edid. Unfortunately, it's
difficult to reasonably split to smaller pieces.

Convert the EDID loader to struct drm_edid. There's a functional change
in validation; it no longer tries to fix errors or filter invalid
blocks. It's stricter in this sense. Hopefully this will not be an
issue.

As a by-product, this change also allows HF-EEODB extended EDIDs to be
passed via override/firmware EDID.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c      | 32 ++++++------
 drivers/gpu/drm/drm_edid_load.c | 86 +++++++--------------------------
 include/drm/drm_edid.h          |  4 +-
 3 files changed, 36 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5e5e1463e45f..9078d1fb6d00 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2202,25 +2202,20 @@ static void connector_bad_edid(struct drm_connector *connector,
 }
 
 /* Get override or firmware EDID */
-static struct edid *drm_get_override_edid(struct drm_connector *connector,
-					  size_t *alloc_size)
+static const struct drm_edid *drm_edid_override_get(struct drm_connector *connector)
 {
-	struct edid *override = NULL;
+	const struct drm_edid *override = NULL;
 
 	mutex_lock(&connector->edid_override_mutex);
 
 	if (connector->edid_override)
-		override = drm_edid_duplicate(connector->edid_override->edid);
+		override = drm_edid_dup(connector->edid_override);
 
 	mutex_unlock(&connector->edid_override_mutex);
 
 	if (!override)
 		override = drm_edid_load_firmware(connector);
 
-	/* FIXME: Get alloc size from deeper down the stack */
-	if (!IS_ERR_OR_NULL(override) && alloc_size)
-		*alloc_size = edid_size(override);
-
 	return IS_ERR(override) ? NULL : override;
 }
 
@@ -2296,14 +2291,14 @@ int drm_edid_override_reset(struct drm_connector *connector)
  */
 int drm_edid_override_connector_update(struct drm_connector *connector)
 {
-	struct edid *override;
+	const struct drm_edid *override;
 	int num_modes = 0;
 
-	override = drm_get_override_edid(connector, NULL);
+	override = drm_edid_override_get(connector);
 	if (override) {
-		drm_connector_update_edid_property(connector, override);
-		num_modes = drm_add_edid_modes(connector, override);
-		kfree(override);
+		num_modes = drm_edid_connector_update(connector, override);
+
+		drm_edid_free(override);
 
 		DRM_DEBUG_KMS("[CONNECTOR:%d:%s] adding %d modes via fallback override/firmware EDID\n",
 			      connector->base.id, connector->name, num_modes);
@@ -2354,12 +2349,19 @@ static struct edid *_drm_do_get_edid(struct drm_connector *connector,
 {
 	enum edid_block_status status;
 	int i, num_blocks, invalid_blocks = 0;
+	const struct drm_edid *override;
 	struct edid *edid, *new;
 	size_t alloc_size = EDID_LENGTH;
 
-	edid = drm_get_override_edid(connector, &alloc_size);
-	if (edid)
+	override = drm_edid_override_get(connector);
+	if (override) {
+		alloc_size = override->size;
+		edid = kmemdup(override->edid, alloc_size, GFP_KERNEL);
+		drm_edid_free(override);
+		if (!edid)
+			return NULL;
 		goto ok;
+	}
 
 	edid = kmalloc(alloc_size, GFP_KERNEL);
 	if (!edid)
diff --git a/drivers/gpu/drm/drm_edid_load.c b/drivers/gpu/drm/drm_edid_load.c
index bc6b96abd1b3..248f0685c33e 100644
--- a/drivers/gpu/drm/drm_edid_load.c
+++ b/drivers/gpu/drm/drm_edid_load.c
@@ -159,22 +159,12 @@ static const u8 generic_edid[GENERIC_EDIDS][128] = {
 	},
 };
 
-static int edid_size(const u8 *edid, int data_size)
-{
-	if (data_size < EDID_LENGTH)
-		return 0;
-
-	return (edid[0x7e] + 1) * EDID_LENGTH;
-}
-
-static void *edid_load(struct drm_connector *connector, const char *name)
+static const struct drm_edid *edid_load(struct drm_connector *connector, const char *name)
 {
 	const struct firmware *fw = NULL;
 	const u8 *fwdata;
-	u8 *edid;
+	const struct drm_edid *drm_edid;
 	int fwsize, builtin;
-	int i, valid_extensions = 0;
-	bool print_bad_edid = !connector->bad_edid_counter || drm_debug_enabled(DRM_UT_KMS);
 
 	builtin = match_string(generic_edid_name, GENERIC_EDIDS, name);
 	if (builtin >= 0) {
@@ -203,69 +193,26 @@ static void *edid_load(struct drm_connector *connector, const char *name)
 		fwsize = fw->size;
 	}
 
-	if (edid_size(fwdata, fwsize) != fwsize) {
-		DRM_ERROR("Size of EDID firmware \"%s\" is invalid "
-			  "(expected %d, got %d\n", name,
-			  edid_size(fwdata, fwsize), (int)fwsize);
-		edid = ERR_PTR(-EINVAL);
-		goto out;
-	}
-
-	edid = kmemdup(fwdata, fwsize, GFP_KERNEL);
-	if (edid == NULL) {
-		edid = ERR_PTR(-ENOMEM);
-		goto out;
-	}
-
-	if (!drm_edid_block_valid(edid, 0, print_bad_edid,
-				  &connector->edid_corrupt)) {
-		connector->bad_edid_counter++;
-		DRM_ERROR("Base block of EDID firmware \"%s\" is invalid ",
-		    name);
-		kfree(edid);
-		edid = ERR_PTR(-EINVAL);
-		goto out;
-	}
-
-	for (i = 1; i <= edid[0x7e]; i++) {
-		if (i != valid_extensions + 1)
-			memcpy(edid + (valid_extensions + 1) * EDID_LENGTH,
-			    edid + i * EDID_LENGTH, EDID_LENGTH);
-		if (drm_edid_block_valid(edid + i * EDID_LENGTH, i,
-					 print_bad_edid,
-					 NULL))
-			valid_extensions++;
-	}
-
-	if (valid_extensions != edid[0x7e]) {
-		u8 *new_edid;
+	drm_dbg_kms(connector->dev, "[CONNECTOR:%d:%s] Loaded %s firmware EDID \"%s\"\n",
+		    connector->base.id, connector->name,
+		    builtin >= 0 ? "built-in" : "external", name);
 
-		edid[EDID_LENGTH-1] += edid[0x7e] - valid_extensions;
-		DRM_INFO("Found %d valid extensions instead of %d in EDID data "
-		    "\"%s\" for connector \"%s\"\n", valid_extensions,
-		    edid[0x7e], name, connector->name);
-		edid[0x7e] = valid_extensions;
-
-		new_edid = krealloc(edid, (valid_extensions + 1) * EDID_LENGTH,
-				    GFP_KERNEL);
-		if (new_edid)
-			edid = new_edid;
+	drm_edid = drm_edid_alloc(fwdata, fwsize);
+	if (!drm_edid_valid(drm_edid)) {
+		drm_err(connector->dev, "Invalid firmware EDID \"%s\"\n", name);
+		drm_edid_free(drm_edid);
+		drm_edid = ERR_PTR(-EINVAL);
 	}
 
-	DRM_INFO("Got %s EDID base block and %d extension%s from "
-	    "\"%s\" for connector \"%s\"\n", (builtin >= 0) ? "built-in" :
-	    "external", valid_extensions, valid_extensions == 1 ? "" : "s",
-	    name, connector->name);
-
-out:
 	release_firmware(fw);
-	return edid;
+
+	return drm_edid;
 }
 
-struct edid *drm_edid_load_firmware(struct drm_connector *connector)
+const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector)
 {
 	char *edidname, *last, *colon, *fwstr, *edidstr, *fallback = NULL;
-	struct edid *edid;
+	const struct drm_edid *drm_edid;
 
 	if (edid_firmware[0] == '\0')
 		return ERR_PTR(-ENOENT);
@@ -308,8 +255,9 @@ struct edid *drm_edid_load_firmware(struct drm_connector *connector)
 	if (*last == '\n')
 		*last = '\0';
 
-	edid = edid_load(connector, edidname);
+	drm_edid = edid_load(connector, edidname);
+
 	kfree(fwstr);
 
-	return edid;
+	return drm_edid;
 }
diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index dc7467d25cd8..8138613f4e4e 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -388,11 +388,11 @@ int drm_av_sync_delay(struct drm_connector *connector,
 		      const struct drm_display_mode *mode);
 
 #ifdef CONFIG_DRM_LOAD_EDID_FIRMWARE
-struct edid *drm_edid_load_firmware(struct drm_connector *connector);
+const struct drm_edid *drm_edid_load_firmware(struct drm_connector *connector);
 int __drm_set_edid_firmware_path(const char *path);
 int __drm_get_edid_firmware_path(char *buf, size_t bufsize);
 #else
-static inline struct edid *
+static inline const struct drm_edid *
 drm_edid_load_firmware(struct drm_connector *connector)
 {
 	return ERR_PTR(-ENOENT);
-- 
2.34.1

