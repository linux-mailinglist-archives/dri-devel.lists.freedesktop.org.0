Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A58EBA3C57E
	for <lists+dri-devel@lfdr.de>; Wed, 19 Feb 2025 17:55:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 412E910E498;
	Wed, 19 Feb 2025 16:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BewL8Aj9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098010E050;
 Wed, 19 Feb 2025 16:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1739984153; x=1771520153;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9yxgusXRCdpQO/9//7pxpxTt4iTieeykrScMRHQvOc0=;
 b=BewL8Aj9Vg3w03tWr6UJ+uLN4EisA7+eGUZuykwwJjm8jLRwySB3k5/2
 Qsdk//O3KoIDuC+2TfL0M69sWV9AdMINVThOnYQo2oLOWoqX4aQiriDRC
 VIqFLeixmTMhiCOgwCbkHBHVwXqV8FChArdbde0exS2VReopAYCKTEjhJ
 xQ3z7utbIHZ77lX26+og3U5RchrBFu1alke4BRBmqV/onup/1UL2HhEF5
 /U5ociVKP+9LDEEqK+ybtFQYOGY9VbBo9MTuUlco4vBo6jhR8MgD56rmV
 DOscNbZ4KLXyltClqKHslHWsAwzDFSVqm29DtK0h3tYR2uYpT1i1MlqQX Q==;
X-CSE-ConnectionGUID: jFUlnU4KSnGm1dZZVlkg0Q==
X-CSE-MsgGUID: IRFinFpfSWanTK6qwXd14A==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40991877"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="40991877"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:55:45 -0800
X-CSE-ConnectionGUID: dAhqnFcOQBaLJIPE5yzgKA==
X-CSE-MsgGUID: PX5E8m/WRCmw7q5HEbDQkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; d="scan'208";a="114966318"
Received: from dut4410lnl.fm.intel.com ([10.105.8.78])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Feb 2025 08:23:40 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, tvrtko.ursulin@ursulin.net,
 lucas.demarchi@intel.com, matthew.brost@intel.com,
 dri-devel@lists.freedesktop.org, simona.vetter@ffwll.ch
Subject: [PATCH v3 0/6] drm/xe/xe_drm_client: Add per drm client reset stats
Date: Wed, 19 Feb 2025 16:23:34 +0000
Message-ID: <20250219162340.116499-1-jonathan.cavitt@intel.com>
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
relevant exec queues to have been banned on it, as well as the last
pagefault seen when said exec queues were banned. Since we cannot
reasonably associate a pagefault to a specific exec queue, we currently
report the last seen pagefault on the associated hw engine instead.

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

Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@ursulin.net>
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

 drivers/gpu/drm/xe/xe_drm_client.c       |  66 ++++++++++++++
 drivers/gpu/drm/xe/xe_drm_client.h       |  44 +++++++++
 drivers/gpu/drm/xe/xe_exec_queue.c       |   8 ++
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  46 ++++------
 drivers/gpu/drm/xe/xe_gt_pagefault.h     |  28 ++++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |  19 ++++
 drivers/gpu/drm/xe/xe_hw_engine.c        |   4 +
 drivers/gpu/drm/xe/xe_hw_engine_types.h  |   8 ++
 drivers/gpu/drm/xe/xe_query.c            | 109 ++++++++++++++++++++---
 include/uapi/drm/xe_drm.h                |  50 +++++++++++
 11 files changed, 345 insertions(+), 39 deletions(-)

-- 
2.43.0

