Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5B917DFA3
	for <lists+dri-devel@lfdr.de>; Mon,  9 Mar 2020 13:15:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CB86E439;
	Mon,  9 Mar 2020 12:15:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C2596E436;
 Mon,  9 Mar 2020 12:15:49 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from build.alporthouse.com (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP id 20494660-1500050 
 for multiple; Mon, 09 Mar 2020 12:15:31 +0000
From: Chris Wilson <chris@chris-wilson.co.uk>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/mm: Allow drm_mm_initialized() to be used outside of the
 locks
Date: Mon,  9 Mar 2020 12:15:29 +0000
Message-Id: <20200309121529.16497-1-chris@chris-wilson.co.uk>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
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
Cc: mika.kuoppala@linux.intel.com, intel-gfx@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Mark up the potential racy read in drm_mm_initialized(), as we want a
cheap and cheerful check:

[  121.098731] BUG: KCSAN: data-race in _i915_gem_object_create_stolen [i915] / rm_hole
[  121.098766]
[  121.098789] write (marked) to 0xffff8881f01ed330 of 8 bytes by task 3568 on cpu 3:
[  121.098831]  rm_hole+0x64/0x140
[  121.098860]  drm_mm_insert_node_in_range+0x3d3/0x6c0
[  121.099254]  i915_gem_stolen_insert_node_in_range+0x91/0xe0 [i915]
[  121.099646]  _i915_gem_object_create_stolen+0x9d/0x100 [i915]
[  121.100047]  i915_gem_object_create_region+0x7a/0xa0 [i915]
[  121.100451]  i915_gem_object_create_stolen+0x33/0x50 [i915]
[  121.100849]  intel_engine_create_ring+0x1af/0x280 [i915]
[  121.101242]  __execlists_context_alloc+0xce/0x3d0 [i915]
[  121.101635]  execlists_context_alloc+0x25/0x40 [i915]
[  121.102030]  intel_context_alloc_state+0xb6/0xf0 [i915]
[  121.102420]  __intel_context_do_pin+0x1ff/0x220 [i915]
[  121.102815]  i915_gem_do_execbuffer+0x46b4/0x4c20 [i915]
[  121.103211]  i915_gem_execbuffer2_ioctl+0x2c3/0x580 [i915]
[  121.103244]  drm_ioctl_kernel+0xe4/0x120
[  121.103269]  drm_ioctl+0x297/0x4c7
[  121.103296]  ksys_ioctl+0x89/0xb0
[  121.103321]  __x64_sys_ioctl+0x42/0x60
[  121.103349]  do_syscall_64+0x6e/0x2c0
[  121.103377]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
[  121.103403]
[  121.103426] read to 0xffff8881f01ed330 of 8 bytes by task 3109 on cpu 1:
[  121.103819]  _i915_gem_object_create_stolen+0x30/0x100 [i915]
[  121.104228]  i915_gem_object_create_region+0x7a/0xa0 [i915]
[  121.104631]  i915_gem_object_create_stolen+0x33/0x50 [i915]
[  121.105025]  intel_engine_create_ring+0x1af/0x280 [i915]
[  121.105420]  __execlists_context_alloc+0xce/0x3d0 [i915]
[  121.105818]  execlists_context_alloc+0x25/0x40 [i915]
[  121.106202]  intel_context_alloc_state+0xb6/0xf0 [i915]
[  121.106595]  __intel_context_do_pin+0x1ff/0x220 [i915]
[  121.106985]  i915_gem_do_execbuffer+0x46b4/0x4c20 [i915]
[  121.107375]  i915_gem_execbuffer2_ioctl+0x2c3/0x580 [i915]
[  121.107409]  drm_ioctl_kernel+0xe4/0x120
[  121.107437]  drm_ioctl+0x297/0x4c7
[  121.107464]  ksys_ioctl+0x89/0xb0
[  121.107489]  __x64_sys_ioctl+0x42/0x60
[  121.107511]  do_syscall_64+0x6e/0x2c0
[  121.107535]  entry_SYSCALL_64_after_hwframe+0x44/0xa9

Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
---
 include/drm/drm_mm.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/drm_mm.h b/include/drm/drm_mm.h
index d7939c054259..ee8b0e80ca90 100644
--- a/include/drm/drm_mm.h
+++ b/include/drm/drm_mm.h
@@ -272,7 +272,7 @@ static inline bool drm_mm_node_allocated(const struct drm_mm_node *node)
  */
 static inline bool drm_mm_initialized(const struct drm_mm *mm)
 {
-	return mm->hole_stack.next;
+	return READ_ONCE(mm->hole_stack.next);
 }
 
 /**
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
