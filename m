Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 510B39AFD0A
	for <lists+dri-devel@lfdr.de>; Fri, 25 Oct 2024 10:48:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1AB910EA2D;
	Fri, 25 Oct 2024 08:48:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Rx45vCsx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 781DB10EA2C;
 Fri, 25 Oct 2024 08:48:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1729846136; x=1761382136;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HOrpC2uoJMmbO1MzoGJ6GQKp5hqOj/+01ny6zeG0vw0=;
 b=Rx45vCsxhfxIV/ZvdyZmTGKehs+HxjH75xcScWZDRo12XtOdoHm59+0L
 pjqDqKoaHLgwW+25NQgL4rPwcOiyzmKd0pbbxXfxU2aO2UsFZyOSdnSG3
 cXEDMRaeRB5W6NyILyeiiUUXaHgGwA27IraE6j3tJgyZhyZ7YDyLAwDwt
 5L1Pa14OyMrIqqm1jDXIj7xIi+g0Ao2a49JmP9evbL7YKV+ipnkqb5K4B
 lUUVEK1ipecQjMBj4p20iizqNqNWnaUV8VnF9oKjxvkt8UeZl3AhZ8Kge
 oGu+3TqSFzkwufy2VAsRdlU4FmIKTZT9BdYF7aBQG6WNVRwFnKXN94D16 Q==;
X-CSE-ConnectionGUID: XDzvbDA3TAGS+SOJAGGuOg==
X-CSE-MsgGUID: TcF5bxsfRR2sLL/hdEtYUg==
X-IronPort-AV: E=McAfee;i="6700,10204,11235"; a="32369497"
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="32369497"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2024 01:48:55 -0700
X-CSE-ConnectionGUID: nEPiNH1VRNuwApaKQmN3uA==
X-CSE-MsgGUID: rqm0TBk3TGKq+p66FAKmjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; d="scan'208";a="80768510"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa010.jf.intel.com with ESMTP; 25 Oct 2024 01:48:49 -0700
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
Subject: [PATCH v8 0/4] Introduce DRM device wedged event
Date: Fri, 25 Oct 2024 14:18:13 +0530
Message-Id: <20241025084817.144621-1-raag.jadav@intel.com>
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

Raag Jadav (4):
  drm: Introduce device wedged event
  drm/doc: Document device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 Documentation/gpu/drm-uapi.rst        | 75 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_drv.c             | 51 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |  3 ++
 drivers/gpu/drm/xe/xe_device.c        |  9 +++-
 include/drm/drm_device.h              |  7 +++
 include/drm/drm_drv.h                 |  1 +
 6 files changed, 144 insertions(+), 2 deletions(-)

-- 
2.34.1

