Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BBFB69E9BBF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Dec 2024 17:34:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C5F210E4C6;
	Mon,  9 Dec 2024 16:34:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wc9xhMBC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B672310E4C2;
 Mon,  9 Dec 2024 16:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1733762088; x=1765298088;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=WsneDXu2cc6IEhKV4/R2d3h/CdyS/UrhBDuIxXKYe+0=;
 b=Wc9xhMBC0D8OOSp+0cNRzSKyBgF8yxNmx9CKp400snSmQwhUMoNtCClq
 XYaPfZ9c5tb0a56SqFhV8/hJWL626Cxd9pJeBFd+3bRzoW2jmERSIkHjH
 OZVXACMUCP5EHbJb4dksUr3CVbBOPKmEU9E20fSiRc1Zp8rnz+Tv3Paks
 HCWvQShPwBCJ2mg39vHNKwG0BzJpGWa0ld+rtwbMko1IjxsstYXSpwJMX
 br268LN6j+8y3IUBegruW9+QAomlktibA+k0p1UVoM+3qBvXewN5icmJw
 fNIQ5CrubkFQP/4g6F35acAdR7NF1PEDZCQRujvmXqL4L6547o9v/swZq g==;
X-CSE-ConnectionGUID: PqoSfkOSSi6wPsarsy7LHw==
X-CSE-MsgGUID: TxDeUFIUSd+ScHTTw4bOiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="56551578"
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="56551578"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2024 08:34:48 -0800
X-CSE-ConnectionGUID: jgZt3P2kT1Gv78YSW9QdLw==
X-CSE-MsgGUID: 2aGN43roTrKgMcf0StWQDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,219,1728975600"; d="scan'208";a="118371640"
Received: from srr4-3-linux-106-armuthy.iind.intel.com ([10.190.238.56])
 by fmviesa002.fm.intel.com with ESMTP; 09 Dec 2024 08:34:46 -0800
From: Arun R Murthy <arun.r.murthy@intel.com>
To: intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: Arun R Murthy <arun.r.murthy@intel.com>
Subject: [PATCHv10 00/10] Display Global Histogram
Date: Mon,  9 Dec 2024 21:54:54 +0530
Message-Id: <20241209162504.2146697-1-arun.r.murthy@intel.com>
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
and https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/3873/diffs?commit_id=270808ca7c8be48513553d95b4a47541f5d40206
The IGT changes for validating the histogram event and reading the
histogram is also pushed for review at https://patchwork.freedesktop.org/series/135789/

Test-with: 20240705091333.328322-1-mohammed.thasleem@intel.com

Arun R Murthy (10):
  drm/crtc: Add histogram properties
  drm/crtc: Expose API to create drm crtc property for histogram
  drm/i915/histogram: Define registers for histogram
  drm/i915/histogram: Add support for histogram
  drm/xe: Add histogram support to Xe builds
  drm/i915/histogram: histogram interrupt handling
  drm/i915/display: handle drm-crtc histogram property updates
  drm/i915/histogram: histogram delay counter doesnt reset
  drm/i915/histogram: Histogram changes for Display 20+
  drm/i915/histogram: Enable pipe dithering

 drivers/gpu/drm/drm_atomic_state_helper.c     |   6 +
 drivers/gpu/drm/drm_atomic_uapi.c             |  17 +
 drivers/gpu/drm/drm_crtc.c                    |  30 ++
 drivers/gpu/drm/i915/Makefile                 |   1 +
 drivers/gpu/drm/i915/display/intel_atomic.c   |   1 +
 drivers/gpu/drm/i915/display/intel_crtc.c     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c  |  17 +
 .../gpu/drm/i915/display/intel_display_irq.c  |   6 +-
 .../drm/i915/display/intel_display_types.h    |   4 +
 .../gpu/drm/i915/display/intel_histogram.c    | 380 ++++++++++++++++++
 .../gpu/drm/i915/display/intel_histogram.h    |  40 ++
 .../drm/i915/display/intel_histogram_regs.h   |  75 ++++
 drivers/gpu/drm/i915/i915_reg.h               |   5 +-
 drivers/gpu/drm/xe/Makefile                   |   1 +
 include/drm/drm_crtc.h                        |  49 +++
 include/uapi/drm/drm_mode.h                   |  11 +
 16 files changed, 647 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.c
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram.h
 create mode 100644 drivers/gpu/drm/i915/display/intel_histogram_regs.h

-- 
2.25.1

