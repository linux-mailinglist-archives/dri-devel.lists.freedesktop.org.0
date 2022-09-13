Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (unknown [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8F75B64B7
	for <lists+dri-devel@lfdr.de>; Tue, 13 Sep 2022 02:58:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BD1D10E444;
	Tue, 13 Sep 2022 00:58:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACEB610E146;
 Tue, 13 Sep 2022 00:57:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663030676; x=1694566676;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oOdZwv7fUCiPBvAE2zg5IMX8GCiGf193UWxelKUnC+w=;
 b=MaQ2RoEieeAwWVeqIw/hQDABi/5hVox4QqdByCSKVWXgiJJSEmti8EMO
 zTbz/0XGofb3P6Y2VmjELsoY3LKTMsZTUBeHdVZk4i4UPEJPa5wRrkgsA
 KH6CshjS4UTQ/rRrF4m3G82lKSPp1MFKaTXNMwbwlvq7nvlJwH53VIXH/
 aF8PxECqszp/gc7wJQRd3pySwuA4OekbgBt5d1d8CIO1XGYgeyQmUbbpx
 1TdMIeQB2796pmYZBSj7QKa04yNDfGQ8KnXzU1+TBpqI8O1hn9CFDGD5S
 jfiSGwjjTj6RpXcGmKUMaLqk3/u3NYpAQGLgsM5iikJLdmvjQCBUgIEdJ A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10468"; a="281024383"
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="281024383"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:54 -0700
X-IronPort-AV: E=Sophos;i="5.93,311,1654585200"; d="scan'208";a="758593494"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Sep 2022 17:57:54 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 00/15] drm/i915: HuC loading for DG2
Date: Mon, 12 Sep 2022 17:57:24 -0700
Message-Id: <20220913005739.798337-1-daniele.ceraolospurio@intel.com>
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
sending the HuC loading command via mei-gsc. We plan to merge those
patches through the drm tree because i915 is the sole user.

v2: address review comments, Reporting HuC loading still in progress
while we wait for mei-gsc init to complete, rebase on latest mei-gsc
series.

v3: fix cc list in mei patches.

v4: update mei patches, fix includes, rebase on new FW fetch logic and
merged mei-gsc support.

v5: update mei patches

Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: Tony Ye <tony.ye@intel.com>
Cc: Alexander Usyskin <alexander.usyskin@intel.com>
Cc: Tomas Winkler <tomas.winkler@intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Daniele Ceraolo Spurio (7):
  drm/i915/pxp: load the pxp module when we have a gsc-loaded huc
  drm/i915/dg2: setup HuC loading via GSC
  drm/i915/huc: track delayed HuC load with a fence
  drm/i915/huc: stall media submission until HuC is loaded
  drm/i915/huc: better define HuC status getparam possible return
    values.
  drm/i915/huc: define gsc-compatible HuC fw for DG2
  HAX: drm/i915: force INTEL_MEI_GSC and INTEL_MEI_PXP on for CI

Tomas Winkler (5):
  mei: add support to GSC extended header
  mei: bus: enable sending gsc commands
  mei: adjust extended header kdocs
  mei: pxp: support matching with a gfx discrete card
  drm/i915/pxp: add huc authentication and loading command

Vitaly Lubart (3):
  mei: bus: extend bus API to support command streamer API
  mei: pxp: add command streamer API to the PXP driver
  drm/i915/pxp: implement function for sending tee stream command

 drivers/gpu/drm/i915/Kconfig.debug            |   2 +
 drivers/gpu/drm/i915/Makefile                 |  11 +-
 drivers/gpu/drm/i915/gt/intel_gsc.c           |  22 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc.c        |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_huc.c        | 254 ++++++++++++++++--
 drivers/gpu/drm/i915/gt/uc/intel_huc.h        |  31 +++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.c     |  34 +++
 drivers/gpu/drm/i915/gt/uc/intel_huc_fw.h     |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_uc_fw.c      |  24 +-
 drivers/gpu/drm/i915/i915_request.c           |  24 ++
 drivers/gpu/drm/i915/pxp/intel_pxp.c          |  32 ++-
 drivers/gpu/drm/i915/pxp/intel_pxp.h          |  32 ---
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c      |  69 +++++
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h      |  13 +
 drivers/gpu/drm/i915/pxp/intel_pxp_irq.h      |   8 +
 drivers/gpu/drm/i915/pxp/intel_pxp_session.c  |   8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_session.h  |  11 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c      | 138 +++++++++-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.h      |   5 +
 .../drm/i915/pxp/intel_pxp_tee_interface.h    |  23 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_types.h    |   6 +
 drivers/misc/mei/bus.c                        | 146 +++++++++-
 drivers/misc/mei/client.c                     |  55 ++--
 drivers/misc/mei/hbm.c                        |  13 +
 drivers/misc/mei/hw-me.c                      |   7 +-
 drivers/misc/mei/hw.h                         |  89 +++++-
 drivers/misc/mei/interrupt.c                  |  47 +++-
 drivers/misc/mei/mei_dev.h                    |   8 +
 drivers/misc/mei/pxp/mei_pxp.c                |  38 ++-
 include/drm/i915_pxp_tee_interface.h          |   5 +
 include/linux/mei_cl_bus.h                    |   6 +
 include/uapi/drm/i915_drm.h                   |  16 ++
 32 files changed, 1057 insertions(+), 122 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h

-- 
2.37.2

