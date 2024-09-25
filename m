Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE215985AD5
	for <lists+dri-devel@lfdr.de>; Wed, 25 Sep 2024 14:15:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DD6F10E0A4;
	Wed, 25 Sep 2024 12:15:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="uhWWsFcN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from nyc.source.kernel.org (nyc.source.kernel.org [147.75.193.91])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CF010E0A4
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Sep 2024 12:15:03 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 7F1BBA4418B;
 Wed, 25 Sep 2024 12:14:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13CFDC4CECE;
 Wed, 25 Sep 2024 12:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1727266502;
 bh=2uVuhDZDMUIshitsnapNSlE48Yb+JPuyFmI2qexGfsU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uhWWsFcN07UFXP4OTAewh7tPPqosRE79kii5OCNSiGmFqTJHCRKuy8MwScIDyIbzh
 griEtU3Vbd+s4TFtst66pKtDtadaA8ZH2wveWuDinshUALd6wuYiTtDE7RDFcZlBab
 E3B6TQDuUHNh98N31LJ8btDMZCcJpwMiiplhyb3w8UeBQH8++0GL+UOSJV4mWS9KJl
 FdMkWSZZSPjINoS7sniAezch2r9BPiRP0sy0LWeXiOy1vic+GMiAbh9VZl/bENDG4Z
 U1we6a/Q0ETJDb+giSA32JbIE9DI4N+Tyy8SnPotVrDjl5roIwTUUQJa9cOe+kA3zu
 t2Uy/UT63EtOg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Kaixin Wang <kxwang23@m.fudan.edu.cn>, Helge Deller <deller@gmx.de>,
 Sasha Levin <sashal@kernel.org>, kuninori.morimoto.gx@renesas.com,
 laurent.pinchart@ideasonboard.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH AUTOSEL 6.6 075/139] fbdev: pxafb: Fix possible use after free
 in pxafb_task()
Date: Wed, 25 Sep 2024 08:08:15 -0400
Message-ID: <20240925121137.1307574-75-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240925121137.1307574-1-sashal@kernel.org>
References: <20240925121137.1307574-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.52
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

From: Kaixin Wang <kxwang23@m.fudan.edu.cn>

[ Upstream commit 4a6921095eb04a900e0000da83d9475eb958e61e ]

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
Signed-off-by: Helge Deller <deller@gmx.de>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/video/fbdev/pxafb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/fbdev/pxafb.c b/drivers/video/fbdev/pxafb.c
index fa943612c4e2b..3a2427eb29f23 100644
--- a/drivers/video/fbdev/pxafb.c
+++ b/drivers/video/fbdev/pxafb.c
@@ -2403,6 +2403,7 @@ static void pxafb_remove(struct platform_device *dev)
 	info = &fbi->fb;
 
 	pxafb_overlay_exit(fbi);
+	cancel_work_sync(&fbi->task);
 	unregister_framebuffer(info);
 
 	pxafb_disable_controller(fbi);
-- 
2.43.0

