Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ED7BA3E5F2
	for <lists+dri-devel@lfdr.de>; Thu, 20 Feb 2025 21:38:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC53510E9DB;
	Thu, 20 Feb 2025 20:38:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BTk+vW3d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A720B10E9DB;
 Thu, 20 Feb 2025 20:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740083914; x=1771619914;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ssWXtJOb5Z6yEXtqzg6ZUCrNxIL3yjIerpu8zB2LEJ0=;
 b=BTk+vW3dkfgkI52PETQFAZknHjgofwLZtdqxJCHlVdZC8BdNrKdWwFCd
 1JkUdq9FT0565U134z2SPbibeTBy9RqMgwUV7GxfETnv/HmS0lTGIP+e8
 5KJ+oGleEgI7KTfCnhPhO35ea0GAdESjm+FGqtZzVM2cZChrKlOoervNk
 hLP+HOZPQJU2ZS7JavDaFf1gtjTIAN/ObhwEju7TKd63jUegqB0EzSG3W
 CBKaJJmZsNw/pJ+ody7bl8DSNB7Dsh9orBNuUOLii1SJaljDqAKEN8TK7
 vPB6WOvaq4X5J7ub9HxNOZFkhbMIPCK8GZ4UfcEIEahnUxfYWOjpD2L3d A==;
X-CSE-ConnectionGUID: y2uTFJupRA20XlzdjuwbHw==
X-CSE-MsgGUID: uRmQOhFlQAO2VhGlxepQFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41097926"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; d="scan'208";a="41097926"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:34 -0800
X-CSE-ConnectionGUID: xkTUBnpRTOmxuJkPsOqa6w==
X-CSE-MsgGUID: XC1iBRBLTrueDuBdDDGVcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,302,1732608000"; d="scan'208";a="115100543"
Received: from dut4086lnl.fm.intel.com ([10.105.10.90])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Feb 2025 12:38:33 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@igalia.com,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v4 0/6] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Thu, 20 Feb 2025 20:38:26 +0000
Message-ID: <20250220203832.130430-1-jonathan.cavitt@intel.com>
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
v3: Report EOPNOTSUPP during the reset stats query if CONFIG_PROC_FS
    is not set in the kernel config, as it is required to trace the
    reset count and exec queue bans.
v4: Fix formatting and kzalloc during lock warnings

Test-with: 20250220203747.130371-1-jonathan.cavitt@intel.com

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
CC: Lucas de Marchi <lucas.demarchi@intel.com>
CC: Matthew Brost <matthew.brost@intel.com>
CC: Simona Vetter <simona.vetter@ffwll.ch>

Jonathan Cavitt (6):
  drm/xe/xe_exec_queue: Add ID param to exec queue struct
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_drm_client: Add per drm client pagefault info
  drm/xe/xe_drm_client: Add per drm client reset stats
  drm/xe/xe_query: Pass drm file to query funcs
  drm/xe/xe_query: Add support for per-drm-client reset stat querying

 drivers/gpu/drm/xe/xe_drm_client.c       |  68 ++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h       |  44 +++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   8 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  44 ++++-----
 drivers/gpu/drm/xe/xe_gt_pagefault.h     |  28 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  17 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   8 ++
 drivers/gpu/drm/xe/xe_query.c            | 109 ++++++++++++++++++++---
 include/uapi/drm/xe_drm.h                |  50 +++++++++++
 11 files changed, 343 insertions(+), 39 deletions(-)

-- 
2.43.0

