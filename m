Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31ED098A2B5
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:37:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A025D10E437;
	Mon, 30 Sep 2024 12:37:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="J5gpSkVZ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com
 [209.85.128.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 047A610E40F;
 Mon, 30 Sep 2024 12:37:19 +0000 (UTC)
Received: by mail-wm1-f51.google.com with SMTP id
 5b1f17b1804b1-42cc8782869so39888675e9.2; 
 Mon, 30 Sep 2024 05:37:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727699837; x=1728304637; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TTtABT1rYfIzK3Apk8cuoRmJAsuypkLox4BN8k8T5lM=;
 b=J5gpSkVZ/ZdrtFNZKD2og5tL9brqiG0hmeBerztF8xYem2E8hO2hwcYz/hEhIxLEuy
 yTj8QAMm6erBOVLvbCbr5ToTEYssaVzqqAwli5RiEOehgpXImdPKXx9NiftCivK/KkB3
 hvOCuuOcc+Iadqt0DeYyHk+XOMqtgOCxql2+ZRawE99no/HD5Xt8u1K6YuYMTr7otjZq
 gKxf1C4G9aK1gBpivdZ8PrDSxXuvx2zsLmjqjzavHwkuHwHI20MUpgPmTURL4WC0eNV2
 w9qivUlY/w5FVU2V9SdnHkhZibqPyd+DvvoCvkqbTCdHrcbhhmdVHhpQtIqwnB43JHv8
 ZcdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727699837; x=1728304637;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TTtABT1rYfIzK3Apk8cuoRmJAsuypkLox4BN8k8T5lM=;
 b=ZedRt57VCwStnqEQrYA6GgJDiK2UhKFX+u37Hf5Vee2o9RR6Fv8RZyz/tG1u7ZSKUD
 PEE48FyzMeagMt0n/ZfMWVJpmUIJT5wxLr2FSQe95D064UjN1OpAQPP8Mdy2uctztqJM
 14IS+ShBsZ5BuvYsM7kGDP6Ox0hp+hkgIXaADoqfiCADsKfn9kln9rikjxBybDa1vX5F
 NfDCcjFpQh1t6To9HYUA7CM2t5WoV/MDVLSV6PJ441RU/hYVRl0fzDEbM6zKl6CxJCJH
 uk4jdYTRJSijSNPE9G4GG2ee0vLHUh3XCCnJyAkzso2qEyeAYBnp9LcVLtUfh8qWvnIm
 uZBA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUafJirsMEKdtGChrCVZXFTUoIXBWiBXVvvQiY6WgLaK1cOL1N+yfR5lkbQKtIgqPvUb2quVveoBhef@lists.freedesktop.org,
 AJvYcCXeRw1x2Zo7Kozr/kU++4veBxmrVETA3bG5GBlA17aAecOMtZ5lq2eDFkqBMsKAQNolj+Z8jPMI6ds=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwU7nMoUTIgOl/d6qLAF7mPVfjXlPoVKxCc5nqyODJ/1vrJIlDf
 ergSYKcXPJ05ScIhVK+N18Wx3UiUDFgcJNFezSV6LGjPkXaLBdNS2e3Df9RWf88=
X-Google-Smtp-Source: AGHT+IHBiyuHQnT3ULO5RBx3Lp6OpesRYqemaXFPJxpMx4yYeqmrbcmToiuf+tr1+RXNDEzbJ1b58w==
X-Received: by 2002:a05:600c:4f86:b0:42c:bae0:f066 with SMTP id
 5b1f17b1804b1-42f58434768mr79576095e9.13.1727699837034; 
 Mon, 30 Sep 2024 05:37:17 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42e96a52308sm149011355e9.43.2024.09.30.05.37.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Sep 2024 05:37:16 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 06/19] mtd: tests: Include <linux/prandom.h> instead of
 <linux/random.h>
Date: Mon, 30 Sep 2024 14:33:17 +0200
Message-ID: <20240930123702.803617-7-ubizjak@gmail.com>
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
Acked-by: Miquel Raynal <miquel.raynal@bootlin.com>
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
2.46.2

