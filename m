Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BCF55F001
	for <lists+dri-devel@lfdr.de>; Tue, 28 Jun 2022 22:53:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C127210EA45;
	Tue, 28 Jun 2022 20:53:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 969 seconds by postgrey-1.36 at gabe;
 Tue, 28 Jun 2022 16:55:11 UTC
Received: from m12-15.163.com (m12-15.163.com [220.181.12.15])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFC2F10FB66
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Jun 2022 16:55:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nt05P
 26I+/2qRv1d4aL/V6BIimpJ94Vgajr7RbdM3fE=; b=ixESMC2SVpxKnKjcPuT8d
 Ii/rwpVHzGEpzqphF/mLkA0jWuafIfBAEc4pprTg0Da702z3zDxAVs77ChpRvJTc
 yDl6xSKoIqyyDW2kVnFGK5LesGsklIRc2uQM0XlCk8oLf1iENODHH0NlNyOqK+Vh
 xAWm+0Q7+jlaIk8VdJKgJ4=
Received: from ubuntu.localdomain (unknown [223.73.235.3])
 by smtp9 (Coremail) with SMTP id DcCowAAnhwySLrtiwy+mLw--.51135S2;
 Wed, 29 Jun 2022 00:38:50 +0800 (CST)
From: Guiling Deng <greens9@163.com>
To: daniel@ffwll.ch,
	deller@gmx.de
Subject: [PATCH] fbdev: fbmem: Fix logo center image dx issue
Date: Tue, 28 Jun 2022 09:36:41 -0700
Message-Id: <20220628163641.4167-1-greens9@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: DcCowAAnhwySLrtiwy+mLw--.51135S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW3Zr1ktw48WrWfAFy7Wrg_yoW3ArgEkw
 4jvF97Zr9Ik3WIkFnYk3W3AFZayrWfZ3W3u3ZFkrykCF9Fgr4rXr1UZrsYqayagwnrXFZF
 qwnFqr48WryfCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRltC3JUUUUU==
X-Originating-IP: [223.73.235.3]
X-CM-SenderInfo: pjuhv0jvz6il2tof0z/1tbiURou3GDEOaLlSgAAsp
X-Mailman-Approved-At: Tue, 28 Jun 2022 20:53:08 +0000
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
Cc: linux-fbdev@vger.kernel.org, Guiling Deng <greens9@163.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Image.dx gets wrong value because of missing '()'.

If xres == logo->width and n == 1, image.dx = -16.

Signed-off-by: Guiling Deng <greens9@163.com>
---
 drivers/video/fbdev/core/fbmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index c4a18322dee9..1fd2bdb11266 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -511,7 +511,7 @@ static int fb_show_logo_line(struct fb_info *info, int rotate,
 
 		while (n && (n * (logo->width + 8) - 8 > xres))
 			--n;
-		image.dx = (xres - n * (logo->width + 8) - 8) / 2;
+		image.dx = (xres - (n * (logo->width + 8) - 8)) / 2;
 		image.dy = y ?: (yres - logo->height) / 2;
 	} else {
 		image.dx = 0;
-- 
2.25.1

