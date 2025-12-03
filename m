Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8D8DC9E42B
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 09:40:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F6B910E74C;
	Wed,  3 Dec 2025 08:40:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IrbVtvUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9336010E73E;
 Wed,  3 Dec 2025 08:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764751251; x=1796287251;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OUTdsmcWH9SUMAIl1srrZz9ziKWRPpDdI06sB9PAJDk=;
 b=IrbVtvUJeiMfXowmvEufci0lxixbe2yEWyFX6Oyha1rdQgW+jzRwrsFl
 kojgTki5u9v+/zJIGAN6yAm2CiKbSf9DBy1DaYkMbS5RCNercTeMNY2/4
 hERgZS71d97opUii6T3yD0zBcgnHODZFkrEnMCzzogS7HBOXYWJsV1xJx
 o9sYPpbPZ5buH3n47Eh6KyUdpp9MupehyW5e/olNSCQ9dlgJ5ex68Re+J
 9mDOSxTyR4tHI9mxBeEN410EzR3oC5yoH+tvlZtf0WRI/rqb6QX8ssxnH
 Y6+V7+9Vf+AXOFvtLM/dRlehl5oYxlyl3w/GrN9YwanNEb27Q5W/ThNzq g==;
X-CSE-ConnectionGUID: iKnsjTQ6QSW6CL8Wz8Q77g==
X-CSE-MsgGUID: 7ja/5BKCR5K1jsWwjKsUQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="66458100"
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="66458100"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2025 00:40:50 -0800
X-CSE-ConnectionGUID: k+PcfGvRQju4eNM2W7ovCQ==
X-CSE-MsgGUID: Do8hNcWgR8ub+MXb8xA6OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,245,1758610800"; d="scan'208";a="217945412"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa002.fm.intel.com with ESMTP; 03 Dec 2025 00:40:43 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 swati2.sharma@intel.com, alex.hung@amd.com, jani.nikula@intel.com,
 suraj.kandpal@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v8 06/15] drm/i915/color: Preserve sign bit when int_bits is Zero
Date: Wed,  3 Dec 2025 14:22:02 +0530
Message-ID: <20251203085211.3663374-7-uma.shankar@intel.com>
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

When int_bits == 0, we lose the sign bit when we do the range check
and apply the mask.

Fix this by ensuring a minimum of one integer bit, which guarantees space
for the sign bit in fully fractional representations (e.g. S0.12)

Reviewed-by: Suraj Kandpal <suraj.kandpal@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index 33fe5c9b4663..81b87fed8878 100644
--- a/drivers/gpu/drm/i915/display/intel_color.c
+++ b/drivers/gpu/drm/i915/display/intel_color.c
@@ -613,6 +613,8 @@ static u16 ctm_to_twos_complement(u64 coeff, int int_bits, int frac_bits)
 	if (CTM_COEFF_NEGATIVE(coeff))
 		c = -c;
 
+	int_bits = max(int_bits, 1);
+
 	c = clamp(c, -(s64)BIT(int_bits + frac_bits - 1),
 		  (s64)(BIT(int_bits + frac_bits - 1) - 1));
 
-- 
2.50.1

