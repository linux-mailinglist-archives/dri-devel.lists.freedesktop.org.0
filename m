Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33672A766BE
	for <lists+dri-devel@lfdr.de>; Mon, 31 Mar 2025 15:21:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C346110E404;
	Mon, 31 Mar 2025 13:21:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P0L8vB26";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 157E410E3F3
 for <dri-devel@lists.freedesktop.org>; Mon, 31 Mar 2025 13:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743427273; x=1774963273;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q5rZGd8lTYgJjK4n7s7R0JPJigvZUcwYdOXbFh5TjSg=;
 b=P0L8vB26orGzR+nogsMkJ3uiJaDIkZsSQ6/4P2kbQ/d4tBYPh+facdol
 92ugUntM/0w+4NRmgxA1QzpP+IY4W1qWDwPBmYrgTVz8vxwdwaAGXaK9N
 ACFyyD6YU70s/t/OzKCPoJJ9yAk6FtZ+WPncWb61RLP+l+z/reOEvjvPG
 WbYNdn/8pWpHw4mhm/5BFPAKeBm8vP+JxCgpIFl21xFZt0y/YXc1knXan
 hl5SprFRdZ25U4Ov8SZqa3VGwTylpXjlAbfpA3Pcd+R+IFeUUPoJ9v0+1
 N9hyXxZPkrv4e2nU7mYqcKtdPIASJ6ht1//+CRKKjMtjp3Wo9AKJCE+Up w==;
X-CSE-ConnectionGUID: TvdhI2tOQKqRI1zaDs1AHw==
X-CSE-MsgGUID: IPkIU1gdSKi4v0C7Z0acVg==
X-IronPort-AV: E=McAfee;i="6700,10204,11390"; a="44425975"
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="44425975"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2025 06:21:11 -0700
X-CSE-ConnectionGUID: FfRhrA0WQFuGR5WxTNyjaQ==
X-CSE-MsgGUID: UBwHrelIQU6dAw9c5CaSIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,290,1736841600"; d="scan'208";a="130792662"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa005.fm.intel.com with ESMTP; 31 Mar 2025 06:21:09 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v6 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Mon, 31 Mar 2025 15:21:03 +0200
Message-Id: <20250331132107.1242954-1-tomasz.lis@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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

To support VF Migration, it is necessary to do fixups to any
non-virtualized resources. These fixups need to be applied within
VM, on the KMD working with VF.

This series adds two fixup functions to the recovery worker:
* for fixing drm_mm nodes which represent GGTT allocations
* for fixing content of outgoing CTB buffer

v2: Fixed missing include, made checkpatch happy
v3: Moved some functs to xe_ggtt.c; moved shift computation to just
  after querying; improved documentation; switched some warns to asserts;
  skipping fixups when GGTT shift eq 0; iterating through tiles rather
  than gts; fixes in log messages
v4: Updated kerneldocs, removed unused funct, properly allocate
  balloning nodes if non existent, removed inline keywords, enums for
  offsets in CTB messages, less error messages, if return unused then
  made functs void
v5: Removed drm_mm change, but added VF init modifications. These then
  allowed to re-use ballooning functions during ggtt node fixing.
v6: Minor update - fixed some misplaced funct declarations

Tomasz Lis (4):
  drm/xe/vf: Divide ballooning into allocation and insertion
  drm/xe/sriov: Shifting GGTT area post migration
  drm/xe/guc: Introduce enum with offsets for multi-LRC register H2G
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |   7 ++
 drivers/gpu/drm/xe/xe_ggtt.c              |  40 ++++--
 drivers/gpu/drm/xe/xe_ggtt.h              |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 147 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 142 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   4 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  42 +++++++
 10 files changed, 368 insertions(+), 22 deletions(-)

-- 
2.25.1

