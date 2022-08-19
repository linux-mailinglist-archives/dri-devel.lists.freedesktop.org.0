Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 634D659A8CC
	for <lists+dri-devel@lfdr.de>; Sat, 20 Aug 2022 00:54:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C254310E4CF;
	Fri, 19 Aug 2022 22:53:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B12A10E4CF;
 Fri, 19 Aug 2022 22:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660949628; x=1692485628;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oXR9APN2GrfoUnLji5NFru0Ea+JdBpI+lSLyo37zgG4=;
 b=At69otBbFZJfrv4ho44eea+LjmicxwVYrPjdBGmEF3NAt6BpNS37qZRp
 2g36puteQfPXjQLiReAR13dd7EEohTaOZy59kTv3pntLqX5mQDCMLyqto
 Bk+xCYPC8X9KWwOjeWxJvTnptI4HcQAUtL/OM26nyyiRNrt1ksWQId2Ea
 uHWeSod6NMjy2qQjHIfTHfQUqbVCt7XoAHvwfX1jtTaUGAz62WrXVTnyw
 9VsFw4w9NbTC62zIeqRJkLGTVDzNIbacdlVl64Lu76R1EcLE9lcZnIb8Q
 9L4Jm5dQwCb5lAG7rHSNCQWoJ1SDgjuG9JlqMvb/4k5ucT3e0HSx1i6wU Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10444"; a="273513220"
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="273513220"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:53:47 -0700
X-IronPort-AV: E=Sophos;i="5.93,249,1654585200"; d="scan'208";a="936378442"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Aug 2022 15:53:47 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 00/15] drm/i915: HuC loading for DG2
Date: Fri, 19 Aug 2022 15:53:20 -0700
Message-Id: <20220819225335.3947346-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.37.2
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
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Usyskin <alexander.usyskin@intel.com>,
 dri-devel@lists.freedesktop.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Tomas Winkler <tomas.winkler@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On DG2, HuC loading is performed by the GSC, via a PXP command. The load
operation itself is relatively simple (just send a message to the GSC
with the physical address of the HuC in LMEM), but there are timing
changes that requires special attention. In particular, to send a PXP
command we need to first export the GSC as an aux device and then wait
for the mei-gsc and mei-pxp modules to start, which means that HuC
load will complete after i915 load is complete. This means that there
is a small window of time after i915 is registered and before HuC is
loaded during which userspace could submit and/or check the HuC load
status, although this is quite unlikely to happen (HuC is usually loaded
before kernel init/resume completes).
We've consulted with the media team in regards to how to handle this and
they've asked us to stall all userspace VCS submission until HuC is
loaded. Stalls are expected to be very rare (if any), due to the fact
that HuC is usually loaded before kernel init/resume is completed.

Timeouts are in place to ensure all submissions are unlocked in case
something goes wrong. Since we need to monitor the status of the mei
driver to know what's happening and when to time out, a notifier has
been added so we get a callback when the status of the mei driver
changes.

Note that this series includes several mei patches that add support for
sending the HuC loading command via mei-gsc. These patches depend on the
GSC support for DG2 [1], which has been included squashed in a single
patch to make the series apply and allow CI to run. We plan to merge
those patches through the drm tree because i915 is the sole user.

[1]: https://patchwork.freedesktop.org/series/106638/

v2: address review comments, Reporting HuC loading still in progress
while we wait for mei-gsc init to complete, rebase on latest mei-gsc
series.

v3: fix cc list in mei patches.

Test-with: 20220818224216.3920822-1-daniele.ceraolospurio@intel.com
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Daniele Ceraolo Spurio (8):
  HAX: mei: GSC support for XeHP SDV and DG2 platform
  drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
  drm/i915/dg2: setup HuC loading via GSC
  drm/i915/huc: track delayed HuC load with a fence
  drm/i915/huc: stall media submission until HuC is loaded
  drm/i915/huc: better define HuC status getparam possible return
    values.
  drm/i915/huc: define gsc-compatible HuC fw for DG2
  HAX: drm/i915: force INTEL_MEI_GSC and INTEL_MEI_PXP on for CI

Tomas Winkler (4):
  mei: add support to GSC extended header
  mei: bus: enable sending gsc commands
  mei: pxp: support matching with a gfx discrete card
  drm/i915/pxp: add huc authentication and loading command

Vitaly Lubart (3):
  mei: bus: extend bus API to support command streamer API
  mei: pxp: add command streamer API to the PXP driver
  drm/i915/pxp: implement function for sending tee stream command

 drivers/gpu/drm/i915/Kconfig.debug            |   2 +
 drivers/gpu/drm/i915/Makefile                 |  11 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c           | 140 +++++++++-
 drivers/gpu/drm/i915/gt/intel_gsc.h           |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 253 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  27 ++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  34 +++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  65 +++--
 drivers/gpu/drm/i915/i915_request.c           |  24 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  32 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  32 ---
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  69 +++++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      |  15 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  11 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 138 +++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |   5 +
 .../drm/i915/pxp/intel_pxp_tee_interface.h    |  21 ++
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
 drivers/misc/mei/bus-fixup.c                  | 104 ++++---
 drivers/misc/mei/bus.c                        | 145 +++++++++-
 drivers/misc/mei/client.c                     |  69 +++--
 drivers/misc/mei/debugfs.c                    |  17 ++
 drivers/misc/mei/gsc-me.c                     |  77 +++++-
 drivers/misc/mei/hbm.c                        |  25 +-
 drivers/misc/mei/hw-me-regs.h                 |   7 +
 drivers/misc/mei/hw-me.c                      | 121 +++++++--
 drivers/misc/mei/hw-me.h                      |  14 +-
 drivers/misc/mei/hw-txe.c                     |   2 +-
 drivers/misc/mei/hw.h                         |  62 +++++
 drivers/misc/mei/init.c                       |  21 +-
 drivers/misc/mei/interrupt.c                  |  47 +++-
 drivers/misc/mei/main.c                       |   2 +-
 drivers/misc/mei/mei_dev.h                    |  33 +++
 drivers/misc/mei/mkhi.h                       |  57 ++++
 drivers/misc/mei/pci-me.c                     |   2 +-
 drivers/misc/mei/pxp/mei_pxp.c                |  41 ++-
 include/drm/i915_pxp_tee_interface.h          |   5 +
 include/linux/mei_aux.h                       |  12 +
 include/linux/mei_cl_bus.h                    |   6 +
 include/uapi/drm/i915_drm.h                   |  16 ++
 44 files changed, 1564 insertions(+), 227 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h
 create mode 100644 drivers/misc/mei/mkhi.h

-- 
2.37.2

