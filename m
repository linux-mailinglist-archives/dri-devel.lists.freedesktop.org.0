Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9878426FA36
	for <lists+dri-devel@lfdr.de>; Fri, 18 Sep 2020 12:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC34A6ECCC;
	Fri, 18 Sep 2020 10:15:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B92C6ECCC
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Sep 2020 10:15:04 +0000 (UTC)
Received: from threadripper.lan ([149.172.98.151]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.129]) with ESMTPA (Nemesis) id
 1MfHQp-1kzioY3oj5-00gtZg; Fri, 18 Sep 2020 12:09:33 +0200
From: Arnd Bergmann <arnd@arndb.de>
To: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: [PATCH 1/3] fbdev: simplify fb_getput_cmap()
Date: Fri, 18 Sep 2020 12:09:04 +0200
Message-Id: <20200918100926.1447563-1-arnd@arndb.de>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200918100812.1447443-1-arnd@arndb.de>
References: <20200918100812.1447443-1-arnd@arndb.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:qTgjU2sPJm0CtwAKfelk8EKx/cY7OswKlwGh4NJZIDPMM4UJmUa
 ApsbULj9LW7rbHjUIz1A/i0NUp0GCZEkUeR45RFfhJofLOW7W5UZQXrFwxabzkSPKBUC3O4
 4iyxGZQkD/CfW/upMjj+If3hjxf2OaTt5NAhb6N8DJtpZgN492yoUHypNo5oZFBnV+Jkf0L
 8qjEN/cBHKUVWweeaMiHg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:6wF6uVnDOQo=:ydcIg5CETGJHzt0PPH4E2E
 YbUXatWHgJwD0EqPEeTOi3ak8UUTuYozvYbcKahQBMyi7dltkRoLyfO53QW29YOWbsfvqgLj3
 7NFX0ungQuu6SxjXrn0NGWOQq6nNQ6Ec4O/O14N8DAYdJpfSxBY30suqlpfTBZ++TfDu4B/ab
 x3yh4vOtgbx634lgCx4G5FgaWbIuW2ReDfBqPQ1ll/6HflmwzrAAwx84f+trHqOYgarUCaPeI
 Q9Vg8k9Nnql4xioyGlNawD9L5/7go6FM9h82K1p+korWv83KSDeY3oxPjm7CfZMvwY8Y0B2GF
 HiIBT0Jj3tpvoJ6dpWaBP7/zAZQM7LDwD5xbyEw1lk1bIWFNCaYV0kVjtsZB1XWLc57mptlLJ
 hhB5KkFUvxCuYBJ4vOP11GMJ6jYkxWImgKqkWxADtRexyaMprt82jvx2dnGWhCfrwBRQmDk5p
 fJ5h3+/ZS2Lvbv/HZBNUbJN/lABvKc7oNi5nL8BqxSoGjscHfcih2y5OFvCY5asaw+LoggZ7O
 hEsbPLxM1dfCC437Z9vyvBwRxDaJfq7q0aOaf89riv01rZAn29mduAVXdZSwpRgyPayhaVjhr
 wdV5RNf/EpXG1lNVmbNBG618uJuc85NKY7L0kCtfqqGIIhU2ZtTumnoUmyWJVL/K/lV4ej93L
 fqHdFcYChfwyeFxOupbIZPvoc2PLk9nL8DGSQVXBxw4oRgBYCYSZqpH7ApugrbJJKn9R32rlw
 g+zN2RBJ4UF/6cDMyydNsY3O2Eu/Li0p2vPGOGZETpH/Prnwa7IRYaRb52puX2tokLaia/oEC
 DeGAcZ3g+63nPmRGEECK1mXZ+6xyOj4pt1/MbiKh7slvKDwRvMTib3FGwgGjUkY3NmFtqHm
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
Cc: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, hch@lst.de,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This function is one of the remaining users of compat_alloc_user_space()
and copy_in_user().

Clean it up by copying to a local data structure copy instead,
which also leads to more readable code.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/video/fbdev/core/fbmem.c | 44 ++++++++++++++------------------
 1 file changed, 19 insertions(+), 25 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index da7c88ffaa6a..4e162e3d3538 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -1211,36 +1211,30 @@ struct fb_cmap32 {
 static int fb_getput_cmap(struct fb_info *info, unsigned int cmd,
 			  unsigned long arg)
 {
-	struct fb_cmap_user __user *cmap;
-	struct fb_cmap32 __user *cmap32;
-	__u32 data;
-	int err;
-
-	cmap = compat_alloc_user_space(sizeof(*cmap));
-	cmap32 = compat_ptr(arg);
+	struct fb_cmap32 cmap32;
+	struct fb_cmap cmap_from;
+	struct fb_cmap_user cmap;
 
-	if (copy_in_user(&cmap->start, &cmap32->start, 2 * sizeof(__u32)))
+	if (copy_from_user(&cmap32, compat_ptr(arg), sizeof(cmap32)))
 		return -EFAULT;
 
-	if (get_user(data, &cmap32->red) ||
-	    put_user(compat_ptr(data), &cmap->red) ||
-	    get_user(data, &cmap32->green) ||
-	    put_user(compat_ptr(data), &cmap->green) ||
-	    get_user(data, &cmap32->blue) ||
-	    put_user(compat_ptr(data), &cmap->blue) ||
-	    get_user(data, &cmap32->transp) ||
-	    put_user(compat_ptr(data), &cmap->transp))
-		return -EFAULT;
+	cmap = (struct fb_cmap_user) {
+		.start	= cmap32.start,
+		.len	= cmap32.len,
+		.red	= compat_ptr(cmap32.red),
+		.green	= compat_ptr(cmap32.green),
+		.blue	= compat_ptr(cmap32.blue),
+		.transp	= compat_ptr(cmap32.transp),
+	};
 
-	err = do_fb_ioctl(info, cmd, (unsigned long) cmap);
+	if (cmd == FBIOPUTCMAP)
+		return fb_set_user_cmap(&cmap, info);
 
-	if (!err) {
-		if (copy_in_user(&cmap32->start,
-				 &cmap->start,
-				 2 * sizeof(__u32)))
-			err = -EFAULT;
-	}
-	return err;
+	lock_fb_info(info);
+	cmap_from = info->cmap;
+	unlock_fb_info(info);
+
+	return fb_cmap_to_user(&cmap_from, &cmap);
 }
 
 static int do_fscreeninfo_to_user(struct fb_fix_screeninfo *fix,
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
