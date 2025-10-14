Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A48D3BD977E
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 14:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D70B710E5FB;
	Tue, 14 Oct 2025 12:55:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Srhajso0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B607710E5FB;
 Tue, 14 Oct 2025 12:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760446527; x=1791982527;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=O9SkHDvjuILVvTEeejvLwJNXSOActaQbLgkxknLenkg=;
 b=Srhajso0sR7G0IpLpDAcuEHgCoWH+haULBoA9Dq/n7+UjYmg3HA+lHZW
 4DsnUifcU9DEGot07HMNIlL8QrfeLEydnEYU06YGj54Ptp7dH1ugbPsDk
 eBCnxTMGhOv1xl+yCfmpqRRuqtgkDFLmrKXmFYwpAXmhnH895VPv8ZJJ0
 gWPhlR024AZph7VmiXgBgt+CEGea769EWYuecvG4rqoOxe1xVSMNANSY2
 3wcBUOQShkaco6vQQf0Q/BKI5TJhBFSvkNAA5c2948F7qchCDJ4wghqwa
 UkUqfecrEpe3MXE2aecdSPYW0F8MD/nWI2oH/GqZ/mGp6I5NIr9ZWTI5t A==;
X-CSE-ConnectionGUID: GW9iO+QMRp23VigrE9Tj4A==
X-CSE-MsgGUID: DIAng1PCQuW8xIAd+cm7+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11582"; a="61813299"
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="61813299"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:55:26 -0700
X-CSE-ConnectionGUID: QY2Ihee+Q+e8UyNkNfp5bA==
X-CSE-MsgGUID: 54RAfzYUSEqmJq5yrtg8mw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,228,1754982000"; d="scan'208";a="181096653"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.230])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2025 05:55:24 -0700
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
 Krzysztof Karas <krzysztof.karas@intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Subject: [PATCH v2 0/3] drm/i915: Avoid lock inversion when pinning to GGTT
Date: Tue, 14 Oct 2025 14:47:35 +0200
Message-ID: <20251014125504.14804-5-janusz.krzysztofik@linux.intel.com>
X-Mailer: git-send-email 2.51.0
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

On completion of i915_vma_pin_ww(), a synchronous variant of
dma_fence_work_commit() is called.  When pinning a VMA to GGTT address
space on a Cherry View family processor, or on a Broxton generation SoC
with VTD enabled, i.e., when stop_machine() is then called from
intel_ggtt_bind_vma(), that can potentially lead to lock inversion among
reservation_ww and cpu_hotplug locks.

Call asynchronous variant of dma_fence_work_commit() in that case.  With
that in place, adjust two selftest affected by that change.

v2: Fix spelling (Sebastian, Krzysztof; 2/3),
  - explain why VMA pinning is commited asynchronously on CHV/BXT+VTD
    (Krzysztof; 2/3, 3/3),
  - use more precise wording in commit description (3/3).

Janusz Krzysztofik (3):
  drm/i915: Avoid lock inversion when pinning to GGTT
  drm/i915: Wait longer for threads in migrate selftest on CHV/BXT+VTD
  drm/i915: Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD

 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  3 ++-
 drivers/gpu/drm/i915/i915_vma.c               | 10 ++++++++--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 ++++
 3 files changed, 14 insertions(+), 3 deletions(-)

Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
-- 
2.51.0

