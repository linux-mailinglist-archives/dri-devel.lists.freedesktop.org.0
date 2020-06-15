Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FBB31FA9A5
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jun 2020 09:09:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 911C96E822;
	Tue, 16 Jun 2020 07:09:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 359 seconds by postgrey-1.36 at gabe;
 Mon, 15 Jun 2020 09:00:11 UTC
Received: from m17617.mail.qiye.163.com (m17617.mail.qiye.163.com
 [59.111.176.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B5196E053
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Jun 2020 09:00:11 +0000 (UTC)
Received: from vivo-HP-ProDesk-680-G4-PCI-MT.vivo.xyz (unknown [58.251.74.226])
 by m17617.mail.qiye.163.com (Hmail) with ESMTPA id B251D261613;
 Mon, 15 Jun 2020 16:54:07 +0800 (CST)
From: Wang Qing <wangqing@vivo.com>
To: Lee Jones <lee.jones@linaro.org>,
 Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] drivers/video/backlight: Use kobj_to_dev() instead
Date: Mon, 15 Jun 2020 16:54:02 +0800
Message-Id: <1592211242-31683-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgYFAkeWUFZS1VLWVdZKFlBSE83V1ktWUFJV1kPCR
 oVCBIfWUFZSkwZSU1NGU1PT01JVkpOQklJSkpJT0NJSk1VEwETFhoSFyQUDg9ZV1kWGg8SFR0UWU
 FZT0tIVUpKS0hKTFVKS0tZBg++
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PT46Ayo4Hzg5CQhOSihMSxEW
 M0kaFFZVSlVKTkJJSUpKSU9DTk1DVTMWGhIXVQwaFRwKEhUcOw0SDRRVGBQWRVlXWRILWUFZTkNV
 SU5KVUxPVUlJTVlXWQgBWUFKQ0NINwY+
X-HM-Tid: 0a72b72f93709375kuwsb251d261613
X-Mailman-Approved-At: Tue, 16 Jun 2020 07:09:12 +0000
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
Cc: Wang Qing <wangqing@vivo.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use kobj_to_dev() instead of container_of()

Signed-off-by: Wang Qing <wangqing@vivo.com>
---
 drivers/video/backlight/lm3533_bl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 mode change 100644 => 100755 drivers/video/backlight/lm3533_bl.c

diff --git a/drivers/video/backlight/lm3533_bl.c b/drivers/video/backlight/lm3533_bl.c
index ee09d1b..0c7830f
--- a/drivers/video/backlight/lm3533_bl.c
+++ b/drivers/video/backlight/lm3533_bl.c
@@ -235,7 +235,7 @@ static struct attribute *lm3533_bl_attributes[] = {
 static umode_t lm3533_bl_attr_is_visible(struct kobject *kobj,
 					     struct attribute *attr, int n)
 {
-	struct device *dev = container_of(kobj, struct device, kobj);
+	struct device *dev = kobj_to_dev(kobj);
 	struct lm3533_bl *bl = dev_get_drvdata(dev);
 	umode_t mode = attr->mode;
 
-- 
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
