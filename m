Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22CD6B0D0A
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:40:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5176010E618;
	Wed,  8 Mar 2023 15:39:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D901F10E610;
 Wed,  8 Mar 2023 15:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678289989; x=1709825989;
 h=from:date:subject:mime-version:content-transfer-encoding:
 message-id:references:in-reply-to:to:cc;
 bh=Se/biot0lVFjHYoy6HUt2Ws+mFr0uN1AGnXhhRrqKoQ=;
 b=eQF3cUZkaONnArQ3/cLOCk8JJSrEYKm02OqjUyJ3rstHF4YSmuJqgVCS
 JmNf9XRCYk4SVKBYVcfDUjeb+xMH45qkHIrbZQ84Cf+qu8AGtO2+F/tcG
 2XBRsKVN3Xf2GwIImv+zK2xgzDwe7ggcvpalhO7RmIQeC0G4fmt/cvmAl
 zbe5rUrakFRKNl82Clx08otZHNoShCLyN38m4n9+bTzVHgPQ0ehwdae65
 gMvs2XE1TiFEjaK8j4lYAK+HslBpqGhjoD1FhpQUdRa+ikOKsmmTPD0pg
 RirjLpC8KNvMaC+rumn9ADa7htlMxttezYp8P+Gh1qy8+oEypveoza+Uf Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337703560"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337703560"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787160261"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787160261"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:46 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Date: Wed, 08 Mar 2023 16:39:04 +0100
Subject: [PATCH v5 2/4] drm/i915/display: use nop_clear_range instead of local
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230308-guard_error_capture-v5-2-6d1410d13540@intel.com>
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

Since nop_clear_range is visible it can be used here.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 drivers/gpu/drm/i915/display/intel_dpt.c | 7 +------
 1 file changed, 1 insertion(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dpt.c b/drivers/gpu/drm/i915/display/intel_dpt.c
index ad1a37b515fb1c..eb9d1a6cbfb9dd 100644
--- a/drivers/gpu/drm/i915/display/intel_dpt.c
+++ b/drivers/gpu/drm/i915/display/intel_dpt.c
@@ -73,11 +73,6 @@ static void dpt_insert_entries(struct i915_address_space *vm,
 		gen8_set_pte(&base[i++], pte_encode | addr);
 }
 
-static void dpt_clear_range(struct i915_address_space *vm,
-			    u64 start, u64 length)
-{
-}
-
 static void dpt_bind_vma(struct i915_address_space *vm,
 			 struct i915_vm_pt_stash *stash,
 			 struct i915_vma_resource *vma_res,
@@ -291,7 +286,7 @@ intel_dpt_create(struct intel_framebuffer *fb)
 	i915_address_space_init(vm, VM_CLASS_DPT);
 
 	vm->insert_page = dpt_insert_page;
-	vm->clear_range = dpt_clear_range;
+	vm->clear_range = nop_clear_range;
 	vm->insert_entries = dpt_insert_entries;
 	vm->cleanup = dpt_cleanup;
 

-- 
2.34.1
