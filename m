Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A557C9862EE
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 17:18:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5460610EA31;
	Wed, 25 Sep 2024 15:18:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HGTALtUZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A467910E14D;
 Wed, 25 Sep 2024 15:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727277485; x=1758813485;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=I0suoG7GHmfD73CrkUDPKjvZhFICcm/G9SkkiX/7+F0=;
 b=HGTALtUZ7WB7B+76WMXvx5W3yTTFR4q6fqBHeiEC4pWBmjUZM33vsPm8
 Djtix+v3fYr151JeQ95ISNTJGTl4NF/sfoVolV/SJbCWqg4VAGCTL/047
 Rm98WDahgmi5pE8XOkEVTJLha1g/DvbsFwWmoFwzt1mJinis9w7WeLnPK
 txiduiGb5DbWfgXBcSCGMRSc0Z0cFsBWCR7teNK10ylkj4QFLohR55MPu
 Wl8GjG0AKVHBvhEtipHRlEXYSiGG1p8XAA9ZoqsRIAVOPsa4g3dCTUYtF
 zM1zPrC05cRuojnj+zGMLFk5+jKiQMfyIhFo9Gu70Oykagl6G+J1iIJsh Q==;
X-CSE-ConnectionGUID: LxVd0eLBR46Pm+lcMMlPrw==
X-CSE-MsgGUID: X1+2vKUzSg+bmsKJgD+dKw==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="48866834"
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="48866834"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Sep 2024 08:17:47 -0700
X-CSE-ConnectionGUID: qMS2JHUfSuGtYHRf6gc3bw==
X-CSE-MsgGUID: ZeNS2yKoTBeMD+USkhYlNA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,257,1719903600"; d="scan'208";a="76612928"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa003.jf.intel.com with ESMTP; 25 Sep 2024 08:17:45 -0700
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv4 0/7] Display Global Histogram
Date: Wed, 25 Sep 2024 20:37:47 +0530
Message-Id: <20240925150754.1876893-1-arun.r.murthy@intel.com>
X-Mailer: git-send-email 2.25.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Display histogram is a hardware functionality where a statistics for 'x'
number of frames is generated to form a histogram data. This is notified
to the user via histogram event. Compositor will then upon sensing the
histogram event will read the histogram data from KMD via crtc property.
A library can be developed to take this generated histogram as an
input and apply some algorithm to generate an Image EnhancemenT(IET).
This is further fed back to the KMD via crtc property. KMD will use this
IET as a multiplicand factor to multiply with the incoming pixels at the
end of the pipe which is then pushed onto the display.

One such library Global Histogram Enhancement(GHE) will take the histogram
as input and applied the algorithm to enhance the density and then
return the enhanced factor. This library can be located @
https://github.com/intel/ghe

The corresponding mutter changes to enable/disable histogram, read the
histogram data, communicate with the library and write the enhanced data
back to the KMD is also pushed for review at https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873
The IGT changes for validating the histogram event and reading the
histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/

Test-with: 20240705091333.328322-1-mohammed.thasleem@intel.com

Arun R Murthy (7):
  drm/i915/histogram: Define registers for histogram
  drm/i915/histogram: Add support for histogram
  drm/xe: Add histogram support to Xe builds
  drm/i915/histogram: histogram interrupt handling
  drm/i915/histogram: Add crtc properties for global histogram
  drm/i915/histogram: histogram delay counter doesnt reset
  drm/i915/histogram: Histogram changes for Display 20+

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
 drivers/gpu/drm/i915/display/intel_crtc.c     | 169 ++++++++-
 drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  13 +
 .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |  15 +
 .../gpu/drm/i915/display/intel_histogram.c    | 352 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  38 ++
 .../drm/i915/display/intel_histogram_reg.h    |  80 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   5 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 686 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_reg.h

-- 
2.25.1

