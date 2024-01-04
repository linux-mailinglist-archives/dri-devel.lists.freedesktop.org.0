Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D45FE8247EA
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jan 2024 19:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A2A8D10E4D4;
	Thu,  4 Jan 2024 18:03:51 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8804D10E4C6;
 Thu,  4 Jan 2024 18:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1704391431; x=1735927431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Almu+5HVhzrc9strF3ex5NeGVgFPibqHVWEr+UqtA2U=;
 b=nAlQ2QvIJLKNKSck6dJpINc1NYUiB7L0XV+g+sccK/vlkSzDEWcqSbqI
 CuZ1R7AiDEswuK36mo+DfIJH87+F/G8WL8I2R+Zrdrlgvyr19HythpEvT
 4PvyI1DEVFm98EOGMOIRLRUn69Z9J44hld2gzt9i05GvqhZKhSeHm74e0
 DFuMYLNNGKaM6xdjD5/TZXZbH+dlVpLsVAtaL5+wG3rPdmfyrUAjISNTe
 hcaOpnfBKCN6zg7638oXxwgxI4l+HXks4ZvSADJm4IDivhjY1dEGq12Op
 bYtO/Q5pd6Iiv1wmXdHfZjLbKP/II234SVUOGJRy6F023D681/Ef8SRH5 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="4430214"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; 
   d="scan'208";a="4430214"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2024 10:03:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="850894350"
X-IronPort-AV: E=Sophos;i="6.04,331,1695711600"; d="scan'208";a="850894350"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by fmsmga004.fm.intel.com with ESMTP; 04 Jan 2024 10:03:49 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/3] Enable Wa_14019159160 and  Wa_16019325821 for MTL
Date: Thu,  4 Jan 2024 10:05:38 -0800
Message-ID: <20240104180541.2966374-1-John.C.Harrison@Intel.com>
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
2.41.0

