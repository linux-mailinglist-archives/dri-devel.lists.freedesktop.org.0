Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2F881AC65
	for <lists+dri-devel@lfdr.de>; Thu, 21 Dec 2023 02:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 978DD10E62D;
	Thu, 21 Dec 2023 01:55:53 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40FE810E02B;
 Thu, 21 Dec 2023 01:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1703123752; x=1734659752;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Almu+5HVhzrc9strF3ex5NeGVgFPibqHVWEr+UqtA2U=;
 b=Kv/AoLwFQwAkNMdsqHCTW9WZLPG8LngSEmxcC+iFMFzJrBsfrgiBoq7+
 7s0ocXesQ8aAPEY7w/dKJi+NZWtPJFVmC0hP7hdU1ko+5gKDViWWExNxu
 sj6w9NYChw0sEDiA0fMPx+Oo3DFEwbTV+sw2FADpT1IO3QzOelH4vd39b
 G4q9QiPSzMvGQrq9Bdu37syrLZEceoA+YLqAtQPQrAB240AC8pb0ykQY4
 7tZeEQwZGZlewTuivvnqjtMrLQz3TG1MDEVGuHYJvCWPmQVsB4+zMq2Gd
 rcyTodnhllf5r1yJfnGcRh/mvgUJMbNfJ+K4Nhr5ILlcF6DIkMWMNJyra Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="2744015"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; 
   d="scan'208";a="2744015"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Dec 2023 17:55:52 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10930"; a="810814020"
X-IronPort-AV: E=Sophos;i="6.04,292,1695711600"; d="scan'208";a="810814020"
Received: from relo-linux-5.jf.intel.com ([10.165.21.152])
 by orsmga001.jf.intel.com with ESMTP; 20 Dec 2023 17:55:51 -0800
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v3 0/3] Enable Wa_14019159160 and  Wa_16019325821 for MTL
Date: Wed, 20 Dec 2023 17:57:19 -0800
Message-ID: <20231221015722.3027448-1-John.C.Harrison@Intel.com>
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

