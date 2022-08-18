Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9826F599156
	for <lists+dri-devel@lfdr.de>; Fri, 19 Aug 2022 01:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F7F10E5B5;
	Thu, 18 Aug 2022 23:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5147010E0F5;
 Thu, 18 Aug 2022 23:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660866151; x=1692402151;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=PoL3yK0ImehlOTU2l+wQfLBeHG0RQjyduAp5rYKn0b0=;
 b=T4AEgpRjmUf0g2nE1nGbQ0zZ/EiXBMbNJcm6Vh9pS1HTK53y7BgTUWr6
 N2CMXW+aZa5L133F6VN1/jQSTEjCNp6AN41sS5neHw04qfmpZ797QcQFG
 DPn0Q/tYx3uEzqWxbwuyj2KZ9tMBgtWqu14/a4BPYOYQCHQSO8fuWovOI
 GtGGmINEftMevYYcAAxaD9krr36a5cdu68z7O5JTCVfzaY1xvaf2i7K0w
 iHFByYHFPkstyPgKMVmKqaH3IAtpliMhYXVdumO9x2PCMkidejMmXHFoB
 lNPu2blI99jSsWoKOk5UfxZyyao4H5waxS6J/+N2+rPG6/wZYAjH2SN+4 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10443"; a="275938515"
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="275938515"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
X-IronPort-AV: E=Sophos;i="5.93,247,1654585200"; d="scan'208";a="783953287"
Received: from invictus.jf.intel.com ([10.165.21.205])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Aug 2022 16:42:28 -0700
From: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 04/21] drm/i915/mtl: Don't mask off CCS according to DSS
 fusing
Date: Thu, 18 Aug 2022 16:41:45 -0700
Message-Id: <20220818234202.451742-5-radhakrishna.sripada@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
References: <20220818234202.451742-1-radhakrishna.sripada@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Matt Roper <matthew.d.roper@intel.com>

Unlike the Xe_HP platforms, MTL only has a single CCS engine; the
quad-based engine masking logic does not apply to this platform (or
presumably any future platforms that only have 0 or 1 CCS).

Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Signed-off-by: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index 37fa813af766..17e7f20bbb48 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -672,7 +672,7 @@ static void engine_mask_apply_compute_fuses(struct intel_gt *gt)
 	unsigned long ccs_mask;
 	unsigned int i;
 
-	if (GRAPHICS_VER_FULL(i915) < IP_VER(12, 50))
+	if (hweight32(CCS_MASK(gt)) <= 1)
 		return;
 
 	ccs_mask = intel_slicemask_from_xehp_dssmask(info->sseu.compute_subslice_mask,
-- 
2.25.1

