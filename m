Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBEBF1A6076
	for <lists+dri-devel@lfdr.de>; Sun, 12 Apr 2020 22:21:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5598F899E8;
	Sun, 12 Apr 2020 20:21:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2897899E8
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Apr 2020 20:21:47 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id EE21F80478;
 Sun, 12 Apr 2020 22:21:44 +0200 (CEST)
Date: Sun, 12 Apr 2020 22:21:43 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH] video: vt8500lcdfb: fix fallthrough warning
Message-ID: <20200412202143.GA26948@ravnborg.org>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=kj9zAlcOel0A:10 a=7gkXJVJtAAAA:8 a=QyXUC8HyAAAA:8 a=pGLkceISAAAA:8
 a=1cMp6Op0AAAA:8 a=hD80L64hAAAA:8 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
 a=NcUNtGcOwW8lTd5LSkMA:9 a=CjuIK1q_8ugA:10 a=E9Po1WZjFZOl8hwRPBS3:22
 a=cge21SmdFH0vqy2l-lvr:22 a=Vxmtnl_E_bksehYqCbjh:22
 a=AjGcO6oz07-iQ99wixmX:22
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
Cc: Paul Mundt <lethal@linux-sh.org>, Alexey Charkov <alchark@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix following warning:
vt8500lcdfb.c: In function 'vt8500lcd_blank':
vt8500lcdfb.c:229:6: warning: this statement may fall through [-Wimplicit-fallthrough=]
      if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR ||
         ^
vt8500lcdfb.c:233:2: note: here
     case FB_BLANK_UNBLANK:
     ^~~~

Adding a simple "fallthrough;" fixed the warning.
The fix was build tested.

Signed-off-by: Sam Ravnborg <sam@ravnborg.org>
Reported-by: kbuild test robot <lkp@intel.com>
Fixes: e41f1a989408 ("fbdev: Implement simple blanking in pseudocolor modes for vt8500lcdfb")
Cc: Alexey Charkov <alchark@gmail.com>
Cc: Paul Mundt <lethal@linux-sh.org>
Cc: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-fbdev@vger.kernel.org
Cc: <stable@vger.kernel.org> # v2.6.38+
---
 drivers/video/fbdev/vt8500lcdfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/vt8500lcdfb.c b/drivers/video/fbdev/vt8500lcdfb.c
index f744479dc7df..c61476247ba8 100644
--- a/drivers/video/fbdev/vt8500lcdfb.c
+++ b/drivers/video/fbdev/vt8500lcdfb.c
@@ -230,6 +230,7 @@ static int vt8500lcd_blank(int blank, struct fb_info *info)
 		    info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR)
 			for (i = 0; i < 256; i++)
 				vt8500lcd_setcolreg(i, 0, 0, 0, 0, info);
+		fallthrough;
 	case FB_BLANK_UNBLANK:
 		if (info->fix.visual == FB_VISUAL_PSEUDOCOLOR ||
 		    info->fix.visual == FB_VISUAL_STATIC_PSEUDOCOLOR)
-- 
2.20.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
