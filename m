Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4569435BF8C
	for <lists+dri-devel@lfdr.de>; Mon, 12 Apr 2021 11:09:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2DBE6E2B8;
	Mon, 12 Apr 2021 09:09:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B0696E2B6;
 Mon, 12 Apr 2021 09:09:31 +0000 (UTC)
IronPort-SDR: 6FKiHhvjyI7gfX4PjDdrZ42cPIaf0t2RFzvQAa9bsfdSag13UQluu2SL3iy8TvaKQDm5vJfILM
 5CoHF1BXZp9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9951"; a="193709720"
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="193709720"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:31 -0700
IronPort-SDR: CShGZG5ogNK1Sa6MqcgpYwksAEo9/Lf15zpCRSU6MKCnGgXgHvaUJad1noPjczVTL5+1kYTBR4
 VQLkwaWJze/g==
X-IronPort-AV: E=Sophos;i="5.82,216,1613462400"; d="scan'208";a="423712665"
Received: from tarynrox-mobl1.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.5.30])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2021 02:09:29 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 09/19] drm/i915/lmem: Fail driver init if LMEM training failed
Date: Mon, 12 Apr 2021 10:05:16 +0100
Message-Id: <20210412090526.30547-10-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210412090526.30547-1-matthew.auld@intel.com>
References: <20210412090526.30547-1-matthew.auld@intel.com>
MIME-Version: 1.0
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
Cc: Caz Yokoyama <Caz.Yokoyama@intel.com>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Boot firmware performs memory training and health assessment during
startup.  If the memory training fails, the firmware will consider the
GPU unusable and will instruct the punit to keep the GT powered down.
If this happens, our driver will be unable to communicate with the GT
(all GT registers will read back as 0, forcewake requests will timeout,
etc.) so we should abort driver initialization if this happens.  We can
confirm that LMEM was initialized successfully via sgunit register
GU_CNTL.

Bspec: 53111
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Cc: Caz Yokoyama <Caz.Yokoyama@intel.com>
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h     |  3 +++
 drivers/gpu/drm/i915/intel_uncore.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 4108f2a7ebfa..da73dc939e58 100644
--- a/drivers/gpu/drm/i915/i915_reg.h
+++ b/drivers/gpu/drm/i915/i915_reg.h
@@ -487,6 +487,9 @@ static inline bool i915_mmio_reg_valid(i915_reg_t reg)
 #define GAB_CTL				_MMIO(0x24000)
 #define   GAB_CTL_CONT_AFTER_PAGEFAULT	(1 << 8)
 
+#define GU_CNTL				_MMIO(0x101010)
+#define   LMEM_INIT			REG_BIT(7)
+
 #define GEN6_STOLEN_RESERVED		_MMIO(0x1082C0)
 #define GEN6_STOLEN_RESERVED_ADDR_MASK	(0xFFF << 20)
 #define GEN7_STOLEN_RESERVED_ADDR_MASK	(0x3FFF << 18)
diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index 661b50191f2b..4d0605757428 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1917,6 +1917,18 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
 	if (ret)
 		return ret;
 
+	/*
+	 * The boot firmware initializes local memory and assesses its health.
+	 * If memory training fails, the punit will have been instructed to
+	 * keep the GT powered down; we won't be able to communicate with it
+	 * and we should not continue with driver initialization.
+	 */
+	if (IS_DGFX(i915) &&
+	    !(__raw_uncore_read32(uncore, GU_CNTL) & LMEM_INIT)) {
+		drm_err(&i915->drm, "LMEM not initialized by firmware\n");
+		return -ENODEV;
+	}
+
 	if (INTEL_GEN(i915) > 5 && !intel_vgpu_active(i915))
 		uncore->flags |= UNCORE_HAS_FORCEWAKE;
 
-- 
2.26.3

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
