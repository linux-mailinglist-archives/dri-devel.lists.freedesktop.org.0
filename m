Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KKhoJs3OiGlkwQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D607109A34
	for <lists+dri-devel@lfdr.de>; Sun, 08 Feb 2026 18:58:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47D8610E313;
	Sun,  8 Feb 2026 17:58:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="eaQtqvnF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com
 [209.85.128.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBF9D10E313
 for <dri-devel@lists.freedesktop.org>; Sun,  8 Feb 2026 17:58:34 +0000 (UTC)
Received: by mail-wm1-f45.google.com with SMTP id
 5b1f17b1804b1-4801c2fae63so30076935e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 08 Feb 2026 09:58:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770573513; x=1771178313;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=H9Wo4gV7QlG4gK1tupRVNO3sfYkc311HzUI77D5hLXc=;
 b=eaQtqvnFHsAIBrLH/7Re41eyop/srcUpSUtDAWISqUwOgei+MnBPijb/CgkvM57IEt
 ruMQJM/xo6exRLp+d3n2aQ78k6gBXksNBup4yLRL8OV0PeWYVg+EkGy0B9TlR1a0zQud
 ijPJ8z9yCJOjrTmmL0vs7++fjVcm90lMymdykmsrDkPtvJEiCQDs6iiG7UIqsPKiXaYN
 rrcGAlZgLnCKOBnbVqFmbjLPIoy3VgoT7YkSjUZ/E+vJXKZX9x4IAMjV6XLNUDkshPlS
 GUI1Y2XU+5Eci1tmnOseXJEyFzizSKkuhYXL6hWyR88zvt7GDgHUER6QpeWBhhMBSZtZ
 BhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770573513; x=1771178313;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=H9Wo4gV7QlG4gK1tupRVNO3sfYkc311HzUI77D5hLXc=;
 b=Ic3aYWP++w1n+tcOrurhqiw5a3WqvI5oecUgSQ1GDMpl/Totv56A64u19hzKS78+qr
 9QoZdlpypk9ICBZjJoDX8/hGaAH9OKw/YGOyOVgGiyOyJuvrKfjZnbgbf+m1TxkqKqU+
 VYMOoMbsjfPFlCrN6PsHvE8QKSzU6aBc5u9OlvWVp5KZHAvCyMDgP9GGm82tEj7ZbuSz
 bphu0JrtgYNf376myschr0aFe9ZaJX2yhkVqHNo0jBd1O0JBX4IryAE6EWloTQKHQcg1
 8KGyHJr84jHc+05Isgy2+zIB+JNVT3l7fJ3pUAf7MFkPe/LlUa+46rzQdhCIJW7KbQ7j
 i7yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1GwoMMk7IU+pMBXLHuuSWpCxCz8hiKNv10uvVrysUpRRyF8pbsgre9EJmGElH/HzQdDOXDPzR0lY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMSc5phvJ7SpiDk//GdKh//Ma3KUkjyUgFSwjiYwVhi2oFyvzy
 ftwDKnngqRT7Es35AGJYcueACBBMeg3Y1EuophIzBKVUW06aA/dNa262SzHijcWFRqbuxvcJIU2
 P0ePK
X-Gm-Gg: AZuq6aLiFoWr4RwJbF8chiJJS+1VpYwYZu6ntet5DF+02uBKyqmM24HkNs0mF3u6+KT
 OIPod/EupTAAm2A2HqeYpWrvmjjFJasAtl59T9xqTfmrhhAledyVnE4PK2H/tgdDHr5XFlmTHhY
 0G4QpKw/vf1D9kbKJUsOpDwLXAWEgB8y0C9LwxY0FMzNj3F7dAk5QPDmPhaXveF4mN2Tvjj0dIq
 R376AAt3gyFU29qGnB9cRgUUu/o6NMbCw3KBCHpameLsCo5KTQM62+il1iGwbIfZDtHkZbrJG4d
 NX4AxBaXEoiRrzAOxCAJqriQaB0dQSGCYCiYkO4kVVG6KB8QprRO4VlGeU+/vIHYl7UOFoRew2W
 eKTC4eyHaxstr8EFVnIgkbac4GCRcAaeDuDh6OZRIKesNJ3PqDcGJqxAvi4zG12kOhWTR7Ickhb
 rZAGIyZqJJdCiNSJqdOA4YLObELpc=
X-Received: by 2002:a05:600c:8b2a:b0:480:1d0b:2d15 with SMTP id
 5b1f17b1804b1-4832021d841mr125122475e9.27.1770573513194; 
 Sun, 08 Feb 2026 09:58:33 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4832040a3cesm120516265e9.3.2026.02.08.09.58.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Feb 2026 09:58:32 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v3 5/6] fbdev: au1100fb: Make driver compilable on non-mips
 platforms
Date: Sun,  8 Feb 2026 18:58:02 +0100
Message-ID: <67b7aa0157b9cf5de111ab6b2725d207ec98aae9.1770572936.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
References: <cover.1770572936.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2874;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=SSUSGx6lfA/GqkSQv4Fnk96BPhFxJytdlZm5TSFmJ5s=;
 b=owGbwMvMwMXY3/A7olbonx/jabUkhsyOc1v6TA3nP/CYP/vRu/XRS6q1LFey+UfuZXhit6wpc
 FN27fq9nYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMZAMf+185geblM7rsNdlP
 rJj8QCHHbJpYppavikBIfk/TnBU/TJkzvE3dJ7w+Epdw9uDx745zdv73jBMLjZIrSaz5/Fx5ldr
 0iv3h1S5n+/ZLMj7frtSgtaq5uXNFmo+64ctjKo9ecpe/nvd7hvh2htwfP46zZGmGMZZNstJ6fy
 GJN+H56Y7yx18eqef/se4qEQlW9cjYY8kQ4CVuef/8nv+6LzXF3qh9u3UgTcAx9oPyJuPYoK8i7
 1W+3MzeqOD9QfWAwiL+PC3Rtl280+44S4j/0/7eW3dUdtvCeSWLuDIuM2xdxO76yNtLRejVpBLX
 UotTcd8ZqhJPef3ZLy2zz2vvAw/HB2WmzmvZnHrkzbqLAA==
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre.com:mid,baylibre.com:email,baylibre-com.20230601.gappssmtp.com:dkim]
X-Rspamd-Queue-Id: 3D607109A34
X-Rspamd-Action: no action

The header asm/mach-au1x00/au1000.h is unused apart from pulling in
<linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Then
the only platform specific part in the driver is the usage of the KSEG1ADDR
macro, which for the non-mips case can be stubbed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/Kconfig    |  3 ++-
 drivers/video/fbdev/au1100fb.c | 12 ++++++++++--
 drivers/video/fbdev/au1100fb.h |  2 --
 3 files changed, 12 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/Kconfig b/drivers/video/fbdev/Kconfig
index 45733522ff48..4514c42db9fa 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1345,7 +1345,8 @@ endchoice
 
 config FB_AU1100
 	bool "Au1100 LCD Driver"
-	depends on (FB = y) && MIPS_ALCHEMY
+	depends on FB
+	depends on MIPS_ALCHEMY || COMPILE_TEST
 	select FB_IOMEM_HELPERS
 	help
 	  This is the framebuffer driver for the AMD Au1100 SOC.  It can drive
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index e43687ac74a1..782f70c3a98f 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -42,6 +42,8 @@
  *  675 Mass Ave, Cambridge, MA 02139, USA.
  */
 #include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
@@ -55,12 +57,15 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include <asm/mach-au1x00/au1000.h>
-
 #define DEBUG 0
 
 #include "au1100fb.h"
 
+#if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
+/* This is only defined to be able to compile this driver on non-mips platforms */
+#define KSEG1ADDR(x) (x)
+#endif
+
 #define DRIVER_NAME "au1100fb"
 #define DRIVER_DESC "LCD controller driver for AU1100 processors"
 
@@ -331,7 +336,10 @@ static int au1100fb_fb_mmap(struct fb_info *fbi, struct vm_area_struct *vma)
 
 	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
 
+#ifndef CONFIG_S390
+	/* On s390 pgprot_val() is a function and thus not a lvalue */
 	pgprot_val(vma->vm_page_prot) |= (6 << 9); //CCA=6
+#endif
 
 	return dma_mmap_coherent(fbdev->dev, vma, fbdev->fb_mem, fbdev->fb_phys,
 			fbdev->fb_len);
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index dc53d063fcc3..998328cd16a2 100644
--- a/drivers/video/fbdev/au1100fb.h
+++ b/drivers/video/fbdev/au1100fb.h
@@ -30,8 +30,6 @@
 #ifndef _AU1100LCD_H
 #define _AU1100LCD_H
 
-#include <asm/mach-au1x00/au1000.h>
-
 #define print_err(f, arg...) printk(KERN_ERR DRIVER_NAME ": " f "\n", ## arg)
 #define print_warn(f, arg...) printk(KERN_WARNING DRIVER_NAME ": " f "\n", ## arg)
 #define print_info(f, arg...) printk(KERN_INFO DRIVER_NAME ": " f "\n", ## arg)
-- 
2.47.3

