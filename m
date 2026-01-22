Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EOH9JKSWcWngJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:16:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F165E613BF
	for <lists+dri-devel@lfdr.de>; Thu, 22 Jan 2026 04:16:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2823310E8D5;
	Thu, 22 Jan 2026 03:16:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="dOgbmdZV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3822B10E8DD
 for <dri-devel@lists.freedesktop.org>; Thu, 22 Jan 2026 03:16:48 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-2a79998d35aso3451705ad.0
 for <dri-devel@lists.freedesktop.org>; Wed, 21 Jan 2026 19:16:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1769051808; x=1769656608; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nWQboeoR7+6YsMwaf3C2xb3O23tU5oXeb/k98XP/HFY=;
 b=dOgbmdZVJcPhYVzbQ2mqK+kQ0FWRFo5L05/iMMz4VWoXLfqLU/08r6KmgLdbAlYZHo
 lrBKzlyykV+iby7M2CH/mGyWHDKlY8FX4MBrSpr5LQ5g7e77UnIXFgPgZGNO8whWQFPQ
 6QljzN9Ca/h60GKnIdLklVj29F3af0+34nADyISwSUJIFZRleVeaeZEvCctUN4UVC9eL
 ++EZZtmiBAoRmCtRAd3Go75715t9HKbPQFtdRHnZpJdJ4i5/5bFiTTRPlxUJsSHEkNBg
 dAagEY/5cnTBUZxKRS43xZHnVxq1jZkbPCQYvfJVZ/Wd7ZCK9I4TzFMc5e2NVSFMVqb/
 IiEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769051808; x=1769656608;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=nWQboeoR7+6YsMwaf3C2xb3O23tU5oXeb/k98XP/HFY=;
 b=swqWDWdtS9Op2FaIfS59yT0/nBbIcJOK99W8GGy8gxnNltfFd+nVEDHkGddoa9qNbx
 9tdqAAnOnWK1J9EJM34d23fob5I4MTg9yxGWqEHp+iLyYAMHVBD7XNWavTwbwFGcZumO
 N7Q2tz6EAwovg/etHGatFkkyFJSnAJ/cqciKJDeZpEdM6D+RMcepGB5Abvo/qsOxnqz8
 GssVuaLxBQUOhJtkY65pCqB4ynLbLZBA4u1yQ5LzGLLTjR9imJUYNvh5vx144A19VNQr
 lpHhNTLtQC1tVr0RE+hUQDqJ+2/YjtU+bn1R9hOuOgumb5JJ+6St9nyy0yScLVjKrUQI
 Efcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXRv4lOXBQun4h1GSK7ToemzQ03/euBXyGlaCSmqPb+k2UOSOQH9gd+5zkPyVMwxHBJ4dQhuYalAlg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQhDjsm+QKMTXAO8XdMzktwiYF6w5jIVVR3LGVlhqTuHPlayVQ
 Q7H7lP6Xx2O5bdCm+M5e0BRhfWt6Ce9fUrfls/9jpaaqBdDb6qBW2B6a
X-Gm-Gg: AZuq6aJvEDfFrr7o3kA8Zuq7sv7FOxMo7iZkL4czgiCRwDYXVh1M5U8eIlXoynEBfQY
 ahZszdEPPFRboFSq+gvLOfSY87QDbZurFNvzJhfvW4JJ9Cdzf9qbe2YsDsTMHm+pf007/TVyCmR
 ojvrG2cS2VkhNKPKcFSvJFrkY305B3bjcpvWYbpBf0DA1x/Qj1qOJeKsCWYlXtshmqUAnmGRKwq
 Z7uHnR08zfjILsuJNFRVSIWM9FAQo8CAj9QH/5+8xLf6wOfD7enTCjUhsp6eAChNBIBFai6Y/UZ
 uHn79zlVszEWYINxNXmBPLFy3IdbuDlBNMwd1AopEmglfZX19magG76QoHMWIiRikP026GwfmeK
 QbsPeo27GwfX9foKXIOeJF4e+87xGcUmXXOmmYBW8rBJjUh6QkubX/VQHWP1KSV7j7Mf17WP69p
 yHDMFlJqM01PWk9HltWtOIGmxqNJX/niTwHZrYGXgq5wQ=
X-Received: by 2002:a17:902:e80f:b0:2a7:682b:50af with SMTP id
 d9443c01a7336-2a7682b521bmr74186085ad.40.1769051807610; 
 Wed, 21 Jan 2026 19:16:47 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:5396:967a:93dd:83bd])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a719412d38sm155966625ad.87.2026.01.21.19.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jan 2026 19:16:47 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>,
 Andy Shevchenko <andriy.shevchenko@intel.com>
Subject: [PATCH v8 2/2] staging: fbtft: Make framebuffer registration message
 debug-only
Date: Wed, 21 Jan 2026 19:16:35 -0800
Message-ID: <20260122031635.11414-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260122031635.11414-1-chintanlike@gmail.com>
References: <20260122031635.11414-1-chintanlike@gmail.com>
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-fbdev@vger.kernel.org,m:linux-staging@lists.linux.dev,m:linux-omap@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:tzimmermann@suse.de,m:andy@kernel.org,m:deller@gmx.de,m:gregkh@linuxfoundation.org,m:chintanlike@gmail.com,m:andriy.shevchenko@intel.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_FROM(0.00)[gmail.com];
	FORGED_SENDER(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[chintanlike@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.freedesktop.org,suse.de,kernel.org,gmx.de,linuxfoundation.org,gmail.com,intel.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	FROM_HAS_DN(0.00)[]
X-Rspamd-Queue-Id: F165E613BF
X-Rspamd-Action: no action

The framebuffer registration message is informational only and not
useful during normal operation. Convert it to debug-level logging to
keep the driver quiet when working correctly.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>

---
Changes in v8:
- Add Reviewed-by tag from Andy Shevchenko
- Add Suggested-by tag from Greg Kroah-Hartman

 drivers/staging/fbtft/fbtft-core.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/staging/fbtft/fbtft-core.c b/drivers/staging/fbtft/fbtft-core.c
index 1b3b62950205..f427c0914907 100644
--- a/drivers/staging/fbtft/fbtft-core.c
+++ b/drivers/staging/fbtft/fbtft-core.c
@@ -792,11 +792,11 @@ int fbtft_register_framebuffer(struct fb_info *fb_info)
 	if (spi)
 		sprintf(text2, ", spi%d.%d at %d MHz", spi->controller->bus_num,
 			spi_get_chipselect(spi, 0), spi->max_speed_hz / 1000000);
-	fb_info(fb_info,
-		"%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
-		fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
-		fb_info->fix.smem_len >> 10, text1,
-		HZ / fb_info->fbdefio->delay, text2);
+	fb_dbg(fb_info,
+	       "%s frame buffer, %dx%d, %d KiB video memory%s, fps=%lu%s\n",
+	       fb_info->fix.id, fb_info->var.xres, fb_info->var.yres,
+	       fb_info->fix.smem_len >> 10, text1,
+	       HZ / fb_info->fbdefio->delay, text2);
 
 	/* Turn on backlight if available */
 	if (fb_info->bl_dev) {
-- 
2.43.0

