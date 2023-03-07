Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5639F6ADC47
	for <lists+dri-devel@lfdr.de>; Tue,  7 Mar 2023 11:48:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D20A310E424;
	Tue,  7 Mar 2023 10:48:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B7F310E40A;
 Tue,  7 Mar 2023 10:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678186113; x=1709722113;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=6CPBHUBx+3uLtFyAK1U6D3tKYvD0iq3OhcfWBSt5gmk=;
 b=CF5AHHM0+MQbzCe2ase7Cbm0RMbiB2KRswpuLUkX7ScaJLp6axsWQ4nl
 Nc2XMkrlh20cZiRlStck3G+hsoQsZ0uNTes6toHBvPvJM2h6eC2fryKWw
 oCPOrbZ+C8flzPFUDJTD2XCleu1PLe406fRKh3SCMkvJwXjnQ6XbY/08u
 e6k6FF8L5ptHGAbpSRtoyG4sH1hMpF3WoIF0ytp9ad7N1Hvf7IYzQ447i
 qaw0nYuatUltfiqabSLeJXayqm/PsyjH/+AnQgC06z13kzE6gA0no0p7u
 1oS1OFlRW5Btm2grkh9tESbWKXms0TS/492p5gpTue4HnzYBv2X0Ou+u2 g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="400643403"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="400643403"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10641"; a="819712792"
X-IronPort-AV: E=Sophos;i="5.98,240,1673942400"; d="scan'208";a="819712792"
Received: from tanzeelu-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.205.53])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2023 02:48:31 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v4 00/12] Waitboost drm syncobj waits
Date: Tue,  7 Mar 2023 10:48:12 +0000
Message-Id: <20230307104824.231094-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.37.2
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
Cc: Matt Turner <mattst88@gmail.com>, Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

In i915 we have this concept of "wait boosting" where we give a priority boost
for instance to fences which are actively waited upon from userspace. This has
it's pros and cons and can certainly be discussed at lenght. However fact is
some workloads really like it.

Problem is that with the arrival of drm syncobj and a new userspace waiting
entry point it added, the waitboost mechanism was bypassed. AFAIU this mostly
happens with all Vulkan based userspaces. Hence I cooked up this mini series to
see if discussion about restoring the waitboost can be had.

The series adds a concept of "wait count" to dma fence which is intended to
represent explicit userspace waits. It is therefore incremented for every
explicit dma_fence_enable_sw_signaling and dma_fence_add_wait_callback (like
dma_fence_add_callback but from explicit/userspace wait paths). Individual
drivers can then inspect this via dma_fence_wait_count() and decide to wait
boost the waits on such fences.

Patch has been slightly tested for performance impact by Google using some clvk
workloads and shows a good improvement (frame time improved from 16ms to 13ms).

It is also important to mention that although benefits of waitboosting may not
only be with workloads related to frame presentation time, but also with
serialized computations which constantly move between the CPU and GPU, there are
also workloads which do not improve on the performance but degrade on
efficiency. Therefore extending this approach needs to be carefully evaluated.

*)
https://gitlab.freedesktop.org/drm/intel/-/issues/8014

v2:
 * Small fixups based on CI feedback:
    * Handle decrement correctly for already signalled case while adding callback.
    * Remove i915 assert which was making sure struct i915_request does not grow.
 * Split out the i915 patch into three separate functional changes.

v3:
 * Handle drivers which open-code callback additions.

v4:
 * Handle dma-fence-array and dma-fence-chain.

Tvrtko Ursulin (12):
  dma-fence: Move i915 helpers into common
  dma-fence: Add callback initialization helper
  drm/i915: Use fence callback initialization helper
  drm/vmwgfx: Use fence callback initialization helper
  dma-fence: Track explicit waiters
  dma-fence: Export __dma_fence_add_callback
  dma-fence-array: Propagate wait status to contained fences
  dma-fence-chain: Propagate wait status to contained fences
  drm/syncobj: Mark syncobj waits as external waiters
  drm/i915: Waitboost external waits
  drm/i915: Mark waits as explicit
  drm/i915: Wait boost requests waited upon by others

 drivers/dma-buf/dma-fence-array.c           |   5 +-
 drivers/dma-buf/dma-fence-chain.c           |  22 +++-
 drivers/dma-buf/dma-fence.c                 | 138 ++++++++++++++------
 drivers/gpu/drm/drm_syncobj.c               |   6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  22 ----
 drivers/gpu/drm/i915/gt/intel_engine_pm.c   |   1 -
 drivers/gpu/drm/i915/i915_active.c          |   2 +-
 drivers/gpu/drm/i915/i915_active.h          |   2 +-
 drivers/gpu/drm/i915/i915_request.c         |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c       |   2 +-
 include/linux/dma-fence-chain.h             |   1 +
 include/linux/dma-fence.h                   |  29 ++++
 12 files changed, 165 insertions(+), 78 deletions(-)

-- 
2.37.2

