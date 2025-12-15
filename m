Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D1BCBFB6A
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 21:18:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ECC8610E267;
	Mon, 15 Dec 2025 20:18:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="MgseQsfZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26B2E10E02F;
 Mon, 15 Dec 2025 20:18:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765829911; x=1797365911;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=xzjTZG5SWMdToIAbrtZvdluf8B2fnEgcFiz7KEDiMjY=;
 b=MgseQsfZ1gDTMUqXiG8siNfm7CbVhcdolT+t7MWpgEPPI35DTqLcbXcr
 JDyp3A9TWGFlh5Jk7V5cHOyNKX387FSi5MJYJmhGmwteLBRVF3oIG3/mn
 tJbsN5PaNnqIFNbDGsHezwpXqJ/f4NYA+lhMz0A3sBR1vhvwoVgilGCsN
 QvOfJgpF96nZ4QSpay6DfTnkOJMllAMD5LxNw66akLAZPMMhNp1ePeLqT
 Hxw2TKXbGVesWknz8JlqVU77vKoQ19IByqAlgrwoPFzopE+bPpnpOfeqe
 5RAD+r+2dpo1LkI43Vb1L3Hs2cetohv6Wd7qQSsJwoQzca6xsM4/CXuhl Q==;
X-CSE-ConnectionGUID: 1SFUubB4QVuEX/lqUPaPIA==
X-CSE-MsgGUID: AgF7NZJBQm24Y5UoHp1EyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="85154304"
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="85154304"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 12:18:31 -0800
X-CSE-ConnectionGUID: ZB9T61l+R26WRQaCCeUawg==
X-CSE-MsgGUID: 1uyCbZBZQiqEayhsgki0XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,151,1763452800"; d="scan'208";a="228895871"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Dec 2025 12:18:28 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>
Subject: [CI 0/4] PF: Add handling for new adverse event thresholds
Date: Mon, 15 Dec 2025 21:18:00 +0100
Message-ID: <20251215201806.196514-1-michal.wajdeczko@intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series was already reviewed and tested by the Xe CI [1] but since
it uses __VA_OPT__ it was requested to also run it over dri-devel CI
to double check compiler support for the __VA_OPT__.

GCC [2] supports __VA_OPT__ from version 8 and clang [3] supports it
from version 12, while minimal versions to compile kernel [4] are now
GCC 8.1 and clang 15.0.0, so we should good.

[1] https://patchwork.freedesktop.org/series/158874/#rev2
[2] https://docs.kernel.org/process/changes.html
[3] https://gcc.gnu.org/projects/c-status.html
[4] https://clang.llvm.org/c_status.html

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>

Daniele Ceraolo Spurio (1):
  drm/xe/pf: Add handling for MLRC adverse event threshold

Michal Wajdeczko (3):
  drm/xe: Introduce IF_ARGS macro utility
  drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
  drm/xe/pf: Prepare for new threshold KLVs

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 ++++
 drivers/gpu/drm/xe/tests/xe_args_test.c       | 53 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h                  | 18 +++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                   | 21 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c               |  4 +-
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  6 +++
 9 files changed, 128 insertions(+), 13 deletions(-)

-- 
2.47.1

