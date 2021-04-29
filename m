Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D6A2A36E35F
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 04:42:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DDB56ED03;
	Thu, 29 Apr 2021 02:42:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-m121142.qiye.163.com (mail-m121142.qiye.163.com
 [115.236.121.142])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 878E26ED03
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 02:42:16 +0000 (UTC)
Received: from ubuntu.localdomain (unknown [36.152.145.181])
 by mail-m121142.qiye.163.com (Hmail) with ESMTPA id B1253801C3;
 Thu, 29 Apr 2021 10:42:13 +0800 (CST)
From: Bernard Zhao <bernard@vivo.com>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] drm/i915: Use might_alloc()
Date: Wed, 28 Apr 2021 19:42:11 -0700
Message-Id: <20210429024211.58245-1-bernard@vivo.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZGUhISFZLSk5LGBpKSxpPSEJVEwETFhoSFyQUDg9ZV1kWGg8SFR0UWUFZT0tIVUpKS0
 hKTFVLWQY+
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6Okk6DAw6OT8QEkkyEktMCRA5
 N00aFB1VSlVKTUpCTU1PSkhPSkxPVTMWGhIXVRkeCRUaCR87DRINFFUYFBZFWVdZEgtZQVlITVVK
 TklVSk9OVUpDSllXWQgBWUFJT0hINwY+
X-HM-Tid: 0a791b815ee5b037kuuub1253801c3
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
Cc: Bernard Zhao <bernard@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This maybe used lockdep through the fs_reclaim annotations.

Signed-off-by: Bernard Zhao <bernard@vivo.com>
---
 drivers/gpu/drm/i915/i915_sw_fence.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_sw_fence.c b/drivers/gpu/drm/i915/i915_sw_fence.c
index 2744558f3050..cc1b49cabb6c 100644
--- a/drivers/gpu/drm/i915/i915_sw_fence.c
+++ b/drivers/gpu/drm/i915/i915_sw_fence.c
@@ -341,7 +341,7 @@ static int __i915_sw_fence_await_sw_fence(struct i915_sw_fence *fence,
 	unsigned long flags;
 
 	debug_fence_assert(fence);
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	if (i915_sw_fence_done(signaler)) {
 		i915_sw_fence_set_error_once(fence, signaler->error);
@@ -477,7 +477,7 @@ int i915_sw_fence_await_dma_fence(struct i915_sw_fence *fence,
 	int ret;
 
 	debug_fence_assert(fence);
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	if (dma_fence_is_signaled(dma)) {
 		i915_sw_fence_set_error_once(fence, dma->error);
@@ -576,7 +576,7 @@ int i915_sw_fence_await_reservation(struct i915_sw_fence *fence,
 	int ret = 0, pending;
 
 	debug_fence_assert(fence);
-	might_sleep_if(gfpflags_allow_blocking(gfp));
+	might_alloc(gfp);
 
 	if (write) {
 		struct dma_fence **shared;
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
