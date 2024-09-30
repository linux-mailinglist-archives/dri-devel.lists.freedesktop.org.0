Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17E3C989BAF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 09:39:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 709E010E3AC;
	Mon, 30 Sep 2024 07:39:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="H5XL8ZUy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8CA2810E3AA;
 Mon, 30 Sep 2024 07:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727681971; x=1759217971;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=zzcV/MURheDv805dA75DK4s9HfKM8QhpVufUnMGxx0g=;
 b=H5XL8ZUygjzrugIYOsv4JjD42Q8cVMzEPwVt/B2/LA8sC29/PYO43fFt
 icFsH5dfBwS4wZ1/ANr1kB1lHe5JtizmwDyIf284ffPprBPSA1B3TJxLR
 R45GeW06Ug7Qreq6PKPglJQ+HC4vdYwPu2oUT9C2aOf/wDTvL1UZPt4Ed
 e2j+qzzpd35VFDPyzaIgME95d6n+4qqmClKb3S758Z3LlPqHjhzgohBmb
 iDtYoxCmDOpqUov0DZijq3lwE7s9B8USwSrKnbCdkRN/nN96KB0ivgz9Q
 SIbjG8lLjUpMVivuSsqf9O63wWj+nHJpi46/gJ3ByQrdMjiiCelCTWW8i w==;
X-CSE-ConnectionGUID: M2qt9dnUTmuM3YnKgbmxLQ==
X-CSE-MsgGUID: ucpUwbOXTie3CKno2w0Haw==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="37315433"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="37315433"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 00:39:31 -0700
X-CSE-ConnectionGUID: yD1JMvQQTH6y3rwA/HbwjQ==
X-CSE-MsgGUID: rA6d/g2VRWijnpD1X/r0aA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="72797392"
Received: from jraag-nuc8i7beh.iind.intel.com ([10.145.169.79])
 by fmviesa006.fm.intel.com with ESMTP; 30 Sep 2024 00:39:25 -0700
From: Raag Jadav <raag.jadav@intel.com>
To: airlied@gmail.com, simona@ffwll.ch, lucas.demarchi@intel.com,
 thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 jani.nikula@linux.intel.com, andriy.shevchenko@linux.intel.com,
 joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, lina@asahilina.net
Cc: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, himal.prasad.ghimiray@intel.com,
 francois.dugast@intel.com, aravind.iddamsetty@linux.intel.com,
 anshuman.gupta@intel.com, andi.shyti@linux.intel.com,
 matthew.d.roper@intel.com, Raag Jadav <raag.jadav@intel.com>
Subject: [PATCH v7 0/5] Introduce DRM device wedged event
Date: Mon, 30 Sep 2024 13:08:40 +0530
Message-Id: <20240930073845.347326-1-raag.jadav@intel.com>
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

v6: Access wedge_recovery_opts[] using helper function (Jani)
    Use snprintf() (Jani)

v7: Convert recovery helpers into regular functions (Andy, Jani)
    Aesthetic adjustments (Andy)
    Handle invalid method cases
    Add documentation to drm-uapi.rst (Sima)

Raag Jadav (5):
  drm: Introduce device wedged event
  drm: Expose wedge recovery methods
  drm/doc: Document device wedged event
  drm/xe: Use device wedged event
  drm/i915: Use device wedged event

 Documentation/gpu/drm-uapi.rst        | 42 +++++++++++++++
 drivers/gpu/drm/drm_drv.c             | 77 +++++++++++++++++++++++++++
 drivers/gpu/drm/drm_sysfs.c           | 22 ++++++++
 drivers/gpu/drm/i915/gt/intel_reset.c |  2 +
 drivers/gpu/drm/i915/i915_driver.c    | 10 ++++
 drivers/gpu/drm/xe/xe_device.c        | 17 +++++-
 drivers/gpu/drm/xe/xe_device.h        |  1 +
 drivers/gpu/drm/xe/xe_pci.c           |  2 +
 include/drm/drm_device.h              | 23 ++++++++
 include/drm/drm_drv.h                 |  3 ++
 10 files changed, 197 insertions(+), 2 deletions(-)

-- 
2.34.1

