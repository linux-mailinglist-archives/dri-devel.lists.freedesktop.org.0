Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8648BB336EC
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA8B10E34B;
	Mon, 25 Aug 2025 06:55:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IAR8gQwJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com
 [209.85.215.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 240D510E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:30:55 +0000 (UTC)
Received: by mail-pg1-f181.google.com with SMTP id
 41be03b00d2f7-b4c1ed55930so322753a12.1
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089054; x=1756693854; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IH8YhLChJO+46PfNNdyjwrwQJKBLxU7b8IaUufHISe4=;
 b=IAR8gQwJP0J1D/Kb+3Ihl+pclNRLQfrl8v/hZPGS6vKwqjIOTETsbOTq6zaIGB5dxb
 PciZABqMdXmNXRjeuY/Q+apu3EjfRQwXtXADr8ZVXo3FdXTfyTNDkMpeKm4y/WzQNiLL
 zwhItY5kpX+Yp5gKRgyWcxLySOm82SHVXgZzDihvKedG4tdmO9/+aq+mxXlaZD+z7SKe
 0uA26fr67yITnp5BkwxER24jeXHbP//qFUx7/3/RU3ZUPRF6oEljMA8jGNxsEakrj+/R
 PrT+vw0WPvxFXRr06reb9ow3m/V7B5tBuqcotitGL/xF7b1249dBUmDj5EoQeNnHqWFj
 CPGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089054; x=1756693854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IH8YhLChJO+46PfNNdyjwrwQJKBLxU7b8IaUufHISe4=;
 b=oz7eYU5MDGwL0igTTP7U3ZiRWhabbAcCdPRm/ay6Votf+t6a64e5yYcUKbG/cZ6y7X
 GgIKuTAI0rNjwGB5MhY1795cjOsPdXUTYh0hh1zfqJmDXf9/u2IaxLp8dBL0/4EPyp7i
 1pnyTMmk01RzhhCf8C8I6vkFTtKxjQ1Ai1sXDKEgeA2luEQNjYjiUkKqsGPGlj9Sa+R3
 OEF7qdTOZDG9kYAKxgXaeyCsgMHr45rrkUx85QGPSjyfY6yrVbjnqCc65PyTiQrCQU9J
 KtOmm+ESjZTp7u1NGUYMo8i6ozn5pUt7We2yw7rc+tbhpWbXOXAQId1gumeaaiRAOWcQ
 lfUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMbzzE93IBkO1ZdS6sWz9/Mb2L791zZUvFBdTdm1T5Vi9QxBsHrGl78l/KIL83xcDl8ZHqXiHZSDA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVHZe+u0SHZygFGtlLmMBKIG6c0eMKpV67W2kQMzQ9EzaY5l4l
 ql7y1ZJWkatdWpCUQNn3X923RkdtgcLT9jRwU9r4iagFwUm2K1NVCVPW
X-Gm-Gg: ASbGncuFSyEagKBn9LMMJ5+QQGti+E7+Iwcr8Tfj/2E4l2PBCJp36rZkr58CVB+952p
 /LCgLyQ9yXhdZkX5jbXrV5E5IFk0J42gaT5BQVA7gE02DmMWceOSAOl9p4risXlJbVzxCrTPlQq
 BVltE85nlarCsNJn3jaUfHI0mRJeqZB1YdHBJvkc+aMg+pFgOHQwQsTJ0nRyzJeTKtHGiT7mbU3
 ZEPEEovCbnO2NJBbAcWFHC/KtkUTP6gUxX19r8iT0j/hHlE9QcOL+PLuVWHfVnQWSAP9tRxZnOY
 2p8J8k9ROLQONz8ktI3Dm0ShvGAMF1UO3ty1q6NycpmjnxFpMsShe/XH3KLKKpQ24wm8c42yPCG
 t7ROhHI/Sck1U3GPIWvR6DKprfhHn/BTHVIDPFlPr4nHXnpIbZ4y8civU9fSjrUxQY6ooYDYyJ7
 0=
X-Google-Smtp-Source: AGHT+IH6pBx05EUggFYxitz83mZVXTIxwPpm1bcXy5QtfKJU32rVyZCwSo5s5hfxiY5yh80orLgZOQ==
X-Received: by 2002:a17:902:dad1:b0:240:8262:1a46 with SMTP id
 d9443c01a7336-2462ee54512mr139147305ad.25.1756089054419; 
 Sun, 24 Aug 2025 19:30:54 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.30.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:30:54 -0700 (PDT)
From: Jinchao Wang <wangjinchao600@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, Baoquan He <bhe@redhat.com>,
 Yury Norov <yury.norov@gmail.com>, Qianqiang Liu <qianqiang.liu@163.com>,
 Simona Vetter <simona@ffwll.ch>, Helge Deller <deller@gmx.de>,
 Petr Mladek <pmladek@suse.com>, Steven Rostedt <rostedt@goodmis.org>,
 John Ogness <john.ogness@linutronix.de>,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
 Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
 "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
 Shixiong Ou <oushixiong@kylinos.cn>,
 Jinchao Wang <wangjinchao600@gmail.com>, Zsolt Kajtar <soci@c64.rulez.org>,
 Ingo Molnar <mingo@kernel.org>, Nam Cao <namcao@linutronix.de>,
 Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Joel Granados <joel.granados@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Sohil Mehta <sohil.mehta@intel.com>,
 Feng Tang <feng.tang@linux.alibaba.com>,
 Sravan Kumar Gundu <sravankumarlpu@gmail.com>,
 Douglas Anderson <dianders@chromium.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Anna Schumaker <anna.schumaker@oracle.com>,
 "Darrick J. Wong" <djwong@kernel.org>,
 Max Kellermann <max.kellermann@ionos.com>,
 Yunhui Cui <cuiyunhui@bytedance.com>, Tejun Heo <tj@kernel.org>,
 Luo Gengkun <luogengkun@huaweicloud.com>, Li Huafei <lihuafei1@huawei.com>,
 Thorsten Blum <thorsten.blum@linux.dev>,
 Yicong Yang <yangyicong@hisilicon.com>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, kexec@lists.infradead.org,
 linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/9] crash_core: use panic_try_start() in crash_kexec()
Date: Mon, 25 Aug 2025 10:29:31 +0800
Message-ID: <20250825022947.1596226-4-wangjinchao600@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250825022947.1596226-1-wangjinchao600@gmail.com>
References: <20250825022947.1596226-1-wangjinchao600@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Mon, 25 Aug 2025 06:55:43 +0000
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

crash_kexec() had its own code to exclude parallel execution by setting
panic_cpu. This is already handled by panic_try_start(). Switch to
panic_try_start() to remove the duplication and keep the logic consistent.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 kernel/crash_core.c | 15 +++------------
 1 file changed, 3 insertions(+), 12 deletions(-)

diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index a4ef79591eb2..bb38bbaf3a26 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2002-2004 Eric Biederman  <ebiederm@xmission.com>
  */
 
+#include "linux/panic.h"
 #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
 
 #include <linux/buildid.h>
@@ -143,17 +144,7 @@ STACK_FRAME_NON_STANDARD(__crash_kexec);
 
 __bpf_kfunc void crash_kexec(struct pt_regs *regs)
 {
-	int old_cpu, this_cpu;
-
-	/*
-	 * Only one CPU is allowed to execute the crash_kexec() code as with
-	 * panic().  Otherwise parallel calls of panic() and crash_kexec()
-	 * may stop each other.  To exclude them, we use panic_cpu here too.
-	 */
-	old_cpu = PANIC_CPU_INVALID;
-	this_cpu = raw_smp_processor_id();
-
-	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
+	if (panic_try_start()) {
 		/* This is the 1st CPU which comes here, so go ahead. */
 		__crash_kexec(regs);
 
@@ -161,7 +152,7 @@ __bpf_kfunc void crash_kexec(struct pt_regs *regs)
 		 * Reset panic_cpu to allow another panic()/crash_kexec()
 		 * call.
 		 */
-		atomic_set(&panic_cpu, PANIC_CPU_INVALID);
+		panic_reset();
 	}
 }
 
-- 
2.43.0

