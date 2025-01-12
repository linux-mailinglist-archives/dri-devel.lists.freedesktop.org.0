Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27233A0AAA1
	for <lists+dri-devel@lfdr.de>; Sun, 12 Jan 2025 16:51:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4482910E30A;
	Sun, 12 Jan 2025 15:51:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="rY6/ptgk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 513 seconds by postgrey-1.36 at gabe;
 Sun, 12 Jan 2025 15:51:00 UTC
Received: from out-186.mta1.migadu.com (out-186.mta1.migadu.com
 [IPv6:2001:41d0:203:375::ba])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2014210E071
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Jan 2025 15:51:00 +0000 (UTC)
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1736696545;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=pLJBq80SdnMHTfQrSgK/oG85nH0qobc5d0GX5tMG/S8=;
 b=rY6/ptgkaF3YeEPADiOCLLrjl1tdTECV7k0aDUy27InFHYjCNZIMxPq6tJDXpr7GwtjpCm
 7+W0BMHfCDx/f2orakpm2KeBeby67ZgHudgzP1w0mq95TzWaCGljqRz0le80MMnsQqlZs4
 3MRi0jhqeH2gxnq9ocLZ3oRmfr8rrpY=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Helge Deller <deller@gmx.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: Use str_enabled_disabled() helper in sm501fb_init_fb()
Date: Sun, 12 Jan 2025 16:41:42 +0100
Message-ID: <20250112154145.126901-2-thorsten.blum@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Remove hard-coded strings by using the str_enabled_disabled() helper
function.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 drivers/video/fbdev/sm501fb.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/sm501fb.c b/drivers/video/fbdev/sm501fb.c
index 86ecbb2d86db..7734377b2d87 100644
--- a/drivers/video/fbdev/sm501fb.c
+++ b/drivers/video/fbdev/sm501fb.c
@@ -27,6 +27,7 @@
 #include <linux/clk.h>
 #include <linux/console.h>
 #include <linux/io.h>
+#include <linux/string_choices.h>
 
 #include <linux/uaccess.h>
 #include <asm/div64.h>
@@ -1712,8 +1713,8 @@ static int sm501fb_init_fb(struct fb_info *fb, enum sm501_controller head,
 		BUG();
 	}
 
-	dev_info(info->dev, "fb %s %sabled at start\n",
-		 fbname, enable ? "en" : "dis");
+	dev_info(info->dev, "fb %s %s at start\n",
+		 fbname, str_enabled_disabled(enable));
 
 	/* check to see if our routing allows this */
 
-- 
2.47.1

