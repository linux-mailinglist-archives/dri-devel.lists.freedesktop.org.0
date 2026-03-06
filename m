Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EKhGEHAMq2k/ZgEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:40 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4837225D35
	for <lists+dri-devel@lfdr.de>; Fri, 06 Mar 2026 18:18:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0413610E3E2;
	Fri,  6 Mar 2026 17:18:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chazZ0D/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E194410E3D3;
 Fri,  6 Mar 2026 17:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1772817517; x=1804353517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=M/gQumhelxzHI/yNinPeBQLnWrHTN+PbTfU9pPgkBI4=;
 b=chazZ0D/wzvpULT2szAtcFpyhP2jxpjbseBdtmtWu51AR2OfU9g8TEvS
 w/6zzrcdmtK274UkcAu09KGCSc0YcaookmlUtVX5pRp/Sd43JQ1QG8Exq
 cV+uM8k8niGx6FzPVIhte6jOl9oPyQZJfoQvP8CJdvNFezWVG8N+9lY8x
 9eqggnecscbZJgsSL65uChJP9NRqlo/6vzV7LpAs2P7zueXiZN4C7tdRb
 7hz71F8KvRwL6Mz4hy9dolXmxuWWCL1qNV5cL31b4mfg5k/UOegjEDlwa
 +I0Z0IXi31VQcG8CejemwVG+3QHsHFzFLSrxg4l+V+013paFxsooWto1s A==;
X-CSE-ConnectionGUID: nyQCrA6DSL2kHzN7GRpHtg==
X-CSE-MsgGUID: bm6AeoCdRECKe2xCO9aOmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="77530666"
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="77530666"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Mar 2026 09:18:35 -0800
X-CSE-ConnectionGUID: 6+MYH7UYTxaZvuFL4TvX0w==
X-CSE-MsgGUID: /I42clHZTHqmyKWFHWdCDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,105,1770624000"; d="scan'208";a="216175003"
Received: from dut-2a59.iind.intel.com ([10.190.239.113])
 by fmviesa010.fm.intel.com with ESMTP; 06 Mar 2026 09:18:30 -0800
From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: harry.wentland@amd.com, louis.chauvet@bootlin.com, mwen@igalia.com,
 contact@emersion.fr, alex.hung@amd.com, daniels@collabora.com,
 uma.shankar@intel.com, maarten.lankhorst@intel.com,
 pekka.paalanen@collabora.com, pranay.samala@intel.com,
 swati2.sharma@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Subject: [PATCH 01/10] drm/colorop: Add DRM_COLOROP_CSC_FF
Date: Fri,  6 Mar 2026 22:22:58 +0530
Message-Id: <20260306165307.3233194-2-chaitanya.kumar.borah@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
References: <20260306165307.3233194-1-chaitanya.kumar.borah@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>
X-Rspamd-Queue-Id: C4837225D35
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[intel.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[intel.com:s=Intel];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[intel.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chaitanya.kumar.borah@intel.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-0.982];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo,intel.com:dkim,intel.com:email,intel.com:mid]
X-Rspamd-Action: no action

Introduce DRM_COLOROP_CSC_FF, a new colorop type representing a
fixed-function Color Space Conversion (CSC) block.

Unlike CTM-based colorops, this block does not expose programmable
coefficients. Instead, userspace selects one of the predefined
hardware modes via a new CSC_FF_TYPE enum property. Supported modes
include common YUV->RGB and RGB709->RGB2020 conversions.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
---
 drivers/gpu/drm/drm_atomic.c      |   4 ++
 drivers/gpu/drm/drm_atomic_uapi.c |   4 ++
 drivers/gpu/drm/drm_colorop.c     | 105 ++++++++++++++++++++++++++++++
 include/drm/drm_colorop.h         |  72 ++++++++++++++++++++
 include/uapi/drm/drm_mode.h       |  13 ++++
 5 files changed, 198 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 04925166df98..7296b844e3fd 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -844,6 +844,10 @@ static void drm_atomic_colorop_print_state(struct drm_printer *p,
 			   drm_get_colorop_lut3d_interpolation_name(colorop->lut3d_interpolation));
 		drm_printf(p, "\tdata blob id=%d\n", state->data ? state->data->base.id : 0);
 		break;
+	case DRM_COLOROP_CSC_FF:
+		drm_printf(p, "\tcsc_ff_type=%s\n",
+			   drm_get_colorop_csc_ff_type_name(state->csc_ff_type));
+		break;
 	default:
 		break;
 	}
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index 87de41fb4459..9af73325aa93 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -757,6 +757,8 @@ static int drm_atomic_colorop_set_property(struct drm_colorop *colorop,
 	} else if (property == colorop->data_property) {
 		return drm_atomic_color_set_data_property(colorop, state,
 							  property, val);
+	} else if (property == colorop->csc_ff_type_property) {
+		state->csc_ff_type = val;
 	} else {
 		drm_dbg_atomic(colorop->dev,
 			       "[COLOROP:%d:%d] unknown property [PROP:%d:%s]\n",
@@ -789,6 +791,8 @@ drm_atomic_colorop_get_property(struct drm_colorop *colorop,
 		*val = colorop->lut3d_interpolation;
 	else if (property == colorop->data_property)
 		*val = (state->data) ? state->data->base.id : 0;
+	else if (property == colorop->csc_ff_type_property)
+		*val = state->csc_ff_type;
 	else
 		return -EINVAL;
 
diff --git a/drivers/gpu/drm/drm_colorop.c b/drivers/gpu/drm/drm_colorop.c
index f421c623b3f0..49422c625f4d 100644
--- a/drivers/gpu/drm/drm_colorop.c
+++ b/drivers/gpu/drm/drm_colorop.c
@@ -68,6 +68,7 @@ static const struct drm_prop_enum_list drm_colorop_type_enum_list[] = {
 	{ DRM_COLOROP_CTM_3X4, "3x4 Matrix"},
 	{ DRM_COLOROP_MULTIPLIER, "Multiplier"},
 	{ DRM_COLOROP_3D_LUT, "3D LUT"},
+	{ DRM_COLOROP_CSC_FF, "CSC Fixed-Function"},
 };
 
 static const char * const colorop_curve_1d_type_names[] = {
@@ -90,6 +91,13 @@ static const struct drm_prop_enum_list drm_colorop_lut3d_interpolation_list[] =
 	{ DRM_COLOROP_LUT3D_INTERPOLATION_TETRAHEDRAL, "Tetrahedral" },
 };
 
+static const char * const colorop_csc_ff_type_names[] = {
+	[DRM_COLOROP_CSC_FF_YUV601_RGB601]   = "YUV601 to RGB601",
+	[DRM_COLOROP_CSC_FF_YUV709_RGB709]   = "YUV709 to RGB709",
+	[DRM_COLOROP_CSC_FF_YUV2020_RGB2020] = "YUV2020 to RGB2020",
+	[DRM_COLOROP_CSC_FF_RGB709_RGB2020]  = "RGB709 to RGB2020",
+};
+
 /* Init Helpers */
 
 static int drm_plane_colorop_init(struct drm_device *dev, struct drm_colorop *colorop,
@@ -459,6 +467,80 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 }
 EXPORT_SYMBOL(drm_plane_colorop_3dlut_init);
 
+/**
+ * drm_plane_colorop_csc_ff_init - Initialize a DRM_COLOROP_CSC_FF
+ *
+ * @dev: DRM device
+ * @colorop: The drm_colorop object to initialize
+ * @plane: The associated drm_plane
+ * @funcs: control functions for the new colorop
+ * @supported_csc_ff: A bitfield of supported drm_plane_colorop_csc_ff_type enum values,
+ *                    created using BIT(csc_ff_type) and combined with the OR '|'
+ *                    operator.
+ * @flags: bitmask of misc, see DRM_COLOROP_FLAG_* defines.
+ * @return zero on success, -E value on failure
+ */
+int drm_plane_colorop_csc_ff_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				  u64 supported_csc_ff, uint32_t flags)
+{
+	struct drm_prop_enum_list enum_list[DRM_COLOROP_CSC_FF_COUNT];
+	int i, len;
+
+	struct drm_property *prop;
+	int ret;
+
+	if (!supported_csc_ff) {
+		drm_err(dev,
+			"No supported CSC op for new CSC FF colorop on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	if ((supported_csc_ff & -BIT(DRM_COLOROP_CSC_FF_COUNT)) != 0) {
+		drm_err(dev, "Unknown CSC provided on [PLANE:%d:%s]\n",
+			plane->base.id, plane->name);
+		return -EINVAL;
+	}
+
+	ret = drm_plane_colorop_init(dev, colorop, plane, funcs, DRM_COLOROP_CSC_FF, flags);
+	if (ret)
+		return ret;
+
+	len = 0;
+	for (i = 0; i < DRM_COLOROP_CSC_FF_COUNT; i++) {
+		if ((supported_csc_ff & BIT(i)) == 0)
+			continue;
+
+		enum_list[len].type = i;
+		enum_list[len].name = colorop_csc_ff_type_names[i];
+		len++;
+	}
+
+	if (WARN_ON(len <= 0))
+		return -EINVAL;
+
+	prop = drm_property_create_enum(dev, DRM_MODE_PROP_ATOMIC, "CSC_FF_TYPE",
+					enum_list, len);
+
+	if (!prop)
+		return -ENOMEM;
+
+	colorop->csc_ff_type_property = prop;
+	/*
+	 * Default to the first supported CSC mode as provided by the driver.
+	 * Intuitively this should be something that keeps the colorop in pixel bypass
+	 * mode but that is already handled via the standard colorop bypass
+	 * property.
+	 */
+	drm_object_attach_property(&colorop->base, colorop->csc_ff_type_property,
+				   enum_list[0].type);
+	drm_colorop_reset(colorop);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_plane_colorop_csc_ff_init);
+
 static void __drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop,
 							struct drm_colorop_state *state)
 {
@@ -513,6 +595,13 @@ static void __drm_colorop_state_reset(struct drm_colorop_state *colorop_state,
 						      &val);
 		colorop_state->curve_1d_type = val;
 	}
+
+	if (colorop->csc_ff_type_property) {
+		drm_object_property_get_default_value(&colorop->base,
+						      colorop->csc_ff_type_property,
+						      &val);
+		colorop_state->csc_ff_type = val;
+	}
 }
 
 /**
@@ -551,6 +640,7 @@ static const char * const colorop_type_name[] = {
 	[DRM_COLOROP_CTM_3X4] = "3x4 Matrix",
 	[DRM_COLOROP_MULTIPLIER] = "Multiplier",
 	[DRM_COLOROP_3D_LUT] = "3D LUT",
+	[DRM_COLOROP_CSC_FF] = "CSC Fixed-Function",
 };
 
 static const char * const colorop_lu3d_interpolation_name[] = {
@@ -607,6 +697,21 @@ const char *drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_inte
 	return colorop_lu3d_interpolation_name[type];
 }
 
+/**
+ * drm_get_colorop_csc_ff_type_name: return a string for interpolation type
+ * @type: csc ff type to compute name of
+ *
+ * In contrast to the other drm_get_*_name functions this one here returns a
+ * const pointer and hence is threadsafe.
+ */
+const char *drm_get_colorop_csc_ff_type_name(enum drm_colorop_csc_ff_type type)
+{
+	if (WARN_ON(type >= ARRAY_SIZE(colorop_csc_ff_type_names)))
+		return "unknown";
+
+	return colorop_csc_ff_type_names[type];
+}
+
 /**
  * drm_colorop_set_next_property - sets the next pointer
  * @colorop: drm colorop
diff --git a/include/drm/drm_colorop.h b/include/drm/drm_colorop.h
index bd082854ca74..2cd8e0779c2a 100644
--- a/include/drm/drm_colorop.h
+++ b/include/drm/drm_colorop.h
@@ -134,6 +134,60 @@ enum drm_colorop_curve_1d_type {
 	DRM_COLOROP_1D_CURVE_COUNT
 };
 
+/**
+ * enum drm_colorop_csc_ff_type - type of CSC Fixed-Function
+ *
+ * Describes a CSC operation to be applied by the DRM_COLOROP_CSC_FF colorop.
+ */
+enum drm_colorop_csc_ff_type {
+	/**
+	 * @DRM_COLOROP_CSC_FF_YUV601_RGB601
+	 *
+	 * enum string "YUV601 to RGB601"
+	 *
+	 * Selects the fixed-function CSC preset that converts YUV
+	 * (BT.601) colorimetry to RGB (BT.601).
+	 */
+	DRM_COLOROP_CSC_FF_YUV601_RGB601,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF_YUV709_RGB709:
+	 *
+	 * enum string "YUV709 to RGB709"
+	 *
+	 * Selects the fixed-function CSC preset that converts YUV
+	 * (BT.709) colorimetry to RGB (BT.709).
+	 */
+	DRM_COLOROP_CSC_FF_YUV709_RGB709,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF_YUV2020_RGB2020:
+	 *
+	 * enum string "YUV2020 to RGB2020"
+	 *
+	 * Selects the fixed-function CSC preset that converts YUV
+	 * (BT.2020) colorimetry to RGB (BT.2020).
+	 */
+	DRM_COLOROP_CSC_FF_YUV2020_RGB2020,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF_RGB709_RGB2020:
+	 *
+	 * enum string "RGB709 to RGB2020"
+	 *
+	 * Selects the fixed-function CSC preset that converts RGB
+	 * (BT.709) colorimetry to RGB (BT.2020).
+	 */
+	DRM_COLOROP_CSC_FF_RGB709_RGB2020,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF_COUNT:
+	 *
+	 * enum value denoting the size of the enum
+	 */
+	DRM_COLOROP_CSC_FF_COUNT
+};
+
 /**
  * struct drm_colorop_state - mutable colorop state
  */
@@ -183,6 +237,13 @@ struct drm_colorop_state {
 	 */
 	struct drm_property_blob *data;
 
+	/**
+	 * @csc_ff_type:
+	 *
+	 * Type of Fixed function CSC.
+	 */
+	enum drm_colorop_csc_ff_type csc_ff_type;
+
 	/** @state: backpointer to global drm_atomic_state */
 	struct drm_atomic_state *state;
 };
@@ -368,6 +429,13 @@ struct drm_colorop {
 	 */
 	struct drm_property *data_property;
 
+	/**
+	 * @csc_ff_type_property:
+	 *
+	 * Sub-type for DRM_COLOROP_CSC_FF type.
+	 */
+	struct drm_property *csc_ff_type_property;
+
 	/**
 	 * @next_property:
 	 *
@@ -424,6 +492,9 @@ int drm_plane_colorop_3dlut_init(struct drm_device *dev, struct drm_colorop *col
 				 uint32_t lut_size,
 				 enum drm_colorop_lut3d_interpolation_type interpolation,
 				 uint32_t flags);
+int drm_plane_colorop_csc_ff_init(struct drm_device *dev, struct drm_colorop *colorop,
+				  struct drm_plane *plane, const struct drm_colorop_funcs *funcs,
+				  u64 supported_csc_ff, uint32_t flags);
 
 struct drm_colorop_state *
 drm_atomic_helper_colorop_duplicate_state(struct drm_colorop *colorop);
@@ -480,6 +551,7 @@ drm_get_colorop_lut1d_interpolation_name(enum drm_colorop_lut1d_interpolation_ty
 
 const char *
 drm_get_colorop_lut3d_interpolation_name(enum drm_colorop_lut3d_interpolation_type type);
+const char *drm_get_colorop_csc_ff_type_name(enum drm_colorop_csc_ff_type type);
 
 void drm_colorop_set_next_property(struct drm_colorop *colorop, struct drm_colorop *next);
 
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 3693d82b5279..f7808e7ea984 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -968,6 +968,19 @@ enum drm_colorop_type {
 	 *         color = lut3d[index]
 	 */
 	DRM_COLOROP_3D_LUT,
+
+	/**
+	 * @DRM_COLOROP_CSC_FF:
+	 *
+	 * enum string "CSC Fixed-Function"
+	 *
+	 * A fixed-function Color Space Conversion block where the coefficients
+	 * are not programmable but selected from predefined hardware modes via
+	 * the CSC_FF_TYPE enum property. The driver advertises the supported
+	 * CSC modes through this property.
+	 */
+	DRM_COLOROP_CSC_FF,
+
 };
 
 /**
-- 
2.25.1

