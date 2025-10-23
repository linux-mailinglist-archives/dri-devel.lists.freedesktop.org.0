Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EECD6BFFEFE
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:30:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3656F10E8E0;
	Thu, 23 Oct 2025 08:30:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RnOhYtQQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A32B10E8E1;
 Thu, 23 Oct 2025 08:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761208226; x=1792744226;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D2mLtS3v+e8vdMQS8I8kZMXtCa2KbAnm2WIWXVwvtrk=;
 b=RnOhYtQQVAG/PU7K1XqMEemOLi+rS7VuKp8DQRkY4O9yNGxWJmfMq8Qz
 N3oFPfcWCC37KmZdIZyodthQALl9rlQW04/8RiWJ7fsaUvbtX7XIkarb4
 okZilPuaZkpPtIXBlrbBAkJfwlsjfb16pIONmvADU1ugVDgv/MBKMHXI5
 3TFD0YTJlhf/DFXhhRsqQNuNbjGqCKTdZYFEcXG6OFpmXix4Y5J4KxhME
 1rrZAYTfmZgDwmVcUwMiigfSdOEU3SW7BVFSJIj/gjiIgtfkV/hoWLBSk
 V/VdymuxU0X+k5Fzm/c89VekOQlxrJVI+Y4n8p/DWz8G6tnZeDMCoVDFj A==;
X-CSE-ConnectionGUID: ZeS8HMfEQ9eEDJNjUAi2Tg==
X-CSE-MsgGUID: veFysbGLTzCrvQ48vSCnTQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63264860"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63264860"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:30:26 -0700
X-CSE-ConnectionGUID: YeCmWZL4T7SARVO/wwUOXQ==
X-CSE-MsgGUID: 0R7S0ZHDSnGs0w8uLeDlyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183319606"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:30:22 -0700
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
 Andi Shyti <andi.shyti@kernel.org>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v3 3/3] drm/i915: Wait for page_sizes_gtt in gtt selftest on
 CHV/BXT+VTD
Date: Thu, 23 Oct 2025 10:25:21 +0200
Message-ID: <20251023082925.351307-8-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251023082925.351307-5-janusz.krzysztofik@linux.intel.com>
References: <20251023082925.351307-5-janusz.krzysztofik@linux.intel.com>
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

VMA pinning to GGTT is now commited asynchronously in CHV / BXT+VDT
environments to avoid lock inversion among reservation_ww and cpu_hotplug
locks, the latter acquired from stop_machine().  Then,
vma->resource->page_sizes_gtt the test uses as shift count may still be
not populated (equal 0) after i915_vma_pin() returns.  Wait for VMA bind
completion in those cases to avoid shift-out-of-bounds kernel warnings and
the test case failing with -EBADSLT.

v2: Explain why VMA pinning is commited asynchronously on CHV/BXT+VTD
    (Krzysztof),
  - use more precise wording in commit description.

Reviewed-by: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Reviewed-by: Krzysztof Karas <krzysztof.karas@intel.com>
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

