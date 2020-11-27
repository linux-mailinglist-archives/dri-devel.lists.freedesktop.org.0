Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A01932C64D7
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:11:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F40156EC6E;
	Fri, 27 Nov 2020 12:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8CFD6EC8C;
 Fri, 27 Nov 2020 12:09:54 +0000 (UTC)
IronPort-SDR: b/goNJDbFGaROM5eR0J8jaDQLbENukquC40T3Am2lQHx9+2z08c0TXN3BN4tIbAVBaGoffbnbQ
 tMBSxsG4Cwuw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="172540733"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="172540733"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:54 -0800
IronPort-SDR: fAZuwdj7LnS569lp2gyu3uRoKJKXgbg5sAsRKDb5WDUqjuQm16kmCSY1cqKlkNqHZz3B9KuV3q
 bqI7lq7Vy8KA==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029130"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:09:52 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 080/162] drm/i915/lmem: Fail driver init if LMEM training
 failed
Date: Fri, 27 Nov 2020 12:05:56 +0000
Message-Id: <20201127120718.454037-81-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201127120718.454037-1-matthew.auld@intel.com>
References: <20201127120718.454037-1-matthew.auld@intel.com>
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
---
 drivers/gpu/drm/i915/i915_reg.h     |  3 +++
 drivers/gpu/drm/i915/intel_uncore.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index 5375b219cc3b..bf9ba1e361bb 100644
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
index 1c14a07eba7d..1630452e82b8 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1901,6 +1901,18 @@ int intel_uncore_init_mmio(struct intel_uncore *uncore)
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
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
