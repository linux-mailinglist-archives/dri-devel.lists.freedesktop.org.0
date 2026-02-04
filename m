Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EFwdEjYOg2k+hAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB67DE3ACB
	for <lists+dri-devel@lfdr.de>; Wed, 04 Feb 2026 10:15:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA1F10E594;
	Wed,  4 Feb 2026 09:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aXPoW2Sb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE5810E589
 for <dri-devel@lists.freedesktop.org>; Wed,  4 Feb 2026 09:15:28 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-4807068eacbso54813925e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 04 Feb 2026 01:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1770196527; x=1770801327;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DVIJCtTMtWwQCW2wYe5bKPfH9ZMqWjUcFGZghQ6tSuE=;
 b=aXPoW2Sbj8fNOZ3DEBKf+LPV2sUvtTYpqF0p1/AQ2vr8z2gm2dwdUHG2/ecXSRPvLc
 M2jZvNSnmUZx4xGjvjiGRcZrnSnWzO3E5yqekW5ppgh7a+lbX8HpP+kju+nhcW3IRer4
 WYQeugmcjFH4baXr3y1+LSivuD1ToIuLSwnDUyraEPdnmTadSkmlHtPphMxubn41D2+m
 K4V4tj/87ihRZ3xUMAI+5HUSPK6u4D+983OqY7erVrf3evr2dqAmx850zrKSPRLPLs3g
 3pYns05w0w6tkVYpsGeePh2KBQNtyhp961pGTrc+nxPEjXjGv3l9DWh8WpfL1dbbIa0X
 P/Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770196527; x=1770801327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=DVIJCtTMtWwQCW2wYe5bKPfH9ZMqWjUcFGZghQ6tSuE=;
 b=fWycw3vpiz6M8ntij0ErhiSuKvSRPOn3gDa1V3nQoIcxX83Bxmhy8HvpppJix0NHz+
 o1nYz9KBOdoo6BZjiY1nmJVracPLDXw3Wj8zCgM2Yj5sgnCdR2YYonyCpqUZpg5a6BVB
 KNLHvvA5ij8eVw+5R5ODDi1q1H9Jq71EZKFlsAJAu8rS2Hjvh8UJqkWi/qfssj5jLbgy
 +M1mS+qXa4qCEI+XsKtk47f/Q39MM92TqMe0o7oGOQFaygLSt/3L4K51URE694M/vBjo
 M1x//v27dFYEoJdP0RDy/U4lDy5tVCecE3IUht3Qe9NwSz/0CNhM4TqEmAhihlT9zj/L
 UX/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWO7PBGA2uLc50ASAteBi2ypHFMNNq/LCsFJRfo/W1rYW4JfqA9Qbwo1kWAEkxkNixuG4nJTzvhyro=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxC58zfm/Yy8uS5J49CQWpO7u/cmUM4LE+V4sLVCAsYUtzdFsxG
 njQcoIqXCqkJMMzJ5/j29kbV5vonxdMfvcoCtDBeofYfWbW36O6W8gU1F4CX7sU3L8s=
X-Gm-Gg: AZuq6aKPpFNPAIBs0MGp0x4witYs3PQsmHYjtACk0UiFzKrXhfCZC9E5APwr0CWV8/B
 DrUbrZKk18/ME4f5S5I0o9+kfoUv0KWRPocv/BLepjUiFgpKf90nQ9cUT4ZrE3ELwrf6oG1OWxH
 8dqT0yh+qWJC0VyZ0LcIAvEbPZR6UIv0Fqx0V9kTdgHiF5Eb60aRJmkCDMFByV6OSwla55p7Nwv
 tx7DOwTjkgpATyR87FSGXaJaTctbCpwBfLr1J/tag5Rm9u2C0pCX3BX1x2kEibHiXfAqAHaDCar
 vMGHY3OiBh3LDRB7+Tqhv15LHkmTpaRXJFVtrHfD672KNuCapcrAmaZJjX3DRk2Hus5GnnPSjwx
 agErpVrlBQKTiBUfdMa5irWEH1alPn4aXFLgYlMnyYrjsUoxvXedqEc1qGhywlKfkcZUHLxvu3S
 Mz41bNxhsQ65CuC4gwnlOXW1KtCwS8jyKWt9Ks1LMZJsMTUBpFusE00/Zj+IVWdvyuck9o0yfaB
 uCDOqxkp3ILrg==
X-Received: by 2002:a05:600c:468b:b0:479:3a86:dc1c with SMTP id
 5b1f17b1804b1-4830e99c72emr29701385e9.36.1770196527057; 
 Wed, 04 Feb 2026 01:15:27 -0800 (PST)
Received: from localhost
 (p200300f65f20eb0470629fa1229c2efb.dip0.t-ipconnect.de.
 [2003:f6:5f20:eb04:7062:9fa1:229c:2efb])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-48310894f18sm44778865e9.13.2026.02.04.01.15.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Feb 2026 01:15:26 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v1 2/3] fbdev: au1100fb: Make driver compilable on non-mips
 platforms
Date: Wed,  4 Feb 2026 10:15:12 +0100
Message-ID: <474eca0c9ecb8a2e610e82922ad22ad7e8ff0b8b.1770196161.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
References: <cover.1770196161.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=2451;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=cPVhSbaKKwE/mVA44liy3bFETtVffod2InS5RMEx/bM=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpgw4km6H91iYpizGBPVphON+1gkIa0V/my2vo9
 /ygVx+d5sqJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaYMOJAAKCRCPgPtYfRL+
 TtfuB/4lTOsl//F0pUN1BEkc63+KXjrQvUVmA3zrlN8WSJ4dZVS3EcYBJbpyy8nGt4A6qCN76P5
 uxBpskZx+8g6nM9BuMPNXHynD+PF/d7C4igOs04MAJ0vGOAuRthbuEgEau3gwayspBt7sowHPyN
 OiVIKBq0EjVKmSa11vFUzP/yVsN5MoN833MWpLMnVSvmRXhJZQClcqbBvngxoHcGLUaxKF8CTaF
 zSQRXWrGCsplOmCHClvEE6QjXyOHjDcmI3vUpueDjYcnrAXMlfyOEb9iQhtmrHPguMyzbV4dXMd
 ReFqlO3wRLd7Hp/tF5uzYp2KfQep/6p1MolYb+qJ/MqQrAU0
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
X-Rspamd-Queue-Id: EB67DE3ACB
X-Rspamd-Action: no action

The header asm/mach-au1x00/au1000.h is unused apart from pulling in
<linux/delay.h> (for mdelay()) and <linux/io.h> (for KSEG1ADDR()). Then
the only platform specific part in the driver is the usage of the KSEG1ADDR
macro, which for the non-mips case can be stubbed.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/fbdev/Kconfig    | 3 ++-
 drivers/video/fbdev/au1100fb.c | 9 +++++++--
 drivers/video/fbdev/au1100fb.h | 2 --
 3 files changed, 9 insertions(+), 5 deletions(-)

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
index 4df470878b42..94514625965b 100644
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
 
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
index 79f4048726f1..8b29e424d017 100644
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

