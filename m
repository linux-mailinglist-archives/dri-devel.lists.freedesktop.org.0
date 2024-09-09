Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE1ED97106B
	for <lists+dri-devel@lfdr.de>; Mon,  9 Sep 2024 09:57:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E5D710E309;
	Mon,  9 Sep 2024 07:56:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="A/rABbRW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com
 [209.85.128.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21F4310E305;
 Mon,  9 Sep 2024 07:56:54 +0000 (UTC)
Received: by mail-wm1-f46.google.com with SMTP id
 5b1f17b1804b1-42bb8cf8a5bso36228475e9.2; 
 Mon, 09 Sep 2024 00:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725868612; x=1726473412; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
 b=A/rABbRWeR1JHids0ukI6xQ9JKDdpJDdwSw4zCCyTDeQoHi6AOpKya3xeiJTA2ygbu
 JwRyg3oQg+YYWQMUi65zt7tY54IHy1u8wsfjEVmzIuJdGQsyt3JjHLUyZrkh3wirlgOR
 A4FMmkgmzHQtzT9ZBOki1+BOllvJakjm5liZpcTYuQYVDPOs49n/xBNROJUYYRwzDEyx
 VN9zk9H6ZxFXJ6hsvw4FjgSCOxKyCfxU4Zijm7PMZuqQwMia4OqVpBqgec8Ck0Ml2oJh
 +s9wQE2rX3iq7XOaX38eNL+aXEI+Rfa7ki/jm2OPQSrZixD1sxG2ORW1ZWReqRqxUz6y
 H7eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725868612; x=1726473412;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=14qfBrUBkIolMsRSnhXU/v/JiTjLcMYNIcdp3nVnQBY=;
 b=hKDKBbhZ9KEIezgNxEVrwAnHu5K3IiAIjcWRbPIcOanWWhwPt2yKozys8qYKYn5EUe
 MMSPUFfQuR9al9Pq5ERrcmJakNY0X6jiqY/8pszxizfzddWN6ZEmToUdoCfn5HWMGxTL
 GYq6GejajXALJyqO4CnFJW5DNBVXb411i/xyTGAT2MYKQhTYQ624Zw2PU5iRCJELZxat
 rcaeQc1pnYo4P4h5WPbTmHCP9MKiJZHw41OQFMVtiQ0xnVprXXypRPxtcg/deTwaamMW
 lfNfpMtRhUDrPWWoM8CsPoudlIgr8YrHdJE9AqhaxWD2PJdMyOiCMcgTXgkjy4uof8wc
 jrlA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVV58nQ9FEllQbqSt7EH84MFHoWRi92ACKh8WOfYChrbrMDqScd/VqQiCmrET1k/0ctPhor1XiPeUiM@lists.freedesktop.org,
 AJvYcCXegBIaOhKoP1EUr9OUFc25daB80IwMF6f4Ihyu+93j3tUD8MlKx9ZWUESBTZFoPvMSMujXyoYm4bE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx/zEdhIQ2SQyBOlivPMh5GOUDyJNBW6wRexXrd455J5CjdPIB8
 CCMz30wv5wXdWMybRVde+5iR80lUFwJ10/bIxVisgqVsGCETiPCQ
X-Google-Smtp-Source: AGHT+IESGKS/b/3I+SBf3rTXq+UoAQ/sBaFO4c/YOVV0ofXN+ihvCL604F2/r2duzQEowocOYCixTA==
X-Received: by 2002:a05:600c:17d4:b0:42c:b16e:7a22 with SMTP id
 5b1f17b1804b1-42cb16e7addmr29272525e9.12.1725868612166; 
 Mon, 09 Sep 2024 00:56:52 -0700 (PDT)
Received: from fedora.iskraemeco.si ([193.77.86.250])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895675b7esm5303001f8f.50.2024.09.09.00.56.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Sep 2024 00:56:51 -0700 (PDT)
From: Uros Bizjak <ubizjak@gmail.com>
To: x86@kernel.org, linux-crypto@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-fscrypt@vger.kernel.org, linux-scsi@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH RESEND v2 03/19] drm/i915/selftests: Include <linux/prandom.h>
 instead of <linux/random.h>
Date: Mon,  9 Sep 2024 09:53:46 +0200
Message-ID: <20240909075641.258968-4-ubizjak@gmail.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240909075641.258968-1-ubizjak@gmail.com>
References: <20240909075641.258968-1-ubizjak@gmail.com>
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

