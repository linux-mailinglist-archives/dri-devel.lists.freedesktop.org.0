Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68B682C6541
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 13:13:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EB8C6ECF9;
	Fri, 27 Nov 2020 12:11:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 749826ECE5;
 Fri, 27 Nov 2020 12:11:18 +0000 (UTC)
IronPort-SDR: 9BNwurLUZ0sYG+w554n1NfCm6W0NJwAsn0g0zuPqw0+VcGjJmie9GMXAE8XpMq0wD8yrsQE6Jh
 nU6Uy4ZA8Zsw==
X-IronPort-AV: E=McAfee;i="6000,8403,9817"; a="257092872"
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="257092872"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:18 -0800
IronPort-SDR: nSNhSao8oTXZQgwTjAq1Mfz72AyqP4kyprtnZploumUCg3lAKHUbcQ27JJ+2FhjudqH0VCNdA/
 34d0SicdK34Q==
X-IronPort-AV: E=Sophos;i="5.78,374,1599548400"; d="scan'208";a="548029731"
Received: from mjgleeso-mobl.ger.corp.intel.com (HELO
 mwauld-desk1.ger.corp.intel.com) ([10.251.85.2])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Nov 2020 04:11:16 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [RFC PATCH 118/162] drm/i915/dg1: Reserve first 1MB of local memory
Date: Fri, 27 Nov 2020 12:06:34 +0000
Message-Id: <20201127120718.454037-119-matthew.auld@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Imre Deak <imre.deak@intel.com>

On DG1 A0/B0 steppings the first 1MB of local memory must be reserved.
One reason for this is that the 0xA0000-0xB0000 range is not accessible
by the display, probably since this region is redirected to another
memory location for legacy VGA compatibility.

BSpec: 50586
Testcase: igt/kms_big_fb/linear-64bpp-rotate-0
Signed-off-by: Imre Deak <imre.deak@intel.com>
---
 drivers/gpu/drm/i915/intel_region_lmem.c | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/gpu/drm/i915/intel_region_lmem.c b/drivers/gpu/drm/i915/intel_region_lmem.c
index 939cf0d195a5..eafef7034680 100644
--- a/drivers/gpu/drm/i915/intel_region_lmem.c
+++ b/drivers/gpu/drm/i915/intel_region_lmem.c
@@ -137,6 +137,48 @@ intel_setup_fake_lmem(struct drm_i915_private *i915)
 	return mem;
 }
 
+static void get_legacy_lowmem_region(struct intel_uncore *uncore,
+				     u64 *start, u32 *size)
+{
+	*start = 0;
+	*size = 0;
+
+	if (!IS_DG1_REVID(uncore->i915, DG1_REVID_A0, DG1_REVID_B0))
+		return;
+
+	*size = SZ_1M;
+
+	DRM_DEBUG_DRIVER("LMEM: reserved legacy low-memory [0x%llx-0x%llx]\n",
+			 *start, *start + *size);
+}
+
+static int reserve_lowmem_region(struct intel_uncore *uncore,
+				 struct intel_memory_region *mem)
+{
+	u64 reserve_start;
+	u64 reserve_end;
+	u64 region_start;
+	u32 region_size;
+	int ret;
+
+	get_legacy_lowmem_region(uncore, &region_start, &region_size);
+	reserve_start = region_start;
+	reserve_end = region_start + region_size;
+
+	if (!reserve_end)
+		return 0;
+
+	DRM_INFO("LMEM: reserving low-memory region [0x%llx-0x%llx]\n",
+		 reserve_start, reserve_end);
+	ret = i915_buddy_alloc_range(&mem->mm, &mem->reserved,
+				     reserve_start,
+				     reserve_end - reserve_start);
+	if (ret)
+		DRM_ERROR("LMEM: reserving low memory region failed\n");
+
+	return ret;
+}
+
 static struct intel_memory_region *
 setup_lmem(struct drm_i915_private *dev_priv)
 {
@@ -160,6 +202,16 @@ setup_lmem(struct drm_i915_private *dev_priv)
 					 I915_GTT_PAGE_SIZE_4K,
 					 io_start,
 					 &intel_region_lmem_ops);
+	if (!IS_ERR(mem)) {
+		int err;
+
+		err = reserve_lowmem_region(uncore, mem);
+		if (err) {
+			intel_memory_region_put(mem);
+			return ERR_PTR(err);
+		}
+	}
+
 	if (!IS_ERR(mem)) {
 		DRM_INFO("Intel graphics LMEM: %pR\n", &mem->region);
 		DRM_INFO("Intel graphics LMEM IO start: %llx\n",
-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
