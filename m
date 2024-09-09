Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1700970EE4
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C1C010E2F1;
	Mon,  9 Sep 2024 07:08:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="PJlQUuNR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DEDC10E2F0;
 Mon,  9 Sep 2024 07:08:43 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-371ba7e46easo2611742f8f.0; 
 Mon, 09 Sep 2024 00:08:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865722; x=1726470522; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
 b=PJlQUuNRkrNF+xunjVii8Eli1n8eZhiWPPyrbYKSpJUASPBqA2mXRb5jyLjXNWls5C
 x/kbh5wpJBbn0Gp1lcM8XxuDIzKpTE5pyoJ+KnatOK7ylIEcAHmNpmUl/p1uQWl2UTgp
 KtaoiE7Sh4nyiupIM3UyfIzhTYdJDjWJ8UeqsGdePZcDDEWYH2C8vT2uw9zu3CdRoxpQ
 hVtDCNz5s6wtlcxRDMsw9heYH0WS8CFFcYubJrWziYl7+Paq5mF9CPtmPGH7MNUIil3c
 KzeimyNe4LNime+Kc6WvPV1nW3OPfm6xmNdebhLra3A5tw5eqKrkvbZkeJQxBiPo/Mzy
 hkWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865722; x=1726470522;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=T3RXsBbJQS/hq9A6ZJhcwQoifydWEQ6ZfpZw1c9736o=;
 b=nG54pEjMghL0Hi/bqVPVCAuydzj9PTqsb6kK3XTjTHAgbnv7EDh4LUdrpJcB+y4HLP
 UuOwDmevx8BgDbne1+irp1T5WVbvhZCT4+Bi3ZN8cFa4uwBmu/AZNqL+nuoK9tWJVs8y
 TORrmtawM7U9lktJzaJdL9zlTq3h/exCAJrUi8VgNzlLA0MniftFZk0BIRrV0EEbPUEC
 wHb9GeuB2mQtbaVJa0mN7elOtlLgCYA2VgH/BubVPRpIx8aBbcm9iJn+9EXIoLtNZOme
 HSsWiYgDnEkzOOOpDSlGW/wNv7eoLHMv3I+rtS4Ahg1TUMIDssh99F8U2gRM75PT1Q0C
 +MQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1bk9u5NRq8HG84nbypFAq4Nw48Azc03FTYe97hXoELF22zHDTtBrcAkojK5UGdSFHESK7ZSLFrRiI@lists.freedesktop.org,
 AJvYcCXxi/uy1+ywTOZkJrHs4vw3ePHsF06HLN5S827KTL3EkfX+KjBwHva9gnIuo6cUrc/G+9BgHdTO8+k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzfy/Ux4j7bDD7ReR0BaVxRZkA33JeoWaycyy0cVoeLfeQzL2tE
 bP2hOH9wDN4AIQwY39g4w243t0eJ0sYQjz5VL+57sSWEzX41dOkU
X-Google-Smtp-Source: AGHT+IF71nvV/JLA7tnaX8d4uBILZgafYRcREg9unRBuq1O83qltW6sgUb4J13+Gilii8joehF0k7g==
X-Received: by 2002:a05:6000:b92:b0:371:8dcc:7f9e with SMTP id
 ffacd0b85a97d-378895c6306mr6637459f8f.2.1725865721615; 
 Mon, 09 Sep 2024 00:08:41 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:40 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Petr Mladek <pmladek@suse.com>,
 Steven Rostedt <rostedt@goodmis.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Rasmus Villemoes <linux@rasmusvillemoes.dk>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v2 16/19] lib/test_scanf: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:30 +0200
Message-ID: <20240909070742.75425-17-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
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

