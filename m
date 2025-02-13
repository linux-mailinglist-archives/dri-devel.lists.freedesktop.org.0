Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADE77A34EAE
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 20:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFCDF10EB90;
	Thu, 13 Feb 2025 19:51:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Fc4HwlaC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7662310EB88;
 Thu, 13 Feb 2025 19:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739476300; x=1771012300;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=u8QOcsW1hKMXTPqtEYEs/RVOSbNc5kuUGyIb/eGUYNQ=;
 b=Fc4HwlaCY9KFO8RW0rbQ96uKzgk4aVsWPnL3enrOPVk6AhSSwrC3BCTY
 Cy0+orPNUH7swdcLmI2tAieIFgcXSnSLCBmeEQEdXrm5+lozIZKI35s/o
 Q7UcgzaKrGlD+6Eoce1hwgoXqie216W3nPemjesRS5jAoqrdjx26hGQu2
 Y+b61N9RqqkDZQ7v+VakY04EcEkRhD53QZbyZdbO8BNk+JjSAjiIv97xj
 ued0J62r0V/yvezZyVFfjsvr1SVK6nyaVxML6kNDyd5MdzAam7TvRgoKC
 daVx6rA0b7FRqP0ETG27PMHcBZcztP/+pm0CNWh0maqrDNOCe872KDech g==;
X-CSE-ConnectionGUID: 5o/6RiJATZqq73UT2//Hvg==
X-CSE-MsgGUID: FtrBr6WhT9S3n0mf5ECm2Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11344"; a="40354744"
X-IronPort-AV: E=Sophos;i="6.13,282,1732608000"; d="scan'208";a="40354744"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Feb 2025 11:51:40 -0800
X-CSE-ConnectionGUID: NT4XNycPRS+vsKZet6mRrQ==
X-CSE-MsgGUID: B0HFBQuUThGndtxI3QjsNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="117372205"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by fmviesa003.fm.intel.com with ESMTP; 13 Feb 2025 11:51:40 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v8 0/6] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Thu, 13 Feb 2025 11:51:33 -0800
Message-Id: <20250213195139.3396082-1-alan.previn.teres.alexis@intel.com>
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
 drivers/gpu/drm/xe/xe_guc_capture.c           | 397 ++++++++----------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  16 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  57 +++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  12 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 114 +++--
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
 9 files changed, 353 insertions(+), 273 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h


base-commit: b7446752e5d3de98bf26b5d3a7ca4fe9165ec779
-- 
2.34.1

