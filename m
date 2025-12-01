Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55054C96243
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 09:29:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AFBB10E320;
	Mon,  1 Dec 2025 08:29:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kfoW+L2U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F76510E31B;
 Mon,  1 Dec 2025 08:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764577789; x=1796113789;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=5hnRKcN5tbedNi0hk9XR+hILDioF7IhCdNOOoRlRFB0=;
 b=kfoW+L2U6VJbSfsQK5uP98HZldUZZsyz/9MMN+yMDV1q3SoaocqlHeun
 mIdNnuqtrbaS4AR8CIRjPlM/FThu6+MGuKTcuMWNHmsfppv/scayB1IhT
 Ya1YW1Wsq4Eilgix0Y284/x3NejnNDM6JGf+YMLUjYCCq7jyyETOlgs7e
 kPUnPwY2VeSKC+t812pNTAGnM8hcH2lThx9D/tU1shClvLXwpMLhp/4PZ
 R1wktWxKBHlCipsaSHtLfEIxCdV85Sy5o3byNC488WmXBDts9zYwj3XrY
 WGq3nufjryAjHbDc+ItMtpK1yUOY3SHGRwgcjJyAGTdhCjy9PT1+N/4tC Q==;
X-CSE-ConnectionGUID: n4dIbBLoSiy/PeeNb8E6SA==
X-CSE-MsgGUID: cYpc4r8XSBWy9wjcXlMtWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66578450"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66578450"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Dec 2025 00:29:49 -0800
X-CSE-ConnectionGUID: 7EHqeELPRteauD+oKa1xsg==
X-CSE-MsgGUID: EK3pNMQDQo6TjiL3SlA8AA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="198352952"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa005.fm.intel.com with ESMTP; 01 Dec 2025 00:29:42 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
Date: Mon, 01 Dec 2025 13:58:54 +0530
Subject: [PATCH DO_NOT_RTEVIEW v9 12/20] Plane Color Pipeline support for
 Intel platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251201-dpst-v9-12-e462d55dba65@intel.com>
References: <20251201-dpst-v9-0-e462d55dba65@intel.com>
In-Reply-To: <20251201-dpst-v9-0-e462d55dba65@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Lucas De Marchi <lucas.demarchi@intel.com>, 
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
 uma.shankar@intel.com, chaitanya.kumar.borah@intel.com, 
 suraj.kandpal@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 "Imported from f20250128-dpst-v8-0-871b94d777f8"@intel.com, 
 Arun R Murthy <arun.r.murthy@intel.com>
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

This patch is a squashed series of
https://patchwork.freedesktop.org/series/129811/

Note: The entire series is not taken

Signed-off-by: Arun R Murthy <arun.r.murthy@intel.com>
---
 drivers/gpu/drm/i915/Makefile                       | 2 ++
 drivers/gpu/drm/i915/display/intel_display_limits.h | 8 ++++++++
 drivers/gpu/drm/i915/display/intel_display_types.h  | 5 +++++
 drivers/gpu/drm/xe/Makefile                         | 2 ++
 4 files changed, 17 insertions(+)

diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
index 004e8fc092a3b9ba7dd907a228b835ceaf8f2ba5..5088a0ef0be67f5e3851ab8e43b8f661824d561a 100644
--- a/drivers/gpu/drm/i915/Makefile
+++ b/drivers/gpu/drm/i915/Makefile
@@ -236,6 +236,8 @@ i915-y += \
 	display/intel_cdclk.o \
 	display/intel_cmtg.o \
 	display/intel_color.o \
+	display/intel_colorop.o \
+	display/intel_color_pipeline.o \
 	display/intel_combo_phy.o \
 	display/intel_connector.o \
 	display/intel_crtc.o \
diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index f0fa27e365ab6d1fad1616266ac2b0508ce92a91..55fd574ba313176b5da637e3623ad106dd27880c 100644
--- a/drivers/gpu/drm/i915/display/intel_display_limits.h
+++ b/drivers/gpu/drm/i915/display/intel_display_limits.h
@@ -138,4 +138,12 @@ enum hpd_pin {
 	HPD_NUM_PINS
 };
 
+enum intel_color_block {
+	INTEL_PLANE_CB_PRE_CSC_LUT,
+	INTEL_PLANE_CB_CSC,
+	INTEL_PLANE_CB_POST_CSC_LUT,
+
+	INTEL_CB_MAX
+};
+
 #endif /* __INTEL_DISPLAY_LIMITS_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_display_types.h b/drivers/gpu/drm/i915/display/intel_display_types.h
index b8a1be24cd0408dfa5377c9afe5309a9f1e743dd..ac5fa0dbffd77dbf927b61d2916a9624eeabac24 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1987,6 +1987,11 @@ struct intel_dp_mst_encoder {
 	struct intel_connector *connector;
 };
 
+struct intel_colorop {
+	struct drm_colorop base;
+	enum intel_color_block id;
+};
+
 static inline struct intel_encoder *
 intel_attached_encoder(struct intel_connector *connector)
 {
diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
index 38008a644a0919868d6ff99fdda024df0eca944e..cd84f2be4ed37847d4da031ad9e330f56982431d 100644
--- a/drivers/gpu/drm/xe/Makefile
+++ b/drivers/gpu/drm/xe/Makefile
@@ -230,6 +230,8 @@ xe-$(CONFIG_DRM_XE_DISPLAY) += \
 	i915-display/intel_cdclk.o \
 	i915-display/intel_cmtg.o \
 	i915-display/intel_color.o \
+	i915-display/intel_colorop.o \
+	i915-display/intel_color_pipeline.o \
 	i915-display/intel_combo_phy.o \
 	i915-display/intel_connector.o \
 	i915-display/intel_crtc.o \

-- 
2.25.1

