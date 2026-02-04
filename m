Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8C2zBjMOg2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:31 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F9F8E3AAE
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A142110E58F;
	Wed,  4 Feb 2026 09:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ud5wmlSN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
 [209.85.128.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF9E10E589
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:15:27 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so52754335e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 01:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770196526; x=1770801326;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sxehwfigTtxx4VEPi4AE7s7RcqfSuZjwJcd/po/KS5M=;
 b=Ud5wmlSNlhjHb+DokvSyHNDv/utis2RTq7zaMJrV8enicYdLXT6Wka9EDXY4Lroaia
 BIXgB/B/ZJP7qL308BYCLE8Yh8XTA6jSiFlvSHNMhSEmzkn/fLIBsdYtJYu60ldzBRa1
 ZskRtVRQ3UtO+jdBcFLR6tfXGcKB9LOPAOJQx9awGG/9Bpcwd1i+kcCE8trQrgX+n5lc
 e61bXa89u+ruD+XD7nzu0FQ7biaeJsPBbnJxElrnhRRGXcJ2IE7vtvJ2UA+FjfxDiqSV
 ADpZRBVoZ9GfPQuqu/LZ1l3yolmpaS73NHTzBgp4ZFv5qgPoE/zYPJ4PIrZ5XOceekbl
 iUTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770196526; x=1770801326;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sxehwfigTtxx4VEPi4AE7s7RcqfSuZjwJcd/po/KS5M=;
 b=ToNiDZTYkZUUCE5zYYO7/6TLvLAN1I+k+xk3NrQigNp15TjrZVEyIgnc5eP47nN+KJ
 GeCvHBh6y3PzsZmKOfKhMuAIv8nmBzC/6PcRZqYoDXqH9jsrK9MDxx1ld9PtkTCZvmTV
 HzugmtiLDx2+PdkOpjbZM4fRLpxMUCZjrUhn/cp211y4QQ39CzNDYEM4gMJSE9ChUuEP
 KQa65O/skIz55IOkmOctoMSud4r3bnGUQ/19qh+858QrWNUZGCPn4DBeLNsdvnXjzfXc
 N58z6APkOw9xIxw2IKsqAM2e7Hj0Iyha6Q6AYlRIJPay0odXAsd9e9RWMKvhffz9suOm
 8zfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVtA7+poEptPhLjkgufGDtZdsJ1bS28HbV4MbDwISGioeXUVMe2OM6+EdntZBBk+Rp5YiCNV1o3ljE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwRpnLGqjJKgMH0MAjVKFfKrv2daUM6MHWR+SBXFBXlWFWlGMcp
 nRfrGbgBZ4hkV9IgIIVIvwtcmniJXoulNoGFhVUaiZWQpNZUJjkFsU3iVSlHwoKxe/A=
X-Gm-Gg: AZuq6aLb/dT1V7cS1mNyNRuld/aAh+qFrZ/AYhmzYUrS9gpayen3NyyiwcC8fFvzzT4
 CMqCySMoy7c+HQuVdbKl+jNfr+bofUwT+gV/pMPvBtVtqODNY9xTUK6XYkbi2dMht7rO/6xhI+o
 Byy5ZB+mNU/pobklDih7bjucoBORwCysIqcqX0Sf7adw0xaVXZXMbPq+ISad6otDgYVpuVAugTN
 t1QnXucvYrSMFo+dtMc19r4vw7Iq3RdVauRwFixcz6kgpB1xEMQb/LQFWAQsaaVztj2I6bwfWN6
 Y7Fj2GJ1quhsLSZ5Cmh0dBCGNMym/FdKb0DTzCogVMAk+hoq2kgnoeZSyekXcjwS9+2xLBp3H6O
 N1IsEWUZnpG/M9kkoQCTb908OmhUyhBqKOW85zKyGM2p4QcRsy8ro3iE0dRLTl1Tk1OnyLUljUe
 i0J4RwX0CrCerMN7y5Cg/10WhNrwYzZjUMDpV1psTXtJ4Abug/FtBmh9TDnQJU7Uce6blkSPo0w
 nYFzdfheNa5OQ==
X-Received: by 2002:a05:600c:5491:b0:477:6d96:b3e5 with SMTP id
 5b1f17b1804b1-4830e922970mr30892105e9.7.1770196525981; 
 Wed, 04 Feb 2026 01:15:25 -0800 (PST)
Received: from localhost
 (p200300f65f20eb0470629fa1229c2efb.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:7062:9fa1:229c:2efb])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-4361805f25dsm5179819f8f.29.2026.02.04.01.15.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 01:15:25 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 1/3] fbdev: au1100fb: Mark several local functions as static
Date: Wed,  4 Feb 2026 10:15:11 +0100
Message-ID: <ceb08e29f6a07075b5ca63e4ed30c5051fddcdfd.1770196161.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
References: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=3309;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=XZn/GP+/Hn3BUIUk+YdmBk4Y4+sbl1x67i7eczPkN70=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpgw4hHstF6LkWEYZBH5ROgc9ot9NDyxl7XRDK9
 1O1RqBRKM2JATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYMOIQAKCRCPgPtYfRL+
 Ti8fB/9KhSErUK59/gPfkp1kl8W4UilXPUO1/xyJTht9qAnWvaeLAShYF1dKA9da4dZPIXkBWAs
 HfZ9rVe5ejz3J12Rbv9yGXNQr8b4CIpAl+9zRAZIsscRPSCZrPH+6Q96xAPzW2qg6Za1QB093E5
 nntkz1wcPw9Et5KqTA+DUEjSJJoqPogV6MG3DOkxZUcoJkKBjZhkeiCI89Q+/33uzQlofLg3wVd
 RUX8X/8FomSolTzJAf3r9n04BngOdF5q/ZAMDxqQEmFZ5auEWBy3BDStUeqZU2SdnbofEzthqtW
 Iwcr8bqSOnVPyQUPgx1dREAITBCPkN3/unBJhc72UZ7BwurY
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
	R_DKIM_ALLOW(-0.20)[baylibre-com.20230601.gappssmtp.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_NA(0.00)[baylibre.com];
	FREEMAIL_TO(0.00)[gmx.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:deller@gmx.de,m:nichen@iscas.ac.cn,m:linux-fbdev@vger.kernel.org,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 5F9F8E3AAE
X-Rspamd-Action: no action

This fixes several (fatal) compiler warnings à la

	drivers/video/fbdev/au1100fb.c:530:6: error: no previous prototype for ‘au1100fb_drv_remove’ [-Werror=missing-prototypes]
	  523 | void au1100fb_drv_remove(struct platform_device *dev)
	      |      ^~~~~~~~~~~~~~~~~~~

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index feaa1061c436..4df470878b42 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -135,7 +135,7 @@ static int au1100fb_fb_blank(int blank_mode, struct fb_info *fbi)
  * Set hardware with var settings. This will enable the controller with a specific
  * mode, normally validated with the fb_check_var method
 	 */
-int au1100fb_setmode(struct au1100fb_device *fbdev)
+static int au1100fb_setmode(struct au1100fb_device *fbdev)
 {
 	struct fb_info *info;
 	u32 words;
@@ -234,7 +234,7 @@ int au1100fb_setmode(struct au1100fb_device *fbdev)
 /* fb_setcolreg
  * Set color in LCD palette.
  */
-int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue, unsigned transp, struct fb_info *fbi)
+static int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned blue, unsigned transp, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev;
 	u32 *palette;
@@ -293,7 +293,7 @@ int au1100fb_fb_setcolreg(unsigned regno, unsigned red, unsigned green, unsigned
 /* fb_pan_display
  * Pan display in x and/or y as specified
  */
-int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
+static int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
 {
 	struct au1100fb_device *fbdev;
 	int dy;
@@ -340,7 +340,7 @@ int au1100fb_fb_pan_display(struct fb_var_screeninfo *var, struct fb_info *fbi)
  * Map video memory in user space. We don't use the generic fb_mmap method mainly
  * to allow the use of the TLB streaming flag (CCA=6)
  */
-int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
+static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 {
 	struct au1100fb_device *fbdev = to_au1100fb_device(fbi);
 
@@ -522,7 +522,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	return -ENODEV;
 }
 
-void au1100fb_drv_remove(struct platform_device *dev)
+static void au1100fb_drv_remove(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = NULL;
 
@@ -547,7 +547,7 @@ void au1100fb_drv_remove(struct platform_device *dev)
 #ifdef CONFIG_PM
 static struct au1100fb_regs fbregs;
 
-int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
+static int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 
@@ -564,7 +564,7 @@ int au1100fb_drv_suspend(struct platform_device *dev, pm_message_t state)
 	return 0;
 }
 
-int au1100fb_drv_resume(struct platform_device *dev)
+static int au1100fb_drv_resume(struct platform_device *dev)
 {
 	struct au1100fb_device *fbdev = platform_get_drvdata(dev);
 	int ret;
-- 
2.47.3

