Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B93D2458F29
	for <lists+dri-devel@lfdr.de>; Mon, 22 Nov 2021 14:10:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C096E1D5;
	Mon, 22 Nov 2021 13:10:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E23CE6E1D5
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Nov 2021 13:10:06 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1A4CA60462;
 Mon, 22 Nov 2021 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637586606;
 bh=/POoZN/Af4rNxMOg+w1zMwFFidBFcRDHZtfALydKq4A=;
 h=Subject:To:Cc:From:Date:From;
 b=LuuRiU4XHxzpFj5LtQ7iDNTPVVp2KFNHpAdaMAzMVjIcT0aH/Fw/p5HQiLQa5oKh5
 wnYhwYRkkL5cqwxV5Bm81Yp2WtH/aW8dLHKZtDHY/i4IFyROddGc8hvxJwudthfNGP
 aLp/NA0USqB6Q7nCIcOjOJZgmq8wwT8xJZCI2qmI=
Subject: Patch "drm/cma-helper: Release non-coherent memory with
 dma_free_noncoherent()" has been added to the 5.15-stable tree
To: airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, paul@crapouillou.net, tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Mon, 22 Nov 2021 14:10:04 +0100
Message-ID: <163758660488113@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
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

    drm/cma-helper: Release non-coherent memory with dma_free_noncoherent()

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-cma-helper-release-non-coherent-memory-with-dma_free_noncoherent.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 995f54ea962e03ec08b8bc6a4fe11a32b420edd3 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Thu, 8 Jul 2021 19:51:46 +0200
Subject: drm/cma-helper: Release non-coherent memory with dma_free_noncoherent()

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 995f54ea962e03ec08b8bc6a4fe11a32b420edd3 upstream.

The GEM CMA helpers allocate non-coherent (i.e., cached) backing storage
with dma_alloc_noncoherent(), but release it with dma_free_wc(). Fix this
with a call to dma_free_noncoherent(). Writecombining storage is still
released with dma_free_wc().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: cf8ccbc72d61 ("drm: Add support for GEM buffers backed by non-coherent memory")
Acked-by: Paul Cercueil <paul@crapouillou.net>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.14+
Link: https://patchwork.freedesktop.org/patch/msgid/20210708175146.10618-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_gem_cma_helper.c |    9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/drm_gem_cma_helper.c
+++ b/drivers/gpu/drm/drm_gem_cma_helper.c
@@ -210,8 +210,13 @@ void drm_gem_cma_free_object(struct drm_
 			dma_buf_vunmap(gem_obj->import_attach->dmabuf, &map);
 		drm_prime_gem_destroy(gem_obj, cma_obj->sgt);
 	} else if (cma_obj->vaddr) {
-		dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
-			    cma_obj->vaddr, cma_obj->paddr);
+		if (cma_obj->map_noncoherent)
+			dma_free_noncoherent(gem_obj->dev->dev, cma_obj->base.size,
+					     cma_obj->vaddr, cma_obj->paddr,
+					     DMA_TO_DEVICE);
+		else
+			dma_free_wc(gem_obj->dev->dev, cma_obj->base.size,
+				    cma_obj->vaddr, cma_obj->paddr);
 	}
 
 	drm_gem_object_release(gem_obj);


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-5.15/drm-cma-helper-release-non-coherent-memory-with-dma_free_noncoherent.patch
