Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E753345A212
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 12:56:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 311826E057;
	Tue, 23 Nov 2021 11:56:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F000F6E057
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 11:56:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5A39560F42;
 Tue, 23 Nov 2021 11:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1637668594;
 bh=JfElw6S/UmWCIqOZl7RklFinwJGA9nBHybOBRjZ81TI=;
 h=Subject:To:Cc:From:Date:From;
 b=UbCGmnxalk/QWbyHdNae+ERalyhGrDczdxF39Q+gYSiRgla0Gic1nftJnUdVaW3qm
 P42fHsA9haQROtUHdlTpbqe9sIdwt3kZK88Y/IgHu3klgFaeo/Nh/QZaAV9S82WOAG
 vF0PzYe+AQEWCANcCxqLI6UBCNM7whmHQm59HQqg=
Subject: Patch "drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap"
 has been added to the 5.15-stable tree
To: airlied@linux.ie, amistry@google.com, daniel.vetter@ffwll.ch,
 daniel@ffwll.ch, dri-devel@lists.freedesktop.org, gregkh@linuxfoundation.org,
 kraxel@redhat.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de
From: <gregkh@linuxfoundation.org>
Date: Tue, 23 Nov 2021 12:56:05 +0100
Message-ID: <1637668565800@kroah.com>
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

    drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-prime-fix-use-after-free-in-mmap-with-drm_gem_ttm_mmap.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 8244a3bc27b3efd057da154b8d7e414670d5044f Mon Sep 17 00:00:00 2001
From: Anand K Mistry <amistry@google.com>
Date: Thu, 30 Sep 2021 09:00:07 +1000
Subject: drm/prime: Fix use after free in mmap with drm_gem_ttm_mmap

From: Anand K Mistry <amistry@google.com>

commit 8244a3bc27b3efd057da154b8d7e414670d5044f upstream.

drm_gem_ttm_mmap() drops a reference to the gem object on success. If
the gem object's refcount == 1 on entry to drm_gem_prime_mmap(), that
drop will free the gem object, and the subsequent drm_gem_object_get()
will be a UAF. Fix by grabbing a reference before calling the mmap
helper.

This issue was forseen when the reference dropping was adding in
commit 9786b65bc61ac ("drm/ttm: fix mmap refcounting"):
  "For that to work properly the drm_gem_object_get() call in
  drm_gem_ttm_mmap() must be moved so it happens before calling
  obj->funcs->mmap(), otherwise the gem refcount would go down
  to zero."

Signed-off-by: Anand K Mistry <amistry@google.com>
Fixes: 9786b65bc61a ("drm/ttm: fix mmap refcounting")
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.5+
Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20210930085932.1.I8043d61cc238e0168e2f4ca5f4783223434aa587@changeid
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_prime.c |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -719,11 +719,13 @@ int drm_gem_prime_mmap(struct drm_gem_ob
 	if (obj->funcs && obj->funcs->mmap) {
 		vma->vm_ops = obj->funcs->vm_ops;
 
+		drm_gem_object_get(obj);
 		ret = obj->funcs->mmap(obj, vma);
-		if (ret)
+		if (ret) {
+			drm_gem_object_put(obj);
 			return ret;
+		}
 		vma->vm_private_data = obj;
-		drm_gem_object_get(obj);
 		return 0;
 	}
 


Patches currently in stable-queue which might be from amistry@google.com are

queue-5.15/drm-prime-fix-use-after-free-in-mmap-with-drm_gem_ttm_mmap.patch
