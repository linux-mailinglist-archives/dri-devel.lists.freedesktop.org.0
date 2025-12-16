Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA9ACC5421
	for <lists+dri-devel@lfdr.de>; Tue, 16 Dec 2025 22:49:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32BC410E996;
	Tue, 16 Dec 2025 21:49:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JHsC5i2A";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2741210E9A2;
 Tue, 16 Dec 2025 21:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1765921759; x=1797457759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=dE6l7hJhrlYscqhtFFuSCNsPgNnugmZnXn89zPRFg9c=;
 b=JHsC5i2A1Fl1nINSa4u+Q23DzNQSfFZSVTRDCl/Yv7iukI72kcaNiZ3l
 RjnJe9urnOxIp1PwVzF2bqbpHupnG+oSekiMHUOQs/rdCamtAqmNqGGlD
 nTpg6toSoSPsGhISWYmWhVQIDID2ss/+SUlSZR1RZ2OVuBnLOTfG97wMJ
 ksBrR03gs92jg4CudXKHXzFdCKUvQW10txOdeVstU5iw7AuV2mB9hfJWq
 t/T/iwsNHahee2vC5D+HEjM+kgJxno7B1Wl9cC9fXnar2pENHDk2kBVGb
 0pjYGuGYe7RgTIDmbCD5VeKo1S0AluTBXhcRf3G8p+K1ideCmSxzJcRCG g==;
X-CSE-ConnectionGUID: /IK+9gY9SfWpNZ0g5bBwjA==
X-CSE-MsgGUID: ZlmEfnmbTd6dlhHRDL20ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11644"; a="67045815"
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="67045815"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:49:19 -0800
X-CSE-ConnectionGUID: JgdsXvfDTZWiSTqpWa5bPA==
X-CSE-MsgGUID: +InDiarCSNq7ggHUbcMWjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,154,1763452800"; d="scan'208";a="198615312"
Received: from mrbroom-desk1.ger.corp.intel.com (HELO
 mwajdecz-hp.clients.intel.com) ([10.246.20.17])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Dec 2025 13:49:17 -0800
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
To: intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Subject: [PATCH v3 0/4] PF: Add handling for new adverse event thresholds
Date: Tue, 16 Dec 2025 22:48:55 +0100
Message-ID: <20251216214902.1429-1-michal.wajdeczko@intel.com>
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

We want to extend our macro-based KLV list definitions with new
information about the version from which given KLV is supported.

Instead of using magic version like 0.0.0 for legacy KLVs, add
utility IF_ARGS macro that can be used in code generators to emit
different code based on the presence of any additional arguments.

This series cherry-picks one patch from the EGS series [1] and
can be merged separately.

v1: https://patchwork.freedesktop.org/series/158874/#rev1
v2: https://patchwork.freedesktop.org/series/158874/#rev2
    new patch with GUC_FIRMWARE_VER_AT_LEAST macro
v3: alternate implementation of IF_ARGS macro for older GCC
    as kernel test robot reported errors on GCC 8.5.0 and
    same errors were seen locally on 9.5.0 but not on 10.1.0

Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

[1] https://patchwork.freedesktop.org/series/158142/#rev3

Daniele Ceraolo Spurio (1):
  drm/xe/pf: Add handling for MLRC adverse event threshold

Michal Wajdeczko (3):
  drm/xe: Introduce IF_ARGS macro utility
  drm/xe/guc: Introduce GUC_FIRMWARE_VER_AT_LEAST helper
  drm/xe/pf: Prepare for new threshold KLVs

 drivers/gpu/drm/xe/abi/guc_klvs_abi.h         |  9 ++++
 drivers/gpu/drm/xe/tests/xe_args_test.c       | 54 +++++++++++++++++++
 drivers/gpu/drm/xe/xe_args.h                  | 27 ++++++++++
 drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 19 ++++---
 drivers/gpu/drm/xe/xe_gt_sriov_pf_debugfs.c   |  9 ++--
 drivers/gpu/drm/xe/xe_gt_sriov_pf_migration.c |  2 +-
 drivers/gpu/drm/xe/xe_guc.h                   | 21 ++++++++
 drivers/gpu/drm/xe/xe_guc_ads.c               |  4 +-
 .../drm/xe/xe_guc_klv_thresholds_set_types.h  |  6 +++
 9 files changed, 138 insertions(+), 13 deletions(-)

-- 
2.47.1

