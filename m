Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C18AAEA00
	for <lists+dri-devel@lfdr.de>; Wed,  7 May 2025 20:50:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 58C2410E879;
	Wed,  7 May 2025 18:50:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="EHjcYysJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7902D10E02B;
 Wed,  7 May 2025 18:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746643820; x=1778179820;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Z5RZiHFbwcU5xv1L9+wla7L750GbOst3LBv8xCb8PPQ=;
 b=EHjcYysJ04QAJdztcbpPPnDDPqGQ+rSvfp+W27QKG2bGrcnTWtcQ+pW0
 MAIGB1mzoWBQUyTyceApiECYwfKRFtVrf2eHG3woKn7fvSshzgDkNtlVA
 o6esPvpS53y4EDx5y3xxTuK+HSzBU12tOXpmCcEjFQIqqJ+nYE8pRCCKh
 Gdf4ObDWftMmMT97wY1sZd97QQUGgaAOh/IkBzFDVm+qUpedYO1jhiCZN
 P8OkR4pSfoa2i390p7aSFdxDneCKqz6VdStJWJKnYCro5aacbfR7gaSQg
 fbKDlUPDo+smyIdt1Opuang6JZskUgZvmfPDUXCk53ZAZZuhoZaens6vH g==;
X-CSE-ConnectionGUID: LdYO2m8aQnqt2nP0GK/HNA==
X-CSE-MsgGUID: sG0oFZJiTIeg4k+9NGqQSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11426"; a="48299890"
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="48299890"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 11:50:19 -0700
X-CSE-ConnectionGUID: Zs7W1rxZQ/uAzpZZKT17KA==
X-CSE-MsgGUID: WTgLJjXATsKIna6f92YdOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,270,1739865600"; d="scan'208";a="135753370"
Received: from dut4036ptlh.fm.intel.com ([10.105.8.54])
 by orviesa009-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 May 2025 11:50:18 -0700
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, john.c.harrison@intel.com,
 ivan.briano@intel.com, matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v25 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Wed,  7 May 2025 18:50:11 +0000
Message-ID: <20250507185017.251360-1-jonathan.cavitt@intel.com>
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
50 seen faults.  Only pagefaults are saved this way currently, though in
the future, all faults should be tracked by the VM for future reporting.

Additionally, of the pagefaults reported, only failed pagefaults are
saved this way, as successful pagefaults should recover silently and not
need to be reported to userspace.

To allow userspace to access these faults, a new ioctl -
xe_vm_get_property_ioct - was created.

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

v7:
- Avoid unnecessary execution by checking MAX_PFS earlier (jcavitt)
- Fix double-locking error (jcavitt)
- Assert kmemdump is successful (Shuicheng)
- Repair and move fill_faults break condition (Dan Carpenter)
- Free vm after use (jcavitt)
- Combine assertions (jcavitt)
- Expand size check in xe_vm_get_faults_ioctl (jcavitt)
- Remove return mask from fill_faults, as return is already -EFAULT or 0
  (jcavitt)

v8:
- Revert back to using drm_xe_vm_get_property_ioctl
- s/Migrate/Move (Michal)
- s/xe_pagefault/xe_gt_pagefault (Michal)
- Create new header file, xe_gt_pagefault_types.h (Michal)
- Add and fix kernel docs (Michal)
- Rename xe_vm.pfs to xe_vm.faults (jcavitt)
- Store fault data and not pagefault in xe_vm faults list (jcavitt)
- Store address, address type, and address precision per fault (jcavitt)
- Store engine class and instance data per fault (Jianxun)
- Properly handle kzalloc error (Michal W)
- s/MAX_PFS/MAX_FAULTS_SAVED_PER_VM (Michal W)
- Store fault level per fault (Micahl M)
- Apply better copy_to_user logic (jcavitt)

v9:
- More kernel doc fixes (Michal W, Jianxun)
- Better error handling (jcavitt)

v10:
- Convert enums to defines in regs folder (Michal W)
- Move xe_guc_pagefault_desc to regs folder (Michal W)
- Future-proof size logic for zero-size properties (jcavitt)
- Replace address type extern with access type (Jianxun)
- Add fault type to xe_drm_fault (Jianxun)

v11:
- Remove unnecessary switch case logic (Raag)
- Compress size get, size validation, and property fill functions into a
  single helper function (jcavitt)
- Assert valid size (jcavitt)
- Store pagefaults in non-fault-mode VMs as well (Jianxun)

v12:
- Remove unnecessary else condition
- Correct backwards helper function size logic (jcavitt)
- Fix kernel docs and comments (Michal W)

v13:
- Move xe and user engine class mapping arrays to header (John H)

v14:
- Fix double locking issue (Jianxun)
- Use size_t instead of int (Raag)
- Remove unnecessary includes (jcavitt)

v15:
- Do not report faults from reserved engines (Jianxun)

v16:
- Remove engine class and instance (Ivan)

v17:
- Map access type, fault type, and fault level to user macros (Matt
  Brost, Ivan)

v18:
- Add uAPI merge request to this cover letter

v19:
- Perform kzalloc outside of lock (Auld)

v20:
- Fix inconsistent use of whitespace in defines

v21:
- Remove unnecessary size assertion (jcavitt)

v22:
- Fix xe_vm_fault_entry kernel docs (Shuicheng)

v23:
- Nit fixes (Matt Brost)

v24:
- s/xe_pagefault_desc.h/xe_guc_pagefault_desc.h (Dafna)
- Move PF_MSG_LEN_DW to regs folder (Dafna)

v25:
- Revert changes from last revision (John H)
- Add missing bspec (Michal W)

uAPI: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/32987
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Reviewed-by: Shuicheng Lin <shuicheng.lin@intel.com>
Acked-by: Matthew Brost <matthew.brost@intel.com>
Cc: Zhang Jianxun <jianxun.zhang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>

Jonathan Cavitt (5):
  drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
  drm/xe/xe_gt_pagefault: Move pagefault struct to header
  drm/xe/uapi: Define drm_xe_vm_get_property
  drm/xe/xe_vm: Add per VM fault info
  drm/xe/xe_vm: Implement xe_vm_get_property_ioctl

 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h |  49 +++++
 drivers/gpu/drm/xe/xe_device.c              |   2 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c        |  72 +++----
 drivers/gpu/drm/xe/xe_gt_pagefault_types.h  |  42 +++++
 drivers/gpu/drm/xe/xe_guc_fwif.h            |  28 ---
 drivers/gpu/drm/xe/xe_vm.c                  | 196 ++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h                  |  11 ++
 drivers/gpu/drm/xe/xe_vm_types.h            |  29 +++
 include/uapi/drm/xe_drm.h                   |  86 +++++++++
 9 files changed, 454 insertions(+), 61 deletions(-)
 create mode 100644 drivers/gpu/drm/xe/regs/xe_pagefault_desc.h
 create mode 100644 drivers/gpu/drm/xe/xe_gt_pagefault_types.h

-- 
2.43.0

