Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76CCC613C21
	for <lists+dri-devel@lfdr.de>; Mon, 31 Oct 2022 18:27:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BCE2B10E033;
	Mon, 31 Oct 2022 17:27:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68ED610E033;
 Mon, 31 Oct 2022 17:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667237234; x=1698773234;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=siXkABv8Hn+s95xOdhQdHSC+bKc3rcc2PtOfhvL/u44=;
 b=TP7/btKqG5LFwHrj2ztQjP8/HzvgvmjxhqRg2Oug98FxcwqtYBeHdsJs
 W6cVSjxvYwmryFETvCwo6iZMCseQsTEKCQMqCATNdwD1PBEQoJgA2Fpb4
 jR5+rz4tBbNoD30GqoInw1i7Ea57nGHA15aZTfjSf75Gdpkp6mZevtySk
 bQdDKxtBgjfuRl1FVSuPApFP72JxGYnSKlb8uFyKVnKuBruSsu4rCgIoU
 2V0+Cd0tUqDdPLEFeesD/5Sf3CKFMg7ZMK9wv8nHO/3vKAJp9kMg18WSW
 3LZnuJnSdg4vhwdbl2GwHjryIDHHIcAzOPt2ktegJ77aJRFJrhYa1nuTb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="306573564"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="306573564"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 10:26:59 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10517"; a="702595819"
X-IronPort-AV: E=Sophos;i="5.95,228,1661842800"; d="scan'208";a="702595819"
Received: from orsosgc001.jf.intel.com (HELO unerlige-ril.jf.intel.com)
 ([10.165.21.138])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Oct 2022 10:26:59 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Don't use FIELD_PREP
Date: Mon, 31 Oct 2022 10:26:55 -0700
Message-Id: <20221031172655.606165-1-ashutosh.dixit@intel.com>
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
Cc: Andi Shyti <andi.shyti@intel.com>, llvm@lists.linux.dev,
 ndesaulniers@google.com, gwan-gyeong.mun@intel.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

FIELD_PREP and REG_FIELD_PREP have checks requiring a compile time constant
mask. When the mask comes in as the argument of a function these checks can
can fail depending on the compiler (gcc vs clang), optimization level,
etc. Use a simpler version of FIELD_PREP which skips these checks. The
checks are not needed because the mask is formed using REG_GENMASK (so is
actually a compile time constant).

v2: Split REG_FIELD_PREP into a macro with checks and one without and use
    the one without checks in i915_hwmon.c (Gwan-gyeong Mun)

Bug: https://gitlab.freedesktop.org/drm/intel/-/issues/7354
Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c    |  2 +-
 drivers/gpu/drm/i915/i915_reg_defs.h | 17 +++++++++++------
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index 9e97814930254..ae435b035229a 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -112,7 +112,7 @@ hwm_field_scale_and_write(struct hwm_drvdata *ddat, i915_reg_t rgadr,
 	nval = DIV_ROUND_CLOSEST_ULL((u64)lval << nshift, scale_factor);
 
 	bits_to_clear = field_msk;
-	bits_to_set = FIELD_PREP(field_msk, nval);
+	bits_to_set = __REG_FIELD_PREP(field_msk, nval);
 
 	hwm_locked_with_pm_intel_uncore_rmw(ddat, rgadr,
 					    bits_to_clear, bits_to_set);
diff --git a/drivers/gpu/drm/i915/i915_reg_defs.h b/drivers/gpu/drm/i915/i915_reg_defs.h
index f1859046a9c48..dddacc8d48928 100644
--- a/drivers/gpu/drm/i915/i915_reg_defs.h
+++ b/drivers/gpu/drm/i915/i915_reg_defs.h
@@ -67,12 +67,17 @@
  *
  * @return: @__val masked and shifted into the field defined by @__mask.
  */
-#define REG_FIELD_PREP(__mask, __val)						\
-	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask)) +	\
-	       BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) +		\
-	       BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) +		\
-	       BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
-	       BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0))))
+#define __REG_FIELD_PREP_CHK(__mask, __val) \
+	(BUILD_BUG_ON_ZERO(!__is_constexpr(__mask)) + \
+	 BUILD_BUG_ON_ZERO((__mask) == 0 || (__mask) > U32_MAX) + \
+	 BUILD_BUG_ON_ZERO(!IS_POWER_OF_2((__mask) + (1ULL << __bf_shf(__mask)))) + \
+	 BUILD_BUG_ON_ZERO(__builtin_choose_expr(__is_constexpr(__val), (~((__mask) >> __bf_shf(__mask)) & (__val)), 0)))
+
+#define __REG_FIELD_PREP(__mask, __val) \
+	((u32)((((typeof(__mask))(__val) << __bf_shf(__mask)) & (__mask))))
+
+#define REG_FIELD_PREP(__mask, __val) \
+	(__REG_FIELD_PREP(__mask, __val) + __REG_FIELD_PREP_CHK(__mask, __val))
 
 /**
  * REG_FIELD_GET() - Extract a u32 bitfield value
-- 
2.38.0

