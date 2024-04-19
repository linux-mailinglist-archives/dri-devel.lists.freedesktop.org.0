Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EF74D8AB12B
	for <lists+dri-devel@lfdr.de>; Fri, 19 Apr 2024 16:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61A8F10E764;
	Fri, 19 Apr 2024 14:59:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=linutronix.de header.i=@linutronix.de header.b="s3ApxoBz";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="qItYvkou";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFFC510E764
 for <dri-devel@lists.freedesktop.org>; Fri, 19 Apr 2024 14:59:22 +0000 (UTC)
Date: Fri, 19 Apr 2024 16:59:15 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020; t=1713538760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFy5tOWbJnHTTd/HH6FM6qdDQdeNlfnkJofdVo0X314=;
 b=s3ApxoBzIv0PB3/Nw0NGixvnGITT3G2fuw5pfNYi04ilb57GqyalvJGnKjwccYgI2fp1kj
 8HyiAC5Djo3/FrYcKZR4VG0g5Eba2R8RVmKmj7pRCvNpUaWnaKDmBDTMmWMljOiZ0aMmby
 +2YugeVRvKutvbuEmrIsA0lyWo/KCIPkWLcSr8KYJn+wvIjPtzHKIpeI7/TGhHwkpAlIGA
 Np6w3qaaICsQrUYFZnKzRtiG00uW26GfPXfnyrargzkMMc2hvBDSWdi6Y92mjKundFjDSc
 hcpqdjllZN8KLaTveok1mynYjsiJkGjUSVLvIy4R2Ri6fKWR60e/vmW5JBuvvg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
 s=2020e; t=1713538760;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DFy5tOWbJnHTTd/HH6FM6qdDQdeNlfnkJofdVo0X314=;
 b=qItYvkoudQJSixjUBY0qqqIQtxPVYizlro6RKTJGIklkRVZEzDfJBLR65hE0591zo5ajSi
 rot6xhQP1EZ/AkAg==
From: Nam Cao <namcao@linutronix.de>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: jayalk@intworks.biz, Daniel Vetter <daniel@ffwll.ch>, deller@gmx.de,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tiwai@suse.de, bigeasy@linutronix.de, patrik.r.jakobsson@gmail.com, LKML
 <linux-kernel@vger.kernel.org>, Vegard Nossum <vegard.nossum@oracle.com>,
 George Kennedy <george.kennedy@oracle.com>, Darren Kenny
 <darren.kenny@oracle.com>, chuansheng.liu@intel.com
Subject: Re: [bug-report] task info hung problem in fb_deferred_io_work()
Message-ID: <20240419165915.228c76e9@namcao>
In-Reply-To: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
References: <271372d6-e665-4e7f-b088-dee5f4ab341a@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On 2024-04-18 Harshit Mogalapalli wrote:
> While fuzzing 5.15.y kernel with Syzkaller, we noticed a INFO: task hung 
> bug in fb_deferred_io_work()

I think the problem is because of improper offset address calculation.
The kernel calculate address offset with:
	offset = vmf->address - vmf->vma->vm_start

Now the problem is that your C program mmap the framebuffer at 2
different offsets:
	mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0xff000);
	mmap(ptr, 4096, PROT_WRITE, MAP_FIXED | MAP_SHARED, fd, 0);

but the kernel doesn't take these different offsets into account.
So, 2 different pages are mistakenly recognized as the same page.

Can you try the following patch?

Best regards,
Nam

diff --git a/drivers/video/fbdev/core/fb_defio.c b/drivers/video/fbdev/core/fb_defio.c
index dae96c9f61cf..d5d6cd9e8b29 100644
--- a/drivers/video/fbdev/core/fb_defio.c
+++ b/drivers/video/fbdev/core/fb_defio.c
@@ -196,7 +196,8 @@ static vm_fault_t fb_deferred_io_track_page(struct fb_info *info, unsigned long
  */
 static vm_fault_t fb_deferred_io_page_mkwrite(struct fb_info *info, struct vm_fault *vmf)
 {
-	unsigned long offset = vmf->address - vmf->vma->vm_start;
+	unsigned long offset = vmf->address - vmf->vma->vm_start
+			+ (vmf->vma->vm_pgoff << PAGE_SHIFT);
 	struct page *page = vmf->page;
 
 	file_update_time(vmf->vma->vm_file);


