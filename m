Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F168AE4D5
	for <lists+dri-devel@lfdr.de>; Tue, 23 Apr 2024 13:51:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E2BA1113335;
	Tue, 23 Apr 2024 11:51:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="aXPsKAUY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="GE4xxKg1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80A6E113335
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Apr 2024 11:51:07 +0000 (UTC)
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713873066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nId7yfti82jidSrNPjc6pFuqg7gFIn/sC7IuAdW8lsU=;
 b=aXPsKAUYw1xfZIpf+JY5/kFVVaYhclqesT8eNqgRT8QWYp1fy4f9W5cQ96InRPMjc81Tpx
 nym17Np9zhy/o3PSY9GC/WTSdhfRe+zxZSVwmbqMXeo3yn2tqse+UJuXmeNaGfVwo/IbP9
 RR3rhvZjylHfmhNtzwK09DsCc8k/8g/0t1tjCJrhQ1J95nsyOWOMIqkiDN3E1o5jt20Hgn
 s/YPG9lovejnpZaT0rezWC1uHCgOWJuH0gnvH7cqE+4nrcpoVWHam+o4J+mUFM62wAMK2T
 OI+cmh+RvVNalgAyize0CWS0YTZ5x5QxY/pEWFLqPW+7if4zFIOUqwOqCTRuJg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713873066;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=nId7yfti82jidSrNPjc6pFuqg7gFIn/sC7IuAdW8lsU=;
 b=GE4xxKg1OleHEYvmyB77Oha0O4topex9HjYpEQVHoc0U0xyzeSVNI6gWt2wOvfF5KCOqyl
 pYqRuHdMYzNWmjBA==
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
Subject: [PATCH v2] fbdev: fix incorrect address computation in deferred IO
Date: Tue, 23 Apr 2024 13:50:53 +0200
Message-Id: <20240423115053.4490-1-namcao@linutronix.de>
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

This offset calculation is only correct if the virtual memory area is
mapped to the beginning of the internal buffer. Otherwise this is wrong.
For example, if users do:
    mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);

Then the virtual memory area will mapped at offset 0xff000 within the
internal buffer. This offset 0xff000 is not accounted for, and wrong page
is updated.

Correct the calculation by using vmf->pgoff instead. With this change, the
variable "offset" will no longer hold the exact offset value, but it is
rounded down to multiples of PAGE_SIZE. But this is still correct, because
this variable is only used to calculate the page offset.

Reported-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Closes: https://lore.kernel.org/linux-fbdev/271372d6-e665-4e7f-b088-dee5f4a=
b341a@oracle.com
Fixes: 56c134f7f1b5 ("fbdev: Track deferred-I/O pages in pageref struct")
Cc: <stable@vger.kernel.org>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2:
  - simplify the patch by using vfg->pgoff
  - remove tested-by tag, as the patch is now different

 drivers/video/fbdev/core/fb_defio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core=
/fb_defio.c
index 1ae1d35a5942..b9607d5a370d 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -196,7 +196,7 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_i=
nfo *info, unsigned long
  */
 static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct=
 vm_fault *vmf)
 {
-	unsigned long offset =3D vmf->address - vmf->vma->vm_start;
+	unsigned long offset =3D vmf->pgoff << PAGE_SHIFT;
 	struct page *page =3D vmf->page;
=20
 	file_update_time(vmf->vma->vm_file);
--=20
2.39.2

