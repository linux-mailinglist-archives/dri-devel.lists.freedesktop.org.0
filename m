Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35198A26C6A
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 08:06:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073CF10E282;
	Tue,  4 Feb 2025 07:06:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="jmgEj052";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E4710E013;
 Tue,  4 Feb 2025 07:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738652767; x=1770188767;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=OCC8WR1aoShPnsgnkjsCWS0caR3ujjDfkysX06fn7nY=;
 b=jmgEj052vBCl3gyoyMd4nva5l1vBwqjvmM1bcMC0MfjMDa1c5wa8NdbF
 Ysm9rml6/O/6i3xQHdfuwWV5l+GbpBs8oL0JVZ0BWQU4e2EQ1YJY8j3EP
 ctkJ5ynBMAQgGMvcZfujBW2wGDKqLubkrp3nVbxaOCXCyzLgFRelKjsSZ
 2w8TUoHIB+lnFVPSLgqOXbBBGgjdNy2JQDZ46ZDfzUm/MKyrmZrm8is7A
 i5j+TJUj+/KkaxNKtO2ssLqsafDsgGl4wzFB2/0flm09+v8x2ObFH8q4z
 kU7b1tU9+r5TpMANewh339QFhqeSEFCv9H4JN0lJ05RnmCM5lI7C3EAkC Q==;
X-CSE-ConnectionGUID: avW9jQVuSV6rIGOXKozGpw==
X-CSE-MsgGUID: 3yIfvyD+T0eLGqw6wV/Iaw==
X-IronPort-AV: E=McAfee;i="6700,10204,11335"; a="39196770"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; d="scan'208";a="39196770"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2025 23:06:06 -0800
X-CSE-ConnectionGUID: dYklVg4ARKiITPqXoSrvbQ==
X-CSE-MsgGUID: fBBuzd/cRGKo7vUMX90dsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="110974710"
Received: from jraag-z790m-itx-wifi.iind.intel.com ([10.190.239.23])
 by orviesa007.jf.intel.com with ESMTP; 03 Feb 2025 23:05:59 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 christian.koenig@amd.com, alexander.deucher@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com, xaver.hugl@kde.org,
 pekka.paalanen@haloniitty.fi, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v12 0/5] Introduce DRM device wedged event
Date: Tue,  4 Feb 2025 12:35:23 +0530
Message-Id: <20250204070528.1919158-1-raag.jadav@intel.com>
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
     Handle invalid recovery method
     Add documentation to drm-uapi.rst (Sima)

 v8: Drop sysfs and allow sending multiple methods with uevent (Lucas, Michal)
     Improve documentation (Christian, Rodrigo)
     static_assert() globally (Andy)

 v9: Document prerequisites section (Christian)
     Provide 'none' method for device reset (Christian)
     Provide recovery opts using switch cases

v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)

v11: Log device reset (André)
     Reference wedged event in device reset chapter (André)
     Wedged event support for amdgpu (André)

v12: Refine consumer expectations and terminologies (Xaver, Pekka)

André Almeida (1):
  drm/amdgpu: Use device wedged event

Raag Jadav (4):
  drm: Introduce device wedged event
  drm/doc: Document device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 Documentation/gpu/drm-uapi.rst             | 116 ++++++++++++++++++++-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   4 +
 drivers/gpu/drm/drm_drv.c                  |  68 ++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c      |   3 +
 drivers/gpu/drm/xe/xe_device.c             |   7 +-
 include/drm/drm_device.h                   |   8 ++
 include/drm/drm_drv.h                      |   1 +
 7 files changed, 203 insertions(+), 4 deletions(-)

-- 
2.34.1

