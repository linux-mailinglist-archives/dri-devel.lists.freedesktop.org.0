Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B1BA052E2
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jan 2025 06:53:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D369710EB87;
	Wed,  8 Jan 2025 05:53:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="X4sH7qtP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D8AD10EB85;
 Wed,  8 Jan 2025 05:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1736315626; x=1767851626;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=0vxXH41AFMIcOEnoOnj2WnyAy8VFZMiI/umlcWXii+I=;
 b=X4sH7qtPNgi/dEZibzwjAAsAu4ozBx9QEjUMHXyHco/BtSAa8gZCu24+
 unjfDK4vaO5NB64W4FNCrW0qY8F+/h318+lQGn196Y2E/6KpxudPvfi27
 tKcovPJ4YIcgGufSWS5MqKSnTQERbpfDSja/KPhxeIbhNJV2cbu6c+V96
 2+ND3LvZqIWBNxC3oC3ORA1bu54QTX2un8OL3I44T6up0KWTy8NG9XWwj
 NiI10apKVCIe27FXckcXyQWFdmsACRv6FgCqWElivXSYjbGjA3Vhgyzzy
 HinqsF0XPTyWQGTyxPm7uoAqqjUklx6mQsGwaLkgeW/041s/YUSwX8udL w==;
X-CSE-ConnectionGUID: 1vLG+c/JS06l+wX3da27Qg==
X-CSE-MsgGUID: Te2tNQF6RC2OR4WaMJZZDw==
X-IronPort-AV: E=McAfee;i="6700,10204,11308"; a="61903907"
X-IronPort-AV: E=Sophos;i="6.12,297,1728975600"; d="scan'208";a="61903907"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2025 21:53:46 -0800
X-CSE-ConnectionGUID: 4lu5OBIqR/aZdq57e7256Q==
X-CSE-MsgGUID: qQqcFx/8TuaQa8c6ts+RpQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="107024160"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa003.fm.intel.com with ESMTP; 07 Jan 2025 21:53:44 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Wed, 08 Jan 2025 11:09:02 +0530
Subject: [PATCH v3 4/5] drm/i915/display: Populate list of async supported
 formats/modifiers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250108-asyn-v3-4-f4399635eec9@intel.com>
References: <20250108-asyn-v3-0-f4399635eec9@intel.com>
In-Reply-To: <20250108-asyn-v3-0-f4399635eec9@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
 intel-xe@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
X-Mailer: b4 0.15-dev
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

Populate the list of formats/modifiers supported by async flip. Register
a async property and expose the same to user through blob.

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/display/skl_universal_plane.c | 51 ++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/skl_universal_plane.c b/drivers/gpu/drm/i915/display/skl_universal_plane.c
index ff9764cac1e71959e56283f61b5192ea261cec7a..e5e47f2219dae62e76cbde2efb40266b047ab2b2 100644
--- a/drivers/gpu/drm/i915/display/skl_universal_plane.c
+++ b/drivers/gpu/drm/i915/display/skl_universal_plane.c
@@ -170,6 +170,44 @@ static const u32 icl_hdr_plane_formats[] = {
 	DRM_FORMAT_XVYU16161616,
 };
 
+static u64 tgl_asyn_modifiers[] = {
+	DRM_FORMAT_MOD_LINEAR,
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_4_TILED,
+	I915_FORMAT_MOD_Y_TILED_GEN12_RC_CCS,
+	I915_FORMAT_MOD_4_TILED_MTL_RC_CCS,
+	I915_FORMAT_MOD_4_TILED_DG2_RC_CCS,
+	I915_FORMAT_MOD_4_TILED_BMG_CCS,
+	I915_FORMAT_MOD_4_TILED_LNL_CCS,
+};
+
+static u64 icl_async_modifiers[] = {
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_Yf_TILED,
+	I915_FORMAT_MOD_Y_TILED_CCS,
+	I915_FORMAT_MOD_Yf_TILED_CCS,
+};
+
+static u64 skl_async_modifiers[] = {
+	I915_FORMAT_MOD_X_TILED,
+	I915_FORMAT_MOD_Y_TILED,
+	I915_FORMAT_MOD_Yf_TILED,
+};
+
+static u32 intel_async_formats[] = {
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_XRGB2101010,
+	DRM_FORMAT_XBGR2101010,
+	DRM_FORMAT_XRGB16161616F,
+	DRM_FORMAT_XBGR16161616F,
+};
+
 int skl_format_to_fourcc(int format, bool rgb_order, bool alpha)
 {
 	switch (format) {
@@ -2613,6 +2651,7 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	unsigned int supported_rotations;
 	unsigned int supported_csc;
 	const u64 *modifiers;
+	u64 *async_modifiers;
 	const u32 *formats;
 	int num_formats;
 	int ret;
@@ -2715,6 +2754,18 @@ skl_universal_plane_create(struct drm_i915_private *dev_priv,
 	if (ret)
 		goto fail;
 
+	if (DISPLAY_VER(dev_priv) >= 12)
+		async_modifiers = tgl_asyn_modifiers;
+	else if (DISPLAY_VER(dev_priv) == 11)
+		async_modifiers = icl_async_modifiers;
+	else
+		async_modifiers = skl_async_modifiers;
+
+	drm_plane_create_format_blob(&dev_priv->drm, &plane->base,
+				     async_modifiers, sizeof(async_modifiers),
+				     intel_async_formats,
+				     sizeof(intel_async_formats), true);
+
 	if (DISPLAY_VER(dev_priv) >= 13)
 		supported_rotations = DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_180;
 	else

-- 
2.25.1

