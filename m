Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A565739E5E
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jun 2023 12:20:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5297D10E544;
	Thu, 22 Jun 2023 10:20:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AED710E541;
 Thu, 22 Jun 2023 10:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1687429231; x=1718965231;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=c8zPgWJY6SC59lOQdr8vPRntj39QqPiFfis3EjYD9Kg=;
 b=bS+Fqo4DrIXs58/LH8Sf7ue+TpaHOJGFC0NM/yxQj9WlefitxcMUXSpZ
 jMqRLM/VOjDQ6imo4u/BPIUXY/qL5xxnzQ/weDAxuVNzTzULEJzPCgOBx
 TrYeDNqMtK8n2br9UTSHWDy1OuIDk6bMULvFXxMHGpApldNh1jGYg2Waw
 lDav47hpHj2aSBuW6DxifRa/mZWf4p7kQ1XFMYuDDDaMPLSY4gkOE3IhZ
 hkwVOZl8XMItLiUYbqj0dG5wbbzAkR2WbaxbWqImvtg8G0+OhisdD4Fg6
 vl6M9AjjjReWntZwieI8oEGRLYIuiZ4/msykxUDVGNO2orKWkiSpFsGuO A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="345182170"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="345182170"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:14:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="692193823"
X-IronPort-AV: E=Sophos;i="6.00,263,1681196400"; d="scan'208";a="692193823"
Received: from shari19x-mobl1.gar.corp.intel.com (HELO
 thellstr-mobl1.intel.com) ([10.249.254.173])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2023 03:14:42 -0700
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
To: intel-xe@lists.freedesktop.org
Subject: [PATCH 1/4] drm/ttm: Fix ttm_lru_bulk_move_pos_tail()
Date: Thu, 22 Jun 2023 12:14:09 +0200
Message-Id: <20230622101412.78426-2-thomas.hellstrom@linux.intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
References: <20230622101412.78426-1-thomas.hellstrom@linux.intel.com>
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The value of pos->first was not updated when the first resource of the
range was moved. This could lead to errors like the one below.
Fix this by updating pos->first when needed.

<3> [218.963342] BUG: KASAN: null-ptr-deref in ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
<3> [218.963456] Read of size 8 at addr 0000000000000038 by task xe_evict/1529
<3> [218.963546]
<3> [218.963566] CPU: 0 PID: 1529 Comm: xe_evict Not tainted 6.3.0-xe #1
<3> [218.963664] Hardware name: Intel Corporation Tiger Lake Client Platform/TigerLake H DDR4 SODIMM RVP, BIOS TGLSFWI1.R00.4064.A00.2102041619 02/04/2021
<3> [218.963841] Call Trace:
<3> [218.963881]  <TASK>
<3> [218.963915]  dump_stack_lvl+0x64/0xb0
<3> [218.963976]  print_report+0x3e5/0x600
<3> [218.964036]  ? ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
<3> [218.964127]  kasan_report+0x96/0xc0
<3> [218.964183]  ? ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
<3> [218.964276]  ttm_lru_bulk_move_del+0xc5/0x180 [ttm]
<3> [218.964365]  ttm_bo_set_bulk_move+0x92/0x140 [ttm]
<3> [218.964454]  xe_gem_object_close+0xc8/0x120 [xe]
<3> [218.964675]  ? __pfx_xe_gem_object_close+0x10/0x10 [xe]
<3> [218.964908]  ? drm_gem_object_handle_put_unlocked+0xc7/0x170 [drm]
<3> [218.965071]  drm_gem_object_release_handle+0x45/0x80 [drm]
<3> [218.965220]  ? __pfx_drm_gem_object_release_handle+0x10/0x10 [drm]
<3> [218.965381]  idr_for_each+0xc9/0x180
<3> [218.965437]  ? __pfx_idr_for_each+0x10/0x10
<3> [218.965504]  drm_gem_release+0x20/0x30 [drm]
<3> [218.965637]  drm_file_free.part.0+0x4cb/0x4f0 [drm]
<3> [218.965778]  ? drm_close_helper.isra.0+0xb7/0xe0 [drm]
<3> [218.965921]  drm_release_noglobal+0x49/0x90 [drm]
<3> [218.966061]  __fput+0x122/0x450
<3> [218.966115]  task_work_run+0xfe/0x190
<3> [218.966175]  ? __pfx_task_work_run+0x10/0x10
<3> [218.966239]  ? do_raw_spin_unlock+0xa7/0x140
<3> [218.966308]  do_exit+0x55f/0x1430
<3> [218.966364]  ? __pfx_lock_release+0x10/0x10
<3> [218.966431]  ? do_raw_spin_lock+0x11d/0x1e0
<3> [218.966498]  ? __pfx_do_exit+0x10/0x10
<3> [218.966554]  ? __pfx_do_raw_spin_lock+0x10/0x10
<3> [218.966625]  ? mark_held_locks+0x24/0x90
<3> [218.966688]  ? lockdep_hardirqs_on_prepare+0x136/0x210
<3> [218.966768]  do_group_exit+0x68/0x110
<3> [218.966828]  __x64_sys_exit_group+0x2c/0x30
<3> [218.966896]  do_syscall_64+0x3c/0x90
<3> [218.966955]  entry_SYSCALL_64_after_hwframe+0x72/0xdc
<3> [218.967035] RIP: 0033:0x7f77b194f146
<3> [218.967094] Code: Unable to access opcode bytes at 0x7f77b194f11c.
<3> [218.967174] RSP: 002b:00007ffc64791188 EFLAGS: 00000246 ORIG_RAX: 00000000000000e7
<3> [218.967271] RAX: ffffffffffffffda RBX: 00007f77b1a548a0 RCX: 00007f77b194f146
<3> [218.967364] RDX: 0000000000000062 RSI: 000000000000003c RDI: 0000000000000062
<3> [218.967458] RBP: 0000000000000062 R08: 00000000000000e7 R09: ffffffffffffff78
<3> [218.967553] R10: 0000000000000058 R11: 0000000000000246 R12: 00007f77b1a548a0
<3> [218.967648] R13: 0000000000000003 R14: 00007f77b1a5d2e8 R15: 0000000000000000
<3> [218.967745]  </TASK>

Fixes: fee2ede15542 ("drm/ttm: rework bulk move handling v5")
Cc: "Christian König" <christian.koenig@amd.com>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.19+
Link: https://gitlab.freedesktop.org/drm/xe/kernel/-/issues/411
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/ttm/ttm_resource.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
index 7333f7a87a2f..cb05e0a36576 100644
--- a/drivers/gpu/drm/ttm/ttm_resource.c
+++ b/drivers/gpu/drm/ttm/ttm_resource.c
@@ -86,6 +86,8 @@ static void ttm_lru_bulk_move_pos_tail(struct ttm_lru_bulk_move_pos *pos,
 				       struct ttm_resource *res)
 {
 	if (pos->last != res) {
+		if (pos->first == res)
+			pos->first = list_next_entry(res, lru);
 		list_move(&res->lru, &pos->last->lru);
 		pos->last = res;
 	}
-- 
2.40.1

