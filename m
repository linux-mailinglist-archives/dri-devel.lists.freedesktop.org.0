Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8107076567C
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 16:55:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F222710E5A8;
	Thu, 27 Jul 2023 14:55:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (unknown [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C07B410E5A1;
 Thu, 27 Jul 2023 14:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1690469720; x=1722005720;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jhtbIKmonzY9f7pTH5sQ3hNsH+9Lyi7X9at2f7882PY=;
 b=fBy0cfahB7aAmMvN6yJMpK8ipezfq4zdVxPRjBV16e3tNwl7CR/vfV6O
 jmiaKjl6XTsHegoIDsnaRh5RytAglCNhUsumoTusakmfsHZTSYTBY/ABj
 JmEeDuNbnYeXUeYecSzWMWVO9F5bbxuNYd+eMOdDNaYvflqW/gvDt0WH7
 wVE0aw9bUlq3Erna66kPKyTT5MaS9SMcuzxec832ftnmi77P6zpU+A+Cq
 LWFzoW8ZpyOPzm47sIg9uRRBmKMa7gnmyvH4/6ykFmEmIxQVY1as6fjw4
 DUhT7LA5GU0CYAULsRyb6sJa15cfgOA2TI2TmRvmK6NQQ7AjWok4kMz8r g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10784"; a="399268385"
X-IronPort-AV: E=Sophos;i="6.01,235,1684825200"; d="scan'208";a="399268385"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.01,202,1684825200"; d="scan'208";a="870433716"
Received: from jlenehan-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.228.208])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jul 2023 07:55:19 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 2/8] drm/i915: Split PTE encode between Gen12 and Meteorlake
Date: Thu, 27 Jul 2023 15:54:58 +0100
Message-Id: <20230727145504.1919316-3-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
References: <20230727145504.1919316-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

No need to run extra instructions which will never trigger on platforms
before Meteorlake.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index c8568e5d1147..862ac1d2de25 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -63,6 +63,30 @@ static u64 gen12_pte_encode(dma_addr_t addr,
 {
 	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
 
+	if (unlikely(flags & PTE_READ_ONLY))
+		pte &= ~GEN8_PAGE_RW;
+
+	if (flags & PTE_LM)
+		pte |= GEN12_PPGTT_PTE_LM;
+
+	if (pat_index & BIT(0))
+		pte |= GEN12_PPGTT_PTE_PAT0;
+
+	if (pat_index & BIT(1))
+		pte |= GEN12_PPGTT_PTE_PAT1;
+
+	if (pat_index & BIT(2))
+		pte |= GEN12_PPGTT_PTE_PAT2;
+
+	return pte;
+}
+
+static u64 mtl_pte_encode(dma_addr_t addr,
+			  unsigned int pat_index,
+			  u32 flags)
+{
+	gen8_pte_t pte = addr | GEN8_PAGE_PRESENT | GEN8_PAGE_RW;
+
 	if (unlikely(flags & PTE_READ_ONLY))
 		pte &= ~GEN8_PAGE_RW;
 
@@ -995,6 +1019,8 @@ struct i915_ppgtt *gen8_ppgtt_create(struct intel_gt *gt,
 	 */
 	ppgtt->vm.alloc_scratch_dma = alloc_pt_dma;
 
+	if (GRAPHICS_VER_FULL(gt->i915) >= IP_VER(12, 70))
+		ppgtt->vm.pte_encode = mtl_pte_encode;
 	if (GRAPHICS_VER(gt->i915) >= 12)
 		ppgtt->vm.pte_encode = gen12_pte_encode;
 	else
-- 
2.39.2

