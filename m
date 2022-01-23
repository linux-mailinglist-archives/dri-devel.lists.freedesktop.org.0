Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AD26497245
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 15:50:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0472310F344;
	Sun, 23 Jan 2022 14:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 080DB10F344
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 14:50:25 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0156E60DD9;
 Sun, 23 Jan 2022 14:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBC0C340E2;
 Sun, 23 Jan 2022 14:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1642949424;
 bh=SFOfDmogPLPC2mCQZ716kZK8KpO86XnRwzUjDwZ/Grc=;
 h=Subject:To:Cc:From:Date:From;
 b=OCXjr/crIizBk21iDcrBSa+iRdJnrWWIoAjU23dOxFdVReXBO8qJWfEil2OdEXhPw
 yWwI8YcZlg/mOKQQdWYPUw9EqZaqY+NXHXIKL4h0D+P9UVVxVy83cp66IJRVedvNBi
 LyfbIrm5ZzV/Gx58dBCJxaQaXYtOU5jNFWudSELQ=
Subject: Patch "dma_fence_array: Fix PENDING_ERROR leak in
 dma_fence_array_signaled()" has been added to the 5.15-stable tree
To: chris@chris-wilson.co.uk, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 gustavo@padovan.org, linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 thomas.hellstrom@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Sun, 23 Jan 2022 15:49:55 +0100
Message-ID: <1642949395182235@kroah.com>
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

    dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     dma_fence_array-fix-pending_error-leak-in-dma_fence_array_signaled.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 95d35838880fb040ccb9fe4a48816bd0c8b62df5 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 29 Nov 2021 16:27:27 +0100
Subject: dma_fence_array: Fix PENDING_ERROR leak in dma_fence_array_signaled()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 95d35838880fb040ccb9fe4a48816bd0c8b62df5 upstream.

If a dma_fence_array is reported signaled by a call to
dma_fence_is_signaled(), it may leak the PENDING_ERROR status.

Fix this by clearing the PENDING_ERROR status if we return true in
dma_fence_array_signaled().

v2:
- Update Cc list, and add R-b.

Fixes: 1f70b8b812f3 ("dma-fence: Propagate errors to dma-fence-array container")
Cc: Chris Wilson <chris@chris-wilson.co.uk>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Gustavo Padovan <gustavo@padovan.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linaro-mm-sig@lists.linaro.org
Cc: <stable@vger.kernel.org> # v5.4+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20211129152727.448908-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/dma-buf/dma-fence-array.c |    6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

--- a/drivers/dma-buf/dma-fence-array.c
+++ b/drivers/dma-buf/dma-fence-array.c
@@ -104,7 +104,11 @@ static bool dma_fence_array_signaled(str
 {
 	struct dma_fence_array *array = to_dma_fence_array(fence);
 
-	return atomic_read(&array->num_pending) <= 0;
+	if (atomic_read(&array->num_pending) > 0)
+		return false;
+
+	dma_fence_array_clear_pending_error(array);
+	return true;
 }
 
 static void dma_fence_array_release(struct dma_fence *fence)


Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-5.15/dma_fence_array-fix-pending_error-leak-in-dma_fence_array_signaled.patch
