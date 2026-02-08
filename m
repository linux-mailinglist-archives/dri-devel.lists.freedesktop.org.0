Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YH82NcrOiGlkwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7997E109A1D
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A52F410E311;
	Sun,  8 Feb 2026 17:58:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="AHcRdwJU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AAD5810E310
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:58:30 +0000 (UTC)
Received: by mail-wm1-f42.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so30076495e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770573509; x=1771178309;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jpJytYorM9mJTcd49LEsYiWb3s15L33VFGja9g/bZ4A=;
 b=AHcRdwJUa11RSRs+r0Y5/mIlaRRtbunpkbycbhi262jx4DZd/SgrKRyEJSCzukVGtj
 C8jM7vT533J5MvHxzQeQ33qcJ9H4I/qnhFQuqJKZ2gEIxBRLQ3gkIm5+rPZLUaj5LT09
 UA/AcqGuKBA8t1rwaDpgjqOcBAsbhIfr7amuDwKSCkE6i3hlalbI7eXqpgP6YQSMx6ou
 VSPBE7pnQ+efQQK4xKrXprVsnkT7LB39xffTenvAOPxOIvuRNEHa2ViM8LE7QfeymBrL
 z4BkD/drHZpDsj7oh7dZEJkQ6CxuYiCNzB9LYhe6/CRGcNpz9EWeT12ljJ62lXFFwk3j
 wVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770573509; x=1771178309;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=jpJytYorM9mJTcd49LEsYiWb3s15L33VFGja9g/bZ4A=;
 b=tyPZ4KTpdL63jPIh9VGnoyfmy6Sc7jPJYmHinupMUXeZhW+7WTREaLjeL+SYt8FnVt
 CZUpL77MzW0R2HT0u/I2LududMVcjpJbT/f8/dMM9zEVBVPuFWQFQqgHumEGJn+P+0V5
 Psdjm3F2VewJMSua/ibYyS0t4eGI2rAb73DpZbvzitXh96A1jCOU4hUccDO60Ljt1Zce
 UNH9nTl+Zh9qzCYpnC6dfpHaIqibmo23KynU3RgBBrQW3Fep0sFP1111tMlvHG4wCJW/
 5Mk+/EnADxYPkqT7uVXKDYFfcmb7otayKuNSHGcLv5NYHVmZ1VEWUXO1c92nmbx88fZ+
 9mBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVh1ADxCy5Y1RMzha0GFHTJ1DyFXVfRgQis2KjcwVzwm6jI1Tjs/5l2Tstb42Y5EVwGcmQsVGWKbSc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCIevfB5lFBgfX+oor1Bm2vuENPwz4duWoh37uiyldaXfwUINU
 a0tR/d8d6h3dlZXtOwZpsosIh1aLl3DYhoFhgQpdwSjoz2xBMteKwZ1UUMp7C9HecemA7DTrfwf
 8/dMB
X-Gm-Gg: AZuq6aIWDAoAEWhVpFIs/jaMOvc6svQmUuevPuUmuF2G+zL8yNfJsKAQh7FWQv8I8ds
 SPpwKME8Fq8FhrPU/edBqEA03dErfb5h3h9SZji+jmLOPizm5EHMbWGc0Q+nuH8yHVRs1QF8jQg
 4ho1u0+eOrbZfSeDMBuqDw7sepgWS+Z5HzZG+ek9v1kyFUBe9wcopqzzyCiypjeLQHI7aVDt0lm
 Vt0sDZFqtgHrHEq+BSvrvnCnSaUSFC6oZ8G6NPV2Z3e9HvbLxcgfL3FB4/MWzMZHp3VwMFydMeG
 nqNq16zdGwFXkGBvjce5aJ8J+TtWzxvN8m/Ema55mIZyhFbHlUHBr6BzTpfj+AX7tjf4i54i551
 jWYYDWM23+LQGFJ38vWXiANXUX46aDxRsaWcD7G1OfVZyHfsnJMaAgxVCHTFKlda1KpWkNsFEix
 s2uEUIWx8QofY8QhtlNE6LjVmo2Js=
X-Received: by 2002:a05:600c:628d:b0:480:53ce:45d3 with SMTP id
 5b1f17b1804b1-48320214788mr119643465e9.18.1770573509175; 
 Sun, 08 Feb 2026 09:58:29 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-483203e37f9sm91236845e9.3.2026.02.08.09.58.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:58:28 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/6] fbdev: au1100fb: Use %zu to printk a value of type
 size_t
Date: Sun,  8 Feb 2026 18:58:00 +0100
Message-ID: <3eea98cc14bae12a3ff6c6574971669e15a1f16a.1770572936.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1814;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=ocIYw8RPn2RRPRZclHi+yTA/TG6btbTpOhOuJ2xDv9g=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhsyOc+ufTxLK95ILNE4rFbXamBRk5i+Vd9X5WpKm8jbXs
 98qDwt0MhqzMDByMciKKbLYN67JtKqSi+xc++8yzCBWJpApDFycAjCRuEj2f1r5weckV75jeRkc
 u1AqkMf8TeXp75fdWHgXVZkyZfxsXTLB4tzn6RmSm+ew7Xhc0Pu04md10oqw93XTu6+cfmTzXiJ
 cIFnI1uJef+qTjR8NghkOfn99ouyST0z7IoebiyUNW7buPMiWy91oNt/cM9niXW9eU8LZh7rSlX
 We35h39jg9nMCe3u41N26z8yL7rjdqsr2nH9/tbs7493K/2Gt/E/G9LCvYNU+pHje71VRW0/Km5
 3dL7VqV47yV3Z3J1b8Dn7jcDDPMu883309li4lHSc+xWLaGPdxet9+sztHTmLunouHk6XLRXDa2
 7Iu3U5d0TtXyaTBayP4wMfFciAhP3l7v1g1RrS/do9kA
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 7997E109A1D
X-Rspamd-Action: no action

%zu is the dedicated type for size_t. %d only works on 32bit
architectures where size_t is typedef'd to be unsigned int. (And then
the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over this.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index b1da51683de7..914f371a614c 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -439,7 +439,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->regs = (struct au1100fb_regs*)KSEG1ADDR(fbdev->info.fix.mmio_start);
 
 	print_dbg("Register memory map at %p", fbdev->regs);
-	print_dbg("phys=0x%08x, size=%d", fbdev->regs_phys, fbdev->regs_len);
+	print_dbg("phys=0x%08x, size=%zu", fbdev->regs_phys, fbdev->regs_len);
 
 	c = clk_get(NULL, "lcd_intclk");
 	if (!IS_ERR(c)) {
@@ -456,7 +456,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 					    PAGE_ALIGN(fbdev->fb_len),
 					    &fbdev->fb_phys, GFP_KERNEL);
 	if (!fbdev->fb_mem) {
-		print_err("fail to allocate framebuffer (size: %dK))",
+		print_err("fail to allocate framebuffer (size: %zuK))",
 			  fbdev->fb_len / 1024);
 		return -ENOMEM;
 	}
@@ -465,7 +465,7 @@ static int au1100fb_drv_probe(struct platform_device *dev)
 	fbdev->info.fix.smem_len = fbdev->fb_len;
 
 	print_dbg("Framebuffer memory map at %p", fbdev->fb_mem);
-	print_dbg("phys=0x%08x, size=%dK", fbdev->fb_phys, fbdev->fb_len / 1024);
+	print_dbg("phys=0x%08x, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
 	fbdev->info.var = (struct fb_var_screeninfo) {
-- 
2.47.3

