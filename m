Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2905BA1EA
	for <lists+dri-devel@lfdr.de>; Thu, 15 Sep 2022 22:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CCCA10EBD8;
	Thu, 15 Sep 2022 20:40:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70E8610E2A7;
 Thu, 15 Sep 2022 20:39:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663274381; x=1694810381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=a2okYYf3N22zxuVaxoVucbTv60Zi/euA4v1EkwXBHVM=;
 b=ek8EbVoJG7MMy8J3RxL60mSweoFjC9YmhDTmH743OOAfchCnsmH0F2l4
 leL1NKUbLF60oEqMXlr1a8lrp88gkVKTbrauQKa1YFGfm4MVWabyYSq4s
 wax4Lg2gDosI5/CR0bUVZl2j74SuCP4Q6kuOAjuMsTYCHro6KRBJ9Gfjy
 0e8HPoIhPY1LT9gB4Xw0kWLsNeXpx2mgJF+0eqTVJJWqmsx107dR+LF/M
 REmod10HNiIWP0KPp4fktEsJCr1EujIjWSxSvjYmPEZAMkOXE/5RhYp6I
 oVAo40I8IGGJOyMKgMD3xTWvlcPrU6OsLgr/8od0U2i8an6brScLOWTfy Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10471"; a="300193624"
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="300193624"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
X-IronPort-AV: E=Sophos;i="5.93,319,1654585200"; d="scan'208";a="647991378"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.143])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2022 13:39:40 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org, Lucas De Marchi <lucas.demarchi@intel.com>
Subject: [PATCH v1 2/4] drm/i915: Add missing mask when reading GEN12_DSMBASE
Date: Thu, 15 Sep 2022 13:39:06 -0700
Message-Id: <20220915-stolen-v1-2-117c5f295bb2@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
References: <20220915-stolen-v1-0-117c5f295bb2@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.10.0-dev-bbe61
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
Cc: tejas.upadhyay@intel.com, aravind.iddamsetty@intel.com,
 dri-devel@lists.freedesktop.org, radhakrishna.sripada@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DSMBASE register is defined so BDSM bitfield contains the bits 63 to 20
of the base address of stolen. For the supported platforms bits 0-19 are
zero but that may not be true in future. Add the missing mask.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
index 42f4769bb4ac..c34065fe2ecc 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_stolen.c
@@ -814,7 +814,7 @@ i915_gem_stolen_lmem_setup(struct drm_i915_private *i915, u16 type,
 		return ERR_PTR(-ENXIO);
 
 	/* Use DSM base address instead for stolen memory */
-	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE);
+	dsm_base = intel_uncore_read64(uncore, GEN12_DSMBASE) & GEN12_BDSM_MASK;
 	if (IS_DG1(uncore->i915)) {
 		lmem_size = pci_resource_len(pdev, GEN12_LMEM_BAR);
 		if (WARN_ON(lmem_size < dsm_base))
diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 1a9bd829fc7e..0301874c76ba 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -7953,6 +7953,7 @@ enum skl_power_gate {
 
 #define GEN12_GSMBASE			_MMIO(0x108100)
 #define GEN12_DSMBASE			_MMIO(0x1080C0)
+#define   GEN12_BDSM_MASK		GENMASK(63, 20)
 
 #define XEHP_CLOCK_GATE_DIS		_MMIO(0x101014)
 #define   SGSI_SIDECLK_DIS		REG_BIT(17)

-- 
b4 0.10.0-dev-bbe61
