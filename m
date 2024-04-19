Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9FE6D8AB557
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 21:00:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF4CF10FFD6;
	Fri, 19 Apr 2024 19:00:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="vhf1rzDV";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PplcsBRD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E378710FFD5
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 19:00:43 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713553241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y/Mk5BsbEdPJv8VhsnLb8RYA6psPnj/he2tHNKR8Z40=;
 b=vhf1rzDVQfE+/pOsWmkzBlegxqrjQuuESIAJdtotPXce6QuVJ6YaC6HifvsNYVnDhQgJa0
 Lfr3oFEIan0WVRvty2I1nNaQXfnTx0Wmfp0aum6T8h4LMCeO/lYjQHhrn6aKCOP50LcI+u
 YBprsuhsoxofF7tTDEWdgxI8RLR40An9nvdMPLEb1H/mgLt8KXvCj+Jx9ZWzhsRybm+UAA
 EXwHepNbnvBxF3I0u2ryueoFrfLDW2cluNB8c0cdNntvY3qWhItvwxmvqohbBHFMU4+Y7z
 53x9kfZQMMjT5VQq2/UKdPofyY5PT2gj8eWbMCBPyK2BLuDvbTVrR6Qwi8gqSw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713553241;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=y/Mk5BsbEdPJv8VhsnLb8RYA6psPnj/he2tHNKR8Z40=;
 b=PplcsBRDDf6zq+QhZEMuFbhwBir7skqDABVWyD78qtxe3KSN0aak49/olGdQdBYu1n8YLM
 te0wsKuJFRXt63BQ==
To: Jaya Kumar <jayalk@intworks.biz>, Daniel Vetter <daniel@ffwll.ch>,
 Helge Deller <deller@gmx.de>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: tiwai@suse.de, namcao@linutronix.de, bigeasy@linutronix.de,
 patrik.r.jakobsson@gmail.com, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>,
 Darren Kenny <darren.kenny@oracle.com>, chuansheng.liu@intel.com,
 Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>,
 stable@vger.kernel.org
Subject: [PATCH] fbdev: fix incorrect address computation in deferred IO
Date: Fri, 19 Apr 2024 21:00:32 +0200
Message-Id: <20240419190032.40490-1-namcao@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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

With deferred IO enabled, a page fault happens when data is written to the
framebuffer device. Then driver determines which page is being updated by
calculating the offset of the written virtual address within the virtual
memory area, and uses this offset to get the updated page within the
internal buffer. This page is later copied to hardware (thus the name
"deferred IO").

This calculation is only correct if the virtual memory area is mapped to
the beginning of the internal buffer. Otherwise this is wrong. For example,
if users do:
    mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);

Then the virtual memory area will mapped at offset 0xff000 within the
internal buffer. This offset 0xff000 is not accounted for, and wrong page
is updated. This will lead to wrong pixels being updated on the device.

However, it gets worse: if users do 2 mmap to the same virtual address, for
example:

    int fd =3D open("/dev/fb0", O_RDWR, 0);
    char *ptr =3D (char *) 0x20000000ul;
    mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
    *ptr =3D 0; // write #1
    mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);
    *ptr =3D 0; // write #2

In this case, both write #1 and write #2 apply to the same virtual address
(0x20000000ul), and the driver mistakenly thinks the same page is being
written to. When the second write happens, the driver thinks this is the
same page as the last time, and reuse the page from write #1. The driver
then lock_page() an incorrect page, and returns VM_FAULT_LOCKED with the
correct page unlocked. It is unclear what will happen with memory
management subsystem after that, but likely something terrible.

Fix this by taking the mapping offset into account.

Reported-and-tested-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.c=
om>
Closes: https://lore.kernel.org/linux-fbdev/271372d6-e665-4e7f-b088-dee5f4a=
b341a@oracle.com
Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
Cc: stable@vger.kernel.org
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/video/fbdev/core/fb_defio.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core=
/fb_defio.c
index dae96c9f61cf..d5d6cd9e8b29 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -196,7 +196,8 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_i=
nfo *info, unsigned long
  */
 static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct=
 vm_fault *vmf)
 {
-	unsigned long offset =3D vmf->address - vmf->vma->vm_start;
+	unsigned long offset =3D vmf->address - vmf->vma->vm_start
+			+ (vmf->vma->vm_pgoff << PAGE_SHIFT);
 	struct page *page =3D vmf->page;
=20
 	file_update_time(vmf->vma->vm_file);
--=20
2.39.2

