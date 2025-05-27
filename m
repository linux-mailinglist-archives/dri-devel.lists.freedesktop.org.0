Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F31D8AC5229
	for <lists+dri-devel@lfdr.de>; Tue, 27 May 2025 17:35:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93F1510E423;
	Tue, 27 May 2025 15:35:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="akLQa5OC";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEBF610E423
 for <dri-devel@lists.freedesktop.org>; Tue, 27 May 2025 15:35:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 19A5160EDF;
 Tue, 27 May 2025 15:35:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F66DC4CEE9;
 Tue, 27 May 2025 15:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1748360141;
 bh=P5uYW1+BYzkmCtbQHSQ4bMG2SL4jxxefuIb5mq+pu+8=;
 h=Subject:To:Cc:From:Date:From;
 b=akLQa5OCppbYCepokUX+fVr8gOTHWrswLFWu4ytjCfyKd6NrZTG+0OmUtYG8z8iOz
 qp54asb+rIVrqwnRhHXJqJm0WPTuABUJ+XqC/U20IBt1r45Vs0NZTB7cKPAeCJwAzq
 4G5VL7sil4kfgkery4pvIm3xJ+gTt3CZGUSiQhCI=
Subject: Patch "drm/gem: Internally test import_attach for imported objects"
 has been added to the 6.12-stable tree
To: airlied@gmail.com, andyshrk@163.com, asrivats@redhat.com,
 boris.brezillon@collabora.com, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 linaro-mm-sig@lists.linaro.org, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, simona.vetter@ffwll.ch, simona@ffwll.ch,
 sumit.semwal@linaro.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 27 May 2025 17:35:11 +0200
Message-ID: <2025052710-turtle-litigate-d36c@gregkh>
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

    drm/gem: Internally test import_attach for imported objects

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-gem-internally-test-import_attach-for-imported-objects.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 8260731ccad0451207b45844bb66eb161a209218 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Wed, 16 Apr 2025 08:57:45 +0200
Subject: drm/gem: Internally test import_attach for imported objects
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 8260731ccad0451207b45844bb66eb161a209218 upstream.

Test struct drm_gem_object.import_attach to detect imported objects.

During object clenanup, the dma_buf field might be NULL. Testing it in
an object's free callback then incorrectly does a cleanup as for native
objects. Happens for calls to drm_mode_destroy_dumb_ioctl() that
clears the dma_buf field in drm_gem_object_exported_dma_buf_free().

v3:
- only test for import_attach (Boris)
v2:
- use import_attach.dmabuf instead of dma_buf (Christian)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: b57aa47d39e9 ("drm/gem: Test for imported GEM buffers with helper")
Reported-by: Andy Yan <andyshrk@163.com>
Closes: https://lore.kernel.org/dri-devel/38d09d34.4354.196379aa560.Coremail.andyshrk@163.com/
Tested-by: Andy Yan <andyshrk@163.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Anusha Srivatsa <asrivats@redhat.com>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-media@vger.kernel.org
Cc: linaro-mm-sig@lists.linaro.org
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Reviewed-by: Simona Vetter <simona.vetter@ffwll.ch>
Link: https://lore.kernel.org/r/20250416065820.26076-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 include/drm/drm_gem.h |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -580,8 +580,7 @@ static inline bool drm_gem_object_is_sha
  */
 static inline bool drm_gem_is_imported(const struct drm_gem_object *obj)
 {
-	/* The dma-buf's priv field points to the original GEM object. */
-	return obj->dma_buf && (obj->dma_buf->priv != obj);
+	return !!obj->import_attach;
 }
 
 #ifdef CONFIG_LOCKDEP


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.12/drm-gem-internally-test-import_attach-for-imported-objects.patch
queue-6.12/drm-ast-find-vbios-mode-from-regular-display-size.patch
queue-6.12/drm-gem-test-for-imported-gem-buffers-with-helper.patch
queue-6.12/drm-atomic-clarify-the-rules-around-drm_atomic_state.patch
