Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B20D97107E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00E2C10E315;
	Mon,  9 Sep 2024 07:57:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="NuJgTpXE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B83B010E312;
 Mon,  9 Sep 2024 07:57:13 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-374c4c6cb29so3638749f8f.3; 
 Mon, 09 Sep 2024 00:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868632; x=1726473432; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
 b=NuJgTpXEaRvgqxHv/+nJJHFyeGK7Xuw+q46ODImqX36HStDH6B9dxdCtLDSTSmSYk+
 vWaqSFviPEraeCIS31RQEDN0qpe2kWW0b2b35vKAUxcNafugaMmLw+L87uXAKNbcYKtN
 ifadxN7MhPpIw2KXo7a6z1/kE88PKEs7eXriuCypgPkbRaF7pTZ9c0ouqNGN7387reL7
 J0DvCGvNvyshuc2ml3HkTRGt/fikrFhyQNwbgIINYz9me6iUF6rMlxrOuEUx1JxdanU9
 5AmGhbh9alz7I0kAKgI27t8l31Ci7qbomK3uy2mzWVqDkwkpgP/COm5AmCGn0qXeLAyF
 Pq4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868632; x=1726473432;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
 b=gaAUhnoNskZ7WyeYrjRea0uHph1aZS2+rdKlA1LoTcnEXM1XIgAHMdMwp4GPUugR7U
 i5JTrKuYKEufvcyrUZbly+GoQhGuV2r3SNv7YVq0ptrRPRnjc0z2eKFozHDLX3EWWCEP
 GL9PEwaMKgyfWZUkVmfOr2//RDvxfEvcJvxsc/2RiOadRNUuN3L1F7rHdESTnUlmins9
 aKkl7IzEMbm6b0ebURaXas9u6SuGBslpy3bKIP7mfmqGGkWDLPJETwDeFc0ClsABDzq6
 28ZcsbY70XCLcrh4zvI1R8uzymnIMt1FYHWwyoEYP+CKKrpOMGIJWUcNi5DxuSfc9law
 HZ7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOUBEKmUPLVlK2aTH196TWv9mLquMs+Tu11rzBqYvVWXCd/OUTN2FixfX8yUy4jsYrmKOZFh8mqPYx@lists.freedesktop.org,
 AJvYcCXRaDffMlZTZ/xPbMX23pM7PQgw+iDQkW3D6enyRto9WOBNSQT45TjKts6PppUTVEx+Y4/eNFTCrE4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZiFUsExF/PEI+DbfoCPi12grgILCnUeRLHsScE2OiyXH69PXM
 aENsHrqF2AP1gGMyj5/lARpnoGredI0bgthiwjW2EsKFePgbuZ4u
X-Google-Smtp-Source: AGHT+IFpmssEVWDSb1D0XQ0h7YT1Yo7NzbQWSyrRT6WdFlX7jchUsWEdPQv+SibupVKFxwfhwpW2yw==
X-Received: by 2002:adf:f104:0:b0:371:8e3c:5c with SMTP id
 ffacd0b85a97d-3789229bc28mr6033390f8f.7.1725868631939; 
 Mon, 09 Sep 2024 00:57:11 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.57.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:57:10 -0700 (PDT)
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
Subject: [PATCH RESEND v2 16/19] lib/test_scanf: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:59 +0200
Message-ID: <20240909075641.258968-17-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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
Cc: Petr Mladek <pmladek@suse.com>
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
2.46.0

