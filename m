Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB8597106E
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3397310E30B;
	Mon,  9 Sep 2024 07:57:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="CP3jYvdr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8EF610E30A;
 Mon,  9 Sep 2024 07:56:57 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-374c962e5adso2182917f8f.1; 
 Mon, 09 Sep 2024 00:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868616; x=1726473416; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
 b=CP3jYvdrug1Pq+KmL0z1rMHbd3BFmfl3sPXV5O2Mn40kzi7qCLMU2wab24nxuXCj6x
 VK023EcZuEcYHDSOio7CiawiaBzVidxz4EpzhHeHSzrGG7FwISkQ2vu6J5NW6JTQGn8s
 XJLiiW2A3Ms5cW0vRqmjaAD/aBDaZHC06/GTWgD6q33dyEY0a56ktyk2jPY1gTkagjyD
 RTfsqZvUmLinJiajIUDSrrh4jk618rfVgJDNSdqwo63QUR6+bxrjwoQ9o8sPQULRf7cy
 s3h8YOLal3pdSMIIxZC4nEdAY/qtFZsP3jYFu/X/aAl2HYaPS7ExLT9qQIYRq6u1Bs9x
 8P0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868616; x=1726473416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tT07a8fYg2mX8zdZb0NUXYrNfwc3Lxt6djOa1kz4aGg=;
 b=l8KSlWZok4ssqUoZ5M7NMvaa1QTmpu+mH6lR0BKXD6dnFEi+A+1W4k4fcSKtwjYqxr
 ExknaGN7Ywt+GgTvI0jNPQ9F0xPiJuihy2owjr9jgo7ESFLShpEJbnXWDJpte003Z2C+
 y+0Y/1kO+vQ/SPykKisGdbQY7GVsykaTRKiJd6Ik1A78bbgj2qnweDlUuOQiWUW+o4K+
 UsrWkOqdBGQA07TiyCTbJFBjd5VBgtcR6GbyHoJhZ5S4d4Uae1m+zL1n5YlymVDJj47J
 SuX+3Fk9TyFIoOWgiF5ArEpPAzuQZvMmSO+sJ5pI/OLPQ+m5w1is6QNwK/19OixHRQaf
 iDKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo5vFMuEd/JssKuZUffp8fFIcMQ8hXYArSarZt92e5vcZs61GeU4oFC4TDW3mKDtclyjVNVGukkVY=@lists.freedesktop.org,
 AJvYcCXBRzWDzZWM/bEBlLIWoiz0yKtMrxHJMdH0DrbCm45GNrTpJ9u9Zwb+M3dV0nr1Wl8d7inr3Am6PYsi@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjLN/3Iw0ZQmtpXIVX3MVFPLT/H3O8MgSxI+Tzlx7G8fp71qcq
 PRKubtyblcWtD+sNI8f+ODgK1eHELsEsLkQZGeY6UVJyRmn3CPgd
X-Google-Smtp-Source: AGHT+IGmZsYZCmG7YYhzHupjmmuJRGqS/FOf75V/9MKd4VXHMgO9wuyXejXAu7fFGUQHBhuwF3txfA==
X-Received: by 2002:a05:6000:a8c:b0:374:d006:ffae with SMTP id
 ffacd0b85a97d-378885c04ebmr6261181f8f.6.1725868615928; 
 Mon, 09 Sep 2024 00:56:55 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:55 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Miquel Raynal <miquel.raynal@bootlin.com>,
 Richard Weinberger <richard@nod.at>, Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH RESEND v2 06/19] mtd: tests: Include <linux/prandom.h> instead
 of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:49 +0200
Message-ID: <20240909075641.258968-7-ubizjak@gmail.com>
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

