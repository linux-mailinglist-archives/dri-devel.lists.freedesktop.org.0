Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ED89A69927D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 11:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6999310E2BE;
	Thu, 16 Feb 2023 10:59:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEC0C10E2BE;
 Thu, 16 Feb 2023 10:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676545169; x=1708081169;
 h=from:to:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=4Pkn9PSYJ5E+ITtnoLCo59F8QKqtW+QZqBQ0zPJSloY=;
 b=g+6QLqUuisFoxZGn1fDIFG3SkQS0Q3zbHgpaHmDYoKiSnRuLS3r4bXXI
 /TSQ7RD1vOoA/ndHVnxFmjZXdBGI8evYQoOfgIK1jISLwSwlAOIwApaWj
 5M2VLP5ThA5JKHPuzFbywNSFs4n6DPAcLxdC8X+WnrkYOkhjrZwV/upVA
 CrWDR9VmSXY7HRCBXw2+vB+E2900xV2NA418xV+N8hAECYb+1g0L8xrj8
 j+JITdPb9ZXA3ezBR/SuEd6nk2OPPuylo5oLm4E/cjvVtQZroRlMwXcUG
 VD7BJzRpGOa/nk/q37jpwag5mqz2NL8x5bXhr21wwui4igPl5Et8x9/9a Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="311317593"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="311317593"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:28 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10622"; a="812917903"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="812917903"
Received: from murrayal-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.229.164])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 02:59:27 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC v3 0/9] Waitboost drm syncobj waits
Date: Thu, 16 Feb 2023 10:59:12 +0000
Message-Id: <20230216105921.624960-1-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
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

It is also important to mention that benefits of waitboosting are not only about
workloads related to frame presentation time, but also for serialized
computations which constantly move between the CPU and GPU.

*)
https://gitlab.freedesktop.org/drm/intel/-/issues/8014

v2:
 * Small fixups based on CI feedback:
    * Handle decrement correctly for already signalled case while adding callback.
    * Remove i915 assert which was making sure struct i915_request does not grow.
 * Split out the i915 patch into three separate functional changes.

v3:
 * Handle drivers which open-code callback additions.

Tvrtko Ursulin (9):
  dma-fence: Move i915 helpers into common
  dma-fence: Add callback initialization helper
  drm/i915: Use fence callback initialization helper
  drm/vmwgfx: Use fence callback initialization helper
  dma-fence: Track explicit waiters
  drm/syncobj: Mark syncobj waits as external waiters
  drm/i915: Waitboost external waits
  drm/i915: Mark waits as explicit
  drm/i915: Wait boost requests waited upon by others

 drivers/dma-buf/dma-fence.c                 | 137 ++++++++++++++------
 drivers/gpu/drm/drm_syncobj.c               |   6 +-
 drivers/gpu/drm/i915/gt/intel_breadcrumbs.c |  22 ----
 drivers/gpu/drm/i915/gt/intel_engine_pm.c   |   1 -
 drivers/gpu/drm/i915/i915_active.c          |   2 +-
 drivers/gpu/drm/i915/i915_active.h          |   2 +-
 drivers/gpu/drm/i915/i915_request.c         |  13 +-
 drivers/gpu/drm/vmwgfx/vmwgfx_fence.c       |   2 +-
 include/linux/dma-fence.h                   |  26 ++++
 9 files changed, 141 insertions(+), 70 deletions(-)

-- 
2.34.1

