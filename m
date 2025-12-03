Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D68EAC9E404
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:40:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8675010E73C;
	Wed,  3 Dec 2025 08:40:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kQiJCJq7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1309910E733;
 Wed,  3 Dec 2025 08:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751224; x=1796287224;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zh9ygxrLb93dfRNrKpjFdFR7OPpEzsZr7QeIYIHSE9Y=;
 b=kQiJCJq7h457Um6aVkzjcv6y39W6T/ALY5vzXb2bWd5rJwN+N4OtqmgB
 9qXmyqZLFKd3rwGAkxP4sDargeSTTSxkUBkf4LdW4w2cdD5do8F8v269w
 8KGLliN3BLJETdhX71Unifyfk0W+gLNaertGipfZDQFwZ6BdJ92NXgsVz
 GHCx/e1xDFnEnvYz0frkkt+rWcGJr0wSQCP6zagAogiOTem1yogA4Gyk5
 lAAzAdQlGhXO8gCUhwwg+kLNKCJLmZJr5zBx8Wdnq4PDdkWpREYl3kKT8
 C6QM9UyU4xI4HCStcKwMnxJi0h+0r4+FoGfDlwQMyxLZUYXvGYjkexum9 Q==;
X-CSE-ConnectionGUID: Mk0H0OzWRimlUEnDByYDNA==
X-CSE-MsgGUID: ROi5RsAQTsemHVL+BFU2Pw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66812095"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66812095"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:40:24 -0800
X-CSE-ConnectionGUID: vy6aRQlAT4KqxYcaj/l5ew==
X-CSE-MsgGUID: 6DpD7lLoQ3y7FuTfhKjyBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945345"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:40:20 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 01/15] drm/i915/display: Add identifiers for driver specific
 blocks
Date: Wed,  3 Dec 2025 14:21:57 +0530
Message-ID: <20251203085211.3663374-2-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251203085211.3663374-1-uma.shankar@intel.com>
References: <20251203085211.3663374-1-uma.shankar@intel.com>
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

