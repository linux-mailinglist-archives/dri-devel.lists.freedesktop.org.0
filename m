Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7E1F1B55D3
	for <lists+dri-devel@lfdr.de>; Thu, 23 Apr 2020 09:37:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B0E26E2DD;
	Thu, 23 Apr 2020 07:36:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29FAC6E33D
 for <dri-devel@lists.freedesktop.org>; Wed, 22 Apr 2020 07:19:27 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 962E14C4598441586B28;
 Wed, 22 Apr 2020 15:19:25 +0800 (CST)
Received: from huawei.com (10.175.124.28) by DGGEMS410-HUB.china.huawei.com
 (10.3.19.210) with Microsoft SMTP Server id 14.3.487.0; Wed, 22 Apr 2020
 15:19:16 +0800
From: Jason Yan <yanaijie@huawei.com>
To: <spock@gentoo.org>, <b.zolnierkie@samsung.com>,
 <linux-fbdev@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Subject: [PATCH] video: uvesafb: use true,false for bool variables
Date: Wed, 22 Apr 2020 15:18:45 +0800
Message-ID: <20200422071845.403-1-yanaijie@huawei.com>
X-Mailer: git-send-email 2.21.1
MIME-Version: 1.0
X-Originating-IP: [10.175.124.28]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 23 Apr 2020 07:36:39 +0000
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

Fix the following coccicheck warning:

drivers/video/fbdev/uvesafb.c:48:12-17: WARNING: Assignment of 0/1 to
bool variable
drivers/video/fbdev/uvesafb.c:1827:3-13: WARNING: Assignment of 0/1 to
bool variable
drivers/video/fbdev/uvesafb.c:1829:3-13: WARNING: Assignment of 0/1 to
bool variable
drivers/video/fbdev/uvesafb.c:1835:3-9: WARNING: Assignment of 0/1 to
bool variable
drivers/video/fbdev/uvesafb.c:1837:3-9: WARNING: Assignment of 0/1 to
bool variable
drivers/video/fbdev/uvesafb.c:1839:3-8: WARNING: Assignment of 0/1 to
bool variable

Signed-off-by: Jason Yan <yanaijie@huawei.com>
---
 drivers/video/fbdev/uvesafb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index 1b385cf76110..bee29aadc646 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -45,7 +45,7 @@ static const struct fb_fix_screeninfo uvesafb_fix = {
 };
 
 static int mtrr		= 3;	/* enable mtrr by default */
-static bool blank	= 1;	/* enable blanking by default */
+static bool blank	= true;	/* enable blanking by default */
 static int ypan		= 1;	/* 0: scroll, 1: ypan, 2: ywrap */
 static bool pmi_setpal	= true; /* use PMI for palette changes */
 static bool nocrtc;		/* ignore CRTC settings */
@@ -1824,19 +1824,19 @@ static int uvesafb_setup(char *options)
 		else if (!strcmp(this_opt, "ywrap"))
 			ypan = 2;
 		else if (!strcmp(this_opt, "vgapal"))
-			pmi_setpal = 0;
+			pmi_setpal = false;
 		else if (!strcmp(this_opt, "pmipal"))
-			pmi_setpal = 1;
+			pmi_setpal = true;
 		else if (!strncmp(this_opt, "mtrr:", 5))
 			mtrr = simple_strtoul(this_opt+5, NULL, 0);
 		else if (!strcmp(this_opt, "nomtrr"))
 			mtrr = 0;
 		else if (!strcmp(this_opt, "nocrtc"))
-			nocrtc = 1;
+			nocrtc = true;
 		else if (!strcmp(this_opt, "noedid"))
-			noedid = 1;
+			noedid = true;
 		else if (!strcmp(this_opt, "noblank"))
-			blank = 0;
+			blank = true;
 		else if (!strncmp(this_opt, "vtotal:", 7))
 			vram_total = simple_strtoul(this_opt + 7, NULL, 0);
 		else if (!strncmp(this_opt, "vremap:", 7))
-- 
2.21.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
