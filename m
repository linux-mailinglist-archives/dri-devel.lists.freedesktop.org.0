Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AD994EF82
	for <lists+dri-devel@lfdr.de>; Mon, 12 Aug 2024 16:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 445EC10E23F;
	Mon, 12 Aug 2024 14:28:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dIhQ1niQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D64DA10E23D;
 Mon, 12 Aug 2024 14:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1723472937; x=1755008937;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=8Sw9BHCDm18clVr1kpmcqd55zlV5cTU9U5Lb+EunLPg=;
 b=dIhQ1niQ5szGTpDLW/QO7jrtq/5TxKgdOkJFsWBGSMPvhQIACG/47Ddh
 /iT25C6EaVqgflxau3eaF6PTJ1EyrLoeNjN5QyC0KqAHBOCwm/BWzwAJr
 vySFfrcwpiLrX4lMQJVveKDWox+qw5zUQVOavuO/IR77/WtHGH/CUS3ki
 o60fhZRt80wGvv01wxFcDDce9sh8PxH2fov3r2J5gFjDJxjnJP0QmMcnC
 TOT7qCdg0pB1zaIN+YMO2jr/b2TmyI9Ce7Oy1NJ0MBTftuXF/P66aY6Jm
 GJGKIFOFeXFUHWQ0j94Lj47THypkhjmBJrpk+CGuq9/uyKW5V5QyCe1KE Q==;
X-CSE-ConnectionGUID: Nej5PIWdSK6HUHGJLuUS+A==
X-CSE-MsgGUID: gN8WLSkyTGOLE6W9EX9r7w==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="32737593"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="32737593"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:28:57 -0700
X-CSE-ConnectionGUID: UZrmJdAwRHaJdl2DwBpEGQ==
X-CSE-MsgGUID: 61qaJ062THuNbSQS5Ilv0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; d="scan'208";a="81521670"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.117])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Aug 2024 07:28:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@intel.com>,
 Zhi Wang <zhiwang@kernel.rog>, Zhenyu Wang <zhenyuw@linux.intel.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>, intel-gvt-dev@lists.freedesktop.org
Subject: [RESEND 1/2] drm/i915/gvt: stop using drm_edid_block_valid()
Date: Mon, 12 Aug 2024 17:28:48 +0300
Message-Id: <20240812142849.1588006-1-jani.nikula@intel.com>
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

Acked-by: Zhi Wang <zhiwang@kernel.rog>
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
index 38830818c120..ca0fb126b02d 100644
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

