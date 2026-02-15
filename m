Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wPPUFyvRkWmJnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B8B13EC7A
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 701A310E22C;
	Sun, 15 Feb 2026 13:59:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="ECUZGAOt";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD03010E1AB
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:59:00 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-48371bb515eso25056455e9.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163939; x=1771768739;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EzVzlNC4XTu3TVPShM5UZlmbPCmD3tKnvLjfSl0egiI=;
 b=ECUZGAOtgyRXECOX4JU1ZRK0UlQl0mmDY5PIlNT1xue/dcIla+ZeF8A9bwKYnaZPo3
 9aOloKRF9OuZP4HBkJMHUiC4PclF0STo8DoSGo+xJtVOUMzgPLb53vten6lcWGToThdV
 WeDxV2WKdnb7IsrhDKjiXxkluZSANHB0DI2W8T4O0N/7msrLlLX+oEfvd+lHvyZbHgU2
 R9+oornHvozEU0FLNZNc7uqHz2D1oZqfYUf9r57PpzYUJiT2fSZvtAmQWWaCCygCVJn7
 JkZ7twRt+h2T8Vi9gYINYiJMkw5OMsaMwkukEYswzixXekyO5L6BH7sFtnD352e2Dak/
 E6Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163939; x=1771768739;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=EzVzlNC4XTu3TVPShM5UZlmbPCmD3tKnvLjfSl0egiI=;
 b=Rz5e3Y9KjsrdJKmnqqPvWbJtr2hn/miPTMVIGNOo1I0Bh2pq8I/Fbl7Ru2EwLbNowi
 a0cAnmuPFJdAb9+ZKUObWaWMCnFEOIY+oo4pVIUH5x6wAfzABJx2zDSiusIpEK/pwYX6
 bF1dHyFD216xdT5/jvbSkaSZ1APh9WkxwRvZh1IevMKwe6JLrDcOumumVSZmgqYq43cu
 L3anVjU0pRPkaUR32+TCzkwIdc4rJ3cQNI9NlBEgDnsoesY9b0cyBspjAq/qPQ0bIcz/
 2Q461xKe/Jt/hGyXEdGMzGHO4FKplEOADYpDxTrXuAUWhGsZcBZZriblxV8Job5LXDdu
 BRQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGZMewxusxCUokLck3NvrenMHQNXVfpq1RVS6rcBYPfc3YLx/Cklbu+tOllSLeC8NTN+reJTAgrgs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5ep2QTmXbdQFOMB+KrqJqKufwi0UpOLeUnv7OZrsEuabcCU/z
 LNkyPm9OrDJn27PXdA7JJ1HPlBn/PP2INSijSkdoWlY/oNSa4rWDpVMhEf22Fvq3S5U=
X-Gm-Gg: AZuq6aIG3Cds6PbhaicfCa9Up+hnDonXNhdUXCkkx8i0a+LAEqExOgmfewZ91YgaoFw
 z8nFEOpqo8Zwle6+RH4YGHWCZFN/CUxRY1VzV3Cc/Ut20r7OtT7H0kZGnbTyY1gXHwqqBJjqxkH
 eKDxXK6MXDe+p0X4eZuUkxcaFHIr2VMXdzxpzXeIu06NRfLdNSB6QCL88JAd2hEBakAWK2o4h4s
 2kLM/Ir5CqGXAsJoclAeigmGNwL4kz/qGjRZTy2UZslA530chJwrPXg8cW4PjsiVf4GeNS1EmZM
 remQnRLfu32EpINP6xaNDh3wYtETLbY30gLXngpGsm6lVl9zWF0DnAkGjx906SfxmvABC9FtBv/
 0qdY8ZGAj5Ghseee5GF9/0UFR8csCbVlt0RObqpSRrqGGNmYZ82RsRzXw8kOmQdYVZooPdq5qK2
 YyF0pJgsU/x4mYlDR3TLjS3gsXEqjd
X-Received: by 2002:a05:600c:6206:b0:477:76c2:49c9 with SMTP id
 5b1f17b1804b1-48373a0842fmr112466925e9.2.1771163939167; 
 Sun, 15 Feb 2026 05:58:59 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-4834d7e50casm376592965e9.8.2026.02.15.05.58.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:58:58 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 4/7] fbdev: au1100fb: Make driver compilable on non-mips
 platforms
Date: Sun, 15 Feb 2026 14:58:31 +0100
Message-ID: <27c0747aa4a85e0b4f2dd7c0778784989522599c.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
References: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2878;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=nxLVIAxRrrPCwHxjKDubTojYoY2kHdt0zxcbF7maQAE=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdENjGEY/HsrG2a9fINb/lOMBBSEr3t47f6XX
 iwl7tuqpPuJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHRDQAKCRCPgPtYfRL+
 Ti4AB/9r3BEwD/lbyGDQJpsF+XW7UVYSlS5SgXhoE5J0aknmjxSsiYIeqbVhJhAV14/lKv8uKsn
 9bSSQB2tqGZEM0Eq8q1TzKKfZO2hKEh9jk1eH/HWtbif1pkqChxHzSOVxkjIXnusAq3Q4juc8bt
 Z6AEHS4MjJzGksA7g4ub5akvlQWwQ1JpJ+wJT2w+DNa6GZAYFjkio0Pu8ycsg6nD99xphEAMN3q
 H08z2Bf/cfi/vNIfPE6H7jIybGwiiBE/ZkVN4f0FXrwVJbqvIJvXe7C8ES+HMMwG++tZGXyMKJb
 Bz4gu4JCB7nCHZOgBLf8w5B2wqpT2sX06cmqpeQPBEEU35bc
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
X-Rspamd-Queue-Id: 10B8B13EC7A
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
index 45733522ff48..ac9ac4287c6a 100644
--- a/drivers/video/fbdev/Kconfig
+++ b/drivers/video/fbdev/Kconfig
@@ -1345,7 +1345,8 @@ endchoice
 
 config FB_AU1100
 	bool "Au1100 LCD Driver"
-	depends on (FB = y) && MIPS_ALCHEMY
+	depends on FB = y
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

