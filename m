Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42981A57506
	for <lists+dri-devel@lfdr.de>; Fri,  7 Mar 2025 23:41:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF90410EC4E;
	Fri,  7 Mar 2025 22:41:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gJzXbhA4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B09110EC4E;
 Fri,  7 Mar 2025 22:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741387287; x=1772923287;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Q2VrzIsEopJ0tB5LmTb+g2gAfhk2EAvRADj/heJ59rs=;
 b=gJzXbhA4WotKQmb3Kjg6/eAPPFHuxJcJvIC4ojgneScq1R7mYWtOi/lT
 zVmH6GAc/jV9JFICv12BGWMi2Dk3tCXPOpAsqxnodnSRUfFLIFeFBWhbC
 FmAYQmpviA/LdiXRA4pdhYc/XDCWwiYZjqPTG4t0pIWCO+A1ZTtMlDo6P
 7OidwgXELu6CWDpttT9K3EUbn2PTgc14Ifkkx98EYBlVKytd+H8ps8JML
 lOD68jtGyYJUWQ0wZALKsTcvhik7jCmHzrzi0fqUsERzCezzsoFIVLPbD
 I5nKvzcI6ILuCJYytc0Ky118Mszu6sHWb7+u42qSy7yAScqr7hRUdA9L7 w==;
X-CSE-ConnectionGUID: gZhm3VbQQWuMX4EFu5LECw==
X-CSE-MsgGUID: eLhhM96SSnK0H5UaW7+13w==
X-IronPort-AV: E=McAfee;i="6700,10204,11366"; a="41704512"
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="41704512"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:26 -0800
X-CSE-ConnectionGUID: ZXkAg5utTcC9UJ0YTEXTaA==
X-CSE-MsgGUID: GRZwvtcvSgaCkZU1OkUthg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,230,1736841600"; d="scan'208";a="124457939"
Received: from dut4440lnl.fm.intel.com ([10.105.10.114])
 by orviesa004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2025 14:41:26 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v6 0/6] drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl
Date: Fri,  7 Mar 2025 22:41:18 +0000
Message-ID: <20250307224125.111430-1-jonathan.cavitt@intel.com>
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

Add additional information to each VM so they can report up to the first
50 seen pagefaults.  Only failed pagefaults are saved this way, as
successful pagefaults should recover and not need to be reported to
userspace.

Additionally, add a new ioctl - xe_vm_get_faults_ioctl - that allows the
user to query these pagefaults

v2: (Matt Brost)
- Break full ban list request into a separate property.
- Reformat drm_xe_vm_get_property struct.
- Remove need for drm_xe_faults helper struct.
- Separate data pointer and scalar return value in ioctl.
- Get address type on pagefault report and save it to the pagefault.
- Correctly reject writes to read-only VMAs.
- Miscellaneous formatting fixes.

v3: (Matt Brost)
- Only allow querying of failed pagefaults

v4:
- Remove unnecessary size parameter from helper function, as it
  is a property of the arguments. (jcavitt)
- Remove unnecessary copy_from_user (Jainxun)
- Set address_precision to 1 (Jainxun)
- Report max size instead of dynamic size for memory allocation
  purposes.  Total memory usage is reported separately.

v5:
- Return int from xe_vm_get_property_size (Shuicheng)
- Fix memory leak (Shuicheng)
- Remove unnecessary size variable (jcavitt)

v6:
- Free vm after use (Shuicheng)
- Compress pf copy logic (Shuicheng)
- Update fault_unsuccessful before storing (Shuicheng)
- Fix old struct name in comments (Shuicheng)
- Keep first 50 pagefaults instead of last 50 (Jianxun)
- Rename ioctl to xe_vm_get_faults_ioctl (jcavitt)

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>

Jonathan Cavitt (6):
  drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_vm: Add per VM pagefault info
  drm/xe/uapi: Define drm_xe_vm_get_faults
  drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
  drm/xe/xe_vm: Implement xe_vm_get_faults_ioctl

 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  64 +++++++-------
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  29 +++++++
 drivers/gpu/drm/xe/xe_vm.c           | 120 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |  20 +++++
 include/uapi/drm/xe_drm.h            |  49 +++++++++++
 7 files changed, 260 insertions(+), 33 deletions(-)

-- 
2.43.0

