Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 353B32883B9
	for <lists+dri-devel@lfdr.de>; Fri,  9 Oct 2020 09:37:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A9906EC4D;
	Fri,  9 Oct 2020 07:37:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3526EC4D
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Oct 2020 07:37:42 +0000 (UTC)
Received: from localhost (83-86-74-64.cable.dynamic.v4.ziggo.nl [83.86.74.64])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256
 bits)) (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 17A2920708;
 Fri,  9 Oct 2020 07:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1602229062;
 bh=3s+fHdY4yzlkM+pozNxCzX1gJx4jNsa6Hd1NpmThwsU=;
 h=Subject:To:Cc:From:Date:From;
 b=c9xIB8fySwnLg0SrcR8RTpIG6H/8fnWZcr3uRqmzSX2sRmiBdb6tAbTuNBjD7SljA
 BzpSorAwxGVj/CWTHv5CoBnNH7FKqlHFGYKPxPYDsyg2GGhYDDilyQdY0syUvF0C8d
 dp+yxcu3N5+mjcdioQYrV6DZmzdRsL2d/NoMoeLw=
Subject: Patch "drm/nouveau/mem: guard against NULL pointer access in mem_del"
 has been added to the 4.19-stable tree
To: airlied@redhat.com, dri-devel@lists.freedesktop.org,
 gregkh@linuxfoundation.org, kherbst@redhat.com
From: <gregkh@linuxfoundation.org>
Date: Fri, 09 Oct 2020 09:38:29 +0200
Message-ID: <160222910953188@kroah.com>
MIME-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


This is a note to let you know that I've just added the patch titled

    drm/nouveau/mem: guard against NULL pointer access in mem_del

to the 4.19-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-nouveau-mem-guard-against-null-pointer-access-in-mem_del.patch
and it can be found in the queue-4.19 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From d10285a25e29f13353bbf7760be8980048c1ef2f Mon Sep 17 00:00:00 2001
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 7 Oct 2020 00:05:28 +0200
Subject: drm/nouveau/mem: guard against NULL pointer access in mem_del

From: Karol Herbst <kherbst@redhat.com>

commit d10285a25e29f13353bbf7760be8980048c1ef2f upstream.

other drivers seems to do something similar

Signed-off-by: Karol Herbst <kherbst@redhat.com>
Cc: dri-devel <dri-devel@lists.freedesktop.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: stable@vger.kernel.org
Signed-off-by: Dave Airlie <airlied@redhat.com>
Link: https://patchwork.freedesktop.org/patch/msgid/20201006220528.13925-2-kherbst@redhat.com
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
 drivers/gpu/drm/nouveau/nouveau_mem.c |    2 ++
 1 file changed, 2 insertions(+)

--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -176,6 +176,8 @@ void
 nouveau_mem_del(struct ttm_mem_reg *reg)
 {
 	struct nouveau_mem *mem = nouveau_mem(reg);
+	if (!mem)
+		return;
 	nouveau_mem_fini(mem);
 	kfree(reg->mm_node);
 	reg->mm_node = NULL;


Patches currently in stable-queue which might be from kherbst@redhat.com are

queue-4.19/drm-nouveau-mem-guard-against-null-pointer-access-in-mem_del.patch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
