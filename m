Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A30F1CFB722
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 01:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB7310E249;
	Wed,  7 Jan 2026 00:22:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Zmkd0xmO";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DF3710E1EE;
 Wed,  7 Jan 2026 00:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1767745330; x=1799281330;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NvyNXaAF2B9RxogMt35VloMFXHt6Ae4vqEsrkXyRxfM=;
 b=Zmkd0xmOqMDN5B1FgnVmbn3H78gOaCXGCjWEu6gtepc5gv3LmdoB6p6a
 XdZsaG5LuginhkXM/12Pp4qD5XWx0xIQgLikyvSs/dgVwXJIboDdy06m6
 /AD+s0vIkBWfCtHdthtkbpMbvDWXmfIYLD3EGCmD1Z/SS3XGFV563zNL9
 lumniiwEWTMl11bHUNkZE+6JZ69gJbdUNQCkphPthfg+Vpjkh7SHkTgoR
 fpsNUUei4CXhYmlZtN66ReFtfVtkDNNQrYdD5E3vSuYzkMv8nqRl0d81U
 RyJadTVu2aGxYy9Hfn9dE7E1+fLOLcGaj55LGC7j/epO/sbSVVKCh2tDi w==;
X-CSE-ConnectionGUID: J2M7mQrbSSqa9MboI4J2Jw==
X-CSE-MsgGUID: byXPViFnQmmpew2r04k3xQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11663"; a="69164114"
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="69164114"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:09 -0800
X-CSE-ConnectionGUID: 2t//YsLMQlGnPko4Z79khQ==
X-CSE-MsgGUID: 14nhtsiDQL2YPo5VlCkReQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,206,1763452800"; d="scan'208";a="206931516"
Received: from debox1-desk4.jf.intel.com ([10.88.27.138])
 by ORVIESA003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2026 16:22:08 -0800
From: "David E. Box" <david.e.box@linux.intel.com>
To: thomas.hellstrom@linux.intel.com, rodrigo.vivi@intel.com,
 irenic.rajneesh@gmail.com, ilpo.jarvinen@linux.intel.com,
 srinivas.pandruvada@linux.intel.com, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, xi.pardee@linux.intel.comn
Cc: "David E. Box" <david.e.box@linux.intel.com>, hansg@kernel.org,
 linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/4] platform/x86/intel/vsec: Prep for ACPI PMT discovery
Date: Tue,  6 Jan 2026 16:21:47 -0800
Message-ID: <20260107002153.63830-1-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

This series updates intel_vsec to decouple helper APIs from PCI, clean up
error handling, and plumb ACPI=E2=80=91based Intel Platform Monitoring Tech=
nology
(PMT) discovery through the vsec layer.  It is preparatory infrastructure
for the follow=E2=80=91on PMT core/telemetry and PMC/SSRAM series that add =
ACPI
discovery and new platforms.

Highlights

  -- Decouple add/link helpers from PCI so users need only a struct device.
  -- Switch exported helpers from struct pci_dev to struct device.
  -- Return real error codes from the registration path.
  -- Carry ACPI PMT discovery tables through vsec.


David E. Box (4):
  platform/x86/intel/vsec: Decouple add/link helpers from PCI
  platform/x86/intel/vsec: Switch exported helpers from pci_dev to
    device
  platform/x86/intel/vsec: Return real error codes from registration
    path
  platform/x86/intel/vsec: Plumb ACPI PMT discovery tables through vsec

 drivers/gpu/drm/xe/xe_debugfs.c               |   2 +-
 drivers/gpu/drm/xe/xe_hwmon.c                 |   2 +-
 drivers/gpu/drm/xe/xe_vsec.c                  |   7 +-
 drivers/gpu/drm/xe/xe_vsec.h                  |   2 +-
 drivers/platform/x86/intel/pmc/core.c         |   4 +-
 .../platform/x86/intel/pmc/ssram_telemetry.c  |   2 +-
 drivers/platform/x86/intel/pmt/class.c        |   8 +-
 drivers/platform/x86/intel/pmt/class.h        |   4 +-
 drivers/platform/x86/intel/pmt/discovery.c    |   4 +-
 drivers/platform/x86/intel/pmt/telemetry.c    |  13 +-
 drivers/platform/x86/intel/pmt/telemetry.h    |  11 +-
 drivers/platform/x86/intel/sdsi.c             |   5 +-
 drivers/platform/x86/intel/vsec.c             | 115 +++++++++++-------
 drivers/platform/x86/intel/vsec_tpmi.c        |   8 +-
 include/linux/intel_vsec.h                    |  40 ++++--
 15 files changed, 136 insertions(+), 91 deletions(-)


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
--=20
2.43.0

