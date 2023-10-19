Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BCA7CFD60
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 16:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38A410E0C9;
	Thu, 19 Oct 2023 14:54:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2213110E0B9;
 Thu, 19 Oct 2023 14:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697727259; x=1729263259;
 h=date:from:to:cc:subject:message-id:mime-version:
 content-transfer-encoding;
 bh=Kn71K5mO6K95/W6p7YQmLjomTEZKnpmAbVxRS+0H3FU=;
 b=Xbmqs+WT5Le/MUKp6vnNSicTLFSmv79cZ8fyiz8Nc8Ez8O/D+OFCcwYr
 gY0i2zQXV1b5H2NJqKGmGepeeQ516XN/KezsIOtwc6QbYkYOpFoc9feln
 Z4lnd8TVaDCtGYXX+rWRTfx8EEADsK2FU/KQQyDg/denZJWJzHs0sYfbj
 8zO/0r3FqIrkE2yDU5j90cQbTBH0B1vFgS+a1vgP4Bn7w5779R4CQ4Txs
 SbyMUgUJwWgA+pCMvkVnx+DB+wU5EVTZ8BxL1vDwCYpxZRNjoOqJIc3sa
 idbN9R/gYyn0S0UIDa7jnD+uGthrYBUu1z/JkkktSb+4rtuaj4S1NsC05 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="472503081"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="472503081"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:54:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="873521556"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; d="scan'208";a="873521556"
Received: from vgowrish-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.213.218.20])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Oct 2023 07:54:15 -0700
Date: Thu, 19 Oct 2023 15:54:13 +0100
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel.vetter@ffwll.ch>
Subject: [PULL] drm-intel-gt-next
Message-ID: <ZTFDFSbd/U7YP+hI@tursulin-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 dim-tools@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Dave, Daniel,

Here is the final pull request for 6.7.

As indicated that it may happen in the last pull, the remaining
missing functionality for Meteorlake, enabling the GuC based TLB
invalidation, has since been merged and platform thought to be ready for
lifting out of force probe status.

Also for Meteorlake a correction on how L3 flushing is done landed.

Otherwise one fix for perf/OA and one for mmap gtt handling and some code
base cleanups.

Regards,

Tvrtko

drm-intel-gt-next-2023-10-19:
Driver Changes:

Fixes/improvements/new stuff:

- Retry gtt fault when out of fence registers (Ville Syrjälä)
- Determine context valid in OA reports [perf] (Umesh Nerlige Ramappa)

Future platform enablement:

- GuC based TLB invalidation for Meteorlake (Jonathan Cavitt, Prathap Kumar Valsan)
- Don't set PIPE_CONTROL_FLUSH_L3 [mtl] (Vinay Belgaumkar)

Miscellaneous:

- Clean up zero initializers [guc,pxp] (Ville Syrjälä)
- Prevent potential null-ptr-deref in engine_init_common (Nirmoy Das)
The following changes since commit 039adf3947252693f7c882607dac2dc67e7f7ab2:

  drm/i915: More use of GT specific print helpers (2023-10-10 15:40:26 -0700)

are available in the Git repository at:

  git://anongit.freedesktop.org/drm/drm-intel tags/drm-intel-gt-next-2023-10-19

for you to fetch changes up to 7eeaedf79989a8f131939782832e21e9218ed2a0:

  drm/i915/perf: Determine context valid in OA reports (2023-10-18 16:19:56 -0700)

----------------------------------------------------------------
Driver Changes:

Fixes/improvements/new stuff:

- Retry gtt fault when out of fence registers (Ville Syrjälä)
- Determine context valid in OA reports [perf] (Umesh Nerlige Ramappa)

Future platform enablement:

- GuC based TLB invalidation for Meteorlake (Jonathan Cavitt, Prathap Kumar Valsan)
- Don't set PIPE_CONTROL_FLUSH_L3 [mtl] (Vinay Belgaumkar)

Miscellaneous:

- Clean up zero initializers [guc,pxp] (Ville Syrjälä)
- Prevent potential null-ptr-deref in engine_init_common (Nirmoy Das)

----------------------------------------------------------------
Jonathan Cavitt (6):
      drm/i915: Add GuC TLB Invalidation device info flags
      drm/i915/guc: Add CT size delay helper
      drm/i915: No TLB invalidation on suspended GT
      drm/i915: No TLB invalidation on wedged GT
      drm/i915/gt: Increase sleep in gt_tlb selftest sanitycheck
      drm/i915: Enable GuC TLB invalidations for MTL

Nirmoy Das (1):
      drm/i915: Prevent potential null-ptr-deref in engine_init_common

Prathap Kumar Valsan (1):
      drm/i915: Define and use GuC and CTB TLB invalidation routines

Umesh Nerlige Ramappa (1):
      drm/i915/perf: Determine context valid in OA reports

Ville Syrjälä (3):
      drm/i915: Retry gtt fault when out of fence registers
      drm/i915/guc: Clean up zero initializers
      drm/i915/pxp: Clean up zero initializers

Vinay Belgaumkar (1):
      drm/i915/mtl: Don't set PIPE_CONTROL_FLUSH_L3

 drivers/gpu/drm/i915/gem/i915_gem_mman.c          |   1 +
 drivers/gpu/drm/i915/gt/gen8_engine_cs.c          |   7 +-
 drivers/gpu/drm/i915/gt/intel_engine_cs.c         |   3 +-
 drivers/gpu/drm/i915/gt/intel_ggtt.c              |  30 ++-
 drivers/gpu/drm/i915/gt/intel_tlb.c               |  16 +-
 drivers/gpu/drm/i915/gt/selftest_tlb.c            |  11 +-
 drivers/gpu/drm/i915/gt/uc/abi/guc_actions_abi.h  |  33 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc.h            |  23 +++
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c    |   4 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.c         |  38 ++++
 drivers/gpu/drm/i915/gt/uc/intel_guc_ct.h         |   2 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_fwif.h       |   1 +
 drivers/gpu/drm/i915/gt/uc/intel_guc_submission.c | 233 +++++++++++++++++++++-
 drivers/gpu/drm/i915/gt/uc/intel_uc.c             |   7 +
 drivers/gpu/drm/i915/i915_drv.h                   |   2 +
 drivers/gpu/drm/i915/i915_pci.c                   |   1 +
 drivers/gpu/drm/i915/i915_perf.c                  |   4 +-
 drivers/gpu/drm/i915/intel_device_info.h          |   1 +
 drivers/gpu/drm/i915/pxp/intel_pxp_gsccs.c        |   8 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_huc.c          |   4 +-
 drivers/gpu/drm/i915/pxp/intel_pxp_tee.c          |   8 +-
 21 files changed, 407 insertions(+), 30 deletions(-)
