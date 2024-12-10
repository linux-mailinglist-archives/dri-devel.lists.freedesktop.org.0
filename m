Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9899EAC64
	for <lists+dri-devel@lfdr.de>; Tue, 10 Dec 2024 10:37:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F6410E85E;
	Tue, 10 Dec 2024 09:37:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SYPqUAjI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2F2010E862
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Dec 2024 09:37:13 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B50165C550D;
 Tue, 10 Dec 2024 09:36:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3A1BC4CED6;
 Tue, 10 Dec 2024 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1733823433;
 bh=H9GdWWxSQozv/mUkF3/jqCtHO65TOh5siE73iExwbnk=;
 h=Subject:To:Cc:From:Date:From;
 b=SYPqUAjItXisvgBF3JZ0CFIbQrhDDxprFrKhYivANR7Ak1USZMQj4cKHrm1EApikV
 /Pz/jC3VA2N6MwC0eraf9D5MFFZanp6ad+sFtAFdeNJPqUiGAFgPnLJyd74KZpiWLE
 YW9wtSY01KNFmwhbgaeoU74LcVZveyV+mS8J/PLk=
Subject: Patch "dma-fence: Fix reference leak on fence merge failure path" has
 been added to the 6.6-stable tree
To: christian.koenig@amd.com, daniel.vetter@ffwll.ch,
 dri-devel@lists.freedesktop.org, friedrich.vock@gmx.de,
 gregkh@linuxfoundation.org, gustavo@padovan.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 tvrtko.ursulin@igalia.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 10 Dec 2024 10:35:53 +0100
Message-ID: <2024121053-riddance-respect-21fc@gregkh>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    dma-fence: Fix reference leak on fence merge failure path

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dma-fence-fix-reference-leak-on-fence-merge-failure-path.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 949291c5314009b4f6e252391edbb40fdd5d5414 Mon Sep 17 00:00:00 2001
From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Date: Fri, 15 Nov 2024 10:21:49 +0000
Subject: dma-fence: Fix reference leak on fence merge failure path
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>

commit 949291c5314009b4f6e252391edbb40fdd5d5414 upstream.

Release all fence references if the output dma-fence-array could not be
allocated.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Fixes: 245a4a7b531c ("dma-buf: generalize dma_fence unwrap & merging v3")
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Friedrich Vock <friedrich.vock@gmx.de>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v6.0+
Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20241115102153.1980-2-tursulin@igalia.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-fence-unwrap.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -164,6 +164,8 @@ restart:
 					dma_fence_context_alloc(1),
 					1, false);
 	if (!result) {
+		for (i = 0; i < count; i++)
+			dma_fence_put(array[i]);
 		tmp = NULL;
 		goto return_tmp;
 	}


Patches currently in stable-queue which might be from tvrtko.ursulin@igalia.com are

queue-6.6/dma-fence-use-kernel-s-sort-for-merging-fences.patch
queue-6.6/dma-buf-fix-dma_fence_array_signaled-v4.patch
queue-6.6/dma-fence-fix-reference-leak-on-fence-merge-failure-path.patch
