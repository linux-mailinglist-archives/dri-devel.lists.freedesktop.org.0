Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E7EA211B0
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jan 2025 19:36:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C79910E29A;
	Tue, 28 Jan 2025 18:36:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bb0SgMyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 075F210E1F1;
 Tue, 28 Jan 2025 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738089414; x=1769625414;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=2+Vb8fqcyPF0gs0vKC9+BhzoHWQMeZksE0QfWmWWVOE=;
 b=bb0SgMyYJ3ZW5k8hjHiO/oSfM3vuPRqilTSnLYS5dgZJ+0binnnogts5
 61ruw7luLF3ykoPl83PpMJ4UeA1OxTzQ+TloyjN5VJ1/NFQ0WRDdgNXqy
 zKpSNkKRbujpqkn4nq7k7ysOBo5aSpSHWjw/ohHoPydxGf+bNCCx6A0g6
 Ri8SzQFLCe+XAqJm4eBaOwUEkR50jG2ZlFSPWp3A6McDxQMh/31CRIJXJ
 FTw/chBK3alBFhX4QE3kgM6us5f9pUZQ6B6oJ4eIJclELoHQrnwBJOcR4
 dxdnQLP6h9e7yOf/ppR+kKZ5X3WTDFACRzckVdOT+eXnzxfBjWt9cKMVY g==;
X-CSE-ConnectionGUID: dC0yjDXVRjiq3Fc68MGozQ==
X-CSE-MsgGUID: /9ndefDNTbOJNB1lubBnWQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38288834"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; d="scan'208";a="38288834"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jan 2025 10:36:53 -0800
X-CSE-ConnectionGUID: 4/gH4oyLTh2UPUBDge32ow==
X-CSE-MsgGUID: mEdRZPrCTC2OULcjHLm5+A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="109735303"
Received: from aalteres-desk1.fm.intel.com ([10.1.39.140])
 by orviesa008.jf.intel.com with ESMTP; 28 Jan 2025 10:36:54 -0800
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <john.c.harrison@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Zhanjun Dong <zhanjun.dong@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v6 0/6] Maintenence of devcoredump <-> GuC-Err-Capture plumbing
Date: Tue, 28 Jan 2025 10:36:46 -0800
Message-Id: <20250128183653.4027915-1-alan.previn.teres.alexis@intel.com>
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
  drm/xe/xe_hw_engine: Update hw_engine_snapshot_capture for debugfs
  drm/xe/guc: Update comments on GuC-Err-Capture flows

 drivers/gpu/drm/xe/xe_devcoredump.c           |   3 -
 drivers/gpu/drm/xe/xe_devcoredump_types.h     |   6 -
 drivers/gpu/drm/xe/xe_guc_capture.c           | 365 ++++++++----------
 drivers/gpu/drm/xe/xe_guc_capture.h           |  16 +-
 .../drm/xe/xe_guc_capture_snapshot_types.h    |  53 +++
 drivers/gpu/drm/xe/xe_guc_submit.c            |  12 +-
 drivers/gpu/drm/xe/xe_hw_engine.c             | 111 ++++--
 drivers/gpu/drm/xe/xe_hw_engine.h             |   4 +-
 drivers/gpu/drm/xe/xe_hw_engine_types.h       |  13 +-
 9 files changed, 319 insertions(+), 264 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/xe_guc_capture_snapshot_types.h


base-commit: 8b47c9cdb6a78364fe68f8af0abfd6f265577001
-- 
2.34.1

