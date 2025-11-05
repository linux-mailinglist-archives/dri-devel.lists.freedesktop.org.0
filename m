Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D26BC359B9
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 13:22:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D02ED10E729;
	Wed,  5 Nov 2025 12:22:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="VqyBvSrX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12B0810E723;
 Wed,  5 Nov 2025 12:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762345374; x=1793881374;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=q/Pqen8C/RbXIRAfOIuqqKLA6HwuAxYmOfmzmTcVXSY=;
 b=VqyBvSrXbVoCTzqFAqRmMskVxRXKEuncUWizVkoVJyWXEf2BQsJOZffl
 t5wNx8WhhSJfrnPQHfDr9JjdIRqLpjiMXULcxr8GXdX6eQGG+e9SeZdc7
 EYq9Nf9Eqmgb1yiIkyK36MvdKsA22I9KtX4JIuVuNrzAJ+FEdIDjYoWlB
 Hx/4D9rNzy08dSIcJhvsbyx56KZBriEqs8FrlAndXD8+nkGuVzxAMHl6B
 LjOsjSAVMeulEIQUPV0L5Q3gMhOi/1LjHOvCrYywf8/7h9TArTNCj85cU
 lydODniwfko4uT8OwZ/MtbS8lf//oCeoP38/uHGgu2EaHnarhxXhs1CZK Q==;
X-CSE-ConnectionGUID: P27iwr+qRmCc96+VFi6LoA==
X-CSE-MsgGUID: BPnbbOwRTQGlDClhyYlIUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="68317532"
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="68317532"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2025 04:22:54 -0800
X-CSE-ConnectionGUID: gZzN+wQdQryz8sHqL2LfJw==
X-CSE-MsgGUID: hHhIT9xlSs2m033/BsZtKw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,281,1754982000"; d="scan'208";a="187740256"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by fmviesa008.fm.intel.com with ESMTP; 05 Nov 2025 04:22:49 -0800
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: chaitanya.kumar.borah@intel.com, ville.syrjala@linux.intel.com,
 pekka.paalanen@collabora.com, contact@emersion.fr, harry.wentland@amd.com,
 mwen@igalia.com, jadahl@redhat.com, sebastian.wick@redhat.com,
 shashank.sharma@amd.com, swati2.sharma@intel.com, alex.hung@amd.com,
 jani.nikula@intel.com, Uma Shankar <uma.shankar@intel.com>
Subject: [v6 07/16] drm/i915/color: Preserve sign bit when int_bits is Zero
Date: Wed,  5 Nov 2025 18:04:03 +0530
Message-ID: <20251105123413.2671075-8-uma.shankar@intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251105123413.2671075-1-uma.shankar@intel.com>
References: <20251105123413.2671075-1-uma.shankar@intel.com>
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

Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_color.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_color.c b/drivers/gpu/drm/i915/display/intel_color.c
index a45d348c9851..aef25cb63457 100644
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

