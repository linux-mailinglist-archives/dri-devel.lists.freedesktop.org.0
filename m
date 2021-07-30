Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 942AE3DBF16
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jul 2021 21:35:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA2456E463;
	Fri, 30 Jul 2021 19:35:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25A7C6E462;
 Fri, 30 Jul 2021 19:35:52 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10061"; a="298746721"
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="298746721"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 12:35:51 -0700
X-IronPort-AV: E=Sophos;i="5.84,282,1620716400"; d="scan'208";a="519071582"
Received: from dhiatt-server.jf.intel.com ([10.54.81.3])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jul 2021 12:35:51 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: <intel-gfx@lists.freedesktop.org>,
	<dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/i915: Fix syncmap memory leak
Date: Fri, 30 Jul 2021 12:53:42 -0700
Message-Id: <20210730195342.110234-1-matthew.brost@intel.com>
X-Mailer: git-send-email 2.28.0
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

A small race exists between intel_gt_retire_requests_timeout and
intel_timeline_exit which could result in the syncmap not getting
free'd. Rather than work to hard to seal this race, simply cleanup the
syncmap on fini.

unreferenced object 0xffff88813bc53b18 (size 96):
  comm "gem_close_race", pid 5410, jiffies 4294917818 (age 1105.600s)
  hex dump (first 32 bytes):
    01 00 00 00 00 00 00 00 00 00 00 00 0a 00 00 00  ................
    00 00 00 00 00 00 00 00 6b 6b 6b 6b 06 00 00 00  ........kkkk....
  backtrace:
    [<00000000120b863a>] __sync_alloc_leaf+0x1e/0x40 [i915]
    [<00000000042f6959>] __sync_set+0x1bb/0x240 [i915]
    [<0000000090f0e90f>] i915_request_await_dma_fence+0x1c7/0x400 [i915]
    [<0000000056a48219>] i915_request_await_object+0x222/0x360 [i915]
    [<00000000aaac4ee3>] i915_gem_do_execbuffer+0x1bd0/0x2250 [i915]
    [<000000003c9d830f>] i915_gem_execbuffer2_ioctl+0x405/0xce0 [i915]
    [<00000000fd7a8e68>] drm_ioctl_kernel+0xb0/0xf0 [drm]
    [<00000000e721ee87>] drm_ioctl+0x305/0x3c0 [drm]
    [<000000008b0d8986>] __x64_sys_ioctl+0x71/0xb0
    [<0000000076c362a4>] do_syscall_64+0x33/0x80
    [<00000000eb7a4831>] entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Matthew Brost <matthew.brost@intel.com>
Fixes: 531958f6f357 ("drm/i915/gt: Track timeline activeness in enter/exit")
Cc: <stable@vger.kernel.org>
---
 drivers/gpu/drm/i915/gt/intel_timeline.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_timeline.c b/drivers/gpu/drm/i915/gt/intel_timeline.c
index c4a126c8caef..1257f4f11e66 100644
--- a/drivers/gpu/drm/i915/gt/intel_timeline.c
+++ b/drivers/gpu/drm/i915/gt/intel_timeline.c
@@ -127,6 +127,15 @@ static void intel_timeline_fini(struct rcu_head *rcu)
 
 	i915_vma_put(timeline->hwsp_ggtt);
 	i915_active_fini(&timeline->active);
+
+	/*
+	 * A small race exists between intel_gt_retire_requests_timeout and
+	 * intel_timeline_exit which could result in the syncmap not getting
+	 * free'd. Rather than work to hard to seal this race, simply cleanup
+	 * the syncmap on fini.
+	 */
+	i915_syncmap_free(&timeline->sync);
+
 	kfree(timeline);
 }
 
-- 
2.28.0

