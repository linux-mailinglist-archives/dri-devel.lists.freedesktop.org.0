Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 615FF9E29DC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 18:47:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9D02610EAFE;
	Tue,  3 Dec 2024 17:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EM0+NzxM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D645010EAFC;
 Tue,  3 Dec 2024 17:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733248054; x=1764784054;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Az1khvg3xd5CQqKIXYiMTVFwcV65oFFhTZcYD70Igpg=;
 b=EM0+NzxMDOWR74C4sxiDJs+/djqdGr2RlZlf8iu6NnsX1Uq/3Gw6CMIF
 aR6rIAK1DZwLIv3bPOBTFGMJSAqvlCwfs3UhRWGNLHNh8ASn7KOcOHQUV
 WNF5WAvdffb/cyXytJQ99m95VgN+vuSWt/GOwhQOb/odUhbiXxFVMRuN8
 8vbZv5KRmDIwp8digPwBLdDFxDqAAZtJODU4UrpXmdQk/Ic9HX7JBFYTw
 0Gu8W7E+LYqmLZYcJj2aCkJGC9cI1UFHdrRLY4UMUiJKVLNY/HCpyFauT
 A49WU/YW/Hkaz3HnesaVt4TD+roZXT2eMak6q5mEQBtmjydV31g6nluEP g==;
X-CSE-ConnectionGUID: rV1IQg34TuOu50EcoIhOqQ==
X-CSE-MsgGUID: jRX6ElGtQgm5XLbpV3yXXg==
X-IronPort-AV: E=McAfee;i="6700,10204,11275"; a="33610799"
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="33610799"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Dec 2024 09:47:34 -0800
X-CSE-ConnectionGUID: KnlwlJtzTkO+R/BuiGrsRQ==
X-CSE-MsgGUID: yAjn6gJ0SG2umS+AmSA3OA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,205,1728975600"; d="scan'208";a="93856044"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa010.fm.intel.com with ESMTP; 03 Dec 2024 09:47:33 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v3 0/1] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Tue,  3 Dec 2024 09:47:31 -0800
Message-Id: <20241203174732.3232351-1-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.34.1
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

The GuC-Error-Capture is currently reaching into xe_devcoredump
structure to store its own place-holder snaphot to workaround
the race between G2H-Error-Capture-Notification vs Drm-Scheduler
triggering GuC-Submission-exec-queue-timeout/kill.

Part of that race workaround design included GuC-Error-Capture taking
on some of the front-end functions for xe_hw_engine_snapshot
generation because of the orthogonal debugfs for raw dumps of engine
registers without any job association. We want this to also be handled,
even if indirectly, by GuC-Error-Capture since there is a lot to manage
when it comes to reading and printing the register lists.

However, logically speaking, GuC-Error-Capture node management,
despite being the majority of an engine-snapshot work, is still
a subset of xe_hw_engine_snapshot.

This series intends to re-design the plumbing for future
maintenence and scalability, rearranging the layering
back to what its should be (xe_devcoredump_snapshot owns
xe_hw_engine_snapshot owns xe_guc_capture_snapshot)..

Alan Previn (1):
  drm/xe/guc/capture: Maintenence of devcoredump <-> GuC-Err-Capture
    plumbing

 drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
 drivers/gpu/drm/xe/xe_guc_capture.c           | 406 ++++++++----------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 117 +++--
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
 9 files changed, 359 insertions(+), 289 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h


base-commit: 906c4b306e9340f6ffd6d44904ebc86e62e63627
-- 
2.34.1

