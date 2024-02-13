Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB34852934
	for <lists+dri-devel@lfdr.de>; Tue, 13 Feb 2024 07:42:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A851C10E8F0;
	Tue, 13 Feb 2024 06:42:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="cmIjsjEl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A4510E8F0;
 Tue, 13 Feb 2024 06:42:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707806529; x=1739342529;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=b6Ociz95VEeWi4agoThupeMNOM6bYT/dva8t/ovHnDw=;
 b=cmIjsjElVR/6hEjFmNCixgA5C7x0g7G3u/3pzjpZPAmB8JpShs/XrXcd
 yaF0tWB+JkvOGNaJmPcJ0MbqNqoQ+vwp6pxybCl2R/rzDjyxkxjE6bRQ8
 xY0IL7elSs/p7tlTrBBdvMZRuMYG+W3TbNNDEatC7MUpaR4udvapV1HO9
 poG7m3aHtvS/A35Vo6OOk3q6rOpWLWhhLl84AmCPLicI61CBIZNqWCFl2
 oFq5yOBsdA9LmLm2BxlW5l3MFbojTi6zchMAA5KIds1ftbneTOpyAY2h9
 5acsREq1nATjiciiuC208yIJnBQm4mAfQL+YKiAI8yQZ2PkWk/+PDJzml w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10982"; a="436948012"
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; d="scan'208";a="436948012"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Feb 2024 22:42:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,156,1705392000"; 
   d="scan'208";a="7450442"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa003.jf.intel.com with ESMTP; 12 Feb 2024 22:42:02 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, pekka.paalanen@collabora.com,
 contact@emersion.fr, harry.wentland@amd.com, mwen@igalia.com,
 jadahl@redhat.com, sebastian.wick@redhat.com, shashank.sharma@amd.com,
 agoins@nvidia.com, joshua@froggi.es, mdaenzer@redhat.com, aleixpol@kde.org,
 xaver.hugl@gmail.com, victoria@system76.com, daniel@ffwll.ch,
 quic_naseer@quicinc.com, quic_cbraga@quicinc.com,
 quic_abhinavk@quicinc.com, arthurgrillo@riseup.net, marcan@marcan.st,
 Liviu.Dudau@arm.com, sashamcintosh@google.com, sean@poorly.run,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [PATCH 14/28] drm/i915/color: Add helper to allocate intel colorop
Date: Tue, 13 Feb 2024 12:18:21 +0530
Message-ID: <20240213064835.139464-15-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20240213064835.139464-1-uma.shankar@intel.com>
References: <20240213064835.139464-1-uma.shankar@intel.com>
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

Add helper to allocate memory for intel colorop

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 25 ++++++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_color.h |  1 +
 2 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index ca7112b32cb3..949c2efe105f 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -3810,6 +3810,31 @@ static const struct intel_color_funcs ilk_color_funcs = {
 	.get_config = ilk_get_config,
 };
 
+/* TODO: Move to another file */
+struct intel_plane_colorop *intel_colorop_alloc(void)
+{
+	struct intel_plane_colorop *colorop;
+	struct intel_plane_colorop_state *colorop_state;
+
+	colorop = kzalloc(sizeof(*colorop), GFP_KERNEL);
+	if (!colorop)
+		return ERR_PTR(-ENOMEM);
+
+	colorop_state = kzalloc(sizeof(*colorop_state), GFP_KERNEL);
+	if (!colorop_state) {
+		kfree(colorop);
+		return ERR_PTR(-ENOMEM);
+	}
+
+	/* TODO: Add color op reset
+	 * intel_colorop_state_reset(plane_state, plane);
+	 */
+
+	colorop->base.state = &colorop_state->uapi;
+
+	return colorop;
+}
+
 void intel_color_crtc_init(struct intel_crtc *crtc)
 {
 	struct drm_i915_private *i915 = to_i915(crtc->base.dev);
diff --git a/drivers/gpu/drm/i915/display/intel_color.h b/drivers/gpu/drm/i915/display/intel_color.h
index 8ecd36149def..e111d115724c 100644
--- a/drivers/gpu/drm/i915/display/intel_color.h
+++ b/drivers/gpu/drm/i915/display/intel_color.h
@@ -31,5 +31,6 @@ bool intel_color_lut_equal(const struct intel_crtc_state *crtc_state,
 			   const struct drm_property_blob *blob2,
 			   bool is_pre_csc_lut);
 void intel_color_assert_luts(const struct intel_crtc_state *crtc_state);
+struct intel_plane_colorop *intel_colorop_alloc(void);
 
 #endif /* __INTEL_COLOR_H__ */
-- 
2.42.0

