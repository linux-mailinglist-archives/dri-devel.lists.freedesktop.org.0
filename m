Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35029323C34
	for <lists+dri-devel@lfdr.de>; Wed, 24 Feb 2021 13:52:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E3216EA9C;
	Wed, 24 Feb 2021 12:52:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 013626EA9C
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Feb 2021 12:52:39 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id C5C1064F0B;
 Wed, 24 Feb 2021 12:52:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614171159;
 bh=MujD0LlhJccQMLu8B5pHIBrjM6vOnk8ruXzVCvlOZLc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qPbcDNOvD0Fl82zcgbO4kx1eiv5rxTxwmkQM4Gz2to/TUs+w0A3nm7UjU82r2xe0E
 UXX53h8nsBIvZtsAvUcXmtn+yjxbZ6KNcggHLQWPIjbZ8Fe0GBK4r9nuF2INGp8Q/M
 ZWKm2Zjmnnhz9pjgmlrJbWE/EvaG1i2lYeazdFt7y9MtARlpElIDuf8739GdTxjTXf
 wO/1/FzYoY7EqT61EdAna68N+it5o+xC3szoKpG4HW13SEh7sKqyzP0QCmuH8srxYt
 TQmSEj61U8Z9JvfX/qmlHdP4QliqI93xd4Kxu2KW+v8gj0nwW/HHHeQbvFxG/gsX+B
 4jHVJEAE3EMjg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 20/56] udlfb: Fix memory leak in dlfb_usb_probe
Date: Wed, 24 Feb 2021 07:51:36 -0500
Message-Id: <20210224125212.482485-20-sashal@kernel.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210224125212.482485-1-sashal@kernel.org>
References: <20210224125212.482485-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
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
Cc: Sasha Levin <sashal@kernel.org>, linux-fbdev@vger.kernel.org,
 syzbot+c9e365d7f450e8aa615d@syzkaller.appspotmail.com,
 dri-devel@lists.freedesktop.org, Zqiang <qiang.zhang@windriver.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zqiang <qiang.zhang@windriver.com>

[ Upstream commit 5c0e4110f751934e748a66887c61f8e73805f0f9 ]

The dlfb_alloc_urb_list function is called in dlfb_usb_probe function,
after that if an error occurs, the dlfb_free_urb_list function need to
be called.

BUG: memory leak
unreferenced object 0xffff88810adde100 (size 32):
  comm "kworker/1:0", pid 17, jiffies 4294947788 (age 19.520s)
  hex dump (first 32 bytes):
    10 30 c3 0d 81 88 ff ff c0 fa 63 12 81 88 ff ff  .0........c.....
    00 30 c3 0d 81 88 ff ff 80 d1 3a 08 81 88 ff ff  .0........:.....
  backtrace:
    [<0000000019512953>] kmalloc include/linux/slab.h:552 [inline]
    [<0000000019512953>] kzalloc include/linux/slab.h:664 [inline]
    [<0000000019512953>] dlfb_alloc_urb_list drivers/video/fbdev/udlfb.c:1892 [inline]
    [<0000000019512953>] dlfb_usb_probe.cold+0x289/0x988 drivers/video/fbdev/udlfb.c:1704
    [<0000000072160152>] usb_probe_interface+0x177/0x370 drivers/usb/core/driver.c:396
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431
    [<00000000463fbcb4>] __device_attach+0x122/0x250 drivers/base/dd.c:912
    [<00000000b881a711>] bus_probe_device+0xc6/0xe0 drivers/base/bus.c:491
    [<00000000364bbda5>] device_add+0x5ac/0xc30 drivers/base/core.c:2936
    [<00000000eecca418>] usb_set_configuration+0x9de/0xb90 drivers/usb/core/message.c:2159
    [<00000000edfeca2d>] usb_generic_driver_probe+0x8c/0xc0 drivers/usb/core/generic.c:238
    [<000000001830872b>] usb_probe_device+0x5c/0x140 drivers/usb/core/driver.c:293
    [<00000000a8d6726f>] really_probe+0x159/0x480 drivers/base/dd.c:554
    [<00000000c3ce4b0e>] driver_probe_device+0x84/0x100 drivers/base/dd.c:738
    [<00000000e942e01c>] __device_attach_driver+0xee/0x110 drivers/base/dd.c:844
    [<00000000de0a5a5c>] bus_for_each_drv+0xb7/0x100 drivers/base/bus.c:431

Reported-by: syzbot+c9e365d7f450e8aa615d@syzkaller.appspotmail.com
Signed-off-by: Zqiang <qiang.zhang@windriver.com>
Signed-off-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Link: https://patchwork.freedesktop.org/patch/msgid/20201215063022.16746-1-qiang.zhang@windriver.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/udlfb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/udlfb.c b/drivers/video/fbdev/udlfb.c
index f9b3c1cb9530f..b9cdd02c10009 100644
--- a/drivers/video/fbdev/udlfb.c
+++ b/drivers/video/fbdev/udlfb.c
@@ -1017,6 +1017,7 @@ static void dlfb_ops_destroy(struct fb_info *info)
 	}
 	vfree(dlfb->backing_buffer);
 	kfree(dlfb->edid);
+	dlfb_free_urb_list(dlfb);
 	usb_put_dev(dlfb->udev);
 	kfree(dlfb);
 
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
