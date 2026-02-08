Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOttBsnOiGlkwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A78CF109A0F
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BECF410E312;
	Sun,  8 Feb 2026 17:58:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="CEShSs6o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com
 [209.85.128.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 000F210E30F
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:58:28 +0000 (UTC)
Received: by mail-wm1-f68.google.com with SMTP id
 5b1f17b1804b1-47f5c2283b6so35530175e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:58:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770573507; x=1771178307;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=87Z0X132XhQ0qIp2UdTelILbwyGX1bUUxXRUUNesvoY=;
 b=CEShSs6ob8vtmn9iU5p9qQ8q3BKWyU313G9D9PeP+7vEjszELR5588HodubuXpv4gD
 oouuJKV+VglEsFna7wNTTUboV3Hqvj7Rde21WfKUNJKAY37Ntl6FQIPnH8Wg5L6IR2Wm
 6xk8bCI2rU8pWO1zqzFtIlgevA+NPYbDAtCnNRbLmXeL2az02dIiWXPPNCzslSKnvJ9Z
 DB706qAbRL5Yes4n8qfkNVuN94ARcMPx+kdYxUZo5zKCjDcZ02A6SppJVIzevRc4+xj9
 SN+9pzLDCR+fZGXiWxDy8LZtFJDhaeROfPM61+48pj9mVK3NRvsG0/Vw7HttCXT1s+ZE
 phbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770573507; x=1771178307;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=87Z0X132XhQ0qIp2UdTelILbwyGX1bUUxXRUUNesvoY=;
 b=HsAlcPUCxqmesumrdGK2LpP50Vo4K318rGcZSRY2ZvweaHMptAwEQnW0+jxJ9iYMYt
 XAkj17iJH9LvKfd+7FVCU8UHGFRmnTDNqWz0fHncQLPBu5kU+EvCdJf76Siq4XgcaEej
 3GBj0tEY3yLu0KGq5cBJdnHYmu2RZd9NrIj/ynPM3uU7HjeYeOoQgsXcfOUd3qllcS1B
 WRIu62TFUkyRVz3uTlSzR08C2eLo5KnOr79RuT2eXjkpxFLVq7dObE52OBmJtWkJ6AWa
 7p9hwuFEux5u0rWRUSXr+RuboXD/2lPtXHTFvc15vVF0GBdnxUus467E2H/Nfx6OFliP
 683Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpkJBRMwNJqgnACUDj2UQ6pfxyTwGHUqEesBp7Z4jHTcjyQFaTp0HIcoqRNN0U7SM0J/rtDkfW3qg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyu+n/V163ejH+TpVho1iQdp4jq8aoyRqrgwwAAAwVC1y/J9Uhg
 vK/Lt9y/iw2iek3d79ht6QNeeGvZPuPIeJO7tl+0tvhhV1okZP+MZUj4PbzbSbOr/mg=
X-Gm-Gg: AZuq6aKNUOSOhYwM/FJjYWAgVboumEDjBnsNTN7J5lTDaIbH3Mvmef7/NlCKiJP3OaU
 rirqBQuG2CUQjXPotldObXhrucLd9DTECMOYTtTTwMBroZ/h4paPs336YJu+FZjQ+OpjkISEIwi
 Z+HIFMO6LfbiCBcOZlz3haChDvTipkzXvPdbrtEp1ewPRQnXzJXZt0cPEdG5116I5IorckMV2OO
 hEUuJIszSYPcegOCHge0zys22U9usBcXU4213J06dIjyJ3aMykil9ZOeFaqb75TS1dx1jVCoi9w
 Ru9i80Rt3+bqvJdJFWH484JFtCqL9G8w0kLVAdmXaQ5mqbsTMh3FMxL/xiI5ip52m3kPJWcjFXE
 9ezF7gc4iKlOos+sbgYlPfVAhKk9kFZfchCnDYTAKHf0Rn9aktP565xIYkZU1VOC2k3+xAs0uga
 TMtJVsqhQL9LGR2ajp
X-Received: by 2002:a5d:5f82:0:b0:433:1d30:44c with SMTP id
 ffacd0b85a97d-4362937b4camr13453988f8f.43.1770573507447; 
 Sun, 08 Feb 2026 09:58:27 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-436296bd211sm22057822f8f.13.2026.02.08.09.58.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:58:27 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 2/6] fbdev: au1100fb: Mark several local functions as static
Date: Sun,  8 Feb 2026 18:57:59 +0100
Message-ID: <99f569d892e2015f9291aeba1273b4d9816556e1.1770572936.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2951;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=/32w9PvZgcOs3+X7N8oELcxM04YQkhM/L2MiPZZxpNU=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpiM6sGjTOKHA4/1efCqoAKcD3y3JAEZWENrZXN
 494eYmTojeJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYjOrAAKCRCPgPtYfRL+
 ThTLCACzxwlMEsfgyLfbaThm4of2FvLnbbCHIEgY3HLJigtEmBp7szWMtVvTcEiNfv5faK3XYyJ
 qvpLzuWpZFnV5QhmO3MC+jAaO/Dpkg1UI+V7cgfLV7EvjkK1Hi6viXQ0SJSSLF/234JayE6Qa5B
 sWgZvok8CLDvoGr2ksoBJe/ogljSkvclr2178vKJKZ90djKcaHC+OXj7V+Yl2yGQB1Qk+TA3OrP
 d9OUqQ5ylfL85WGxaqO/UT43cRjRUbNMYbUlox6vE/mZRPhjKzG2dNrlvaXve8R2MwTXFdGgINz
 0B5nGh+w93+R7FpnINAolzCWnnMowt8pFQ3kh/B7ZVCaMwM6
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
	NEURAL_HAM(-0.00)[-0.986];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[u.kleine-koenig@baylibre.com,dri-devel-bounces@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DKIM_TRACE(0.00)[baylibre-com.20230601.gappssmtp.com:+];
	RCPT_COUNT_THREE(0.00)[4];
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: A78CF109A0F
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

