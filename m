Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 924BE98A2BF
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C2810E43B;
	Mon, 30 Sep 2024 12:37:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="UZ5Zubjb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B562510E431;
 Mon, 30 Sep 2024 12:37:31 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-42ca6ba750eso25842705e9.0; 
 Mon, 30 Sep 2024 05:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699850; x=1728304650; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lz4qKU/YFIFXfB/NpuI+EYoLGmKb2OxmH0ULGfS7UQs=;
 b=UZ5ZubjbakWvZtpuVLPT/pUPSmASj+lLCaQcqbbO7rDH2cjjI18stAtbJyniRQ9061
 +YoxUL54NNrnN4asHaKYcVaMwamg101qaoHyu+c+bGiiFDUkBGXGBDjb5QJZiZJqFpUF
 X+gU4JvVKAQYxVKnD3e1I5TJpTqK0+wZeBSmSuuCI2eur1fbZjBF/dGYHTNV66Zo0ny0
 yA3e3Ug7Ayhy7DgkMnxC/0WH9ZnbbarI5KvgYvsGt8UrbMQXLIBS5ho39x8L9tdwIqRO
 WNHsHkXZgYYtsvF7Jp1fgv/rr+TOdrtT5e/qyREaovvcjG/TPyQPaDNFWGuzC1c4v3HG
 8SWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699850; x=1728304650;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lz4qKU/YFIFXfB/NpuI+EYoLGmKb2OxmH0ULGfS7UQs=;
 b=ETs2DB3BDjKu98Y9bx5TvPacgBLjJbQtm87mrkNfaS7imYDz6fGjViH7QHMUB++Aw/
 JDPsBVJWp7Bb0/mlPCPpimtd0s0t+EI54OilG0vLhpE8jKvBd8pkGfNelK/gTAOQGjw0
 qML6JqOl1WYVAh1YDv6Z3TWJ/W6GdgMeCZynIGayEq6rElIGUt9Bb0MP07IyZgJ7HnrR
 RnajgU/46J5FJL3yfupZw6XAigFC2EWeFpzkfK68WsWeaaExfvOn3Z/D7vO+++tw+a0F
 /BtrqDNbUSawnExuj/vC2LLYT7/CNB6I4SJDBtulGqcScesPxf606N4J9NNqyNmYjHVf
 3tCQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFMWzkU8QaSPvoP5rckJifg1ddYwZi5CRZNtwSvj5R16kpz7HnQE/s5laGCbDjyKhhLzchBAt6SKl5@lists.freedesktop.org,
 AJvYcCUvDfyso8yiZLsLP3S3p8pTyLXDXbeiYJiIXQdoXJ3mGBgrvHRtBmzsTYeQAxM4Yg4mMq2+CaDG3pY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyASP+vHYCFMM+fhz5OuRAtBAcPTQobxw3UDw8gHNDwNIshxAc8
 uiQaG9eGX6CbdNyd2IXnmQTyKRqFwvkHOztj7CmZNnxQq3bb3blM
X-Google-Smtp-Source: AGHT+IEHFojSqPP2AgQGoeK6Tsjuir7GTcIP+p3ReuPc4+U3eJkS8TX9JsgxlIhdOuf0uw7wfeRCPA==
X-Received: by 2002:a05:600c:4592:b0:42c:b377:3f55 with SMTP id
 5b1f17b1804b1-42f521c6035mr89879815e9.3.1727699849850; 
 Mon, 30 Sep 2024 05:37:29 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:29 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v3 16/19] lib/test_scanf: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:27 +0200
Message-ID: <20240930123702.803617-17-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.2
In-Reply-To: <20240930123702.803617-1-ubizjak@gmail.com>
References: <20240930123702.803617-1-ubizjak@gmail.com>
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

Substitute the inclusion of <linux/random.h> header with
<linux/prandom.h> to allow the removal of legacy inclusion
of <linux/prandom.h> from <linux/random.h>.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Acked-by: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Cc: Sergey Senozhatsky <senozhatsky@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/test_scanf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/test_scanf.c b/lib/test_scanf.c
index 7257b1768545..44f8508c9d88 100644
--- a/lib/test_scanf.c
+++ b/lib/test_scanf.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/overflow.h>
 #include <linux/printk.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 #include <linux/slab.h>
 #include <linux/string.h>
 
-- 
2.46.2

