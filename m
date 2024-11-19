Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F529D241F
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:55:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AAC110E1C0;
	Tue, 19 Nov 2024 10:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SfSRfFLD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 723FE10E17E;
 Tue, 19 Nov 2024 10:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732013698; x=1763549698;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=cP3NpFnYCE2VlTwo37Ekgyunlpb11aIuuTz70q3MwyU=;
 b=SfSRfFLD8HCjKam0sCNY+AyKYft5I4tHvX4AHrsA7j4CpJIH+rA63koC
 9dTQEQJX2+gyiKDJ8XSpyLY8AaP7YLLAuVV23WnSeRx6itpFheNC36DQP
 UJQkU+OHGWnZmpgLeJ0SkKTqQhuUcjiK6HKD05XSBuWEsbjyd/VYTem3I
 Q0eStNCTGKGAkP/ykLYi+NTMjmG2HkaDbavmuxVzFq9wbQ/ERNpoDIsCQ
 VemngMTj1r9S7c6GhF/DpSHNdaOr7byjAJlbzilMCsiMCadvCUOI0vOU2
 60jy/RHcfRzN+Mj0EyRnhAy0kG6Trl9h2y9FdhJXJ/kjz23xT0osi5a1c A==;
X-CSE-ConnectionGUID: KleqLNGuS9iWObNlltACWQ==
X-CSE-MsgGUID: /mlDNJW1ScWpVMjusZa4Eg==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="43075344"
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="43075344"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2024 02:54:58 -0800
X-CSE-ConnectionGUID: lxz5PSK4S7GyVTZF72feLw==
X-CSE-MsgGUID: KcaxBsBtSYm41OWVQYbYkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,165,1728975600"; d="scan'208";a="89937414"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa009.fm.intel.com with ESMTP; 19 Nov 2024 02:54:56 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv5 0/8] Display Global Histogram
Date: Tue, 19 Nov 2024 16:15:13 +0530
Message-Id: <20241119104521.575377-1-arun.r.murthy@intel.com>
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

Arun R Murthy (8):
  drm/i915/histogram: Define registers for histogram
  drm/i915/histogram: Add support for histogram
  drm/xe: Add histogram support to Xe builds
  drm/i915/histogram: histogram interrupt handling
  drm/i915/histogram: Add crtc properties for global histogram
  drm/i915/histogram: histogram delay counter doesnt reset
  drm/i915/histogram: Histogram changes for Display 20+
  drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   5 +
 drivers/gpu/drm/i915/display/intel_crtc.c     | 168 +++++++-
 drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  18 +
 .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |  15 +
 .../gpu/drm/i915/display/intel_histogram.c    | 370 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  38 ++
 .../drm/i915/display/intel_histogram_regs.h   |  74 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   5 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 702 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

-- 
2.25.1

