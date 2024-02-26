Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06610867464
	for <lists+dri-devel@lfdr.de>; Mon, 26 Feb 2024 13:08:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E12A10E701;
	Mon, 26 Feb 2024 12:08:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ioXOP1dL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F4B889A5E
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Feb 2024 12:08:32 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 1126261161;
 Mon, 26 Feb 2024 12:08:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64201C433F1;
 Mon, 26 Feb 2024 12:08:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1708949310;
 bh=eSkNrSpbZYziODL0xF0sw0SmOcIOgvOGZc4CrI9/P+A=;
 h=Subject:To:Cc:From:Date:From;
 b=ioXOP1dLmQ3RzDk8njhkHoIaU+G8qmQQfpaYKfqh1OFJzsvIFSSGwAzNTvPB1BmsV
 PeQUgedCUoo5O4bgakK56V3CC8ps61WrCX5XZMiSMlOxzZs1RSxGEaX//XYZjEqTDc
 DEIOSBLqC7rs3ijwzZo4oY97vHyCpzBXYasEhPy4=
Subject: Patch "drm/ttm: Fix an invalid freeing on already freed page in error
 path" has been added to the 6.7-stable tree
To: airlied@redhat.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 matthew.auld@intel.com, ray.huang@amd.com, thomas.hellstrom@linux.intel.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 26 Feb 2024 13:07:40 +0100
Message-ID: <2024022640-stiffness-stoplight-de45@gregkh>
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

    drm/ttm: Fix an invalid freeing on already freed page in error path

to the 6.7-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ttm-fix-an-invalid-freeing-on-already-freed-page-in-error-path.patch
and it can be found in the queue-6.7 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 40510a941d27d405a82dc3320823d875f94625df Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Wed, 21 Feb 2024 08:33:24 +0100
Subject: drm/ttm: Fix an invalid freeing on already freed page in error path
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit 40510a941d27d405a82dc3320823d875f94625df upstream.

If caching mode change fails due to, for example, OOM we
free the allocated pages in a two-step process. First the pages
for which the caching change has already succeeded. Secondly
the pages for which a caching change did not succeed.

However the second step was incorrectly freeing the pages already
freed in the first step.

Fix.

Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Fixes: 379989e7cbdc ("drm/ttm/pool: Fix ttm_pool_alloc error path")
Cc: Christian König <christian.koenig@amd.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.4+
Reviewed-by: Matthew Auld <matthew.auld@intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20240221073324.3303-1-thomas.hellstrom@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_pool.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ttm/ttm_pool.c
+++ b/drivers/gpu/drm/ttm/ttm_pool.c
@@ -387,7 +387,7 @@ static void ttm_pool_free_range(struct t
 				enum ttm_caching caching,
 				pgoff_t start_page, pgoff_t end_page)
 {
-	struct page **pages = tt->pages;
+	struct page **pages = &tt->pages[start_page];
 	unsigned int order;
 	pgoff_t i, nr;
 


Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-6.7/drm-ttm-fix-an-invalid-freeing-on-already-freed-page-in-error-path.patch
