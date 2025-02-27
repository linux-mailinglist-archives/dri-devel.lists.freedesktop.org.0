Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C9BDBA488B8
	for <lists+dri-devel@lfdr.de>; Thu, 27 Feb 2025 20:15:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 722EB10EB70;
	Thu, 27 Feb 2025 19:15:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q35ryyF2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92DBA10EB62;
 Thu, 27 Feb 2025 19:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1740683701; x=1772219701;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=KL8eKbS4BmvDqhkSIKPSkTdh/LV92A4BE3/UWjNNLZs=;
 b=Q35ryyF26im1PFhWJoxWoKJOVRENDFrf3qwoAap3Sks/gmIic6Wi3GLk
 uGiqGrgpyHj9lpFVQZhF+kFesbupCqAcmcuKRryIvXDs44XnkgflBYM0b
 4hLjel8b9T3svBklQt73i+iO5PTRiEgfBfQfnYOriQOGBnjn0EQAQJaii
 CjaNBYHGEwMMGgAHCv6co2awu+9e2wpBNHBt7h6TeP3sId/WgF7zUc4jP
 piMZHpJNWBzax+QbaPVnkb0D3C9oyg6o+Q+Rh4AZ9oZh9RAEs1zUqn98A
 irRCIUXvBAid1ZEruW2QCGw80Z0Tsk9qNDm5tNtFwqviryVKd1eVV7ryB A==;
X-CSE-ConnectionGUID: VLeUyz6VRY2R9eBKpWdgaA==
X-CSE-MsgGUID: UdpyLLcxQEWwgYgY+scdXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41850053"
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="41850053"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
X-CSE-ConnectionGUID: TOz4cVvPS0qEHTaBjMHSUA==
X-CSE-MsgGUID: kC9UuwHkRpKdOwTGcvs+lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,320,1732608000"; d="scan'208";a="117775278"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2025 11:15:00 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/8] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Thu, 27 Feb 2025 19:14:49 +0000
Message-ID: <20250227191457.84035-1-jonathan.cavitt@intel.com>
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

v2: (Matt Brost)
- Break full ban list request into a separate property.
- Reformat drm_xe_vm_get_property struct.
- Remove need for drm_xe_faults helper struct.
- Separate data pointer and scalar return value in ioctl.
- Get address type on pagefault report and save it to the pagefault.
- Correctly reject writes to read-only VMAs.
- Miscellaneous formatting fixes.

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>

Jonathan Cavitt (8):
  drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
  drm/xe/xe_exec_queue: Add ID param to exec queue struct
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_vm: Add per VM pagefault info
  drm/xe/xe_vm: Add per VM reset stats
  drm/xe/uapi: Define drm_xe_vm_get_property
  drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
  drm/xe/xe_vm: Implement xe_vm_get_property_ioctl

 drivers/gpu/drm/xe/xe_device.c           |   3 +
 drivers/gpu/drm/xe/xe_exec_queue.c       |   7 +
 drivers/gpu/drm/xe/xe_exec_queue_types.h |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c     |  65 ++++-----
 drivers/gpu/drm/xe/xe_gt_pagefault.h     |  29 ++++
 drivers/gpu/drm/xe/xe_guc_submit.c       |   4 +
 drivers/gpu/drm/xe/xe_vm.c               | 171 +++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h               |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h         |  34 +++++
 include/uapi/drm/xe_drm.h                |  67 +++++++++
 10 files changed, 356 insertions(+), 34 deletions(-)

-- 
2.43.0

