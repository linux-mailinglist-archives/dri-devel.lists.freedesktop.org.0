Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CE591577B
	for <lists+dri-devel@lfdr.de>; Mon, 24 Jun 2024 21:59:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C2AAE10E571;
	Mon, 24 Jun 2024 19:59:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=wanadoo.fr header.i=@wanadoo.fr header.b="aqhg+JBN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp.smtpout.orange.fr (smtp-25.smtpout.orange.fr
 [80.12.242.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C88710E571
 for <dri-devel@lists.freedesktop.org>; Mon, 24 Jun 2024 19:59:48 +0000 (UTC)
Received: from fedora.home ([86.243.222.230]) by smtp.orange.fr with ESMTPA
 id Lpqrsf3K7qnVgLpqrsXGhT; Mon, 24 Jun 2024 21:59:46 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
 s=t20230301; t=1719259186;
 bh=PKvXmWL5ia+tMLrsPCdtaw8yQlKmPVzcIZ50EnxNumY=;
 h=From:To:Subject:Date:Message-ID:MIME-Version;
 b=aqhg+JBNDULyFJdYyzAawWk2UelUDJ7vZGWcpuDed6f1j963n0r7rQGpxDOc0LNuJ
 x0kQoBY+wTeKvUkka2MrNEKIX4sRKiMdhnLL+4YhyQMgduhDZgD7+5Xjrie5kO0TuX
 zHn41oG70Ybt0Aev6DzSLEsisnJ1KTkuyb32VplrZkyZvKHdFK1OeaqOvjrLsB+B6K
 0LgOjHSyE45ZLum68oKQtxu+5QN7jb2NLlH00Gml6LW3MqcMUbetckwGd6HJy0afQa
 yRHkQyunEGbdyuGXr4WzyxKmp3xsixlNpr+TyKxs5LxpHS6CTWZKKaL8mevX/vDqAS
 g+3HZ35IODryA==
X-ME-Helo: fedora.home
X-ME-Auth: Y2hyaXN0b3BoZS5qYWlsbGV0QHdhbmFkb28uZnI=
X-ME-Date: Mon, 24 Jun 2024 21:59:46 +0200
X-ME-IP: 86.243.222.230
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
To: Helge Deller <deller@gmx.de>
Cc: linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org,
 Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH] fbdev: mmp: Constify struct mmp_overlay_ops
Date: Mon, 24 Jun 2024 21:59:42 +0200
Message-ID: <c5c1a26fdbf0895d1b17010f1c2da44b18b4ae55.1719259171.git.christophe.jaillet@wanadoo.fr>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
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

'struct mmp_overlay_ops' is not modified in this driver.

Constifying this structure moves some data to a read-only section, so
increase overall security.

On a x86_64, with allmodconfig, as an example:
Before:
======
   text	   data	    bss	    dec	    hex	filename
  11798	    555	     16	  12369	   3051	drivers/video/fbdev/mmp/hw/mmp_ctrl.o

After:
=====
   text	   data	    bss	    dec	    hex	filename
  11834	    507	     16	  12357	   3045	drivers/video/fbdev/mmp/hw/mmp_ctrl.o

Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
---
Compile tested-only
---
 drivers/video/fbdev/mmp/hw/mmp_ctrl.c | 2 +-
 include/video/mmp_disp.h              | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
index 76b50b6c98ad..a20a2c408127 100644
--- a/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
+++ b/drivers/video/fbdev/mmp/hw/mmp_ctrl.c
@@ -313,7 +313,7 @@ static void path_set_mode(struct mmp_path *path, struct mmp_mode *mode)
 	mutex_unlock(&path->access_ok);
 }
 
-static struct mmp_overlay_ops mmphw_overlay_ops = {
+static const struct mmp_overlay_ops mmphw_overlay_ops = {
 	.set_fetch = overlay_set_fetch,
 	.set_onoff = overlay_set_onoff,
 	.set_win = overlay_set_win,
diff --git a/include/video/mmp_disp.h b/include/video/mmp_disp.h
index a722dcbf5073..41354bd49895 100644
--- a/include/video/mmp_disp.h
+++ b/include/video/mmp_disp.h
@@ -156,7 +156,7 @@ struct mmp_overlay {
 	int status;
 	struct mutex access_ok;
 
-	struct mmp_overlay_ops *ops;
+	const struct mmp_overlay_ops *ops;
 };
 
 /* panel type */
@@ -299,7 +299,7 @@ struct mmp_path_info {
 	int overlay_num;
 	void (*set_mode)(struct mmp_path *path, struct mmp_mode *mode);
 	void (*set_onoff)(struct mmp_path *path, int status);
-	struct mmp_overlay_ops *overlay_ops;
+	const struct mmp_overlay_ops *overlay_ops;
 	void *plat_data;
 };
 
-- 
2.45.2

