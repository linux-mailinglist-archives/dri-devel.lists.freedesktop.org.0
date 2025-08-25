Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 221D5B336F2
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7076710E361;
	Mon, 25 Aug 2025 06:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fd6FUCIL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com
 [209.85.214.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6690010E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:31:30 +0000 (UTC)
Received: by mail-pl1-f181.google.com with SMTP id
 d9443c01a7336-2461864f7f8so31147275ad.2
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089090; x=1756693890; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=QVC8azoXPoxosuCvm1eCBz9SCYhPLAwxnPZ8goaQCGw=;
 b=fd6FUCIL/RhWkPOQNPBam8Cs71s8uCg9eIj6V6m0xabcLT0CAlc5vKHnlYT+t0ZPT5
 hfs84BwF0gB5yWVcqNCJNU/l27/xzZk1H235xjpQTL4T9nb1hf08jWwLeE/Myiu5Tr65
 ZxzRisSSdpG4YkUlwj4TFamhVru3JRxjbNEfXQiOAr+mDc3N/AuV3/G3zMc2395MunND
 9D8e7qtBCHRAxi3wKyIWwHEzhfHRufiQ0nGnl4rkMg4ejNUuZQIRn1OQuq5/x7lIRU6k
 uZkmdeDaWkXP1EfP/w5RE6tFl8pMqpi2ys9BJxvIB4cNcXD4oCIJ8Y3hH7Ytu+wwoWHo
 DK+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089090; x=1756693890;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=QVC8azoXPoxosuCvm1eCBz9SCYhPLAwxnPZ8goaQCGw=;
 b=odMd1n27inojjvwIh6qbdQfDSaWoVVkHUAYM6nfSYRFHf71HgtsCPaXhYKNhIFkqk9
 mJzkgqdJsD6QtvMwJrUpPkwXda4sxcEeaLzemCLWAD9pQs0hRhUZgRR0QcbhfmAzYWsQ
 1kv0sRF2mKzckKDUV0i9hIteGT5JDngjJea9ceCvVkw5g32U6PdCSG+OB4Ejxi/Y7A43
 toQLo80gCOoxyihf/QmP2Jcn0Jy/ij5StIKskj0K8/ULJZiujdpY0m0gFclJoUXaFpiv
 +dNCbTFTYDlP0e1vEdAvIXVdaC/mK0ky/jrlNaUypB/wU5YkUa641iq02EYhn7hFnvuE
 Fuvw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWcyemeB35kxZzBqDCC2jnWlPDBfr4ZFEuhBiKrIo0Zy7Ij+sBUvuFsqX9a1hwQlDbb9gEmXAMHSh4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiznUqWTqojBEgZ4EnwIZ5zfk/3dMVgSXsPIa96VIZdZT9w7Xp
 9OkcaDuPSU75SuWKBxkTkR/VkPJN0yHoinQhNdat1W5n5Ib9X1/r/jhv
X-Gm-Gg: ASbGnct7JzeU+mTGX9khTardtgDxHrsKg5+OSU28LFXxf/Bd5jv+Cah650LY6KzZX+E
 Jc52C0j90VPZCNgRW1wC5D9aXPdTG5QFSHLWdXjO2xDoi/XzrfvIwBhakwqRGqdh4QG2wrai0S8
 r/siy01Lm9iOOjBrfzQglbsoJHyadXrr2Ec8MQ5KTm9T6S5uZq/uhmJRdRo653hPSv6ZayDluzk
 /OnQzmIi3cB3x9CFhHZdnCwuZKsncQ68VA6H/6ld7D4h3aWKT5SgopyoCKQD/OgfXA2zFQPWW9/
 GcB3rE57qRmBOwVbY/6bTo5LwfoEqws4sWg8/xCrDTr94bryHt6DbuFjqSjkCLmQYj42rfVpyj/
 hNtsMZfEL7KGoDQaAS3FVgdpy9VOhvUNPW+X6Ztdx3xr3Q9EDpcjxSdySlCFw33xp3/zvv9ozqW
 4=
X-Google-Smtp-Source: AGHT+IEJ/RxmV9vk0nXMb491fT4XTeycZujwgAzjS69NOeWahllc9+DZTfyHZl2PP7ynSHAO+OZuag==
X-Received: by 2002:a17:903:1ae4:b0:240:a889:554d with SMTP id
 d9443c01a7336-2462ef8e723mr143141775ad.45.1756089090224; 
 Sun, 24 Aug 2025 19:31:30 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.31.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:31:29 -0700 (PDT)
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
Subject: [PATCH v2 6/9] printk/nbcon: use panic_on_this_cpu() helper
Date: Mon, 25 Aug 2025 10:29:34 +0800
Message-ID: <20250825022947.1596226-7-wangjinchao600@gmail.com>
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

nbcon_context_try_acquire() compared panic_cpu directly with
smp_processor_id().  This open-coded check is now provided by
panic_on_this_cpu().

Switch to panic_on_this_cpu() to simplify the code and improve readability.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 kernel/printk/nbcon.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/printk/nbcon.c b/kernel/printk/nbcon.c
index 646801813415..7490865e2f44 100644
--- a/kernel/printk/nbcon.c
+++ b/kernel/printk/nbcon.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2022 Linutronix GmbH, John Ogness
 // Copyright (C) 2022 Intel, Thomas Gleixner
 
+#include "linux/panic.h"
 #include <linux/atomic.h>
 #include <linux/bug.h>
 #include <linux/console.h>
@@ -589,7 +590,6 @@ static struct printk_buffers panic_nbcon_pbufs;
  */
 static bool nbcon_context_try_acquire(struct nbcon_context *ctxt, bool is_reacquire)
 {
-	unsigned int cpu = smp_processor_id();
 	struct console *con = ctxt->console;
 	struct nbcon_state cur;
 	int err;
@@ -614,7 +614,7 @@ static bool nbcon_context_try_acquire(struct nbcon_context *ctxt, bool is_reacqu
 	/* Acquire succeeded. */
 
 	/* Assign the appropriate buffer for this context. */
-	if (atomic_read(&panic_cpu) == cpu)
+	if (panic_on_this_cpu())
 		ctxt->pbufs = &panic_nbcon_pbufs;
 	else
 		ctxt->pbufs = con->pbufs;
-- 
2.43.0

