Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A6765B2ACD
	for <lists+dri-devel@lfdr.de>; Fri,  9 Sep 2022 02:11:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF9D010E842;
	Fri,  9 Sep 2022 00:11:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88EC510E842;
 Fri,  9 Sep 2022 00:11:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662682291; x=1694218291;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=wLc1ngeda7PE/ncDEgWIHHTAZmY5K62s8QD4O1DbyTM=;
 b=WZ6kNJ6FmroT4BHFyIZTwmU07HE3PDoN8VkuUFBMCddh5EqjNHTxOFu3
 m+zY+0lpbGHtnB0vzDZizn/q4b3RWYkwKqmrI1pwIOqbix2piQxa6hAaS
 U8toZI517pdE7Wf7Y6L4qBA5oWjLCiKa4fIieA1+C32R1EcdLazZTeuRJ
 k4UNL+pqGISdxyOKax8GOI66PK/nUMdpvMBb/rFuQhESQIvox5x9DqSRY
 ccMl0rennRk+4PlQof3PlsHwgYHt2OxiaHTKiK8D14z1dNEnRu53Fx1JR
 rXrPWG5HWGMvYz1X9n94maMYqKvzR58qhchiqfprg7yOxWXS8hOGt1gLi A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10464"; a="323560020"
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="323560020"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:11:30 -0700
X-IronPort-AV: E=Sophos;i="5.93,300,1654585200"; d="scan'208";a="645316121"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2022 17:11:30 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 00/15] 
Date: Thu,  8 Sep 2022 17:10:40 -0700
Message-Id: <20220909001055.728322-1-daniele.ceraolospurio@intel.com>
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

Test-with: 20220818224216.3920822-1-daniele.ceraolospurio@intel.com
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
 drivers/misc/mei/bus.c                        | 145 +++++++++-
 drivers/misc/mei/client.c                     |  55 ++--
 drivers/misc/mei/hbm.c                        |  13 +
 drivers/misc/mei/hw-me.c                      |   7 +-
 drivers/misc/mei/hw.h                         |  65 ++++-
 drivers/misc/mei/interrupt.c                  |  47 +++-
 drivers/misc/mei/mei_dev.h                    |   8 +
 drivers/misc/mei/pxp/mei_pxp.c                |  41 ++-
 include/drm/i915_pxp_tee_interface.h          |   5 +
 include/linux/mei_cl_bus.h                    |   6 +
 include/uapi/drm/i915_drm.h                   |  16 ++
 32 files changed, 1035 insertions(+), 122 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c
 create mode 100644 drivers/gpu/drm/i915/pxp/intel_pxp_huc.h

-- 
2.37.2

