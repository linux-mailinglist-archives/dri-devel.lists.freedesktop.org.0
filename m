Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D2D3CCE88
	for <lists+dri-devel@lfdr.de>; Mon, 19 Jul 2021 09:32:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1E7996E0AA;
	Mon, 19 Jul 2021 07:32:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id 5EC0B89CBE
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Jul 2021 06:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=3HTbXrkdRBgh0QIJpcMwxUac2r5yW+CgKCOIIaqrpTU=; b=i
 yATwRcX4oZ8epqf7PjXbQskHxBZzHOV3t7PrOM2EHIPMfih0WAtq3yyvbQkpezBE
 iib4k7qsPxOya81btjirA3kpO7dbvh27pm27jcyHg/mCmIgw3/9oamt95i1RJLTI
 To6iQzkqFO8q/lNhD1C6eeBnwTFeq3Ib5IR5qTeOE8=
Received: from localhost.localdomain (unknown [10.162.86.133])
 by app1 (Coremail) with SMTP id XAUFCgDHzYnbFPVgPRWJAA--.1241S3;
 Mon, 19 Jul 2021 13:59:55 +0800 (CST)
From: Xiyu Yang <xiyuyang19@fudan.edu.cn>
To: Daniel Vetter <daniel.vetter@ffwll.ch>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Sam Ravnborg <sam@ravnborg.org>,
 Arnd Bergmann <arnd@arndb.de>, Thomas Zimmermann <tzimmermann@suse.de>,
 George Kennedy <george.kennedy@oracle.com>,
 Xiyu Yang <xiyuyang19@fudan.edu.cn>,
 Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Jason Gunthorpe <jgg@ziepe.ca>,
 William Kucharski <william.kucharski@oracle.com>,
 Xin Tan <tanxin.ctf@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbmem: Convert from atomic_t to refcount_t on fb_info->count
Date: Mon, 19 Jul 2021 13:59:45 +0800
Message-Id: <1626674392-55857-1-git-send-email-xiyuyang19@fudan.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: XAUFCgDHzYnbFPVgPRWJAA--.1241S3
X-Coremail-Antispam: 1UD129KBjvJXoW7Wry3tF17ZF1DKw45CrW5Awb_yoW8Zr1fpF
 n8Ka4DtF4rAryxCr4kCa1jvFy3Ja18CF9xJrZFga4FyFy3tr1Ygw1DJFyYvrWrArWxCF4Y
 qryI9w15CFWUur7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUU9G14x267AKxVW5JVWrJwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jrv_JF1lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMx
 C20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAF
 wI0_JrI_JrWlx4CE17CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20x
 vE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v2
 0xvaj40_Gr0_Zr1lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxV
 W8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7VUbLID7UUUUU==
X-CM-SenderInfo: irzsiiysuqikmy6i3vldqovvfxof0/
X-Mailman-Approved-At: Mon, 19 Jul 2021 07:32:43 +0000
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
Cc: yuanxzhang@fudan.edu.cn
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

refcount_t type and corresponding API can protect refcounters from
accidental underflow and overflow and further use-after-free situations.

Signed-off-by: Xiyu Yang <xiyuyang19@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/video/fbdev/core/fbmem.c | 6 +++---
 include/linux/fb.h               | 3 ++-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/core/fbmem.c b/drivers/video/fbdev/core/fbmem.c
index 98f193078c05..b7d26b928e1d 100644
--- a/drivers/video/fbdev/core/fbmem.c
+++ b/drivers/video/fbdev/core/fbmem.c
@@ -67,7 +67,7 @@ static struct fb_info *get_fb_info(unsigned int idx)
 	mutex_lock(&registration_lock);
 	fb_info = registered_fb[idx];
 	if (fb_info)
-		atomic_inc(&fb_info->count);
+		refcount_inc(&fb_info->count);
 	mutex_unlock(&registration_lock);
 
 	return fb_info;
@@ -75,7 +75,7 @@ static struct fb_info *get_fb_info(unsigned int idx)
 
 static void put_fb_info(struct fb_info *fb_info)
 {
-	if (!atomic_dec_and_test(&fb_info->count))
+	if (!refcount_dec_and_test(&fb_info->count))
 		return;
 	if (fb_info->fbops->fb_destroy)
 		fb_info->fbops->fb_destroy(fb_info);
@@ -1594,7 +1594,7 @@ static int do_register_framebuffer(struct fb_info *fb_info)
 		if (!registered_fb[i])
 			break;
 	fb_info->node = i;
-	atomic_set(&fb_info->count, 1);
+	refcount_set(&fb_info->count, 1);
 	mutex_init(&fb_info->lock);
 	mutex_init(&fb_info->mm_lock);
 
diff --git a/include/linux/fb.h b/include/linux/fb.h
index ecfbcc0553a5..5950f8f5dc74 100644
--- a/include/linux/fb.h
+++ b/include/linux/fb.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_FB_H
 #define _LINUX_FB_H
 
+#include <linux/refcount.h>
 #include <linux/kgdb.h>
 #include <uapi/linux/fb.h>
 
@@ -435,7 +436,7 @@ struct fb_tile_ops {
 
 
 struct fb_info {
-	atomic_t count;
+	refcount_t count;
 	int node;
 	int flags;
 	/*
-- 
2.7.4

