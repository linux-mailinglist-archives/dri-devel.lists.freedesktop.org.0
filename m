Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7572F97AA88
	for <lists+dri-devel@lfdr.de>; Tue, 17 Sep 2024 06:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5844510E206;
	Tue, 17 Sep 2024 04:03:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KZTNLdgn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72C6110E10F;
 Tue, 17 Sep 2024 04:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726545803; x=1758081803;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=XbpaBab7H67cwWevVf3IKAtKzxb13y/ITB6Fbsfz7k0=;
 b=KZTNLdgn1noYhDGmLIXW3gtZeOnVpGjUGspbTTuRraM3xmZVUmJyA0aI
 NMRS2Nje8XS1j1bS1XPK5XbjhJA9juPVp/cjWIlaLiLK1HA6x9ifkC5Ak
 tSmbjmpug0DKiYS8FILIqSw9pT5GPSsXM+TzDu3fGJVx6rMbyiDwYZujy
 Cm8Uu0Hwvn4o+8X9MaBgO52fa5lPsVE6DhsCum+MoYY+oLxWtJ3bh/Zta
 Ctsm5yJ+X3wG/+kAOgxNWAQYZCkWxwfacQVwfxklOVMdJmDWTUJYveNeH
 tjqZefLQYa42OVgi4bfiyWkIu3UQ/dwfR1rmXoCdA/RGw0Uedq3D5W0U/ Q==;
X-CSE-ConnectionGUID: eFLPU9ihQQKFIHFuiq4Kgw==
X-CSE-MsgGUID: SfSr37QBTSuepTK6i8GGHA==
X-IronPort-AV: E=McAfee;i="6700,10204,11197"; a="42865144"
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="42865144"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2024 21:03:22 -0700
X-CSE-ConnectionGUID: +BZFP8DpQdKiBK2Y+8EeJQ==
X-CSE-MsgGUID: H/QVt3u3R8GYrtnEcie+ng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,234,1719903600"; d="scan'208";a="69168555"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa008.fm.intel.com with ESMTP; 16 Sep 2024 21:03:16 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, joonas.lahtinen@linux.intel.com,
 tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 andriy.shevchenko@linux.intel.com, matthew.d.roper@intel.com,
 Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v5 0/4] Introduce DRM device wedged event
Date: Tue, 17 Sep 2024 09:32:31 +0530
Message-Id: <20240917040235.197019-1-raag.jadav@intel.com>
X-Mailer: git-send-email 2.34.1
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

This series introduces device wedged event in DRM subsystem and uses
it in xe and i915 drivers. Detailed description in commit message.

This was earlier attempted as xe specific uevent in v1 and v2.
https://patchwork.freedesktop.org/series/136909/

v2: Change authorship to Himal (Aravind)
    Add uevent for all device wedged cases (Aravind)
v3: Generic re-implementation in DRM subsystem (Lucas)
v4: s/drm_dev_wedged/drm_dev_wedged_event
    Use drm_info() (Jani)
    Kernel doc adjustment (Aravind)
    Change authorship to Raag (Aravind)
v5: Send recovery method with uevent (Lina)
    Expose supported recovery methods via sysfs (Lucas)

Raag Jadav (4):
  drm: Introduce device wedged event
  drm: Expose wedge recovery methods
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 drivers/gpu/drm/drm_drv.c             | 37 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c           | 23 +++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |  2 ++
 drivers/gpu/drm/i915/i915_driver.c    | 10 ++++++++
 drivers/gpu/drm/xe/xe_device.c        | 17 ++++++++++--
 drivers/gpu/drm/xe/xe_device.h        |  1 +
 drivers/gpu/drm/xe/xe_pci.c           |  2 ++
 include/drm/drm_device.h              | 24 +++++++++++++++++
 include/drm/drm_drv.h                 |  1 +
 9 files changed, 115 insertions(+), 2 deletions(-)

-- 
2.34.1

