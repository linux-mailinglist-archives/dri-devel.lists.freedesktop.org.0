Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC96E985265
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 07:29:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DC4610E2D0;
	Wed, 25 Sep 2024 05:29:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="WkKDmf+i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 96A3410E2D0
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 05:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
 Content-Type; bh=aqkoSnEgaj9DVcjWERksyIfsDRhiR+luevjNipHPwIo=;
 b=WkKDmf+iFDYdvla8K6TRmY4PJxkiiKAgpydWfGjqsQvAclMl9q0/MehBHbG608
 8NVPjwLY+uwMzyoZgCep4glrcOlK+X94WxQosk9jbvB563JaYLZaAv6zBMb8Drjk
 dDLRg1pJoNAlchuKGPFMWbmC1XzGsfvk/TubUu9WUKEgs=
Received: from localhost (unknown [60.168.209.67])
 by gzsmtp2 (Coremail) with SMTP id sSgvCgAXg_7An_NmfUNVAA--.16028S2;
 Wed, 25 Sep 2024 13:29:37 +0800 (CST)
Date: Wed, 25 Sep 2024 13:29:36 +0800
From: Qianqiang Liu <qianqiang.liu@163.com>
To: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Subject: [PATCH v3] fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
Message-ID: <ZvOfwLvWdNHiU4g8@thinkpad>
References: <20240916011027.303875-1-qianqiang.liu@163.com>
 <a57734e8-ffb9-4af1-be02-eb0c99507048@gmx.de>
 <ZvLlEpIMQnJcJsla@thinkpad>
 <1b1a2d3c-ed4a-4d9b-b87a-8d05f3d6592e@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b1a2d3c-ed4a-4d9b-b87a-8d05f3d6592e@gmx.de>
X-CM-TRANSID: sSgvCgAXg_7An_NmfUNVAA--.16028S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7AF17Jw4xJw1xJryDur1ftFb_yoW8uFykpF
 W5tFWaqrZ8try3Z34jgr4xZr1rXas8ArWUWayFqa4fZFnFvF18WFyIgryUCrWru3W0kryx
 KF1jy3y2kas3WaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jEdgAUUUUU=
X-Originating-IP: [60.168.209.67]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLxtlambzkrb51AAAsn
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
---
 Changes since v2:
 - Document the commit message in more detail
---
 Changes since v1:
 - Initialize ops->putcs by calling set_blitting_type()
---
 drivers/video/fbdev/core/fbcon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 2e093535884b..d9abae2516d8 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -861,6 +861,8 @@ static int set_con2fb_map(int unit, int newidx, int user)
 			return err;
 
 		fbcon_add_cursor_work(info);
+	} else if (vc) {
+		set_blitting_type(vc, info);
 	}
 
 	con2fb_map[unit] = newidx;
-- 
2.34.1

