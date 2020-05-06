Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF0B1C69B0
	for <lists+dri-devel@lfdr.de>; Wed,  6 May 2020 09:03:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD136E821;
	Wed,  6 May 2020 07:02:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 851076E287
 for <dri-devel@lists.freedesktop.org>; Wed,  6 May 2020 06:18:33 +0000 (UTC)
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 3A1678CC74D9F94A02ED;
 Wed,  6 May 2020 14:18:30 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS406-HUB.china.huawei.com
 (10.3.19.206) with Microsoft SMTP Server id 14.3.487.0; Wed, 6 May 2020
 14:18:23 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <b.zolnierkie@samsung.com>, <dri-devel@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: fbdev: pxa168fb: make pxa168fb_init_mode() return void
Date: Wed, 6 May 2020 14:17:45 +0800
Message-ID: <20200506061745.19451-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 06 May 2020 07:02:40 +0000
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
Cc: Jason Yan <yanaijie@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

No other functions use the return value of pxa168fb_init_mode() and the
return value is always 0 now. Make it return void. This fixes the
following coccicheck warning:

drivers/video/fbdev/pxa168fb.c:565:5-8: Unneeded variable: "ret". Return
"0" on line 597

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/pxa168fb.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/pxa168fb.c b/drivers/video/fbdev/pxa168fb.c
index aef8a3042590..eedfbd3572a8 100644
--- a/drivers/video/fbdev/pxa168fb.c
+++ b/drivers/video/fbdev/pxa168fb.c
@@ -557,12 +557,11 @@ static const struct fb_ops pxa168fb_ops = {
 	.fb_imageblit	= cfb_imageblit,
 };
 
-static int pxa168fb_init_mode(struct fb_info *info,
+static void pxa168fb_init_mode(struct fb_info *info,
 			      struct pxa168fb_mach_info *mi)
 {
 	struct pxa168fb_info *fbi = info->par;
 	struct fb_var_screeninfo *var = &info->var;
-	int ret = 0;
 	u32 total_w, total_h, refresh;
 	u64 div_result;
 	const struct fb_videomode *m;
@@ -593,8 +592,6 @@ static int pxa168fb_init_mode(struct fb_info *info,
 	div_result = 1000000000000ll;
 	do_div(div_result, total_w * total_h * refresh);
 	var->pixclock = (u32)div_result;
-
-	return ret;
 }
 
 static int pxa168fb_probe(struct platform_device *pdev)
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
