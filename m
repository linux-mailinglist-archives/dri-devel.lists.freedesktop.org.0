Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED1E74B13E
	for <lists+dri-devel@lfdr.de>; Fri,  7 Jul 2023 14:46:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 530B610E57F;
	Fri,  7 Jul 2023 12:46:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED53010E57C;
 Fri,  7 Jul 2023 12:46:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688734012; x=1720270012;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=TCz6GCVxOFpSFnj+T0/SlnRiILlxjhb/UDVkMVt/Syc=;
 b=CY6KywKfK4V1ScsnwXkWM9B4KTp23pR1locEO4jhaM0PSTj3vkf2fYld
 IuD6BMzKhABGrLiA2GJSQZN8lSbAHF9JIt5yhAH5z6hmtjISl27xp69XO
 GkSwTxT/tjGcCZ6RuQzX1bDFTmFJSrBSj1xyns84o+wboBaLnYFRH8RcL
 HrUskVK3Bcv9+SL+3ODQWwfuIRp8dXfGpqPlwnKjFCIuWrXyMVAYFCkRz
 YAVT1/CODV5f7L3KF15ShIHSmnx2FX6cWCuGDnapxE/KMoxOyqe0MLLLr
 QMoEDW4lqE7qEb4spsx/WXXbnn8cJFyhw/sX3KZozaVWphVzl0Uwkisjr Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="450236088"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="450236088"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 05:46:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="755174910"
X-IronPort-AV: E=Sophos;i="6.01,187,1684825200"; d="scan'208";a="755174910"
Received: from gjmurphy-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.202.50])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jul 2023 05:46:49 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915: Remove dead code from gen8_pte_encode
Date: Fri,  7 Jul 2023 13:46:44 +0100
Message-Id: <20230707124644.3965281-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
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
Cc: Matt Roper <matthew.d.roper@intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Fei Yang <fei.yang@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Commit 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
added a dedicated gen12_pte_encode but forgot to remove the Gen12 specific
bit from gen8_pte_encode.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Fixes: 9275277d5324 ("drm/i915: use pat_index instead of cache_level")
Cc: Fei Yang <fei.yang@intel.com>
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/gen8_ppgtt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
index f948d33e5ec5..c8568e5d1147 100644
--- a/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
+++ b/drivers/gpu/drm/i915/gt/gen8_ppgtt.c
@@ -37,9 +37,6 @@ static u64 gen8_pte_encode(dma_addr_t addr,
 	if (unlikely(flags & PTE_READ_ONLY))
 		pte &= ~GEN8_PAGE_RW;
 
-	if (flags & PTE_LM)
-		pte |= GEN12_PPGTT_PTE_LM;
-
 	/*
 	 * For pre-gen12 platforms pat_index is the same as enum
 	 * i915_cache_level, so the switch-case here is still valid.
-- 
2.39.2

