Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A476F1B6731
	for <lists+dri-devel@lfdr.de>; Fri, 24 Apr 2020 00:52:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E400A6EA57;
	Thu, 23 Apr 2020 22:52:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C5E86E932
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 16:42:57 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id o10so3155929pgb.6
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Apr 2020 09:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g0Ejxu1wuqWuETn/IJMRXxxZQ/rRlbjvuR8vLOOTtDU=;
 b=IJAabNre2tTWjnak57Stl3OhpAV/rvj4wnWO1M3yc6RjzjaIAv2BTTo9M3W4aTmQK2
 1nkfWVe8viMZQMVqM7Ggb5rElkaK6nVmUpmsfxpeUgK85pfnIA+DfPWB+q/rqK80Chqq
 WcJwZttjVCByfGO7lkWczHDFKgIW1Bwk1huREmPw5O4MxEV0jgx/LXdiG18OFARjhrDT
 YsPHtvJKMfnHdGqF+CRSEBr+J2T3NTDSlyBxabUTTJE/+LC++HQrs1RLA8mYBOgcg4Q/
 3vZGSZ7EqishFfz+8E2CZtBRw2Xl7PtKJ7ZjEFKvpE4cZNEkdttNfVYAv19ydSCyCiDi
 iqLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g0Ejxu1wuqWuETn/IJMRXxxZQ/rRlbjvuR8vLOOTtDU=;
 b=VvrTRt/BLsJNGRhqCJZ3sgxwvlJtnaz4iXOHot7Mh1a88Op7l8hOiEb5zrCLsqClsJ
 xfeB2SfKpca9Bm/F6IMXdE5WTX0+2a/lnycbbzCJbJJiKmJxb/REbdy4az/gZVirxIGg
 nP/FokLh38RvGaYcqeI+QmWqvP84rlG5VTmFPrEtZmhxVt4VSNLX1Rp71HsdI+q6b/E4
 +rvIGZlV7R+FDkfpkeFl1iVjJni/7CKU1wqscDG7fNodDmsWHFI/6U2ST/Y4c4ezqOX0
 YTna2u77JJMEKK6Zc//eFIRHYhZKsmag66Byzw7tRLDZE5acbj+IYarMP0wBItd4ecfZ
 uvxA==
X-Gm-Message-State: AGi0Pubx2bdoHL3BE48JYxIm96u0RNuff9v2seutO8ph2+1UxP+oR7zf
 jBM0GLokAPHcE5kocr55030=
X-Google-Smtp-Source: APiQypJw9QQfdKz9HG3qn61Gqz1NLw3POTwQWawknqDpJnDaZVNpc7d2bP1j2+rbgCm0QcU3qf+5fQ==
X-Received: by 2002:a63:e607:: with SMTP id g7mr4676487pgh.303.1587660176929; 
 Thu, 23 Apr 2020 09:42:56 -0700 (PDT)
Received: from localhost (176.122.158.71.16clouds.com. [176.122.158.71])
 by smtp.gmail.com with ESMTPSA id p24sm3061668pff.92.2020.04.23.09.42.55
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Thu, 23 Apr 2020 09:42:56 -0700 (PDT)
From: Dejin Zheng <zhengdejin5@gmail.com>
To: b.zolnierkie@samsung.com, gregkh@linuxfoundation.org, tglx@linutronix.de,
 akpm@osdl.org, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: [PATCH v3] console: newport_con: fix an issue about leak related
 system resources
Date: Fri, 24 Apr 2020 00:42:51 +0800
Message-Id: <20200423164251.3349-1-zhengdejin5@gmail.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 23 Apr 2020 22:50:35 +0000
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
Cc: Dejin Zheng <zhengdejin5@gmail.com>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

A call of the function do_take_over_console() can fail here.
The corresponding system resources were not released then.
Thus add a call of iounmap() and release_mem_region()
together with the check of a failure predicate. and also
add release_mem_region() on device removal.

Fixes: e86bb8acc0fdc ("[PATCH] VT binding: Make newport_con support binding")
Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
Suggested-by: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Signed-off-by: Dejin Zheng <zhengdejin5@gmail.com>
---
v2 -> v3:
	- modify commit tag CC to Cc by Andy's suggestion.
	- modify Subject 'console: console:' to 'console: newport_con:'
	  by Bartlomiej's suggestion.
	- add missing release_mem_region() on error and on device removal
	  by Bartlomiej's suggestion.
	- add correct fixes commit, before this patch, add a wrong 'Fixes:
	  e84de0c6190503 ("MIPS: GIO bus support for SGI IP22/28")'
	  thanks Bartlomiej again!

v1 -> v2:
	- modify the commit comments. The commit comments have some more
	  appropriate instructions by Markus'suggestion. here is my first
	  version commit comments:

	  if do_take_over_console() return an error in the newport_probe(),
	  due to the io virtual address is not released, it will cause a
	  leak.
	 
 drivers/video/console/newport_con.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/video/console/newport_con.c b/drivers/video/console/newport_con.c
index 00dddf6e08b0..2d2ee17052e8 100644
--- a/drivers/video/console/newport_con.c
+++ b/drivers/video/console/newport_con.c
@@ -32,6 +32,8 @@
 #include <linux/linux_logo.h>
 #include <linux/font.h>
 
+#define NEWPORT_LEN	0x10000
+
 #define FONT_DATA ((unsigned char *)font_vga_8x16.data)
 
 /* borrowed from fbcon.c */
@@ -43,6 +45,7 @@
 static unsigned char *font_data[MAX_NR_CONSOLES];
 
 static struct newport_regs *npregs;
+static unsigned long newport_addr;
 
 static int logo_active;
 static int topscan;
@@ -702,7 +705,6 @@ const struct consw newport_con = {
 static int newport_probe(struct gio_device *dev,
 			 const struct gio_device_id *id)
 {
-	unsigned long newport_addr;
 	int err;
 
 	if (!dev->resource.start)
@@ -712,7 +714,7 @@ static int newport_probe(struct gio_device *dev,
 		return -EBUSY; /* we only support one Newport as console */
 
 	newport_addr = dev->resource.start + 0xF0000;
-	if (!request_mem_region(newport_addr, 0x10000, "Newport"))
+	if (!request_mem_region(newport_addr, NEWPORT_LEN, "Newport"))
 		return -ENODEV;
 
 	npregs = (struct newport_regs *)/* ioremap cannot fail */
@@ -720,6 +722,11 @@ static int newport_probe(struct gio_device *dev,
 	console_lock();
 	err = do_take_over_console(&newport_con, 0, MAX_NR_CONSOLES - 1, 1);
 	console_unlock();
+
+	if (err) {
+		iounmap((void *)npregs);
+		release_mem_region(newport_addr, NEWPORT_LEN);
+	}
 	return err;
 }
 
@@ -727,6 +734,7 @@ static void newport_remove(struct gio_device *dev)
 {
 	give_up_console(&newport_con);
 	iounmap((void *)npregs);
+	release_mem_region(newport_addr, NEWPORT_LEN);
 }
 
 static struct gio_device_id newport_ids[] = {
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
