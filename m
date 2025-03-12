Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B178DA5D6F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Mar 2025 08:12:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0987110E6F6;
	Wed, 12 Mar 2025 07:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PRokhwyR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1556710E6F8;
 Wed, 12 Mar 2025 07:12:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741763572; x=1773299572;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUD8t458r9+Xdzn5wLKQkZ6djmbYp+V4gNBNBVE45J4=;
 b=PRokhwyR5MmbedYSQKkiwuOK05QKbH7hEYjWdtqwNvEljVg56v2vEXk0
 +bqRF97gXarulUoghg9EbYPxgAPJGBsQflBR5vn7Q5BwmrFZVMG2EVYma
 8zSGu7TKgmoQb/OXv3XC0rS6k/FQEjTXvitDGNkWdJO2iQTk8cBwJ32Vs
 lNjZXREo9PZvs+e4QANd5Gr2JyXCA26MdSEmx/QcgeDAH++286TpzpK5m
 zR04nQAL9xfkzMS9nOjFVcRLyrteR7R+Bh9CSVJyL9feEIODf/7JG/4CE
 pIX/iMdtghZeR2T4GWhp/YL8KOglN4RHXGbTVxFbr6I1xrI3J9S6rvZ6+ Q==;
X-CSE-ConnectionGUID: vQRLvD8ESeanD4Uxp8bTRg==
X-CSE-MsgGUID: ADqs7UwgQMSuXpfC8C+g9g==
X-IronPort-AV: E=McAfee;i="6700,10204,11370"; a="65288767"
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="65288767"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Mar 2025 00:12:51 -0700
X-CSE-ConnectionGUID: 2mdkYuthTUugAVzB8erzXA==
X-CSE-MsgGUID: CXQNA5M3SzqWCX72oJ+0dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,241,1736841600"; d="scan'208";a="120366644"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa006.fm.intel.com with ESMTP; 12 Mar 2025 00:12:47 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v4 09/23] drm/i915: Add intel_color_op
Date: Wed, 12 Mar 2025 12:54:11 +0530
Message-ID: <20250312072425.3099205-10-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250312072425.3099205-1-uma.shankar@intel.com>
References: <20250312072425.3099205-1-uma.shankar@intel.com>
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
index 99a6fd2900b9..206a2498eaa0 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1527,6 +1527,10 @@ struct intel_plane {
 #define to_intel_framebuffer(fb) \
 	container_of_const((fb), struct intel_framebuffer, base)
 
+#define intel_fb_obj(x) ((x) ? to_intel_bo((x)->obj[0]) : NULL)
+#define to_intel_plane_colorop(x) container_of(x, struct intel_plane_colorop, base)
+#define to_intel_colorop_state(x) container_of(x, struct intel_plane_colorop_state, uapi)
+
 struct intel_hdmi {
 	i915_reg_t hdmi_reg;
 	struct {
@@ -1891,6 +1895,21 @@ struct intel_dp_mst_encoder {
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

