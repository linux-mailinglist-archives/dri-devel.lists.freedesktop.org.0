Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UMJaM6GWcWngJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:16:49 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2610A613B6
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54E6810E8E6;
	Thu, 22 Jan 2026 03:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="T9En1OKq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com
 [209.85.214.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8709F10E8DE
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 03:16:45 +0000 (UTC)
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-2a743050256so2954045ad.3
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 19:16:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769051805; x=1769656605; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=GfgKMmP8DcncE4pa4cHunaIBJ+0sSublRL5+ZWYWWN8=;
 b=T9En1OKqrhtkQNcpXz2ygYDsyNuxKxgXMoaZ8qlvNmDD1ANqZ4HLZ46rooRE34mdCh
 1QEcOcZtm6u+2KP0asRajBsnHIdEhj68CNtMqS9rErzRLNM6Z+yvMRvOA4o41yVRs0tg
 OepaV8u52Ruq5D3sYUS6uhi+ZKzcbz68OmR8URSbCTKfkfnw4w8h+j+Xw8ML/njka6+R
 gXomGX/yJKu/0hfB5Ufb0zIoxp3rd1FXbmv8rdmn6GwlvO32UnLWo4GpKciotRLmh8e8
 RenytCSZvKmHxISPPITtQXV2ujdt87GVgaHbCITjMmQ0HcdJglOPHDOAuqGDPlarXm7D
 nvdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769051805; x=1769656605;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GfgKMmP8DcncE4pa4cHunaIBJ+0sSublRL5+ZWYWWN8=;
 b=uPzx4r/fR5BMzgCTnC4eLEozmWp/Cj8IvKFP0HtOukfI/aLenOncyXMB423GGdH52H
 396QR7GBpHaX2phYrpjJN3z5WlvUX8WeWaTlCYpZp3+sktFlG90W1n+Hh6OHljKHKPDj
 GllAagM4HxB2utxTHu10xVbco1rrvmf3gbWLsohRApDDmz766DyUf1DH8iSzh9n450g8
 jVb9RIgx4LeRtiYK4f3jpxLTkWHHTNBmxLcukpEsTgwzLlybGNl84wOsctURwSpMhbl7
 0580BSrlDiqg+UWyPilVvwyNF9P3vbwuAXdkwhwdRCClXCPk0F12gnomy0LdL76tf62e
 8zVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHn6xp1H/uK1fGmKAVYMlqFpNdbm03n7YcVx7G9F0bP18aGWm22GIiOMYqOCPiDTjqeJFd+1R3A6M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwpIwaRuUu803rdgxdxDJN6/KRHVLjfQTQcuTW5+w4nDlbOaMYc
 INo2qGraq3qQ/iCVnEhO0uyRVg0HiURPNiH1jcxkedmKU00yr42RY6LY
X-Gm-Gg: AZuq6aKh/73PPBToI9lUC03PKiNkSFC63TsElpNqc/vQgt6BO+VUlxKZgW4arZacZoI
 gvHpdl4O4w//3EsqbXlYeGhuuSxiTLvLJrkuHHTWjns8Jns1GyumjxudBBpK+6rRlwzuJhHKjty
 dT1v98sfjonfxk1+4KPv0HwtB8IC85j3yn4J4mcI7193dbSnTldhzhX5YNiCD+bBW/NWWj83VDt
 WrI6ZGP0DRBJlE1KkKV5P86VwfuhL/hFx++q4agUSHPZ7NIsPNSo3FWBclKxaTbjSuiDFAy6mIL
 GtBGgbp/0JCehmlWSVQjtvENwTw2ygHbhyqFy+YS3iXVuOijKZae/M2OASkkysZlhjPgAM4USce
 GijIy7XqtWS92oX5q9xZimXoEVc5Odl4WJxLNVLkViRvO0hFXJtpjTzSzwia+VYnwAg7K06q+Dj
 z5ZGUrGwXUOh0DIRuWSES02oqsXXRhTjOglNbnkGO7oAQ=
X-Received: by 2002:a17:902:cf41:b0:29e:fd60:2cf9 with SMTP id
 d9443c01a7336-2a76b169703mr73811165ad.54.1769051804927; 
 Wed, 21 Jan 2026 19:16:44 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5396:967a:93dd:83bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a719412d38sm155966625ad.87.2026.01.21.19.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 19:16:44 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
 kernel test robot <lkp@intel.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v8 1/2] staging: fbtft: Fix build failure when
 CONFIG_FB_DEVICE=n
Date: Wed, 21 Jan 2026 19:16:34 -0800
Message-ID: <20260122031635.11414-1-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
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
X-Spamd-Result: default: False [0.19 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:andy@kernel.org,m:deller@gmx.de,m:gregkh@linuxfoundation.org,m:chintanlike@gmail.com,m:lkp@intel.com,m:andriy.shevchenko@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCPT_COUNT_TWELVE(0.00)[12];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,kernel.org,gmx.de,linuxfoundation.org,gmail.com,intel.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FORGED_SENDER_MAILLIST(0.00)[]
X-Rspamd-Queue-Id: 2610A613B6
X-Rspamd-Action: no action

When CONFIG_FB_DEVICE is disabled, struct fb_info does
not provide a valid dev pointer. Direct dereferences of
fb_info->dev therefore result in build failures.

Fix this by avoiding direct accesses to fb_info->dev and
switching the affected debug logging to framebuffer helpers
that do not rely on a device pointer.

This fixes the following build failure reported by the
kernel test robot.

Fixes: a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202601110740.Y9XK5HtN-lkp@intel.com
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v8:
- Add Reviewed-by tag from Andy Shevchenko.

Changes in v7:
- Split logging cleanups into a separate patch
- Limit this patch to the CONFIG_FB_DEVICE=n build fix only

Changes in v6:
- Switch debug/info logging to fb_dbg() and fb_info()(suggested by Thomas Zimmermann)
- Drop dev_of_fbinfo() usage in favor of framebuffer helpers that implicitly
  handle the debug/info context.
- Drop __func__ usage per review feedback(suggested by greg k-h)
- Add Fixes tag for a06d03f9f238 ("staging: fbtft: Make FB_DEVICE dependency optional")
  (suggested by Andy Shevchenko)

Changes in v5:
- Initial attempt to replace info->dev accesses using
  dev_of_fbinfo() helper

 drivers/staging/fbtft/fbtft-core.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 8a5ccc8ae0a1..1b3b62950205 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -365,9 +365,9 @@ static int fbtft_fb_setcolreg(unsigned int regno, unsigned int red,
 	unsigned int val;
 	int ret = 1;
 
-	dev_dbg(info->dev,
-		"%s(regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X)\n",
-		__func__, regno, red, green, blue, transp);
+	fb_dbg(info,
+	       "regno=%u, red=0x%X, green=0x%X, blue=0x%X, trans=0x%X\n",
+	       regno, red, green, blue, transp);
 
 	switch (info->fix.visual) {
 	case FB_VISUAL_TRUECOLOR:
@@ -391,8 +391,7 @@ static int fbtft_fb_blank(int blank, struct fb_info *info)
 	struct fbtft_par *par = info->par;
 	int ret = -EINVAL;
 
-	dev_dbg(info->dev, "%s(blank=%d)\n",
-		__func__, blank);
+	fb_dbg(info, "blank=%d\n", blank);
 
 	if (!par->fbtftops.blank)
 		return ret;
@@ -793,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	dev_info(fb_info->dev,
-		 "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		 fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		 fb_info->fix.smem_len >> 10, text1,
-		 HZ / fb_info->fbdefio->delay, text2);
+	fb_info(fb_info,
+		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+		fb_info->fix.smem_len >> 10, text1,
+		HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

