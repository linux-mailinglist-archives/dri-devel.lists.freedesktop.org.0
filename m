Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24F3F7DA24B
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 23:18:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1789E10EA50;
	Fri, 27 Oct 2023 21:18:09 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6252510EA4E;
 Fri, 27 Oct 2023 21:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698441487; x=1729977487;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=p4MRold63kHHhQHUHmlITxIjOxDm/PYBKtVzvh7keXk=;
 b=AnX87fD1BnqEqg+DGenEphnYEgPc8EMINZ3GHSm+kY3F1J+06sYW5nBy
 XEiLR0F5m87Np7BaPkwcfxqa5rvK3a/U4wwcPIxwFrTSvgvRvgWt3ojMJ
 RHg1EvZAiAV2a2tLFmwrVQ/TELEMCiBzwHet4w4nJpupmKrrYfnaXKVnQ
 VQJXEhyPqZogzQnm9doqucM/6uLtaVZTf9rw2q29OQWGzLYohGEyq2F1F
 tdnyUCxGw79OGaZiwKDAJt3clw+CPPu2kyWDA+BX7potkbs4Fvj8CTcuc
 lNDSqsxmSYKNP1N1dXMyuCRm8WhQYyKBLyt6yqTLBteeJFsqslar1PNBk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10876"; a="378219019"
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; d="scan'208";a="378219019"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Oct 2023 14:18:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,257,1694761200"; 
   d="scan'208";a="7336228"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orviesa001.jf.intel.com with ESMTP; 27 Oct 2023 14:16:43 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/4] Enable Wa_14019159160 and  Wa_16019325821 for MTL
Date: Fri, 27 Oct 2023 14:18:10 -0700
Message-ID: <20231027211814.2696398-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
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

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>


John Harrison (4):
  drm/i915: Enable Wa_16019325821
  drm/i915/guc: Add support for w/a KLVs
  drm/i915/guc: Enable Wa_14019159160
  drm/i915/mtl: Add module parameter override for
    Wa_16019325821/Wa_14019159160

 drivers/gpu/drm/i915/gt/gen8_engine_cs.c      | 22 +++--
 drivers/gpu/drm/i915/gt/intel_engine_types.h  |  8 +-
 .../gpu/drm/i915/gt/uc/abi/guc_errors_abi.h   |  1 +
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  7 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 90 ++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_guc_fw.c     |  6 ++
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  8 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  9 +-
 drivers/gpu/drm/i915/i915_params.c            |  3 +
 drivers/gpu/drm/i915/i915_params.h            |  1 +
 12 files changed, 148 insertions(+), 15 deletions(-)

-- 
2.41.0

