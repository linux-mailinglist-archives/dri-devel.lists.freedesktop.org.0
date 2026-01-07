Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 009D8CFBFFC
	for <lists+dri-devel@lfdr.de>; Wed, 07 Jan 2026 05:43:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A37D310E189;
	Wed,  7 Jan 2026 04:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="L1kMHaML";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B013810E138
 for <dri-devel@lists.freedesktop.org>; Wed,  7 Jan 2026 04:43:20 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2a09757004cso18195075ad.3
 for <dri-devel@lists.freedesktop.org>; Tue, 06 Jan 2026 20:43:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767761000; x=1768365800; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5rLU7DAV9qpUwuBQAOxfbjMQs4IqSMkv9fgfYLMr0Ww=;
 b=L1kMHaMLDhk3/xysoJHQJ15ARvHFoVwv6mX8hD2B0bkfvE9e8/MvskmZC7WBeLx0mb
 y2q3EsOhAF8VaCsuXdSMpcZTKM2duQQsZh/UfLWOp7BXGvdrWhvOxUdfGf8IFjFQmuN+
 qsf5ZlJn88fr0u7x0dvsIZmXwU6kEhTE+QBvMKA7ECqi1nEqEvSgYNzlzeNRaMyvfwem
 HJZoHAnWIuH40Bvku7AS8y3NMZU2vCX3KLvK+8HwNtI8vb98rwrFYNcQRZcyVbG4V2bs
 /Gh0mGL9/nebS59LzUSwvWYeM2dcoyevv3mPmyktYWpqu9Bpi84AhSypkBIXVKzZyVIx
 opjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767761000; x=1768365800;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=5rLU7DAV9qpUwuBQAOxfbjMQs4IqSMkv9fgfYLMr0Ww=;
 b=b6zI0zi2R5u8IZXjD8ej86Iu9gTabhfO3snwb6LwmAWJyeDenTcY1BE+vDS+b0tVuR
 1WasdNRagVXyHd+vbT15F5U8DDeNmLuxXDrMwy78Qk3EYM6xD0GENBiO7X6/GfuVZk0I
 Bkgk8ikAbYsWhzEIqLO9VyQ2Hug1f3Df6cBL2OTxLdayhUE3F8q1guMhNJ7Mr/n64S8I
 7kDABF8z4fXIkcEFAzH9wzPnMPRE1lCTV4y6VDw7eeYHLEJe5v1czyB6/doBDeuoPPL3
 0cmxNRNOsG6XjE8Dvy1+sNdjU/Y3QIR/eDfKQFH7y2Dx3F7ZjCU7QMonR/t4NYoO5+GI
 2gRg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXK+AukG8V+JJNvNGBwa4ZBBcWYG9nJL7YjVXBwdGYO/47EE2D5olW1koJyaG/4eD1rscxJtviqLmg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyuPQfOf1gHxDa0YX72ANP4dUNFyZFwMbBc6i40g+k3On5ZPmLa
 YKR/i9axCvLvI3ilnOEJ8o2G0CM/bNcnL/cBXGO+NCKZnkeYbmXdhVWP
X-Gm-Gg: AY/fxX7g4U+/WnnZ/x7Jyn6aKK3Haj+PbED6KxtCsqzMayBLedz7hGixNE8akwUV5nX
 D40AGQvRNhEZZddm/HxRBtoOiPLQ10pqE1NDRKg9m2VaKmmE7jP8CIlQHk/4xXPFbP/0d/7ojAk
 kW404vieDVwXy9u4QZk7M6SgoJpp7wxYId+03DizvRdGssw9citkYPvYVjQqSj1zGonNHMlsG2/
 hStQTxxCwGl4z/14xJX6SkbwXj4DTAPTFAv91YOtzgC+ajo3xDPbiFO6Ly+S5E24ihelurTw5vA
 NtwoUwkWqupSBepdBRdshDi8MMNXyLCQS3cXHDtmJP5oHjMxuDhiMxQn7coAYjSz8Cub+0vcGhR
 1sRTWMTyPhe9VGCf1WZidz7hiG0OMJECPTPVTNlYodKufw+c8KXtYQOt1pphK3nMncskhK/rWT6
 K/Kg4hKrXWN9QyDs72T8IesdDykdeB49EJhmPMCZuZJJM=
X-Google-Smtp-Source: AGHT+IEc8TO2toWTGIaoXuv5rNAydXLamcJRscYf8Qm/aRVC4j2jXnovQzTTCfCrrqFWoia694nIZA==
X-Received: by 2002:a17:902:e952:b0:29f:2f40:76c4 with SMTP id
 d9443c01a7336-2a3ee48ace2mr10688365ad.34.1767761000170; 
 Tue, 06 Jan 2026 20:43:20 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:d1c8:9d76:637a:6957])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a3e3c39ef2sm36866225ad.14.2026.01.06.20.43.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jan 2026 20:43:19 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v4 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Date: Tue,  6 Jan 2026 20:42:57 -0800
Message-ID: <20260107044258.528624-5-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260107044258.528624-1-chintanlike@gmail.com>
References: <20260107044258.528624-1-chintanlike@gmail.com>
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

The sh_mobile_lcdc driver exposes overlay configuration via sysfs, but the
core driver does not require CONFIG_FB_DEVICE.

Make overlay sysfs optional so that the driver can build and operate
even when FB_DEVICE is disabled. The kernel naturally ignores the
missing attribute group, preserving buildability and type safety.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..5f3a0cd27db3 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1343,14 +1343,17 @@ static DEVICE_ATTR_RW(overlay_mode);
 static DEVICE_ATTR_RW(overlay_position);
 static DEVICE_ATTR_RW(overlay_rop3);
 
-static struct attribute *overlay_sysfs_attrs[] = {
+static struct attribute *overlay_sysfs_attrs[] __maybe_unused = {
 	&dev_attr_overlay_alpha.attr,
 	&dev_attr_overlay_mode.attr,
 	&dev_attr_overlay_position.attr,
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
+
+#ifdef CONFIG_FB_DEVICE
 ATTRIBUTE_GROUPS(overlay_sysfs);
+#endif
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0

