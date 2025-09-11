Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A25B5B52AB0
	for <lists+dri-devel@lfdr.de>; Thu, 11 Sep 2025 09:56:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D248010EA28;
	Thu, 11 Sep 2025 07:56:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Pgc9bvnw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD3010EA25;
 Thu, 11 Sep 2025 07:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1757577381; x=1789113381;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=NdLKAQlWUr0SnI1fWCp+SY3s4Yp8zDJc9KTErx0pre0=;
 b=Pgc9bvnwgYzyS/oxiqWP3c9lw0aP9dn6rxdlL3PzA8mxIhVDLI7VWEIc
 PXuh849AQsKYhULkJnZnk7DSxbw9JozFxpOraUc/j7xLlm5D6kCDTjD7Y
 qz3Zh2FW3XvqrvYZ/V4Qcc2VyOW57vGxXyFD7tUNySMsZBPfRvBabDVW5
 Edv4vebcGuwLbMEUn3zKVInFdT7tBMpXOkttM6wP6bImWYGr/7sZa0IJe
 WHFpyn+L6Qlwkc3v+P5xRvCIVIy3Y22KYq6QWDcZ3NF05oOk8KvXoYzyy
 OFLKYQtZLQWtlNrvxbZR1QUpDksD97mlyB6mXBb9oV/9ganG0ASleeG5L Q==;
X-CSE-ConnectionGUID: gEJztGU8RN6WZSZCD4W69w==
X-CSE-MsgGUID: T54jX+9cR5OAJbKTmNqD/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11549"; a="58942208"
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="58942208"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:56:20 -0700
X-CSE-ConnectionGUID: vPGNxPT3TFm13imjCknavQ==
X-CSE-MsgGUID: PTSScRSiSEyaM2fCiqO+cQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,256,1751266800"; d="scan'208";a="210757574"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.245.187])
 by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Sep 2025 00:56:13 -0700
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 =?UTF-8?q?Micha=C5=82=20Winiarski?= <michal.winiarski@intel.com>,
 Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Tvrtko Ursulin <tursulin@ursulin.net>,
 ?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Subject: [PATCH 00/11] PCI: Resizable BAR improvements
Date: Thu, 11 Sep 2025 10:55:54 +0300
Message-Id: <20250911075605.5277-1-ilpo.jarvinen@linux.intel.com>
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

pci.c has been used as catch everything that doesn't fits elsewhere
within PCI core and thus resizable BAR code has been placed there as
well. Move Resizable BAR related code to a newly introduced rebar.c to
reduce size of pci.c. After move, there are no pci_rebar_*() calls from
pci.c indicating this is indeed well-defined subset of PCI core.

Endpoint drivers perform Resizable BAR related operations which could
well be performed by PCI core to simplify driver-side code. This
series adds a few new API functions to that effect and converts the
drivers to use the new APIs (in separate patches).

While at it, also convert BAR sizes bitmask to u64 as PCIe spec already
specifies more sizes than what will fit u32 to make the API typing more
future-proof. The extra sizes beyond 128TB are not added at this point.

These are based on pci/main, there are two minor conflicts with the
work in pci/resource but I'm hesitant to base this on top of it as this
is otherwise entirely independent. If we end up having to pull the
bridge window select changes, there should be no reason why this does
have to become collateral damage (so my suggestion, if this is good to
go in this cycle, to take this into a separate branch than pci/resource
and deal with those small conflicts while merging into pci/next).

I've tested sysfs resize, i915, and xe BAR resizing functionality. In
the case of xe, I did small hack patch as its resize is anyway broken
as is because BAR0 pins the bridge window so resizing BAR2 fails. My
hack caused other problems further down the road (likely because BAR0
is in use by the driver so releasing it messed assumptions xe driver
has) but the BAR resize itself was working which was all I was
interested to know. I'm not planning to pursue fixing the pinning
problem within xe driver because the core changes to consider maximum
size of the resizable BARs should take care of the main problem by
different means.

Some parts of this are to be used by the resizable BAR changes into the
resource fitting/assingment logic but these seem to stand on their own
so sending these out now to reduce the size of the other patch series.


Ilpo Järvinen (11):
  PCI: Move Resizable BAR code into rebar.c
  PCI: Cleanup pci_rebar_bytes_to_size() and move into rebar.c
  PCI: Move pci_rebar_size_to_bytes() and export it
  PCI: Improve Resizable BAR functions kernel doc
  PCI: Add pci_rebar_size_supported() helper
  drm/i915/gt: Use pci_rebar_size_supported()
  drm/xe/vram: Use PCI rebar helpers in resize_vram_bar()
  PCI: Add pci_rebar_get_max_size()
  drm/xe/vram: Use pci_rebar_get_max_size()
  drm/amdgpu: Use pci_rebar_get_max_size()
  PCI: Convert BAR sizes bitmasks to u64

 Documentation/driver-api/pci/pci.rst        |   3 +
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c  |   8 +-
 drivers/gpu/drm/i915/gt/intel_region_lmem.c |  10 +-
 drivers/gpu/drm/xe/xe_vram.c                |  32 +-
 drivers/pci/Makefile                        |   2 +-
 drivers/pci/iov.c                           |   9 +-
 drivers/pci/pci-sysfs.c                     |   2 +-
 drivers/pci/pci.c                           | 145 ---------
 drivers/pci/pci.h                           |   5 +-
 drivers/pci/rebar.c                         | 318 ++++++++++++++++++++
 drivers/pci/setup-res.c                     |  78 -----
 include/linux/pci.h                         |  15 +-
 12 files changed, 354 insertions(+), 273 deletions(-)
 create mode 100644 drivers/pci/rebar.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.39.5

