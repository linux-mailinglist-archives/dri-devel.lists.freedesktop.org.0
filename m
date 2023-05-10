Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7FC6FE413
	for <lists+dri-devel@lfdr.de>; Wed, 10 May 2023 20:36:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56A7710E063;
	Wed, 10 May 2023 18:36:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21A5710E063;
 Wed, 10 May 2023 18:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683743772; x=1715279772;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1Vzc4TnF6i2+1Soe9M7OcZYLpblf1RuPuI3eR5Ov1Bs=;
 b=jdkfQq70P3KFu1UCRaI2rzQgGRM9AOJmj+xkwkh4moa3rxWVJeZeq4rR
 uB3yEo4CYx2LAhy5J1u8hUQGwpaKaF7HoDxzysP/gW31PjADpdNPNs509
 Bdg+6F/ESW6mejP8JjPVt06j8bWcBnHNJy+4PcOBcx5VNS9NkmHjJO+6z
 0aat0iCJBVuFkNzh63B3wcEp5Hthg4/wTkyaQJQiPpevQtZlZIpolp4fn
 1ps2Rh5cFkEyJ7CMcq6hLsLEHqSKuEw3/8gERbnHGkUo5ZV1sxDwMcS9T
 GwB+IAioLvbAvKBuWKsSLaB48nGuYQhd6xfsjTnqVy3EU/DX6yMdbgr6a A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="352486649"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="352486649"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 11:36:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10706"; a="823633618"
X-IronPort-AV: E=Sophos;i="5.99,265,1677571200"; d="scan'208";a="823633618"
Received: from orsosgc001.jf.intel.com ([10.165.21.138])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2023 11:36:11 -0700
From: Ashutosh Dixit <ashutosh.dixit@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwmon: Silence UBSAN uninitialized bool variable
 warning
Date: Wed, 10 May 2023 11:36:06 -0700
Message-Id: <20230510183606.2480777-1-ashutosh.dixit@intel.com>
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
Cc: dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Loading i915 on UBSAN enabled kernels (CONFIG_UBSAN/CONFIG_UBSAN_BOOL)
causes the following warning:

  UBSAN: invalid-load in drivers/gpu/drm/i915/gt/uc/intel_uc.c:558:2
  load of value 255 is not a valid value for type '_Bool'
  Call Trace:
   dump_stack_lvl+0x57/0x7d
   ubsan_epilogue+0x5/0x40
   __ubsan_handle_load_invalid_value.cold+0x43/0x48
   __uc_init_hw+0x76a/0x903 [i915]
   ...
   i915_driver_probe+0xfb1/0x1eb0 [i915]
   i915_pci_probe+0xbe/0x2d0 [i915]

The warning happens because during probe i915_hwmon is still not available
which results in the output boolean variable *old remaining
uninitialized. Silence the warning by initializing the variable to an
arbitrary value.

Signed-off-by: Ashutosh Dixit <ashutosh.dixit@intel.com>
---
 drivers/gpu/drm/i915/i915_hwmon.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_hwmon.c b/drivers/gpu/drm/i915/i915_hwmon.c
index a3bdd9f68a458..685663861bc0b 100644
--- a/drivers/gpu/drm/i915/i915_hwmon.c
+++ b/drivers/gpu/drm/i915/i915_hwmon.c
@@ -502,8 +502,11 @@ void i915_hwmon_power_max_disable(struct drm_i915_private *i915, bool *old)
 	struct i915_hwmon *hwmon = i915->hwmon;
 	u32 r;
 
-	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit))
+	if (!hwmon || !i915_mmio_reg_valid(hwmon->rg.pkg_rapl_limit)) {
+		/* Fix uninitialized bool variable warning */
+		*old = false;
 		return;
+	}
 
 	mutex_lock(&hwmon->hwmon_lock);
 
-- 
2.38.0

