Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D1D6BC5F91
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 18:13:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B400910E394;
	Wed,  8 Oct 2025 16:13:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="hoiGsHwC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B3F10E1EE;
 Wed,  8 Oct 2025 16:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759940001; x=1791476001;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=czphV8xQhXO60WQ1XxMD3W/OS8fyRQ+0OEZssnvWeQo=;
 b=hoiGsHwC6FEiW3IXqeXTXilVA/JHP1pLkISb8L2kp3EpHBShUsaiPKRI
 dOEqsmpaPg9zMiLkW/rEn2NxVfQEAOMzHmPBh/x1A7Kp65WwC+Honvx2F
 2WRGxNSuVzWqVb+BmHdMLoE6m45I6QSbqZfDyscyKIl3KZ3FA+/H5GCRJ
 ekCITDdQrmKeSyZis2P9Y8lw8Xwz/URaj/hwiSsXxU04FmUP/E1GsSfwg
 IwUm5IpOlyxNV/5Tz0DUp93qUOhWu5qb+8iFvicCmhsB8csK3sZ/Xz/zw
 HNokP4frKa4RWN/eUlzvCJImDoBxC0qyLgHv7egedRFAJS0sfH/9ecK9c g==;
X-CSE-ConnectionGUID: c1PpszsISbKA6rqal4FdZQ==
X-CSE-MsgGUID: n/m/WfgMR/ecXqQZBlGJqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11576"; a="79784430"
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="79784430"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:13:20 -0700
X-CSE-ConnectionGUID: JznXDU6sTqKeHSbxjU6miw==
X-CSE-MsgGUID: P4vdSdxkRXqoi0fHVNoSTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,213,1754982000"; d="scan'208";a="180294835"
Received: from jkrzyszt-mobl2.ger.corp.intel.com (HELO
 jkrzyszt-mobl2.intranet) ([10.245.244.124])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Oct 2025 09:13:17 -0700
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
Subject: [PATCH 0/3] drm/i915: Avoid lock inversion when pinning to GGTT
Date: Wed,  8 Oct 2025 18:12:25 +0200
Message-ID: <20251008161258.3568573-5-janusz.krzysztofik@linux.intel.com>
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

Janusz Krzysztofik (3):
  drm/i915: Avoid lock inversion when pinning to GGTT
  drm/i915: Wait longer for threads in migrate selftest on CHV/BXT+VTD
  drm/i915: Wait for page_sizes_gtt in gtt selftest on CHV/BXT+VTD

 drivers/gpu/drm/i915/gt/selftest_migrate.c    |  3 ++-
 drivers/gpu/drm/i915/i915_vma.c               | 10 ++++++++--
 drivers/gpu/drm/i915/selftests/i915_gem_gtt.c |  4 ++++
 3 files changed, 14 insertions(+), 3 deletions(-)

-- 
2.51.0

