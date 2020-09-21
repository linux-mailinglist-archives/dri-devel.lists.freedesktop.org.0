Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB3A127226A
	for <lists+dri-devel@lfdr.de>; Mon, 21 Sep 2020 13:28:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B209A89817;
	Mon, 21 Sep 2020 11:28:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C9D489817;
 Mon, 21 Sep 2020 11:28:22 +0000 (UTC)
IronPort-SDR: 3eWinajU9EFKSTYST119oE9iKT/MDoDdnWS1oWpGJLtncaZpeJKuvGRTn3M6L0Ts5yecNa/D/v
 6AJOg0XTopKA==
X-IronPort-AV: E=McAfee;i="6000,8403,9750"; a="148014075"
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="148014075"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Sep 2020 04:28:18 -0700
IronPort-SDR: Uj3QgbhghSDCwnGrL2ljX642DfZ6D8xESISPdGND4rcuwhPmRzS51g0e3hUCeaAtFRSmBqvrlP
 4+hVBxTT+gfQ==
X-IronPort-AV: E=Sophos;i="5.77,286,1596524400"; d="scan'208";a="454008986"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 21 Sep 2020 04:28:15 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v10 0/8] Asynchronous flip implementation for i915
Date: Mon, 21 Sep 2020 16:32:02 +0530
Message-Id: <20200921110210.21182-1-karthik.b.s@intel.com>
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

v8: -Add WA for older platforms with double buffered
     async address update enable bit.

v9: -Changes as per feedback received on previous version.

v10: -Changes as per feedback received on previous version.

Karthik B S (8):
  drm/i915: Add enable/disable flip done and flip done handler
  drm/i915: Add support for async flips in I915
  drm/i915: Add checks specific to async flips
  drm/i915: Do not call drm_crtc_arm_vblank_event in async flips
  drm/i915: Add dedicated plane hook for async flip case
  drm/i915: WA for platforms with double buffered address update enable
    bit
  Documentation/gpu: Add asynchronous flip documentation for i915
  drm/i915: Enable async flips in i915

 Documentation/gpu/i915.rst                    |   6 +
 .../gpu/drm/i915/display/intel_atomic_plane.c |   6 +-
 drivers/gpu/drm/i915/display/intel_display.c  | 199 ++++++++++++++++++
 .../drm/i915/display/intel_display_types.h    |   3 +
 drivers/gpu/drm/i915/display/intel_sprite.c   |  30 +++
 drivers/gpu/drm/i915/i915_irq.c               |  52 +++++
 drivers/gpu/drm/i915/i915_irq.h               |   3 +
 drivers/gpu/drm/i915/i915_reg.h               |   1 +
 8 files changed, 299 insertions(+), 1 deletion(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
