Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5E85A3A8AF
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 21:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FF010E760;
	Tue, 18 Feb 2025 20:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jHi/FuwY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDD2810E11B;
 Tue, 18 Feb 2025 20:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739910268; x=1771446268;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=3T22sm1Dmq/Qqgij7OmpTMPnT0z8qP9AmHbaGdcDiag=;
 b=jHi/FuwYJc+scFPWqrk2pf/uf1V1NxKDgbntrOwrRrFPoS3g3y8khfxR
 4kUUh3hpgGzKt4UaD2nI1MrYy/8BWS0ssHm9TQrYMZ3V1Qkms8W85oIGt
 KxYEpAqar8ML1r+VKQi2XFs1VmMC0WhCBHuH2mRKswkWW/04lACc+h7Os
 NczfyrLySa0GbCOyFg+dARw41Mq1dGHRPbiLvGAO5U2jrM/LYMBcxfZHm
 J+WNZ/Tu/7VPP2AELz2AlIhdM/ME7SyIwVyP1f7S1/Sj9ago9CgG2353L
 zg90ZSZRWTdCHq1+ZvEf9iadKEwxCJxXS6sxEIesPudqutndZBmrrCjsZ A==;
X-CSE-ConnectionGUID: SDMN6cVYRlCDnGyca5m1hg==
X-CSE-MsgGUID: BRVF+/Q0R7yoKKKd6A1rKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="40836882"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="40836882"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:24:27 -0800
X-CSE-ConnectionGUID: r4SxEZs0TLC6fHqoI+xHug==
X-CSE-MsgGUID: lT1fOj2cR4uPDK3uxrQ+WA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,296,1732608000"; d="scan'208";a="114431705"
Received: from dut4066lnl.fm.intel.com ([10.105.8.64])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2025 12:24:28 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@linux.intel.com,
 lucas.demarch@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v2 0/6] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Tue, 18 Feb 2025 20:24:20 +0000
Message-ID: <20250218202426.103151-1-jonathan.cavitt@intel.com>
X-Mailer: git-send-email 2.43.0
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

Add additional information to drm client so it can report the last 50
exec queues to have been banned on it, as well as the last pagefault
seen when said exec queues were banned. Since we cannot reasonably
associate a pagefault to a specific exec queue, we currently report the
last seen pagefault on the associated hw engine instead.

The last pagefault seen per exec queue is saved to the hw engine, and the
pagefault is updated during the pagefault handling process in
xe_gt_pagefault. The last seen pagefault is reset when the engine is
reset because any future exec queue bans likely were not caused by said
pagefault after the reset.

Also add a tracker that counts the number of times the drm client has
experienced an engine reset.

Finally, add a new query to xe_query that reports these drm client reset
stats back to the user.

v2: Report the per drm client reset stats as a query, rather than
    coopting xe_drm_client_fdinfo (Joonas)

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
CC: Lucas de Marchi <lucas.demarch@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>

Jonathan Cavitt (6):
  drm/xe/xe_exec_queue: Add ID param to exec queue struct
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_drm_client: Add per drm client pagefault info
  drm/xe/xe_drm_client: Add per drm client reset stats
  drm/xe/xe_query: Pass drm file to query funcs
  drm/xe/xe_query: Add support for per-drm-client reset stat querying

 drivers/gpu/drm/xe/xe_drm_client.c       |  66 ++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h       |  44 ++++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   8 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  46 ++++------
 drivers/gpu/drm/xe/xe_gt_pagefault.h     |  28 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  19 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   8 ++
 drivers/gpu/drm/xe/xe_query.c            | 105 ++++++++++++++++++++---
 include/uapi/drm/xe_drm.h                |  50 +++++++++++
 11 files changed, 341 insertions(+), 39 deletions(-)

-- 
2.43.0

