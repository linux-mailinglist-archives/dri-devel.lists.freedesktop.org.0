Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A2E02861E44
	for <lists+dri-devel@lfdr.de>; Fri, 23 Feb 2024 21:58:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8959B10EABF;
	Fri, 23 Feb 2024 20:58:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PlhXq7om";
	dkim-atps=neutral
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DAE10E050;
 Fri, 23 Feb 2024 20:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1708721922; x=1740257922;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sXhwlUrqVtWenUqiGzVL1TFOc6ioM1MPphpUIQerFaM=;
 b=PlhXq7omsMaBfUlOk3UGAT0xhDHLktsiQ54w9EY+0LPMyWTkUw5Exhmc
 mL+b70zURoOMO6moqV4QRAsnEYcYy40lOd62Sdc9R8ZkkJqPtHhoxeaxv
 XjJ20Fr/mlf4bSFfssy7Meyn0VWAMN+ItiHNZ4r3CoY/a0G5qQJUzcAU9
 AM5fzxamqtKdcnN8TB6rsXQr3ih3X0YMn7QKVMo+jVsGgVOwjYXgmhg9z
 GKLkuqw+rMFjZ/TqvutaR4UvAVbXdAZX8OJrhQQDcPgvufHFu0EgLCVsH
 wp7NjyRE8o2ZxD8r/SYePbewt9YMeOtexLmQPSbMNfboEENnw2YTDMrR5 Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10993"; a="20604771"
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; d="scan'208";a="20604771"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2024 12:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,180,1705392000"; 
   d="scan'208";a="5908496"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmviesa007.fm.intel.com with ESMTP; 23 Feb 2024 12:58:40 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Cc: DRI-Devel@Lists.FreeDesktop.Org, John Harrison <John.C.Harrison@Intel.com>
Subject: [PATCH v3 0/3] Enable Wa_14019159160 and  Wa_16019325821 for MTL
Date: Fri, 23 Feb 2024 12:56:29 -0800
Message-ID: <20240223205632.1621019-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
 Swindon SN3 1RJ
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

From: John Harrison <John.C.Harrison@Intel.com>

Enable Wa_14019159160 and  Wa_16019325821 for MTL

RCS/CCS workarounds for MTL.

v2: Fix bug in WA KLV implementation (offset not being reset to start
of list). Add better comment to prep patch about how KLVs can be added.
Add a module parameter override and disable the w/a by default as it
causes performance regressions and is only required by very specific
workloads.
v3: Rebase to latest tree. Drop module parameter as performance
regression is apparently not detectable after all and a bunch of more
common workloads have been seen to hit the issue.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (3):
  drm/i915: Enable Wa_16019325821
  drm/i915/guc: Add support for w/a KLVs
  drm/i915/guc: Enable Wa_14019159160

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 22 +++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  8 +-
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  5 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 89 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  8 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  8 +-
 10 files changed, 141 insertions(+), 15 deletions(-)

-- 
2.43.0

