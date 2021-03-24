Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A59D4347642
	for <lists+dri-devel@lfdr.de>; Wed, 24 Mar 2021 11:37:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B888D89F38;
	Wed, 24 Mar 2021 10:37:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ustc.edu.cn (email6.ustc.edu.cn [IPv6:2001:da8:d800::8])
 by gabe.freedesktop.org (Postfix) with ESMTP id E936989F38
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Mar 2021 10:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mail.ustc.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id:MIME-Version:Content-Transfer-Encoding; bh=PXF6JWSoPF
 BH9Usr8tR+rlIy/zE3h2TbpQbzC+GbL0c=; b=S0rbtQqfTQjcT/uVujgUjkyHsG
 subYYj47fDisdV53c8qKPSs3jf8xc7wJ59ZKECQvI2wr0r+vkcR7KhFKnFFCjQRa
 YMDQDrBUgM4ucUFD5Za96Q7yigj14TPCaPJUMLFlWxCkzsSQuZMpKc+s4Ela9imA
 DQT063mDD54cIyFek=
Received: from ubuntu.localdomain (unknown [202.38.69.14])
 by newmailweb.ustc.edu.cn (Coremail) with SMTP id
 LkAmygAXH09zFltgkvEyAA--.238S4; 
 Wed, 24 Mar 2021 18:37:39 +0800 (CST)
From: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
To: kys@microsoft.com, haiyangz@microsoft.com, sthemmin@microsoft.com,
 wei.liu@kernel.org
Subject: [PATCH v2] video: hyperv_fb: Fix a double free in hvfb_probe
Date: Wed, 24 Mar 2021 03:37:24 -0700
Message-Id: <20210324103724.4189-1-lyl2019@mail.ustc.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: LkAmygAXH09zFltgkvEyAA--.238S4
X-Coremail-Antispam: 1UD129KBjvJXoW7ArWUuw4rXF13Xry8Zry8uFg_yoW8GFWUpF
 4kJayqyrW8tw109w4kAF4vyF9Y9Fs3Kr9xuFy2ka4Fya13J3yUuryrAFyI9rZ5ArW3W3WY
 vF1Ut34rCa45uFUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUvG14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j
 6r4UJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwCY02Avz4vE14v_Gw1l42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr
 1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE
 14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7
 IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWrJr0_WFyUJwCI42IY
 6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa
 73UjIFyTuYvjfUF0eHDUUUU
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

In the error1 label of hvfb_probe, info->apertures will be freed for the
second time in framebuffer_release(info).

My patch removes all kfree(info->apertures) instead of set info->apertures
to NULL. It is because that let framebuffer_release() handle freeing the
memory flows the fbdev pattern, and less code overall.

Signed-off-by: Lv Yunlong <lyl2019@mail.ustc.edu.cn>
---
 drivers/video/fbdev/hyperv_fb.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/video/fbdev/hyperv_fb.c b/drivers/video/fbdev/hyperv_fb.c
index c8b0ae676809..4dc9077dd2ac 100644
--- a/drivers/video/fbdev/hyperv_fb.c
+++ b/drivers/video/fbdev/hyperv_fb.c
@@ -1031,7 +1031,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 			PCI_DEVICE_ID_HYPERV_VIDEO, NULL);
 		if (!pdev) {
 			pr_err("Unable to find PCI Hyper-V video\n");
-			kfree(info->apertures);
 			return -ENODEV;
 		}
 
@@ -1129,7 +1128,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 	} else {
 		pci_dev_put(pdev);
 	}
-	kfree(info->apertures);
 
 	return 0;
 
@@ -1141,7 +1139,6 @@ static int hvfb_getmem(struct hv_device *hdev, struct fb_info *info)
 err1:
 	if (!gen2vm)
 		pci_dev_put(pdev);
-	kfree(info->apertures);
 
 	return -ENOMEM;
 }
-- 
2.25.1


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
