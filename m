Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AF53D5FCF1D
	for <lists+dri-devel@lfdr.de>; Thu, 13 Oct 2022 02:02:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3468610E11E;
	Thu, 13 Oct 2022 00:01:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEA7D10E2D4;
 Thu, 13 Oct 2022 00:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665619295; x=1697155295;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8oyV4gUd/Pxd9QPWj0zjyyFFb5WEsFxJw5HZb+RDvrs=;
 b=hHSDzq45R+3csessMua6SNhJ/r0jmL7m53cLU0H6+nL7tNITWR9OQJNT
 o5jDVSANX0qATvQAM+/QChgYr6r7DwSRDEnBIouCj5nGXp6oEzQy3xbds
 2rk7sd78CcnZ8xUwI+Pt4OnsSKFI3mlaZv9JxXJf4E/FAXpejeyzNen0t
 LdJ0lfW4L6TZ6p4tZI+MJGiAgnEwOsm9ELRssTRf2rDQvQIRhXC9N4RCd
 sBLU0KA7wzWytXJv1Maz5KM6/D3d6wGrdgVrnJ89hZA27ouXJfhXW1zGN
 88zlLb5yQKJk14YL4X39EcQZQLHP1oudbYiqZw/8jOz5fRtYqVRGHji4P Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="292263376"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="292263376"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:35 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10498"; a="802031117"
X-IronPort-AV: E=Sophos;i="5.95,180,1661842800"; d="scan'208";a="802031117"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Oct 2022 17:01:35 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 6/7] drm/i915/guc: define media GT GuC send regs
Date: Wed, 12 Oct 2022 17:03:31 -0700
Message-Id: <20221013000332.1738078-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
References: <20221013000332.1738078-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The media GT shares the G-unit with the root GT, so a second set of
communication registers is required for the media GuC.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc.c     | 14 ++++++++++----
 drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h |  2 ++
 2 files changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc.c b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
index 27b09ba1d295..b3600be61a9a 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc.c
@@ -156,7 +156,8 @@ static void gen11_disable_guc_interrupts(struct intel_guc *guc)
 
 void intel_guc_init_early(struct intel_guc *guc)
 {
-	struct drm_i915_private *i915 = guc_to_gt(guc)->i915;
+	struct intel_gt *gt = guc_to_gt(guc);
+	struct drm_i915_private *i915 = gt->i915;
 
 	intel_uc_fw_init_early(&guc->fw, INTEL_UC_FW_TYPE_GUC);
 	intel_guc_ct_init_early(&guc->ct);
@@ -168,12 +169,17 @@ void intel_guc_init_early(struct intel_guc *guc)
 	mutex_init(&guc->send_mutex);
 	spin_lock_init(&guc->irq_lock);
 	if (GRAPHICS_VER(i915) >= 11) {
-		guc->notify_reg = GEN11_GUC_HOST_INTERRUPT;
 		guc->interrupts.reset = gen11_reset_guc_interrupts;
 		guc->interrupts.enable = gen11_enable_guc_interrupts;
 		guc->interrupts.disable = gen11_disable_guc_interrupts;
-		guc->send_regs.base =
-			i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
+		if (gt->type == GT_MEDIA) {
+			guc->notify_reg = MEDIA_GUC_HOST_INTERRUPT;
+			guc->send_regs.base = i915_mmio_reg_offset(MEDIA_SOFT_SCRATCH(0));
+		} else {
+			guc->notify_reg = GEN11_GUC_HOST_INTERRUPT;
+			guc->send_regs.base = i915_mmio_reg_offset(GEN11_SOFT_SCRATCH(0));
+		}
+
 		guc->send_regs.count = GEN11_SOFT_SCRATCH_COUNT;
 
 	} else {
diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
index a7092f711e9c..9915de32e894 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_reg.h
@@ -36,6 +36,7 @@
 #define SOFT_SCRATCH_COUNT		16
 
 #define GEN11_SOFT_SCRATCH(n)		_MMIO(0x190240 + (n) * 4)
+#define MEDIA_SOFT_SCRATCH(n)		_MMIO(0x190310 + (n) * 4)
 #define GEN11_SOFT_SCRATCH_COUNT	4
 
 #define UOS_RSA_SCRATCH(i)		_MMIO(0xc200 + (i) * 4)
@@ -101,6 +102,7 @@
 #define GUC_SEND_INTERRUPT		_MMIO(0xc4c8)
 #define   GUC_SEND_TRIGGER		  (1<<0)
 #define GEN11_GUC_HOST_INTERRUPT	_MMIO(0x1901f0)
+#define MEDIA_GUC_HOST_INTERRUPT	_MMIO(0x190304)
 
 #define GEN12_GUC_SEM_INTR_ENABLES	_MMIO(0xc71c)
 #define   GUC_SEM_INTR_ROUTE_TO_GUC	BIT(31)
-- 
2.37.3

