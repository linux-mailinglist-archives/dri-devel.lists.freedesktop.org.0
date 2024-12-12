Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C09A9EE6E4
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2024 13:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C1610EDB3;
	Thu, 12 Dec 2024 12:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="cL99DRsv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E491210E439
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Dec 2024 12:41:12 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 67D305C01D9;
 Thu, 12 Dec 2024 12:40:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F073AC4CECE;
 Thu, 12 Dec 2024 12:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1734007271;
 bh=gynVnUUa/I7u5IRmhBoNaLRogHtsc7XDpicCtfzoCNY=;
 h=Subject:To:Cc:From:Date:In-Reply-To:From;
 b=cL99DRsvI+9Kj5JqUWmg17Jh9UzgCQMIxPJKz1MoPYpM1Aqqu3bNQSSnC9s+TER7o
 5ObV/tkCdVOAZXGx6l/0qGxEC55qbDMMaBkOZZ3vVkSxfE1KwA74297cRcKXxTXXzL
 3glvj3FU9BZ6IkbPBzrAlA2xHgfAF2JM8ezd78t0=
Subject: Patch "drm/ttm: Print the memory decryption status just once" has
 been added to the 6.1-stable tree
To: airlied@gmail.com, ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com,
 christian.koenig@amd.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, ray.huang@amd.com,
 thomas.hellstrom@linux.intel.com, vasavi.sirnapalli@broadcom.com,
 ye.li@broadcom.com, zack.rusin@broadcom.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 12 Dec 2024 13:40:58 +0100
In-Reply-To: <20241209094904.2547579-3-ajay.kaher@broadcom.com>
Message-ID: <2024121257-reunion-catalyst-808a@gregkh>
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

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ttm-print-the-memory-decryption-status-just-once.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-100114-greg=kroah.com@vger.kernel.org Mon Dec  9 10:50:05 2024
From: Ajay Kaher <ajay.kaher@broadcom.com>
Date: Mon,  9 Dec 2024 09:49:04 +0000
Subject: drm/ttm: Print the memory decryption status just once
To: stable@vger.kernel.org, gregkh@linuxfoundation.org
Cc: zack.rusin@broadcom.com, thomas.hellstrom@linux.intel.com, christian.koenig@amd.com, ray.huang@amd.com, airlied@gmail.com, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, ajay.kaher@broadcom.com, alexey.makhalov@broadcom.com, vasavi.sirnapalli@broadcom.com, Ye Li <ye.li@broadcom.com>
Message-ID: <20241209094904.2547579-3-ajay.kaher@broadcom.com>

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
Signed-off-by: Ye Li <ye.li@broadcom.com>
Signed-off-by: Ajay Kaher <ajay.kaher@broadcom.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_tt.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- a/drivers/gpu/drm/ttm/ttm_tt.c
+++ b/drivers/gpu/drm/ttm/ttm_tt.c
@@ -90,7 +90,7 @@ int ttm_tt_create(struct ttm_buffer_obje
 	 */
 	if (bdev->pool.use_dma_alloc && cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
 		page_flags |= TTM_TT_FLAG_DECRYPTED;
-		drm_info(ddev, "TT memory decryption enabled.");
+		drm_info_once(ddev, "TT memory decryption enabled.");
 	}
 
 	bo->ttm = bdev->funcs->ttm_tt_create(bo, page_flags);


Patches currently in stable-queue which might be from ajay.kaher@broadcom.com are

queue-6.1/drm-ttm-print-the-memory-decryption-status-just-once.patch
queue-6.1/drm-ttm-make-sure-the-mapped-tt-pages-are-decrypted-when-needed.patch
queue-6.1/ptp-add-error-handling-for-adjfine-callback-in-ptp_c.patch
