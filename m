Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2AcTDZ9yh2nBYAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C88E11069FD
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 18:13:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5F4E10E286;
	Sat,  7 Feb 2026 17:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="jMr/e5bn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
 [209.85.221.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366E710E287
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Feb 2026 17:12:57 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id
 ffacd0b85a97d-436e87589e8so232990f8f.3
 for <dri-devel@lists.freedesktop.org>; Sat, 07 Feb 2026 09:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770484376; x=1771089176;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FXVXB/RzJcoQAkIf6oAMqZB6mFdPuWSO4ccLVK1dTPE=;
 b=jMr/e5bntsK7Nv4mQTvPwbIAsPYTp1T0NYyEpXlv2ZFs9ao+I0h7vmyQsM3yVZbpFd
 I73ZAKfmLCihVE6OK5NjREgFZuolw5voTqiXnVOObJZbl6vKIBUbwm9ezGFm4fZmWnej
 XBVAlA51scCv74VZkC+XpFupEiL9McWG1L2U7BJxq+BPYe5Qo7r9b3t6TmxnyoFOY09s
 DWM5rarNihqlxdZjjiHukY37frb6pLNKx3WVLmJ4NYMN+NJZFA22xu1d75v5zBdZImEH
 PPKm/XQHE+RGSh1mtZaF90odexXT4ycATqk3KJVXiE3dUY/lM06PB1Whpeo8/SEt/5ZX
 kPYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770484376; x=1771089176;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FXVXB/RzJcoQAkIf6oAMqZB6mFdPuWSO4ccLVK1dTPE=;
 b=aS6Oe96rTNMo/S2OnSElDclTGtRQjUmCKd0RAHeimYisNShbO35fhbNgrdAftO1UY5
 5QERRAkFQCq5TQ2grc0SZ2nS51X+o9qd05RNWFALDr3d+FqchfNPgxP3FNIhwPEy9wcZ
 Dt/3Vv05fuxXa/mtbr2qsCjZHZ3Y2ax+5yKai15zVsy+oMmrrCpIpUxZnAmLmN2xlS5r
 jNIU9ES59+DDcBuwtZUIcpvzZZwyVP/mwPLMDWvh1/0aCBbloWJ5VVRIi79CKoa4M7DE
 tnE6A8x//+89s6ur5yyO4fyiLK8R7n9q0kAITWhOGjTHx2vuwUTbUfl0TZKUGbcAV8jN
 Yiyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVnjTPvlyzJR5MpaLYNBWNfp3dsCuDhynDtDrXRxNC+sTCiml8h1JoroGrxPZmz5fR8FaUvijV+m00=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywd+uPhsV42KykdGUY0ZdarWxbVGbmt9eg7TQ+ThkYgjq8y39vp
 JmZpbeEQfMcBDG01QknJHhr8m/H6g35KRmDn+71LCqttQoTitSrL91pWLBauSuL+UP42FRdpOeO
 9RfzIZiY=
X-Gm-Gg: AZuq6aL04e0ZOFtW9kRL7xMQlRX8JDQ3/OtLZZ5vqdVOUBW4jxSQ57o8/5XQFEvhsMe
 X3RhYwuJp7R0XzolD8yQUWZdbstU0Chai7pzrKDceCjUvu7g9UI2SVLb3jTwFnW7oyTg/HKTGUT
 Kd9uKfTctNDy7yHRr4Eda0A76E9miFahvK1A09sRCpgnSCU2ehvdt4dYjDuqjEWrSNIfguZP5yE
 UQQYRuT8/Xqv8i8fylAeAmBy7tlf1NBIX7xxwLrepBKfTErrQktdIlplsTl6cW1S42V1+YCYSEE
 1kq3sKknXNP8AHDwrVmk+fn2FTG+BtB9cW66cD3NQu3sEMreIduS/ah1kUBAeGXWlXH/1rcf4NQ
 GFHbdLQfoCw9mhJccXybEpDAKPB95qj2ArjNBui+Xy1Oa0AZYrP8WTlAmIjb5MLw/tZ6L472Wnv
 GQyb1W4t4k8cohu8zw
X-Received: by 2002:a05:6000:2285:b0:427:526:16aa with SMTP id
 ffacd0b85a97d-436293b6ae1mr9317004f8f.58.1770484375231; 
 Sat, 07 Feb 2026 09:12:55 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4362972fa4csm12998827f8f.26.2026.02.07.09.12.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 07 Feb 2026 09:12:54 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/4] fbdev: au1100fb: Mark several local functions as static
Date: Sat,  7 Feb 2026 18:12:35 +0100
Message-ID: <dc4836214dbfe43166aab995565d298eeffc6e10.1770483674.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
References: <cover.1770483674.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2951;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=EG7KrFeRIED1gbhtxHoC15RUdL9wU0F4wf7rqkzz7tY=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBph3KHq6rxnqaXyH8CRgWR8k7VU41sfl4SOr57S
 JYxEBHN2feJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYdyhwAKCRCPgPtYfRL+
 TvfWB/0eou3LaLVyjLyoRxmllOT+kj1XkAGQWR8L2z5YdO3tEpJVBcMfxRZXO+D1WLZZgcgb1iC
 4mQVMxG7vocZy+zCz+3/3ggWGh4v/bq9tmZ8vy2hzcRo68Rby9FG9sFnR1gUqS3Rz0H7NJjhsRn
 QoYXRxl3LynLyDXxZvu6iI948pRXZ8fBp5ptJf1EADgTKbYU7RRqknr2HcrzqDYfu8aSqlzKmjW
 HNjEjqYuKj+Xfblf/5uVO4DsKRewH/htc4z1yi6Zhm5eqWkw13akBuOr2V3m9YwsOPfuUEaw6c0
 B6Q7mNSvAm/mFlOOoVDOzk4omnGTfLPsuhG4+epPjlEhKtC3
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp;
 fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	ARC_NA(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-0.985];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C88E11069FD
X-Rspamd-Action: no action

This fixes several (fatal) compiler warnings à la

	drivers/video/fbdev/au1100fb.c:530:6: error: no previous prototype for ‘au1100fb_drv_remove’ [-Werror=missing-prototypes]
	  523 | void au1100fb_drv_remove(struct platform_device *dev)
	      |      ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 75344ee080f3..beba8befaec9 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -120,7 +120,7 @@ static int au1100fb_fb_blank(int blank_mode, struct fb_info *fbi)
  * Set hardware with var settings. This will enable the controller with a specific
  * mode, normally validated with the fb_check_var method
 	 */
-int au1100fb_setmode(struct au1100fb_device *fbdev)
+static int au1100fb_setmode(struct au1100fb_device *fbdev)
 {
 	struct fb_info *info;
 	u32 words;
@@ -219,7 +219,7 @@ int au1100fb_setmode(struct au1100fb_device *fbdev)
 /* fb_setcolreg
  * Set color in LCD palette.
  */
-int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue, unsigned transp, struct fb_info *fbi)
+static int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue, unsigned transp, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev;
 	u32 *palette;
@@ -278,7 +278,7 @@ int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned
 /* fb_pan_display
  * Pan display in x and/or y as specified
  */
-int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
+static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev;
 	int dy;
@@ -325,7 +325,7 @@ int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
  * Map video memory in user space. We don't use the generic fb_mmap method mainly
  * to allow the use of the TLB streaming flag (CCA=6)
  */
-int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
+static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 {
 	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
 
@@ -517,7 +517,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	return -ENODEV;
 }
 
-void au1100fb_drv_remove(struct platform_device *dev)
+static void au1100fb_drv_remove(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = NULL;
 
@@ -559,7 +559,7 @@ static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 	return 0;
 }
 
-int au1100fb_drv_resume(struct platform_device *dev)
+static int au1100fb_drv_resume(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 	int ret;
-- 
2.47.3

