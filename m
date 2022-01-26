Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D09849D38F
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 21:36:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D19BF10E89C;
	Wed, 26 Jan 2022 20:36:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAE710E421;
 Wed, 26 Jan 2022 20:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1643229386; x=1674765386;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=m6a7ksHqrFBRFuzuDvYBCJL8gq6YspyfPiiCWbUNdnw=;
 b=h9vaGuQE4EXfhKD+bNRHiUA/GKQAuZYOuSrm/jQH1D2X9ba8EnzbzBwW
 V32OT/BrZknb+T1s2g0GXhvdyqVuEAGWIoOc0XbPean5GymSz5gAy2eav
 7UhMHvui0kI6VpE786g6vJcapqK0EnKPWfxEqtWSPfeoOLvxDOnSpvKX8
 0dRyVPXpJFCbzcCKAZuGpwVe4E9nV6ozMRS58p01WLoFVezubByRDSw1X
 +KHgkDrMC5fvK0IvPCjxq1LMcdGmllDSH/TpuqgRglUCLihBv8iznNxxU
 Rc6DAA4EXYFcX/H4QuE4gQHmd0zWesOvGgORxqE6gWauj1vrVI63x+iic g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10239"; a="333000492"
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="333000492"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:22 -0800
X-IronPort-AV: E=Sophos;i="5.88,319,1635231600"; d="scan'208";a="581221487"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jan 2022 12:36:21 -0800
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 00/19] drm/i915/guc: Refactor ADS access to use dma_buf_map
Date: Wed, 26 Jan 2022 12:36:43 -0800
Message-Id: <20220126203702.1784589-1-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: Matthew Brost <matthew.brost@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Matthew Auld <matthew.auld@intel.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 John Harrison <John.C.Harrison@Intel.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While porting i915 to arm64 we noticed some issues accessing lmem.
Some writes were getting corrupted and the final state of the buffer
didn't have exactly what we wrote. This became evident when enabling
GuC submission: depending on the number of engines the ADS struct was
being corrupted and GuC would reject it, refusin to initialize.

From Documentation/core-api/bus-virt-phys-mapping.rst:

	This memory is called "PCI memory" or "shared memory" or "IO memory" or
	whatever, and there is only one way to access it: the readb/writeb and
	related functions. You should never take the address of such memory, because
	there is really nothing you can do with such an address: it's not
	conceptually in the same memory space as "real memory" at all, so you cannot
	just dereference a pointer. (Sadly, on x86 it **is** in the same memory space,
	so on x86 it actually works to just deference a pointer, but it's not
	portable).

When reading or writing words directly to IO memory, in order to be portable
the Linux kernel provides the abstraction detailed in section "Differences
between I/O access functions" of Documentation/driver-api/device-io.rst.

This limits our ability to simply overlay our structs on top a buffer
and directly access it since that buffer may come from IO memory rather than
system memory. Hence the approach taken in intel_guc_ads.c needs to be
refactored. This is not the only place in i915 that neeed to be changed, but
the one causing the most problems, with a real reproducer. This first set of
patch focuses on fixing the gem object to pass the ADS

After the addition of a few helpers in the dma_buf_map API, most of
intel_guc_ads.c can be converted to use it. The exception is the regset
initialization: we'd incur into a lot of extra indirection when
reading/writting each register. So the regset is converted to use a
temporary buffer allocated on probe, which is then copied to its
final location when finishing the initialization or on gt reset.

Testing on some discrete cards, after this change we can correctly pass the
ADS struct to GuC and have it initialized correctly.

thanks
Lucas De Marchi

Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: linux-kernel@vger.kernel.org
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: David Airlie <airlied@linux.ie>
Cc: John Harrison <John.C.Harrison@Intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Matt Roper <matthew.d.roper@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Matthew Brost <matthew.brost@intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>

Lucas De Marchi (19):
  dma-buf-map: Add read/write helpers
  dma-buf-map: Add helper to initialize second map
  drm/i915/gt: Add helper for shmem copy to dma_buf_map
  drm/i915/guc: Keep dma_buf_map of ads_blob around
  drm/i915/guc: Add read/write helpers for ADS blob
  drm/i915/guc: Convert golden context init to dma_buf_map
  drm/i915/guc: Convert policies update to dma_buf_map
  drm/i915/guc: Convert engine record to dma_buf_map
  dma-buf-map: Add wrapper over memset
  drm/i915/guc: Convert guc_ads_private_data_reset to dma_buf_map
  drm/i915/guc: Convert golden context prep to dma_buf_map
  drm/i915/guc: Replace check for golden context size
  drm/i915/guc: Convert mapping table to dma_buf_map
  drm/i915/guc: Convert capture list to dma_buf_map
  drm/i915/guc: Prepare for error propagation
  drm/i915/guc: Use a single pass to calculate regset
  drm/i915/guc: Convert guc_mmio_reg_state_init to dma_buf_map
  drm/i915/guc: Convert __guc_ads_init to dma_buf_map
  drm/i915/guc: Remove plain ads_blob pointer

 drivers/gpu/drm/i915/gt/shmem_utils.c         |  32 ++
 drivers/gpu/drm/i915/gt/shmem_utils.h         |   3 +
 drivers/gpu/drm/i915/gt/uc/intel_guc.h        |  14 +-
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.c    | 374 +++++++++++-------
 drivers/gpu/drm/i915/gt/uc/intel_guc_ads.h    |   3 +-
 .../gpu/drm/i915/gt/uc/intel_guc_submission.c |  11 +-
 include/linux/dma-buf-map.h                   | 127 ++++++
 7 files changed, 405 insertions(+), 159 deletions(-)

-- 
2.35.0

