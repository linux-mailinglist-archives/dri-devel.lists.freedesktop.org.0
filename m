Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C71EA2FE77
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2025 00:33:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C3110E406;
	Mon, 10 Feb 2025 23:33:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dw2Mu8yO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C69E10E403;
 Mon, 10 Feb 2025 23:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739230431; x=1770766431;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=pKZfcSXZz1LHloS5JqOaUcbkQACwbz0pY4O+dFvJlUQ=;
 b=dw2Mu8yOYallrDo7yX4J7IC3xyYOO70SuMCjG0/iunNqDxOpchpZjYxP
 EqOvlRXQNTlfOavKtda7legz0PgmPHavWbM3pzVjV60iKimpG8xEsJ1ul
 pziO6bBsYijtlKn/uhywdxUuPfoU8vCQ177cGm1XBUEmyGunjgNNQG32s
 jfLwJrzQwPKdHI4u5fvwztjvz2eC7k6I86SZqH1NbGgUpvoLJMQ+1PRlg
 QE1vg+Db9bGDY1TGWQ8sJcSxmfvSaEsfXtrgwT1TwsF8rSS1Ip3NlNW7G
 Og6xyIdxtURUPWxcdUqSWPN3gW/B+y6LbmOnoUN8T9KuTePVdkxktDWkh A==;
X-CSE-ConnectionGUID: oODDyRmtQXeHttn7rlVBzQ==
X-CSE-MsgGUID: i/Avpq5JRoOtZbdPP6xB7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11341"; a="39853924"
X-IronPort-AV: E=Sophos;i="6.13,275,1732608000"; d="scan'208";a="39853924"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2025 15:33:50 -0800
X-CSE-ConnectionGUID: gAcNfw5BQbuGZs9pn8n/AA==
X-CSE-MsgGUID: O5EN2ZIYTHi8mY8xHUlXcQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="117252439"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa003.jf.intel.com with ESMTP; 10 Feb 2025 15:32:55 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v7 0/6] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Mon, 10 Feb 2025 15:32:48 -0800
Message-Id: <20250210233254.419587-1-alan.previn.teres.alexis@intel.com>
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
structure to store its own place-holder snaphot-ptr to workaround
the race between G2H-Error-Capture-Notification vs Drm-Scheduler
triggering GuC-Submission-exec-queue-timeout/kill.

From a subsystem layering perspective, this isn't scalable as
GuC should not be manipulating contents of a global structure it
does not own when responding to an unrelated thread / callstack.

Also, part of the earlier mentioned workaround includes the
GuC-Error-Capture taking on one of the front-end functions
for xe_hw_engine_snapshot generation because of an orthogonal
debugfs-caller requesting raw dumps of engine registers without
a job. This request is better handled by GuC-Error-Capture since
there is a lot to manage for reading and printing engine
register lists and we want to avoid duplicate code or tables.

However, logically speaking, the GuC-Error-Capture output node
is really a subset of xe_hw_engine_snapshot. This is irregardless
of the fact that the majority of an engine-snapshot is the
register dumps that only the GuC-Error-Capture can do.

That said, this series intends to refactor the plumbing between
Guc-Error-Capture and xe_devcoredump (including
xe_hw_engine_snapshot) to fix the layering for future
maintenence and scalability. This is done without changing
any functionality and IP-locality (i.e. GuC-Error-Capture still owns
the single point of engine register list definition and printing).
This series ensures 'xe_devcoredump_snapshot' owns
'xe_hw_engine_snapshot generation' and the latter owns
'xe_guc_capture_snapshot' retrieval (with GuC-Error-Capture
as its helper).

Alan Previn (6):
  drm/xe/guc: Rename __guc_capture_parsed_output
  drm/xe/guc: Don't store capture nodes in xe_devcoredump_snapshot
  drm/xe/guc: Split engine state print between xe_hw_engine vs
    xe_guc_capture
  drm/xe/guc: Move xe_hw_engine_snapshot creation back to xe_hw_engine.c
  drm/xe/xe_hw_engine: Update xe_hw_engine capture for debugfs/gt_reset
  drm/xe/guc: Update comments on GuC-Err-Capture flows

 drivers/gpu/drm/xe/xe_devcoredump.c           |   7 +-
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
 drivers/gpu/drm/xe/xe_guc_capture.c           | 381 ++++++++----------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  16 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  57 +++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  12 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 114 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
 9 files changed, 337 insertions(+), 273 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h


base-commit: f74fd53ba34551b7626193fb70c17226f06e9bf1
-- 
2.34.1

