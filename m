Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GGTKEyrRkWlFnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0402013EC73
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64BA910E1AB;
	Sun, 15 Feb 2026 13:59:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IjfpF0sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 597C910E0D0
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:58:59 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-48336a6e932so13891405e9.3
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163938; x=1771768738;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7rfGoVyH7QzemOXYwDCpxwn3sKTnq0CRHqTEQ4ExGNE=;
 b=IjfpF0sb8Wc6Spy0yUODTPnnXGhsDH4V/v+revc9qgijhZrCa07kWLZJEcj1bVvR7U
 XTUjr/YjZ4qClaDPMxUnY+IQbbPgpq5FmZhckcrEMGyjI/WIc3c4raM9jcSZOB+fBf7c
 njku6Fx/E2Q9Jqso1Fbw3kgz/WxA0cR0wGAiY4NX/R+KdqzUIxiXe8ee4vtZEFxnWLux
 SMnvy7J2garrKEk3V+cwA7ET4gEhNGQFsJov+/UGADJX2HNfq/5LO4SdAoxOX4azsVfw
 ilfsV+uRnyVJRjuQJsMzuohgrMLeDv65OGx+d0K8grchApdpnzK/tRwfDeRsMc8DO3J/
 kjgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163938; x=1771768738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7rfGoVyH7QzemOXYwDCpxwn3sKTnq0CRHqTEQ4ExGNE=;
 b=Dbxh2LUKZzowpqXEUVVqzElFsP0P2pFPNxjH/8CZBPwtySfe5jQR1nfsmewDLYIgcb
 oqcZTkkf9Vm1L/B409fHugWwsdS2iPH5N6/iLFQ7xxNH6cwtnJuHwqWPtijbSnqv2AEF
 0uNrmQNzCjWh53qyNScJCCmKQIhf544qA0Tf0Q6Eo2QX+nf1TRxi2YvTq3VGKGBUOBMb
 IbyZCT2GNOLKSGpUs7TW3xxZbMA4+PmH2Pfo9LFhinkoPyHKpgmLNFmSwVWDBfMaLJLM
 j+Z1kopd94V6mkXhllcqwForpwxp1Wo3EatidmCMDhpDWJSI/8VT0tFFqXrgL1odRXOx
 4NgA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9rAPns8QLmAHaoryetqgkFq7kI9xIihfkQPBhAiHsLZVUC9PhsM/wJb9NEheaivYjaet9nVR0kI8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXlOfv/d6cdN+/k1yZm2ZbqyrHlhE6GwMdDSl/2j1gR/dg3QCJ
 E/UX2eRx9j2+Nk8efvtbWY4hzb9z60SKOCMBGIr3TWiBxx+4sDGdVAy7EU91kDVdhoc=
X-Gm-Gg: AZuq6aID8Bpu4ClXgZ5REXn5yl7LtU58jJZXAhktjZdkVB577E3qf5SUZ5mf4CIHPRp
 UwlqB95nayE0nao9n+m8yRCkzOEbtzS9fYpf8GlpG3zLaEBCKyiELkt3+iMPjcZb6oT1zEJWGzN
 GJ4GpUj9pQPQO1WUiX3RDgs2IlHDfic8PD2siLshCG5wBhU+SKQ4TJihptxQ/1dfd1FDDuwkwmB
 vfTLdJMl70fu5aYcIzsu/0Ju+rU5MIDBPJPMoGP8cwQp+69+sgZzGoRL6rRSRLzb6/EqpX0mVCt
 cESXMfRw/dQHtK0635CxJpvqe50fwRtlme11GVuD+uSeir5f2pcfGJsa9ZZZpbKACLSUVvVD7DD
 ocz8AXv5q0NOGp0m7gCeaaXSc9Ihq/lWjo/U5abBG5SB7SmXhP5xxujhpk5hxWJMVSKKomGoEp+
 n8i3zvjLgPxFtLqDb7d65iabBR1do94HIXfxDZn1k=
X-Received: by 2002:a05:600c:8b61:b0:480:1b65:b744 with SMTP id
 5b1f17b1804b1-48379bf7907mr78962345e9.28.1771163937888; 
 Sun, 15 Feb 2026 05:58:57 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4834d82a4c4sm625296895e9.10.2026.02.15.05.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:58:57 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 3/7] fbdev: au1100fb: Use proper conversion specifiers in
 printk formats
Date: Sun, 15 Feb 2026 14:58:30 +0100
Message-ID: <3e1577c91f4dacb3cc45baf8edeb33a53cfc0c40.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
References: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2019;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=WDPMJYitsaZOczzGc6r7cwWt+IFe7ij1QjyvVhnA2xI=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdEL8OYewHuCfLGaJt5OK1OFr60mmRCF1WWKQ
 VJhHTrsg5yJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHRCwAKCRCPgPtYfRL+
 TmwdB/oCQHyznbHbbHG+wytDWTFDuT+/+1ODskvIRCGnMus9zw96fpJ65J+m9vHSBw41WBWCGiu
 ahUvsPyKc2Qhmf9w//YwFJno25zByYBJy+lEg50OhvMsTqGFhR62p3hCNHEDzsuzUh09Xsx8Oxy
 wf5TkJZ0rWn/Sjia7Crzr+stvGR1NOO9Hm0d8uF6FcYIZybjnqvpV8kNaXnz0tBZg4UuP4i5as+
 gqxEHQ1i8asiNRrKTFmf9s3P0Dc79VAW/dDEEAEfMRbhqyrMTEZQW/G4HGfjgK9hJoHsOE0H9Pm
 zU5e33oc8UZF9ln4kVT6revmaDywiCtajEOoqBJMA4iLfXoG
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
X-Rspamd-Queue-Id: 0402013EC73
X-Rspamd-Action: no action

%zu is the dedicated type for size_t. %d only works on 32bit
architectures where size_t is typedef'd to be unsigned int. (And then
the signedness doesn't fit, but `gcc -Wformat` doesn't stumble over this.
Also the size of dma_addr_t is architecture dependant and it should be
printkd using %pad (and the value passed by reference).

This prepares allowing this driver to be compiled on non-mips platforms.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/au1100fb.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index b1da51683de7..e43687ac74a1 100644
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
+	print_dbg("phys=0x%pad, size=%zuK", &fbdev->fb_phys, fbdev->fb_len / 1024);
 
 	/* load the panel info into the var struct */
 	fbdev->info.var = (struct fb_var_screeninfo) {
-- 
2.47.3

