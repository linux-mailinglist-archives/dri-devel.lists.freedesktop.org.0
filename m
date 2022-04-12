Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99B4FEA35
	for <lists+dri-devel@lfdr.de>; Wed, 13 Apr 2022 01:00:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42EAB10EC9A;
	Tue, 12 Apr 2022 22:59:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F36BE10EC9A;
 Tue, 12 Apr 2022 22:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649804396; x=1681340396;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6WuEfR8eoEzXapEEuRubWApF2DtkcsOoVeFUkphXl3Q=;
 b=ayWAlWO0rloyjLI4QKddhElOiXsJqUXFuLfYLLmI3J6qSs7pb3np4K0s
 w+uDxal7PlaP8noD+IRuD7LI3EDTPe+QVXkfIX+BKEL4M+RP/Doj3D2cF
 uOCMuC53jyBULqQzr8tEO04xc3k6iPup/2/A5q3CYTvp5Oa238Umdlx1T
 SNJ5CNUOvtZIseG0eWpqPHQiPlSDPlbqYcphgTiqbJGrcTLgy0wD4SQHq
 rj3Vm8C/FMg3V1nOn9kSwe5waF2oTONtQJiMJcu9xtKQDhLiuTHxcN98W
 CyE491nCTt/3YC2LgB0GxzLnLeF8KfMf8b4j54zCiBeGhskFtrzClQ6AY A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10315"; a="287547850"
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="287547850"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Apr 2022 15:59:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,254,1643702400"; d="scan'208";a="854557806"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by fmsmga005.fm.intel.com with ESMTP; 12 Apr 2022 15:59:55 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH 0/1] Update to GuC v70
Date: Tue, 12 Apr 2022 15:59:54 -0700
Message-Id: <20220412225955.1802543-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, DRI-Devel@Lists.FreeDesktop.Org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: John Harrison <John.C.Harrison@Intel.com>

Update to the latest GuC firmware release.

Note that this includes some significant backwards breaking API
changes. One is about context registration - the descriptor pool is
gone, all parameters are passed via the CTB instead. The second is
about scheduling policy updates - they are now done via a single KLV
based H2G instead of multiple direct H2Gs.

Note further than this patch set is bsaed on drm-tip so that it can be
tested by CI. The drm-tip tree includes a topic branch with DG2
support. Therefore this patch set includes the update of the DG2
firmware version as well. However, that means that it will conflict
when merged to gt-next. So when the patch is merged, the DG2 part will
need to be dropped and a replacement patch merged to the topic branch.

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


John Harrison (1):
  drm/i915/guc: Update to GuC version 70.1.1

 .../gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |   4 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_klvs_abi.h |  15 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |   5 -
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h   |  67 ++--
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c | 375 +++++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  32 +-
 6 files changed, 294 insertions(+), 204 deletions(-)

-- 
2.25.1

