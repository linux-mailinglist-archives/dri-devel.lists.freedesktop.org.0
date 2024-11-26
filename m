Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 404E39D984A
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A47A810E899;
	Tue, 26 Nov 2024 13:20:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BPaL1g3p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56A2510E894;
 Tue, 26 Nov 2024 13:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627214; x=1764163214;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=/js1Aa8ZfAHYnJ3xmoGwZu+DEdhyh6hv7q+nJ0MUxF0=;
 b=BPaL1g3p/w+LdUX2D8xvp4Yq2gOVWzfAYoc0SMsyfGtWchn738hY332p
 0/8C+p/5u4aGxQwcn75gSFC3x7MitTQV8l1tmuW36ve8yOI/DQmKih1S9
 KhyPseHUCEoO2s3WOV49XVxCBT0c9b8MZxnWj93AdzAB8fkWzzyUrvf2b
 n6y6MEEAmbkvxoslnvIi6naHmevNjseo55fHtYSda/7oa670ontEXonGK
 B5IrFvE4J/7BG/IdOMMV5/XyjW4w17uK+8XV54q1ca2W7OWCaaQViTvkU
 UEAXrixY4bkUtXXAty+wNobchxFHkQkvPI9C3IDtTMqVNdvGPfIOicgBj w==;
X-CSE-ConnectionGUID: 1XeilLtnSdibkkeW13vIng==
X-CSE-MsgGUID: b7HzRKVjRYWRQLUqAeomXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170229"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170229"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:13 -0800
X-CSE-ConnectionGUID: ZXw9mx5sTiGjq+RXI2iHLg==
X-CSE-MsgGUID: jsJS0p7pRJKJIOHJzU4LMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874714"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:08 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 11/25] drm/i915: Add intel_color_op
Date: Tue, 26 Nov 2024 18:57:16 +0530
Message-ID: <20241126132730.1192571-12-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20241126132730.1192571-1-uma.shankar@intel.com>
References: <20241126132730.1192571-1-uma.shankar@intel.com>
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

From: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>

Add data structure to store intel specific details of colorop

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 .../drm/i915/display/intel_display_types.h    | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index 339e4b0f7698..cfb5e5658b17 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1497,6 +1497,10 @@ struct intel_plane {
 #define to_intel_framebuffer(fb) \
 	container_of_const((fb), struct intel_framebuffer, base)
 
+#define intel_fb_obj(x) ((x) ? to_intel_bo((x)->obj[0]) : NULL)
+#define to_intel_plane_colorop(x) container_of(x, struct intel_plane_colorop, base)
+#define to_intel_colorop_state(x) container_of(x, struct intel_plane_colorop_state, uapi)
+
 struct intel_hdmi {
 	i915_reg_t hdmi_reg;
 	struct {
@@ -1856,6 +1860,21 @@ struct intel_dp_mst_encoder {
 	struct intel_connector *connector;
 };
 
+struct intel_plane_colorop {
+	struct drm_colorop base;
+	enum intel_color_block id;
+};
+
+struct intel_plane_colorop_state {
+	struct drm_colorop_state uapi;
+
+	/* TODO: Add hw implementation */
+	struct {
+		bool active, enable;
+		struct drm_property_blob *data;
+	} hw;
+};
+
 static inline struct intel_encoder *
 intel_attached_encoder(struct intel_connector *connector)
 {
-- 
2.42.0

