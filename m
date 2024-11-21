Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE2C99D4CDF
	for <lists+dri-devel@lfdr.de>; Thu, 21 Nov 2024 13:35:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A5B10E2FD;
	Thu, 21 Nov 2024 12:35:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UIDhCMNq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B2810E2FD;
 Thu, 21 Nov 2024 12:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1732192541; x=1763728541;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=QUkeKr1UMEJja4FWU6lQMi5YFBm0OseWA8REOd4LdsE=;
 b=UIDhCMNqC2r8d0NdrbYjn94PS0MXAsZu6Zrbi67lLAwwnnJD371hyvmb
 I/IyXhNqzQvuaZ66F7Xz6h2YCYc9BLpa3Wwn8byYPJ/Ml3XST4r+IBaVq
 M/451bFO1OreyOUGlAGtODWBfy8mDAcTmfingAFq0xLQYRM0DG+Nr/Iek
 GIvM90UIeEWHTBWP1CImKSFhkaP5HFEy+sJ+hYcGVfPoYSt344y3XAY7a
 6+4KIJiZjMJBh8zdO6embz3vx9pg1Y9jAuuKBFTuJkMCJsv2VbiG5c79q
 wn6eAUJ6WM+j4o2pUvdBCeTAVYDEdBMbYROmRpvMnnoOQXkTM8Huy6xdG w==;
X-CSE-ConnectionGUID: b4SUYmykRHS/+QtQcwanpQ==
X-CSE-MsgGUID: i0RqM5lJS8GTtjBtPXjjRA==
X-IronPort-AV: E=McAfee;i="6700,10204,11263"; a="32230315"
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="32230315"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Nov 2024 04:35:41 -0800
X-CSE-ConnectionGUID: 5ITY0TzqTuCr9GltNqcjqQ==
X-CSE-MsgGUID: JfMM+aNTT32OFECN1kr8zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,172,1728975600"; d="scan'208";a="127765945"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by orviesa001.jf.intel.com with ESMTP; 21 Nov 2024 04:35:39 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCH 0/8] Display Global Histogram
Date: Thu, 21 Nov 2024 17:55:55 +0530
Message-Id: <20241121122603.736267-1-arun.r.murthy@intel.com>
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
 drivers/gpu/drm/i915/display/intel_crtc.c     | 166 +++++++-
 drivers/gpu/drm/i915/display/intel_crtc.h     |   5 +
 drivers/gpu/drm/i915/display/intel_display.c  |  16 +
 .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |  15 +
 .../gpu/drm/i915/display/intel_histogram.c    | 354 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  38 ++
 .../drm/i915/display/intel_histogram_regs.h   |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   5 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 12 files changed, 683 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

-- 
2.25.1

