Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00E9D9CD670
	for <lists+dri-devel@lfdr.de>; Fri, 15 Nov 2024 06:09:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 955D210E1B5;
	Fri, 15 Nov 2024 05:09:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="mW9AuVRt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3367210E135;
 Fri, 15 Nov 2024 05:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1731647356; x=1763183356;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=DtjueZ1kEM02DSnOL5sjuLn8kHGCGGvAGc0lNOlBZT0=;
 b=mW9AuVRtFp31VecqTh3Nw+xOZlQE7b403wnVCdf4Zuyes19MI3RGf2er
 z4XUx+sMBju94W0J0TdKZtUERw4R93FVWP3q8qe5WXH8+okWXrxIPNlEU
 CS7L3vWYIWzVCu3cfgV8l9XdceGjmgs3vWLJwztXjCwXhAt9w7/0qqrer
 ZSSbmYMw87+v3LPkW4xe/yNxnh0HrhXf2Lm86K12N50jgIu7btW/psTu4
 +WWifNWmdBb6Yo3PsYAVkKZnech57DWJ/KsvojvCO7ajvYbmzCUnrO8+S
 on4YXR7e9vxDSvgSZJMaIm12s58qVDmahJ4FOPuO2bKR2tSg7XeWqxr4U w==;
X-CSE-ConnectionGUID: Wjm2iFjbRCihUmk1GY03Tw==
X-CSE-MsgGUID: z4a4kqz8SnyCy/c7GJ4YKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11256"; a="31023899"
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="31023899"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Nov 2024 21:09:16 -0800
X-CSE-ConnectionGUID: 7s6X5phrTG2E3S5ONQsJQg==
X-CSE-MsgGUID: T9AAGJNpSny++RvycJYnBw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,155,1728975600"; d="scan'208";a="92493525"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa003.fm.intel.com with ESMTP; 14 Nov 2024 21:09:10 -0800
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 rodrigo.vivi@intel.com, jani.nikula@linux.intel.com,
 andriy.shevchenko@linux.intel.com, lina@asahilina.net,
 michal.wajdeczko@intel.com, christian.koenig@amd.com
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 aravind.iddamsetty@linux.intel.com, anshuman.gupta@intel.com,
 alexander.deucher@amd.com, andrealmeid@igalia.com,
 amd-gfx@lists.freedesktop.org, kernel-dev@igalia.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v9 0/4] Introduce DRM device wedged event
Date: Fri, 15 Nov 2024 10:37:29 +0530
Message-Id: <20241115050733.806934-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
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

This series introduces device wedged event in DRM subsystem and uses
it in xe and i915 drivers. Detailed description in commit message.

This was earlier attempted as xe specific uevent in v1 and v2.
https://patchwork.freedesktop.org/series/136909/

Similar work by André Almeida.
https://lore.kernel.org/dri-devel/20221125175203.52481-1-andrealmeid@igalia.com/

v2: Change authorship to Himal (Aravind)
    Add uevent for all device wedged cases (Aravind)

v3: Generic re-implementation in DRM subsystem (Lucas)

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
    Provide 'none' method for reset cases (Christian)
    Provide recovery opts using switch cases

Raag Jadav (4):
  drm: Introduce device wedged event
  drm/doc: Document device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 Documentation/gpu/drm-uapi.rst        | 102 +++++++++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c             |  63 ++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |   3 +
 drivers/gpu/drm/xe/xe_device.c        |   9 ++-
 include/drm/drm_device.h              |   8 ++
 include/drm/drm_drv.h                 |   1 +
 6 files changed, 181 insertions(+), 5 deletions(-)

-- 
2.34.1

