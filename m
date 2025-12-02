Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06129C9D2DA
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 23:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5115D10E6F5;
	Tue,  2 Dec 2025 22:12:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ERg00DSm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BDB410E6F3;
 Tue,  2 Dec 2025 22:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1764713544; x=1796249544;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qQn3Jj4fzrWPDxYZrjCusT2Ry9UvqgpIfQdB3xfWIGo=;
 b=ERg00DSm8dEOtrV1WdIImOkQq7QV9X6JYGqEyjv+TpVFXjjnVXvD5BsA
 aATsoLakI5Xu3+km7D4wtkJkL0CzEUbH6mu+u6oMexgcLjaWm4hUZNJxw
 AMAE/2jQ2LUr8BiZKTL0SP+3m/wCEvwFHl9F50r2maE+9S5h5TOW2Kpej
 RpnYVyFYl6vF5m7pp0HZUHyu7QJGtcTH6NEyy9aqTMyaEqSl54oc8BtoF
 HhCdh/YEbZku0Hvvrbw7x2xD+3RH9hAIK2aI/4wACjrubQ1SyK90/rP3b
 09oVEBbJN+cMwDeiUWJdQ/VoaRJFliNqsiTwb9aF+IibZiI23Ky7Py9/u w==;
X-CSE-ConnectionGUID: W7Zs+X7PRE2iMZkRq8Hu7A==
X-CSE-MsgGUID: xNhYQwUvQ6SV42A1aGj+Dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11631"; a="84096315"
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="84096315"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:12:24 -0800
X-CSE-ConnectionGUID: CFirNPMATWqofd2p9uorPA==
X-CSE-MsgGUID: iDRDHe3YQJytA2hoqKpZ1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,244,1758610800"; d="scan'208";a="194490324"
Received: from dut4086lnl.fm.intel.com ([10.105.10.149])
 by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Dec 2025 14:12:24 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org, Michal.Wajdeczko@intel.com,
 michal.mrozek@intel.com, raag.jadav@intel.com, ivan.briano@intel.com,
 matthew.auld@intel.com, dafna.hirschfeld@intel.com
Subject: [PATCH v30 0/5] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Tue,  2 Dec 2025 22:12:22 +0000
Message-ID: <20251202221221.106060-7-jonathan.cavitt@intel.com>
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

v26:
- Rebase and refactor on top of latest change to xe_pagefault layer
  (jcavitt)

v27:
- Apply max line length (Matt Brost)
- Correctly ignore fault mode in save_pagefault_to_vm (jcavitt)

v28:
- Do not copy_to_user in critical section (Matt Brost)
- Assert args->size is multiple of sizeof(struct xe_vm_fault) (Matt
  Brost)
- s/save_pagefault_to_vm/xe_pagefault_save_to_vm (Matt Brost)
- Use guard instead of spin_lock/unlock (Matt Brost)
- GT was added to xe_pagefault struct.  Use xe_gt_hw_engine
  instead of creating a new helper function (Matt Brost)

v29:
- Track address precision separately and report it accurately (Matt
  Brost)
- Remove unnecessary memset (Matt Brost)

v30:
- Keep u8 values together (Matt Brost)

uAPI: TBD
Signed-off-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
Cc: Zhang Jianxun <jianxun.zhang@intel.com>
Cc: Shuicheng Lin <shuicheng.lin@intel.com>
Cc: Michal Wajdeczko <Michal.Wajdeczko@intel.com>
Cc: Michal Mrozek <michal.mrozek@intel.com>
Cc: Raag Jadav <raag.jadav@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
Cc: Ivan Briano <ivan.briano@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Dafna Hirschfeld <dafna.hirschfeld@intel.com>

Jonathan Cavitt (5):
  drm/xe/xe_pagefault: Disallow writes to read-only VMAs
  drm/xe/xe_pagefault: Track address precision per pagefault
  drm/xe/uapi: Define drm_xe_vm_get_property
  drm/xe/xe_vm: Add per VM fault info
  drm/xe/xe_vm: Implement xe_vm_get_property_ioctl

 drivers/gpu/drm/xe/xe_device.c          |   2 +
 drivers/gpu/drm/xe/xe_guc_pagefault.c   |   1 +
 drivers/gpu/drm/xe/xe_pagefault.c       |  34 +++++
 drivers/gpu/drm/xe/xe_pagefault_types.h |   8 +-
 drivers/gpu/drm/xe/xe_vm.c              | 184 ++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h              |  12 ++
 drivers/gpu/drm/xe/xe_vm_types.h        |  29 ++++
 include/uapi/drm/xe_drm.h               |  86 +++++++++++
 8 files changed, 355 insertions(+), 1 deletion(-)

-- 
2.43.0

