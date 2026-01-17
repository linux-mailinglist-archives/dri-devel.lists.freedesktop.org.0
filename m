Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2B74D38C2E
	for <lists+dri-devel@lfdr.de>; Sat, 17 Jan 2026 05:31:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C15410E07C;
	Sat, 17 Jan 2026 04:31:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jygITZx7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B19010E07C
 for <dri-devel@lists.freedesktop.org>; Sat, 17 Jan 2026 04:31:04 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-81db1530173so1289859b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 16 Jan 2026 20:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768624264; x=1769229064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2w/Q0mSJAiu6YE8Oa45NpmmddauxEQc9oB3CUI6p98s=;
 b=jygITZx7/EA0RXVKEMLV6j3X1EsUkdmwydS4uMAo892QC1US082annrky7QiZx/qKs
 CwexRGIDQgpSMwJm3IDmKpe6cfG7DjeSn0m5IaL/0Ar8CKF+d4A4J1WByQfAvvBiFs1T
 t0G6bKuLNtkrAdTuNfxO1njIkPUAcyPl+unC+zM7rK899a78bK1OBCuTxRu7axBL50X/
 H4iYPVZUCfYMF6c4D93PWziJCwWClFY7JoiK6MvO1/Cq4qjLYiqRxg5sLTT/ZoxlbOSz
 RCxE5wAzwC6qPmhmW9Lp8xSFQRDpH+8ACWb4PTEwtway+ALC3F5R7332jWvbG28W91GS
 918A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768624264; x=1769229064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2w/Q0mSJAiu6YE8Oa45NpmmddauxEQc9oB3CUI6p98s=;
 b=Smtxavzvmmg+7XaR109PWLBuy9DUVCdXNCXWrH+gK+I5Zd8N1XK1v2xRXO2ltCvryx
 wHyNLvDswz7Ow6coa4FsTKqDWEP0KMowKpIAcyHsNEjvu52x2U8M1ZZsrcJOqvWMezlk
 CP3KuKhe/zZwG9b4655KzZYGQDsSzkPkiIedDIiUbk/ompUXtqCI7pOjPBwfL97S2rn8
 teiILXZwhL1RO+5qt8A8a0nTZpJV0GOzwKDH5ZSLzKGjbxM8GEAs7It46HNRu68Vkydx
 fL4YJgWe0bQQ5dSJVQ6eUyu+V6wvLtJjN/RDT4MKR5lBBv3EriINvHIrWBq1+/6+Ik+J
 Bw/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmBliUBy1vKSZp5bHEY2F9u+Aijq7ci5MWFTNyKKZliPI6lfRoAGsTMpqo2Bqn0wfcXjNpJKQnq+c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVFpxbKCw93nZbcykV6kGU7a/QeR1kyNl0lQHdy5footnwLZ4d
 OS3f4DUEAoI1TSaF0QnQwgFiOnqlxO4XCzWajMz6cvlOVTwV6vLFIUlb
X-Gm-Gg: AY/fxX5ztBw4nhdhb73Y/Qr5OCWuLXxYyixF8XchHx0IXPLTdwm4LdbFQQ+D8UhZozO
 wkRpFRvtYN1PPLR7ZXhEy5pkNN/soeHMz9s+2w/IdDWoHkpSLFv0BWgOyfj9Z1SaqBk3vWzGUwI
 J8DD8gqL88f8SHCJYjyuMwHBfN2clXTBj9SvVnwgB+pB/0X5Z6s1I7Qx7c8oYy0aYtA/NNiyA/H
 KQG5X+FzdY0OjZjnykIR4Xz9X9UgXTzoxx8r91tNGsex2Q9Wzr1qsryEgCA2DgXlkJxNjWoyBYP
 eFLf1lG1crXQ5bv1NQp7yAaQ4Zsgz0lUTKNYJzeDAxRnvP+1ZU5hNLL/Mb5X+i2mOAFRLGHOX7q
 7sexUwTSFpxMUqWeo/FZ8/vCeeE76UKQ13kfbFshnudfIaK8LVdufecDr4jaUl5I7uKzfYMWqql
 2go7i1Ud12yLCtuUeyB2qjtBOIThZZEcxM25cSqSjy3f4RhCB8SFf6Qg==
X-Received: by 2002:a05:6a00:2989:b0:81e:af19:34b8 with SMTP id
 d2e1a72fcca58-81fa01e487dmr4740579b3a.43.1768624263888; 
 Fri, 16 Jan 2026 20:31:03 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:26af:b454:d793:29de])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-81fa108b23asm3370159b3a.3.2026.01.16.20.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jan 2026 20:31:03 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v7 2/2] staging: fbtft: Make framebuffer registration message
 debug-only
Date: Fri, 16 Jan 2026 20:29:31 -0800
Message-ID: <20260117042931.6088-2-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260117042931.6088-1-chintanlike@gmail.com>
References: <20260117042931.6088-1-chintanlike@gmail.com>
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

The framebuffer registration message is informational only and not
useful during normal operation. Convert it to debug-level logging to
keep the driver quiet when working correctly.

Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
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

