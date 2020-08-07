Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95D23EB0B
	for <lists+dri-devel@lfdr.de>; Fri,  7 Aug 2020 12:01:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9602A6E9B3;
	Fri,  7 Aug 2020 10:01:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D6166E9B3;
 Fri,  7 Aug 2020 10:01:43 +0000 (UTC)
IronPort-SDR: 6SIBp2BbrCQNInadZilLMHW+2jb56X20TfmjZl9xVZL8mmR/f7E+IdG2pMCaPBF9wTex0z4jvb
 3ND2ArUf/p7w==
X-IronPort-AV: E=McAfee;i="6000,8403,9705"; a="132604136"
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="132604136"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Aug 2020 03:01:42 -0700
IronPort-SDR: uP17cghi6CrmO6qEZztzamxQHUs7zAQaEc+pkIkCWCGFijRM8zfRlSyp/RA3eoyyUwBsKDKzOS
 3d2RlKYFJVBQ==
X-IronPort-AV: E=Sophos;i="5.75,445,1589266800"; d="scan'208";a="468178347"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 07 Aug 2020 03:01:39 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 0/7] Asynchronous flip implementation for i915
Date: Fri,  7 Aug 2020 15:05:44 +0530
Message-Id: <20200807093551.10673-1-karthik.b.s@intel.com>
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

Test-with: <20200806132935.23293-1-karthik.b.s@intel.com>

Karthik B S (7):
  drm/i915: Add enable/disable flip done and flip done handler
  drm/i915: Add support for async flips in I915
  drm/i915: Add checks specific to async flips
  drm/i915: Do not call drm_crtc_arm_vblank_event in async flips
  drm/i915: Add dedicated plane hook for async flip case
  Documentation/gpu: Add asynchronous flip documentation for i915
  drm/i915: Enable async flips in i915

 Documentation/gpu/i915.rst                   |   6 +
 drivers/gpu/drm/i915/display/intel_display.c | 127 +++++++++++++++++++
 drivers/gpu/drm/i915/display/intel_sprite.c  |  33 ++++-
 drivers/gpu/drm/i915/i915_irq.c              |  52 ++++++++
 drivers/gpu/drm/i915/i915_irq.h              |   2 +
 drivers/gpu/drm/i915/i915_reg.h              |   1 +
 6 files changed, 220 insertions(+), 1 deletion(-)

-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
