Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B38230840A
	for <lists+dri-devel@lfdr.de>; Fri, 29 Jan 2021 04:05:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0475F6EA30;
	Fri, 29 Jan 2021 03:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCC766EA30
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Jan 2021 03:05:17 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id kx7so5035595pjb.2
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Jan 2021 19:05:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FtqZbVLoNhYzW/5zxBFGSTg2OJ2tv0Ub0qNAJ13xHs=;
 b=j5yLzHZt+6y1rTjQAaHsDOTxGgaIO1Q9C9yvGJP/x3SkVLLnhJSUKnESb/H0Z9JJM3
 X3o9CasXX6DZTksNat7StXwigWk+Orm9ia/zA32HYjwgB7fSoTv26tV1S3bs6YrGsFEp
 z4HPk5S+5CgJFgVQdxw+V7SZtaTKny8EBvZ3oJTURUzJ+ccHaYle+g1y092cga4L8huN
 RJggFGQ7Nhlb7TYWCH0Ubq1AsPnmdAUnLmHsDZinfH7eAFf/GnRcL4Dm4SijBHNx+FHZ
 Bw43r3f9o5DaCRZX9xsjG0o3Lr7MVysYUjjKamy51VBjfsyrADAgEtsWNzZdhWgazp4N
 PuAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6FtqZbVLoNhYzW/5zxBFGSTg2OJ2tv0Ub0qNAJ13xHs=;
 b=S74r1b3gqeCHeuiV1sMKQt35S9Laq4Nf9nrGTt7h8c6dzEOfZtKmSZsrT8Wc3Qtoko
 flvFPkOdmaiDFn0gKm1lXo5qoZRRxA3PJ7i2MlsvVtvA3o5xDDdqluZSxI9KSM4fjOni
 fGw0bsqU1/qXlzw9dd0Aooy6euXXTGqdxUVWwHfRCxPFmJ76W7Kt/htsnf3Jc2qQ6S1w
 Na3izzueqmjHJOjUwyM5ceoSBo6QaMQgLk43bh9b26dZpTnubEIRUxzxOsoA6+rdRZo9
 Z4F33b1+xTsTkIPSxRegbXTvXrt2RkkxIADRYJs+KebWnZzYbF94ExtvzVv9x1F/5YKi
 /hUw==
X-Gm-Message-State: AOAM533osD2RVL8+0d/u38EGKMZJ5WVnjztD8mBZzI9S5MgR05leq68n
 xDCx+SPpLk7fX1irUGRM8NVg0A==
X-Google-Smtp-Source: ABdhPJxNcoBMcdOeDQYd3FdgzjZ86Cf272Rz2la9I9NvjeaL4IhlWxZTBvB3/43QEa/+/6QJlLWKNA==
X-Received: by 2002:a17:90a:d913:: with SMTP id
 c19mr2416772pjv.19.1611889517371; 
 Thu, 28 Jan 2021 19:05:17 -0800 (PST)
Received: from localhost.localdomain ([2601:1c2:680:1319:692:26ff:feda:3a81])
 by smtp.gmail.com with ESMTPSA id
 y75sm6854496pfg.119.2021.01.28.19.05.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 19:05:16 -0800 (PST)
From: John Stultz <john.stultz@linaro.org>
To: lkml <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/5] kselftests: dmabuf-heaps: Fix Makefile's inclusion of the
 kernel's usr/include dir
Date: Fri, 29 Jan 2021 03:05:10 +0000
Message-Id: <20210129030514.1231773-1-john.stultz@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
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
Cc: Sandeep Patil <sspatil@google.com>, Suren Baghdasaryan <surenb@google.com>,
 dri-devel@lists.freedesktop.org, Laura Abbott <labbott@kernel.org>,
 linux-kselftest@vger.kernel.org, Hridya Valsaraju <hridya@google.com>,
 linux-media@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 Daniel Mentz <danielmentz@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Copied in from somewhere else, the makefile was including
the kerne's usr/include dir, which caused the asm/ioctl.h file
to be used.

Unfortunately, that file has different values for _IOC_SIZEBITS
and _IOC_WRITE than include/uapi/asm-generic/ioctl.h which then
causes the _IOCW macros to give the wrong ioctl numbers,
specifically for DMA_BUF_IOCTL_SYNC.

This patch simply removes the extra include from the Makefile

Cc: Shuah Khan <shuah@kernel.org>
Cc: Brian Starkey <brian.starkey@arm.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>
Cc: Laura Abbott <labbott@kernel.org>
Cc: Hridya Valsaraju <hridya@google.com>
Cc: Suren Baghdasaryan <surenb@google.com>
Cc: Sandeep Patil <sspatil@google.com>
Cc: Daniel Mentz <danielmentz@google.com>
Cc: linux-media@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kselftest@vger.kernel.org
Fixes: a8779927fd86c ("kselftests: Add dma-heap test")
Signed-off-by: John Stultz <john.stultz@linaro.org>
---
 tools/testing/selftests/dmabuf-heaps/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/dmabuf-heaps/Makefile b/tools/testing/selftests/dmabuf-heaps/Makefile
index 607c2acd2082..604b43ece15f 100644
--- a/tools/testing/selftests/dmabuf-heaps/Makefile
+++ b/tools/testing/selftests/dmabuf-heaps/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-CFLAGS += -static -O3 -Wl,-no-as-needed -Wall -I../../../../usr/include
+CFLAGS += -static -O3 -Wl,-no-as-needed -Wall
 
 TEST_GEN_PROGS = dmabuf-heap
 
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
