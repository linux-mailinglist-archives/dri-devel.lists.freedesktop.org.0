Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B136B0D09
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:40:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20B9710E61B;
	Wed,  8 Mar 2023 15:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C30A710E610;
 Wed,  8 Mar 2023 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678289988; x=1709825988;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=UFsc11qcv0An3YTgsx2jUXx1nEcHzBdMgxW2w6BVW+0=;
 b=OKBocwngBdvTZveqUmBsJhRaFQizq1w0db24LoKVCUE/+65660Omtk/q
 FkVcrfl5GfY5z1Y+tLRpWuDAb7Lqp3A86w1Pxr+Fs2NDbJvcB4fJm1NV7
 ByZK7dQPoCGl1P8JGe7jXswTf1gaJnXCnyiiQQsEt0vauaN++QVT3CM6J
 6wSV4/Zz5sjA9R0qMJJm7J7xXr2dAruCCx5WA+xuIat+3LJeSXw16RoDW
 OjmOZykulnQPej95C2qwZdvs/QCGb5nE2TT6IOw3US9uoh3Pn6xWIcKHF
 inmLJfF5Gb8oAxKHM+6A5JkNwedi6jueuKEgE7Rci+9AJ/Qo9sGsQ2Cet Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337703538"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337703538"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787160246"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787160246"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:44 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 08 Mar 2023 16:39:03 +0100
Subject: [PATCH v5 1/4] drm/i915/gt: make nop_clear_range public
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-guard_error_capture-v5-1-6d1410d13540@intel.com>
References: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
In-Reply-To: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
X-Mailer: b4 0.11.1
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
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Andi Shyti <andi.shyti@linux.intel.com>,
 Chris Wilson <chris.p.wilson@linux.intel.com>,
 Nirmoy Das <nirmoy.das@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Function nop_clear_range can be used instead of local implementations.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c | 3 +--
 drivers/gpu/drm/i915/gt/intel_gtt.h  | 2 ++
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 842e69c7b21e49..b925da42c7cfc4 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -345,8 +345,7 @@ static void gen6_ggtt_insert_entries(struct i915_address_space *vm,
 	ggtt->invalidate(ggtt);
 }
 
-static void nop_clear_range(struct i915_address_space *vm,
-			    u64 start, u64 length)
+void nop_clear_range(struct i915_address_space *vm, u64 start, u64 length)
 {
 }
 
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 5a775310d3fcb5..c15a4892e9f45d 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -672,4 +672,6 @@ static inline struct sgt_dma {
 	return (struct sgt_dma){ sg, addr, addr + sg_dma_len(sg) };
 }
 
+void nop_clear_range(struct i915_address_space *vm, u64 start, u64 length);
+
 #endif

-- 
2.34.1
