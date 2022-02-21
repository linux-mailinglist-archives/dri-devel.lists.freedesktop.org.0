Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 992384BF419
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 09:52:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4334110EB07;
	Tue, 22 Feb 2022 08:52:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 921 seconds by postgrey-1.36 at gabe;
 Mon, 21 Feb 2022 10:54:01 UTC
Received: from out203-205-221-210.mail.qq.com (out203-205-221-210.mail.qq.com
 [203.205.221.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B98C10E5A1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Feb 2022 10:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
 s=s201512; t=1645440837;
 bh=4fADd5ckbj9wLsNGEkx/YWl2k1NstFX4D6yO2oX22N8=;
 h=From:To:Cc:Subject:Date;
 b=L5mQTDHghCv3MW7h4uTHnkP+CXEq9EKaFPmXeH8NAx2IVgymWRh0qxCdGMdp4TRjM
 45PuOSjV0qp3NgtmgJ399bTEnu44rcCK7jjUkg91wY/E7bH0MCTeOIqQ/5LW63uvUT
 unE0jhlZYbUYmyYBT0+Qqg1vnrlt9rZ9ND75r+kU=
Received: from localhost.localdomain ([218.197.153.188])
 by newxmesmtplogicsvrszc8.qq.com (NewEsmtp) with SMTP
 id 9A09E009; Mon, 21 Feb 2022 18:38:32 +0800
X-QQ-mid: xmsmtpt1645439912ty8r1galu
Message-ID: <tencent_AD2E09472E455F78B792E6BF114813B35206@qq.com>
X-QQ-XMAILINFO: Mx0gLVTpyl5nsAzj444ETocQ8S8QzHpdIe2WK5gE/ckWOfMwwiPqe8ilfBIyK6
 ObfwC/6GBi8sc4OCc/rKxo8kHDrLFR39OPI7aep7JK2Lj3eo+I1GX/hvMMNq4hhurBjTJKIFHK/H
 WbF/gDL8p9JT5N23RdNegZchcVNYTWzf8eS2qWoVkMnsKG+ZlB87nPPh7ZbK9tJgxFTELA4LCf+H
 0xL74nJKSyx6osOoKUKZWAL+L6d4wpRHKvQ3kHbtVbWmjDvOkJ2Zlat22wAwfAYdkfToo444yH3h
 deSvFU5NrEmQyqcof17yIOEM1vZ7z+BZ8/rJnrqqRJiScLFK5LUPqjhazqEQxrf2amQUAj6iCSDa
 JtHIvZo8PkoU9VnoUe+c7Z/aRV++LMv6OJGTxJwfZRtfDoI+gNmIx1iRIyk3eX5Ezqy8FqyIMzSE
 4ZPBKp3eJ8M8jBNtWIA9uU9KCzQ/Zkpbax/DgyE0y7gB1m6OVbGRoucVLo060+SsLTUy/uexUDgG
 BtM71IXXh9mKwXkIsT3RK0HNMom+DsArAilPfTkUPnUiRmwwDHOrDQ2VORWY0+W9Z2hh2pdXybWb
 /vw6tTGs0TV1IIMO17Qi/QcfgRZJFDJg3bh2B+QLrsigS7Z4Fag8fxO0Mgym1ePPVOFyxqZKnsWa
 qR2uC1AQbiDBA4/kIsUTSlIRUbys1qMFnQmslLjQMOG8328ncJdv7slSUeGpB4VMPVORbHdLYfL5
 QhV8WZKygAu3hs1cfxeXX3FhAVEamIoHOtX6GkTKgs8D2dgkTUM0tXU8kCJd0CzQ6VVyGwcHz3w2
 A2ASV9jox6ygtf8UmdYqANgxEryX8GxMeSwMNzdSI02uPhUXR7rHqfOz5bUZGG1MoVL7qitnRTkM
 GdjFO0xNBd
From: xkernel.wang@foxmail.com
To: FlorianSchandinat@gmx.de
Subject: [PATCH] video: fbdev: via: check the return value of kstrdup()
Date: Mon, 21 Feb 2022 18:37:34 +0800
X-OQ-MSGID: <20220221103734.3394-1-xkernel.wang@foxmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 22 Feb 2022 08:52:43 +0000
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
Cc: linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Xiaoke Wang <xkernel.wang@foxmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Xiaoke Wang <xkernel.wang@foxmail.com>

kstrdup() is a memory allocation function which can return NULL when
some internal memory errors happen. It is better to check the return
value of it to catch the error in time during the setup of viafb.

Signed-off-by: Xiaoke Wang <xkernel.wang@foxmail.com>
---
 drivers/video/fbdev/via/viafbdev.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/video/fbdev/via/viafbdev.c b/drivers/video/fbdev/via/viafbdev.c
index 22deb34..2d67c92 100644
--- a/drivers/video/fbdev/via/viafbdev.c
+++ b/drivers/video/fbdev/via/viafbdev.c
@@ -1939,8 +1939,12 @@ static int __init viafb_setup(void)
 
 		if (!strncmp(this_opt, "viafb_mode1=", 12)) {
 			viafb_mode1 = kstrdup(this_opt + 12, GFP_KERNEL);
+			if (!viafb_mode1)
+				return -ENOMEM;
 		} else if (!strncmp(this_opt, "viafb_mode=", 11)) {
 			viafb_mode = kstrdup(this_opt + 11, GFP_KERNEL);
+			if (!viafb_mode)
+				return -ENOMEM;
 		} else if (!strncmp(this_opt, "viafb_bpp1=", 11)) {
 			if (kstrtouint(this_opt + 11, 0, &viafb_bpp1) < 0)
 				return -EINVAL;
@@ -1969,6 +1973,8 @@ static int __init viafb_setup(void)
 				return -EINVAL;
 		} else if (!strncmp(this_opt, "viafb_active_dev=", 17)) {
 			viafb_active_dev = kstrdup(this_opt + 17, GFP_KERNEL);
+			if (!viafb_active_dev)
+				return -ENOMEM;
 		} else if (!strncmp(this_opt,
 			"viafb_display_hardware_layout=", 30)) {
 			if (kstrtoint(this_opt + 30, 0,
@@ -1995,8 +2001,12 @@ static int __init viafb_setup(void)
 				return -EINVAL;
 		} else if (!strncmp(this_opt, "viafb_lcd_port=", 15)) {
 			viafb_lcd_port = kstrdup(this_opt + 15, GFP_KERNEL);
+			if (!viafb_lcd_port)
+				return -ENOMEM;
 		} else if (!strncmp(this_opt, "viafb_dvi_port=", 15)) {
 			viafb_dvi_port = kstrdup(this_opt + 15, GFP_KERNEL);
+			if (!viafb_dvi_port)
+				return -ENOMEM;
 		}
 	}
 	return 0;
-- 
