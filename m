Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D33AEA4FFDD
	for <lists+dri-devel@lfdr.de>; Wed,  5 Mar 2025 14:14:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B2F610E292;
	Wed,  5 Mar 2025 13:14:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ig/RuT2M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0586610E7AC;
 Wed,  5 Mar 2025 13:14:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741180482; x=1772716482;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=BUD8t458r9+Xdzn5wLKQkZ6djmbYp+V4gNBNBVE45J4=;
 b=ig/RuT2Mwl7nUA9gaxa01N378cBQ++CjknV6Tffs1kJK9S56LC7KR0Rx
 r9WK8qu1F2wg+Wwdx8YfYevK4tmpyqU2ypY/oxtvDR795f2JBVE/DPxYf
 MSWQqbdq4RReXqDQ9Clr9Q3Uxia9AGVpaYsTyeTLuZO6qIQSJPG4Pz60b
 a4KFgzubCldndb1DNLA14fbmSy9v1jXhh2thazjL3IBFDUiZ8dVmMEtts
 mSGblWtUGaPzEpnFc4OicTpvz4QH8UGgxzQJxi5S0WjQWGkfgK+xVVNPn
 JHr71pdE7xkpE+8LtrdcXzFO4kkzyeoxHfgsKEjZKCBTu/ZbE/rmQMn+n Q==;
X-CSE-ConnectionGUID: MqeOm0pTShmjwfFaMYjspw==
X-CSE-MsgGUID: EHVglHmmQTKsTf0iscSiiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59685477"
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="59685477"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Mar 2025 05:14:42 -0800
X-CSE-ConnectionGUID: rZNFfHwrSB6oTACBbXxtcg==
X-CSE-MsgGUID: prRhBmfuTlGdSIMcpYpY/w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,223,1736841600"; d="scan'208";a="118701130"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa006.jf.intel.com with ESMTP; 05 Mar 2025 05:14:38 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com, harry.wentland@amd.com,
 pekka.paalanen@haloniitty.fi, sebastian.wick@redhat.com, jadahl@redhat.com,
 mwen@igalia.com, contact@emersion.fr, naveen1.kumar@intel.com,
 dmitry.baryshkov@linaro.org,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v3 09/23] drm/i915: Add intel_color_op
Date: Wed,  5 Mar 2025 18:55:54 +0530
Message-ID: <20250305132608.2379253-10-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250305132608.2379253-1-uma.shankar@intel.com>
References: <20250305132608.2379253-1-uma.shankar@intel.com>
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

