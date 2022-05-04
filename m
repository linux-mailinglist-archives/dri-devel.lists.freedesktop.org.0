Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3274351AFB1
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 22:48:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FE410E6A7;
	Wed,  4 May 2022 20:48:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5E94D10E6A7;
 Wed,  4 May 2022 20:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651697310; x=1683233310;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x2WXc1E2Z9cRdn7YPcoruKSfvGLq2nGncJ+JMvcrV6w=;
 b=Qh3j2Z5MCz+xkKyiainFfOvDawi+d/7o80hBaysLRJeqgpsx5iXOPVGY
 cK9DonBZeqzul1wHyWyUJatamn/3lqiXj3OcpLxxEg/ZgTyGchxLGGB3h
 7z9gIM0gSvfbtkhnUvGlu8TpHJAt73RV5MdCFO9LajSoiTEiIhOOesjCH
 xvCVRyRMiTqYKZpP7VNMuaOSPfw9KUW7bmbOEyEtrDoAO5qgAMUpabBvp
 hSlGj26iEoxmm8/1ohjyx7PggJMCld/zdc61vrfLTDHzipXAlLMsQaezC
 9dcfDAhQTP3c6iWaLBA19VFEyM+TLGDIcImUVKK9Sdfz6bIWeGZZsgoaX g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="267489088"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="267489088"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:30 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600"; d="scan'208";a="811292755"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 13:48:30 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 2/4] drm/i915/huc: Add fetch support for gsc-loaded HuC
 binary
Date: Wed,  4 May 2022 13:48:14 -0700
Message-Id: <20220504204816.2082588-3-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
References: <20220504204816.2082588-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On newer platforms (starting DG2 G10 B-step and G11 A-step), ownership of
HuC loading has been moved from the GuC to the GSC. As part of the
change, the header format of the HuC binary has been updated and does not
match the GuC anymore. The GSC will perform all the required checks on
the binary size, so we only need to check that the version matches.

Note that since we still haven't added any gsc-loaded FWs, the
loaded_via_gsc variable will always be kept to its initialization value
of zero.

v2: Add a note about loaded_via_gsc being zero (Alan)

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Reviewed-by: Alan Previn <alan.previn.teres.alexis@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c     | 99 ++++++++++++--------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h     |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h |  9 ++
 3 files changed, 72 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
index d078f884b5e32..9361532726d6c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c
@@ -301,45 +301,31 @@ static void __force_fw_fetch_failures(struct intel_uc_fw *uc_fw, int e)
 	}
 }
 
-/**
- * intel_uc_fw_fetch - fetch uC firmware
- * @uc_fw: uC firmware
- *
- * Fetch uC firmware into GEM obj.
- *
- * Return: 0 on success, a negative errno code on failure.
- */
-int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
+static int check_gsc_manifest(const struct firmware *fw,
+			      struct intel_uc_fw *uc_fw)
 {
-	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
-	struct device *dev = i915->drm.dev;
-	struct drm_i915_gem_object *obj;
-	const struct firmware *fw = NULL;
-	struct uc_css_header *css;
-	size_t size;
-	int err;
+	u32 *dw = (u32 *)fw->data;
+	u32 version = dw[HUC_GSC_VERSION_DW];
 
-	GEM_BUG_ON(!i915->wopcm.size);
-	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
-
-	err = i915_inject_probe_error(i915, -ENXIO);
-	if (err)
-		goto fail;
+	uc_fw->major_ver_found = FIELD_GET(HUC_GSC_MAJOR_VER_MASK, version);
+	uc_fw->minor_ver_found = FIELD_GET(HUC_GSC_MINOR_VER_MASK, version);
 
-	__force_fw_fetch_failures(uc_fw, -EINVAL);
-	__force_fw_fetch_failures(uc_fw, -ESTALE);
+	return 0;
+}
 
-	err = request_firmware(&fw, uc_fw->path, dev);
-	if (err)
-		goto fail;
+static int check_ccs_header(struct drm_i915_private *i915,
+			    const struct firmware *fw,
+			    struct intel_uc_fw *uc_fw)
+{
+	struct uc_css_header *css;
+	size_t size;
 
 	/* Check the size of the blob before examining buffer contents */
 	if (unlikely(fw->size < sizeof(struct uc_css_header))) {
 		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 			 fw->size, sizeof(struct uc_css_header));
-		err = -ENODATA;
-		goto fail;
+		return -ENODATA;
 	}
 
 	css = (struct uc_css_header *)fw->data;
@@ -352,8 +338,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 			 "%s firmware %s: unexpected header size: %zu != %zu\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 			 fw->size, sizeof(struct uc_css_header));
-		err = -EPROTO;
-		goto fail;
+		return -EPROTO;
 	}
 
 	/* uCode size must calculated from other sizes */
@@ -368,8 +353,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu < %zu\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 			 fw->size, size);
-		err = -ENOEXEC;
-		goto fail;
+		return -ENOEXEC;
 	}
 
 	/* Sanity check whether this fw is not larger than whole WOPCM memory */
@@ -378,8 +362,7 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		drm_warn(&i915->drm, "%s firmware %s: invalid size: %zu > %zu\n",
 			 intel_uc_fw_type_repr(uc_fw->type), uc_fw->path,
 			 size, (size_t)i915->wopcm.size);
-		err = -E2BIG;
-		goto fail;
+		return -E2BIG;
 	}
 
 	/* Get version numbers from the CSS header */
@@ -388,6 +371,49 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 	uc_fw->minor_ver_found = FIELD_GET(CSS_SW_VERSION_UC_MINOR,
 					   css->sw_version);
 
+	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
+		uc_fw->private_data_size = css->private_data_size;
+
+	return 0;
+}
+
+/**
+ * intel_uc_fw_fetch - fetch uC firmware
+ * @uc_fw: uC firmware
+ *
+ * Fetch uC firmware into GEM obj.
+ *
+ * Return: 0 on success, a negative errno code on failure.
+ */
+int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
+{
+	struct drm_i915_private *i915 = __uc_fw_to_gt(uc_fw)->i915;
+	struct device *dev = i915->drm.dev;
+	struct drm_i915_gem_object *obj;
+	const struct firmware *fw = NULL;
+	int err;
+
+	GEM_BUG_ON(!i915->wopcm.size);
+	GEM_BUG_ON(!intel_uc_fw_is_enabled(uc_fw));
+
+	err = i915_inject_probe_error(i915, -ENXIO);
+	if (err)
+		goto fail;
+
+	__force_fw_fetch_failures(uc_fw, -EINVAL);
+	__force_fw_fetch_failures(uc_fw, -ESTALE);
+
+	err = request_firmware(&fw, uc_fw->path, dev);
+	if (err)
+		goto fail;
+
+	if (uc_fw->loaded_via_gsc)
+		err = check_gsc_manifest(fw, uc_fw);
+	else
+		err = check_ccs_header(i915, fw, uc_fw);
+	if (err)
+		goto fail;
+
 	if (uc_fw->major_ver_found != uc_fw->major_ver_wanted ||
 	    uc_fw->minor_ver_found < uc_fw->minor_ver_wanted) {
 		drm_notice(&i915->drm, "%s firmware %s: unexpected version: %u.%u != %u.%u\n",
@@ -400,9 +426,6 @@ int intel_uc_fw_fetch(struct intel_uc_fw *uc_fw)
 		}
 	}
 
-	if (uc_fw->type == INTEL_UC_FW_TYPE_GUC)
-		uc_fw->private_data_size = css->private_data_size;
-
 	if (HAS_LMEM(i915)) {
 		obj = i915_gem_object_create_lmem_from_data(i915, fw->data, fw->size);
 		if (!IS_ERR(obj))
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
index 3229018877d3d..4f169035f5041 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h
@@ -102,6 +102,8 @@ struct intel_uc_fw {
 	u32 ucode_size;
 
 	u32 private_data_size;
+
+	bool loaded_via_gsc;
 };
 
 #ifdef CONFIG_DRM_I915_DEBUG_GUC
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
index e41ffc7a7fbcb..b05e0e35b734c 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h
@@ -39,6 +39,11 @@
  * 3. Length info of each component can be found in header, in dwords.
  * 4. Modulus and exponent key are not required by driver. They may not appear
  *    in fw. So driver will load a truncated firmware in this case.
+ *
+ * Starting from DG2, the HuC is loaded by the GSC instead of i915. The GSC
+ * firmware performs all the required integrity checks, we just need to check
+ * the version. Note that the header for GSC-managed blobs is different from the
+ * CSS used for dma-loaded firmwares.
  */
 
 struct uc_css_header {
@@ -78,4 +83,8 @@ struct uc_css_header {
 } __packed;
 static_assert(sizeof(struct uc_css_header) == 128);
 
+#define HUC_GSC_VERSION_DW		44
+#define   HUC_GSC_MAJOR_VER_MASK	(0xFF << 0)
+#define   HUC_GSC_MINOR_VER_MASK	(0xFF << 16)
+
 #endif /* _INTEL_UC_FW_ABI_H */
-- 
2.25.1

