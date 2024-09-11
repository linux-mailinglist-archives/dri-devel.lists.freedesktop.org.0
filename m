Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B5E5975C20
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 22:58:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10EE410EAA8;
	Wed, 11 Sep 2024 20:58:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.209.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83AED10E07D
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 14:30:36 +0000 (UTC)
X-QQ-mid: bizesmtpsz2t1726064993t5ok0ar
X-QQ-Originating-IP: P6ukSmdqm9PfLsf7wEuHBvtMtOeR6xq2pUfo5KSx/GY=
Received: from fastnlp.. ( [202.120.234.41]) by bizesmtp.qq.com (ESMTP) with 
 id ; Wed, 11 Sep 2024 22:29:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3987430628644740193
From: Kaixin Wang <kxwang23@m.fudan.edu.cn>
To: deller@gmx.de
Cc: 21210240012@m.fudan.edu.cn, 21302010073@m.fudan.edu.cn,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kuninori.morimoto.gx@renesas.com,
 laurent.pinchart@ideasonboard.com, Kaixin Wang <kxwang23@m.fudan.edu.cn>
Subject: [PATCH] fbdev: pxafb: Fix use after free vulnerability in
 pxafb_driver Driver Due to Race Condition
Date: Wed, 11 Sep 2024 22:29:52 +0800
Message-Id: <20240911142952.833223-1-kxwang23@m.fudan.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtpsz:m.fudan.edu.cn:qybglogicsvrsz:qybglogicsvrsz4a-0
X-Mailman-Approved-At: Wed, 11 Sep 2024 20:58:09 +0000
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

In the pxafb_probe function, it calls the pxafb_init_fbinfo function,
after which &fbi->task is associated with pxafb_task. Moreover,
within this pxafb_init_fbinfo function, the pxafb_blank function
within the &pxafb_ops struct is capable of scheduling work.

If we remove the module which will call pxafb_remove to make cleanup,
it will call unregister_framebuffer function which can call
do_unregister_framebuffer to free fbi->fb through
put_fb_info(fb_info), while the work mentioned above will be used.
The sequence of operations that may lead to a UAF bug is as follows:

CPU0                                                CPU1

                                   | pxafb_task
pxafb_remove                       |
unregister_framebuffer(info)       |
do_unregister_framebuffer(fb_info) |
put_fb_info(fb_info)               |
// free fbi->fb                    | set_ctrlr_state(fbi, state)
                                   | __pxafb_lcd_power(fbi, 0)
                                   | fbi->lcd_power(on, &fbi->fb.var)
                                   | //use fbi->fb

Fix it by ensuring that the work is canceled before proceeding
with the cleanup in pxafb_remove.

Note that only root user can remove the driver at runtime.

Signed-off-by: Kaixin Wang <kxwang23@m.fudan.edu.cn>
---
 drivers/video/fbdev/pxafb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index 2ef56fa28aff..5ce02495cda6 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2403,6 +2403,7 @@ static void pxafb_remove(struct platform_device *dev)
 	info = &fbi->fb;
 
 	pxafb_overlay_exit(fbi);
+	cancel_work_sync(&fbi->task);
 	unregister_framebuffer(info);
 
 	pxafb_disable_controller(fbi);
-- 
2.25.1

