Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D3D970ECA
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:08:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB1710E2E1;
	Mon,  9 Sep 2024 07:08:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fBdyDMsE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A937210E2E0;
 Mon,  9 Sep 2024 07:08:21 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id
 ffacd0b85a97d-374c84dcc64so2947311f8f.1; 
 Mon, 09 Sep 2024 00:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725865700; x=1726470500; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
 b=fBdyDMsEImY11zQgfDNfPVb6vHy5hJir6/QDI0OSa0wAfIZG5DfnafqhV1Z0T58b1a
 pEJzM6FXNjPRtdSph8/baxeSfZYZCdpRLcAw5pICwGDCvgLwSmXNm0FqpN8dRL874kUS
 UNzpjMOLBD1EZB0c/v59R0zwa/tONZMq194EKqH6WYQ0OLGllwmxnFrL16/tfHBP92jS
 1TWMNCErAEW6aEd4t+w5oUKAk6OGKoORBquJdoGWAK9uCTebx3UQxRZ73TpV1RBG6uCr
 O1SUgVJz0Zr4roDa5Dulo97kC9fX0Pj04ZqZ5hLRXxvmyl1XN2GEDZneTbbbXc5aPINh
 Stlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725865700; x=1726470500;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
 b=wT6OFIKOClevktaHqCEjNUr6TtyvuftR0d1p682OjeFttLykEjfjvWSU6wf4l9Hj4v
 /1tkCr1lFwqNkkkiVeag85W1ot3/F+YKmH/po/jTnXB9nGM/vWUeRnzIUxy9Wnk0rOUL
 WMijV6mFfqQd4DkqopyETGbXn6PbHyHzShEWhJVcyC8GowseO4mRP+Xmn3I9CxQqBYgr
 4mX6Gz9MFAoPM1h/2tSUE9CnWRPO8I3ZF3d9MdwWW1PKFyhakOJar8rOtZYucS6Bp3Ft
 lrvWL5uMTIHuUDqtOdsmlmehftQg2k2uO4QzCTQUFJKPgfGH1fyvzNgd4vzHhHd6tGCM
 1+SQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfO4gLoYYqR2/Tj+taDpOnQ9tCVGt7oXc8zIm1SE0uEca1G2lk+1Xo8vW+ztjqjKt1RcGkuYBG+S4=@lists.freedesktop.org,
 AJvYcCVtNrzpLtMit1hAjwL+cnG37Z9j2ZI0dRdGtpNnchPogzlHRv9gCzwUo6f8bqH+0UgPGyhrsGnJjjvR@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzzKvX+F2Mw5cxuR4EBONu1VHUAjULGIzNRsqM8Gv5KRtFRPbr
 dDA4vyLU2Cv7yrlwYiObVLkoBjyjytRoXnEmHhd9XxlQ70rG4trE
X-Google-Smtp-Source: AGHT+IHMxHViAQuYhY7LbiGTRSQjuSO1CzAuIEbDmKQ7N1Z92ayMooKBy6B84PbIuJbIoGvJODw6LA==
X-Received: by 2002:adf:f4c2:0:b0:374:cb5c:2956 with SMTP id
 ffacd0b85a97d-3789243fd67mr6064910f8f.40.1725865699969; 
 Mon, 09 Sep 2024 00:08:19 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-378956d375asm5178754f8f.66.2024.09.09.00.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:08:19 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com
Cc: Uros Bizjak <ubizjak@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v2 03/19] drm/i915/selftests: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:05:17 +0200
Message-ID: <20240909070742.75425-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909070742.75425-1-ubizjak@gmail.com>
References: <20240909070742.75425-1-ubizjak@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Acked-by: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/i915/selftests/i915_gem.c    | 2 +-
 drivers/gpu/drm/i915/selftests/i915_random.h | 2 +-
 drivers/gpu/drm/i915/selftests/scatterlist.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/i915/selftests/i915_gem.c b/drivers/gpu/drm/i915/selftests/i915_gem.c
index 61da4ed9d521..0727492576be 100644
--- a/drivers/gpu/drm/i915/selftests/i915_gem.c
+++ b/drivers/gpu/drm/i915/selftests/i915_gem.c
@@ -4,7 +4,7 @@
  * Copyright © 2018 Intel Corporation
  */
 
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "gem/i915_gem_internal.h"
 #include "gem/i915_gem_pm.h"
diff --git a/drivers/gpu/drm/i915/selftests/i915_random.h b/drivers/gpu/drm/i915/selftests/i915_random.h
index 05364eca20f7..70330a2e80f2 100644
--- a/drivers/gpu/drm/i915/selftests/i915_random.h
+++ b/drivers/gpu/drm/i915/selftests/i915_random.h
@@ -26,7 +26,7 @@
 #define __I915_SELFTESTS_RANDOM_H__
 
 #include <linux/math64.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "../i915_selftest.h"
 
diff --git a/drivers/gpu/drm/i915/selftests/scatterlist.c b/drivers/gpu/drm/i915/selftests/scatterlist.c
index 805c4bfb85fe..7e59591bbed6 100644
--- a/drivers/gpu/drm/i915/selftests/scatterlist.c
+++ b/drivers/gpu/drm/i915/selftests/scatterlist.c
@@ -22,7 +22,7 @@
  */
 
 #include <linux/prime_numbers.h>
-#include <linux/random.h>
+#include <linux/prandom.h>
 
 #include "i915_selftest.h"
 #include "i915_utils.h"
-- 
2.46.0

