Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D01579BE008
	for <lists+dri-devel@lfdr.de>; Wed,  6 Nov 2024 09:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E884410E646;
	Wed,  6 Nov 2024 08:12:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="RoTo5ADI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A1E710E646
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Nov 2024 08:12:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id DADE8A42A0B;
 Wed,  6 Nov 2024 08:10:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22A2EC4CECD;
 Wed,  6 Nov 2024 08:12:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1730880770;
 bh=O5Ng4C2TxSOHvvNMdjZdUXE7Qr0cBMoNO6aMBzpBEkc=;
 h=Subject:To:Cc:From:Date:From;
 b=RoTo5ADIRJIyQ4U93heuzBRWaKKI7F/BTLNoNWzmm4bb4ivmvI4BDw3NgEBiVnOQ3
 ByKV1PYBbVHb60hp7a66sEhQqW6LC2RGlcomSibtunkAO/K0Us3TdNOXHuSKxjgJrP
 aaJwWHKy1yhDeKsFoYNjbWqTwfpcIMKnvbXshdeg=
Subject: Patch "drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE,
 MAP_PRIVATE)" has been added to the 5.10-stable tree
To: airlied@gmail.com, daniel.vetter@ffwll.ch, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, eric@anholt.net, gregkh@linuxfoundation.org,
 jacek.lawrynowicz@linux.intel.com, karol.wachowski@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, noralf@tronnes.org,
 raclesdv@gmail.com, robh@kernel.org, tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 06 Nov 2024 09:12:32 +0100
Message-ID: <2024110632-reentry-hyphen-3e8e@gregkh>
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

    drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE)

to the 5.10-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-shmem-helper-fix-bug_on-on-mmap-prot_write-map_private.patch
and it can be found in the queue-5.10 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 39bc27bd688066a63e56f7f64ad34fae03fbe3b8 Mon Sep 17 00:00:00 2001
From: "Wachowski, Karol" <karol.wachowski@intel.com>
Date: Mon, 20 May 2024 12:05:14 +0200
Subject: drm/shmem-helper: Fix BUG_ON() on mmap(PROT_WRITE, MAP_PRIVATE)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Wachowski, Karol <karol.wachowski@intel.com>

commit 39bc27bd688066a63e56f7f64ad34fae03fbe3b8 upstream.

Lack of check for copy-on-write (COW) mapping in drm_gem_shmem_mmap
allows users to call mmap with PROT_WRITE and MAP_PRIVATE flag
causing a kernel panic due to BUG_ON in vmf_insert_pfn_prot:
BUG_ON((vma->vm_flags & VM_PFNMAP) && is_cow_mapping(vma->vm_flags));

Return -EINVAL early if COW mapping is detected.

This bug affects all drm drivers using default shmem helpers.
It can be reproduced by this simple example:
void *ptr = mmap(0, size, PROT_WRITE, MAP_PRIVATE, fd, mmap_offset);
ptr[0] = 0;

Fixes: 2194a63a818d ("drm: Add library for shmem backed GEM objects")
Cc: Noralf Trønnes <noralf@tronnes.org>
Cc: Eric Anholt <eric@anholt.net>
Cc: Rob Herring <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v5.2+
Signed-off-by: Wachowski, Karol <karol.wachowski@intel.com>
Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20240520100514.925681-1-jacek.lawrynowicz@linux.intel.com
[ Artem: bp to fix CVE-2024-39497, in order to adapt this patch to branch 5.10
  add header file mm/internal.h]
Signed-off-by: Artem Sdvizhkov <raclesdv@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/drm_gem_shmem_helper.c |    5 +++++
 1 file changed, 5 insertions(+)

--- a/drivers/gpu/drm/drm_gem_shmem_helper.c
+++ b/drivers/gpu/drm/drm_gem_shmem_helper.c
@@ -17,6 +17,8 @@
 #include <drm/drm_prime.h>
 #include <drm/drm_print.h>
 
+#include "../../../mm/internal.h"   /* is_cow_mapping() */
+
 /**
  * DOC: overview
  *
@@ -630,6 +632,9 @@ int drm_gem_shmem_mmap(struct drm_gem_ob
 		return ret;
 	}
 
+	if (is_cow_mapping(vma->vm_flags))
+		return -EINVAL;
+
 	shmem = to_drm_gem_shmem_obj(obj);
 
 	ret = drm_gem_shmem_get_pages(shmem);


Patches currently in stable-queue which might be from karol.wachowski@intel.com are

queue-5.10/drm-shmem-helper-fix-bug_on-on-mmap-prot_write-map_private.patch
