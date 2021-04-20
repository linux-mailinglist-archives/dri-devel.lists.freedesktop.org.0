Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB1143659D1
	for <lists+dri-devel@lfdr.de>; Tue, 20 Apr 2021 15:20:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBDB36E829;
	Tue, 20 Apr 2021 13:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 326026E826;
 Tue, 20 Apr 2021 13:19:51 +0000 (UTC)
IronPort-SDR: +h6Sjm31kyp2rI2l7/Vjr2ehz8NNWYeZ+PdE4yx1YPxl9LsGFBV0k/ZNn+WJLrdJOvkelFtCfw
 vHTEmNazzrcA==
X-IronPort-AV: E=McAfee;i="6200,9189,9960"; a="192315871"
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="192315871"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:19:50 -0700
IronPort-SDR: AAgr8EcXMuqYCU/oY8PNov7QP84xYcEbZEeFhIvz8uh4n1jDm1L3atgl6K0YlDxtKCiq4GbyKb
 Bw41D8aKREFg==
X-IronPort-AV: E=Sophos;i="5.82,237,1613462400"; d="scan'208";a="534484903"
Received: from adrianwa-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.252.9.139])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Apr 2021 06:19:49 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 5/5] drm/i915/lmem: Fail driver init if LMEM training failed
Date: Tue, 20 Apr 2021 14:18:42 +0100
Message-Id: <20210420131842.164163-5-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <20210420131842.164163-1-matthew.auld@intel.com>
References: <20210420131842.164163-1-matthew.auld@intel.com>
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
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
---
 drivers/gpu/drm/i915/i915_reg.h     |  3 +++
 drivers/gpu/drm/i915/intel_uncore.c | 12 ++++++++++++
 2 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_reg.h b/drivers/gpu/drm/i915/i915_reg.h
index ea20058bc13f..e7d78b10c226 100644
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
index ed5abe7be498..b4aaf8b7109f 100644
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
