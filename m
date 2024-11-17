Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BDDA9D0537
	for <lists+dri-devel@lfdr.de>; Sun, 17 Nov 2024 19:44:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23CCB10E1A1;
	Sun, 17 Nov 2024 18:44:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Gbh0tE02";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3327210E1A1;
 Sun, 17 Nov 2024 18:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731869041; x=1763405041;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ckKkBx62Djh6yT47FZqSCfKqYxEwIg1mfsy55ZPvKI0=;
 b=Gbh0tE02+WFTft52iC1UnaiBcgWf0JsDOHujwct7L6xA0Tyl9+/eXdgU
 O3uGrKSCXtXDRItu9tUenJEhHtoQvl9dkVo17UCcMCbhmFd00GPPpagJC
 wOKYkd/JldRxFv37IY6duFEXcUyXTcTmXnyV6uZsGBDao/d4OWxWbLyDj
 vU54B3Le6zo3eBh0a6p0+pNrqi5+AA6UwlIrcZCNBLYgXR5DybgAZOXTV
 p4sS1LV35+tKwCD0FdzJ2ruNub04VoR9mz9sn+3qTSm9uGwetLqYb09Q8
 uHZMdn+USwN/e9DnvUdd5ERa2YwYwNpc24Y12usrS5YSINCyC03GrPRMQ g==;
X-CSE-ConnectionGUID: TfeycUazTCyQBGW4BzUgOA==
X-CSE-MsgGUID: G5bg0IYVR6i8asxoi0iVvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11259"; a="43219642"
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; d="scan'208";a="43219642"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2024 10:44:00 -0800
X-CSE-ConnectionGUID: +vXfDj/qRzKUgvC+NX2xaw==
X-CSE-MsgGUID: trHElf7QR6eMOVi4gudZwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,162,1728975600"; d="scan'208";a="93485902"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa005.fm.intel.com with ESMTP; 17 Nov 2024 10:44:00 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>
Subject: [PATCH 0/1] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Sun, 17 Nov 2024 10:43:59 -0800
Message-Id: <20241117184400.2206120-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c           | 397 ++++++++----------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  10 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  68 +++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  21 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 117 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
 9 files changed, 353 insertions(+), 286 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h


base-commit: 2d4993e163401c81e138c6e0e6223752c2e90402
-- 
2.34.1

