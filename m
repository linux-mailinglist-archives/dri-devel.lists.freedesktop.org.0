Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16329990B38
	for <lists+dri-devel@lfdr.de>; Fri,  4 Oct 2024 20:24:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B51A10EA69;
	Fri,  4 Oct 2024 18:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="VRo4FzdX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFAA010EA6E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Oct 2024 18:24:27 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 3F0EEA44CBA;
 Fri,  4 Oct 2024 18:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1766C4CECC;
 Fri,  4 Oct 2024 18:24:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728066266;
 bh=oEFSlR58nDMd09E94PgA9CUZgL5fRNeq8lC+AEKU7cw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VRo4FzdXXJZ64P0ggjIPH7QA3c5s2lqr0R15J+g75kXEuuXTTDflx96VwxnUVc19o
 ZH+idfo5UasKQBi6p5nkoyGradCfp3265sYMfEwpU/V0f7Fn48yhkEqLiq/g/FEfF+
 eJb2LnU3++fR5ae9dWaSdQtKLoPAfU5/nAdoU+eJAowI7jA/Qvozija/oDlTIg+bDM
 nybkckZBGw5bFB+maAmtlmq/z8Rmnhvws3IObSwWgHRFzWoG1sAae+09GVT8uihAr9
 eR9gDJclTQ20SWx/ljySc3B4SgQzD9Ug3KJ6GJeJU/zUz12rIzkNPeqpRtCZTP0EiC
 YG22lhMbDOlgw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Qianqiang Liu <qianqiang.liu@163.com>,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com,
 Helge Deller <deller@gmx.de>, Sasha Levin <sashal@kernel.org>,
 daniel@ffwll.ch, jirislaby@kernel.org, gregkh@linuxfoundation.org,
 geert+renesas@glider.be, tzimmermann@suse.de, samuel.thibault@ens-lyon.org,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.10 68/70] fbcon: Fix a NULL pointer dereference
 issue in fbcon_putcs
Date: Fri,  4 Oct 2024 14:21:06 -0400
Message-ID: <20241004182200.3670903-68-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004182200.3670903-1-sashal@kernel.org>
References: <20241004182200.3670903-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.10.13
Content-Transfer-Encoding: 8bit
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

From: Qianqiang Liu <qianqiang.liu@163.com>

[ Upstream commit 5b97eebcce1b4f3f07a71f635d6aa3af96c236e7 ]

syzbot has found a NULL pointer dereference bug in fbcon.
Here is the simplified C reproducer:

struct param {
	uint8_t type;
	struct tiocl_selection ts;
};

int main()
{
	struct fb_con2fbmap con2fb;
	struct param param;

	int fd = open("/dev/fb1", 0, 0);

	con2fb.console = 0x19;
	con2fb.framebuffer = 0;
	ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);

	param.type = 2;
	param.ts.xs = 0; param.ts.ys = 0;
	param.ts.xe = 0; param.ts.ye = 0;
	param.ts.sel_mode = 0;

	int fd1 = open("/dev/tty1", O_RDWR, 0);
	ioctl(fd1, TIOCLINUX, &param);

	con2fb.console = 1;
	con2fb.framebuffer = 0;
	ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb);

	return 0;
}

After calling ioctl(fd1, TIOCLINUX, &param), the subsequent ioctl(fd, FBIOPUT_CON2FBMAP, &con2fb)
causes the kernel to follow a different execution path:

 set_con2fb_map
  -> con2fb_init_display
   -> fbcon_set_disp
    -> redraw_screen
     -> hide_cursor
      -> clear_selection
       -> highlight
        -> invert_screen
         -> do_update_region
          -> fbcon_putcs
           -> ops->putcs

Since ops->putcs is a NULL pointer, this leads to a kernel panic.
To prevent this, we need to call set_blitting_type() within set_con2fb_map()
to properly initialize ops->putcs.

Reported-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3d613ae53c031502687a
Tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/core/fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3f7333dca508c..fedd796c9a5cd 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -847,6 +847,8 @@ static int set_con2fb_map(int unit, int newidx, int user)
 			return err;
 
 		fbcon_add_cursor_work(info);
+	} else if (vc) {
+		set_blitting_type(vc, info);
 	}
 
 	con2fb_map[unit] = newidx;
-- 
2.43.0

