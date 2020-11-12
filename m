Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE022B127D
	for <lists+dri-devel@lfdr.de>; Fri, 13 Nov 2020 00:08:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 524AC6E11C;
	Thu, 12 Nov 2020 23:08:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C74806E11C;
 Thu, 12 Nov 2020 23:08:11 +0000 (UTC)
IronPort-SDR: Mxn4CMPyJrpiN19ZLUQhwFILgAaanXXkK+HkZTYGGogij9Js2XDFZS7oRGxYevu1keMtzYmqGM
 Tpc+yVPo4AJw==
X-IronPort-AV: E=McAfee;i="6000,8403,9803"; a="170502788"
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="170502788"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 15:08:11 -0800
IronPort-SDR: +60xKw88dSdNB7zWdJnzxRFxnaun3KryWmUxYxTUO6hOtip6pDWRSMTBpz3rrTpydODdZxZOpj
 1Ao4gEBQjzZg==
X-IronPort-AV: E=Sophos;i="5.77,473,1596524400"; d="scan'208";a="308985666"
Received: from rdvivi-losangeles.jf.intel.com (HELO intel.com)
 ([10.165.21.201])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Nov 2020 15:08:10 -0800
Date: Thu, 12 Nov 2020 18:09:24 -0500
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-fixes
Message-ID: <20201112230924.GA1283868@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
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
Cc: dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave and Daniel,

This is the same set as last week + couple new fixes targeting stable.

Thanks,
Rodrigo.

drm-intel-fixes-2020-11-12-1:
- GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
- Fix set domain's cache coherency (Chris)
- Fixes around breadcrumbs (Chris)
- Fix encoder lookup during PSR atomic (Imre)
- Hold onto an explicit ref to i915_vma_work.pinned (Chris)
- Pull phys pread/pwrite implementations to the backend (Chris)
- Correctly set SFC capability for video engines
The following changes since commit 3cea11cd5e3b00d91caf0b4730194039b45c5891:

  Linux 5.10-rc2 (2020-11-01 14:43:51 -0800)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-fixes-2020-11-12-1

for you to fetch changes up to a4264790f4c2f0062d27d8173344c914bc7884e0:

  drm/i915: Correctly set SFC capability for video engines (2020-11-12 16:41:54 -0500)

----------------------------------------------------------------
- GVT fixes including vGPU suspend/resume fixes and workaround for APL guest GPU hang.
- Fix set domain's cache coherency (Chris)
- Fixes around breadcrumbs (Chris)
- Fix encoder lookup during PSR atomic (Imre)
- Hold onto an explicit ref to i915_vma_work.pinned (Chris)
- Pull phys pread/pwrite implementations to the backend (Chris)
- Correctly set SFC capability for video engines

----------------------------------------------------------------
Chris Wilson (6):
      drm/i915/gem: Flush coherency domains on first set-domain-ioctl
      drm/i915/gt: Use the local HWSP offset during submission
      drm/i915/gt: Expose more parameters for emitting writes into the ring
      drm/i915/gt: Flush xcs before tgl breadcrumbs
      drm/i915: Hold onto an explicit ref to i915_vma_work.pinned
      drm/i915/gem: Pull phys pread/pwrite implementations to the backend

Colin Xu (4):
      drm/i915/gvt: Allow zero out HWSP addr on hws_pga_write
      drm/i915/gvt: Set SNOOP for PAT3 on BXT/APL to workaround GPU BB hang
      drm/i915/gvt: Only pin/unpin intel_context along with workload
      drm/i915/gvt: Fix mmio handler break on BXT/APL.

Imre Deak (1):
      drm/i915: Fix encoder lookup during PSR atomic check

Matthew Auld (1):
      drm/i915/gem: Allow backends to override pread implementation

Venkata Sandeep Dhanalakota (1):
      drm/i915: Correctly set SFC capability for video engines

 drivers/gpu/drm/i915/display/intel_psr.c         |  2 +-
 drivers/gpu/drm/i915/gem/i915_gem_domain.c       | 28 ++++++------
 drivers/gpu/drm/i915/gem/i915_gem_object_types.h |  2 +
 drivers/gpu/drm/i915/gem/i915_gem_phys.c         | 55 ++++++++++++++++++++++++
 drivers/gpu/drm/i915/gt/intel_engine.h           | 55 +++++++++++++++---------
 drivers/gpu/drm/i915/gt/intel_engine_cs.c        |  3 +-
 drivers/gpu/drm/i915/gt/intel_lrc.c              | 31 +++++++++----
 drivers/gpu/drm/i915/gt/intel_timeline.c         | 18 ++++----
 drivers/gpu/drm/i915/gt/intel_timeline_types.h   |  2 +
 drivers/gpu/drm/i915/gvt/handlers.c              | 47 ++++++++++++++++++--
 drivers/gpu/drm/i915/gvt/scheduler.c             | 15 ++++---
 drivers/gpu/drm/i915/i915_gem.c                  | 32 +++-----------
 drivers/gpu/drm/i915/i915_vma.c                  |  6 ++-
 13 files changed, 204 insertions(+), 92 deletions(-)
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
