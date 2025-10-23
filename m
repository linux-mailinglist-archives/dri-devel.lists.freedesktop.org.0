Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73DBEBFFEE4
	for <lists+dri-devel@lfdr.de>; Thu, 23 Oct 2025 10:30:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CE6410E8D5;
	Thu, 23 Oct 2025 08:30:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="TH5T6hSt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 467E010E8E9;
 Thu, 23 Oct 2025 08:30:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761208214; x=1792744214;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rfv8kn19RWzq4iC1PzwMQG+8pShCvAypKFyENytMtME=;
 b=TH5T6hSt6wB1VnFUwtQHNpwbZI7/QU1zArxbiPjFFC5dwoJMVTxqMUiZ
 VAHlhOkrJtj9voyx3JbWJK7XvJsHym4+ylLpfT4dWT97EwpjP7v1+pYKV
 /y/KYq8ZT2aLteF6jVk4q5U3/lPhsy1Uv+G9BuWitOR6mEWRcrGkRp4cv
 ko1BfiljMU7LQXyVpyukIC8OhHp+bBWujEr1mMeyEjy5dolcr5ktFN2gx
 RzwlUuKkgFTF8DRU4mQlPaKMakGOLkSLjMDo08efirjW2CAcvS11WwOmc
 zcjrB9nQbJH8NombdZ1TQPiUHm7FobKEjGPPPpNAdx6ckUlcHZEOjPZ7n A==;
X-CSE-ConnectionGUID: 6opNhKtDSN2miLgGqSanzA==
X-CSE-MsgGUID: gHykzpcvTo2X8Jn3Zf744w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="63264852"
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="63264852"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:30:14 -0700
X-CSE-ConnectionGUID: 0Q+1dL3JSsqKC6b76K/ZiQ==
X-CSE-MsgGUID: haWOVBjKSR6ijhQlwVYXxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,249,1754982000"; d="scan'208";a="183319550"
Received: from jkrzyszt-mobl2.ger.corp.intel.com ([10.245.244.189])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Oct 2025 01:30:10 -0700
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
Subject: [PATCH v3 0/3] drm/i915: Avoid lock inversion when pinning to GGTT
Date: Thu, 23 Oct 2025 10:25:18 +0200
Message-ID: <20251023082925.351307-5-janusz.krzysztofik@linux.intel.com>
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

v3: Provide more verbose in-line comment (Andi; 1/3, 2/3),
  - mention target environments in commit message (1/3).
v2: Fix spelling (Sebastian, Krzysztof; 2/3),
  - explain why VMA pinning is commited asynchronously on CHV/BXT+VTD
    (Krzysztof; 2/3, 3/3),
  - use more precise wording in commit description (3/3).

Janusz Krzysztofik (3):
  drm/i915: Avoid lock inversion when pinning to GGTT on CHV/BXT+VTD
  drm/i915: Wait longer for threads in migrate selftest on CHV/BXT+VTD
  drm/i915: Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD

 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  9 ++++++++-
 drivers/gpu/drm/i915/i915_vma.c               | 16 ++++++++++++++--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 ++++
 3 files changed, 26 insertions(+), 3 deletions(-)

Cc: Sebastian Brzezinka <sebastian.brzezinka@intel.com>
Cc: Krzysztof Karas <krzysztof.karas@intel.com>
Cc: Andi Shyti <andi.shyti@kernel.org>
-- 
2.51.0

