Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4586B3A43
	for <lists+dri-devel@lfdr.de>; Fri, 10 Mar 2023 10:24:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20CD410E997;
	Fri, 10 Mar 2023 09:24:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2FC3610E997;
 Fri, 10 Mar 2023 09:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678440244; x=1709976244;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=CTy6ZzNeoPT63c9yM0XeU/gmCGM5CiKq1s2pnTxJRcU=;
 b=dXOWfRUOQj7BYn9gZ25DabslzzhiWmjTdQdj5iG/oTIru7i4CVCyBv2U
 BSq5dU1USLRHFk7gdDdTsYetvO2go8UhpHgEp/3LZJBUAAAU8kajHilQP
 Nvt2rRtlPYQ/n8H7C6WAXM0PGbNHXXN6P38cr7erLv7vkx9zPBSMYkZjD
 ewtil1DCv9A3H6JXMcZqtms+IBOgQDtQ5LnZ1fr2qjlf9GK22YHihzQcq
 DSRBHwBSIDB6Z4QLKmuYkrqcZvDaIJaZHlibcEBaN8U10tnGGL6yI5SSV
 IHjOlVliClN3cOgekSfZWo47qIljMvzUQDp44Ndb/LWgI+JHGpXCPy5fe w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="334164672"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="334164672"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:24:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10644"; a="801513237"
X-IronPort-AV: E=Sophos;i="5.98,249,1673942400"; d="scan'208";a="801513237"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Mar 2023 01:24:01 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v6 0/2] drm/i915: add guard page to ggtt->error_capture
Date: Fri, 10 Mar 2023 10:23:49 +0100
Message-Id: <20230308-guard_error_capture-v6-0-1b5f31422563@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACX3CmQC/32NQQqDMBBFryJZNyUaI9JV71FEYjLRgZrIJEqLe
 PdGD9Dl+5/H21kEQojsUeyMYMOIwWdobgUzk/YjcLSZWSUqKaRo+bhqsj0QBeqNXtJKwJ10UtYA
 plWOZXPQEfhA2pvpdC3NPOFyPguBw8/Ve3WZJ4wp0PfKb+pc/5c2xQVvbFmXwpZS1eKJPsH7bsL
 MuuM4fk3G5PTQAAAA
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

This patch tries to diminish plague of DMAR read errors present
in CI for ADL*, RPL*, DG2 platforms, see for example [1] (grep DMAR).
CI is usually tolerant for these errors, so the scale of the problem
is not really visible.
To show it I have counted lines containing DMAR read errors in dmesgs
produced by CI for all three versions of the patch, but in contrast to v2
I have grepped only for lines containing "PTE Read access".
Below stats for kernel w/o patchset vs patched one.
v1: 210 vs 0
v2: 201 vs 0
v3: 214 vs 0
Apparently the patchset fixes all common PTE read errors.

Changelog:
v2:
    - modified commit message (I hope the diagnosis is correct),
    - added bug checks to ensure scratch is initialized on gen3 platforms.
      CI produces strange stacktrace for it suggesting scratch[0] is NULL,
      to be removed after resolving the issue with gen3 platforms.
v3:
    - removed bug checks, replaced with gen check.
v4:
    - change code for scratch page insertion to support all platforms,
    - add info in commit message there could be more similar issues
v5:
    - changed to patchset adding nop_clear_range related code,
    - re-insert scratch PTEs on resume
v6:
    - use scratch_range

To: Jani Nikula <jani.nikula@linux.intel.com>
To: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
Cc: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: Andi Shyti <andi.shyti@linux.intel.com>
Cc: Chris Wilson <chris.p.wilson@linux.intel.com>
Cc: Nirmoy Das <nirmoy.das@intel.com>

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>

---
- Link to v5: https://lore.kernel.org/r/20230308-guard_error_capture-v5-0-6d1410d13540@intel.com

---
Andrzej Hajda (2):
      drm/i915/gt: introduce vm->scratch_range callback
      drm/i915: add guard page to ggtt->error_capture

 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 43 ++++++++++++++++++++++++++++---
 drivers/gpu/drm/i915/gt/intel_ggtt_gmch.c |  1 +
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  2 ++
 3 files changed, 42 insertions(+), 4 deletions(-)
---
base-commit: 3cd6c251f39c14df9ab711e3eb56e703b359ff54
change-id: 20230308-guard_error_capture-f3f334eec85f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>
