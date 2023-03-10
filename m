Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C3C276B3A45
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:24:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EA7010E999;
	Fri, 10 Mar 2023 09:24:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7654510E99E;
 Fri, 10 Mar 2023 09:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678440246; x=1709976246;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=R0AdssSd3MB0iqXVxNOU/ybf/QikA5OF/cilaWGDpiE=;
 b=NOOZitZptuOnfV8F29tlt81r5EOEakCc+IfinoUSwF+KNkniV/bticyx
 BwJx8vrXthpDjhC9ndNgE5jgUup91xIb5exXLW1ZDrs+H0OVBOC5bbURF
 S3T1X8Ukw0zstLMwfeoyVK14vj8zHS5LcKMQzv3ssfxr55OqyPqT3oG9H
 yNAR6TJ3aaLwWqv33/8QteQWghoZMVFLvx4l4sQj7F7+SvllFgX3G78U/
 GctM+5dyOiG7Jtd6lM2wp1u3sRaOItNXyntF1t7gaxg8JJhXhw2e6TEye
 6IaOExhRMLc6Etv5Ko01lzJhzm1VcBZQUIhsgQDKTO7Mm0maN33wkygCp g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334164681"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="334164681"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:24:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801513244"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="801513244"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:24:03 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Fri, 10 Mar 2023 10:23:49 +0100
Subject: [PATCH v6 1/2] drm/i915/gt: introduce vm->scratch_range callback
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-guard_error_capture-v6-1-1b5f31422563@intel.com>
References: <20230308-guard_error_capture-v6-0-1b5f31422563@intel.com>
In-Reply-To: <20230308-guard_error_capture-v6-0-1b5f31422563@intel.com>
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

The callback will be responsible for setting scratch page PTEs for
specified range. In contrast to clear_range it cannot be optimized to nop.
It will be used by code adding guard pages.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 23 +++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  2 ++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt.c b/drivers/gpu/drm/i915/gt/intel_ggtt.c
index 842e69c7b21e49..38e6f0b207fe0c 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt.c
@@ -291,6 +291,27 @@ static void gen8_ggtt_insert_entries(struct i915_address_space *vm,
 	ggtt->invalidate(ggtt);
 }
 
+static void gen8_ggtt_clear_range(struct i915_address_space *vm,
+				  u64 start, u64 length)
+{
+	struct i915_ggtt *ggtt = i915_vm_to_ggtt(vm);
+	unsigned int first_entry = start / I915_GTT_PAGE_SIZE;
+	unsigned int num_entries = length / I915_GTT_PAGE_SIZE;
+	const gen8_pte_t scratch_pte = vm->scratch[0]->encode;
+	gen8_pte_t __iomem *gtt_base =
+		(gen8_pte_t __iomem *)ggtt->gsm + first_entry;
+	const int max_entries = ggtt_total_entries(ggtt) - first_entry;
+	int i;
+
+	if (WARN(num_entries > max_entries,
+		"First entry = %d; Num entries = %d (max=%d)\n",
+		first_entry, num_entries, max_entries))
+		num_entries = max_entries;
+
+	for (i = 0; i < num_entries; i++)
+		gen8_set_pte(&gtt_base[i], scratch_pte);
+}
+
 static void gen6_ggtt_insert_page(struct i915_address_space *vm,
 				  dma_addr_t addr,
 				  u64 offset,
@@ -919,6 +940,7 @@ static int gen8_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.cleanup = gen6_gmch_remove;
 	ggtt->vm.insert_page = gen8_ggtt_insert_page;
 	ggtt->vm.clear_range = nop_clear_range;
+	ggtt->vm.scratch_range = gen8_ggtt_clear_range;
 
 	ggtt->vm.insert_entries = gen8_ggtt_insert_entries;
 
@@ -1082,6 +1104,7 @@ static int gen6_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.clear_range = nop_clear_range;
 	if (!HAS_FULL_PPGTT(i915))
 		ggtt->vm.clear_range = gen6_ggtt_clear_range;
+	ggtt->vm.scratch_range = gen6_ggtt_clear_range;
 	ggtt->vm.insert_page = gen6_ggtt_insert_page;
 	ggtt->vm.insert_entries = gen6_ggtt_insert_entries;
 	ggtt->vm.cleanup = gen6_gmch_remove;
diff --git a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
index 77c793812eb46a..d6a74ae2527bd9 100644
--- a/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
+++ b/drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c
@@ -102,6 +102,7 @@ int intel_ggtt_gmch_probe(struct i915_ggtt *ggtt)
 	ggtt->vm.insert_page = gmch_ggtt_insert_page;
 	ggtt->vm.insert_entries = gmch_ggtt_insert_entries;
 	ggtt->vm.clear_range = gmch_ggtt_clear_range;
+	ggtt->vm.scratch_range = gmch_ggtt_clear_range;
 	ggtt->vm.cleanup = gmch_ggtt_remove;
 
 	ggtt->invalidate = gmch_ggtt_invalidate;
diff --git a/drivers/gpu/drm/i915/gt/intel_gtt.h b/drivers/gpu/drm/i915/gt/intel_gtt.h
index 5a775310d3fcb5..69ce55f517f567 100644
--- a/drivers/gpu/drm/i915/gt/intel_gtt.h
+++ b/drivers/gpu/drm/i915/gt/intel_gtt.h
@@ -298,6 +298,8 @@ struct i915_address_space {
 				  u64 start, u64 length);
 	void (*clear_range)(struct i915_address_space *vm,
 			    u64 start, u64 length);
+	void (*scratch_range)(struct i915_address_space *vm,
+			      u64 start, u64 length);
 	void (*insert_page)(struct i915_address_space *vm,
 			    dma_addr_t addr,
 			    u64 offset,

-- 
2.34.1
