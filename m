Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B559A1B017
	for <lists+dri-devel@lfdr.de>; Fri, 24 Jan 2025 06:52:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8BE10E297;
	Fri, 24 Jan 2025 05:52:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="THC8E3V4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15DCF10E297;
 Fri, 24 Jan 2025 05:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1737697976; x=1769233976;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=1aAhLPBxVqQUfqvDc33T4FDKF2jbZ43wVpm4/0R/Aq4=;
 b=THC8E3V44W9Kt/icmxD9iU2Ct8CjGEm77CX8JbsHZRSWTz58+KYFqvV4
 O9KyMTBXf+BW6JYWQn/3JSZf8OOEQd7D9k8V0qA8cygHBTDfx3D41k0ml
 z2UoCsIgSIPgXQ69ZMjyJC7FQTkPNoWeiEYei58knH6gvSatt5mW+aAdi
 BsJPnLC/tCglZuo/1bULbcTTcsGWUcHZ6PgAhAsO/I5/ZQjOY1xORkmBZ
 PGoOwBtKn/itZxCxyomscr2jSJZuyGUwRmpgVVAr9e4nRBux79Qmks5Fk
 nBx+5uITicw/u9j5UhiTGr+lozaBW5gESYPF35I/gLZ94jOjq6owULE/J g==;
X-CSE-ConnectionGUID: k37zekdfQwenzcNfUR/FqA==
X-CSE-MsgGUID: jwG/CA+jSpGSbXNmNmaz3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11324"; a="60689136"
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="60689136"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jan 2025 21:52:56 -0800
X-CSE-ConnectionGUID: 1GFe2SzGTMWyJLoNggfQaA==
X-CSE-MsgGUID: 2nUXefpORP6plQIDxN+u0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,230,1732608000"; d="scan'208";a="108218631"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by fmviesa010.fm.intel.com with ESMTP; 23 Jan 2025 21:52:49 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, michal.wajdeczko@intel.com,
 christian.koenig@amd.com, xaver.hugl@kde.org
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 lina@asahilina.net, alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v11 0/5] Introduce DRM device wedged event
Date: Fri, 24 Jan 2025 11:22:55 +0530
Message-Id: <20250124055300.1111274-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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

This series introduces device wedged event in DRM subsystem and uses it
in xe, i915 and amdgpu drivers. Detailed description in commit message.

This was earlier attempted as xe specific uevent in v1 and v2 on [1].
Similar work by André Almeida on [2].
Wedged event support for amdgpu by André Almeida on [3].
Consumer implementation by Xaver Hugl on [4].

 [1] https://patchwork.freedesktop.org/series/136909/
 [2] https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/
 [3] https://lore.kernel.org/dri-devel/20241216162104.58241-1-andrealmeid@igalia.com/
 [4] https://invent.kde.org/plasma/kwin/-/merge_requests/7027

 v2: Change authorship to Himal (Aravind)
     Add uevent for all device wedged cases (Aravind)

 v3: Generic implementation in DRM subsystem (Lucas)

 v4: s/drm_dev_wedged/drm_dev_wedged_event
     Use drm_info() (Jani)
     Kernel doc adjustment (Aravind)
     Change authorship to Raag (Aravind)

 v5: Send recovery method with uevent (Lina)
     Expose supported recovery methods via sysfs (Lucas)

 v6: Access wedge_recovery_opts[] using helper function (Jani)
     Use snprintf() (Jani)

 v7: Convert recovery helpers into regular functions (Andy, Jani)
     Aesthetic adjustments (Andy)
     Handle invalid method cases
     Add documentation to drm-uapi.rst (Sima)

 v8: Drop sysfs and allow sending multiple methods with uevent (Lucas, Michal)
     Improve documentation (Christian, Rodrigo)
     static_assert() globally (Andy)

 v9: Document prerequisites section (Christian)
     Provide 'none' method for device reset (Christian)
     Provide recovery opts using switch cases

v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)

v11: Log device reset (André)
     Reference wedged event in device reset section (André)
     Wedged event support for amdgpu (André)

André Almeida (1):
  drm/amdgpu: Use device wedged event

Raag Jadav (4):
  drm: Introduce device wedged event
  drm/doc: Document device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 Documentation/gpu/drm-uapi.rst             | 112 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   4 +
 drivers/gpu/drm/drm_drv.c                  |  68 +++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c      |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   7 +-
 include/drm/drm_device.h                   |   8 ++
 include/drm/drm_drv.h                      |   1 +
 7 files changed, 199 insertions(+), 4 deletions(-)

-- 
2.34.1

