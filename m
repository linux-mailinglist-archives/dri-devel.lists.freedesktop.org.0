Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C95DECA8AFE
	for <lists+dri-devel@lfdr.de>; Fri, 05 Dec 2025 18:52:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 953E310EB76;
	Fri,  5 Dec 2025 17:52:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="lH1Xjlki";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com
 [209.85.128.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C60D510EB77
 for <dri-devel@lists.freedesktop.org>; Fri,  5 Dec 2025 17:52:40 +0000 (UTC)
Received: by mail-yw1-f176.google.com with SMTP id
 00721157ae682-787da30c50fso25215187b3.3
 for <dri-devel@lists.freedesktop.org>; Fri, 05 Dec 2025 09:52:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1764957160; x=1765561960; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AIMsjwiJg4RqJtb77Sd/3hjNTplhvG97vleKrEOTwfY=;
 b=lH1Xjlkia8FOX8w33VKEiBRQKhqeTSb+mzSp+XqjCU710XwL2OgQqzH77uZFk/MzSm
 mfYr+TSSbub7I9WF/+2KUXS5wYGo93TLm2IuRoNab/pEmg6Kjsj7s13zaGCXSX6jh9Q6
 gdNtXHDqOQD0EzDhUIG7XLPyDYHpZNGWAT8rcDAnASfQLRBUAugk7QXI9kwsaKXJLv5R
 xHdqF1I0sM4Gl9lWAFH/wykVPgerznYiL4Fl+BdHV+olUGXDkiH4blDe/8basKIPK0C7
 qMjPLe2UXTro895Ih9eHJDNBiHa2xXDU2ZpsDiEIjdDDHtvpHBB/fso6LAmxFy9GEMND
 ECXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764957160; x=1765561960;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AIMsjwiJg4RqJtb77Sd/3hjNTplhvG97vleKrEOTwfY=;
 b=VQJBeda5kx2QDnjbF75DMGLKsyGwtq4uxRE442l4BZXrzr23MiwcO9h/KpMyP9hkPC
 SjlyLPZ65tJG7I0Fp1+Xjq1BYjU2Fp5KkL6FZ8nLxPjz9li/JjVIA8KHI2Sxfdy5zm5z
 V6ts3WdYmrPwn0rAZyavLB3ZPEAhkOF0OX4NkxFLd1tJvPpgq0jGezlKu+fY9QcexluW
 oMhyFTvncRIPlGHZXRClGd4tFfzNg5uQtKk1MYePjnXRgGE2+x+kyoihZvfEv5gWfO6r
 b0dKqxjHZiL4Qn6MYZtiDmzPG/ajTbu+W8wNmo1mQjgtduVaTVCbyx4wvMouL+Ruiats
 jl8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUA0yyDk1/Xo7HqfUPM5U5FmnvGRDuCbc5gONOB/ZDY1g6M+HmSByRH6DSTLHpvUl6Tbwfy+h2gWIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YypTU9vGNVjGT5YDYXxUrajlCGRqOQIe4ZFB2fwMdPHuG8c7/CK
 UkfNwSd4fxKlxBU9JCuA49OJLLQp/f+3Ascj+2IRfQ0xKrfBf8f2ObRI
X-Gm-Gg: ASbGncvQyDoLVkj8FJ9YSBf3Pf3h7xIpvfYgQ9iKmrxGghzJu78FHin7XMgxnihOQ2H
 CvgIX8rjyUczjJJWavOBLF7tKEWxVKfzeNE8v681tmvE0oQt9FJx/cD50lvXNYaz4EOcO13at+m
 ywv4dBxYE6A/fUBEjSto6pDXza/3alZ0kbYxve8SArJ650SsSTRqIxb+phZuesvAeeZPaFunC9d
 iDUWUhVoj6PMcgGdlG4SDC0+u9ueK0UceNnHulj31ZMrWaGUbpCXH2nJdvILcE7u3ur3F7gRMAw
 LuvqHsccd9YKR8Pf/LXFSuTavAx1F9/BcgPRxu5e5ViAMVPwU0zTwIuU1kNYf305HKt1b326Bsn
 vBW2yjhEG+F2UdGxMMrwMe/IGAHJt0bJT2khfYXKLfujU6vIIC0lzNS4MG4vYswiSh8InuNG6O9
 jv/yK0Wg==
X-Google-Smtp-Source: AGHT+IEj0tKsgnYq0A9mSlKiTaWZ9dj9I4yKU0s/KO7Y2wAesrkqKoyujesKH3ZFEOTbGXg0vUaC6A==
X-Received: by 2002:a05:690c:6f83:b0:788:e74:b267 with SMTP id
 00721157ae682-78c1893c4e9mr110130367b3.65.1764957159703; 
 Fri, 05 Dec 2025 09:52:39 -0800 (PST)
Received: from localhost ([2601:346:0:79bd:be2a:7e4d:3bf:3fbc])
 by smtp.gmail.com with ESMTPSA id
 956f58d0204a3-6443f5a3e81sm2042888d50.16.2025.12.05.09.52.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 Dec 2025 09:52:39 -0800 (PST)
From: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Christophe Leroy <chleroy@kernel.org>,
 Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 David Laight <david.laight@runbox.com>, Petr Pavlu <petr.pavlu@suse.com>,
 Andi Shyti <andi.shyti@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Daniel Gomez <da.gomez@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-modules@vger.kernel.org, linux-trace-kernel@vger.kernel.org
Cc: "Yury Norov (NVIDIA)" <yury.norov@gmail.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v3 1/4] kernel.h: drop STACK_MAGIC macro
Date: Fri,  5 Dec 2025 12:52:32 -0500
Message-ID: <20251205175237.242022-2-yury.norov@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251205175237.242022-1-yury.norov@gmail.com>
References: <20251205175237.242022-1-yury.norov@gmail.com>
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

The macro was introduced in 1994, v1.0.4, for stacks protection. Since
that, people found better ways to protect stacks, and now the macro is
only used by i915 selftests. Move it to a local header and drop from
the kernel.h.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Randy Dunlap <rdunlap@infradead.org>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
Signed-off-by: Yury Norov (NVIDIA) <yury.norov@gmail.com>
---
 drivers/gpu/drm/i915/gt/selftest_ring_submission.c | 1 +
 drivers/gpu/drm/i915/i915_selftest.h               | 2 ++
 include/linux/kernel.h                             | 2 --
 3 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
index 87ceb0f374b6..600333ae6c8c 100644
--- a/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
+++ b/drivers/gpu/drm/i915/gt/selftest_ring_submission.c
@@ -3,6 +3,7 @@
  * Copyright © 2020 Intel Corporation
  */
 
+#include "i915_selftest.h"
 #include "intel_engine_pm.h"
 #include "selftests/igt_flush_test.h"
 
diff --git a/drivers/gpu/drm/i915/i915_selftest.h b/drivers/gpu/drm/i915/i915_selftest.h
index bdf3e22c0a34..72922028f4ba 100644
--- a/drivers/gpu/drm/i915/i915_selftest.h
+++ b/drivers/gpu/drm/i915/i915_selftest.h
@@ -26,6 +26,8 @@
 
 #include <linux/types.h>
 
+#define STACK_MAGIC	0xdeadbeef
+
 struct pci_dev;
 struct drm_i915_private;
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 5b46924fdff5..61d63c57bc2d 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -40,8 +40,6 @@
 
 #include <uapi/linux/kernel.h>
 
-#define STACK_MAGIC	0xdeadbeef
-
 struct completion;
 struct user;
 
-- 
2.43.0

