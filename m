Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E240440A33
	for <lists+dri-devel@lfdr.de>; Sat, 30 Oct 2021 18:29:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23EB089E65;
	Sat, 30 Oct 2021 16:29:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asav21.altibox.net (asav21.altibox.net [109.247.116.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE87C89E65
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Oct 2021 16:29:28 +0000 (UTC)
Received: from localhost.localdomain (211.81-166-168.customer.lyse.net
 [81.166.168.211])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: noralf.tronnes@ebnett.no)
 by asav21.altibox.net (Postfix) with ESMTPSA id 3C0E08009D;
 Sat, 30 Oct 2021 18:29:26 +0200 (CEST)
From: =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>
To: gregkh@linuxfoundation.org
Cc: linux-staging@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 stable@vger.kernel.org
Subject: [PATCH] staging/fbtft: Fix backlight
Date: Sat, 30 Oct 2021 18:29:01 +0200
Message-Id: <20211030162901.17918-1-noralf@tronnes.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=Dq54Bl3+ c=1 sm=1 tr=0
 a=OYZzhG0JTxDrWp/F2OJbnw==:117 a=OYZzhG0JTxDrWp/F2OJbnw==:17
 a=IkcTkHD0fZMA:10 a=M51BFTxLslgA:10 a=VwQbUJbxAAAA:8 a=SJz97ENfAAAA:8
 a=p9cCCTTYX0JvZlB5OkkA:9 a=QEXdDO2ut3YA:10 a=AjGcO6oz07-iQ99wixmX:22
 a=vFet0B0WnEQeilDPIY6i:22
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

Commit b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate") forgot to
update fbtft breaking its backlight support when FB_BACKLIGHT is a module.

Fix this by using IS_ENABLED().

Fixes: b4a1ed0cd18b ("fbdev: make FB_BACKLIGHT a tristate")
Cc: <stable@vger.kernel.org>
Signed-off-by: Noralf Trønnes <noralf@tronnes.org>
---
 drivers/staging/fbtft/fbtft-core.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index ed992ca605eb..ff979f1eeee8 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -128,7 +128,7 @@ static int fbtft_request_gpios(struct fbtft_par *par)
 	return 0;
 }
 
-#ifdef CONFIG_FB_BACKLIGHT
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 static int fbtft_backlight_update_status(struct backlight_device *bd)
 {
 	struct fbtft_par *par = bl_get_data(bd);
@@ -853,7 +853,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 		 fb_info->fix.smem_len >> 10, text1,
 		 HZ / fb_info->fbdefio->delay, text2);
 
-#ifdef CONFIG_FB_BACKLIGHT
+#if IS_ENABLED(CONFIG_FB_BACKLIGHT)
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
 		fb_info->bl_dev->props.power = FB_BLANK_UNBLANK;
-- 
2.33.0

