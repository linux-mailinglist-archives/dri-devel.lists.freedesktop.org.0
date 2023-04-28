Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9554C6F105E
	for <lists+dri-devel@lfdr.de>; Fri, 28 Apr 2023 04:34:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BDA810EC1D;
	Fri, 28 Apr 2023 02:34:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331E510E376;
 Fri, 28 Apr 2023 02:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682649272; x=1714185272;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=APTBwW67xPKRM4UWym3+06BNzB/35AJFUnFliiIlvvc=;
 b=SVZf1/tOSuH8TJKW7Bca9x5hmIKgPkew8WU94nksasQ/YWAFC6N/w77u
 yxiLokpajSXHO+cTLj8oHubzlz2sPvzQkRZ2ff7EKjgRPoLTnSZ9O07s/
 RcckYz8yahw82qMGD3Fv8oPOrde/YbC/M+J+7YnnWG79C9pE0bUiuMtnx
 m7cEJP+jleNQfQ+i64eydEtsSy1AT5c7mPHrK0hAJZSqFr9i90sV5Gmep
 p1D07yTy0zzS/4DnLnLvhTbDIoF7Mt+ldkbt3CZPZhIp8tmoAm8keNc5n
 Yg1EwFuHRN6tM3xcEB2n/U0AgOuoXvSh59VYp8M1bS0D6cp3gFBGJc+8A w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="346386477"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="346386477"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10693"; a="644937168"
X-IronPort-AV: E=Sophos;i="5.99,233,1677571200"; d="scan'208";a="644937168"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Apr 2023 19:34:26 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 0/8] drm/i915: HuC loading and authentication for MTL
Date: Thu, 27 Apr 2023 19:34:08 -0700
Message-Id: <20230428023416.4051910-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
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
Cc: Tony Ye <tony.ye@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The HuC loading and authentication flow is once again changing and a new
"clear-media only" authentication step is introduced. The flow is as
follows:

1) The HuC is loaded via DMA - same as all non-GSC HuC binaries.

2) The HuC is authenticated by the GuC - this is the same step as
performed for all non-GSC HuC binaries and re-uses the same code, but
it is now resulting in a partial authentication that only allows
clear-media workloads.

3) The HuC is fully authenticated for all workloads by the GSC - this
is done via a new PXP command, submitted via the GSCCS.

The advantage of this new flow is that we can start processing
clear-media workloads without having to wait for the GSC to be ready,
which can take several seconds.

As part of this change, the HuC status getparam has been updated with a
new value to indicate a partial authentication. Note tha the media
driver is checking for value > 0 for clear media workloads, so no
changes are required in userspace for that to work.

The SW proxy series [1] has been included, squashed in a single patch,
as some of some of the patches in this series depend on it. This is not
a functional dependencies, the patches just touch the same code; the
proxy patches are planned to be merged first, so it is easier to base
the new patches on top of it to avoid having to rebase them later.

[1] https://patchwork.freedesktop.org/series/115806/
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tony Ye <tony.ye@intel.com>

Daniele Ceraolo Spurio (8):
  DO NOT REVIEW: drm/i915: Add support for MTL GSC SW Proxy
  drm/i915/uc: perma-pin firmwares
  drm/i915/huc: Parse the GSC-enabled HuC binary
  drm/i915/huc: Load GSC-enabled HuC via DMA xfer if the fuse says so
  drm/i915/huc: differentiate the 2 steps of the MTL HuC auth flow
  drm/i915/mtl/huc: auth HuC via GSC
  drm/i915/mtl/huc: Use the media gt for the HuC getparam
  drm/i915/huc: define HuC FW version for MTL

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/gt/intel_ggtt.c          |   3 +
 drivers/gpu/drm/i915/gt/intel_gt_irq.c        |  22 +-
 drivers/gpu/drm/i915/gt/intel_gt_regs.h       |   3 +
 .../drm/i915/gt/uc/intel_gsc_meu_headers.h    |  74 +++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c  | 424 ++++++++++++++++++
 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h  |  18 +
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.c     |  89 +++-
 drivers/gpu/drm/i915/gt/uc/intel_gsc_uc.h     |  17 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.c |   2 +-
 .../i915/gt/uc/intel_gsc_uc_heci_cmd_submit.h |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   2 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 182 +++++---
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  26 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     | 214 ++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   6 +-
 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h  |  21 +
 drivers/gpu/drm/i915/gt/uc/intel_uc.c         |  10 +-
 drivers/gpu/drm/i915/gt/uc/intel_uc.h         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      | 120 ++---
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.h      |   9 +-
 drivers/gpu/drm/i915/i915_getparam.c          |   6 +-
 drivers/gpu/drm/i915/i915_reg.h               |   3 +
 .../drm/i915/pxp/intel_pxp_cmd_interface_43.h |  14 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |   2 +-
 drivers/misc/mei/Kconfig                      |   2 +-
 drivers/misc/mei/Makefile                     |   1 +
 drivers/misc/mei/gsc_proxy/Kconfig            |  14 +
 drivers/misc/mei/gsc_proxy/Makefile           |   7 +
 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c    | 208 +++++++++
 include/drm/i915_component.h                  |   3 +-
 include/drm/i915_gsc_proxy_mei_interface.h    |  53 +++
 include/uapi/drm/i915_drm.h                   |   3 +-
 33 files changed, 1428 insertions(+), 134 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_meu_headers.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.c
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_gsc_proxy.h
 create mode 100644 drivers/gpu/drm/i915/gt/uc/intel_huc_print.h
 create mode 100644 drivers/misc/mei/gsc_proxy/Kconfig
 create mode 100644 drivers/misc/mei/gsc_proxy/Makefile
 create mode 100644 drivers/misc/mei/gsc_proxy/mei_gsc_proxy.c
 create mode 100644 include/drm/i915_gsc_proxy_mei_interface.h

-- 
2.40.0

