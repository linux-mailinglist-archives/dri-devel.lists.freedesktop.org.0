Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 706FE7B9B33
	for <lists+dri-devel@lfdr.de>; Thu,  5 Oct 2023 09:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2510210E04F;
	Thu,  5 Oct 2023 07:02:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 60166 seconds by postgrey-1.36 at gabe;
 Thu, 05 Oct 2023 07:02:15 UTC
Received: from out203-205-251-27.mail.qq.com (out203-205-251-27.mail.qq.com
 [203.205.251.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7807F10E1BA
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Oct 2023 07:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1696489325;
 bh=r0u4mBnaqi4GKs6c7eHWFsRbUYq0lOfRFobzAV6OvZA=;
 h=From:To:Cc:Subject:Date;
 b=U/GZxkkjMDeOdmZyxqENdpLR0Ohyn0r1RY7MvbiuU8Anyxn0owLNPLCuIPZWRvtD5
 jbwA12qKw3SAudzqQln0bzPsMJXiRvYRFaDqucDWcuvPqVBGpLR8sZnHuSxR9irs93
 z0u0rZNcluYtj/hKlenRyPRh6iPKW7ZAaecfEM3Y=
Received: from KernelDevBox.byted.org ([180.184.51.134])
 by newxmesmtplogicsvrszc2-0.qq.com (NewEsmtp) with SMTP
 id 6A3786D; Thu, 05 Oct 2023 15:01:42 +0800
X-QQ-mid: xmsmtpt1696489302tjj7ov6wx
Message-ID: <tencent_55C1A344A101B55762ECA6A6366D0B0F8C05@qq.com>
X-QQ-XMAILINFO: N9887S4huUpzQFADlprbpEj+DydrZRCAmNG800cbgpmSK4Yj8uwwdAJc4p1G2Y
 9dtO13xcpjT44XfFygVOvcDTH6aUVz5LAmQpcz9IPlfObjWcIQuTt3AdzEhQ/p6qDgIhGXPut6y6
 mYWSTa+c98Lvi1+PohH+uIFtPkegHitu4waxbGsjvPlziWW6PUi20Kh7csoKU8O7ovZ7qiSVGMmi
 8FtGCfVwm0r0bZnN61sC4IXb/q5N20hFDuQIVFnSe1CyqNgRdRz/AAGbV0t31G8PvzJxTrZZvkId
 yBeYNzQD6F6BD605lAMlW82At47MLBLQbGOprqBe0/FPXuDKeXmKyLG2EQjH1fW+evfff9NB8T0q
 jE5OfZ9mN5JzM0o6LO6AMlzj/XOB20ZqpX7krfUTCfuiPOvI8bl5s5ir0hn3GbM7csxeDF7T1bmq
 +Jq7w0GfiHK+pfLwEYTlyzS9oXaT63i9Sn7W9m2P5yT5guKp4SZxSjG4bvlej7t9xZOXnDpBLGcS
 5mBMJpjzdQm+EJ13KwZE1fsi3gFq71eSBCuQ1ryRJICmSWcNTfLU/CcaRbTPbpWBE/9qWQ+0mqRZ
 jZyBI612yg7w1htvsRLBnrKQ5T9Sp8e5r0lNU1fSegw4htZepW2fVv0PFl/OT22497NtUsHmre0i
 Ho8GsDN7MIOHhZxgDrnb8ZKaZ+CfVECfuyDGEL5WRDOcIaSxYSVwjjkx+uk0Z5k0AQVYpUpIYgfb
 ktjyRrnf7IGgkdC0z5dauv6/3yfTbpPcgNOkT9Inf6JRAyOMaxZZOOZjjIBXIWZG5BPerPwhEKpx
 q2Jty9Sqc6S6IJqrn4Vutla+/FO3JC9DRZ6kpO77xGoANfgY9hJv4pP11AiPvRUjCZ6KiKO/305K
 fNxQGU5jWZwnmHU7hfrfog+kL9cnchxBParIpLqhd+CgIZ8eJxhLcJggkGOCNMVDpliP6cRhd8IS
 hasqqi9sR0Yh0RzeV9yrhbN6EEh/mq20wRqVRAafUgYiwGZpwQjLs9iYeWJ/lm
X-QQ-XMRINFO: NS+P29fieYNw95Bth2bWPxk=
From: Zhang Shurong <zhang_shurong@foxmail.com>
To: deller@gmx.de
Subject: [PATCH] video: fbdev: arkfb: fix possible object reference leak
Date: Thu,  5 Oct 2023 15:01:41 +0800
X-OQ-MSGID: <20231005070141.1633540-1-zhang_shurong@foxmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: jiapeng.chong@linux.alibaba.com, linux-fbdev@vger.kernel.org,
 javierm@redhat.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, tzimmermann@suse.de,
 Zhang Shurong <zhang_shurong@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add missing pci_disable_device() in error path in ark_pci_probe().

Signed-off-by: Zhang Shurong <zhang_shurong@foxmail.com>
---
 drivers/video/fbdev/arkfb.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/video/fbdev/arkfb.c b/drivers/video/fbdev/arkfb.c
index 60a96fdb5dd8..6c4e5065646f 100644
--- a/drivers/video/fbdev/arkfb.c
+++ b/drivers/video/fbdev/arkfb.c
@@ -1064,7 +1064,7 @@ static int ark_pci_probe(struct pci_dev *dev, const struct pci_device_id *id)
 err_dac:
 	pci_release_regions(dev);
 err_request_regions:
-/*	pci_disable_device(dev); */
+	pci_disable_device(dev);
 err_enable_device:
 	framebuffer_release(info);
 	return rc;
@@ -1085,7 +1085,7 @@ static void ark_pci_remove(struct pci_dev *dev)
 
 		pci_iounmap(dev, info->screen_base);
 		pci_release_regions(dev);
-/*		pci_disable_device(dev); */
+		pci_disable_device(dev);
 
 		framebuffer_release(info);
 	}
-- 
2.30.2

