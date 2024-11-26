Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1836C9D9853
	for <lists+dri-devel@lfdr.de>; Tue, 26 Nov 2024 14:20:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 831D110E89F;
	Tue, 26 Nov 2024 13:20:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="S2eX3+vk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F099E10E89E;
 Tue, 26 Nov 2024 13:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732627229; x=1764163229;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=hGKgDWM8jPRrqx3CTK41xLSb7BLTPQ3c89N6UkNBKAM=;
 b=S2eX3+vkAUBD5lProuXkGxO4MDqlg6rwa0DTGcXux4pRa5Gw6Sd8b52o
 cA1G6+cVNtu5sxMb/Q29TbOMMoIVy1iwzcx2yK2X0SzxiBups22J1s1Nh
 jq8ZwVq5YM0VirqLUW1tevuwjOW+lTECaL/r3nyGI5pDC+3DhhIoTn6uk
 ufDkCyBp/CJHdZbSt7n58sjZOmc2XzI7WNSnr+2Exxv1YYRzgjKSKVWlb
 MwM0yJIC7aPfWpHRorXFhPJ8QfnBNODQCucc5Gi8i3YaD7UbOefBfLNV/
 gob7qvV/wb/xOKBBn5GzLvgsJJ/9VygmhVmZl2mVmnTTen7LmrubTWZrp g==;
X-CSE-ConnectionGUID: LfTCXjtTQ0WZPFVaYXoD5w==
X-CSE-MsgGUID: uLsmlxvdQ4SE5bm0VuUahA==
X-IronPort-AV: E=McAfee;i="6700,10204,11268"; a="44170330"
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="44170330"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Nov 2024 05:20:28 -0800
X-CSE-ConnectionGUID: 50BgkJvaS32WN2wdJmcVKQ==
X-CSE-MsgGUID: zBeqwiYzQDi6QusqS1OOLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,186,1728975600"; d="scan'208";a="114874850"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 26 Nov 2024 05:20:24 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v2 15/25] drm/i915/color: Add framework to set colorop
Date: Tue, 26 Nov 2024 18:57:20 +0530
Message-ID: <20241126132730.1192571-16-uma.shankar@intel.com>
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

Add infrastructure to set colorop. We iterate through all the color ops
in a selected COLOR PIPELINE and set them one by one.

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 31 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  3 +++
 2 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 8bbaca9b3e9d..01bd5820a12b 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -4083,6 +4083,37 @@ struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id
 	return colorop;
 }
 
+static void apply_colorop(const struct drm_plane_state *plane_state,
+			  struct drm_colorop *colorop,
+			  u32 *plane_color_ctl)
+{
+}
+
+void intel_program_pipeline(const struct drm_plane_state *plane_state, u32 *plane_color_ctl)
+{
+	struct drm_colorop *colorop;
+
+	colorop = plane_state->color_pipeline;
+
+	while (colorop) {
+		struct drm_colorop_state *colorop_state;
+
+		if (!colorop)
+			return;
+
+		/* TODO this is probably wrong */
+		colorop_state = colorop->state;
+
+		if (!colorop_state)
+			return;
+
+		if (!colorop_state->bypass)
+			apply_colorop(plane_state, colorop, plane_color_ctl);
+
+		colorop = colorop->next;
+	}
+}
+
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list)
 {
 	struct intel_plane_colorop *colorop;
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 8a3bf5b79e39..7be2453eee0a 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -15,6 +15,7 @@ struct intel_display;
 struct intel_dsb;
 struct drm_property_blob;
 struct drm_plane;
+struct drm_plane_state;
 struct drm_prop_enum_list;
 enum intel_color_block;
 
@@ -47,5 +48,7 @@ struct intel_plane_colorop *intel_colorop_alloc(void);
 struct intel_plane_colorop *intel_plane_colorop_create(enum intel_color_block id);
 int intel_plane_tf_pipeline_init(struct drm_plane *plane, struct drm_prop_enum_list *list);
 int intel_plane_color_init(struct drm_plane *plane);
+void intel_program_pipeline(const struct drm_plane_state *plane_state,
+			    u32 *plane_color_ctl);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

