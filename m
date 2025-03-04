Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 535F1A4E7B1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Mar 2025 18:09:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4961610E673;
	Tue,  4 Mar 2025 17:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bXZpyEgl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F3E410E66E;
 Tue,  4 Mar 2025 17:08:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1741108138; x=1772644138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=7F4btVf6rwoedtAbvQIxDDlY/wgbQS2o2liOJKTpWPo=;
 b=bXZpyEgldSta54mGKgb2A9s09+V6seFDNzL6YcFEXCCyZ9WSIIba/sxG
 ykcYZQUY0vfGkWFDx55WX2NguJA79PKWulDwCMp/nwsSbj4N+sfikOMeI
 ZIkdkwbdxYjwxkMbSk+7kc6OIXZS2H8pMgP6/9Ox/4+zaEBNj3f1+crUr
 /82Yk8vNxpCizX8EgsRpfAV6VFadOiEnUk6vXPDIzm3Rt6MbBSe3+dNJr
 BXDu6a44BA6QDTf3volkdaKfgs6C9VgLO8AE/+8CVClQbPP2xEwTBQzp1
 LCF0gFUuq4hhNJWRctPWHjGhaIbyIkqY2jPurG0wP+fxdcrkHxWJKAJWK Q==;
X-CSE-ConnectionGUID: 2Tf6FswwSgOSB+JP5lB6iA==
X-CSE-MsgGUID: I6UzsvgkScyevxyAOtkNJQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="44847569"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="44847569"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:57 -0800
X-CSE-ConnectionGUID: 8XfHVVNYRjqqK9/RibUQ/g==
X-CSE-MsgGUID: N0JQmnB7R9aW9yOjBjMwTQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; d="scan'208";a="123036924"
Received: from dut4025lnl.fm.intel.com ([10.105.8.176])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Mar 2025 09:08:57 -0800
From: Jonathan Cavitt <jonathan.cavitt@intel.com>
To: intel-xe@lists.freedesktop.org
Cc: saurabhg.gupta@intel.com, alex.zuo@intel.com, jonathan.cavitt@intel.com,
 joonas.lahtinen@linux.intel.com, matthew.brost@intel.com,
 jianxun.zhang@intel.com, shuicheng.lin@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v5 0/6] drm/xe/xe_vm: Implement xe_vm_get_property_ioctl
Date: Tue,  4 Mar 2025 17:08:48 +0000
Message-ID: <20250304170854.67195-1-jonathan.cavitt@intel.com>
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

Add additional information to each VM so they can report up to the last
50 seen pagefaults.  Only failed pagefaults are saved this way, as
successful pagefaults should recover and not need to be reported to
userspace.

Additionally, add a new ioctl - xe_vm_get_property_ioctl - that allows the
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

Signed-off-by: Jonathan Cavitt <joanthan.cavitt@intel.com>
Suggested-by: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Suggested-by: Matthew Brost <matthew.brost@intel.com>
CC: Zhang Jianxun <jianxun.zhang@intel.com>
CC: Shuicheng Lin <shuicheng.lin@intel.com>

Jonathan Cavitt (6):
  drm/xe/xe_gt_pagefault: Disallow writes to read-only VMAs
  drm/xe/xe_gt_pagefault: Migrate pagefault struct to header
  drm/xe/xe_vm: Add per VM pagefault info
  drm/xe/uapi: Define drm_xe_vm_get_property
  drm/xe/xe_gt_pagefault: Add address_type field to pagefaults
  drm/xe/xe_vm: Implement xe_vm_get_property_ioctl

 drivers/gpu/drm/xe/xe_device.c       |   3 +
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  66 +++++++--------
 drivers/gpu/drm/xe/xe_gt_pagefault.h |  29 +++++++
 drivers/gpu/drm/xe/xe_vm.c           | 120 +++++++++++++++++++++++++++
 drivers/gpu/drm/xe/xe_vm.h           |   8 ++
 drivers/gpu/drm/xe/xe_vm_types.h     |  20 +++++
 include/uapi/drm/xe_drm.h            |  67 +++++++++++++++
 7 files changed, 279 insertions(+), 34 deletions(-)

-- 
2.43.0

