Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YFdDLSB1gGnU8QIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:57:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 608C7CA580
	for <lists+dri-devel@lfdr.de>; Mon, 02 Feb 2026 10:57:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B671010E3CD;
	Mon,  2 Feb 2026 09:57:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="OTloF83+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F211D10E3C9
 for <dri-devel@lists.freedesktop.org>; Mon,  2 Feb 2026 09:57:49 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 6E4B6435C7;
 Mon,  2 Feb 2026 09:57:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1BEFDC116C6;
 Mon,  2 Feb 2026 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1770026269;
 bh=AkL7o0Wfw7iHssc02m/M4/4sZ3UaU2Dt9iL/rr6LdKE=;
 h=From:To:Cc:Subject:Date:From;
 b=OTloF83+Tj4wg4wWmrmdfDbFCpbyfYyWlXRhixx9hraDlWC/KUpnFqDW3JnUfOIHK
 ujDFeyEZZRGBfKp6t8GPdrrUF/jwtXoTpuEgqGO9jVjz+38ski1sjIlH+uBjfFPmZE
 pV8OVQXdo9sZ8kRMUMrfArN5Y8awQeCgR42uLn2iC641t38WPWrnXW8KgEGYgx0NPX
 lfREMIBjs18NB7d5M8L0j8Orcjo/wpV7HYjTk34KkTcxzGvwVL0b6ZZTlK/7ts8Fuu
 nQq04lGMbtx9WN9QJHNXjUqVki6ufB9We0LZHRSAVX8SHmKutHP4CfEgpzewOSbTC+
 t6sktPhNb1W/A==
From: Arnd Bergmann <arnd@kernel.org>
To: Andy Shevchenko <andy@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Noralf Tronnes <notro@tronnes.org>, Helge Deller <deller@gmx.de>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Chintan Patel <chintanlike@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Abdun Nihaal <abdun.nihaal@gmail.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 Jianglei Nie <niejianglei2021@163.com>, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: [PATCH] staging: fbtft: fix dev_info() device arguments
Date: Mon,  2 Feb 2026 10:57:37 +0100
Message-Id: <20260202095743.1309162-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
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
X-Spamd-Result: default: False [1.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:andy@kernel.org,m:gregkh@linuxfoundation.org,m:thomas.petazzoni@free-electrons.com,m:notro@tronnes.org,m:deller@gmx.de,m:tzimmermann@suse.de,m:chintanlike@gmail.com,m:arnd@arndb.de,m:abdun.nihaal@gmail.com,m:dan.carpenter@linaro.org,m:willy@infradead.org,m:niejianglei2021@163.com,m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:abdunnihaal@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	RCPT_COUNT_TWELVE(0.00)[16];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[kernel.org,linuxfoundation.org,free-electrons.com,tronnes.org,gmx.de,suse.de,gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[arndb.de,gmail.com,linaro.org,infradead.org,163.com,lists.freedesktop.org,vger.kernel.org,lists.linux.dev];
	FROM_NEQ_ENVFROM(0.00)[arnd@kernel.org,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 608C7CA580
X-Rspamd-Action: no action

From: Arnd Bergmann <arnd@arndb.de>

When CONFIG_FB_DEVICE is disabled, the fbtft driver fails to
build with:

In file included from include/linux/device.h:15,
                 from drivers/staging/fbtft/fbtft-core.c:18:
drivers/staging/fbtft/fbtft-core.c: In function 'fbtft_fb_setcolreg':
drivers/staging/fbtft/fbtft-core.c:368:21: error: 'struct fb_info' has no member named 'dev'
  368 |         dev_dbg(info->dev,
drivers/staging/fbtft/fbtft-core.c:394:21: error: 'struct fb_info' has no member named 'dev'
  394 |         dev_dbg(info->dev, "%s(blank=%d)\n",
drivers/staging/fbtft/fbtft-core.c:796:25: error: 'struct fb_info' has no member named 'dev'
  796 |         dev_info(fb_info->dev,
drivers/staging/fbtft/fbtft-core.c:796:9: note: in expansion of macro 'dev_info'
  796 |         dev_info(fb_info->dev,

Use fb_info->device instead of fb_info->dev here, which appears
to be what was intended in the first place.

Fixes: c296d5f9957c ("staging: fbtft: core support")
Fixes: bc9f9cb85a7d ("staging: fbtft: Make FB_DEVICE dependency optional")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/staging/fbtft/fbtft-core.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 15affe6f1537..41326b1df733 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,7 +365,7 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
-	dev_dbg(info->dev,
+	dev_dbg(info->device,
 		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
 		__func__, regno, red, green, blue, transp);
 
@@ -391,7 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
+	dev_dbg(info->device, "%s(blank=%d)\n",
 		__func__, blank);
 
 	if (!par->fbtftops.blank)
@@ -793,7 +793,7 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
+	dev_info(fb_info->device,
 		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
 		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
 		 fb_info->fix.smem_len >> 10, text1,
-- 
2.39.5

