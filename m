Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DCDC85A1F3F
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 05:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7362F10E293;
	Fri, 26 Aug 2022 03:05:57 +0000 (UTC)
X-Original-To: DRI-Devel@lists.freedesktop.org
Delivered-To: DRI-Devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2859610E277;
 Fri, 26 Aug 2022 03:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661483151; x=1693019151;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=M304JNgb5qG4NNSg6clasVBbbqNDJTqFibtZKGajxhY=;
 b=EM0UIZj6Q0salkmJtFSNkyfUis2zDPPP65dZE0AXi9eHviLXZ5YXJPsU
 QpIhnARXAwqvi+Z5/puYAgrxQbc5qcU98qe1cHaRQJIILWaNqAC08VMDs
 5MUMnLYeg8cOXplmcDO8hXlFpgl2QHqBgcUFuSp4Byf22L/136gyGNM7A
 WyLmrcM1fqr7goJMZTCyTCfncXcmDwEjgFQ+qXMI/XUB9g5YQFOe23U96
 pqiZ40vW0xN8Fikvo9lfLOlDjb5oGABDtCFljJkJ1K3vXRpjtDVABPsSg
 o4KykVJ9hSCUCArGIbBfZtv8C5DNyKiYloACCPMDXOItKsk00OitgXkd6 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10450"; a="281380680"
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="281380680"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Aug 2022 20:05:50 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.93,264,1654585200"; d="scan'208";a="610421796"
Received: from relo-linux-5.jf.intel.com ([10.165.21.134])
 by orsmga002.jf.intel.com with ESMTP; 25 Aug 2022 20:05:50 -0700
From: John.C.Harrison@Intel.com
To: Intel-GFX@Lists.FreeDesktop.Org
Subject: [PATCH v2 0/3] Drop version numbers from firmware files
Date: Thu, 25 Aug 2022 20:05:50 -0700
Message-Id: <20220826030553.2611574-1-John.C.Harrison@Intel.com>
X-Mailer: git-send-email 2.37.2
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

Upstream direction is to include the bare minimum of version numbers
in firmware files and to replace them in the repo rather than
accumulating them. For HuC, that means going completely versionless.
For GuC, the major version needs to be kept as that indicates a break
in backwards compatibility with the KMD.

v2: Fix a bunch of issues and add better documentation (some found in
code review by Daniele, other through more thorough testing).

Signed-off-by: John Harrison <John.C.Harrison@Intel.com>
CC: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>


John Harrison (3):
  drm/i915/uc: Support for version reduced and multiple firmware files
  drm/i915/uc: Add patch level version number support
  drm/i915/uc: Enable version reduced firmware files for newest
    platforms

 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |   8 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 468 ++++++++++++------
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |  39 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw_abi.h  |   8 +-
 drivers/gpu/drm/i915/i915_gpu_error.c         |  16 +-
 6 files changed, 358 insertions(+), 191 deletions(-)

-- 
2.37.2

