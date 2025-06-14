Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7FFEAD9944
	for <lists+dri-devel@lfdr.de>; Sat, 14 Jun 2025 02:54:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AFB10E602;
	Sat, 14 Jun 2025 00:54:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="jISdNeO7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FC6F10E602
 for <dri-devel@lists.freedesktop.org>; Sat, 14 Jun 2025 00:54:32 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-e81ec95d944so3303409276.1
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Jun 2025 17:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749862472; x=1750467272; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=6IOC5EkqQjku46aq+03ogzTal5jg93JFJeW+nRvKVJ8=;
 b=jISdNeO75Ug+o76mgzgm1YRTMDOr80HtE58wV55qffD9o+Maq8PI9i0BvIkLkNl5ss
 y6D59GfqAD8Bed3a7n4f5qRsnxwYUzAga8QeV3PxJSehRQkvwVydrU3a2BfpB5CWD0fq
 02XSaYRlABeu0uvIgQ5qWnpEJ53u1sQz2VfggLvzAc4lr6oAVPffMNvdWPPFnQm9AITT
 VYyttSbspMdyIbIxDSRGphwiq9tBHm/Y7B9EmL7kh5UD1qIGqJxPGwDIw+EO6PWiHkh2
 CDstKtiL6Zwl5tqkScCvOKloGEGe70raxGcXpNJReNrHc763ZKa5X7y0/7whQztI2TFE
 SwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749862472; x=1750467272;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=6IOC5EkqQjku46aq+03ogzTal5jg93JFJeW+nRvKVJ8=;
 b=s49VEFAaDR/7dtyk6gCgO7yzRJKWSCoOCCh1A5qt56MpHGK6J3zRLVn4rpSPyl28yH
 YcxvM6yRNMy5FzqxQKtEelYrT5lDrUkMKLYsZCbiduBS14ErtLBDFbzDEyDxSJyVugdL
 NutIN65dLu+gvaRhMWaZUQFFQMysEfXnsRaJCh1w2voB2lluh5vkCzgaZ9dHGolj6C1m
 iVCRLHhla/Y/0rpvXvgroBfcRiy9hONSRuY+UuZo5slU2Nl1Cc6pxurRSnOxt+UEv1X2
 nDLU2fJPy0JIjVAlC+PxZMH8pswK8kHAp1croHs0Y/hiK4NzcUcJRDdv2kQCjjHx7ddg
 Nhbg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXAEteO3ssW4ttRT0lpaiy+8mDPn42ZWzCA8NxVmFSKv2gJJ7t1ACb/Gzk1b3nSXPu+hV8GIq7CZA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwbMcsX7GnEgEpTxOsor/lgKP55SGWWTpERmIDeqzkSMhaPyNOe
 5Y/gicpEzEZkYL1W4eBieKWTGQhqpJAE+BPQfZQktgpIL96G75j6Ikqy
X-Gm-Gg: ASbGncuuwMq/XZPtEZ+pix9boIbErJyAi9uWnk6xQkbFKlO7sdhNsK65q3emnLkGuuK
 2Ec/k49EKFK2TOh8BdgsKItXNK4YjZkotlEiinX9J52qBjE9BHmJdkbNGrAwVoBSFUalar4wKia
 TYxifcBDbAgHnlFI2MpweUiHFRwELh2j5PWBrgfxShj92QDp9jYAromSjiZ+FOQhVQ7HdKIocxr
 XM+Y32a8XMZMSct2b0JS7eC50Gg8jaUIbFPA1DxGXAYWE1y+QxRQUx1t2oSEeFpRbyJRTSjCTKJ
 Y6uq0LQZZCztmwsJFa++gTxB15G7cbBAGLCqMxbGe7AOofGSXaIffhxhpaXxeb0BD/O6vzK885j
 TuAfjIp+CRQQ=
X-Google-Smtp-Source: AGHT+IHmyWIVsKa8zlkseIGQ7d+Nzek020p6s1DukOulLA5PqLXiuoVPhpDzKStteb5YmT4RgfC8wQ==
X-Received: by 2002:a05:6902:a06:b0:e81:2ab1:6335 with SMTP id
 3f1490d57ef6-e822abf79famr2419866276.9.1749862471672; 
 Fri, 13 Jun 2025 17:54:31 -0700 (PDT)
Received: from trojai4.cs.purdue.edu ([128.210.0.165])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e820e2be6bcsm1398678276.26.2025.06.13.17.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 17:54:31 -0700 (PDT)
From: Alex Guo <alexguo1023@gmail.com>
To: deller@gmx.de,
	FlorianSchandinat@gmx.de
Cc: alexguo1023@gmail.com, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH] fbdev: via: Fix potential divide by zero
Date: Fri, 13 Jun 2025 20:54:28 -0400
Message-Id: <20250614005428.3112421-1-alexguo1023@gmail.com>
X-Mailer: git-send-email 2.34.1
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

Variable var->pixclock can be set by user. In case it equals to
zero, divide by zero would occur in viafb_dvi_set_mode. Similar
crashes have happened in other fbdev drivers. We fix this by
checking whether 'pixclock' is zero.

Signed-off-by: Alex Guo <alexguo1023@gmail.com>
---
 drivers/video/fbdev/via/dvi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/via/dvi.c b/drivers/video/fbdev/via/dvi.c
index 27990a73bfa3..0ba248b7b360 100644
--- a/drivers/video/fbdev/via/dvi.c
+++ b/drivers/video/fbdev/via/dvi.c
@@ -166,7 +166,7 @@ void viafb_dvi_set_mode(const struct fb_var_screeninfo *var,
 	int maxPixelClock;
 
 	maxPixelClock = viaparinfo->shared->tmds_setting_info.max_pixel_clock;
-	if (maxPixelClock && PICOS2KHZ(var->pixclock) / 1000 > maxPixelClock) {
+	if (maxPixelClock && var->pixclock && PICOS2KHZ(var->pixclock) / 1000 > maxPixelClock) {
 		rb_mode = viafb_get_best_rb_mode(var->xres, var->yres, 60);
 		if (rb_mode)
 			viafb_fill_var_timing_info(&dvi_var, rb_mode);
-- 
2.34.1

