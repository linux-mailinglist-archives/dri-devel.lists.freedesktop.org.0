Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A860486924
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 18:49:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6167B10ED98;
	Thu,  6 Jan 2022 17:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CD5110ED98;
 Thu,  6 Jan 2022 17:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1641491371; x=1673027371;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=9UUfIakJFEIFcVy2zf3eVamvfxFBZePzHHEtcL/2UqE=;
 b=U1Pt9u3BWz7Njog+zbwTDcZ6oW4XmZimfMKtLxx0G83C/g3C3JzkXbPF
 ifNmvRvbYbLtuiaMprbkSeqjefoHHE37TnOVb6WwPjgxyR40DaPYh5JYu
 pPgMF4bc4KXj2i1iuFz0UH1zvVvMgN2GyyHE2AZSqNgjUKjx6rSJqSQ2d
 35ble1ifMZCXecCZw74R+lGVKbz99qw4i5mRMOAbatnPgc0ou8l6z9okY
 lOob4/o44RxB99qk4WMtbJa3cU4jGmmfLMMgPMmibYOmh3GZTGO8UK2DG
 FckzKhX+TI59ucCDV7R1SLR6JnqRHt3poRqNOmMUbq8EMDr/5IWdkZxXo g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10217"; a="266993570"
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="266993570"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 09:49:21 -0800
X-IronPort-AV: E=Sophos;i="5.88,267,1635231600"; d="scan'208";a="473015572"
Received: from lsgoh-mobl1.gar.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.249.65.184])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Jan 2022 09:49:18 -0800
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v3 1/4] drm/i915: don't call free_mmap_offset when purging
Date: Thu,  6 Jan 2022 17:49:07 +0000
Message-Id: <20220106174910.280616-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.31.1
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
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The TTM backend is in theory the only user here(also purge should only
be called once we have dropped the pages), where it is setup at object
creation and is only removed once the object is destroyed. Also
resetting the node here might be iffy since the ttm fault handler
uses the stored fake offset to determine the page offset within the pages
array.

This also blows up in the dontneed-before-mmap test, since the
expectation is that the vma_node will live on, until the object is
destroyed:

<2> [749.062902] kernel BUG at drivers/gpu/drm/i915/gem/i915_gem_ttm.c:943!
<4> [749.062923] invalid opcode: 0000 [#1] PREEMPT SMP NOPTI
<4> [749.062928] CPU: 0 PID: 1643 Comm: gem_madvise Tainted: G     U  W         5.16.0-rc8-CI-CI_DRM_11046+ #1
<4> [749.062933] Hardware name: Gigabyte Technology Co., Ltd. GB-Z390 Garuda/GB-Z390 Garuda-CF, BIOS IG1c 11/19/2019
<4> [749.062937] RIP: 0010:i915_ttm_mmap_offset.cold.35+0x5b/0x5d [i915]
<4> [749.063044] Code: 00 48 c7 c2 a0 23 4e a0 48 c7 c7 26 df 4a a0 e8 95 1d d0 e0 bf 01 00 00 00 e8 8b ec cf e0 31 f6 bf 09 00 00 00 e8 5f 30 c0 e0 <0f> 0b 48 c7 c1 24 4b 56 a0 ba 5b 03 00 00 48 c7 c6 c0 23 4e a0 48
<4> [749.063052] RSP: 0018:ffffc90002ab7d38 EFLAGS: 00010246
<4> [749.063056] RAX: 0000000000000240 RBX: ffff88811f2e61c0 RCX: 0000000000000006
<4> [749.063060] RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000009
<4> [749.063063] RBP: ffffc90002ab7e58 R08: 0000000000000001 R09: 0000000000000001
<4> [749.063067] R10: 000000000123d0f8 R11: ffffc90002ab7b20 R12: ffff888112a1a000
<4> [749.063071] R13: 0000000000000004 R14: ffff88811f2e61c0 R15: ffff888112a1a000
<4> [749.063074] FS:  00007f6e5fcad500(0000) GS:ffff8884ad600000(0000) knlGS:0000000000000000
<4> [749.063078] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
<4> [749.063081] CR2: 00007efd264e39f0 CR3: 0000000115fd6005 CR4: 00000000003706f0
<4> [749.063085] Call Trace:
<4> [749.063087]  <TASK>
<4> [749.063089]  __assign_mmap_offset+0x41/0x300 [i915]
<4> [749.063171]  __assign_mmap_offset_handle+0x159/0x270 [i915]
<4> [749.063248]  ? i915_gem_dumb_mmap_offset+0x70/0x70 [i915]
<4> [749.063325]  drm_ioctl_kernel+0xae/0x140
<4> [749.063330]  drm_ioctl+0x201/0x3d0
<4> [749.063333]  ? i915_gem_dumb_mmap_offset+0x70/0x70 [i915]
<4> [749.063409]  ? do_user_addr_fault+0x200/0x670
<4> [749.063415]  __x64_sys_ioctl+0x6d/0xa0
<4> [749.063419]  do_syscall_64+0x3a/0xb0
<4> [749.063423]  entry_SYSCALL_64_after_hwframe+0x44/0xae
<4> [749.063428] RIP: 0033:0x7f6e5f100317

Testcase: igt/gem_madvise/dontneed-before-mmap
Fixes: cf3e3e86d779 ("drm/i915: Use ttm mmap handling for ttm bo's.")
Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
---
 drivers/gpu/drm/i915/gem/i915_gem_pages.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gem/i915_gem_pages.c b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
index 89b70f5cde7a..9f429ed6e78a 100644
--- a/drivers/gpu/drm/i915/gem/i915_gem_pages.c
+++ b/drivers/gpu/drm/i915/gem/i915_gem_pages.c
@@ -161,7 +161,6 @@ int i915_gem_object_pin_pages_unlocked(struct drm_i915_gem_object *obj)
 /* Immediately discard the backing storage */
 int i915_gem_object_truncate(struct drm_i915_gem_object *obj)
 {
-	drm_gem_free_mmap_offset(&obj->base);
 	if (obj->ops->truncate)
 		return obj->ops->truncate(obj);
 
-- 
2.31.1

