Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 199F0A75036
	for <lists+dri-devel@lfdr.de>; Fri, 28 Mar 2025 19:12:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A3AE10EA86;
	Fri, 28 Mar 2025 18:12:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="g9l+3akv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10DA210EA86
 for <dri-devel@lists.freedesktop.org>; Fri, 28 Mar 2025 18:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1743185524; x=1774721524;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=CZLz6SqUSFoQd33/u+RHnpKkFnrVFdI00is9l+wSE74=;
 b=g9l+3akvqqDL8d+TkVvPgudD3vuLz3CLas/Ai6CzYnrj1Dirt6XLmHyL
 Bo9QPbCgrBVhmXoPMAkIXoReXrVw8KdHqwCc9P+hifWOmoAdqLju5HOEh
 udfXodFT/oYP6Ne/V+ISy9SODZGQPHtzHACZgv+EyAc4tCYChmMRIz9Cm
 1fqFWKGLX5wpSJG2r9Z11hv3BFdKMRkP31WHog7k9lnOlGzMRpx6WuLHZ
 IrI/qvPe/ZVauEvWElIbyUBQQujSHcteftI459dBKCv84u/gNvLZuJNqg
 F/Y8O3VWzeQzvBqgyemNvvY2VcSqHr/39mkqSW+dyukuX+HU8V4fAdzo2 g==;
X-CSE-ConnectionGUID: Ljb39t8gQf6rACltkDsIwg==
X-CSE-MsgGUID: EZp/8p92Tu+SuxazMr+bQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11387"; a="48338804"
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="48338804"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2025 11:12:03 -0700
X-CSE-ConnectionGUID: F/v8zH5qSNS+dukItWcnPg==
X-CSE-MsgGUID: mHF3HFvpRDOL4zmZj/PSFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,284,1736841600"; d="scan'208";a="130616366"
Received: from gkczarna.igk.intel.com ([10.211.131.163])
 by fmviesa004.fm.intel.com with ESMTP; 28 Mar 2025 11:12:02 -0700
From: Tomasz Lis <tomasz.lis@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 =?UTF-8?q?Micha=C5=82=20Wajdeczko?= <michal.wajdeczko@intel.com>,
 =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
Subject: [PATCH v5 0/4] drm/xe/vf: Post-migration recovery of GGTT nodes and
 CTB
Date: Fri, 28 Mar 2025 19:11:56 +0100
Message-Id: <20250328181200.1011623-1-tomasz.lis@intel.com>
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

Tomasz Lis (4):
  drm/xe/vf: Divide ballooning into allocation and insertion
  drm/xe/sriov: Shifting GGTT area post migration
  drm/xe/guc: Introduce enum with offsets for multi-LRC register H2G
  drm/xe/vf: Fixup CTB send buffer messages after migration

 drivers/gpu/drm/xe/abi/guc_actions_abi.h  |   7 +
 drivers/gpu/drm/xe/xe_ggtt.c              |  40 +++++-
 drivers/gpu/drm/xe/xe_ggtt.h              |   3 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf.c       | 148 +++++++++++++++++++---
 drivers/gpu/drm/xe/xe_gt_sriov_vf.h       |   1 +
 drivers/gpu/drm/xe/xe_gt_sriov_vf_types.h |   2 +
 drivers/gpu/drm/xe/xe_guc_ct.c            | 142 +++++++++++++++++++++
 drivers/gpu/drm/xe/xe_guc_ct.h            |   2 +
 drivers/gpu/drm/xe/xe_guc_submit.c        |   4 +
 drivers/gpu/drm/xe/xe_sriov_vf.c          |  42 ++++++
 10 files changed, 369 insertions(+), 22 deletions(-)

-- 
2.25.1

