Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25BACC58B27
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 17:26:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3111710E8AA;
	Thu, 13 Nov 2025 16:26:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="FImPdnPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B41C10E8AA;
 Thu, 13 Nov 2025 16:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1763051203; x=1794587203;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=q5Skt0OtlAqHnc+PsJMhZYM80doWwAu7rSkxepWYXmk=;
 b=FImPdnPQCn/ELYRVHVUDcamQVPH/pHB4WCSdZK7tsWCVF1KnS1JS8jhd
 S3+iRygCXnM5NyXbBaXBhf3MKLZU+K66qwL135EwIsH2nTXmqTB2p76lq
 EJfcZLNi4oboooI1rypVWvEoV2AgmKgDjQJXJRzFLYAK0FlSHtDnVBoN1
 9MC3L8mJ9bWjtZaAA34H13FnPU6hvtg2ApS0N7nsFLgHX5/fFlz7mAVqf
 9i/BpT9nwS1ZQ82BimpIBqtEi0M4cQFVu2H0qmOb6NE3Txxx3Jnwp9deH
 8djTihoYXg+nVWBaG+ms+Oq5PzmsVtUqd3Lizfg9LM1skoovE37v7Ulev A==;
X-CSE-ConnectionGUID: +0BII+L4R0iyn+jSCFuu3w==
X-CSE-MsgGUID: BV4vFdoUTsCMrGg7kiQIgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="65074077"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="65074077"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:26:42 -0800
X-CSE-ConnectionGUID: Mp0m3lPLSZSKY1ATLvKgcw==
X-CSE-MsgGUID: OVCixanWRwmVQCKrct9tjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,302,1754982000"; d="scan'208";a="226864796"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.164])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Nov 2025 08:26:35 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Simon Richter <Simon.Richter@hogyros.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Bjorn Helgaas <bhelgaas@google.com>, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 linux-pci@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>, Tvrtko Ursulin <tursulin@ursulin.net>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>
Cc: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH v2 00/11] PCI: BAR resizing fix/rework
Date: Thu, 13 Nov 2025 18:26:17 +0200
Message-Id: <20251113162628.5946-1-ilpo.jarvinen@linux.intel.com>
X-Mailer: git-send-email 2.39.5
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

Hi all,

Thanks to issue reports from Simon Richter and Alex Bennée, I
discovered BAR resize rollback can corrupt the resource tree. As fixing
corruption requires avoiding overlapping resource assignments, the
correct fix can unfortunately results in worse user experience, what
appeared to be "working" previously might no longer do so. Thus, I had
to do a larger rework to pci_resize_resource() in order to properly
restore resource states as it was prior to BAR resize.

This rework has been on my TODO list anyway but it wasn't the highest
prio item until pci_resize_resource() started to cause regressions due
to other resource assignment algorithm changes.

BAR resize rollback does not always restore BAR resources as they were
before the resize operation was started. Currently, when
pci_resize_resource() call is made by a driver, the driver must release
device resource prior to the call. This is a design flaw in
pci_resize_resource() API as PCI core cannot then save the state of
those resources from what it was prior to release so it could restore
them later if the BAR size change has to be rolled back.

PCI core's BAR resize operation doesn't even attempt to restore the
device resources currently when rolling back BAR resize operation. If
the normal resource assignment algorithm assigned those resources, then
device resources might be assigned after pci_resize_resource() call but
that could also trigger the resource tree corruption issue so what
appeared to an user as "working" might be a corrupted state.

With the new pci_resize_resource() interface, the driver calling
pci_resize_resource() should no longer release the device resources.

I've added WARN_ON_ONCE() to pick up similar bugs that cause resource
tree corruption. At least in my tests all looked clear on that front
after this series.

It would still be nice if the reporters could test these changes
resolve the claim conflicts (while I've tested the series to some extent,
I don't have such conflicts here).

This series will likely conflict with some drm changes from Lucas (will
make them partially obsolete by removing the need to release dev's
resources on the driver side).

I'll soon submit refresh of pci/rebar series on top of this series as
there are some conflicts with them.

v2:
- Add exclude_bars parameter to pci_resize_resource()
- Add Link tags
- Add kerneldoc patch
- Add patch to release pci_bus_sem earlier.
- Fix to uninitialized var warnings.
- Don't use guard() as goto from before it triggers error with clang.

Ilpo Järvinen (11):
  PCI: Prevent resource tree corruption when BAR resize fails
  PCI/IOV: Adjust ->barsz[] when changing BAR size
  PCI: Change pci_dev variable from 'bridge' to 'dev'
  PCI: Try BAR resize even when no window was released
  PCI: Freeing saved list does not require holding pci_bus_sem
  PCI: Fix restoring BARs on BAR resize rollback path
  PCI: Add kerneldoc for pci_resize_resource()
  drm/xe: Remove driver side BAR release before resize
  drm/i915: Remove driver side BAR release before resize
  drm/amdgpu: Remove driver side BAR release before resize
  PCI: Prevent restoring assigned resources

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |  10 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  14 +--
 drivers/gpu/drm/xe/xe_vram.c                |   5 +-
 drivers/pci/iov.c                           |  15 +--
 drivers/pci/pci-sysfs.c                     |  17 +--
 drivers/pci/pci.c                           |   4 +
 drivers/pci/pci.h                           |   9 +-
 drivers/pci/setup-bus.c                     | 126 ++++++++++++++------
 drivers/pci/setup-res.c                     |  52 ++++----
 include/linux/pci.h                         |   3 +-
 10 files changed, 142 insertions(+), 113 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.39.5

