Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2B3CC95DD1
	for <lists+dri-devel@lfdr.de>; Mon, 01 Dec 2025 07:35:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01EC910E2A4;
	Mon,  1 Dec 2025 06:35:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FlJLfMHP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB8BA10E1A3;
 Mon,  1 Dec 2025 06:35:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764570951; x=1796106951;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zh9ygxrLb93dfRNrKpjFdFR7OPpEzsZr7QeIYIHSE9Y=;
 b=FlJLfMHPBxSe0zGvMiLErFQe+v5tyrpdCUX9YKWX7nqQEDhj3JK8VGew
 Kkq2G0G/NUrf4ll696cC3gru00QV4FFHrFPh9symVy9SoQE2pI4NTiR5E
 gilTHWxAZhkovT4PSsiy4d6F7Ijnpn62XX6crzheRlm3sfZwmdqcTVfMK
 HsO5/L1MJ9rQL031um5xQimiLJn4jUORPpBpSYd5lESkfuGX9nIAXweWC
 sZdo2S/u1EFeHs9pwRpCN03OhI8PypvaNcSwjGyamq+2xaSO3bCmhwzPe
 SP8n3qCMOv2MdPV5l8s+4bGOWZHJ6+stVIUtcnfDFsWwUaWrx6iyFPpLj Q==;
X-CSE-ConnectionGUID: 2vz1LKIwT5O3+lnS62KxYA==
X-CSE-MsgGUID: 0ZZUWoloRyaWzTkjk8fwmQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11629"; a="66663161"
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="66663161"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2025 22:35:50 -0800
X-CSE-ConnectionGUID: z0ycivasTLiXW1dgstqLdA==
X-CSE-MsgGUID: NzNIYnOFRSmXA4ix/vtzvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,240,1758610800"; d="scan'208";a="193806055"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orviesa009.jf.intel.com with ESMTP; 30 Nov 2025 22:35:05 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v7 01/15] drm/i915/display: Add identifiers for driver specific
 blocks
Date: Mon,  1 Dec 2025 12:16:41 +0530
Message-ID: <20251201064655.3579280-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251201064655.3579280-1-uma.shankar@intel.com>
References: <20251201064655.3579280-1-uma.shankar@intel.com>
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

Add macros to identify intel specific color blocks. It will help
in mapping drm_color_ops to intel color HW blocks

v2:- Prefix enums with INTEL_* (Jani, Suraj)
   - Remove unnecessary comments (Jani)
   - Commit message improvements (Suraj)

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display_limits.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display_limits.h b/drivers/gpu/drm/i915/display/intel_display_limits.h
index f0fa27e365ab..55fd574ba313 100644
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
-- 
2.50.1

