Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B526B8D4BCE
	for <lists+dri-devel@lfdr.de>; Thu, 30 May 2024 14:44:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A065210E0D4;
	Thu, 30 May 2024 12:44:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Mn9lFHQe";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D43DF10E0D4;
 Thu, 30 May 2024 12:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1717073048; x=1748609048;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=jkH81MlUsy3b/KKRGwyQFrW7hboGUblmvfxpa2H6Nxw=;
 b=Mn9lFHQegizAos7vwny61mzYmwtSHO9uzZoSaA3sKdt/ItjnF2uoBuo+
 jYhfa9PaOsUejn+x0wDE0pJKurH4KicfdsWLrX0JqjShbDMxk+t/wtaji
 lqz4c048O6OOn3FRph+RuZYJo3lPqb9BfSwKkuqKlP6EsUJqFqzqkcjY8
 96tBbi+x2WkvMSylrIm8wN8CxMbcGipFsy8NjQTzFeWtq76Drl5/ZrH+V
 V7XChgx3bxlq3btct8ngqGowIwY9LmY6rYO2x2OlHoHxtFTlYrtvRomwI
 q90MrUMb6JnsmeB9qzwSh00nw9aWMRs6mijXBnTQhreqejQhTSWA5/Ha2 Q==;
X-CSE-ConnectionGUID: jQFBiqokS0uKdpnJrn4pdg==
X-CSE-MsgGUID: B2NnICBcQSODy4VfArZuPA==
X-IronPort-AV: E=McAfee;i="6600,9927,11088"; a="38943159"
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="38943159"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 05:43:59 -0700
X-CSE-ConnectionGUID: jV+0OyEdQzqHuXLLWBCh/Q==
X-CSE-MsgGUID: mJwPgkeXSOGwKXLycCepRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,201,1712646000"; d="scan'208";a="66665269"
Received: from unknown (HELO localhost) ([10.237.66.160])
 by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 May 2024 05:43:56 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: jani.nikula@intel.com, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/i915/gvt: stop using drm_edid_block_valid()
Date: Thu, 30 May 2024 15:43:51 +0300
Message-Id: <20240530124352.362736-1-jani.nikula@intel.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

We'll want to stop drm_edid_block_valid() usage. KVMGT is the last
user. Replace with drm_edid_valid(), which unfortunately requires an
allocated drm_edid. However, on the plus side, this would be required to
handle the TODO comment about EDID extension block support.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>

---

Cc: Zhenyu Wang <zhenyuw@linux.intel.com>
Cc: Zhi Wang <zhi.wang.linux@gmail.com>
Cc: intel-gvt-dev@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 18 +++++++++++++-----
 1 file changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 4f74d867fe1a..7e3e5382c0c0 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -425,6 +425,18 @@ static const struct intel_vgpu_regops intel_vgpu_regops_opregion = {
 	.release = intel_vgpu_reg_release_opregion,
 };
 
+static bool edid_valid(const void *edid, size_t size)
+{
+	const struct drm_edid *drm_edid;
+	bool is_valid;
+
+	drm_edid = drm_edid_alloc(edid, size);
+	is_valid = drm_edid_valid(drm_edid);
+	drm_edid_free(drm_edid);
+
+	return is_valid;
+}
+
 static int handle_edid_regs(struct intel_vgpu *vgpu,
 			struct vfio_edid_region *region, char *buf,
 			size_t count, u16 offset, bool is_write)
@@ -443,11 +455,7 @@ static int handle_edid_regs(struct intel_vgpu *vgpu,
 		switch (offset) {
 		case offsetof(struct vfio_region_gfx_edid, link_state):
 			if (data == VFIO_DEVICE_GFX_LINK_STATE_UP) {
-				if (!drm_edid_block_valid(
-					(u8 *)region->edid_blob,
-					0,
-					true,
-					NULL)) {
+				if (!edid_valid(region->edid_blob, EDID_SIZE)) {
 					gvt_vgpu_err("invalid EDID blob\n");
 					return -EINVAL;
 				}
-- 
2.39.2

