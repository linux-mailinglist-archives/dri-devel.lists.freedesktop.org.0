Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D7CA225DE2
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jul 2020 13:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE6D96E38A;
	Mon, 20 Jul 2020 11:54:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B3A6E37F;
 Mon, 20 Jul 2020 11:54:24 +0000 (UTC)
IronPort-SDR: JhMH1A6O7//qjI5edXB8AxsTWYLORFThpE2GcIVv2B8Iy6n3SYGlDeucu6l/H7AGvV7H0dsMLQ
 cov0QpQlqshA==
X-IronPort-AV: E=McAfee;i="6000,8403,9687"; a="149048185"
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="149048185"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2020 04:54:23 -0700
IronPort-SDR: 5sgpX0E+b6Osza77XdCFk8oDkUAVRXp1ym3rt1jYjozczqgDUqQ2R9VuvZK1v47qCuPsYluuPx
 Yg1dWNHQwp+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,374,1589266800"; d="scan'208";a="431586698"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga004.jf.intel.com with ESMTP; 20 Jul 2020 04:54:20 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 0/5] Asynchronous flip implementation for i915
Date: Mon, 20 Jul 2020 17:01:12 +0530
Message-Id: <20200720113117.16131-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, Karthik B S <karthik.b.s@intel.com>,
 dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, daniel.vetter@intel.com, nicholas.kazlauskas@amd.com
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

Karthik B S (5):
  drm/i915: Add enable/disable flip done and flip done handler
  drm/i915: Add support for async flips in I915
  drm/i915: Add checks specific to async flips
  drm/i915: Do not call drm_crtc_arm_vblank_event in async flips
  drm/i915: Enable async flips in i915

 drivers/gpu/drm/i915/display/intel_display.c | 123 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_sprite.c  |  33 ++++-
 drivers/gpu/drm/i915/i915_irq.c              |  83 +++++++++++--
 drivers/gpu/drm/i915/i915_irq.h              |   2 +
 drivers/gpu/drm/i915/i915_reg.h              |   5 +-
 5 files changed, 237 insertions(+), 9 deletions(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
