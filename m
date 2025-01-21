Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 471D6A18576
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 20:09:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19B3710E208;
	Tue, 21 Jan 2025 19:09:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bCqU7uSg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E3F1E10E1E5;
 Tue, 21 Jan 2025 19:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737486592; x=1769022592;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ir8vITTE14NnY6SjfeLLJ2Pq3IwiW93r+Ol2oIb8qlE=;
 b=bCqU7uSgzwOk91CLdmfH4Z7iTS9S7Hk3uhLaD12CB01Q+DFzY/yvFZSv
 0Yqz+gXmpoUBkyHQT/2L+ZWavZxx9UO20hnHHSZIzsTTf1Eoqlb2Fr1l6
 KYSFpOPKrNgNVTqmNfbYVzWbF8X0e5d7Q39k30FkQOwQqS3lRgmtwPmEM
 21u06livYxs147HP1VHggHq+sPgwCSWmIF23F9LD5mqeKsF7GyOvwGFNj
 gqL6+pfIc/N6jN/qDJMyLAX58/oF2HZZQ7TvMVto/KVMdVZg1qgnZ6V3R
 tg4M9o4JWaez/EKsE4gCByOmfYI28ahUivb3x/P1SLpnnGXK1CDTVTWFI A==;
X-CSE-ConnectionGUID: o58fUwEzSJG45IgRsvPIWg==
X-CSE-MsgGUID: 9UjjH1V2Qbq62fRUwJc0bA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37829971"
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="37829971"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Jan 2025 11:09:36 -0800
X-CSE-ConnectionGUID: 9+X/PtmKRy65tez70kKSNA==
X-CSE-MsgGUID: 7g/ENYp+SxiEYbsH2IEayQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,222,1732608000"; d="scan'208";a="111900880"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa004.jf.intel.com with ESMTP; 21 Jan 2025 11:09:36 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH v4 0/1] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Tue, 21 Jan 2025 11:09:34 -0800
Message-Id: <20250121190935.1984508-1-alan.previn.teres.alexis@intel.com>
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


base-commit: cfa9d40db8c30d894171010fe765d96e9bc6a47e
-- 
2.34.1

