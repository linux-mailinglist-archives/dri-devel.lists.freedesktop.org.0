Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD84938169C
	for <lists+dri-devel@lfdr.de>; Sat, 15 May 2021 09:44:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A76F46E1A5;
	Sat, 15 May 2021 07:44:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 678D56E1A5
 for <dri-devel@lists.freedesktop.org>; Sat, 15 May 2021 07:44:17 +0000 (UTC)
Received: from fsav103.sakura.ne.jp (fsav103.sakura.ne.jp [27.133.134.230])
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 14F7hrbI073640;
 Sat, 15 May 2021 16:43:53 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav103.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp);
 Sat, 15 May 2021 16:43:53 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav103.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
 (authenticated bits=0)
 by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 14F7hrbK073637
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
 Sat, 15 May 2021 16:43:53 +0900 (JST)
 (envelope-from penguin-kernel@i-love.sakura.ne.jp)
Subject: [PATCH v2] tty: vt: always invoke vc->vc_sw->con_resize callback
To: Linus Torvalds <torvalds@linux-foundation.org>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>
References: <0000000000006bbd0c05c14f1b09@google.com>
 <6e21483c-06f6-404b-4018-e00ee85c456c@i-love.sakura.ne.jp>
 <87d928e4-b2b9-ad30-f3f0-1dfb8e4e03ed@i-love.sakura.ne.jp>
 <05acdda8-dc1c-5119-4326-96eed24bea0c@i-love.sakura.ne.jp>
 <CAHk-=wguwhFpjhyMtDaH2hhjoV62gDgByC=aPyTrW9CkM5hqvA@mail.gmail.com>
 <alpine.DEB.2.21.2105142150460.3032@angie.orcam.me.uk>
 <CAHk-=wioOHwKNj8AmvXWV-oL60ae0jKswAHy9e6wCYYeA5EQXg@mail.gmail.com>
 <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Message-ID: <97f1d292-c3a8-f4d6-0651-b4f5571ecb72@i-love.sakura.ne.jp>
Date: Sat, 15 May 2021 16:43:49 +0900
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <CAHk-=wjkVAjfWrmmJnJe1_MriK9gezWCew_MU=MbQNzHbGopsQ@mail.gmail.com>
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
Cc: Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 syzkaller-bugs <syzkaller-bugs@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Colin King <colin.king@canonical.com>, Jiri Slaby <jirislaby@kernel.org>,
 syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 2021/05/15 1:19, Tetsuo Handa wrote:
> Even if it turns out to be safe to always call this
> callback, we will need to involve another callback via "struct fb_ops" for
> checking the upper limits from fbcon_resize(). As a result, we will need
> to modify
> 
>  drivers/tty/vt/vt.c
>  drivers/video/fbdev/core/fbcon.c
>  drivers/video/fbdev/vga16fb.c
>  include/linux/fb.h
> 
> files only for checking rows/columns values passed to ioctl(VT_RESIZE)
> request.

I was by error assuming that fbcon_resize() cannot reject bogus rows/columns
and thus we need to add another callback via "struct fb_ops" for that purpose.
But fbcon_resize() does reject bogus rows/columns; it was simply because
resize_screen() did not call fbcon_resize() if vc->vc_mode == KD_GRAPHICS.
Thus, removing vc->vc_mode check alone is sufficient.

On 2021/05/15 6:10, Linus Torvalds wrote:
> So I think just removing the "vc->vc_mode != KD_GRAPHICS" test from
> resize_screen() might be the way to go. That way, the low-level data
> structures actually are in sync with the resize, and the "out of
> bounds" bug should never happen.
> 
> Would you mind testing that?

OK. Your suggested changes passed the test by me and by syzbot.



From e5e326c90c5b919c6aba30072d665a00b18715a5 Mon Sep 17 00:00:00 2001
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Sat, 15 May 2021 03:00:37 +0000
Subject: [PATCH v2] tty: vt: always invoke vc->vc_sw->con_resize callback

syzbot is reporting OOB write at vga16fb_imageblit() [1], for
resize_screen() from ioctl(VT_RESIZE) returns 0 without checking whether
requested rows/columns fit the amount of memory reserved for the graphical
screen if current mode is KD_GRAPHICS.

----------
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <sys/ioctl.h>
#include <linux/kd.h>
#include <linux/vt.h>

int main(int argc, char *argv[])
{
        const int fd = open("/dev/char/4:1", O_RDWR);
        struct vt_sizes vt = { 0x4100, 2 };

        ioctl(fd, KDSETMODE, KD_GRAPHICS);
        ioctl(fd, VT_RESIZE, &vt);
        ioctl(fd, KDSETMODE, KD_TEXT);
        return 0;
}
----------

Allow framebuffer drivers to return -EINVAL, by moving
vc->vc_mode != KD_GRAPHICS check from resize_screen() to fbcon_resize().

[1] https://syzkaller.appspot.com/bug?extid=1f29e126cf461c4de3b3

Reported-by: syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
Suggested-by: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Tested-by: syzbot <syzbot+1f29e126cf461c4de3b3@syzkaller.appspotmail.com>
---
 drivers/tty/vt/vt.c              | 2 +-
 drivers/video/fbdev/core/fbcon.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/vt/vt.c b/drivers/tty/vt/vt.c
index 01645e87b3d5..fa1548d4f94b 100644
--- a/drivers/tty/vt/vt.c
+++ b/drivers/tty/vt/vt.c
@@ -1171,7 +1171,7 @@ static inline int resize_screen(struct vc_data *vc, int width, int height,
 	/* Resizes the resolution of the display adapater */
 	int err = 0;
 
-	if (vc->vc_mode != KD_GRAPHICS && vc->vc_sw->con_resize)
+	if (vc->vc_sw->con_resize)
 		err = vc->vc_sw->con_resize(vc, width, height, user);
 
 	return err;
diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3406067985b1..22bb3892f6bd 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -2019,7 +2019,7 @@ static int fbcon_resize(struct vc_data *vc, unsigned int width,
 			return -EINVAL;
 
 		pr_debug("resize now %ix%i\n", var.xres, var.yres);
-		if (con_is_visible(vc)) {
+		if (con_is_visible(vc) && vc->vc_mode == KD_TEXT) {
 			var.activate = FB_ACTIVATE_NOW |
 				FB_ACTIVATE_FORCE;
 			fb_set_var(info, &var);
-- 
2.25.1

