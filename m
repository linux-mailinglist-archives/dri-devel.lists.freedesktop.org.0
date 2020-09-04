Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CECB725D838
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 14:00:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 753866EB78;
	Fri,  4 Sep 2020 11:59:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7B86EB70;
 Fri,  4 Sep 2020 11:59:57 +0000 (UTC)
IronPort-SDR: SwREaUm37piDTgRQx4+HeB24EW4yUDR+XhDjuyF/HFqiTvCUChvCqoMOsKE0EydsYROrLOa1ZW
 GkTKBu/Ryr8w==
X-IronPort-AV: E=McAfee;i="6000,8403,9733"; a="137781449"
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="137781449"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Sep 2020 04:59:57 -0700
IronPort-SDR: FG/nin/YhzmJdbEa9eCwV5VwN+tTVmC0kOkecrAhCz+R/iys+25e1cKz64rjntW270dZ0nXu0+
 4CcpcQs8gdPw==
X-IronPort-AV: E=Sophos;i="5.76,389,1592895600"; d="scan'208";a="298389665"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 04 Sep 2020 04:59:52 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v7 0/7] Asynchronous flip implementation for i915
Date: Fri,  4 Sep 2020 17:03:23 +0530
Message-Id: <20200904113330.19815-1-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Without async flip support in the kernel, fullscreen apps where game
resolution is equal to the screen resolution, must perform an extra blit
per frame prior to flipping.

Asynchronous page flips will also boost the FPS of Mesa benchmarks.

v2: -Few patches have been squashed and patches have been shuffled as
     per the reviews on the previous version.

v3: -Few patches have been squashed and patches have been shuffled as
     per the reviews on the previous version.

v4: -Made changes to fix the sequence and time stamp issue as per the
     comments received on the previous version.
    -Timestamps are calculated using the flip done time stamp and current
     timestamp. Here I915_MODE_FLAG_GET_SCANLINE_FROM_TIMESTAMP flag is used
     for timestamp calculations.
    -Event is sent from the interrupt handler immediately using this
     updated timestamps and sequence.
    -Added more state checks as async flip should only allow change in plane
     surface address and nothing else should be allowed to change.
    -Added a separate plane hook for async flip.
    -Need to find a way to reject fbc enabling if it comes as part of this
     flip as bspec states that changes to FBC are not allowed.

v5: -Fixed the Checkpatch and sparse warnings.

v6: -Reverted back to the old timestamping code as per the feedback received.
    -Added documentation.

v7: -Changes in intel_atomic_check_async()
    -Add vfunc for skl_program_async_surface_address()

Test-with: <20200904102215.4440-1-karthik.b.s@intel.com>

Karthik B S (7):
  drm/i915: Add enable/disable flip done and flip done handler
  drm/i915: Add support for async flips in I915
  drm/i915: Add checks specific to async flips
  drm/i915: Do not call drm_crtc_arm_vblank_event in async flips
  drm/i915: Add dedicated plane hook for async flip case
  Documentation/gpu: Add asynchronous flip documentation for i915
  drm/i915: Enable async flips in i915

 Documentation/gpu/i915.rst                    |   6 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  | 157 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   3 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  30 ++++
 drivers/gpu/drm/i915/i915_irq.c               |  52 ++++++
 drivers/gpu/drm/i915/i915_irq.h               |   2 +
 drivers/gpu/drm/i915/i915_reg.h               |   1 +
 8 files changed, 258 insertions(+)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
