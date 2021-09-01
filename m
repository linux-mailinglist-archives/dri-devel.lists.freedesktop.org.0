Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 669463FD09E
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 03:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31B46E105;
	Wed,  1 Sep 2021 01:15:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4B566E105
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 01:15:18 +0000 (UTC)
Received: from fsav415.sakura.ne.jp (fsav415.sakura.ne.jp [133.242.250.114])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 1811ElQO061022;
 Wed, 1 Sep 2021 10:14:47 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav415.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp);
 Wed, 01 Sep 2021 10:14:47 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav415.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 1811EkXj061015
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Wed, 1 Sep 2021 10:14:46 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH v2] fbmem: don't allow too huge resolutions
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Geert Uytterhoeven <geert@linux-m68k.org>
Cc: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Colin King <colin.king@canonical.com>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Masahiro Yamada <masahiroy@kernel.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Randy Dunlap <rdunlap@infradead.org>
References: <000000000000815b9605c70e74f8@google.com>
 <131b24e5-ee31-6f7b-42b4-c34583711913@infradead.org>
 <2fccb5d3-191c-924e-159f-1c9d423e282f@i-love.sakura.ne.jp>
 <339bfb21-8e80-c7d9-46dd-c416f87c50c0@infradead.org>
 <535e404d-03bf-8e7a-b296-132a2a98c599@i-love.sakura.ne.jp>
 <CAMuHMdWX7s63X_zR9329canbQkPGBVxZNG4O+_=jUut60aGR9g@mail.gmail.com>
 <5c6d2b95-31d7-0d59-5e62-2593d9a0e1fe@i-love.sakura.ne.jp>
 <CAMuHMdWbSUGRGAVi-17C3hyDBZnGLAsmbAs+wXPHiCNWWLbMpA@mail.gmail.com>
 <CAKMK7uF1cnen2UVWeOL164z1CCqOuRMC5SmM+5GvRvi7C-UOTw@mail.gmail.com>
 <CAMuHMdWNYaZxZB0Td4PFb76rrtQMumKu6cJgLi2aNnW-9NmG8A@mail.gmail.com>
 <CAKMK7uHuOQWUnsiH00QFbHKgTdjjryK0ra9We2stojXMiAVgJA@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <750ed1ae-de80-b232-4aea-79d60c212fab@i-love.sakura.ne.jp>
Date: Wed, 1 Sep 2021 10:14:43 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAKMK7uHuOQWUnsiH00QFbHKgTdjjryK0ra9We2stojXMiAVgJA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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

syzbot is reporting page fault at vga16fb_fillrect() [1], for
vga16fb_check_var() is failing to detect multiplication overflow.

  if (vxres * vyres > maxmem) {
    vyres = maxmem / vxres;
    if (vyres < yres)
      return -ENOMEM;
  }

Since no module would accept too huge resolutions where multiplication
overflow happens, let's reject in the common path.

Link: https://syzkaller.appspot.com/bug?extid=04168c8063cfdde1db5e [1]
Reported-by: syzbot <syzbot+04168c8063cfdde1db5e@syzkaller.appspotmail.com>
Debugged-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
Changes in v2:
  Use check_mul_overflow(), suggested by Geert Uytterhoeven <geert@linux-m68k.org>.

 drivers/video/fbdev/core/fbmem.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 1c855145711b..53d23b3d010c 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -962,6 +962,7 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	struct fb_var_screeninfo old_var;
 	struct fb_videomode mode;
 	struct fb_event event;
+	u32 unused;
 
 	if (var->activate & FB_ACTIVATE_INV_MODE) {
 		struct fb_videomode mode1, mode2;
@@ -1008,6 +1009,11 @@ fb_set_var(struct fb_info *info, struct fb_var_screeninfo *var)
 	if (var->xres < 8 || var->yres < 8)
 		return -EINVAL;
 
+	/* Too huge resolution causes multiplication overflow. */
+	if (check_mul_overflow(var->xres, var->yres, &unused) ||
+	    check_mul_overflow(var->xres_virtual, var->yres_virtual, &unused))
+		return -EINVAL;
+
 	ret = info->fbops->fb_check_var(var, info);
 
 	if (ret)
-- 
2.25.1


