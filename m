Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37706970ECD
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D17310E2E3;
	Mon,  9 Sep 2024 07:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="eieQOC4U";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF01A10E2E4;
 Mon,  9 Sep 2024 07:08:26 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-374c1e5fe79so2573564f8f.1; 
 Mon, 09 Sep 2024 00:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865705; x=1726470505; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
 b=eieQOC4ULR1FAkSN6FR+oktnUc257euvDUUZSoqxvjZWo5CQJJ/Vamf4XT6SUeC/b2
 n4PxvCZ61zc38dJMnn3Btkm3jlZeUX5mgyM6yJaFwnbwQbMRqIvycZ3G3D1HXHT/2x0S
 j7E6WZmtq5CiLRZcrBa9cZGxlZxxuIKKMRs/AZjsZ6nHuR8YS6qEikIkEuIG7IXozE/C
 cttrzIZUenKQNMIMc7oYzgJfvCYllwn0E/vGd1o486YA+vPgiLlI6tOSv0VHJ9kmPt9b
 csj4LDu1eI7WClFNdUQCmTbEpPhZW+g+SD/cnxaHHTp929cYctGo1LHfl/hw7Sh0GJ42
 FntQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865705; x=1726470505;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
 b=gO7cetYSWs7eSfCUcs8gzjhRPXDes9zIFjupITjYoHyUh6ibCzr+0PbH6RIhtI/PDu
 AzBwUHG1/q1ihW7+poe1Z83VVpbaRQZ5de0G+Fuo0EICTDPYbgr0JOkJtTg6pu8pzZh6
 n3CcuRUEL2wwz3w1DDgeNe71rG2PRjPikvQRfdca1dw+ENo/nsaY+L+cLyqvkmwV/wxQ
 vo3v1e5K0gj6UzNK+gkSS5mAFEhPMls3C2XAGVAW9dZDdXywxO+8NtHn5ga9/xVwAQLq
 KTefkAzw+zz9RK3m7wJs+DZFq7nJe38269WfAVMx9R2So/jHhKUi09yKc94ScaqH78Zy
 6Pyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVE+4qlSQImGfw517v28nGpADrKu0opFLiUJ3waB9jnT0d9SZ/dK8+YbTib6wzwWPvNDp3pg1EdpGkI@lists.freedesktop.org,
 AJvYcCWuxWhapvWLTA3AthZPQzduSf66u6XGvWNbzF9f46k5IA5X/3rGxipJykmqGUZn+DNZ2vIhr7gUKtY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yys+sf5lJtFMdUdFTqUjX7vWxYQl0bE/ul0Q3PNvqEWxQ16xjPC
 83MF7abNh15iOER3mwEPyxU5Q2USTo+aMJhEtyrI/XtwpYasthSF
X-Google-Smtp-Source: AGHT+IGIhx0PsdDJkaVvZyexO/Bqs/D/rzFr7Dv46t2ZpbAiLjLs7eY7rO6Hc7JCeQzZ4hCsEhbaWg==
X-Received: by 2002:adf:ed0b:0:b0:374:c1c5:859e with SMTP id
 ffacd0b85a97d-3788967e478mr6891163f8f.42.1725865705078; 
 Mon, 09 Sep 2024 00:08:25 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:24 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v2 06/19] mtd: tests: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:20 +0200
Message-ID: <20240909070742.75425-7-ubizjak@gmail.com>
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
Cc: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Richard Weinberger <richard@nod.at>
Cc: Vignesh Raghavendra <vigneshr@ti.com>
---
 drivers/mtd/tests/oobtest.c     | 2 +-
 drivers/mtd/tests/pagetest.c    | 2 +-
 drivers/mtd/tests/subpagetest.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/tests/oobtest.c b/drivers/mtd/tests/oobtest.c
index 13fed398937e..e1ee68f8b8f8 100644
--- a/drivers/mtd/tests/oobtest.c
+++ b/drivers/mtd/tests/oobtest.c
@@ -17,7 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "mtd_test.h"
 
diff --git a/drivers/mtd/tests/pagetest.c b/drivers/mtd/tests/pagetest.c
index 8eb40b6e6dfa..6878700d2fc0 100644
--- a/drivers/mtd/tests/pagetest.c
+++ b/drivers/mtd/tests/pagetest.c
@@ -17,7 +17,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "mtd_test.h"
 
diff --git a/drivers/mtd/tests/subpagetest.c b/drivers/mtd/tests/subpagetest.c
index 05250a080139..f34bbf033c4d 100644
--- a/drivers/mtd/tests/subpagetest.c
+++ b/drivers/mtd/tests/subpagetest.c
@@ -15,7 +15,7 @@
 #include <linux/mtd/mtd.h>
 #include <linux/slab.h>
 #include <linux/sched.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "mtd_test.h"
 
-- 
2.46.0

