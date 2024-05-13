Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B559D8C4422
	for <lists+dri-devel@lfdr.de>; Mon, 13 May 2024 17:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 973C010E806;
	Mon, 13 May 2024 15:27:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pdHxXvFA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84DA810E806
 for <dri-devel@lists.freedesktop.org>; Mon, 13 May 2024 15:27:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id 7DBADCE0EC4;
 Mon, 13 May 2024 15:27:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 533E5C113CC;
 Mon, 13 May 2024 15:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1715614063;
 bh=Wem7et/OgQXMikehZ+MJRyVK4W1vujzaN8oGncxvRj8=;
 h=Subject:To:Cc:From:Date:From;
 b=pdHxXvFA/g4YSu8pYsH6CEPwRRmTjrg2QftPj/3Mfmdz4FbcLEFXG75PntkCbvQXF
 +eB4XsfYFmrGM+KcC0U+Q5k5Y0KGs9eh1S4qK8p+noTdTFjg99nIlteUjZTj1WyKJO
 WEBrVXOoIsbw6K8nlXxIsjJu0Hgc4yIDxpbifwZQ=
Subject: Patch "drm/ttm: Print the memory decryption status just once" has
 been added to the 6.8-stable tree
To: christian.koenig@amd.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, thomas.hellstrom@linux.intel.com,
 zack.rusin@broadcom.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 13 May 2024 17:27:13 +0200
Message-ID: <2024051313-consonant-monkhood-b913@gregkh>
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

    drm/ttm: Print the memory decryption status just once

to the 6.8-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ttm-print-the-memory-decryption-status-just-once.patch
and it can be found in the queue-6.8 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 27906e5d78248b19bcdfdae72049338c828897bb Mon Sep 17 00:00:00 2001
From: Zack Rusin <zack.rusin@broadcom.com>
Date: Mon, 8 Apr 2024 11:56:05 -0400
Subject: drm/ttm: Print the memory decryption status just once
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Zack Rusin <zack.rusin@broadcom.com>

commit 27906e5d78248b19bcdfdae72049338c828897bb upstream.

Stop printing the TT memory decryption status info each time tt is created
and instead print it just once.

Reduces the spam in the system logs when running guests with SEV enabled.

Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
Fixes: 71ce046327cf ("drm/ttm: Make sure the mapped tt pages are decrypted when needed")
Reviewed-by: Christian König <christian.koenig@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: <stable@vger.kernel.org> # v5.14+
Link: https://patchwork.freedesktop.org/patch/msgid/20240408155605.1398631-1-zack.rusin@broadcom.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -92,7 +92,7 @@ int ttm_tt_create(struct ttm_buffer_obje
 	 */
 	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		page_flags |= TTM_TT_FLAG_DECRYPTED;
-		drm_info(ddev, "TT memory decryption enabled.");
+		drm_info_once(ddev, "TT memory decryption enabled.");
 	}
 
 	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);


Patches currently in stable-queue which might be from zack.rusin@broadcom.com are

queue-6.8/drm-ttm-print-the-memory-decryption-status-just-once.patch
queue-6.8/drm-vmwgfx-fix-legacy-display-unit.patch
queue-6.8/drm-vmwgfx-fix-invalid-reads-in-fence-signaled-events.patch
