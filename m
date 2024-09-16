Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AED8979B96
	for <lists+dri-devel@lfdr.de>; Mon, 16 Sep 2024 08:55:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DB8410E10B;
	Mon, 16 Sep 2024 06:55:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=163.com header.i=@163.com header.b="XsfvUZB1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 921 seconds by postgrey-1.36 at gabe;
 Mon, 16 Sep 2024 01:26:20 UTC
Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.3])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0894C10E033
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Sep 2024 01:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=ssPUF
 PQWyxAsIOYliR4pLBv/PxhAoEP5u6GcBq01eyo=; b=XsfvUZB12xGxsjKt6gs3w
 LsQwexPWF/2KSZEd6vrBSbwdm25P+sjOQ1WgGeA1WlBC6TtS8i9ML4vl9EldX7ZK
 FdrBQV5JWGz4V7Iws2I2JNpTxCo0SMLf969m+Bh1146W7ugxn4Usl0Ri524fG3AM
 HI3MaPXA93to47E5dpYz3A=
Received: from debian.debian.local (unknown [183.167.14.112])
 by gzga-smtp-mta-g3-5 (Coremail) with SMTP id _____wDnjy2Thedm8GGhNA--.32834S2;
 Mon, 16 Sep 2024 09:10:44 +0800 (CST)
From: Qianqiang Liu <qianqiang.liu@163.com>
To: aniel@ffwll.ch, deller@gmx.de, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Qianqiang Liu <qianqiang.liu@163.com>, stable@vger.kernel.org,
 syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Subject: [PATCH] fbcon: Fix a NULL pointer dereference issue in fbcon_putcs
Date: Mon, 16 Sep 2024 09:10:28 +0800
Message-Id: <20240916011027.303875-1-qianqiang.liu@163.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnjy2Thedm8GGhNA--.32834S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrtrWkCrWxZrW7JF1DtrykAFb_yoWktrc_ur
 95Zr98Ww4DCryIkrn5CFn3Ar90qa429F93Wa1qyFWaya43Za4Fqr1DXr4rXrW3Jr1xXFnr
 twnFvrZrZw4fCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUUcAw3UUUUU==
X-Originating-IP: [183.167.14.112]
X-CM-SenderInfo: xtld01pldqwhxolxqiywtou0bp/1tbiLxVcamVOGXOP7wAAst
X-Mailman-Approved-At: Mon, 16 Sep 2024 06:55:00 +0000
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

syzbot has found a NULL pointer dereference bug in fbcon [1].

This issue is caused by ops->putcs being a NULL pointer.
We need to check the pointer before using it.

[1] https://syzkaller.appspot.com/bug?extid=3d613ae53c031502687a

Cc: stable@vger.kernel.org
Reported-and-tested-by: syzbot+3d613ae53c031502687a@syzkaller.appspotmail.com
Signed-off-by: Qianqiang Liu <qianqiang.liu@163.com>
---
 drivers/video/fbdev/core/fbcon.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/core/fbcon.c b/drivers/video/fbdev/core/fbcon.c
index 3f7333dca508..96c1262cc981 100644
--- a/drivers/video/fbdev/core/fbcon.c
+++ b/drivers/video/fbdev/core/fbcon.c
@@ -1284,7 +1284,7 @@ static void fbcon_putcs(struct vc_data *vc, const u16 *s, unsigned int count,
 	struct fbcon_display *p = &fb_display[vc->vc_num];
 	struct fbcon_ops *ops = info->fbcon_par;
 
-	if (!fbcon_is_inactive(vc, info))
+	if (!fbcon_is_inactive(vc, info) && ops->putcs)
 		ops->putcs(vc, info, s, count, real_y(p, ypos), xpos,
 			   get_color(vc, info, scr_readw(s), 1),
 			   get_color(vc, info, scr_readw(s), 0));
-- 
2.39.2

