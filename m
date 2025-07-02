Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45DCBAF0F0C
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jul 2025 11:08:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D4D610E691;
	Wed,  2 Jul 2025 09:08:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UHqy+LNQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABB2410E689;
 Wed,  2 Jul 2025 09:08:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751447286; x=1782983286;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HbPZDQkTeo7UtUdWstIEfUAlmgDGMshgLNh9LU6L0pI=;
 b=UHqy+LNQLUk1Xf8c4W78cP3ydUXMUuqw2Gi2DzW9YLEsC4262lWAE9Kt
 EpDDGYU5ykcFeNop4og74PWJQudPCy+3Fy2qse8aHQw6kxfYzSjvhCYI0
 XOxNbSrwlArFMo4ovoezpiVz0t8q+BpepHs44S2oC/DibskO6YcA/8+8d
 S8bBfd65XBcMI6aH+JUGlpHCXjH6QW4J3KbCCsd8B670DW6NPN5VfkKUr
 yrnelDGNRWbnaz2bcgfARKDUTrk/kTZufhZhg2q6KP7+07BEJNguPze8w
 9+iwfGL/UL7KHCTvxWgo/642M39821yy44KQX/jjDOfYMaTlHWLmte93K Q==;
X-CSE-ConnectionGUID: tpZFvweRTRuDJUGOXex24A==
X-CSE-MsgGUID: 6SprjVmgR2mNxLAjtDhPjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="64427025"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="64427025"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2025 02:08:06 -0700
X-CSE-ConnectionGUID: m95OiVP/TqGFJYXyp0CqRQ==
X-CSE-MsgGUID: po/cMIBXQQewjDJ8HEINEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; d="scan'208";a="159536485"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa004.fm.intel.com with ESMTP; 02 Jul 2025 02:08:02 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 Uma Shankar <uma.shankar@intel.com>
Subject: [v5 08/24] drm/i915: Add intel_color_op
Date: Wed,  2 Jul 2025 14:49:20 +0530
Message-ID: <20250702091936.3004854-9-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20250702091936.3004854-1-uma.shankar@intel.com>
References: <20250702091936.3004854-1-uma.shankar@intel.com>
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
index ce45261c4a8f..4b5124a08cc9 100644
--- a/drivers/gpu/drm/i915/display/intel_display_types.h
+++ b/drivers/gpu/drm/i915/display/intel_display_types.h
@@ -1560,6 +1560,10 @@ struct intel_plane {
 #define to_intel_framebuffer(fb) \
 	container_of_const((fb), struct intel_framebuffer, base)
 
+#define intel_fb_obj(x) ((x) ? to_intel_bo((x)->obj[0]) : NULL)
+#define to_intel_plane_colorop(x) container_of(x, struct intel_plane_colorop, base)
+#define to_intel_colorop_state(x) container_of(x, struct intel_plane_colorop_state, uapi)
+
 struct intel_hdmi {
 	i915_reg_t hdmi_reg;
 	struct {
@@ -1932,6 +1936,21 @@ struct intel_dp_mst_encoder {
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

