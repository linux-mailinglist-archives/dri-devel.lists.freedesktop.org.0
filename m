Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E42CBC5FA3
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:13:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F060A10E860;
	Wed,  8 Oct 2025 16:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KtrRo2Qi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B881D10E85A;
 Wed,  8 Oct 2025 16:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759940012; x=1791476012;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=X1rwxtngSDPqY9ul850ONg/ASG3h11VPEslk6OGO9yo=;
 b=KtrRo2Qi48ZN1BRCGN+S54d0pHQg5rBXXCyIUJf6tbxLoysv5WF1aGZZ
 Hel0l+7RmkdPmLNkzPAWkFdUJ47CVEdPVGqYjUst1hFw7KC8xi0nmjKCk
 StyYaonWCcuW3Np0DsRwLIR6wKDG1HkZUrH810OtEFCezM77x+KCMb06d
 5llPhNeiiFQvexUfwBFSA6wjOhpeWX49Gwd56QsbYJRdbKqoj2+I9qKhF
 6gGQZyNn8cBDZP5bwpKSyQ2wf9j6vmGWPKvH6vMzHJ/1tWQuFPeM7o9Bt
 3cS96+tu1xV1o441Tb1ngtWqxe5E9jdEQjsMZVagWJc5PSyl5xbIpVR5o A==;
X-CSE-ConnectionGUID: kEfMhtrqQualJSXa3fIIKw==
X-CSE-MsgGUID: bgVfWQNRS2atGKSGNVx2jA==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79784463"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="79784463"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:13:31 -0700
X-CSE-ConnectionGUID: ZoMCsWO8QZ+Gy0vvt0cqvg==
X-CSE-MsgGUID: sQq2IKv8ScGeVgMB6CjjAQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180294920"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.244.124])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:13:28 -0700
From: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Krzysztof Niemiec <krzysztof.niemiec@intel.com>,
 Sebastian Brzezinka <sebastian.brzezinka@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH 3/3] drm/i915: Wait for page_sizes_gtt in gtt selftest on
 CHV/BXT+VTD
Date: Wed,  8 Oct 2025 18:12:28 +0200
Message-ID: <20251008161258.3568573-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
References: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

VMA binding to GGTT is now asynchronous in CHV / BXT+VDT enviroments, then
vma->resource->page_sizes_gtt the test uses as shift count may still be
not populated (equal 0) after i915_vma_pin() returns.  Wait for VMA bind
completion in those cases to avoid shift-out-of-bounds kernel warnings and
the test case failing with -EBADSLT.

Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
---
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
index 7ab4c4e602648..0a86e48575394 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem_gtt.c
@@ -1118,6 +1118,10 @@ static int misaligned_case(struct i915_address_space *vm, struct intel_memory_re
 		goto err_put;
 	}
 
+	/* make sure page_sizes_gtt has been populated before use */
+	if (i915_is_ggtt(vm) && intel_vm_no_concurrent_access_wa(vm->i915))
+		i915_vma_wait_for_bind(vma);
+
 	expected_vma_size = round_up(size, 1 << (ffs(vma->resource->page_sizes_gtt) - 1));
 	expected_node_size = expected_vma_size;
 
-- 
2.51.0

