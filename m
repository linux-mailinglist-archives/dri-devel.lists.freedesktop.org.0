Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BE3C75BFF9
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jul 2023 09:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C157110E16F;
	Fri, 21 Jul 2023 07:40:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1BF10E16F
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jul 2023 07:40:55 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 1D1F26153E;
 Fri, 21 Jul 2023 07:40:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03914C433C7;
 Fri, 21 Jul 2023 07:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1689925254;
 bh=Gx/PmYlH42fMA5fK3OfIZPpzZNoQ2bYVvaWQBcWepXM=;
 h=Subject:To:Cc:From:Date:From;
 b=WRTp8AJEmQHpNEMSwjMiAQcj9JAJx9xS/Qa8TpPKskHqBmwViTX6jlTjEZVl2zgK4
 q5GIoVxB3U1xlWs9h1UI3eERS/87YfM1JOMfJBKo0qh/9gm7RR+8CPFYt6ZznOBnuQ
 Lo76NJyG+8YN7gdESm3ku/1qurLJyQwndmRd+bNE=
Subject: Patch "drm/ttm: Don't leak a resource on swapout move error" has been
 added to the 5.15-stable tree
To: andi.shyti@linux.intel.com, christian.koenig@amd.com,
 ckoenig.leichtzumerken@gmail.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, nirmoy.das@intel.com,
 thomas.hellstrom@linux.intel.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 21 Jul 2023 09:40:20 +0200
Message-ID: <2023072120-ageless-fondling-7f72@gregkh>
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

    drm/ttm: Don't leak a resource on swapout move error

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-ttm-don-t-leak-a-resource-on-swapout-move-error.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From a590f03d8de7c4cb7ce4916dc7f2fd10711faabe Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Mon, 26 Jun 2023 11:14:50 +0200
Subject: drm/ttm: Don't leak a resource on swapout move error
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Hellström <thomas.hellstrom@linux.intel.com>

commit a590f03d8de7c4cb7ce4916dc7f2fd10711faabe upstream.

If moving the bo to system for swapout failed, we were leaking
a resource. Fix.

Fixes: bfa3357ef9ab ("drm/ttm: allocate resource object instead of embedding it v2")
Cc: Christian König <christian.koenig@amd.com>
Cc: "Christian König" <ckoenig.leichtzumerken@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Reviewed-by: Nirmoy Das <nirmoy.das@intel.com>
Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Reviewed-by: Christian König <christian.koenig@amd.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20230626091450.14757-5-thomas.hellstrom@linux.intel.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/ttm/ttm_bo.c |    1 +
 1 file changed, 1 insertion(+)

--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -1187,6 +1187,7 @@ int ttm_bo_swapout(struct ttm_buffer_obj
 		ret = ttm_bo_handle_move_mem(bo, evict_mem, true, &ctx, &hop);
 		if (unlikely(ret != 0)) {
 			WARN(ret == -EMULTIHOP, "Unexpected multihop in swaput - likely driver bug.\n");
+			ttm_resource_free(bo, &evict_mem);
 			goto out;
 		}
 	}


Patches currently in stable-queue which might be from thomas.hellstrom@linux.intel.com are

queue-5.15/drm-ttm-don-t-leak-a-resource-on-swapout-move-error.patch
