Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7617AB336F3
	for <lists+dri-devel@lfdr.de>; Mon, 25 Aug 2025 08:56:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A465410E3C1;
	Mon, 25 Aug 2025 06:56:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OlNGK91C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com
 [209.85.215.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA8010E236
 for <dri-devel@lists.freedesktop.org>; Mon, 25 Aug 2025 02:31:18 +0000 (UTC)
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-b4c1aefa8deso257555a12.0
 for <dri-devel@lists.freedesktop.org>; Sun, 24 Aug 2025 19:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1756089078; x=1756693878; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=F7yKzJNb2rx6SiyelcSe/xXvw8ffKUxo6CoK3itAFgM=;
 b=OlNGK91C2HOlu/7ky6O4MDRh4V36PKYXrpXaaImIpqJLytWLyHNbd65lvDWZeehWPm
 oHZrNC/6f59W1ZVat3b2rSl3cz9AMgbx3l0yESRlTWeqzzJl5XPaRUZF32SUWLshrMGc
 4v9rYAeXBqpsGXoxGq2qcWCc0tuVkCs1JKAC7WquMs1NGHGskvtvxEp4sMoXLmbg+19F
 l78Q2FMJ1sOrfowHI7CEYpFqW4H6dpcBi2zUAyOx4/XV6tyr93tcUgnyd+brJ1tIAe6w
 eB7cbRV53xEwK4976lYkyInW5mc217iAO62mUnX+/0Cukd6u7hD4RXnaqrKmzYIaBuD5
 +a0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756089078; x=1756693878;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=F7yKzJNb2rx6SiyelcSe/xXvw8ffKUxo6CoK3itAFgM=;
 b=Y+ll5lCZ8X53cay6NJ8UrsttI5N8zG5wMi3m1WI6LQhIFeMQt3tosXcslpOpfrukyM
 bRXkEM4yF7CsFAjKuuosGWjpKJraYD1yDGo+GkyTuPasMA+GOy7c5EcAT0zwHvd6Qu1u
 BURsFaQmpIORuo0QiSR6r30j8DPgxwEpYlOvga4ogDXP2weXb1gYukl5eXIPnFu7Bz3I
 22j+PnypUV/lb1yIG6yRkLu3pT/zOjj3spLBV72R+nylzshdrzhv1LC/S8oPMt6caiak
 s8TeVjhzZe9nrKFpmi+73LuGeLuWUcMqbdgu62f1oahmhHZOoqPTE9KGJp/MmD6Z+YxJ
 0jjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwdbRS3ceBQCTWHrbDfm3id4XTZlgL0DMVt5vKeSUjvYIIEQRJIieFmugTM5gWosrB/NWPDCNtImk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyjAcPs4Sx1VUrRo8hGuQjhbzUF18kxHv3qIQrqSeFA3hEbzhkV
 aRxRocxb7wBOt29Lt5ThvgJah5tGCgsOMJhqdP9uTcK7hFXlwxadfTkd
X-Gm-Gg: ASbGncu2gH/u7caG9urFKw4BJ/Uf0ya0HVaPE94W1PGEcYJahEZY6p09fdcmu7o3F45
 DHkmPHzJw0K/UmeDtVGhnUVenboV0tynnuOXpbYbuDzw942Ru33vi2CTvoa2bGbJtExW01JUwue
 K+lLj61AA4pLQFg4zZa2tw/Yh5rHKM30aDX7Krzp0upqVbjqtoU2E+H3Y9ICIuFwL7cwIlsLT3l
 nHQLXF9dkwqopm3tikGG9UvRaYAer49iC+26dg8AxdxMgMaSn9nLT7UL9pErF4p6GUNNZxOVzUI
 2PjiL4CzJ+LfWJVqZLMRHS8y7Y5uINjkM5tj+ll+83VLG4oFC4VOQ8OSe5jl8DBdZmuPo+xB+Cz
 dMf+UfwU6NV+dWz6qv2UJ/Dc6KmAfFBVb03fGBGjCjK2jKn8HniD84A/bGFDPrUvQPgqzQVVu4B
 0A15a5NnphRA==
X-Google-Smtp-Source: AGHT+IGGk8nOO00I8QY6Ycp9jgs1ZyfKkaugn7N1DZdz8CRfy99hpUtZQbqKZx4/jp/Z5JOoCix/CQ==
X-Received: by 2002:a17:903:40ca:b0:246:ece3:de0b with SMTP id
 d9443c01a7336-246ed0267f5mr4431665ad.16.1756089078131; 
 Sun, 24 Aug 2025 19:31:18 -0700 (PDT)
Received: from localhost.localdomain ([114.242.33.243])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-246687af234sm53905175ad.48.2025.08.24.19.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 24 Aug 2025 19:31:17 -0700 (PDT)
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
Subject: [PATCH v2 5/9] panic: use panic_try_start() in vpanic()
Date: Mon, 25 Aug 2025 10:29:33 +0800
Message-ID: <20250825022947.1596226-6-wangjinchao600@gmail.com>
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

vpanic() had open-coded logic to claim panic_cpu with atomic_try_cmpxchg.
This is already handled by panic_try_start().

Switch to panic_try_start() and use panic_on_other_cpu() for the fallback
path.

This removes duplicate code and makes panic handling consistent across
functions.

Signed-off-by: Jinchao Wang <wangjinchao600@gmail.com>
---
 kernel/panic.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index cd86d37d124c..5266e195f5ac 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -415,7 +415,6 @@ void vpanic(const char *fmt, va_list args)
 	static char buf[1024];
 	long i, i_next = 0, len;
 	int state = 0;
-	int old_cpu, this_cpu;
 	bool _crash_kexec_post_notifiers = crash_kexec_post_notifiers;
 
 	if (panic_on_warn) {
@@ -452,13 +451,10 @@ void vpanic(const char *fmt, va_list args)
 	 * `old_cpu == this_cpu' means we came from nmi_panic() which sets
 	 * panic_cpu to this CPU.  In this case, this is also the 1st CPU.
 	 */
-	old_cpu = PANIC_CPU_INVALID;
-	this_cpu = raw_smp_processor_id();
-
 	/* atomic_try_cmpxchg updates old_cpu on failure */
-	if (atomic_try_cmpxchg(&panic_cpu, &old_cpu, this_cpu)) {
+	if (panic_try_start()) {
 		/* go ahead */
-	} else if (old_cpu != this_cpu)
+	} else if (panic_on_other_cpu())
 		panic_smp_self_stop();
 
 	console_verbose();
-- 
2.43.0

