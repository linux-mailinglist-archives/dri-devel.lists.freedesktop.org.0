Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED4939F17B
	for <lists+dri-devel@lfdr.de>; Tue,  8 Jun 2021 10:55:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 573B26EB4E;
	Tue,  8 Jun 2021 08:55:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5D4A86EB4E
 for <dri-devel@lists.freedesktop.org>; Tue,  8 Jun 2021 08:55:25 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 81184113E;
 Tue,  8 Jun 2021 01:55:24 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com
 [10.121.207.14])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id CB4863F719;
 Tue,  8 Jun 2021 01:55:22 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/vc4: fix vc4_atomic_commit_tail() logic
Date: Tue,  8 Jun 2021 09:55:12 +0100
Message-Id: <20210608085513.2069-1-mark.rutland@arm.com>
X-Mailer: git-send-email 2.11.0
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
Cc: Mark Rutland <mark.rutland@arm.com>, Emma Anholt <emma@anholt.net>,
 Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Catalin Marinas <catalin.marinas@arm.com>, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime@cerno.tech>, Will Deacon <will@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In vc4_atomic_commit_tail() we iterate of the set of old CRTCs, and
attempt to wait on any channels which are still in use. When we iterate
over the CRTCs, we have:

* `i` - the index of the CRTC
* `channel` - the channel a CRTC is using

When we check the channel state, we consult:

  old_hvs_state->fifo_state[channel].in_use

... but when we wait for the channel, we erroneously wait on:

  old_hvs_state->fifo_state[i].pending_commit

... rather than:

   old_hvs_state->fifo_state[channel].pending_commit

... and this bogus access has been observed to result in boot-time hangs
on some arm64 configurations, and can be detected using KASAN. FIx this
by using the correct index.

I've tested this on a Raspberry Pi 3 model B v1.2 with KASAN.

Trimmed KASAN splat:

| ==================================================================
| BUG: KASAN: slab-out-of-bounds in vc4_atomic_commit_tail+0x1cc/0x910
| Read of size 8 at addr ffff000007360440 by task kworker/u8:0/7
| CPU: 2 PID: 7 Comm: kworker/u8:0 Not tainted 5.13.0-rc3-00009-g694c523e7267 #3
|
| Hardware name: Raspberry Pi 3 Model B (DT)
| Workqueue: events_unbound deferred_probe_work_func
| Call trace:
|  dump_backtrace+0x0/0x2b4
|  show_stack+0x1c/0x30
|  dump_stack+0xfc/0x168
|  print_address_description.constprop.0+0x2c/0x2c0
|  kasan_report+0x1dc/0x240
|  __asan_load8+0x98/0xd4
|  vc4_atomic_commit_tail+0x1cc/0x910
|  commit_tail+0x100/0x210
| ...
|
| Allocated by task 7:
|  kasan_save_stack+0x2c/0x60
|  __kasan_kmalloc+0x90/0xb4
|  vc4_hvs_channels_duplicate_state+0x60/0x1a0
|  drm_atomic_get_private_obj_state+0x144/0x230
|  vc4_atomic_check+0x40/0x73c
|  drm_atomic_check_only+0x998/0xe60
|  drm_atomic_commit+0x34/0x94
|  drm_client_modeset_commit_atomic+0x2f4/0x3a0
|  drm_client_modeset_commit_locked+0x8c/0x230
|  drm_client_modeset_commit+0x38/0x60
|  drm_fb_helper_set_par+0x104/0x17c
|  fbcon_init+0x43c/0x970
|  visual_init+0x14c/0x1e4
| ...
|
| The buggy address belongs to the object at ffff000007360400
|  which belongs to the cache kmalloc-128 of size 128
| The buggy address is located 64 bytes inside of
|  128-byte region [ffff000007360400, ffff000007360480)
| The buggy address belongs to the page:
| page:(____ptrval____) refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7360
| flags: 0x3fffc0000000200(slab|node=0|zone=0|lastcpupid=0xffff)
| raw: 03fffc0000000200 dead000000000100 dead000000000122 ffff000004c02300
| raw: 0000000000000000 0000000000100010 00000001ffffffff 0000000000000000
| page dumped because: kasan: bad access detected
|
| Memory state around the buggy address:
|  ffff000007360300: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
|  ffff000007360380: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
| >ffff000007360400: 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc fc
|                                            ^
|  ffff000007360480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
|  ffff000007360500: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
| ==================================================================

Link: https://lore.kernel.org/r/4d0c8318-bad8-2be7-e292-fc8f70c198de@samsung.com
Link: https://lore.kernel.org/linux-arm-kernel/20210607151740.moncryl5zv3ahq4s@gilmour
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reported-by: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: David Airlie <airlied@linux.ie>
Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <maxime@cerno.tech>
Cc: Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org
---
 drivers/gpu/drm/vc4/vc4_kms.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/vc4/vc4_kms.c b/drivers/gpu/drm/vc4/vc4_kms.c
index bb5529a7a9c2..948b3a58aad1 100644
--- a/drivers/gpu/drm/vc4/vc4_kms.c
+++ b/drivers/gpu/drm/vc4/vc4_kms.c
@@ -372,7 +372,7 @@ static void vc4_atomic_commit_tail(struct drm_atomic_state *state)
 		if (!old_hvs_state->fifo_state[channel].in_use)
 			continue;
 
-		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[i].pending_commit);
+		ret = drm_crtc_commit_wait(old_hvs_state->fifo_state[channel].pending_commit);
 		if (ret)
 			drm_err(dev, "Timed out waiting for commit\n");
 	}
-- 
2.11.0

