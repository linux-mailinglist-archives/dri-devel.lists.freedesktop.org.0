Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04A083458C3
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 08:34:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDECE88E4D;
	Tue, 23 Mar 2021 07:34:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
 by gabe.freedesktop.org (Postfix) with ESMTP id 6A12D88E4D
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Mar 2021 07:33:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=bhswRq59Lz
 Qz4IxCsSIGEpezgpMNfSZEGd8ZjnkD4Ks=; b=vn2fP1t8k7f5tsYZTq/9CGjnha
 H7GDHwYOenEl1ReUy1MUsIZccTcGlESML7iAAygUivjRz7acdXlmtqtxOVCcIu0U
 OMZ6GKwYMIvgbEVM/pbNaBVG4fAZ9DjPgrMfxAylJQdFLWeCfWXqRhJyK3lq3toF
 /UYd/ikvHwcLmmdVk=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id LkAmygC3v0vhmVlgw3seAA--.4S4;
 Tue, 23 Mar 2021 15:33:53 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org
Subject: [PATCH] video/fbdev: Fix a double free in hvfb_probe
Date: Tue, 23 Mar 2021 00:33:50 -0700
Message-Id: <20210323073350.17697-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygC3v0vhmVlgw3seAA--.4S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ArW5WFWfJryrAw17WF47CFg_yoW8JFWUpF
 4kJFyqyrWrtr1j93ykAr4vyFyF9F4fKr9xWr12ya4Fka43J3y8Wr13AFW2krZ5ArW5Gw13
 ZF1Yy345Ga45CaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
 JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
 CE3s1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xv
 F2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r
 4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I
 648v4I1lc2xSY4AK67AK6r4xMxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r1j6r
 4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF
 67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2I
 x0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_WFyUJVCq3wCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfUYhL8DUUUU
X-CM-SenderInfo: ho1ojiyrz6zt1loo32lwfovvfxof0/
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
Cc: linux-hyperv@vger.kernel.org, Lv Yunlong <lyl2019@mail.ustc.edu.cn>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In function hvfb_probe in hyperv_fb.c, it calls hvfb_getmem(hdev, info)
and return err when info->apertures is freed.

In the error1 label of hvfb_probe, info->apertures will be freed twice
by framebuffer_release(info).

My patch sets info->apertures to NULL after it was freed to avoid
double free.

Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/video/fbdev/hyperv_fb.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index c8b0ae676809..2fc9b507e73a 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1032,6 +1032,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 		if (!pdev) {
 			pr_err("Unable to find PCI Hyper-V video\n");
 			kfree(info->apertures);
+			info->apertures = NULL;
 			return -ENODEV;
 		}
 
@@ -1130,6 +1131,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 		pci_dev_put(pdev);
 	}
 	kfree(info->apertures);
+	info->apertures = NULL;
 
 	return 0;
 
@@ -1142,6 +1144,7 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	if (!gen2vm)
 		pci_dev_put(pdev);
 	kfree(info->apertures);
+	info->apertures = NULL;
 
 	return -ENOMEM;
 }
-- 
2.25.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
