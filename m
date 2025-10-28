Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 602A3C162F8
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 18:36:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0292510E62A;
	Tue, 28 Oct 2025 17:36:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6gDxIn+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 003D510E61E;
 Tue, 28 Oct 2025 17:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761672968; x=1793208968;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sUfBrDVJ4zXpZdE0zhHIkQbFjQ1mRcyzdpcim/n0mKU=;
 b=Q6gDxIn+xSWXpqSQb+4IURICp8WrMScnY0Hq7uhZs9dAm0Ko+uRzUcGZ
 aL5yTGpgIqzTHRs4uDepCgDpdjcBDHLuKvQtBJjdcNWQg9PVr/1MFJyM1
 cSJqLxdtydECoiBzTPFULSJvXDR3i9J0dVCjIJt5ppmuC58jYo7Z7BZxp
 A+Gi0pK3Zf90q1KBd1axfK1WuOwMwIkcAC8kwjKiM0LYtsaOJshANJLWs
 7k0eNdkIMdhbkUVlDLsRPyU3GJ3ENCZEe/KpXue60T3hJGHVOBHgIkQns
 3Umo0cSUVdDnXVbLUScTQ+I8DcpSdl2QHLA6EYLvWFK+qGCfcZLT/hNSU Q==;
X-CSE-ConnectionGUID: CY1Tsdy8RNW5lT/wD5xanA==
X-CSE-MsgGUID: CiLfZPbXRQmTzcjo+zhO6A==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="74072258"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="74072258"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:36:07 -0700
X-CSE-ConnectionGUID: Adp4jPrPQ4W1wxsZqchBjQ==
X-CSE-MsgGUID: x7jx+FshTVaDlbRqAYf7RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; d="scan'208";a="184594646"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.244.182])
 by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Oct 2025 10:36:01 -0700
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
Cc: linux-kernel@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 0/9] PCI: BAR resizing fix/rework
Date: Tue, 28 Oct 2025 19:35:42 +0200
Message-Id: <20251028173551.22578-1-ilpo.jarvinen@linux.intel.com>
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

Simon and Alex, could you please test if this series eliminates the
claim conflicts and makes the BAR resize either succeed or not break
things while rolling back resource changes? It should be tested without
other fix patches (from me; if you need some random unrelated fix,
that's okay).

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

I was a bit on the edge how to split this series. Between patches 1 and
5-8, there might be cases where user experience is made worse if only
part of the series are applied. But at the same time I was hesitant to
merge all those changes together either as the changes way easier to
understand when split properly. Personally I think BAR resize rollback
code has not really functioned okay prior to series at all because
touching an assigned resource on the rollback path is a bug, plain and
simple. If that got things "working" it's still a bad bug (that one can
get lucky and corruption results in non-corrupted numbers doesn't make
it any better). If those patches need to be merged into one, just let
me know and I can rearrange the patch order to make it easier.

This series will conflict what's in pci/rebar and likely with some xe
changes from Lucas De Marchi that might also be rendered in part
unnecessary due to pci_resize_resource() API change. My suggestion is
that this series takes precedence over what's in pci/rebar to make
things easier for stable people (I can rebase the pci/rebar patches on
top of these so feel free to drop those other patches, if needed).


Ilpo Järvinen (9):
  PCI: Prevent resource tree corruption when BAR resize fails
  PCI/IOV: Adjust ->barsz[] when changing BAR size
  PCI: Change pci_dev variable from 'bridge' to 'dev'
  PCI: Try BAR resize even when no window was released
  PCI: Fix restoring BARs on BAR resize rollback path
  drm/xe: Remove driver side BAR release before resize
  drm/i915: Remove driver side BAR release before resize
  drm/amdgpu: Remove driver side BAR release before resize
  PCI: Prevent restoring assigned resources

 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  12 --
 drivers/gpu/drm/xe/xe_vram.c                |   3 -
 drivers/pci/iov.c                           |  15 +--
 drivers/pci/pci-sysfs.c                     |  15 +--
 drivers/pci/pci.c                           |   4 +
 drivers/pci/pci.h                           |   8 +-
 drivers/pci/setup-bus.c                     | 119 ++++++++++++++------
 drivers/pci/setup-res.c                     |  30 ++---
 9 files changed, 108 insertions(+), 106 deletions(-)


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.39.5

