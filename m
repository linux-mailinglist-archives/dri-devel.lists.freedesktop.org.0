Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABC7612F99
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 06:11:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A296C10E0F8;
	Mon, 31 Oct 2022 05:11:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B11F10E0F8;
 Mon, 31 Oct 2022 05:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667193058; x=1698729058;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=J/RX3CIISXh4uRtVCwaoTBXy012CI0jVtOzkItQhTjM=;
 b=Sa3i8w8171WPSTpvs4ThBMmCfeYNN1wWGp3UKz1ftw04WvcJVUmJ3twe
 fCW0dBeMtB9EUnB9bTRO+jzAFzeZXHviCvx/NmlLmMNagtidb8Eao8+Lj
 0FdOlsfsQeVfyyjI5yR9IXHyvn/Oot+GL7JKFEdEVxaaRy+fSt+Xo/BaB
 VUOXEt7JJCC1inlZ7qSKour50qYyx55JuULPzc6VlHz56y0J+YVFGx9vl
 h65h4C18OMZPKhRhOdmMZVfYu4k8zj32kVMAOoeS/Oj2zkn1APqAqFilA
 2B/HrKb49Gr2JjJaJlNOMgywGO6Cwb6V+OZA0EWxwfC34PMlLMHmYXWzy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="395134224"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="395134224"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2022 22:10:57 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10516"; a="635922323"
X-IronPort-AV: E=Sophos;i="5.95,227,1661842800"; d="scan'208";a="635922323"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Oct 2022 22:10:56 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Don't use FIELD_PREP
Date: Sun, 30 Oct 2022 22:10:51 -0700
Message-Id: <20221031051051.553812-1-ashutosh.dixit@intel.com>
X-Mailer: git-send-email 2.38.0
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
Cc: Andi Shyti <andi.shyti@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>, llvm@lists.linux.dev,
 ndesaulniers@google.com, gwan-gyeong.mun@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FIELD_PREP and REG_FIELD_PREP have checks requiring a compile time constant
mask. When the mask comes in as the argument of a function these checks can
can fail depending on the compiler (gcc vs clang), optimization level,
etc. Use a simpler local version of FIELD_PREP which skips these
checks. The checks are not needed because the mask is formed using
REG_GENMASK (so is actually a compile time constant).

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7354
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9e97814930254..a3ec9a73a4e49 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -62,6 +62,12 @@ struct i915_hwmon {
 	int scl_shift_time;
 };
 
+/* FIELD_PREP and REG_FIELD_PREP require a compile time constant mask */
+static u32 hwm_field_prep(u32 mask, u32 val)
+{
+	return (val << __bf_shf(mask)) & mask;
+}
+
 static void
 hwm_locked_with_pm_intel_uncore_rmw(struct hwm_drvdata *ddat,
 				    i915_reg_t reg, u32 clear, u32 set)
@@ -112,7 +118,7 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
 
 	bits_to_clear = field_msk;
-	bits_to_set = FIELD_PREP(field_msk, nval);
+	bits_to_set = hwm_field_prep(field_msk, nval);
 
 	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
 					    bits_to_clear, bits_to_set);
-- 
2.38.0

