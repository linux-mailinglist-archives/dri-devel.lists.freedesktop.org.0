Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DC4775E27B
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jul 2023 16:15:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70C5310E0D9;
	Sun, 23 Jul 2023 14:15:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D489210E0D9
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jul 2023 14:15:00 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DBA4160D33;
 Sun, 23 Jul 2023 14:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBCA1C433C7;
 Sun, 23 Jul 2023 14:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1690121699;
 bh=Sgd9xEr8wwi3+xAPT7emk06pyo2sWpMIHTVlS7rCqL8=;
 h=Subject:To:Cc:From:Date:From;
 b=MQAowYXVjoRTb04UmBmCmQLh2RoLPsG+sdagvzNUb/7dUsgyy9YyfHb3X4g08UytM
 eu4vn3DZFjI/jx9CSbC+sR3imnN6p4jYve85iOnotlAponumnui9IUnA0BfXbQGFeB
 0/rt56q8foEq6Sz/r8gObHoj1Wobud7HTreTWz9Q=
Subject: Patch "dma-buf/dma-resv: Stop leaking on krealloc() failure" has been
 added to the 6.1-stable tree
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, linaro-mm-sig@lists.linaro.org,
 sumit.semwal@linaro.org, ville.syrjala@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Sun, 23 Jul 2023 16:13:00 +0200
Message-ID: <2023072359-headset-penpal-f940@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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
Cc: stable-commits@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    dma-buf/dma-resv: Stop leaking on krealloc() failure

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dma-buf-dma-resv-stop-leaking-on-krealloc-failure.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 05abb3be91d8788328231ee02973ab3d47f5e3d2 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>
Date: Thu, 13 Jul 2023 22:47:45 +0300
Subject: dma-buf/dma-resv: Stop leaking on krealloc() failure
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

commit 05abb3be91d8788328231ee02973ab3d47f5e3d2 upstream.

Currently dma_resv_get_fences() will leak the previously
allocated array if the fence iteration got restarted and
the krealloc_array() fails.

Free the old array by hand, and make sure we still clear
the returned *fences so the caller won't end up accessing
freed memory. Some (but not all) of the callers of
dma_resv_get_fences() seem to still trawl through the
array even when dma_resv_get_fences() failed. And let's
zero out *num_fences as well for good measure.

Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Fixes: d3c80698c9f5 ("dma-buf: use new iterator in dma_resv_get_fences v3")
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: stable@vger.kernel.org
Link: https://patchwork.freedesktop.org/patch/msgid/20230713194745.1751-1-ville.syrjala@linux.intel.com
Signed-off-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-resv.c |   13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -566,6 +566,7 @@ int dma_resv_get_fences(struct dma_resv
 	dma_resv_for_each_fence_unlocked(&cursor, fence) {
 
 		if (dma_resv_iter_is_restarted(&cursor)) {
+			struct dma_fence **new_fences;
 			unsigned int count;
 
 			while (*num_fences)
@@ -574,13 +575,17 @@ int dma_resv_get_fences(struct dma_resv
 			count = cursor.num_fences + 1;
 
 			/* Eventually re-allocate the array */
-			*fences = krealloc_array(*fences, count,
-						 sizeof(void *),
-						 GFP_KERNEL);
-			if (count && !*fences) {
+			new_fences = krealloc_array(*fences, count,
+						    sizeof(void *),
+						    GFP_KERNEL);
+			if (count && !new_fences) {
+				kfree(*fences);
+				*fences = NULL;
+				*num_fences = 0;
 				dma_resv_iter_end(&cursor);
 				return -ENOMEM;
 			}
+			*fences = new_fences;
 		}
 
 		(*fences)[(*num_fences)++] = dma_fence_get(fence);


Patches currently in stable-queue which might be from ville.syrjala@linux.intel.com are

queue-6.1/dma-buf-dma-resv-stop-leaking-on-krealloc-failure.patch
