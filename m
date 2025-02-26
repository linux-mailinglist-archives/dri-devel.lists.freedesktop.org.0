Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D218BA46ED4
	for <lists+dri-devel@lfdr.de>; Wed, 26 Feb 2025 23:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA5710E9F6;
	Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="l8q34Ojh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE2710E00E;
 Wed, 26 Feb 2025 22:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740610559; x=1772146559;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=E+tSilRndu/vrtrPjMsd5nicJrsiF86C2woqNSJx7EQ=;
 b=l8q34OjhJHhX/7KG9iR1XrNG47ihXPERTlljXiEIjTLrNDX3UXuyFXTW
 QFPVJaAczKDA+/FauW85uF8SWLpxZXNp+sZnq4H1Jjx/pWxbGjrWNe9Za
 +UTmBprEgC89jAZCs9J5Ix3r9chUPOIKFmW9uSkSfjkFDI6druo77YRMs
 kVIf7tJQwCPAqAu0TREPDaCXRcLnY0YyKUXGH8vcdfUi/dTE0hPBl9B2v
 fCeEl68wBEY/PQGUOtG7swg6GS03rrw6LtF2hqi5guFjGS0eHgINRQfAV
 2DBl4zMRrxdyQwuPMeb0DXLQrBaXok8EEVNr3Jp2TT0L23+594vQ1eiBV g==;
X-CSE-ConnectionGUID: MXZowc3XTO2xh6+dYIekWg==
X-CSE-MsgGUID: HWPWzin8SnSrGdTuc+dQEw==
X-IronPort-AV: E=McAfee;i="6700,10204,11357"; a="44308772"
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="44308772"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
X-CSE-ConnectionGUID: sr6xh+kSQV+zZua3+xjkxQ==
X-CSE-MsgGUID: lHoATRJMSXCGBZAU7MG3+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,318,1732608000"; d="scan'208";a="117326764"
Received: from dut4025lnl.fm.intel.com ([10.105.10.92])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Feb 2025 14:55:58 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Wed, 26 Feb 2025 22:55:50 +0000
Message-ID: <20250226225557.133076-1-jonathan.cavitt@intel.com>
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

Add additional information to the xe_vm so it can report the last 50
relevant exec queues that have been banned on it, as well as the
associated pagefault address and address type that caused the ban when
applicable.  Since we cannot reasonably associate a pagefault to a
specific exec queue, whenever a CAT error causes an exec queue to become
banned, we blame the last seen pagefault on said exec queue.

The last pagefault seen per exec queue is saved to the xe_vm, and the
pagefault is updated when a new pagefault is reported or when the last
pagefault has been associated with an exec queue, whichever happens
first.  All new pagefault reports come from xe_gt_pagefault.

Also add a tracker that counts the number of times the VM has
experienced an engine reset.

Finally, add a new ioctl - xe_vm_get_property_ioctl - that allows the
user to query this additional information.

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>

Jonathan Cavitt (6):
  drm/xe/xe_gt_pagefault: Migrate lookup_vma to xe_vm.h
  drm/xe/xe_exec_queue: Add ID param to exec queue struct
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_vm: Add per VM pagefault info
  drm/xe/xe_vm: Add per VM reset stats
  drm/xe/xe_vm: Implement xe_vm_get_property_ioctl

 drivers/gpu/drm/xe/xe_device.c           |   2 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  82 ++++-------
 drivers/gpu/drm/xe/xe_gt_pagefault.h     |  28 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
 drivers/gpu/drm/xe/xe_vm.c               | 175 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h               |  32 +++++
 drivers/gpu/drm/xe/xe_vm_types.h         |  34 +++++
 include/uapi/drm/xe_drm.h                |  73 ++++++++++
 10 files changed, 381 insertions(+), 58 deletions(-)

-- 
2.43.0

