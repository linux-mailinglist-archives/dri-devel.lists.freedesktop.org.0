Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EJ+pHyfRkWmJnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E07713EC57
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6703310E19C;
	Sun, 15 Feb 2026 13:58:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="x0NfHkub";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 299E610E0D0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:58:58 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-48069a48629so22468725e9.0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:58:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163937; x=1771768737;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87Z0X132XhQ0qIp2UdTelILbwyGX1bUUxXRUUNesvoY=;
 b=x0NfHkubAX3yEXR+4VnqIwTRshgo8wOQXoLFDeTSQzY1U80H7KyvpPTZnikRAtByNB
 WIMmPu5hp+3m2z4gkulcPtMq7la+oDRlUx8WUG+g1Yb8DKorcIC9ku7qCxyFW2D0SGy7
 uUj0HDOxo3n3l8ucL5mzp6d0/SzS6nvaXvYtyemb/loPC97glJOnJ+/u5cS41w1emuhj
 pZ85xtc6t3Fnus027ptOL7Keo8yv9wsMqBCu+FMPAUSSxN5njdhRVpuXN9EKRt21MYdY
 YQmTnaxd7UVn85Nomj5CPpJSGH2FhNM+cOB8qYrkKerQmLWkzEBhN9Bki1xI9nyR+nID
 xXKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163937; x=1771768737;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=87Z0X132XhQ0qIp2UdTelILbwyGX1bUUxXRUUNesvoY=;
 b=fAUcux7QKcPd07/FPgqkE+Un61D5LQVoc+zJS86sAHHIYHGUu1VG0IAafjs+Oaa30W
 hCc+7JTPKSYRAGtKoKCph89RCH85OmGOkEyb3ZgurMFQbpho3qnuEONWGGw6MSGHUP5m
 boS7X/M0delzhbFR4vtn2xeil6BT0MdHU+xO+qaYHqZO9Z1vzU2wOgMeNGiDeRsrTNmD
 hxMGsC7iflmDkH6Oasckch0ZYF8gL20eHFT2BF8JMM6qsjlFKVJoYrV9SGfWHJw2GsYP
 M6kVby8PKjZ6Ab/k1nbvPf4yjM3h9ldqfmC2zXQ/7npKWDoTm9FrvzVrZyRtIXZIzMTI
 7TUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmWeY4yy+BJZerBgQZ4mTtH4tTGublJc1uNpratD5ZpMMWvlCMOrRgu0dTdYrrJ2RfgwdncDoMrfI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz3iJdi35V6bPqpr4dd8tzZTUMXA+d6Z9jZydiCeUolPXyYfEw3
 GgAvCvygCDebGC9EY9UnATl57tPxAuiDLgKqu/Dsx9DdAukCciNU0ETOBg3ilTIwbUA=
X-Gm-Gg: AZuq6aLhsfF8LsDLdNGpOifVhbQfOSKF93Aghu/MPhL4U148sq5glCXRLvOeoO1007Q
 iUmiT/SkKkV0ubtK6GBTC4e/SIoBn8o01OGptPwwERZyAHEMFvuVpfQlDkvmnoMlKg6Xo4uZyKL
 GqAw47sAkomRyyZMiINj+D1qsOlMz/YczvRlb8oPsqFrpAvudR8+EU6GASwv5KZc6nILHoi1Dwj
 KpflzLOQ2/3YTTXoxtrVifmpxD8sjTzNw1r0mR1rW0tSzwhsdefgkaNKV4LMSEiaH8YlFDcmvel
 QiygsblzoAjf4j1dwnyUPKR4ixkE6b48xzl47gNMEraatgOPqGSl6XZ+AXvLLl68i4yjO5D+Md1
 DON5aSs4tWWZuX1G+Z9RbbcnfLtSzyXYN40i7gbiYFZK7o+YSctNeMn5zfCs1G0+kF8fsALNW1U
 wzVMWz+7w2aFI4LHmvRSWP6Lbv7qrR
X-Received: by 2002:a05:600c:3f0c:b0:47d:5e02:14e5 with SMTP id
 5b1f17b1804b1-483739ffa1emr139206625e9.5.1771163936672; 
 Sun, 15 Feb 2026 05:58:56 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48370a41be2sm104270675e9.1.2026.02.15.05.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:58:56 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/7] fbdev: au1100fb: Mark several local functions as static
Date: Sun, 15 Feb 2026 14:58:29 +0100
Message-ID: <927329dfdcf1afab17f70280c965302ff2d78782.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
References: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2951;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=/32w9PvZgcOs3+X7N8oELcxM04YQkhM/L2MiPZZxpNU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdEJ/rWuZgCU2dfdQu/j8D+QG0hlVfj4t/J72
 0mKTbLqgliJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHRCQAKCRCPgPtYfRL+
 TvQkB/9a0iRSh+6t2Lj1M6gqJHTHmACyzy0cpN+aH/okkpVO5f6epCEQdclcEBqoKePVL4KRHPP
 PYzCpnXmqLVFxu7yVtx9U/a3fxP98iYmRHVS6F1yg5ZR7uG5/oqDzadlxjKDbLvL6UGvIu6Jhc2
 a75hbHTsqpIJiQhUZSNgvLufe90TAgekoGsAGTErV7XmMAsF8Pgbr5epOl4Z/jp/iySc4Agxih3
 DIpfPuhZoyiaePiqg4qvH+mCCx/nAX35YRNSX1oKWdkAQln8nGnAuBX2A0rws5lgjm+HG8EloBY
 2ynmrAWR/ykYuFeFtIKSKuSBPR34OtMcC2T1jXQM+xlNgxkf
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
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmx.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 2E07713EC57
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
index 7bc224a8455c..b1da51683de7 100644
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
 
@@ -557,7 +557,7 @@ static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 	return 0;
 }
 
-int au1100fb_drv_resume(struct platform_device *dev)
+static int au1100fb_drv_resume(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 	int ret;
-- 
2.47.3

