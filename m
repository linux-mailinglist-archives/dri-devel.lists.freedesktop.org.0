Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8614CCE8B77
	for <lists+dri-devel@lfdr.de>; Tue, 30 Dec 2025 06:29:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C35F10E80A;
	Tue, 30 Dec 2025 05:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k+FF2fPT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com
 [209.85.214.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1F2E10E807
 for <dri-devel@lists.freedesktop.org>; Tue, 30 Dec 2025 05:29:09 +0000 (UTC)
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-29f2676bb21so129493055ad.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Dec 2025 21:29:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1767072549; x=1767677349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LJqOs0RXEJY8E2s1bb5OeUsv+WqHfc5EFgK5KbB75l4=;
 b=k+FF2fPTyHrXgkYDOYY9IkFsPO9YVQs7XIDYSiwLhrqTOl59RfjwlnBiNHgZgmsqAK
 1rTdhEipMy4wS8SIfgjAWrHwFUBH9WZ60pGYPqpnVA7gbQwlukBconaqEpWzLIM78bEx
 GDquA0VStNaWkbpTVSPsSHJ2+dhIqy3ueleKnreQ6ncLMh0Hy8tga6FSFs9aYA+Cgb2W
 XU4TwVzrvmyDMQRjGBazpIrI78GH0cQ5DXWd4ZtP5IUBxMOPkUQc88C9FBKf5hOiRFqr
 ad4rEnICr6KcNFglOtBFVEoOjo+6WE1a0EOkjbFIAADY9uAwnBD9XcEZJHazOJPh56Ts
 jClg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767072549; x=1767677349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=LJqOs0RXEJY8E2s1bb5OeUsv+WqHfc5EFgK5KbB75l4=;
 b=DnL+gG1yp4/QK7WawE1T8YBEtKQ+KsM+NaZUKU1CiZpEDtUsh6IWwnZag1hN0nZCyB
 FASUI2eIaKhfsrkGcmdXApF6y8Ceiu7wBrqwii0w2lTXePfk80LVEtlYslORfcRLaDqZ
 mqpQJQSKecybUqBLDSZKJUN3U52wUmZOgpxVI7wsBS/Q87SVZIApyTqDOmBGGRcjS2rW
 f4igCVwFIcEfUHkExKU1BikI9N51JxtQsRvZEusBan6nCVgWj3OC/qwRExl5angUpete
 q5cRnY7RtQrrOn+ScuFmWdLci+r5D0uOZeYrPydca+bTpJI+wnxtgS3QzUMusaK0eLz5
 y2Mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1rzEt3KVXyYiwXo9Kc+43lmzxKY2B4rDgojDWaQKcOwovjevKDrRkJzqOrO18bHyNtdL6qd79cZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzBKgNvIQaJxxWtIrnP3q43T8Pl413f8rEOToFULBO4XosA/V+h
 2t9SpdDYfzuq9BghCeSn7oUpFAk2hs0/8fkXphBfT31lqv51TnViGjrB
X-Gm-Gg: AY/fxX73hgh6FN436iofVHYO+Sm/DvEKss4OI6BqSk+Gcrhb8CnTKV5Ow+TLsvBR9/G
 3M8sTjf1d1yE46Lp83TuW/l02TqSp3SLyVBJ7wvICB2k5yW9xDHMKvohcPssdF1DDcHZkAavDuG
 DJdsKOvzsvRuMH0WcR6+iQha1Ncykmug5T2mjs3JEKsFxnHs1Y/P3dUD6ldv8pkokKeZxVuKR7H
 1CgoQa83dvpB6rmNXU7/e4/EVGBjlxAQMAzzzze9YPILncNKoai7pJKe++gNC7iTejNbJiCM7kX
 Qndqx8a/QAxmqIpH2JdLZgM+KoWhPSUwTqEXURsDNPmUqCpYKfFF6ZBWvTiXoSkxl1XsCGxWgei
 vqlq7TpTfdt8HUf9JkjMwXohNE21HhpC5b31mgLwVY+pu6PriBNQQiRAgMHP7E9aF7U79QfFotL
 YOUqRxFbVJHeBoO3KIoAwB5aVtKZHVl1C2vvytD+nQpz9ygZMQwrLk
X-Google-Smtp-Source: AGHT+IHpNTh/+mtzP6KtG3m//yZa/VBoJcww6MwkW4PNCEdqrAaxVfXefkHC54eoavSEs+b2060qpw==
X-Received: by 2002:a17:902:cf08:b0:2a2:ecb6:55ac with SMTP id
 d9443c01a7336-2a2f220cbf6mr374425555ad.7.1767072549441; 
 Mon, 29 Dec 2025 21:29:09 -0800 (PST)
Received: from cmpatel-home.hsd1.or.comcast.net
 ([2601:1c0:5780:9200:f7a0:c2f:d915:faf0])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a2f3c8286esm289290375ad.33.2025.12.29.21.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Dec 2025 21:29:09 -0800 (PST)
From: Chintan Patel <chintanlike@gmail.com>
To: linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev,
 linux-omap@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, andy@kernel.org, deller@gmx.de,
 gregkh@linuxfoundation.org, Chintan Patel <chintanlike@gmail.com>
Subject: [PATCH v3 4/4] fbdev: sh_mobile_lcdc: Make FB_DEVICE dependency
 optional
Date: Mon, 29 Dec 2025 21:28:22 -0800
Message-ID: <20251230052827.4676-5-chintanlike@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251230052827.4676-1-chintanlike@gmail.com>
References: <20251230052827.4676-1-chintanlike@gmail.com>
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

Make sysfs support optional by defining overlay_sysfs_groups conditionally
using PTR_IF(). The driver always sets .dev_groups, and the kernel
naturally skips NULL attribute groups while the code remains buildable
and type-checked.

Suggested-by: Helge Deller <deller@gmx.de>
Signed-off-by: Chintan Patel <chintanlike@gmail.com>
---
 drivers/video/fbdev/sh_mobile_lcdcfb.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/sh_mobile_lcdcfb.c b/drivers/video/fbdev/sh_mobile_lcdcfb.c
index dd950e4ab5ce..cb7ed1ff9165 100644
--- a/drivers/video/fbdev/sh_mobile_lcdcfb.c
+++ b/drivers/video/fbdev/sh_mobile_lcdcfb.c
@@ -1350,7 +1350,17 @@ static struct attribute *overlay_sysfs_attrs[] = {
 	&dev_attr_overlay_rop3.attr,
 	NULL,
 };
-ATTRIBUTE_GROUPS(overlay_sysfs);
+
+#ifdef CONFIG_FB_DEVICE
+static const struct attribute_group overlay_sysfs_group = {
+	.attrs = overlay_sysfs_attrs,
+};
+#endif
+
+static const struct attribute_group *overlay_sysfs_groups[] = {
+	PTR_IF(IS_ENABLED(CONFIG_FB_DEVICE), &overlay_sysfs_group),
+	NULL,
+};
 
 static const struct fb_fix_screeninfo sh_mobile_lcdc_overlay_fix  = {
 	.id =		"SH Mobile LCDC",
-- 
2.43.0

