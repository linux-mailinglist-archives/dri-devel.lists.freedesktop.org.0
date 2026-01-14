Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B7D1C033
	for <lists+dri-devel@lfdr.de>; Wed, 14 Jan 2026 02:59:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3C6210E59F;
	Wed, 14 Jan 2026 01:59:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="k4gwRTjj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE79C10E5A3
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Jan 2026 01:59:20 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id
 5614622812f47-45c719bb855so184308b6e.1
 for <dri-devel@lists.freedesktop.org>; Tue, 13 Jan 2026 17:59:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1768355960; x=1768960760; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
 b=k4gwRTjjoLIZiBhC8jeLFmDFmf1TJvLoqoLZpJUEzu/qcnM/WE1AyIthpg0Q96R6FD
 jMm9YJeEwBrgEZyULyoNSKYQNU3MQHoseB71A86dxRROoGujlumYVcBL818lInmt1omZ
 CwagLZFn0RcUvFoQ1wCLblKhDhHYJ9l4MIAHXiwPr4CfBprPmgxVVfWqxU0j09w9LwKs
 bRLBUnKa9EuXusuc9H6pPMuBbBHHJpaT2g0vQl/Zu7KVciTCY/BgksjGcqC2HjLQczcg
 Tn5voXh143OUafWyqpOWdYAJ/uWUXZHf3iC2CaKJgeDg7FZqiNKoZBfloMqPOgi+2gFx
 sNrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768355960; x=1768960760;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Elt5R/CoR9iQcckLm+LWmPbMBH4lmPXk70cWipXnli0=;
 b=jccdi1yOwp5zvb8ukg1uVDKoNqWMoIkTIRg0l4MulksWzIe4bUE0BlMFiawFetgAaj
 MHCa0lu8uKXfjGe2SkV8Ysy2UUAm7G76jch0Xtua2BeYwqLJ8g/Bn14rUaF2rYi5weJN
 DBu/O8Fokc0PAaXnideTihIEP+1xL9hm0OYqB4W0MEItWl9m6iwV7wXeK92/Y2XNd8R6
 eXCbztheLYTWuvbWYevXw7TDu3akswSbR80XkFC6y6vj0ZuBUvKwQFR24P1NhKZ/LJlN
 6cKonU/EA8tPeVrYq/MntGFzoM3SyC9/1A2P+CM34boHRVDvl+1zjZfp4OSztB54zNc3
 /saQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUHYvBMQgyJl4HimiRFWWuCoi+Me4kggryxYSRyEZJl9HTzF5qg+bRMTiRztec8S5RXi/uxEFwXM2o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw7Cra2oN7zMtRJMhNXKe45eBZL96lDw3ZZjvF804kDWw3UEP7M
 h1l+vjumfn8XK2GBXljy0dFMmArZvpBrnB8RXNc5nWd0kE1fQSdm0k0To6a4BY5LIq0=
X-Gm-Gg: AY/fxX6My9baF56g5sIe5rZiXtvsO6Ckv0Bli0f6W5h8HjmMBFKtoOex0Pxuk0AbBgb
 PVTh30m6WdD36l2wY49cG8bfW3pPYH9Y/BR86TfYlO/WaDKvVRPXKcDmpZAAUMY0vo9deXfo5zv
 Fq+b9rnX9wJ0WmusNvbNFLo8okuW39jVDAlpybEQ3B3EKg6IyonIFthOg7FqUGbU7PFMsqLK57A
 X5me1SN2IQ9Rg9lplUQaG3eNcgju7BlOWHRh214PkQ0XBHzZBQs1i5V5nggxu38OdgkxaGgZhda
 kiQsvn1rQfqv2jZ5UcAOMx0TS62MGw/OdizIlpnm56LIt+LNQ4p1nZT5aU32i0NQT6rnA7fiYr5
 RywcXWlZ7/KrkTAAsfgmoKva8zbSSaDvekhty5LmSCbJCEeJm3eJp49Uj6zOh3kJd8HvFLDC7+O
 eAN9fzk3AxC7s43Bi6z+iE7c5H27dv//NqMOyt
X-Received: by 2002:a05:6808:f88:b0:43f:7287:a5e3 with SMTP id
 5614622812f47-45c7144e90fmr760158b6e.28.1768355959868; 
 Tue, 13 Jan 2026 17:59:19 -0800 (PST)
Received: from frodo (c-98-38-17-99.hsd1.co.comcast.net. [98.38.17.99])
 by smtp.googlemail.com with ESMTPSA id
 46e09a7af769-7ce478d9c2esm17510187a34.21.2026.01.13.17.59.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jan 2026 17:59:19 -0800 (PST)
From: Jim Cromie <jim.cromie@gmail.com>
To: gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org
Cc: Jim Cromie <jim.cromie@gmail.com>, Jason Baron <jbaron@akamai.com>,
 =?UTF-8?q?=C5=81ukasz=20Bartosik?= <ukaszb@chromium.org>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Bagas Sanjaya <bagasdotme@gmail.com>, Dave Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Petr Mladek <pmladek@suse.com>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-doc@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
 "Liam R. Howlett" <Liam.Howlett@oracle.com>
Subject: [PATCH v8 09/31] dyndbg: tweak pr_fmt to avoid expansion conflicts
Date: Tue, 13 Jan 2026 18:57:25 -0700
Message-ID: <20260114015815.1565725-10-jim.cromie@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114015815.1565725-1-jim.cromie@gmail.com>
References: <20260114015815.1565725-1-jim.cromie@gmail.com>
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

Disambiguate pr_fmt(fmt) arg, by changing it to _FMT_, to avoid naming
confusion with many later macros also using that argname.

no functional change

Reviewed-by: Louis Chauvet <louis.chauvet@bootlin.com>
Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
---
 lib/dynamic_debug.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/dynamic_debug.c b/lib/dynamic_debug.c
index d2ff203d0873..21c1db7e8705 100644
--- a/lib/dynamic_debug.c
+++ b/lib/dynamic_debug.c
@@ -11,7 +11,7 @@
  * Copyright (C) 2013 Du, Changbin <changbin.du@gmail.com>
  */
 
-#define pr_fmt(fmt) "dyndbg: " fmt
+#define pr_fmt(_FMT_) "dyndbg: " _FMT_
 
 #include <linux/kernel.h>
 #include <linux/module.h>
-- 
2.52.0

