Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YDo1AzPRkWmJnAEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:15 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF7DC13ECA8
	for <lists+dri-devel@lfdr.de>; Sun, 15 Feb 2026 14:59:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8FA10E362;
	Sun, 15 Feb 2026 13:59:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="GZK/s+3Q";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37D1B10E361
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 13:59:04 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-43767807cf3so1660506f8f.1
 for <dri-devel@lists.freedesktop.org>; Sun, 15 Feb 2026 05:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1771163943; x=1771768743;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ETe11Fo+zPloYnQHKZtmEddQ+sp1yfIlz5aUfvFOGxc=;
 b=GZK/s+3Qf9Ca+ljOBHmhw72qm6YPducvippT/yV+ofkabwVUYHE9twSdqldlmQ/jR9
 r4t/lonQ8SdNx+keMEx7tKxsw8qW0NAJiZ3Ud+ytCYBgBfJLV4xi9Rs/1jDmOl6S/4ig
 g73o0F92/VDKeRhWGLz2GkxN/h9RA8qVd2BwuGMII8hssCZ6J96SzArOXaMeA6ko7f/P
 I8NwLxWsySsTBOktkd/54QDWpaq0hzitbQMTQ9PvV9CKGRgLJUzOXui6RiRoigJH2gHn
 CqF1ibJKpqLQ0f48E4Ew+Wh+HhJ1vSoKv3NvNRHF7vgXuE/1/ptHc5VRtnSwR+ux2kxp
 yGZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771163943; x=1771768743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ETe11Fo+zPloYnQHKZtmEddQ+sp1yfIlz5aUfvFOGxc=;
 b=Jtzbhl+2xQL48KMKp7k/qnpgtshx3hb+9oZwKsIeWFiq1gdzuROlPd5hSAxLn2qZyY
 AF29BEAUodea/gCo821K+OjboLTvgPMlHNpIt73S+N+9RZpzvitt3O4tWce9u4HnzTuL
 n+kLoZCWwUU1BuaYk3GUzKCTdSplhF2XAvUdU0HuL+6x37B2cvUnieoJZziwyuXly6jH
 iMJZ2z8ojkxtDjsi0jTgwjcQPzeEz8GWURntYXYK5I9W0MyEzhxbBpurtMULmtq1/9np
 FlLYdfbvoeAAemFW6MJ9+46VxhdPfCYzSIyVtLUAyvhwucG/0JPbEi9Qeyzyvper0keT
 HMMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2UvbdezU7YvCg3ZWuOaSJuFFZV5NBAN+wbuuwzQNKLIlJlmEA8dyib3iqKNLKLL5BEbVPGmh6X3c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy87jbZ4vIGFEfJcKsDW5t1Mr46jv22zBx2xtlg455NQ1WpVtM8
 H3cmuYRHsoyqgHywPTGpsESqLpIh/NrpTYv0pDNS8rclxg4j7Gmv0EvlZd7W81XeHTU=
X-Gm-Gg: AZuq6aKaWePAROojZTTit0CFbYK+VRUCHLjuBZ4weKLkYFfjpoWzkgx2fdIeVeJOesD
 J2LUWZLlc225kLNC6RKLa4r3ZfW5wqL+v4HmNKOvzZfi+QJQUQGOY7XGxlapcgP8c3g466SvU5y
 N3vrYphskv5VUunc6Jk10k6QybAfO0jxSSzcufLGlenKEM8rQOwS2ogsbKIyqy4N8N8sHjMe0C8
 Pg7jPEv+MJNgFt+WVUKli0re/pBWyCYGs4cgbab33qvfJnUqpw1iaYcFjd0IyQnTh3jgESapkeY
 3dGfhO/H+lTtxWa7F3KCuiVqOrNfSLkiP9d+KdUGVCTY9H/tuJSSH4yOYpwknHanwuERWci+ANB
 h1DdcTvsJ/2Ljl50uQopDhoJhZTA1kHOROz+8MGS8QoWT6P8FKyEJh4q8/N+U95TG6ADQ1PxE7v
 LtqXC92mg+l+67JxifduWQeygPu6nO
X-Received: by 2002:a05:6000:24ca:b0:436:42fb:1537 with SMTP id
 ffacd0b85a97d-4379db25e03mr6303530f8f.8.1771163942586; 
 Sun, 15 Feb 2026 05:59:02 -0800 (PST)
Received: from localhost ([2a02:8071:b783:6940:1d24:d58d:2b65:c291])
 by smtp.gmail.com with UTF8SMTPSA id
 ffacd0b85a97d-43796a6b563sm20034289f8f.12.2026.02.15.05.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Feb 2026 05:59:02 -0800 (PST)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Helge Deller <deller@gmx.de>
Cc: Chen Ni <nichen@iscas.ac.cn>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH v4 6/7] fbdev: au1100fb: Fold au1100fb.h into its only user
Date: Sun, 15 Feb 2026 14:58:33 +0100
Message-ID: <e7fbd64f4dd727174a29349975d3b5598f7f801b.1771163316.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
References: <cover.1771163316.git.u.kleine-koenig@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=29871;
 i=u.kleine-koenig@baylibre.com; h=from:subject:message-id;
 bh=wMXdGPjBGNQ5yUprmmwAEX2Ky2el6sGtOHBx3kT+lY8=;
 b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBpkdES1IqXxEu06DSiSmSimuvT8CZ5YDTLQiPMF
 5ip06hMx1OJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCaZHREgAKCRCPgPtYfRL+
 TkpTB/9XcDXqzBQgWp56a6DeT18GZZTlfm1hNuVMft57ryd8GQOwVr7aBzI+0CVB1A8jO6NPU5C
 y123HD2VhcHzzrPbrx5PBR+jR62XTdeMkCj2w0+RvtwjpWF4ZAU7s2G1d5dQv1PxO5Rv5zkpnfn
 GkDc/EEU2kd5XjcJjc3ECe/23BiBXiavRhVLdS3Qg27AiTJseESeH3ltde5K3bl8Eg9M/TiW8Lr
 8shDZx1l3cGTCax3S02WWrGw6V2DynpEdLE+7gugfEm02iemwfehE+TIWlAh/mroVso12B5qT8C
 nv6haWoFFgr+JgLgqgxnoizBI1aW2Ks3dKgp+5H2+A4mOEXr
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[baylibre-com.20230601.gappssmtp.com:dkim,baylibre.com:mid,baylibre.com:email]
X-Rspamd-Queue-Id: AF7DC13ECA8
X-Rspamd-Action: no action

This gets rid of a header that is only used once. The copyrights and
license specifications are all already covered in the au1100fb.c file.

Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
---
 drivers/video/au1100fb.c       |   0
 drivers/video/fbdev/au1100fb.c | 339 +++++++++++++++++++++++++++++-
 drivers/video/fbdev/au1100fb.h | 372 ---------------------------------
 3 files changed, 338 insertions(+), 373 deletions(-)
 create mode 100644 drivers/video/au1100fb.c
 delete mode 100644 drivers/video/fbdev/au1100fb.h

diff --git a/drivers/video/au1100fb.c b/drivers/video/au1100fb.c
new file mode 100644
index 000000000000..e69de29bb2d1
diff --git a/drivers/video/fbdev/au1100fb.c b/drivers/video/fbdev/au1100fb.c
index 86aafa4f0966..48637863a4f5 100644
--- a/drivers/video/fbdev/au1100fb.c
+++ b/drivers/video/fbdev/au1100fb.c
@@ -60,7 +60,344 @@
 #include <linux/platform_device.h>
 #include <linux/slab.h>
 
-#include "au1100fb.h"
+#if defined(__BIG_ENDIAN)
+#define LCD_CONTROL_DEFAULT_PO LCD_CONTROL_PO_11
+#else
+#define LCD_CONTROL_DEFAULT_PO LCD_CONTROL_PO_00
+#endif
+#define LCD_CONTROL_DEFAULT_SBPPF LCD_CONTROL_SBPPF_565
+
+/********************************************************************/
+
+/* LCD controller restrictions */
+#define AU1100_LCD_MAX_XRES	800
+#define AU1100_LCD_MAX_YRES	600
+#define AU1100_LCD_MAX_BPP	16
+#define AU1100_LCD_MAX_CLK	48000000
+#define AU1100_LCD_NBR_PALETTE_ENTRIES 256
+
+/* Default number of visible screen buffer to allocate */
+#define AU1100FB_NBR_VIDEO_BUFFERS 4
+
+/********************************************************************/
+
+struct au1100fb_panel
+{
+	const char name[25];		/* Full name <vendor>_<model> */
+
+	u32   	control_base;		/* Mode-independent control values */
+	u32	clkcontrol_base;	/* Panel pixclock preferences */
+
+	u32	horztiming;
+	u32	verttiming;
+
+	u32	xres;		/* Maximum horizontal resolution */
+	u32 	yres;		/* Maximum vertical resolution */
+	u32 	bpp;		/* Maximum depth supported */
+};
+
+struct au1100fb_regs
+{
+	u32  lcd_control;
+	u32  lcd_intstatus;
+	u32  lcd_intenable;
+	u32  lcd_horztiming;
+	u32  lcd_verttiming;
+	u32  lcd_clkcontrol;
+	u32  lcd_dmaaddr0;
+	u32  lcd_dmaaddr1;
+	u32  lcd_words;
+	u32  lcd_pwmdiv;
+	u32  lcd_pwmhi;
+	u32  reserved[(0x0400-0x002C)/4];
+	u32  lcd_palettebase[256];
+};
+
+struct au1100fb_device {
+
+	struct fb_info info;			/* FB driver info record */
+
+	struct au1100fb_panel 	*panel;		/* Panel connected to this device */
+
+	struct au1100fb_regs* 	regs;		/* Registers memory map */
+	size_t       		regs_len;
+	unsigned int 		regs_phys;
+
+#ifdef CONFIG_PM
+	/* stores the register values during suspend */
+	struct au1100fb_regs 	pm_regs;
+#endif
+
+	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
+	size_t	      		fb_len;
+	dma_addr_t    		fb_phys;
+	int			panel_idx;
+	struct clk		*lcdclk;
+	struct device		*dev;
+};
+
+/********************************************************************/
+
+#define LCD_CONTROL                (AU1100_LCD_BASE + 0x0)
+  #define LCD_CONTROL_SBB_BIT      21
+  #define LCD_CONTROL_SBB_MASK     (0x3 << LCD_CONTROL_SBB_BIT)
+    #define LCD_CONTROL_SBB_1        (0 << LCD_CONTROL_SBB_BIT)
+    #define LCD_CONTROL_SBB_2        (1 << LCD_CONTROL_SBB_BIT)
+    #define LCD_CONTROL_SBB_3        (2 << LCD_CONTROL_SBB_BIT)
+    #define LCD_CONTROL_SBB_4        (3 << LCD_CONTROL_SBB_BIT)
+  #define LCD_CONTROL_SBPPF_BIT    18
+  #define LCD_CONTROL_SBPPF_MASK   (0x7 << LCD_CONTROL_SBPPF_BIT)
+    #define LCD_CONTROL_SBPPF_655    (0 << LCD_CONTROL_SBPPF_BIT)
+    #define LCD_CONTROL_SBPPF_565    (1 << LCD_CONTROL_SBPPF_BIT)
+    #define LCD_CONTROL_SBPPF_556    (2 << LCD_CONTROL_SBPPF_BIT)
+    #define LCD_CONTROL_SBPPF_1555   (3 << LCD_CONTROL_SBPPF_BIT)
+    #define LCD_CONTROL_SBPPF_5551   (4 << LCD_CONTROL_SBPPF_BIT)
+  #define LCD_CONTROL_WP           (1<<17)
+  #define LCD_CONTROL_WD           (1<<16)
+  #define LCD_CONTROL_C            (1<<15)
+  #define LCD_CONTROL_SM_BIT       13
+  #define LCD_CONTROL_SM_MASK      (0x3 << LCD_CONTROL_SM_BIT)
+    #define LCD_CONTROL_SM_0         (0 << LCD_CONTROL_SM_BIT)
+    #define LCD_CONTROL_SM_90        (1 << LCD_CONTROL_SM_BIT)
+    #define LCD_CONTROL_SM_180       (2 << LCD_CONTROL_SM_BIT)
+    #define LCD_CONTROL_SM_270       (3 << LCD_CONTROL_SM_BIT)
+  #define LCD_CONTROL_DB           (1<<12)
+  #define LCD_CONTROL_CCO          (1<<11)
+  #define LCD_CONTROL_DP           (1<<10)
+  #define LCD_CONTROL_PO_BIT       8
+  #define LCD_CONTROL_PO_MASK      (0x3 << LCD_CONTROL_PO_BIT)
+    #define LCD_CONTROL_PO_00        (0 << LCD_CONTROL_PO_BIT)
+    #define LCD_CONTROL_PO_01        (1 << LCD_CONTROL_PO_BIT)
+    #define LCD_CONTROL_PO_10        (2 << LCD_CONTROL_PO_BIT)
+    #define LCD_CONTROL_PO_11        (3 << LCD_CONTROL_PO_BIT)
+  #define LCD_CONTROL_MPI          (1<<7)
+  #define LCD_CONTROL_PT           (1<<6)
+  #define LCD_CONTROL_PC           (1<<5)
+  #define LCD_CONTROL_BPP_BIT      1
+  #define LCD_CONTROL_BPP_MASK     (0x7 << LCD_CONTROL_BPP_BIT)
+    #define LCD_CONTROL_BPP_1        (0 << LCD_CONTROL_BPP_BIT)
+    #define LCD_CONTROL_BPP_2        (1 << LCD_CONTROL_BPP_BIT)
+    #define LCD_CONTROL_BPP_4        (2 << LCD_CONTROL_BPP_BIT)
+    #define LCD_CONTROL_BPP_8        (3 << LCD_CONTROL_BPP_BIT)
+    #define LCD_CONTROL_BPP_12       (4 << LCD_CONTROL_BPP_BIT)
+    #define LCD_CONTROL_BPP_16       (5 << LCD_CONTROL_BPP_BIT)
+  #define LCD_CONTROL_GO           (1<<0)
+
+#define LCD_INTSTATUS              (AU1100_LCD_BASE + 0x4)
+#define LCD_INTENABLE              (AU1100_LCD_BASE + 0x8)
+  #define LCD_INT_SD               (1<<7)
+  #define LCD_INT_OF               (1<<6)
+  #define LCD_INT_UF               (1<<5)
+  #define LCD_INT_SA               (1<<3)
+  #define LCD_INT_SS               (1<<2)
+  #define LCD_INT_S1               (1<<1)
+  #define LCD_INT_S0               (1<<0)
+
+#define LCD_HORZTIMING             (AU1100_LCD_BASE + 0xC)
+  #define LCD_HORZTIMING_HN2_BIT   24
+  #define LCD_HORZTIMING_HN2_MASK  (0xFF << LCD_HORZTIMING_HN2_BIT)
+  #define LCD_HORZTIMING_HN2_N(N)  ((((N)-1) << LCD_HORZTIMING_HN2_BIT) & LCD_HORZTIMING_HN2_MASK)
+  #define LCD_HORZTIMING_HN1_BIT   16
+  #define LCD_HORZTIMING_HN1_MASK  (0xFF << LCD_HORZTIMING_HN1_BIT)
+  #define LCD_HORZTIMING_HN1_N(N)  ((((N)-1) << LCD_HORZTIMING_HN1_BIT) & LCD_HORZTIMING_HN1_MASK)
+  #define LCD_HORZTIMING_HPW_BIT   10
+  #define LCD_HORZTIMING_HPW_MASK  (0x3F << LCD_HORZTIMING_HPW_BIT)
+  #define LCD_HORZTIMING_HPW_N(N)  ((((N)-1) << LCD_HORZTIMING_HPW_BIT) & LCD_HORZTIMING_HPW_MASK)
+  #define LCD_HORZTIMING_PPL_BIT   0
+  #define LCD_HORZTIMING_PPL_MASK  (0x3FF << LCD_HORZTIMING_PPL_BIT)
+  #define LCD_HORZTIMING_PPL_N(N)  ((((N)-1) << LCD_HORZTIMING_PPL_BIT) & LCD_HORZTIMING_PPL_MASK)
+
+#define LCD_VERTTIMING             (AU1100_LCD_BASE + 0x10)
+  #define LCD_VERTTIMING_VN2_BIT   24
+  #define LCD_VERTTIMING_VN2_MASK  (0xFF << LCD_VERTTIMING_VN2_BIT)
+  #define LCD_VERTTIMING_VN2_N(N)  ((((N)-1) << LCD_VERTTIMING_VN2_BIT) & LCD_VERTTIMING_VN2_MASK)
+  #define LCD_VERTTIMING_VN1_BIT   16
+  #define LCD_VERTTIMING_VN1_MASK  (0xFF << LCD_VERTTIMING_VN1_BIT)
+  #define LCD_VERTTIMING_VN1_N(N)  ((((N)-1) << LCD_VERTTIMING_VN1_BIT) & LCD_VERTTIMING_VN1_MASK)
+  #define LCD_VERTTIMING_VPW_BIT   10
+  #define LCD_VERTTIMING_VPW_MASK  (0x3F << LCD_VERTTIMING_VPW_BIT)
+  #define LCD_VERTTIMING_VPW_N(N)  ((((N)-1) << LCD_VERTTIMING_VPW_BIT) & LCD_VERTTIMING_VPW_MASK)
+  #define LCD_VERTTIMING_LPP_BIT   0
+  #define LCD_VERTTIMING_LPP_MASK  (0x3FF << LCD_VERTTIMING_LPP_BIT)
+  #define LCD_VERTTIMING_LPP_N(N)  ((((N)-1) << LCD_VERTTIMING_LPP_BIT) & LCD_VERTTIMING_LPP_MASK)
+
+#define LCD_CLKCONTROL             (AU1100_LCD_BASE + 0x14)
+  #define LCD_CLKCONTROL_IB        (1<<18)
+  #define LCD_CLKCONTROL_IC        (1<<17)
+  #define LCD_CLKCONTROL_IH        (1<<16)
+  #define LCD_CLKCONTROL_IV        (1<<15)
+  #define LCD_CLKCONTROL_BF_BIT    10
+  #define LCD_CLKCONTROL_BF_MASK   (0x1F << LCD_CLKCONTROL_BF_BIT)
+  #define LCD_CLKCONTROL_BF_N(N)   ((((N)-1) << LCD_CLKCONTROL_BF_BIT) & LCD_CLKCONTROL_BF_MASK)
+  #define LCD_CLKCONTROL_PCD_BIT   0
+  #define LCD_CLKCONTROL_PCD_MASK  (0x3FF << LCD_CLKCONTROL_PCD_BIT)
+  #define LCD_CLKCONTROL_PCD_N(N)  (((N) << LCD_CLKCONTROL_PCD_BIT) & LCD_CLKCONTROL_PCD_MASK)
+
+#define LCD_DMAADDR0               (AU1100_LCD_BASE + 0x18)
+#define LCD_DMAADDR1               (AU1100_LCD_BASE + 0x1C)
+  #define LCD_DMA_SA_BIT           5
+  #define LCD_DMA_SA_MASK          (0x7FFFFFF << LCD_DMA_SA_BIT)
+  #define LCD_DMA_SA_N(N)          ((N) & LCD_DMA_SA_MASK)
+
+#define LCD_WORDS                  (AU1100_LCD_BASE + 0x20)
+  #define LCD_WRD_WRDS_BIT         0
+  #define LCD_WRD_WRDS_MASK        (0xFFFFFFFF << LCD_WRD_WRDS_BIT)
+  #define LCD_WRD_WRDS_N(N)        ((((N)-1) << LCD_WRD_WRDS_BIT) & LCD_WRD_WRDS_MASK)
+
+#define LCD_PWMDIV                 (AU1100_LCD_BASE + 0x24)
+  #define LCD_PWMDIV_EN            (1<<12)
+  #define LCD_PWMDIV_PWMDIV_BIT    0
+  #define LCD_PWMDIV_PWMDIV_MASK   (0xFFF << LCD_PWMDIV_PWMDIV_BIT)
+  #define LCD_PWMDIV_PWMDIV_N(N)   ((((N)-1) << LCD_PWMDIV_PWMDIV_BIT) & LCD_PWMDIV_PWMDIV_MASK)
+
+#define LCD_PWMHI                  (AU1100_LCD_BASE + 0x28)
+  #define LCD_PWMHI_PWMHI1_BIT     12
+  #define LCD_PWMHI_PWMHI1_MASK    (0xFFF << LCD_PWMHI_PWMHI1_BIT)
+  #define LCD_PWMHI_PWMHI1_N(N)    (((N) << LCD_PWMHI_PWMHI1_BIT) & LCD_PWMHI_PWMHI1_MASK)
+  #define LCD_PWMHI_PWMHI0_BIT     0
+  #define LCD_PWMHI_PWMHI0_MASK    (0xFFF << LCD_PWMHI_PWMHI0_BIT)
+  #define LCD_PWMHI_PWMHI0_N(N)    (((N) << LCD_PWMHI_PWMHI0_BIT) & LCD_PWMHI_PWMHI0_MASK)
+
+#define LCD_PALLETTEBASE                (AU1100_LCD_BASE + 0x400)
+  #define LCD_PALLETTE_MONO_MI_BIT      0
+  #define LCD_PALLETTE_MONO_MI_MASK     (0xF << LCD_PALLETTE_MONO_MI_BIT)
+  #define LCD_PALLETTE_MONO_MI_N(N)     (((N)<< LCD_PALLETTE_MONO_MI_BIT) & LCD_PALLETTE_MONO_MI_MASK)
+
+  #define LCD_PALLETTE_COLOR_RI_BIT     8
+  #define LCD_PALLETTE_COLOR_RI_MASK    (0xF << LCD_PALLETTE_COLOR_RI_BIT)
+  #define LCD_PALLETTE_COLOR_RI_N(N)    (((N)<< LCD_PALLETTE_COLOR_RI_BIT) & LCD_PALLETTE_COLOR_RI_MASK)
+  #define LCD_PALLETTE_COLOR_GI_BIT     4
+  #define LCD_PALLETTE_COLOR_GI_MASK    (0xF << LCD_PALLETTE_COLOR_GI_BIT)
+  #define LCD_PALLETTE_COLOR_GI_N(N)    (((N)<< LCD_PALLETTE_COLOR_GI_BIT) & LCD_PALLETTE_COLOR_GI_MASK)
+  #define LCD_PALLETTE_COLOR_BI_BIT     0
+  #define LCD_PALLETTE_COLOR_BI_MASK    (0xF << LCD_PALLETTE_COLOR_BI_BIT)
+  #define LCD_PALLETTE_COLOR_BI_N(N)    (((N)<< LCD_PALLETTE_COLOR_BI_BIT) & LCD_PALLETTE_COLOR_BI_MASK)
+
+  #define LCD_PALLETTE_TFT_DC_BIT       0
+  #define LCD_PALLETTE_TFT_DC_MASK      (0xFFFF << LCD_PALLETTE_TFT_DC_BIT)
+  #define LCD_PALLETTE_TFT_DC_N(N)      (((N)<< LCD_PALLETTE_TFT_DC_BIT) & LCD_PALLETTE_TFT_DC_MASK)
+
+/********************************************************************/
+
+/* List of panels known to work with the AU1100 LCD controller.
+ * To add a new panel, enter the same specifications as the
+ * Generic_TFT one, and MAKE SURE that it doesn't conflicts
+ * with the controller restrictions. Restrictions are:
+ *
+ * STN color panels: max_bpp <= 12
+ * STN mono panels: max_bpp <= 4
+ * TFT panels: max_bpp <= 16
+ * max_xres <= 800
+ * max_yres <= 600
+ */
+static struct au1100fb_panel known_lcd_panels[] =
+{
+	/* 800x600x16bpp CRT */
+	[0] = {
+		.name = "CRT_800x600_16",
+		.xres = 800,
+		.yres = 600,
+		.bpp = 16,
+		.control_base =	0x0004886A |
+			LCD_CONTROL_DEFAULT_PO | LCD_CONTROL_DEFAULT_SBPPF |
+			LCD_CONTROL_BPP_16 | LCD_CONTROL_SBB_4,
+		.clkcontrol_base = 0x00020000,
+		.horztiming = 0x005aff1f,
+		.verttiming = 0x16000e57,
+	},
+	/* just the standard LCD */
+	[1] = {
+		.name = "WWPC LCD",
+		.xres = 240,
+		.yres = 320,
+		.bpp = 16,
+		.control_base = 0x0006806A,
+		.horztiming = 0x0A1010EF,
+		.verttiming = 0x0301013F,
+		.clkcontrol_base = 0x00018001,
+	},
+	/* Sharp 320x240 TFT panel */
+	[2] = {
+		.name = "Sharp_LQ038Q5DR01",
+		.xres = 320,
+		.yres = 240,
+		.bpp = 16,
+		.control_base =
+		( LCD_CONTROL_SBPPF_565
+		| LCD_CONTROL_C
+		| LCD_CONTROL_SM_0
+			| LCD_CONTROL_DEFAULT_PO
+		| LCD_CONTROL_PT
+		| LCD_CONTROL_PC
+		| LCD_CONTROL_BPP_16 ),
+		.horztiming =
+		( LCD_HORZTIMING_HN2_N(8)
+		| LCD_HORZTIMING_HN1_N(60)
+		| LCD_HORZTIMING_HPW_N(12)
+		| LCD_HORZTIMING_PPL_N(320) ),
+		.verttiming =
+		( LCD_VERTTIMING_VN2_N(5)
+		| LCD_VERTTIMING_VN1_N(17)
+		| LCD_VERTTIMING_VPW_N(1)
+		| LCD_VERTTIMING_LPP_N(240) ),
+		.clkcontrol_base = LCD_CLKCONTROL_PCD_N(1),
+	},
+
+	/* Hitachi SP14Q005 and possibly others */
+	[3] = {
+		.name = "Hitachi_SP14Qxxx",
+		.xres = 320,
+		.yres = 240,
+		.bpp = 4,
+		.control_base =
+			( LCD_CONTROL_C
+			| LCD_CONTROL_BPP_4 ),
+		.horztiming =
+			( LCD_HORZTIMING_HN2_N(1)
+			| LCD_HORZTIMING_HN1_N(1)
+			| LCD_HORZTIMING_HPW_N(1)
+			| LCD_HORZTIMING_PPL_N(320) ),
+		.verttiming =
+			( LCD_VERTTIMING_VN2_N(1)
+			| LCD_VERTTIMING_VN1_N(1)
+			| LCD_VERTTIMING_VPW_N(1)
+			| LCD_VERTTIMING_LPP_N(240) ),
+		.clkcontrol_base = LCD_CLKCONTROL_PCD_N(4),
+	},
+
+	/* Generic 640x480 TFT panel */
+	[4] = {
+		.name = "TFT_640x480_16",
+		.xres = 640,
+		.yres = 480,
+		.bpp = 16,
+		.control_base = 0x004806a | LCD_CONTROL_DEFAULT_PO,
+		.horztiming = 0x3434d67f,
+		.verttiming = 0x0e0e39df,
+		.clkcontrol_base = LCD_CLKCONTROL_PCD_N(1),
+	},
+
+	 /* Pb1100 LCDB 640x480 PrimeView TFT panel */
+	[5] = {
+		.name = "PrimeView_640x480_16",
+		.xres = 640,
+		.yres = 480,
+		.bpp = 16,
+		.control_base = 0x0004886a | LCD_CONTROL_DEFAULT_PO,
+		.horztiming = 0x0e4bfe7f,
+		.verttiming = 0x210805df,
+		.clkcontrol_base = 0x00038001,
+	},
+};
+
+/********************************************************************/
+
+/* Inline helpers */
+
+#define panel_is_dual(panel)  (panel->control_base & LCD_CONTROL_DP)
+#define panel_is_active(panel)(panel->control_base & LCD_CONTROL_PT)
+#define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
+#define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
 
 #if defined(CONFIG_COMPILE_TEST) && !defined(CONFIG_MIPS)
 /* This is only defined to be able to compile this driver on non-mips platforms */
diff --git a/drivers/video/fbdev/au1100fb.h b/drivers/video/fbdev/au1100fb.h
deleted file mode 100644
index 9b70208128a8..000000000000
--- a/drivers/video/fbdev/au1100fb.h
+++ /dev/null
@@ -1,372 +0,0 @@
-/*
- * BRIEF MODULE DESCRIPTION
- *	Hardware definitions for the Au1100 LCD controller
- *
- * Copyright 2002 MontaVista Software
- * Copyright 2002 Alchemy Semiconductor
- * Author:	Alchemy Semiconductor, MontaVista Software
- *
- *  This program is free software; you can redistribute	 it and/or modify it
- *  under  the terms of	 the GNU General  Public License as published by the
- *  Free Software Foundation;  either version 2 of the	License, or (at your
- *  option) any later version.
- *
- *  THIS  SOFTWARE  IS PROVIDED	  ``AS	IS'' AND   ANY	EXPRESS OR IMPLIED
- *  WARRANTIES,	  INCLUDING, BUT NOT  LIMITED  TO, THE IMPLIED WARRANTIES OF
- *  MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN
- *  NO	EVENT  SHALL   THE AUTHOR  BE	 LIABLE FOR ANY	  DIRECT, INDIRECT,
- *  INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT
- *  NOT LIMITED	  TO, PROCUREMENT OF  SUBSTITUTE GOODS	OR SERVICES; LOSS OF
- *  USE, DATA,	OR PROFITS; OR	BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON
- *  ANY THEORY OF LIABILITY, WHETHER IN	 CONTRACT, STRICT LIABILITY, OR TORT
- *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF
- *  THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
- *
- *  You should have received a copy of the  GNU General Public License along
- *  with this program; if not, write  to the Free Software Foundation, Inc.,
- *  675 Mass Ave, Cambridge, MA 02139, USA.
- */
-
-#ifndef _AU1100LCD_H
-#define _AU1100LCD_H
-
-#if defined(__BIG_ENDIAN)
-#define LCD_CONTROL_DEFAULT_PO LCD_CONTROL_PO_11
-#else
-#define LCD_CONTROL_DEFAULT_PO LCD_CONTROL_PO_00
-#endif
-#define LCD_CONTROL_DEFAULT_SBPPF LCD_CONTROL_SBPPF_565
-
-/********************************************************************/
-
-/* LCD controller restrictions */
-#define AU1100_LCD_MAX_XRES	800
-#define AU1100_LCD_MAX_YRES	600
-#define AU1100_LCD_MAX_BPP	16
-#define AU1100_LCD_MAX_CLK	48000000
-#define AU1100_LCD_NBR_PALETTE_ENTRIES 256
-
-/* Default number of visible screen buffer to allocate */
-#define AU1100FB_NBR_VIDEO_BUFFERS 4
-
-/********************************************************************/
-
-struct au1100fb_panel
-{
-	const char name[25];		/* Full name <vendor>_<model> */
-
-	u32   	control_base;		/* Mode-independent control values */
-	u32	clkcontrol_base;	/* Panel pixclock preferences */
-
-	u32	horztiming;
-	u32	verttiming;
-
-	u32	xres;		/* Maximum horizontal resolution */
-	u32 	yres;		/* Maximum vertical resolution */
-	u32 	bpp;		/* Maximum depth supported */
-};
-
-struct au1100fb_regs
-{
-	u32  lcd_control;
-	u32  lcd_intstatus;
-	u32  lcd_intenable;
-	u32  lcd_horztiming;
-	u32  lcd_verttiming;
-	u32  lcd_clkcontrol;
-	u32  lcd_dmaaddr0;
-	u32  lcd_dmaaddr1;
-	u32  lcd_words;
-	u32  lcd_pwmdiv;
-	u32  lcd_pwmhi;
-	u32  reserved[(0x0400-0x002C)/4];
-	u32  lcd_palettebase[256];
-};
-
-struct au1100fb_device {
-
-	struct fb_info info;			/* FB driver info record */
-
-	struct au1100fb_panel 	*panel;		/* Panel connected to this device */
-
-	struct au1100fb_regs* 	regs;		/* Registers memory map */
-	size_t       		regs_len;
-	unsigned int 		regs_phys;
-
-#ifdef CONFIG_PM
-	/* stores the register values during suspend */
-	struct au1100fb_regs 	pm_regs;
-#endif
-
-	unsigned char* 		fb_mem;		/* FrameBuffer memory map */
-	size_t	      		fb_len;
-	dma_addr_t    		fb_phys;
-	int			panel_idx;
-	struct clk		*lcdclk;
-	struct device		*dev;
-};
-
-/********************************************************************/
-
-#define LCD_CONTROL                (AU1100_LCD_BASE + 0x0)
-  #define LCD_CONTROL_SBB_BIT      21
-  #define LCD_CONTROL_SBB_MASK     (0x3 << LCD_CONTROL_SBB_BIT)
-    #define LCD_CONTROL_SBB_1        (0 << LCD_CONTROL_SBB_BIT)
-    #define LCD_CONTROL_SBB_2        (1 << LCD_CONTROL_SBB_BIT)
-    #define LCD_CONTROL_SBB_3        (2 << LCD_CONTROL_SBB_BIT)
-    #define LCD_CONTROL_SBB_4        (3 << LCD_CONTROL_SBB_BIT)
-  #define LCD_CONTROL_SBPPF_BIT    18
-  #define LCD_CONTROL_SBPPF_MASK   (0x7 << LCD_CONTROL_SBPPF_BIT)
-    #define LCD_CONTROL_SBPPF_655    (0 << LCD_CONTROL_SBPPF_BIT)
-    #define LCD_CONTROL_SBPPF_565    (1 << LCD_CONTROL_SBPPF_BIT)
-    #define LCD_CONTROL_SBPPF_556    (2 << LCD_CONTROL_SBPPF_BIT)
-    #define LCD_CONTROL_SBPPF_1555   (3 << LCD_CONTROL_SBPPF_BIT)
-    #define LCD_CONTROL_SBPPF_5551   (4 << LCD_CONTROL_SBPPF_BIT)
-  #define LCD_CONTROL_WP           (1<<17)
-  #define LCD_CONTROL_WD           (1<<16)
-  #define LCD_CONTROL_C            (1<<15)
-  #define LCD_CONTROL_SM_BIT       13
-  #define LCD_CONTROL_SM_MASK      (0x3 << LCD_CONTROL_SM_BIT)
-    #define LCD_CONTROL_SM_0         (0 << LCD_CONTROL_SM_BIT)
-    #define LCD_CONTROL_SM_90        (1 << LCD_CONTROL_SM_BIT)
-    #define LCD_CONTROL_SM_180       (2 << LCD_CONTROL_SM_BIT)
-    #define LCD_CONTROL_SM_270       (3 << LCD_CONTROL_SM_BIT)
-  #define LCD_CONTROL_DB           (1<<12)
-  #define LCD_CONTROL_CCO          (1<<11)
-  #define LCD_CONTROL_DP           (1<<10)
-  #define LCD_CONTROL_PO_BIT       8
-  #define LCD_CONTROL_PO_MASK      (0x3 << LCD_CONTROL_PO_BIT)
-    #define LCD_CONTROL_PO_00        (0 << LCD_CONTROL_PO_BIT)
-    #define LCD_CONTROL_PO_01        (1 << LCD_CONTROL_PO_BIT)
-    #define LCD_CONTROL_PO_10        (2 << LCD_CONTROL_PO_BIT)
-    #define LCD_CONTROL_PO_11        (3 << LCD_CONTROL_PO_BIT)
-  #define LCD_CONTROL_MPI          (1<<7)
-  #define LCD_CONTROL_PT           (1<<6)
-  #define LCD_CONTROL_PC           (1<<5)
-  #define LCD_CONTROL_BPP_BIT      1
-  #define LCD_CONTROL_BPP_MASK     (0x7 << LCD_CONTROL_BPP_BIT)
-    #define LCD_CONTROL_BPP_1        (0 << LCD_CONTROL_BPP_BIT)
-    #define LCD_CONTROL_BPP_2        (1 << LCD_CONTROL_BPP_BIT)
-    #define LCD_CONTROL_BPP_4        (2 << LCD_CONTROL_BPP_BIT)
-    #define LCD_CONTROL_BPP_8        (3 << LCD_CONTROL_BPP_BIT)
-    #define LCD_CONTROL_BPP_12       (4 << LCD_CONTROL_BPP_BIT)
-    #define LCD_CONTROL_BPP_16       (5 << LCD_CONTROL_BPP_BIT)
-  #define LCD_CONTROL_GO           (1<<0)
-
-#define LCD_INTSTATUS              (AU1100_LCD_BASE + 0x4)
-#define LCD_INTENABLE              (AU1100_LCD_BASE + 0x8)
-  #define LCD_INT_SD               (1<<7)
-  #define LCD_INT_OF               (1<<6)
-  #define LCD_INT_UF               (1<<5)
-  #define LCD_INT_SA               (1<<3)
-  #define LCD_INT_SS               (1<<2)
-  #define LCD_INT_S1               (1<<1)
-  #define LCD_INT_S0               (1<<0)
-
-#define LCD_HORZTIMING             (AU1100_LCD_BASE + 0xC)
-  #define LCD_HORZTIMING_HN2_BIT   24
-  #define LCD_HORZTIMING_HN2_MASK  (0xFF << LCD_HORZTIMING_HN2_BIT)
-  #define LCD_HORZTIMING_HN2_N(N)  ((((N)-1) << LCD_HORZTIMING_HN2_BIT) & LCD_HORZTIMING_HN2_MASK)
-  #define LCD_HORZTIMING_HN1_BIT   16
-  #define LCD_HORZTIMING_HN1_MASK  (0xFF << LCD_HORZTIMING_HN1_BIT)
-  #define LCD_HORZTIMING_HN1_N(N)  ((((N)-1) << LCD_HORZTIMING_HN1_BIT) & LCD_HORZTIMING_HN1_MASK)
-  #define LCD_HORZTIMING_HPW_BIT   10
-  #define LCD_HORZTIMING_HPW_MASK  (0x3F << LCD_HORZTIMING_HPW_BIT)
-  #define LCD_HORZTIMING_HPW_N(N)  ((((N)-1) << LCD_HORZTIMING_HPW_BIT) & LCD_HORZTIMING_HPW_MASK)
-  #define LCD_HORZTIMING_PPL_BIT   0
-  #define LCD_HORZTIMING_PPL_MASK  (0x3FF << LCD_HORZTIMING_PPL_BIT)
-  #define LCD_HORZTIMING_PPL_N(N)  ((((N)-1) << LCD_HORZTIMING_PPL_BIT) & LCD_HORZTIMING_PPL_MASK)
-
-#define LCD_VERTTIMING             (AU1100_LCD_BASE + 0x10)
-  #define LCD_VERTTIMING_VN2_BIT   24
-  #define LCD_VERTTIMING_VN2_MASK  (0xFF << LCD_VERTTIMING_VN2_BIT)
-  #define LCD_VERTTIMING_VN2_N(N)  ((((N)-1) << LCD_VERTTIMING_VN2_BIT) & LCD_VERTTIMING_VN2_MASK)
-  #define LCD_VERTTIMING_VN1_BIT   16
-  #define LCD_VERTTIMING_VN1_MASK  (0xFF << LCD_VERTTIMING_VN1_BIT)
-  #define LCD_VERTTIMING_VN1_N(N)  ((((N)-1) << LCD_VERTTIMING_VN1_BIT) & LCD_VERTTIMING_VN1_MASK)
-  #define LCD_VERTTIMING_VPW_BIT   10
-  #define LCD_VERTTIMING_VPW_MASK  (0x3F << LCD_VERTTIMING_VPW_BIT)
-  #define LCD_VERTTIMING_VPW_N(N)  ((((N)-1) << LCD_VERTTIMING_VPW_BIT) & LCD_VERTTIMING_VPW_MASK)
-  #define LCD_VERTTIMING_LPP_BIT   0
-  #define LCD_VERTTIMING_LPP_MASK  (0x3FF << LCD_VERTTIMING_LPP_BIT)
-  #define LCD_VERTTIMING_LPP_N(N)  ((((N)-1) << LCD_VERTTIMING_LPP_BIT) & LCD_VERTTIMING_LPP_MASK)
-
-#define LCD_CLKCONTROL             (AU1100_LCD_BASE + 0x14)
-  #define LCD_CLKCONTROL_IB        (1<<18)
-  #define LCD_CLKCONTROL_IC        (1<<17)
-  #define LCD_CLKCONTROL_IH        (1<<16)
-  #define LCD_CLKCONTROL_IV        (1<<15)
-  #define LCD_CLKCONTROL_BF_BIT    10
-  #define LCD_CLKCONTROL_BF_MASK   (0x1F << LCD_CLKCONTROL_BF_BIT)
-  #define LCD_CLKCONTROL_BF_N(N)   ((((N)-1) << LCD_CLKCONTROL_BF_BIT) & LCD_CLKCONTROL_BF_MASK)
-  #define LCD_CLKCONTROL_PCD_BIT   0
-  #define LCD_CLKCONTROL_PCD_MASK  (0x3FF << LCD_CLKCONTROL_PCD_BIT)
-  #define LCD_CLKCONTROL_PCD_N(N)  (((N) << LCD_CLKCONTROL_PCD_BIT) & LCD_CLKCONTROL_PCD_MASK)
-
-#define LCD_DMAADDR0               (AU1100_LCD_BASE + 0x18)
-#define LCD_DMAADDR1               (AU1100_LCD_BASE + 0x1C)
-  #define LCD_DMA_SA_BIT           5
-  #define LCD_DMA_SA_MASK          (0x7FFFFFF << LCD_DMA_SA_BIT)
-  #define LCD_DMA_SA_N(N)          ((N) & LCD_DMA_SA_MASK)
-
-#define LCD_WORDS                  (AU1100_LCD_BASE + 0x20)
-  #define LCD_WRD_WRDS_BIT         0
-  #define LCD_WRD_WRDS_MASK        (0xFFFFFFFF << LCD_WRD_WRDS_BIT)
-  #define LCD_WRD_WRDS_N(N)        ((((N)-1) << LCD_WRD_WRDS_BIT) & LCD_WRD_WRDS_MASK)
-
-#define LCD_PWMDIV                 (AU1100_LCD_BASE + 0x24)
-  #define LCD_PWMDIV_EN            (1<<12)
-  #define LCD_PWMDIV_PWMDIV_BIT    0
-  #define LCD_PWMDIV_PWMDIV_MASK   (0xFFF << LCD_PWMDIV_PWMDIV_BIT)
-  #define LCD_PWMDIV_PWMDIV_N(N)   ((((N)-1) << LCD_PWMDIV_PWMDIV_BIT) & LCD_PWMDIV_PWMDIV_MASK)
-
-#define LCD_PWMHI                  (AU1100_LCD_BASE + 0x28)
-  #define LCD_PWMHI_PWMHI1_BIT     12
-  #define LCD_PWMHI_PWMHI1_MASK    (0xFFF << LCD_PWMHI_PWMHI1_BIT)
-  #define LCD_PWMHI_PWMHI1_N(N)    (((N) << LCD_PWMHI_PWMHI1_BIT) & LCD_PWMHI_PWMHI1_MASK)
-  #define LCD_PWMHI_PWMHI0_BIT     0
-  #define LCD_PWMHI_PWMHI0_MASK    (0xFFF << LCD_PWMHI_PWMHI0_BIT)
-  #define LCD_PWMHI_PWMHI0_N(N)    (((N) << LCD_PWMHI_PWMHI0_BIT) & LCD_PWMHI_PWMHI0_MASK)
-
-#define LCD_PALLETTEBASE                (AU1100_LCD_BASE + 0x400)
-  #define LCD_PALLETTE_MONO_MI_BIT      0
-  #define LCD_PALLETTE_MONO_MI_MASK     (0xF << LCD_PALLETTE_MONO_MI_BIT)
-  #define LCD_PALLETTE_MONO_MI_N(N)     (((N)<< LCD_PALLETTE_MONO_MI_BIT) & LCD_PALLETTE_MONO_MI_MASK)
-
-  #define LCD_PALLETTE_COLOR_RI_BIT     8
-  #define LCD_PALLETTE_COLOR_RI_MASK    (0xF << LCD_PALLETTE_COLOR_RI_BIT)
-  #define LCD_PALLETTE_COLOR_RI_N(N)    (((N)<< LCD_PALLETTE_COLOR_RI_BIT) & LCD_PALLETTE_COLOR_RI_MASK)
-  #define LCD_PALLETTE_COLOR_GI_BIT     4
-  #define LCD_PALLETTE_COLOR_GI_MASK    (0xF << LCD_PALLETTE_COLOR_GI_BIT)
-  #define LCD_PALLETTE_COLOR_GI_N(N)    (((N)<< LCD_PALLETTE_COLOR_GI_BIT) & LCD_PALLETTE_COLOR_GI_MASK)
-  #define LCD_PALLETTE_COLOR_BI_BIT     0
-  #define LCD_PALLETTE_COLOR_BI_MASK    (0xF << LCD_PALLETTE_COLOR_BI_BIT)
-  #define LCD_PALLETTE_COLOR_BI_N(N)    (((N)<< LCD_PALLETTE_COLOR_BI_BIT) & LCD_PALLETTE_COLOR_BI_MASK)
-
-  #define LCD_PALLETTE_TFT_DC_BIT       0
-  #define LCD_PALLETTE_TFT_DC_MASK      (0xFFFF << LCD_PALLETTE_TFT_DC_BIT)
-  #define LCD_PALLETTE_TFT_DC_N(N)      (((N)<< LCD_PALLETTE_TFT_DC_BIT) & LCD_PALLETTE_TFT_DC_MASK)
-
-/********************************************************************/
-
-/* List of panels known to work with the AU1100 LCD controller.
- * To add a new panel, enter the same specifications as the
- * Generic_TFT one, and MAKE SURE that it doesn't conflicts
- * with the controller restrictions. Restrictions are:
- *
- * STN color panels: max_bpp <= 12
- * STN mono panels: max_bpp <= 4
- * TFT panels: max_bpp <= 16
- * max_xres <= 800
- * max_yres <= 600
- */
-static struct au1100fb_panel known_lcd_panels[] =
-{
-	/* 800x600x16bpp CRT */
-	[0] = {
-		.name = "CRT_800x600_16",
-		.xres = 800,
-		.yres = 600,
-		.bpp = 16,
-		.control_base =	0x0004886A |
-			LCD_CONTROL_DEFAULT_PO | LCD_CONTROL_DEFAULT_SBPPF |
-			LCD_CONTROL_BPP_16 | LCD_CONTROL_SBB_4,
-		.clkcontrol_base = 0x00020000,
-		.horztiming = 0x005aff1f,
-		.verttiming = 0x16000e57,
-	},
-	/* just the standard LCD */
-	[1] = {
-		.name = "WWPC LCD",
-		.xres = 240,
-		.yres = 320,
-		.bpp = 16,
-		.control_base = 0x0006806A,
-		.horztiming = 0x0A1010EF,
-		.verttiming = 0x0301013F,
-		.clkcontrol_base = 0x00018001,
-	},
-	/* Sharp 320x240 TFT panel */
-	[2] = {
-		.name = "Sharp_LQ038Q5DR01",
-		.xres = 320,
-		.yres = 240,
-		.bpp = 16,
-		.control_base =
-		( LCD_CONTROL_SBPPF_565
-		| LCD_CONTROL_C
-		| LCD_CONTROL_SM_0
-			| LCD_CONTROL_DEFAULT_PO
-		| LCD_CONTROL_PT
-		| LCD_CONTROL_PC
-		| LCD_CONTROL_BPP_16 ),
-		.horztiming =
-		( LCD_HORZTIMING_HN2_N(8)
-		| LCD_HORZTIMING_HN1_N(60)
-		| LCD_HORZTIMING_HPW_N(12)
-		| LCD_HORZTIMING_PPL_N(320) ),
-		.verttiming =
-		( LCD_VERTTIMING_VN2_N(5)
-		| LCD_VERTTIMING_VN1_N(17)
-		| LCD_VERTTIMING_VPW_N(1)
-		| LCD_VERTTIMING_LPP_N(240) ),
-		.clkcontrol_base = LCD_CLKCONTROL_PCD_N(1),
-	},
-
-	/* Hitachi SP14Q005 and possibly others */
-	[3] = {
-		.name = "Hitachi_SP14Qxxx",
-		.xres = 320,
-		.yres = 240,
-		.bpp = 4,
-		.control_base =
-			( LCD_CONTROL_C
-			| LCD_CONTROL_BPP_4 ),
-		.horztiming =
-			( LCD_HORZTIMING_HN2_N(1)
-			| LCD_HORZTIMING_HN1_N(1)
-			| LCD_HORZTIMING_HPW_N(1)
-			| LCD_HORZTIMING_PPL_N(320) ),
-		.verttiming =
-			( LCD_VERTTIMING_VN2_N(1)
-			| LCD_VERTTIMING_VN1_N(1)
-			| LCD_VERTTIMING_VPW_N(1)
-			| LCD_VERTTIMING_LPP_N(240) ),
-		.clkcontrol_base = LCD_CLKCONTROL_PCD_N(4),
-	},
-
-	/* Generic 640x480 TFT panel */
-	[4] = {
-		.name = "TFT_640x480_16",
-		.xres = 640,
-		.yres = 480,
-		.bpp = 16,
-		.control_base = 0x004806a | LCD_CONTROL_DEFAULT_PO,
-		.horztiming = 0x3434d67f,
-		.verttiming = 0x0e0e39df,
-		.clkcontrol_base = LCD_CLKCONTROL_PCD_N(1),
-	},
-
-	 /* Pb1100 LCDB 640x480 PrimeView TFT panel */
-	[5] = {
-		.name = "PrimeView_640x480_16",
-		.xres = 640,
-		.yres = 480,
-		.bpp = 16,
-		.control_base = 0x0004886a | LCD_CONTROL_DEFAULT_PO,
-		.horztiming = 0x0e4bfe7f,
-		.verttiming = 0x210805df,
-		.clkcontrol_base = 0x00038001,
-	},
-};
-
-/********************************************************************/
-
-/* Inline helpers */
-
-#define panel_is_dual(panel)  (panel->control_base & LCD_CONTROL_DP)
-#define panel_is_active(panel)(panel->control_base & LCD_CONTROL_PT)
-#define panel_is_color(panel) (panel->control_base & LCD_CONTROL_PC)
-#define panel_swap_rgb(panel) (panel->control_base & LCD_CONTROL_CCO)
-
-#endif /* _AU1100LCD_H */
-- 
2.47.3

