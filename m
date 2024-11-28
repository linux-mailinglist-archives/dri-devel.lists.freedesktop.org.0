Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A159DBAA1
	for <lists+dri-devel@lfdr.de>; Thu, 28 Nov 2024 16:38:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3AD7E10ECDE;
	Thu, 28 Nov 2024 15:38:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JhLW871F";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0631F10ECD9;
 Thu, 28 Nov 2024 15:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732808305; x=1764344305;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v3/oHV5ScoitttJ7wJgv3mxFsZG9Yi3JeujwhSxMPtc=;
 b=JhLW871FHT/WNUf6A/VbO9ihQIgxmuy+WlSIu8DlLmkQT3S483P8Lyp3
 CEgY1ZOESk7xJlx3IE69PiypFnnQHfW4aCJ2U9bptRqicjqNLJsSF8ybN
 dL/jbXe3EdBY1kyWt4KgzjTY+3HSELOGq5UBysi99PLkcZLHnLAJJEt6W
 GN4N5NozV2kGOilZI3fS79UY+mVTTq0yqERcHWf5oIQdO6p+P9c+YG3jT
 t8NJfp4wCLsIlvuSiHw6Km3VN3IbOEN+bJhl+q6FPpFVHij9bU216dxHw
 erc68Him/VMHz4y+ctc5iFwivqTj4SPnKL5O0qeoQGnVYdmBgZIA1ztDo Q==;
X-CSE-ConnectionGUID: QM7D2u12QIG80dPiBBvR+A==
X-CSE-MsgGUID: aZtrXQAkRQGyXctWcan5+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="32792613"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="32792613"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Nov 2024 07:38:24 -0800
X-CSE-ConnectionGUID: 3y2iWvyVRayV7BJ99xHagQ==
X-CSE-MsgGUID: hiQgwSKmT+2sVKxgZT4pUQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; d="scan'208";a="92193064"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by orviesa009.jf.intel.com with ESMTP; 28 Nov 2024 07:38:19 -0800
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
Subject: [PATCH v10 0/4] Introduce DRM device wedged event
Date: Thu, 28 Nov 2024 21:07:03 +0530
Message-Id: <20241128153707.1294347-1-raag.jadav@intel.com>
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

v10: Clarify mmap cleanup and consumer prerequisites (Christian, Aravind)

Raag Jadav (4):
  drm: Introduce device wedged event
  drm/doc: Document device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 Documentation/gpu/drm-uapi.rst        | 112 +++++++++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c             |  66 +++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |   3 +
 drivers/gpu/drm/xe/xe_device.c        |   9 ++-
 include/drm/drm_device.h              |   8 ++
 include/drm/drm_drv.h                 |   1 +
 6 files changed, 194 insertions(+), 5 deletions(-)

-- 
2.34.1

