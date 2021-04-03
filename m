Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A54635378E
	for <lists+dri-devel@lfdr.de>; Sun,  4 Apr 2021 10:56:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 354676E48B;
	Sun,  4 Apr 2021 08:56:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 923 seconds by postgrey-1.36 at gabe;
 Sat, 03 Apr 2021 14:23:29 UTC
Received: from m12-17.163.com (m12-17.163.com [220.181.12.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 728736E091
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Apr 2021 14:23:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=0qy/X
 xSv0LvNeE6/iJrXLwqgtsytvrqCk+LelXNA+8A=; b=juQBfyb6LR0uiWeYhXg9X
 eeQkYhDLjxSAGy9ydw4poGmUUwQOvgt8s43/ypWzR2qlPip6TJmmHBKzZOSUwEgc
 xhNRtxOHsmqWfKqjcP3fxBxtMiVG35QU9CdUEXn1FfRAK96Rst9T2Yx447S6tE18
 axN1W0NhTmkNPszFMkb+a8=
Received: from localhost.localdomain (unknown [120.229.64.251])
 by smtp13 (Coremail) with SMTP id EcCowAA31Hihdmhgd8zhtQ--.8258S2;
 Sat, 03 Apr 2021 22:07:30 +0800 (CST)
From: Carlis <llyz108@163.com>
To: gregkh@linuxfoundation.org,
	zhangxuezhi1@yulong.com
Subject: [PATCH] staging: fbtft: convert sysfs snprintf to sysfs_emit
Date: Sat,  3 Apr 2021 14:07:22 +0000
Message-Id: <20210403140722.169623-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: EcCowAA31Hihdmhgd8zhtQ--.8258S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JrWUKr1DJFyDCF4xCF4Uurg_yoWfZrb_Ar
 10vr1Sg3y0kryIyryFkF1Sva4IvF4fZF4vg3y3t393Za15uw4rJrWUuw1ktrZIgF4xZFyf
 Ars7XryrKr1UGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IU8NVy7UUUUU==
X-Originating-IP: [120.229.64.251]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/1tbiWwJphVSIpiU-DgAAsb
X-Mailman-Approved-At: Sun, 04 Apr 2021 08:56:04 +0000
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
Cc: devel@driverdev.osuosl.org, linux-fbdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warning:
drivers/staging/fbtft//fbtft-sysfs.c:202:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/staging/fbtft/fbtft-sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/fbtft/fbtft-sysfs.c b/drivers/staging/fbtft/fbtft-sysfs.c
index 26e52cc2d..39e8d2806 100644
--- a/drivers/staging/fbtft/fbtft-sysfs.c
+++ b/drivers/staging/fbtft/fbtft-sysfs.c
@@ -199,7 +199,7 @@ static ssize_t show_debug(struct device *device,
 	struct fb_info *fb_info = dev_get_drvdata(device);
 	struct fbtft_par *par = fb_info->par;
 
-	return snprintf(buf, PAGE_SIZE, "%lu\n", par->debug);
+	return sysfs_emit(buf, "%lu\n", par->debug);
 }
 
 static struct device_attribute debug_device_attr =
-- 
2.25.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
