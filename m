Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2316B0D07
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 16:39:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDB5010E610;
	Wed,  8 Mar 2023 15:39:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3718E10E610;
 Wed,  8 Mar 2023 15:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678289988; x=1709825988;
 h=from:subject:date:message-id:mime-version:
 content-transfer-encoding:to:cc;
 bh=JZPPyfomcM6RPed2Z6objclkx7X74pCD0nLjOtDOZ2w=;
 b=BewPIDW2s1lUAFJmrD3svTH+TDr4N1YC9+DKseXgH39XW1jTMdqaYfn5
 kFUUfql1xvibcUZ2nsTodVWrQ5bu63sPucqcH0mUrKzYbnc53IXyIzEcV
 UkJ+/1yubu16wh56uT4cWqmRwCS3gOxeksWcG3ilVfYeFGM4PW40p82bV
 siZ9YogQBmd3iHo/xcOrUe/sumdzSmi/qCQ3Esb+pndNIRTo3HqkAsnP5
 OQo55KxuhJ19Xlc32tFmWjdtxU8bnW3Hj09iglOnBtexBNRnisZge2TBh
 /DL/puCIrLnkN/PFt/ye3wX/PUj+DY5NQ3Vt+Wv101O2+uOmKvHLxrkYn g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="337703534"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="337703534"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10642"; a="787160232"
X-IronPort-AV: E=Sophos;i="5.98,244,1673942400"; d="scan'208";a="787160232"
Received: from lab-ah.igk.intel.com ([10.102.42.211])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2023 07:39:42 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
Subject: [PATCH v5 0/4] drm/i915: add guard page to ggtt->error_capture
Date: Wed, 08 Mar 2023 16:39:03 +0100
Message-Id: <20230308-guard_error_capture-v5-0-6d1410d13540@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABesCGQC/x2N0QqDMAwAf0XyvEAxE2S/IkNim2oerCXVMRD/f
 XWPx3HcCUVMpcCrOcHko0W3VKF7NOAXTrOghsrQupYcuR7ngy2MYrbZ6DnvhwlGikRPEd93EWo5
 cRGcjJNf7jbYirvm22STqN//b3hf1w9xA2EcfwAAAA==
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
Andrzej Hajda (4):
      drm/i915/gt: make nop_clear_range public
      drm/i915/display: use nop_clear_range instead of local function
      drm/i915/selftests: use nop_clear_range instead of local function
      drm/i915: add guard page to ggtt->error_capture

 drivers/gpu/drm/i915/display/intel_dpt.c  |  7 +-----
 drivers/gpu/drm/i915/gt/intel_ggtt.c      | 38 ++++++++++++++++++++++++++-----
 drivers/gpu/drm/i915/gt/intel_gtt.h       |  2 ++
 drivers/gpu/drm/i915/selftests/mock_gtt.c |  9 ++------
 4 files changed, 37 insertions(+), 19 deletions(-)
---
base-commit: 3cd6c251f39c14df9ab711e3eb56e703b359ff54
change-id: 20230308-guard_error_capture-f3f334eec85f

Best regards,
-- 
Andrzej Hajda <andrzej.hajda@intel.com>
